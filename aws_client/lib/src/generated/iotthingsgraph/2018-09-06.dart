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

part '2018-09-06.g.dart';

/// AWS IoT Things Graph provides an integrated set of tools that enable
/// developers to connect devices and services that use different standards,
/// such as units of measure and communication protocols. AWS IoT Things Graph
/// makes it possible to build IoT applications with little to no code by
/// connecting devices and services and defining how they interact at an
/// abstract level.
class IoTThingsGraph {
  final _s.JsonProtocol _protocol;
  IoTThingsGraph({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotthingsgraph',
            signingName: 'iotthingsgraph',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  Future<void> associateEntityToThing({
    @_s.required String entityId,
    @_s.required String thingName,
    int namespaceVersion,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'entityId',
      entityId,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.AssociateEntityToThing'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateEntityToThingResponse.fromJson(jsonResponse.body);
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
  Future<CreateFlowTemplateResponse> createFlowTemplate({
    @_s.required DefinitionDocument definition,
    int compatibleNamespaceVersion,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
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
  Future<CreateSystemInstanceResponse> createSystemInstance({
    @_s.required DefinitionDocument definition,
    @_s.required DeploymentTarget target,
    String flowActionsRoleArn,
    String greengrassGroupName,
    MetricsConfiguration metricsConfiguration,
    String s3BucketName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'flowActionsRoleArn',
      flowActionsRoleArn,
      20,
      2048,
    );
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
        'target': target?.toValue() ?? '',
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
  Future<CreateSystemTemplateResponse> createSystemTemplate({
    @_s.required DefinitionDocument definition,
    int compatibleNamespaceVersion,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
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
  Future<void> deleteFlowTemplate({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteFlowTemplate'
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

    return DeleteFlowTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified namespace. This action deletes all of the entities
  /// in the namespace. Delete the systems and flows that use entities in the
  /// namespace before performing this action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
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
  Future<void> deleteSystemInstance({
    String id,
  }) async {
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteSystemInstance'
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

    return DeleteSystemInstanceResponse.fromJson(jsonResponse.body);
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
  Future<void> deleteSystemTemplate({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteSystemTemplate'
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

    return DeleteSystemTemplateResponse.fromJson(jsonResponse.body);
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
  Future<DeploySystemInstanceResponse> deploySystemInstance({
    String id,
  }) async {
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
    );
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
  Future<void> deprecateFlowTemplate({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeprecateFlowTemplate'
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

    return DeprecateFlowTemplateResponse.fromJson(jsonResponse.body);
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
  Future<void> deprecateSystemTemplate({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeprecateSystemTemplate'
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

    return DeprecateSystemTemplateResponse.fromJson(jsonResponse.body);
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
  Future<DescribeNamespaceResponse> describeNamespace({
    String namespaceName,
  }) async {
    _s.validateStringLength(
      'namespaceName',
      namespaceName,
      0,
      128,
    );
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
  Future<void> dissociateEntityFromThing({
    @_s.required EntityType entityType,
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(entityType, 'entityType');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DissociateEntityFromThing'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityType': entityType?.toValue() ?? '',
        'thingName': thingName,
      },
    );

    return DissociateEntityFromThingResponse.fromJson(jsonResponse.body);
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
  Future<GetEntitiesResponse> getEntities({
    @_s.required List<String> ids,
    int namespaceVersion,
  }) async {
    ArgumentError.checkNotNull(ids, 'ids');
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
  Future<GetFlowTemplateResponse> getFlowTemplate({
    @_s.required String id,
    int revisionNumber,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<GetFlowTemplateRevisionsResponse> getFlowTemplateRevisions({
    @_s.required String id,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<GetSystemInstanceResponse> getSystemInstance({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<GetSystemTemplateResponse> getSystemTemplate({
    @_s.required String id,
    int revisionNumber,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<GetSystemTemplateRevisionsResponse> getSystemTemplateRevisions({
    @_s.required String id,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<GetUploadStatusResponse> getUploadStatus({
    @_s.required String uploadId,
  }) async {
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    _s.validateStringLength(
      'uploadId',
      uploadId,
      1,
      40,
      isRequired: true,
    );
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
  Future<ListFlowExecutionMessagesResponse> listFlowExecutionMessages({
    @_s.required String flowExecutionId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(flowExecutionId, 'flowExecutionId');
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
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
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
  Future<SearchEntitiesResponse> searchEntities({
    @_s.required List<EntityType> entityTypes,
    List<EntityFilter> filters,
    int maxResults,
    int namespaceVersion,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(entityTypes, 'entityTypes');
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
        'entityTypes': entityTypes?.map((e) => e?.toValue() ?? '')?.toList(),
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
  Future<SearchFlowExecutionsResponse> searchFlowExecutions({
    @_s.required String systemInstanceId,
    DateTime endTime,
    String flowExecutionId,
    int maxResults,
    String nextToken,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(systemInstanceId, 'systemInstanceId');
    _s.validateStringLength(
      'systemInstanceId',
      systemInstanceId,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'systemInstanceId',
      systemInstanceId,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<SearchFlowTemplatesResponse> searchFlowTemplates({
    List<FlowTemplateFilter> filters,
    int maxResults,
    String nextToken,
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
  Future<SearchSystemInstancesResponse> searchSystemInstances({
    List<SystemInstanceFilter> filters,
    int maxResults,
    String nextToken,
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
  Future<SearchSystemTemplatesResponse> searchSystemTemplates({
    List<SystemTemplateFilter> filters,
    int maxResults,
    String nextToken,
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
  Future<SearchThingsResponse> searchThings({
    @_s.required String entityId,
    int maxResults,
    int namespaceVersion,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'entityId',
      entityId,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
  Future<UndeploySystemInstanceResponse> undeploySystemInstance({
    String id,
  }) async {
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
    );
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
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
  Future<UpdateFlowTemplateResponse> updateFlowTemplate({
    @_s.required DefinitionDocument definition,
    @_s.required String id,
    int compatibleNamespaceVersion,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<UpdateSystemTemplateResponse> updateSystemTemplate({
    @_s.required DefinitionDocument definition,
    @_s.required String id,
    int compatibleNamespaceVersion,
  }) async {
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      160,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^urn:tdm:(([a-z]{2}-(gov-)?[a-z]{4,9}-[0-9]{1,3}/[0-9]+/)*[\p{Alnum}_]+(/[\p{Alnum}_]+)*):([\p{Alpha}]*):([\p{Alnum}_]+(/[\p{Alnum}_]+)*)$''',
      isRequired: true,
    );
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
  Future<UploadEntityDefinitionsResponse> uploadEntityDefinitions({
    bool deprecateExistingEntities,
    DefinitionDocument document,
    bool syncWithPublicNamespace,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateEntityToThingResponse {
  AssociateEntityToThingResponse();
  factory AssociateEntityToThingResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateEntityToThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFlowTemplateResponse {
  /// The summary object that describes the created workflow.
  @_s.JsonKey(name: 'summary')
  final FlowTemplateSummary summary;

  CreateFlowTemplateResponse({
    this.summary,
  });
  factory CreateFlowTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSystemInstanceResponse {
  /// The summary object that describes the new system instance.
  @_s.JsonKey(name: 'summary')
  final SystemInstanceSummary summary;

  CreateSystemInstanceResponse({
    this.summary,
  });
  factory CreateSystemInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSystemInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSystemTemplateResponse {
  /// The summary object that describes the created system.
  @_s.JsonKey(name: 'summary')
  final SystemTemplateSummary summary;

  CreateSystemTemplateResponse({
    this.summary,
  });
  factory CreateSystemTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSystemTemplateResponseFromJson(json);
}

/// A document that defines an entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DefinitionDocument {
  /// The language used to define the entity. <code>GRAPHQL</code> is the only
  /// valid value.
  @_s.JsonKey(name: 'language')
  final DefinitionLanguage language;

  /// The GraphQL text that defines the entity.
  @_s.JsonKey(name: 'text')
  final String text;

  DefinitionDocument({
    @_s.required this.language,
    @_s.required this.text,
  });
  factory DefinitionDocument.fromJson(Map<String, dynamic> json) =>
      _$DefinitionDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionDocumentToJson(this);
}

enum DefinitionLanguage {
  @_s.JsonValue('GRAPHQL')
  graphql,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFlowTemplateResponse {
  DeleteFlowTemplateResponse();
  factory DeleteFlowTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFlowTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNamespaceResponse {
  /// The ARN of the namespace to be deleted.
  @_s.JsonKey(name: 'namespaceArn')
  final String namespaceArn;

  /// The name of the namespace to be deleted.
  @_s.JsonKey(name: 'namespaceName')
  final String namespaceName;

  DeleteNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
  });
  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSystemInstanceResponse {
  DeleteSystemInstanceResponse();
  factory DeleteSystemInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSystemInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSystemTemplateResponse {
  DeleteSystemTemplateResponse();
  factory DeleteSystemTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSystemTemplateResponseFromJson(json);
}

/// An object that contains the ID and revision number of a workflow or system
/// that is part of a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DependencyRevision {
  /// The ID of the workflow or system.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The revision number of the workflow or system.
  @_s.JsonKey(name: 'revisionNumber')
  final int revisionNumber;

  DependencyRevision({
    this.id,
    this.revisionNumber,
  });
  factory DependencyRevision.fromJson(Map<String, dynamic> json) =>
      _$DependencyRevisionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploySystemInstanceResponse {
  /// An object that contains summary information about a system instance that was
  /// deployed.
  @_s.JsonKey(name: 'summary')
  final SystemInstanceSummary summary;

  /// The ID of the Greengrass deployment used to deploy the system instance.
  @_s.JsonKey(name: 'greengrassDeploymentId')
  final String greengrassDeploymentId;

  DeploySystemInstanceResponse({
    @_s.required this.summary,
    this.greengrassDeploymentId,
  });
  factory DeploySystemInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeploySystemInstanceResponseFromJson(json);
}

enum DeploymentTarget {
  @_s.JsonValue('GREENGRASS')
  greengrass,
  @_s.JsonValue('CLOUD')
  cloud,
}

extension on DeploymentTarget {
  String toValue() {
    switch (this) {
      case DeploymentTarget.greengrass:
        return 'GREENGRASS';
      case DeploymentTarget.cloud:
        return 'CLOUD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeprecateFlowTemplateResponse {
  DeprecateFlowTemplateResponse();
  factory DeprecateFlowTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeprecateFlowTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeprecateSystemTemplateResponse {
  DeprecateSystemTemplateResponse();
  factory DeprecateSystemTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeprecateSystemTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNamespaceResponse {
  /// The ARN of the namespace.
  @_s.JsonKey(name: 'namespaceArn')
  final String namespaceArn;

  /// The name of the namespace.
  @_s.JsonKey(name: 'namespaceName')
  final String namespaceName;

  /// The version of the user's namespace to describe.
  @_s.JsonKey(name: 'namespaceVersion')
  final int namespaceVersion;

  /// The name of the public namespace that the latest namespace version is
  /// tracking.
  @_s.JsonKey(name: 'trackingNamespaceName')
  final String trackingNamespaceName;

  /// The version of the public namespace that the latest version is tracking.
  @_s.JsonKey(name: 'trackingNamespaceVersion')
  final int trackingNamespaceVersion;

  DescribeNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
    this.namespaceVersion,
    this.trackingNamespaceName,
    this.trackingNamespaceVersion,
  });
  factory DescribeNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DissociateEntityFromThingResponse {
  DissociateEntityFromThingResponse();
  factory DissociateEntityFromThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DissociateEntityFromThingResponseFromJson(json);
}

/// Describes the properties of an entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntityDescription {
  /// The entity ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time at which the entity was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The definition document of the entity.
  @_s.JsonKey(name: 'definition')
  final DefinitionDocument definition;

  /// The entity ID.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The entity type.
  @_s.JsonKey(name: 'type')
  final EntityType type;

  EntityDescription({
    this.arn,
    this.createdAt,
    this.definition,
    this.id,
    this.type,
  });
  factory EntityDescription.fromJson(Map<String, dynamic> json) =>
      _$EntityDescriptionFromJson(json);
}

/// An object that filters an entity search. Multiple filters function as OR
/// criteria in the search. For example a search that includes a
/// <code>NAMESPACE</code> and a <code>REFERENCED_ENTITY_ID</code> filter
/// searches for entities in the specified namespace that use the entity
/// specified by the value of <code>REFERENCED_ENTITY_ID</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EntityFilter {
  /// The name of the entity search filter field.
  /// <code>REFERENCED_ENTITY_ID</code> filters on entities that are used by the
  /// entity in the result set. For example, you can filter on the ID of a
  /// property that is used in a state.
  @_s.JsonKey(name: 'name')
  final EntityFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  @_s.JsonKey(name: 'value')
  final List<String> value;

  EntityFilter({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$EntityFilterToJson(this);
}

enum EntityFilterName {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('NAMESPACE')
  namespace,
  @_s.JsonValue('SEMANTIC_TYPE_PATH')
  semanticTypePath,
  @_s.JsonValue('REFERENCED_ENTITY_ID')
  referencedEntityId,
}

enum EntityType {
  @_s.JsonValue('DEVICE')
  device,
  @_s.JsonValue('SERVICE')
  service,
  @_s.JsonValue('DEVICE_MODEL')
  deviceModel,
  @_s.JsonValue('CAPABILITY')
  capability,
  @_s.JsonValue('STATE')
  state,
  @_s.JsonValue('ACTION')
  action,
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('PROPERTY')
  property,
  @_s.JsonValue('MAPPING')
  mapping,
  @_s.JsonValue('ENUM')
  $enum,
}

extension on EntityType {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum FlowExecutionEventType {
  @_s.JsonValue('EXECUTION_STARTED')
  executionStarted,
  @_s.JsonValue('EXECUTION_FAILED')
  executionFailed,
  @_s.JsonValue('EXECUTION_ABORTED')
  executionAborted,
  @_s.JsonValue('EXECUTION_SUCCEEDED')
  executionSucceeded,
  @_s.JsonValue('STEP_STARTED')
  stepStarted,
  @_s.JsonValue('STEP_FAILED')
  stepFailed,
  @_s.JsonValue('STEP_SUCCEEDED')
  stepSucceeded,
  @_s.JsonValue('ACTIVITY_SCHEDULED')
  activityScheduled,
  @_s.JsonValue('ACTIVITY_STARTED')
  activityStarted,
  @_s.JsonValue('ACTIVITY_FAILED')
  activityFailed,
  @_s.JsonValue('ACTIVITY_SUCCEEDED')
  activitySucceeded,
  @_s.JsonValue('START_FLOW_EXECUTION_TASK')
  startFlowExecutionTask,
  @_s.JsonValue('SCHEDULE_NEXT_READY_STEPS_TASK')
  scheduleNextReadyStepsTask,
  @_s.JsonValue('THING_ACTION_TASK')
  thingActionTask,
  @_s.JsonValue('THING_ACTION_TASK_FAILED')
  thingActionTaskFailed,
  @_s.JsonValue('THING_ACTION_TASK_SUCCEEDED')
  thingActionTaskSucceeded,
  @_s.JsonValue('ACKNOWLEDGE_TASK_MESSAGE')
  acknowledgeTaskMessage,
}

/// An object that contains information about a flow event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowExecutionMessage {
  /// The type of flow event .
  @_s.JsonKey(name: 'eventType')
  final FlowExecutionEventType eventType;

  /// The unique identifier of the message.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  /// A string containing information about the flow event.
  @_s.JsonKey(name: 'payload')
  final String payload;

  /// The date and time when the message was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  FlowExecutionMessage({
    this.eventType,
    this.messageId,
    this.payload,
    this.timestamp,
  });
  factory FlowExecutionMessage.fromJson(Map<String, dynamic> json) =>
      _$FlowExecutionMessageFromJson(json);
}

enum FlowExecutionStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('ABORTED')
  aborted,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// An object that contains summary information about a flow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowExecutionSummary {
  /// The date and time when the flow execution summary was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the flow execution.
  @_s.JsonKey(name: 'flowExecutionId')
  final String flowExecutionId;

  /// The ID of the flow.
  @_s.JsonKey(name: 'flowTemplateId')
  final String flowTemplateId;

  /// The current status of the flow execution.
  @_s.JsonKey(name: 'status')
  final FlowExecutionStatus status;

  /// The ID of the system instance that contains the flow.
  @_s.JsonKey(name: 'systemInstanceId')
  final String systemInstanceId;

  /// The date and time when the flow execution summary was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  FlowExecutionSummary({
    this.createdAt,
    this.flowExecutionId,
    this.flowTemplateId,
    this.status,
    this.systemInstanceId,
    this.updatedAt,
  });
  factory FlowExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$FlowExecutionSummaryFromJson(json);
}

/// An object that contains a workflow's definition and summary information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowTemplateDescription {
  /// A workflow's definition document.
  @_s.JsonKey(name: 'definition')
  final DefinitionDocument definition;

  /// An object that contains summary information about a workflow.
  @_s.JsonKey(name: 'summary')
  final FlowTemplateSummary summary;

  /// The version of the user's namespace against which the workflow was
  /// validated. Use this value in your system instance.
  @_s.JsonKey(name: 'validatedNamespaceVersion')
  final int validatedNamespaceVersion;

  FlowTemplateDescription({
    this.definition,
    this.summary,
    this.validatedNamespaceVersion,
  });
  factory FlowTemplateDescription.fromJson(Map<String, dynamic> json) =>
      _$FlowTemplateDescriptionFromJson(json);
}

/// An object that filters a workflow search.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FlowTemplateFilter {
  /// The name of the search filter field.
  @_s.JsonKey(name: 'name')
  final FlowTemplateFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  @_s.JsonKey(name: 'value')
  final List<String> value;

  FlowTemplateFilter({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$FlowTemplateFilterToJson(this);
}

enum FlowTemplateFilterName {
  @_s.JsonValue('DEVICE_MODEL_ID')
  deviceModelId,
}

/// An object that contains summary information about a workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowTemplateSummary {
  /// The ARN of the workflow.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the workflow was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the workflow.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The revision number of the workflow.
  @_s.JsonKey(name: 'revisionNumber')
  final int revisionNumber;

  FlowTemplateSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.revisionNumber,
  });
  factory FlowTemplateSummary.fromJson(Map<String, dynamic> json) =>
      _$FlowTemplateSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEntitiesResponse {
  /// An array of descriptions for the specified entities.
  @_s.JsonKey(name: 'descriptions')
  final List<EntityDescription> descriptions;

  GetEntitiesResponse({
    this.descriptions,
  });
  factory GetEntitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEntitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFlowTemplateResponse {
  /// The object that describes the specified workflow.
  @_s.JsonKey(name: 'description')
  final FlowTemplateDescription description;

  GetFlowTemplateResponse({
    this.description,
  });
  factory GetFlowTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFlowTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFlowTemplateRevisionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that provide summary data about each revision.
  @_s.JsonKey(name: 'summaries')
  final List<FlowTemplateSummary> summaries;

  GetFlowTemplateRevisionsResponse({
    this.nextToken,
    this.summaries,
  });
  factory GetFlowTemplateRevisionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetFlowTemplateRevisionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNamespaceDeletionStatusResponse {
  /// An error code returned by the namespace deletion task.
  @_s.JsonKey(name: 'errorCode')
  final NamespaceDeletionStatusErrorCodes errorCode;

  /// An error code returned by the namespace deletion task.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The ARN of the namespace that is being deleted.
  @_s.JsonKey(name: 'namespaceArn')
  final String namespaceArn;

  /// The name of the namespace that is being deleted.
  @_s.JsonKey(name: 'namespaceName')
  final String namespaceName;

  /// The status of the deletion request.
  @_s.JsonKey(name: 'status')
  final NamespaceDeletionStatus status;

  GetNamespaceDeletionStatusResponse({
    this.errorCode,
    this.errorMessage,
    this.namespaceArn,
    this.namespaceName,
    this.status,
  });
  factory GetNamespaceDeletionStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetNamespaceDeletionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSystemInstanceResponse {
  /// An object that describes the system instance.
  @_s.JsonKey(name: 'description')
  final SystemInstanceDescription description;

  GetSystemInstanceResponse({
    this.description,
  });
  factory GetSystemInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSystemTemplateResponse {
  /// An object that contains summary data about the system.
  @_s.JsonKey(name: 'description')
  final SystemTemplateDescription description;

  GetSystemTemplateResponse({
    this.description,
  });
  factory GetSystemTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSystemTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSystemTemplateRevisionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contain summary data about the system template
  /// revisions.
  @_s.JsonKey(name: 'summaries')
  final List<SystemTemplateSummary> summaries;

  GetSystemTemplateRevisionsResponse({
    this.nextToken,
    this.summaries,
  });
  factory GetSystemTemplateRevisionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSystemTemplateRevisionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUploadStatusResponse {
  /// The date at which the upload was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The ID of the upload.
  @_s.JsonKey(name: 'uploadId')
  final String uploadId;

  /// The status of the upload. The initial status is <code>IN_PROGRESS</code>.
  /// The response show all validation failures if the upload fails.
  @_s.JsonKey(name: 'uploadStatus')
  final UploadStatus uploadStatus;

  /// The reason for an upload failure.
  @_s.JsonKey(name: 'failureReason')
  final List<String> failureReason;

  /// The ARN of the upload.
  @_s.JsonKey(name: 'namespaceArn')
  final String namespaceArn;

  /// The name of the upload's namespace.
  @_s.JsonKey(name: 'namespaceName')
  final String namespaceName;

  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  @_s.JsonKey(name: 'namespaceVersion')
  final int namespaceVersion;

  GetUploadStatusResponse({
    @_s.required this.createdDate,
    @_s.required this.uploadId,
    @_s.required this.uploadStatus,
    this.failureReason,
    this.namespaceArn,
    this.namespaceName,
    this.namespaceVersion,
  });
  factory GetUploadStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUploadStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFlowExecutionMessagesResponse {
  /// A list of objects that contain information about events in the specified
  /// flow execution.
  @_s.JsonKey(name: 'messages')
  final List<FlowExecutionMessage> messages;

  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFlowExecutionMessagesResponse({
    this.messages,
    this.nextToken,
  });
  factory ListFlowExecutionMessagesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFlowExecutionMessagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The token that specifies the next page of results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of tags returned by the <code>ListTagsForResource</code> operation.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// An object that specifies whether cloud metrics are collected in a deployment
/// and, if so, what role is used to collect metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricsConfiguration {
  /// A Boolean that specifies whether cloud metrics are collected.
  @_s.JsonKey(name: 'cloudMetricEnabled')
  final bool cloudMetricEnabled;

  /// The ARN of the role that is used to collect cloud metrics.
  @_s.JsonKey(name: 'metricRuleRoleArn')
  final String metricRuleRoleArn;

  MetricsConfiguration({
    this.cloudMetricEnabled,
    this.metricRuleRoleArn,
  });
  factory MetricsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MetricsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsConfigurationToJson(this);
}

enum NamespaceDeletionStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

enum NamespaceDeletionStatusErrorCodes {
  @_s.JsonValue('VALIDATION_FAILED')
  validationFailed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchEntitiesResponse {
  /// An array of descriptions for each entity returned in the search result.
  @_s.JsonKey(name: 'descriptions')
  final List<EntityDescription> descriptions;

  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  SearchEntitiesResponse({
    this.descriptions,
    this.nextToken,
  });
  factory SearchEntitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchEntitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchFlowExecutionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contain summary information about each workflow
  /// execution in the result set.
  @_s.JsonKey(name: 'summaries')
  final List<FlowExecutionSummary> summaries;

  SearchFlowExecutionsResponse({
    this.nextToken,
    this.summaries,
  });
  factory SearchFlowExecutionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFlowExecutionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchFlowTemplatesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contain summary information about each workflow in
  /// the result set.
  @_s.JsonKey(name: 'summaries')
  final List<FlowTemplateSummary> summaries;

  SearchFlowTemplatesResponse({
    this.nextToken,
    this.summaries,
  });
  factory SearchFlowTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFlowTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSystemInstancesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contain summary data abour the system instances in
  /// the result set.
  @_s.JsonKey(name: 'summaries')
  final List<SystemInstanceSummary> summaries;

  SearchSystemInstancesResponse({
    this.nextToken,
    this.summaries,
  });
  factory SearchSystemInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSystemInstancesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSystemTemplatesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contain summary information about each system
  /// deployment in the result set.
  @_s.JsonKey(name: 'summaries')
  final List<SystemTemplateSummary> summaries;

  SearchSystemTemplatesResponse({
    this.nextToken,
    this.summaries,
  });
  factory SearchSystemTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSystemTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchThingsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of things in the result set.
  @_s.JsonKey(name: 'things')
  final List<Thing> things;

  SearchThingsResponse({
    this.nextToken,
    this.things,
  });
  factory SearchThingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchThingsResponseFromJson(json);
}

enum SystemInstanceDeploymentStatus {
  @_s.JsonValue('NOT_DEPLOYED')
  notDeployed,
  @_s.JsonValue('BOOTSTRAP')
  bootstrap,
  @_s.JsonValue('DEPLOY_IN_PROGRESS')
  deployInProgress,
  @_s.JsonValue('DEPLOYED_IN_TARGET')
  deployedInTarget,
  @_s.JsonValue('UNDEPLOY_IN_PROGRESS')
  undeployInProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('PENDING_DELETE')
  pendingDelete,
  @_s.JsonValue('DELETED_IN_TARGET')
  deletedInTarget,
}

/// An object that contains a system instance definition and summary
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SystemInstanceDescription {
  @_s.JsonKey(name: 'definition')
  final DefinitionDocument definition;

  /// The AWS Identity and Access Management (IAM) role that AWS IoT Things Graph
  /// assumes during flow execution in a cloud deployment. This role must have
  /// read and write permissionss to AWS Lambda and AWS IoT and to any other AWS
  /// services that the flow uses.
  @_s.JsonKey(name: 'flowActionsRoleArn')
  final String flowActionsRoleArn;
  @_s.JsonKey(name: 'metricsConfiguration')
  final MetricsConfiguration metricsConfiguration;

  /// The Amazon Simple Storage Service bucket where information about a system
  /// instance is stored.
  @_s.JsonKey(name: 's3BucketName')
  final String s3BucketName;

  /// An object that contains summary information about a system instance.
  @_s.JsonKey(name: 'summary')
  final SystemInstanceSummary summary;

  /// A list of objects that contain all of the IDs and revision numbers of
  /// workflows and systems that are used in a system instance.
  @_s.JsonKey(name: 'validatedDependencyRevisions')
  final List<DependencyRevision> validatedDependencyRevisions;

  /// The version of the user's namespace against which the system instance was
  /// validated.
  @_s.JsonKey(name: 'validatedNamespaceVersion')
  final int validatedNamespaceVersion;

  SystemInstanceDescription({
    this.definition,
    this.flowActionsRoleArn,
    this.metricsConfiguration,
    this.s3BucketName,
    this.summary,
    this.validatedDependencyRevisions,
    this.validatedNamespaceVersion,
  });
  factory SystemInstanceDescription.fromJson(Map<String, dynamic> json) =>
      _$SystemInstanceDescriptionFromJson(json);
}

/// An object that filters a system instance search. Multiple filters function
/// as OR criteria in the search. For example a search that includes a
/// GREENGRASS_GROUP_NAME and a STATUS filter searches for system instances in
/// the specified Greengrass group that have the specified status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SystemInstanceFilter {
  /// The name of the search filter field.
  @_s.JsonKey(name: 'name')
  final SystemInstanceFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  @_s.JsonKey(name: 'value')
  final List<String> value;

  SystemInstanceFilter({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$SystemInstanceFilterToJson(this);
}

enum SystemInstanceFilterName {
  @_s.JsonValue('SYSTEM_TEMPLATE_ID')
  systemTemplateId,
  @_s.JsonValue('STATUS')
  status,
  @_s.JsonValue('GREENGRASS_GROUP_NAME')
  greengrassGroupName,
}

/// An object that contains summary information about a system instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SystemInstanceSummary {
  /// The ARN of the system instance.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the system instance was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the Greengrass group where the system instance is deployed.
  @_s.JsonKey(name: 'greengrassGroupId')
  final String greengrassGroupId;

  /// The ID of the Greengrass group where the system instance is deployed.
  @_s.JsonKey(name: 'greengrassGroupName')
  final String greengrassGroupName;

  /// The version of the Greengrass group where the system instance is deployed.
  @_s.JsonKey(name: 'greengrassGroupVersionId')
  final String greengrassGroupVersionId;

  /// The ID of the system instance.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The status of the system instance.
  @_s.JsonKey(name: 'status')
  final SystemInstanceDeploymentStatus status;

  /// The target of the system instance.
  @_s.JsonKey(name: 'target')
  final DeploymentTarget target;

  /// The date and time when the system instance was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

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
  factory SystemInstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$SystemInstanceSummaryFromJson(json);
}

/// An object that contains a system's definition document and summary
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SystemTemplateDescription {
  /// The definition document of a system.
  @_s.JsonKey(name: 'definition')
  final DefinitionDocument definition;

  /// An object that contains summary information about a system.
  @_s.JsonKey(name: 'summary')
  final SystemTemplateSummary summary;

  /// The namespace version against which the system was validated. Use this value
  /// in your system instance.
  @_s.JsonKey(name: 'validatedNamespaceVersion')
  final int validatedNamespaceVersion;

  SystemTemplateDescription({
    this.definition,
    this.summary,
    this.validatedNamespaceVersion,
  });
  factory SystemTemplateDescription.fromJson(Map<String, dynamic> json) =>
      _$SystemTemplateDescriptionFromJson(json);
}

/// An object that filters a system search.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SystemTemplateFilter {
  /// The name of the system search filter field.
  @_s.JsonKey(name: 'name')
  final SystemTemplateFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  @_s.JsonKey(name: 'value')
  final List<String> value;

  SystemTemplateFilter({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$SystemTemplateFilterToJson(this);
}

enum SystemTemplateFilterName {
  @_s.JsonValue('FLOW_TEMPLATE_ID')
  flowTemplateId,
}

/// An object that contains information about a system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SystemTemplateSummary {
  /// The ARN of the system.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the system was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the system.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The revision number of the system.
  @_s.JsonKey(name: 'revisionNumber')
  final int revisionNumber;

  SystemTemplateSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.revisionNumber,
  });
  factory SystemTemplateSummary.fromJson(Map<String, dynamic> json) =>
      _$SystemTemplateSummaryFromJson(json);
}

/// Metadata assigned to an AWS IoT Things Graph resource consisting of a
/// key-value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The required name of the tag. The string value can be from 1 to 128 Unicode
  /// characters in length.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The optional value of the tag. The string value can be from 1 to 256 Unicode
  /// characters in length.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
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

/// An AWS IoT thing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Thing {
  /// The ARN of the thing.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  /// The name of the thing.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  Thing({
    this.thingArn,
    this.thingName,
  });
  factory Thing.fromJson(Map<String, dynamic> json) => _$ThingFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UndeploySystemInstanceResponse {
  /// An object that contains summary information about the system instance that
  /// was removed from its target.
  @_s.JsonKey(name: 'summary')
  final SystemInstanceSummary summary;

  UndeploySystemInstanceResponse({
    this.summary,
  });
  factory UndeploySystemInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$UndeploySystemInstanceResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowTemplateResponse {
  /// An object containing summary information about the updated workflow.
  @_s.JsonKey(name: 'summary')
  final FlowTemplateSummary summary;

  UpdateFlowTemplateResponse({
    this.summary,
  });
  factory UpdateFlowTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSystemTemplateResponse {
  /// An object containing summary information about the updated system.
  @_s.JsonKey(name: 'summary')
  final SystemTemplateSummary summary;

  UpdateSystemTemplateResponse({
    this.summary,
  });
  factory UpdateSystemTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSystemTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UploadEntityDefinitionsResponse {
  /// The ID that specifies the upload action. You can use this to track the
  /// status of the upload.
  @_s.JsonKey(name: 'uploadId')
  final String uploadId;

  UploadEntityDefinitionsResponse({
    @_s.required this.uploadId,
  });
  factory UploadEntityDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadEntityDefinitionsResponseFromJson(json);
}

enum UploadStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
