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

/// IoT Greengrass brings local compute, messaging, data management, sync, and
/// ML inference capabilities to edge devices. This enables devices to collect
/// and analyze data closer to the source of information, react autonomously to
/// local events, and communicate securely with each other on local networks.
/// Local devices can also communicate securely with Amazon Web Services IoT
/// Core and export IoT data to the Amazon Web Services Cloud. IoT Greengrass
/// developers can use Lambda functions and components to create and deploy
/// applications to fleets of edge devices for local operation.
///
/// IoT Greengrass Version 2 provides a new major version of the IoT Greengrass
/// Core software, new APIs, and a new console. Use this API reference to learn
/// how to use the IoT Greengrass V2 API operations to manage components, manage
/// deployments, and core devices.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/what-is-iot-greengrass.html">What
/// is IoT Greengrass?</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
class GreengrassV2 {
  final _s.RestJsonProtocol _protocol;
  GreengrassV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'greengrass',
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

  /// Associates a Greengrass service role with IoT Greengrass for your Amazon
  /// Web Services account in this Amazon Web Services Region. IoT Greengrass
  /// uses this role to verify the identity of client devices and manage core
  /// device connectivity information. The role must include the <a
  /// href="https://console.aws.amazon.com/iam/home#/policies/arn:awsiam::aws:policy/service-role/AWSGreengrassResourceAccessRolePolicy">AWSGreengrassResourceAccessRolePolicy</a>
  /// managed policy or a custom policy that defines equivalent permissions for
  /// the IoT Greengrass features that you use. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-service-role.html">Greengrass
  /// service role</a> in the <i>IoT Greengrass Version 2 Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the service role to associate with IoT
  /// Greengrass for your Amazon Web Services account in this Amazon Web
  /// Services Region.
  Future<AssociateServiceRoleToAccountResponse> associateServiceRoleToAccount({
    required String roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateServiceRoleToAccountResponse.fromJson(response);
  }

  /// Associates a list of client devices with a core device. Use this API
  /// operation to specify which client devices can discover a core device
  /// through cloud discovery. With cloud discovery, client devices connect to
  /// IoT Greengrass to retrieve associated core devices' connectivity
  /// information and certificates. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-cloud-discovery.html">Configure
  /// cloud discovery</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  /// <note>
  /// Client devices are local IoT devices that connect to and communicate with
  /// an IoT Greengrass core device over MQTT. You can connect client devices to
  /// a core device to sync MQTT messages and data to Amazon Web Services IoT
  /// Core and interact with client devices in Greengrass components. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interact-with-local-iot-devices.html">Interact
  /// with local IoT devices</a> in the <i>IoT Greengrass V2 Developer
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  ///
  /// Parameter [entries] :
  /// The list of client devices to associate.
  Future<BatchAssociateClientDeviceWithCoreDeviceResponse>
      batchAssociateClientDeviceWithCoreDevice({
    required String coreDeviceThingName,
    List<AssociateClientDeviceWithCoreDeviceEntry>? entries,
  }) async {
    final $payload = <String, dynamic>{
      if (entries != null) 'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/associateClientDevices',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateClientDeviceWithCoreDeviceResponse.fromJson(response);
  }

  /// Disassociates a list of client devices from a core device. After you
  /// disassociate a client device from a core device, the client device won't
  /// be able to use cloud discovery to retrieve the core device's connectivity
  /// information and certificates.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  ///
  /// Parameter [entries] :
  /// The list of client devices to disassociate.
  Future<BatchDisassociateClientDeviceFromCoreDeviceResponse>
      batchDisassociateClientDeviceFromCoreDevice({
    required String coreDeviceThingName,
    List<DisassociateClientDeviceFromCoreDeviceEntry>? entries,
  }) async {
    final $payload = <String, dynamic>{
      if (entries != null) 'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/disassociateClientDevices',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateClientDeviceFromCoreDeviceResponse.fromJson(
        response);
  }

  /// Cancels a deployment. This operation cancels the deployment for devices
  /// that haven't yet received it. If a device already received the deployment,
  /// this operation doesn't change anything for that device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  Future<CancelDeploymentResponse> cancelDeployment({
    required String deploymentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/greengrass/v2/deployments/${Uri.encodeComponent(deploymentId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDeploymentResponse.fromJson(response);
  }

  /// Creates a component. Components are software that run on Greengrass core
  /// devices. After you develop and test a component on your core device, you
  /// can use this operation to upload your component to IoT Greengrass. Then,
  /// you can deploy the component to other core devices.
  ///
  /// You can use this operation to do the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Create components from recipes</b>
  ///
  /// Create a component from a recipe, which is a file that defines the
  /// component's metadata, parameters, dependencies, lifecycle, artifacts, and
  /// platform capability. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html">IoT
  /// Greengrass component recipe reference</a> in the <i>IoT Greengrass V2
  /// Developer Guide</i>.
  ///
  /// To create a component from a recipe, specify <code>inlineRecipe</code>
  /// when you call this operation.
  /// </li>
  /// <li>
  /// <b>Create components from Lambda functions</b>
  ///
  /// Create a component from an Lambda function that runs on IoT Greengrass.
  /// This creates a recipe and artifacts from the Lambda function's deployment
  /// package. You can use this operation to migrate Lambda functions from IoT
  /// Greengrass V1 to IoT Greengrass V2.
  ///
  /// This function accepts Lambda functions in all supported versions of
  /// Python, Node.js, and Java runtimes. IoT Greengrass doesn't apply any
  /// additional restrictions on deprecated Lambda runtime versions.
  ///
  /// To create a component from a Lambda function, specify
  /// <code>lambdaFunction</code> when you call this operation.
  /// <note>
  /// IoT Greengrass currently supports Lambda functions on only Linux core
  /// devices.
  /// </note> </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [RequestAlreadyInProgressException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you can provide to ensure that
  /// the request is idempotent. Idempotency means that the request is
  /// successfully processed only once, even if you send the request multiple
  /// times. When a request succeeds, and you specify the same client token for
  /// subsequent successful requests, the IoT Greengrass V2 service returns the
  /// successful response that it caches from the previous request. IoT
  /// Greengrass V2 caches successful responses for idempotent requests for up
  /// to 8 hours.
  ///
  /// Parameter [inlineRecipe] :
  /// The recipe to use to create the component. The recipe defines the
  /// component's metadata, parameters, dependencies, lifecycle, artifacts, and
  /// platform compatibility.
  ///
  /// You must specify either <code>inlineRecipe</code> or
  /// <code>lambdaFunction</code>.
  ///
  /// Parameter [lambdaFunction] :
  /// The parameters to create a component from a Lambda function.
  ///
  /// You must specify either <code>inlineRecipe</code> or
  /// <code>lambdaFunction</code>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  Future<CreateComponentVersionResponse> createComponentVersion({
    String? clientToken,
    Uint8List? inlineRecipe,
    LambdaFunctionRecipeSource? lambdaFunction,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (inlineRecipe != null) 'inlineRecipe': base64Encode(inlineRecipe),
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/v2/createComponentVersion',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComponentVersionResponse.fromJson(response);
  }

  /// Creates a continuous deployment for a target, which is a Greengrass core
  /// device or group of core devices. When you add a new core device to a group
  /// of core devices that has a deployment, IoT Greengrass deploys that group's
  /// deployment to the new device.
  ///
  /// You can define one deployment for each target. When you create a new
  /// deployment for a target that has an existing deployment, you replace the
  /// previous deployment. IoT Greengrass applies the new deployment to the
  /// target devices.
  ///
  /// Every deployment has a revision number that indicates how many deployment
  /// revisions you define for a target. Use this operation to create a new
  /// revision of an existing deployment.
  ///
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/create-deployments.html">Create
  /// deployments</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [RequestAlreadyInProgressException].
  ///
  /// Parameter [targetArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target IoT thing or thing group. When creating a subdeployment, the
  /// targetARN can only be a thing group.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you can provide to ensure that
  /// the request is idempotent. Idempotency means that the request is
  /// successfully processed only once, even if you send the request multiple
  /// times. When a request succeeds, and you specify the same client token for
  /// subsequent successful requests, the IoT Greengrass V2 service returns the
  /// successful response that it caches from the previous request. IoT
  /// Greengrass V2 caches successful responses for idempotent requests for up
  /// to 8 hours.
  ///
  /// Parameter [components] :
  /// The components to deploy. This is a dictionary, where each key is the name
  /// of a component, and each key's value is the version and configuration to
  /// deploy for that component.
  ///
  /// Parameter [deploymentName] :
  /// The name of the deployment.
  ///
  /// Parameter [deploymentPolicies] :
  /// The deployment policies for the deployment. These policies define how the
  /// deployment updates components and handles failure.
  ///
  /// Parameter [iotJobConfiguration] :
  /// The job configuration for the deployment configuration. The job
  /// configuration specifies the rollout, timeout, and stop configurations for
  /// the deployment configuration.
  ///
  /// Parameter [parentTargetArn] :
  /// The parent deployment's target <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// within a subdeployment.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  Future<CreateDeploymentResponse> createDeployment({
    required String targetArn,
    String? clientToken,
    Map<String, ComponentDeploymentSpecification>? components,
    String? deploymentName,
    DeploymentPolicies? deploymentPolicies,
    DeploymentIoTJobConfiguration? iotJobConfiguration,
    String? parentTargetArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'targetArn': targetArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (components != null) 'components': components,
      if (deploymentName != null) 'deploymentName': deploymentName,
      if (deploymentPolicies != null) 'deploymentPolicies': deploymentPolicies,
      if (iotJobConfiguration != null)
        'iotJobConfiguration': iotJobConfiguration,
      if (parentTargetArn != null) 'parentTargetArn': parentTargetArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/v2/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentResponse.fromJson(response);
  }

  /// Deletes a version of a component from IoT Greengrass.
  /// <note>
  /// This operation deletes the component's recipe and artifacts. As a result,
  /// deployments that refer to this component version will fail. If you have
  /// deployments that use this component version, you can remove the component
  /// from the deployment or update the deployment to use a valid version.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  Future<void> deleteComponent({
    required String arn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/v2/components/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Greengrass core device, which is an IoT thing. This operation
  /// removes the core device from the list of core devices. This operation
  /// doesn't delete the IoT thing. For more information about how to delete the
  /// IoT thing, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_DeleteThing.html">DeleteThing</a>
  /// in the <i>IoT API Reference</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  Future<void> deleteCoreDevice({
    required String coreDeviceThingName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a deployment. To delete an active deployment, you must first
  /// cancel it. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CancelDeployment.html">CancelDeployment</a>.
  ///
  /// Deleting a deployment doesn't affect core devices that run that
  /// deployment, because core devices store the deployment's configuration on
  /// the device. Additionally, core devices can roll back to a previous
  /// deployment that has been deleted.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  Future<void> deleteDeployment({
    required String deploymentId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/v2/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves metadata for a version of a component.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  Future<DescribeComponentResponse> describeComponent({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/components/${Uri.encodeComponent(arn)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeComponentResponse.fromJson(response);
  }

  /// Disassociates the Greengrass service role from IoT Greengrass for your
  /// Amazon Web Services account in this Amazon Web Services Region. Without a
  /// service role, IoT Greengrass can't verify the identity of client devices
  /// or manage core device connectivity information. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-service-role.html">Greengrass
  /// service role</a> in the <i>IoT Greengrass Version 2 Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  Future<DisassociateServiceRoleFromAccountResponse>
      disassociateServiceRoleFromAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateServiceRoleFromAccountResponse.fromJson(response);
  }

  /// Gets the recipe for a version of a component.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  ///
  /// Parameter [recipeOutputFormat] :
  /// The format of the recipe.
  Future<GetComponentResponse> getComponent({
    required String arn,
    RecipeOutputFormat? recipeOutputFormat,
  }) async {
    final $query = <String, List<String>>{
      if (recipeOutputFormat != null)
        'recipeOutputFormat': [recipeOutputFormat.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/v2/components/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentResponse.fromJson(response);
  }

  /// Gets the pre-signed URL to download a public or a Lambda component
  /// artifact. Core devices call this operation to identify the URL that they
  /// can use to download an artifact to install.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version. Specify the ARN of a public or a Lambda
  /// component version.
  ///
  /// Parameter [artifactName] :
  /// The name of the artifact.
  ///
  /// You can use the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/APIReference/API_GetComponent.html">GetComponent</a>
  /// operation to download the component recipe, which includes the URI of the
  /// artifact. The artifact name is the section of the URI after the scheme.
  /// For example, in the artifact URI <code>greengrass:SomeArtifact.zip</code>,
  /// the artifact name is <code>SomeArtifact.zip</code>.
  ///
  /// Parameter [iotEndpointType] :
  /// Determines if the Amazon S3 URL returned is a FIPS pre-signed URL
  /// endpoint. Specify <code>fips</code> if you want the returned Amazon S3
  /// pre-signed URL to point to an Amazon S3 FIPS endpoint. If you don't
  /// specify a value, the default is <code>standard</code>.
  ///
  /// Parameter [s3EndpointType] :
  /// Specifies the endpoint to use when getting Amazon S3 pre-signed URLs.
  ///
  /// All Amazon Web Services Regions except US East (N. Virginia) use
  /// <code>REGIONAL</code> in all cases. In the US East (N. Virginia) Region
  /// the default is <code>GLOBAL</code>, but you can change it to
  /// <code>REGIONAL</code> with this parameter.
  Future<GetComponentVersionArtifactResponse> getComponentVersionArtifact({
    required String arn,
    required String artifactName,
    IotEndpointType? iotEndpointType,
    S3EndpointType? s3EndpointType,
  }) async {
    final headers = <String, String>{
      if (iotEndpointType != null)
        'x-amz-iot-endpoint-type': iotEndpointType.toValue(),
    };
    final $query = <String, List<String>>{
      if (s3EndpointType != null) 's3EndpointType': [s3EndpointType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/components/${Uri.encodeComponent(arn)}/artifacts/${artifactName.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentVersionArtifactResponse.fromJson(response);
  }

  /// Retrieves connectivity information for a Greengrass core device.
  ///
  /// Connectivity information includes endpoints and ports where client devices
  /// can connect to an MQTT broker on the core device. When a client device
  /// calls the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-discover-api.html">IoT
  /// Greengrass discovery API</a>, IoT Greengrass returns connectivity
  /// information for all of the core devices where the client device can
  /// connect. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/connect-client-devices.html">Connect
  /// client devices to core devices</a> in the <i>IoT Greengrass Version 2
  /// Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [thingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  Future<GetConnectivityInfoResponse> getConnectivityInfo({
    required String thingName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/connectivityInfo',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectivityInfoResponse.fromJson(response);
  }

  /// Retrieves metadata for a Greengrass core device.
  /// <note>
  /// IoT Greengrass relies on individual devices to send status updates to the
  /// Amazon Web Services Cloud. If the IoT Greengrass Core software isn't
  /// running on the device, or if device isn't connected to the Amazon Web
  /// Services Cloud, then the reported status of that device might not reflect
  /// its current status. The status timestamp indicates when the device status
  /// was last updated.
  ///
  /// Core devices send status updates at the following times:
  ///
  /// <ul>
  /// <li>
  /// When the IoT Greengrass Core software starts
  /// </li>
  /// <li>
  /// When the core device receives a deployment from the Amazon Web Services
  /// Cloud
  /// </li>
  /// <li>
  /// When the status of any component on the core device becomes
  /// <code>BROKEN</code>
  /// </li>
  /// <li>
  /// At a <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html#greengrass-nucleus-component-configuration-fss">regular
  /// interval that you can configure</a>, which defaults to 24 hours
  /// </li>
  /// <li>
  /// For IoT Greengrass Core v2.7.0, the core device sends status updates upon
  /// local deployment and cloud deployment
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  Future<GetCoreDeviceResponse> getCoreDevice({
    required String coreDeviceThingName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreDeviceResponse.fromJson(response);
  }

  /// Gets a deployment. Deployments define the components that run on
  /// Greengrass core devices.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  Future<GetDeploymentResponse> getDeployment({
    required String deploymentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentResponse.fromJson(response);
  }

  /// Gets the service role associated with IoT Greengrass for your Amazon Web
  /// Services account in this Amazon Web Services Region. IoT Greengrass uses
  /// this role to verify the identity of client devices and manage core device
  /// connectivity information. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-service-role.html">Greengrass
  /// service role</a> in the <i>IoT Greengrass Version 2 Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  Future<GetServiceRoleForAccountResponse> getServiceRoleForAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceRoleForAccountResponse.fromJson(response);
  }

  /// Retrieves a paginated list of client devices that are associated with a
  /// core device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListClientDevicesAssociatedWithCoreDeviceResponse>
      listClientDevicesAssociatedWithCoreDevice({
    required String coreDeviceThingName,
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
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/associatedClientDevices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClientDevicesAssociatedWithCoreDeviceResponse.fromJson(response);
  }

  /// Retrieves a paginated list of all versions for a component. Greater
  /// versions are listed first.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListComponentVersionsResponse> listComponentVersions({
    required String arn,
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
          '/greengrass/v2/components/${Uri.encodeComponent(arn)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentVersionsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of component summaries. This list includes
  /// components that you have permission to view.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [scope] :
  /// The scope of the components to list.
  ///
  /// Default: <code>PRIVATE</code>
  Future<ListComponentsResponse> listComponents({
    int? maxResults,
    String? nextToken,
    ComponentVisibilityScope? scope,
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
      if (scope != null) 'scope': [scope.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/v2/components',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of Greengrass core devices.
  /// <note>
  /// IoT Greengrass relies on individual devices to send status updates to the
  /// Amazon Web Services Cloud. If the IoT Greengrass Core software isn't
  /// running on the device, or if device isn't connected to the Amazon Web
  /// Services Cloud, then the reported status of that device might not reflect
  /// its current status. The status timestamp indicates when the device status
  /// was last updated.
  ///
  /// Core devices send status updates at the following times:
  ///
  /// <ul>
  /// <li>
  /// When the IoT Greengrass Core software starts
  /// </li>
  /// <li>
  /// When the core device receives a deployment from the Amazon Web Services
  /// Cloud
  /// </li>
  /// <li>
  /// When the status of any component on the core device becomes
  /// <code>BROKEN</code>
  /// </li>
  /// <li>
  /// At a <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html#greengrass-nucleus-component-configuration-fss">regular
  /// interval that you can configure</a>, which defaults to 24 hours
  /// </li>
  /// <li>
  /// For IoT Greengrass Core v2.7.0, the core device sends status updates upon
  /// local deployment and cloud deployment
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [status] :
  /// The core device status by which to filter. If you specify this parameter,
  /// the list includes only core devices that have this status. Choose one of
  /// the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – The IoT Greengrass Core software and all components
  /// run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The IoT Greengrass Core software or a component
  /// is in a failed state on the core device.
  /// </li>
  /// </ul>
  ///
  /// Parameter [thingGroupArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IoT thing group by which to filter. If you specify this parameter,
  /// the list includes only core devices that have successfully deployed a
  /// deployment that targets the thing group. When you remove a core device
  /// from a thing group, the list continues to include that core device.
  Future<ListCoreDevicesResponse> listCoreDevices({
    int? maxResults,
    String? nextToken,
    CoreDeviceStatus? status,
    String? thingGroupArn,
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
      if (status != null) 'status': [status.toValue()],
      if (thingGroupArn != null) 'thingGroupArn': [thingGroupArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/v2/coreDevices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCoreDevicesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of deployments.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [historyFilter] :
  /// The filter for the list of deployments. Choose one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all deployments.
  /// </li>
  /// <li>
  /// <code>LATEST_ONLY</code> – The list includes only the latest revision of
  /// each deployment.
  /// </li>
  /// </ul>
  /// Default: <code>LATEST_ONLY</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: <code>50</code>
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [parentTargetArn] :
  /// The parent deployment's target <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// within a subdeployment.
  ///
  /// Parameter [targetArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target IoT thing or thing group.
  Future<ListDeploymentsResponse> listDeployments({
    DeploymentHistoryFilter? historyFilter,
    int? maxResults,
    String? nextToken,
    String? parentTargetArn,
    String? targetArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (historyFilter != null) 'historyFilter': [historyFilter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (parentTargetArn != null) 'parentTargetArn': [parentTargetArn],
      if (targetArn != null) 'targetArn': [targetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/v2/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of deployment jobs that IoT Greengrass sends to
  /// Greengrass core devices.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListEffectiveDeploymentsResponse> listEffectiveDeployments({
    required String coreDeviceThingName,
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
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/effectiveDeployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEffectiveDeploymentsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of the components that a Greengrass core device
  /// runs. By default, this list doesn't include components that are deployed
  /// as dependencies of other components. To include dependencies in the
  /// response, set the <code>topologyFilter</code> parameter to
  /// <code>ALL</code>.
  /// <note>
  /// IoT Greengrass relies on individual devices to send status updates to the
  /// Amazon Web Services Cloud. If the IoT Greengrass Core software isn't
  /// running on the device, or if device isn't connected to the Amazon Web
  /// Services Cloud, then the reported status of that device might not reflect
  /// its current status. The status timestamp indicates when the device status
  /// was last updated.
  ///
  /// Core devices send status updates at the following times:
  ///
  /// <ul>
  /// <li>
  /// When the IoT Greengrass Core software starts
  /// </li>
  /// <li>
  /// When the core device receives a deployment from the Amazon Web Services
  /// Cloud
  /// </li>
  /// <li>
  /// When the status of any component on the core device becomes
  /// <code>BROKEN</code>
  /// </li>
  /// <li>
  /// At a <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html#greengrass-nucleus-component-configuration-fss">regular
  /// interval that you can configure</a>, which defaults to 24 hours
  /// </li>
  /// <li>
  /// For IoT Greengrass Core v2.7.0, the core device sends status updates upon
  /// local deployment and cloud deployment
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [topologyFilter] :
  /// The filter for the list of components. Choose from the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all components installed on the core
  /// device.
  /// </li>
  /// <li>
  /// <code>ROOT</code> – The list includes only <i>root</i> components, which
  /// are components that you specify in a deployment. When you choose this
  /// option, the list doesn't include components that the core device installs
  /// as dependencies of other components.
  /// </li>
  /// </ul>
  /// Default: <code>ROOT</code>
  Future<ListInstalledComponentsResponse> listInstalledComponents({
    required String coreDeviceThingName,
    int? maxResults,
    String? nextToken,
    InstalledComponentTopologyFilter? topologyFilter,
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
      if (topologyFilter != null) 'topologyFilter': [topologyFilter.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/installedComponents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstalledComponentsResponse.fromJson(response);
  }

  /// Retrieves the list of tags for an IoT Greengrass resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource.
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

  /// Retrieves a list of components that meet the component, version, and
  /// platform requirements of a deployment. Greengrass core devices call this
  /// operation when they receive a deployment to identify the components to
  /// install.
  ///
  /// This operation identifies components that meet all dependency requirements
  /// for a deployment. If the requirements conflict, then this operation
  /// returns an error and the deployment fails. For example, this occurs if
  /// component <code>A</code> requires version <code>&gt;2.0.0</code> and
  /// component <code>B</code> requires version <code>&lt;2.0.0</code> of a
  /// component dependency.
  ///
  /// When you specify the component candidates to resolve, IoT Greengrass
  /// compares each component's digest from the core device with the component's
  /// digest in the Amazon Web Services Cloud. If the digests don't match, then
  /// IoT Greengrass specifies to use the version from the Amazon Web Services
  /// Cloud.
  /// <important>
  /// To use this operation, you must use the data plane API endpoint and
  /// authenticate with an IoT device certificate. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/greengrass.html">IoT
  /// Greengrass endpoints and quotas</a>.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentCandidates] :
  /// The list of components to resolve.
  ///
  /// Parameter [platform] :
  /// The platform to use to resolve compatible components.
  Future<ResolveComponentCandidatesResponse> resolveComponentCandidates({
    List<ComponentCandidate>? componentCandidates,
    ComponentPlatform? platform,
  }) async {
    final $payload = <String, dynamic>{
      if (componentCandidates != null)
        'componentCandidates': componentCandidates,
      if (platform != null) 'platform': platform,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/v2/resolveComponentCandidates',
      exceptionFnMap: _exceptionFns,
    );
    return ResolveComponentCandidatesResponse.fromJson(response);
  }

  /// Adds tags to an IoT Greengrass resource. If a tag already exists for the
  /// resource, this operation updates the tag's value.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to tag.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
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

  /// Removes a tag from an IoT Greengrass resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys for tags to remove from the resource.
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

  /// Updates connectivity information for a Greengrass core device.
  ///
  /// Connectivity information includes endpoints and ports where client devices
  /// can connect to an MQTT broker on the core device. When a client device
  /// calls the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-discover-api.html">IoT
  /// Greengrass discovery API</a>, IoT Greengrass returns connectivity
  /// information for all of the core devices where the client device can
  /// connect. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/connect-client-devices.html">Connect
  /// client devices to core devices</a> in the <i>IoT Greengrass Version 2
  /// Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectivityInfo] :
  /// The connectivity information for the core device.
  ///
  /// Parameter [thingName] :
  /// The name of the core device. This is also the name of the IoT thing.
  Future<UpdateConnectivityInfoResponse> updateConnectivityInfo({
    required List<ConnectivityInfo> connectivityInfo,
    required String thingName,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectivityInfo': connectivityInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/connectivityInfo',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectivityInfoResponse.fromJson(response);
  }
}

/// Contains a request to associate a client device with a core device. The <a
/// href="https://docs.aws.amazon.com/greengrass/v2/APIReference/API_BatchAssociateClientDeviceWithCoreDevice.html">BatchAssociateClientDeviceWithCoreDevice</a>
/// operation consumes a list of these requests.
class AssociateClientDeviceWithCoreDeviceEntry {
  /// The name of the IoT thing that represents the client device to associate.
  final String thingName;

  AssociateClientDeviceWithCoreDeviceEntry({
    required this.thingName,
  });

  Map<String, dynamic> toJson() {
    final thingName = this.thingName;
    return {
      'thingName': thingName,
    };
  }
}

/// Contains an error that occurs from a request to associate a client device
/// with a core device. The <a
/// href="https://docs.aws.amazon.com/greengrass/v2/APIReference/API_BatchAssociateClientDeviceWithCoreDevice.html">BatchAssociateClientDeviceWithCoreDevice</a>
/// operation returns a list of these errors.
class AssociateClientDeviceWithCoreDeviceErrorEntry {
  /// The error code for the request.
  final String? code;

  /// A message that provides additional information about the error.
  final String? message;

  /// The name of the IoT thing whose associate request failed.
  final String? thingName;

  AssociateClientDeviceWithCoreDeviceErrorEntry({
    this.code,
    this.message,
    this.thingName,
  });

  factory AssociateClientDeviceWithCoreDeviceErrorEntry.fromJson(
      Map<String, dynamic> json) {
    return AssociateClientDeviceWithCoreDeviceErrorEntry(
      code: json['code'] as String?,
      message: json['message'] as String?,
      thingName: json['thingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final thingName = this.thingName;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (thingName != null) 'thingName': thingName,
    };
  }
}

class AssociateServiceRoleToAccountResponse {
  /// The time when the service role was associated with IoT Greengrass for your
  /// Amazon Web Services account in this Amazon Web Services Region.
  final String? associatedAt;

  AssociateServiceRoleToAccountResponse({
    this.associatedAt,
  });

  factory AssociateServiceRoleToAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateServiceRoleToAccountResponse(
      associatedAt: json['AssociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
    };
  }
}

/// Contains information about a client device that is associated to a core
/// device for cloud discovery.
class AssociatedClientDevice {
  /// The time that the client device was associated, expressed in ISO 8601
  /// format.
  final DateTime? associationTimestamp;

  /// The name of the IoT thing that represents the associated client device.
  final String? thingName;

  AssociatedClientDevice({
    this.associationTimestamp,
    this.thingName,
  });

  factory AssociatedClientDevice.fromJson(Map<String, dynamic> json) {
    return AssociatedClientDevice(
      associationTimestamp: timeStampFromJson(json['associationTimestamp']),
      thingName: json['thingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationTimestamp = this.associationTimestamp;
    final thingName = this.thingName;
    return {
      if (associationTimestamp != null)
        'associationTimestamp': unixTimestampToJson(associationTimestamp),
      if (thingName != null) 'thingName': thingName,
    };
  }
}

class BatchAssociateClientDeviceWithCoreDeviceResponse {
  /// The list of any errors for the entries in the request. Each error entry
  /// contains the name of the IoT thing that failed to associate.
  final List<AssociateClientDeviceWithCoreDeviceErrorEntry>? errorEntries;

  BatchAssociateClientDeviceWithCoreDeviceResponse({
    this.errorEntries,
  });

  factory BatchAssociateClientDeviceWithCoreDeviceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateClientDeviceWithCoreDeviceResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) => AssociateClientDeviceWithCoreDeviceErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

class BatchDisassociateClientDeviceFromCoreDeviceResponse {
  /// The list of any errors for the entries in the request. Each error entry
  /// contains the name of the IoT thing that failed to disassociate.
  final List<DisassociateClientDeviceFromCoreDeviceErrorEntry>? errorEntries;

  BatchDisassociateClientDeviceFromCoreDeviceResponse({
    this.errorEntries,
  });

  factory BatchDisassociateClientDeviceFromCoreDeviceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateClientDeviceFromCoreDeviceResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) => DisassociateClientDeviceFromCoreDeviceErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

class CancelDeploymentResponse {
  /// A message that communicates if the cancel was successful.
  final String? message;

  CancelDeploymentResponse({
    this.message,
  });

  factory CancelDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return CancelDeploymentResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

enum CloudComponentState {
  requested,
  initiated,
  deployable,
  failed,
  deprecated,
}

extension CloudComponentStateValueExtension on CloudComponentState {
  String toValue() {
    switch (this) {
      case CloudComponentState.requested:
        return 'REQUESTED';
      case CloudComponentState.initiated:
        return 'INITIATED';
      case CloudComponentState.deployable:
        return 'DEPLOYABLE';
      case CloudComponentState.failed:
        return 'FAILED';
      case CloudComponentState.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension CloudComponentStateFromString on String {
  CloudComponentState toCloudComponentState() {
    switch (this) {
      case 'REQUESTED':
        return CloudComponentState.requested;
      case 'INITIATED':
        return CloudComponentState.initiated;
      case 'DEPLOYABLE':
        return CloudComponentState.deployable;
      case 'FAILED':
        return CloudComponentState.failed;
      case 'DEPRECATED':
        return CloudComponentState.deprecated;
    }
    throw Exception('$this is not known in enum CloudComponentState');
  }
}

/// Contains the status of a component version in the IoT Greengrass service.
class CloudComponentStatus {
  /// The state of the component version.
  final CloudComponentState? componentState;

  /// A dictionary of errors that communicate why the component version is in an
  /// error state. For example, if IoT Greengrass can't access an artifact for the
  /// component version, then <code>errors</code> contains the artifact's URI as a
  /// key, and the error message as the value for that key.
  final Map<String, String>? errors;

  /// A message that communicates details, such as errors, about the status of the
  /// component version.
  final String? message;

  /// The vendor guidance state for the component version. This state indicates
  /// whether the component version has any issues that you should consider before
  /// you deploy it. The vendor guidance state can be:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – This component version is available and recommended
  /// for use.
  /// </li>
  /// <li>
  /// <code>DISCONTINUED</code> – This component version has been discontinued by
  /// its publisher. You can deploy this component version, but we recommend that
  /// you use a different version of this component.
  /// </li>
  /// <li>
  /// <code>DELETED</code> – This component version has been deleted by its
  /// publisher, so you can't deploy it. If you have any existing deployments that
  /// specify this component version, those deployments will fail.
  /// </li>
  /// </ul>
  final VendorGuidance? vendorGuidance;

  /// A message that communicates details about the vendor guidance state of the
  /// component version. This message communicates why a component version is
  /// discontinued or deleted.
  final String? vendorGuidanceMessage;

  CloudComponentStatus({
    this.componentState,
    this.errors,
    this.message,
    this.vendorGuidance,
    this.vendorGuidanceMessage,
  });

  factory CloudComponentStatus.fromJson(Map<String, dynamic> json) {
    return CloudComponentStatus(
      componentState:
          (json['componentState'] as String?)?.toCloudComponentState(),
      errors: (json['errors'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      message: json['message'] as String?,
      vendorGuidance: (json['vendorGuidance'] as String?)?.toVendorGuidance(),
      vendorGuidanceMessage: json['vendorGuidanceMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentState = this.componentState;
    final errors = this.errors;
    final message = this.message;
    final vendorGuidance = this.vendorGuidance;
    final vendorGuidanceMessage = this.vendorGuidanceMessage;
    return {
      if (componentState != null) 'componentState': componentState.toValue(),
      if (errors != null) 'errors': errors,
      if (message != null) 'message': message,
      if (vendorGuidance != null) 'vendorGuidance': vendorGuidance.toValue(),
      if (vendorGuidanceMessage != null)
        'vendorGuidanceMessage': vendorGuidanceMessage,
    };
  }
}

/// Contains information about a component.
class Component {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  /// The name of the component.
  final String? componentName;

  /// The latest version of the component and its details.
  final ComponentLatestVersion? latestVersion;

  Component({
    this.arn,
    this.componentName,
    this.latestVersion,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      arn: json['arn'] as String?,
      componentName: json['componentName'] as String?,
      latestVersion: json['latestVersion'] != null
          ? ComponentLatestVersion.fromJson(
              json['latestVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentName = this.componentName;
    final latestVersion = this.latestVersion;
    return {
      if (arn != null) 'arn': arn,
      if (componentName != null) 'componentName': componentName,
      if (latestVersion != null) 'latestVersion': latestVersion,
    };
  }
}

/// Contains information about a component that is a candidate to deploy to a
/// Greengrass core device.
class ComponentCandidate {
  /// The name of the component.
  final String? componentName;

  /// The version of the component.
  final String? componentVersion;

  /// The version requirements for the component's dependencies. Greengrass core
  /// devices get the version requirements from component recipes.
  ///
  /// IoT Greengrass V2 uses semantic version constraints. For more information,
  /// see <a href="https://semver.org/">Semantic Versioning</a>.
  final Map<String, String>? versionRequirements;

  ComponentCandidate({
    this.componentName,
    this.componentVersion,
    this.versionRequirements,
  });

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    final versionRequirements = this.versionRequirements;
    return {
      if (componentName != null) 'componentName': componentName,
      if (componentVersion != null) 'componentVersion': componentVersion,
      if (versionRequirements != null)
        'versionRequirements': versionRequirements,
    };
  }
}

/// Contains information about a deployment's update to a component's
/// configuration on Greengrass core devices. For more information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html">Update
/// component configurations</a> in the <i>IoT Greengrass V2 Developer
/// Guide</i>.
class ComponentConfigurationUpdate {
  /// A serialized JSON string that contains the configuration object to merge to
  /// target devices. The core device merges this configuration with the
  /// component's existing configuration. If this is the first time a component
  /// deploys on a device, the core device merges this configuration with the
  /// component's default configuration. This means that the core device keeps
  /// it's existing configuration for keys and values that you don't specify in
  /// this object. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html#merge-configuration-update">Merge
  /// configuration updates</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final String? merge;

  /// The list of configuration nodes to reset to default values on target
  /// devices. Use JSON pointers to specify each node to reset. JSON pointers
  /// start with a forward slash (<code>/</code>) and use forward slashes to
  /// separate the key for each level in the object. For more information, see the
  /// <a href="https://tools.ietf.org/html/rfc6901">JSON pointer specification</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html#reset-configuration-update">Reset
  /// configuration updates</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final List<String>? reset;

  ComponentConfigurationUpdate({
    this.merge,
    this.reset,
  });

  factory ComponentConfigurationUpdate.fromJson(Map<String, dynamic> json) {
    return ComponentConfigurationUpdate(
      merge: json['merge'] as String?,
      reset: (json['reset'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final merge = this.merge;
    final reset = this.reset;
    return {
      if (merge != null) 'merge': merge,
      if (reset != null) 'reset': reset,
    };
  }
}

/// Contains information about a component dependency for a Lambda function
/// component.
class ComponentDependencyRequirement {
  /// The type of this dependency. Choose from the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>SOFT</code> – The component doesn't restart if the dependency changes
  /// state.
  /// </li>
  /// <li>
  /// <code>HARD</code> – The component restarts if the dependency changes state.
  /// </li>
  /// </ul>
  /// Default: <code>HARD</code>
  final ComponentDependencyType? dependencyType;

  /// The component version requirement for the component dependency.
  ///
  /// IoT Greengrass V2 uses semantic version constraints. For more information,
  /// see <a href="https://semver.org/">Semantic Versioning</a>.
  final String? versionRequirement;

  ComponentDependencyRequirement({
    this.dependencyType,
    this.versionRequirement,
  });

  Map<String, dynamic> toJson() {
    final dependencyType = this.dependencyType;
    final versionRequirement = this.versionRequirement;
    return {
      if (dependencyType != null) 'dependencyType': dependencyType.toValue(),
      if (versionRequirement != null) 'versionRequirement': versionRequirement,
    };
  }
}

enum ComponentDependencyType {
  hard,
  soft,
}

extension ComponentDependencyTypeValueExtension on ComponentDependencyType {
  String toValue() {
    switch (this) {
      case ComponentDependencyType.hard:
        return 'HARD';
      case ComponentDependencyType.soft:
        return 'SOFT';
    }
  }
}

extension ComponentDependencyTypeFromString on String {
  ComponentDependencyType toComponentDependencyType() {
    switch (this) {
      case 'HARD':
        return ComponentDependencyType.hard;
      case 'SOFT':
        return ComponentDependencyType.soft;
    }
    throw Exception('$this is not known in enum ComponentDependencyType');
  }
}

/// Contains information about a component to deploy.
class ComponentDeploymentSpecification {
  /// The version of the component.
  final String componentVersion;

  /// The configuration updates to deploy for the component. You can define
  /// <i>reset</i> updates and <i>merge</i> updates. A reset updates the keys that
  /// you specify to the default configuration for the component. A merge updates
  /// the core device's component configuration with the keys and values that you
  /// specify. The IoT Greengrass Core software applies reset updates before it
  /// applies merge updates. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html">Update
  /// component configurations</a> in the <i>IoT Greengrass V2 Developer
  /// Guide</i>.
  final ComponentConfigurationUpdate? configurationUpdate;

  /// The system user and group that the IoT Greengrass Core software uses to run
  /// component processes on the core device. If you omit this parameter, the IoT
  /// Greengrass Core software uses the system user and group that you configure
  /// for the core device. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
  /// the user and group that run components</a> in the <i>IoT Greengrass V2
  /// Developer Guide</i>.
  final ComponentRunWith? runWith;

  ComponentDeploymentSpecification({
    required this.componentVersion,
    this.configurationUpdate,
    this.runWith,
  });

  factory ComponentDeploymentSpecification.fromJson(Map<String, dynamic> json) {
    return ComponentDeploymentSpecification(
      componentVersion: json['componentVersion'] as String,
      configurationUpdate: json['configurationUpdate'] != null
          ? ComponentConfigurationUpdate.fromJson(
              json['configurationUpdate'] as Map<String, dynamic>)
          : null,
      runWith: json['runWith'] != null
          ? ComponentRunWith.fromJson(json['runWith'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final componentVersion = this.componentVersion;
    final configurationUpdate = this.configurationUpdate;
    final runWith = this.runWith;
    return {
      'componentVersion': componentVersion,
      if (configurationUpdate != null)
        'configurationUpdate': configurationUpdate,
      if (runWith != null) 'runWith': runWith,
    };
  }
}

/// Contains information about the latest version of a component.
class ComponentLatestVersion {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  /// The version of the component.
  final String? componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  final DateTime? creationTimestamp;

  /// The description of the component version.
  final String? description;

  /// The platforms that the component version supports.
  final List<ComponentPlatform>? platforms;

  /// The publisher of the component version.
  final String? publisher;

  ComponentLatestVersion({
    this.arn,
    this.componentVersion,
    this.creationTimestamp,
    this.description,
    this.platforms,
    this.publisher,
  });

  factory ComponentLatestVersion.fromJson(Map<String, dynamic> json) {
    return ComponentLatestVersion(
      arn: json['arn'] as String?,
      componentVersion: json['componentVersion'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      description: json['description'] as String?,
      platforms: (json['platforms'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: json['publisher'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentVersion = this.componentVersion;
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final platforms = this.platforms;
    final publisher = this.publisher;
    return {
      if (arn != null) 'arn': arn,
      if (componentVersion != null) 'componentVersion': componentVersion,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (description != null) 'description': description,
      if (platforms != null) 'platforms': platforms,
      if (publisher != null) 'publisher': publisher,
    };
  }
}

/// Contains information about a platform that a component supports.
class ComponentPlatform {
  /// A dictionary of attributes for the platform. The IoT Greengrass Core
  /// software defines the <code>os</code> and <code>architecture</code> by
  /// default. You can specify additional platform attributes for a core device
  /// when you deploy the Greengrass nucleus component. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html">Greengrass
  /// nucleus component</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final Map<String, String>? attributes;

  /// The friendly name of the platform. This name helps you identify the
  /// platform.
  ///
  /// If you omit this parameter, IoT Greengrass creates a friendly name from the
  /// <code>os</code> and <code>architecture</code> of the platform.
  final String? name;

  ComponentPlatform({
    this.attributes,
    this.name,
  });

  factory ComponentPlatform.fromJson(Map<String, dynamic> json) {
    return ComponentPlatform(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    return {
      if (attributes != null) 'attributes': attributes,
      if (name != null) 'name': name,
    };
  }
}

/// Contains information system user and group that the IoT Greengrass Core
/// software uses to run component processes on the core device. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
/// the user and group that run components</a> in the <i>IoT Greengrass V2
/// Developer Guide</i>.
class ComponentRunWith {
  /// The POSIX system user and, optionally, group to use to run this component on
  /// Linux core devices. The user, and group if specified, must exist on each
  /// Linux core device. Specify the user and group separated by a colon
  /// (<code>:</code>) in the following format: <code>user:group</code>. The group
  /// is optional. If you don't specify a group, the IoT Greengrass Core software
  /// uses the primary user for the group.
  ///
  /// If you omit this parameter, the IoT Greengrass Core software uses the
  /// default system user and group that you configure on the Greengrass nucleus
  /// component. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
  /// the user and group that run components</a>.
  final String? posixUser;

  /// The system resource limits to apply to this component's process on the core
  /// device. IoT Greengrass currently supports this feature on only Linux core
  /// devices.
  ///
  /// If you omit this parameter, the IoT Greengrass Core software uses the
  /// default system resource limits that you configure on the Greengrass nucleus
  /// component. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-system-resource-limits">Configure
  /// system resource limits for components</a>.
  final SystemResourceLimits? systemResourceLimits;

  /// The Windows user to use to run this component on Windows core devices. The
  /// user must exist on each Windows core device, and its name and password must
  /// be in the LocalSystem account's Credentials Manager instance.
  ///
  /// If you omit this parameter, the IoT Greengrass Core software uses the
  /// default Windows user that you configure on the Greengrass nucleus component.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
  /// the user and group that run components</a>.
  final String? windowsUser;

  ComponentRunWith({
    this.posixUser,
    this.systemResourceLimits,
    this.windowsUser,
  });

  factory ComponentRunWith.fromJson(Map<String, dynamic> json) {
    return ComponentRunWith(
      posixUser: json['posixUser'] as String?,
      systemResourceLimits: json['systemResourceLimits'] != null
          ? SystemResourceLimits.fromJson(
              json['systemResourceLimits'] as Map<String, dynamic>)
          : null,
      windowsUser: json['windowsUser'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final posixUser = this.posixUser;
    final systemResourceLimits = this.systemResourceLimits;
    final windowsUser = this.windowsUser;
    return {
      if (posixUser != null) 'posixUser': posixUser,
      if (systemResourceLimits != null)
        'systemResourceLimits': systemResourceLimits,
      if (windowsUser != null) 'windowsUser': windowsUser,
    };
  }
}

/// Contains information about a component version in a list.
class ComponentVersionListItem {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  /// The name of the component.
  final String? componentName;

  /// The version of the component.
  final String? componentVersion;

  ComponentVersionListItem({
    this.arn,
    this.componentName,
    this.componentVersion,
  });

  factory ComponentVersionListItem.fromJson(Map<String, dynamic> json) {
    return ComponentVersionListItem(
      arn: json['arn'] as String?,
      componentName: json['componentName'] as String?,
      componentVersion: json['componentVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    return {
      if (arn != null) 'arn': arn,
      if (componentName != null) 'componentName': componentName,
      if (componentVersion != null) 'componentVersion': componentVersion,
    };
  }
}

enum ComponentVisibilityScope {
  private,
  public,
}

extension ComponentVisibilityScopeValueExtension on ComponentVisibilityScope {
  String toValue() {
    switch (this) {
      case ComponentVisibilityScope.private:
        return 'PRIVATE';
      case ComponentVisibilityScope.public:
        return 'PUBLIC';
    }
  }
}

extension ComponentVisibilityScopeFromString on String {
  ComponentVisibilityScope toComponentVisibilityScope() {
    switch (this) {
      case 'PRIVATE':
        return ComponentVisibilityScope.private;
      case 'PUBLIC':
        return ComponentVisibilityScope.public;
    }
    throw Exception('$this is not known in enum ComponentVisibilityScope');
  }
}

/// Contains information about an endpoint and port where client devices can
/// connect to an MQTT broker on a Greengrass core device.
class ConnectivityInfo {
  /// The IP address or DNS address where client devices can connect to an MQTT
  /// broker on the Greengrass core device.
  final String? hostAddress;

  /// An ID for the connectivity information.
  final String? id;

  /// Additional metadata to provide to client devices that connect to this core
  /// device.
  final String? metadata;

  /// The port where the MQTT broker operates on the core device. This port is
  /// typically 8883, which is the default port for the MQTT broker component that
  /// runs on core devices.
  final int? portNumber;

  ConnectivityInfo({
    this.hostAddress,
    this.id,
    this.metadata,
    this.portNumber,
  });

  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ConnectivityInfo(
      hostAddress: json['HostAddress'] as String?,
      id: json['Id'] as String?,
      metadata: json['Metadata'] as String?,
      portNumber: json['PortNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostAddress = this.hostAddress;
    final id = this.id;
    final metadata = this.metadata;
    final portNumber = this.portNumber;
    return {
      if (hostAddress != null) 'HostAddress': hostAddress,
      if (id != null) 'Id': id,
      if (metadata != null) 'Metadata': metadata,
      if (portNumber != null) 'PortNumber': portNumber,
    };
  }
}

/// Contains information about a Greengrass core device, which is an IoT thing
/// that runs the IoT Greengrass Core software.
class CoreDevice {
  /// The name of the core device. This is also the name of the IoT thing.
  final String? coreDeviceThingName;

  /// The time at which the core device's status last updated, expressed in ISO
  /// 8601 format.
  final DateTime? lastStatusUpdateTimestamp;

  /// The status of the core device. Core devices can have the following statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – The IoT Greengrass Core software and all components
  /// run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The IoT Greengrass Core software or a component is
  /// in a failed state on the core device.
  /// </li>
  /// </ul>
  final CoreDeviceStatus? status;

  CoreDevice({
    this.coreDeviceThingName,
    this.lastStatusUpdateTimestamp,
    this.status,
  });

  factory CoreDevice.fromJson(Map<String, dynamic> json) {
    return CoreDevice(
      coreDeviceThingName: json['coreDeviceThingName'] as String?,
      lastStatusUpdateTimestamp:
          timeStampFromJson(json['lastStatusUpdateTimestamp']),
      status: (json['status'] as String?)?.toCoreDeviceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final coreDeviceThingName = this.coreDeviceThingName;
    final lastStatusUpdateTimestamp = this.lastStatusUpdateTimestamp;
    final status = this.status;
    return {
      if (coreDeviceThingName != null)
        'coreDeviceThingName': coreDeviceThingName,
      if (lastStatusUpdateTimestamp != null)
        'lastStatusUpdateTimestamp':
            unixTimestampToJson(lastStatusUpdateTimestamp),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum CoreDeviceStatus {
  healthy,
  unhealthy,
}

extension CoreDeviceStatusValueExtension on CoreDeviceStatus {
  String toValue() {
    switch (this) {
      case CoreDeviceStatus.healthy:
        return 'HEALTHY';
      case CoreDeviceStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension CoreDeviceStatusFromString on String {
  CoreDeviceStatus toCoreDeviceStatus() {
    switch (this) {
      case 'HEALTHY':
        return CoreDeviceStatus.healthy;
      case 'UNHEALTHY':
        return CoreDeviceStatus.unhealthy;
    }
    throw Exception('$this is not known in enum CoreDeviceStatus');
  }
}

class CreateComponentVersionResponse {
  /// The name of the component.
  final String componentName;

  /// The version of the component.
  final String componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  final DateTime creationTimestamp;

  /// The status of the component version in IoT Greengrass V2. This status is
  /// different from the status of the component on a core device.
  final CloudComponentStatus status;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  CreateComponentVersionResponse({
    required this.componentName,
    required this.componentVersion,
    required this.creationTimestamp,
    required this.status,
    this.arn,
  });

  factory CreateComponentVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateComponentVersionResponse(
      componentName: json['componentName'] as String,
      componentVersion: json['componentVersion'] as String,
      creationTimestamp:
          nonNullableTimeStampFromJson(json['creationTimestamp'] as Object),
      status:
          CloudComponentStatus.fromJson(json['status'] as Map<String, dynamic>),
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    final creationTimestamp = this.creationTimestamp;
    final status = this.status;
    final arn = this.arn;
    return {
      'componentName': componentName,
      'componentVersion': componentVersion,
      'creationTimestamp': unixTimestampToJson(creationTimestamp),
      'status': status,
      if (arn != null) 'arn': arn,
    };
  }
}

class CreateDeploymentResponse {
  /// The ID of the deployment.
  final String? deploymentId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IoT job that applies the deployment to target devices.
  final String? iotJobArn;

  /// The ID of the IoT job that applies the deployment to target devices.
  final String? iotJobId;

  CreateDeploymentResponse({
    this.deploymentId,
    this.iotJobArn,
    this.iotJobId,
  });

  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResponse(
      deploymentId: json['deploymentId'] as String?,
      iotJobArn: json['iotJobArn'] as String?,
      iotJobId: json['iotJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final iotJobArn = this.iotJobArn;
    final iotJobId = this.iotJobId;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (iotJobArn != null) 'iotJobArn': iotJobArn,
      if (iotJobId != null) 'iotJobId': iotJobId,
    };
  }
}

/// Contains information about a deployment.
class Deployment {
  /// The time at which the deployment was created, expressed in ISO 8601 format.
  final DateTime? creationTimestamp;

  /// The ID of the deployment.
  final String? deploymentId;

  /// The name of the deployment.
  final String? deploymentName;

  /// The status of the deployment.
  final DeploymentStatus? deploymentStatus;

  /// Whether or not the deployment is the latest revision for its target.
  final bool? isLatestForTarget;

  /// The parent deployment's target <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// within a subdeployment.
  final String? parentTargetArn;

  /// The revision number of the deployment.
  final String? revisionId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target IoT thing or thing group. When creating a subdeployment, the
  /// targetARN can only be a thing group.
  final String? targetArn;

  Deployment({
    this.creationTimestamp,
    this.deploymentId,
    this.deploymentName,
    this.deploymentStatus,
    this.isLatestForTarget,
    this.parentTargetArn,
    this.revisionId,
    this.targetArn,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      deploymentId: json['deploymentId'] as String?,
      deploymentName: json['deploymentName'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      isLatestForTarget: json['isLatestForTarget'] as bool?,
      parentTargetArn: json['parentTargetArn'] as String?,
      revisionId: json['revisionId'] as String?,
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final deploymentId = this.deploymentId;
    final deploymentName = this.deploymentName;
    final deploymentStatus = this.deploymentStatus;
    final isLatestForTarget = this.isLatestForTarget;
    final parentTargetArn = this.parentTargetArn;
    final revisionId = this.revisionId;
    final targetArn = this.targetArn;
    return {
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentName != null) 'deploymentName': deploymentName,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (isLatestForTarget != null) 'isLatestForTarget': isLatestForTarget,
      if (parentTargetArn != null) 'parentTargetArn': parentTargetArn,
      if (revisionId != null) 'revisionId': revisionId,
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

/// Contains information about a deployment's policy that defines when
/// components are safe to update.
///
/// Each component on a device can report whether or not it's ready to update.
/// After a component and its dependencies are ready, they can apply the update
/// in the deployment. You can configure whether or not the deployment notifies
/// components of an update and waits for a response. You specify the amount of
/// time each component has to respond to the update notification.
class DeploymentComponentUpdatePolicy {
  /// Whether or not to notify components and wait for components to become safe
  /// to update. Choose from the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>NOTIFY_COMPONENTS</code> – The deployment notifies each component
  /// before it stops and updates that component. Components can use the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-subscribetocomponentupdates">SubscribeToComponentUpdates</a>
  /// IPC operation to receive these notifications. Then, components can respond
  /// with the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-defercomponentupdate">DeferComponentUpdate</a>
  /// IPC operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/create-deployments.html">Create
  /// deployments</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>SKIP_NOTIFY_COMPONENTS</code> – The deployment doesn't notify
  /// components or wait for them to be safe to update.
  /// </li>
  /// </ul>
  /// Default: <code>NOTIFY_COMPONENTS</code>
  final DeploymentComponentUpdatePolicyAction? action;

  /// The amount of time in seconds that each component on a device has to report
  /// that it's safe to update. If the component waits for longer than this
  /// timeout, then the deployment proceeds on the device.
  ///
  /// Default: <code>60</code>
  final int? timeoutInSeconds;

  DeploymentComponentUpdatePolicy({
    this.action,
    this.timeoutInSeconds,
  });

  factory DeploymentComponentUpdatePolicy.fromJson(Map<String, dynamic> json) {
    return DeploymentComponentUpdatePolicy(
      action: (json['action'] as String?)
          ?.toDeploymentComponentUpdatePolicyAction(),
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (action != null) 'action': action.toValue(),
      if (timeoutInSeconds != null) 'timeoutInSeconds': timeoutInSeconds,
    };
  }
}

enum DeploymentComponentUpdatePolicyAction {
  notifyComponents,
  skipNotifyComponents,
}

extension DeploymentComponentUpdatePolicyActionValueExtension
    on DeploymentComponentUpdatePolicyAction {
  String toValue() {
    switch (this) {
      case DeploymentComponentUpdatePolicyAction.notifyComponents:
        return 'NOTIFY_COMPONENTS';
      case DeploymentComponentUpdatePolicyAction.skipNotifyComponents:
        return 'SKIP_NOTIFY_COMPONENTS';
    }
  }
}

extension DeploymentComponentUpdatePolicyActionFromString on String {
  DeploymentComponentUpdatePolicyAction
      toDeploymentComponentUpdatePolicyAction() {
    switch (this) {
      case 'NOTIFY_COMPONENTS':
        return DeploymentComponentUpdatePolicyAction.notifyComponents;
      case 'SKIP_NOTIFY_COMPONENTS':
        return DeploymentComponentUpdatePolicyAction.skipNotifyComponents;
    }
    throw Exception(
        '$this is not known in enum DeploymentComponentUpdatePolicyAction');
  }
}

/// Contains information about how long a component on a core device can
/// validate its configuration updates before it times out. Components can use
/// the <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-subscribetovalidateconfigurationupdates">SubscribeToValidateConfigurationUpdates</a>
/// IPC operation to receive notifications when a deployment specifies a
/// configuration update. Then, components can respond with the <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-sendconfigurationvalidityreport">SendConfigurationValidityReport</a>
/// IPC operation. For more information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/create-deployments.html">Create
/// deployments</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
class DeploymentConfigurationValidationPolicy {
  /// The amount of time in seconds that a component can validate its
  /// configuration updates. If the validation time exceeds this timeout, then the
  /// deployment proceeds for the device.
  ///
  /// Default: <code>30</code>
  final int? timeoutInSeconds;

  DeploymentConfigurationValidationPolicy({
    this.timeoutInSeconds,
  });

  factory DeploymentConfigurationValidationPolicy.fromJson(
      Map<String, dynamic> json) {
    return DeploymentConfigurationValidationPolicy(
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (timeoutInSeconds != null) 'timeoutInSeconds': timeoutInSeconds,
    };
  }
}

enum DeploymentFailureHandlingPolicy {
  rollback,
  doNothing,
}

extension DeploymentFailureHandlingPolicyValueExtension
    on DeploymentFailureHandlingPolicy {
  String toValue() {
    switch (this) {
      case DeploymentFailureHandlingPolicy.rollback:
        return 'ROLLBACK';
      case DeploymentFailureHandlingPolicy.doNothing:
        return 'DO_NOTHING';
    }
  }
}

extension DeploymentFailureHandlingPolicyFromString on String {
  DeploymentFailureHandlingPolicy toDeploymentFailureHandlingPolicy() {
    switch (this) {
      case 'ROLLBACK':
        return DeploymentFailureHandlingPolicy.rollback;
      case 'DO_NOTHING':
        return DeploymentFailureHandlingPolicy.doNothing;
    }
    throw Exception(
        '$this is not known in enum DeploymentFailureHandlingPolicy');
  }
}

enum DeploymentHistoryFilter {
  all,
  latestOnly,
}

extension DeploymentHistoryFilterValueExtension on DeploymentHistoryFilter {
  String toValue() {
    switch (this) {
      case DeploymentHistoryFilter.all:
        return 'ALL';
      case DeploymentHistoryFilter.latestOnly:
        return 'LATEST_ONLY';
    }
  }
}

extension DeploymentHistoryFilterFromString on String {
  DeploymentHistoryFilter toDeploymentHistoryFilter() {
    switch (this) {
      case 'ALL':
        return DeploymentHistoryFilter.all;
      case 'LATEST_ONLY':
        return DeploymentHistoryFilter.latestOnly;
    }
    throw Exception('$this is not known in enum DeploymentHistoryFilter');
  }
}

/// Contains information about an IoT job configuration.
class DeploymentIoTJobConfiguration {
  /// The stop configuration for the job. This configuration defines when and how
  /// to stop a job rollout.
  final IoTJobAbortConfig? abortConfig;

  /// The rollout configuration for the job. This configuration defines the rate
  /// at which the job rolls out to the fleet of target devices.
  final IoTJobExecutionsRolloutConfig? jobExecutionsRolloutConfig;

  /// The timeout configuration for the job. This configuration defines the amount
  /// of time each device has to complete the job.
  final IoTJobTimeoutConfig? timeoutConfig;

  DeploymentIoTJobConfiguration({
    this.abortConfig,
    this.jobExecutionsRolloutConfig,
    this.timeoutConfig,
  });

  factory DeploymentIoTJobConfiguration.fromJson(Map<String, dynamic> json) {
    return DeploymentIoTJobConfiguration(
      abortConfig: json['abortConfig'] != null
          ? IoTJobAbortConfig.fromJson(
              json['abortConfig'] as Map<String, dynamic>)
          : null,
      jobExecutionsRolloutConfig: json['jobExecutionsRolloutConfig'] != null
          ? IoTJobExecutionsRolloutConfig.fromJson(
              json['jobExecutionsRolloutConfig'] as Map<String, dynamic>)
          : null,
      timeoutConfig: json['timeoutConfig'] != null
          ? IoTJobTimeoutConfig.fromJson(
              json['timeoutConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final abortConfig = this.abortConfig;
    final jobExecutionsRolloutConfig = this.jobExecutionsRolloutConfig;
    final timeoutConfig = this.timeoutConfig;
    return {
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
  }
}

/// Contains information about policies that define how a deployment updates
/// components and handles failure.
class DeploymentPolicies {
  /// The component update policy for the configuration deployment. This policy
  /// defines when it's safe to deploy the configuration to devices.
  final DeploymentComponentUpdatePolicy? componentUpdatePolicy;

  /// The configuration validation policy for the configuration deployment. This
  /// policy defines how long each component has to validate its configure
  /// updates.
  final DeploymentConfigurationValidationPolicy? configurationValidationPolicy;

  /// The failure handling policy for the configuration deployment. This policy
  /// defines what to do if the deployment fails.
  ///
  /// Default: <code>ROLLBACK</code>
  final DeploymentFailureHandlingPolicy? failureHandlingPolicy;

  DeploymentPolicies({
    this.componentUpdatePolicy,
    this.configurationValidationPolicy,
    this.failureHandlingPolicy,
  });

  factory DeploymentPolicies.fromJson(Map<String, dynamic> json) {
    return DeploymentPolicies(
      componentUpdatePolicy: json['componentUpdatePolicy'] != null
          ? DeploymentComponentUpdatePolicy.fromJson(
              json['componentUpdatePolicy'] as Map<String, dynamic>)
          : null,
      configurationValidationPolicy:
          json['configurationValidationPolicy'] != null
              ? DeploymentConfigurationValidationPolicy.fromJson(
                  json['configurationValidationPolicy'] as Map<String, dynamic>)
              : null,
      failureHandlingPolicy: (json['failureHandlingPolicy'] as String?)
          ?.toDeploymentFailureHandlingPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final componentUpdatePolicy = this.componentUpdatePolicy;
    final configurationValidationPolicy = this.configurationValidationPolicy;
    final failureHandlingPolicy = this.failureHandlingPolicy;
    return {
      if (componentUpdatePolicy != null)
        'componentUpdatePolicy': componentUpdatePolicy,
      if (configurationValidationPolicy != null)
        'configurationValidationPolicy': configurationValidationPolicy,
      if (failureHandlingPolicy != null)
        'failureHandlingPolicy': failureHandlingPolicy.toValue(),
    };
  }
}

enum DeploymentStatus {
  active,
  completed,
  canceled,
  failed,
  inactive,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.active:
        return 'ACTIVE';
      case DeploymentStatus.completed:
        return 'COMPLETED';
      case DeploymentStatus.canceled:
        return 'CANCELED';
      case DeploymentStatus.failed:
        return 'FAILED';
      case DeploymentStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'ACTIVE':
        return DeploymentStatus.active;
      case 'COMPLETED':
        return DeploymentStatus.completed;
      case 'CANCELED':
        return DeploymentStatus.canceled;
      case 'FAILED':
        return DeploymentStatus.failed;
      case 'INACTIVE':
        return DeploymentStatus.inactive;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

class DescribeComponentResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  /// The name of the component.
  final String? componentName;

  /// The version of the component.
  final String? componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  final DateTime? creationTimestamp;

  /// The description of the component version.
  final String? description;

  /// The platforms that the component version supports.
  final List<ComponentPlatform>? platforms;

  /// The publisher of the component version.
  final String? publisher;

  /// The status of the component version in IoT Greengrass V2. This status is
  /// different from the status of the component on a core device.
  final CloudComponentStatus? status;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final Map<String, String>? tags;

  DescribeComponentResponse({
    this.arn,
    this.componentName,
    this.componentVersion,
    this.creationTimestamp,
    this.description,
    this.platforms,
    this.publisher,
    this.status,
    this.tags,
  });

  factory DescribeComponentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeComponentResponse(
      arn: json['arn'] as String?,
      componentName: json['componentName'] as String?,
      componentVersion: json['componentVersion'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      description: json['description'] as String?,
      platforms: (json['platforms'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: json['publisher'] as String?,
      status: json['status'] != null
          ? CloudComponentStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final platforms = this.platforms;
    final publisher = this.publisher;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (componentName != null) 'componentName': componentName,
      if (componentVersion != null) 'componentVersion': componentVersion,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (description != null) 'description': description,
      if (platforms != null) 'platforms': platforms,
      if (publisher != null) 'publisher': publisher,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains a request to disassociate a client device from a core device. The
/// <a
/// href="https://docs.aws.amazon.com/greengrass/v2/APIReference/API_BatchDisassociateClientDeviceWithCoreDevice.html">BatchDisassociateClientDeviceWithCoreDevice</a>
/// operation consumes a list of these requests.
class DisassociateClientDeviceFromCoreDeviceEntry {
  /// The name of the IoT thing that represents the client device to disassociate.
  final String thingName;

  DisassociateClientDeviceFromCoreDeviceEntry({
    required this.thingName,
  });

  Map<String, dynamic> toJson() {
    final thingName = this.thingName;
    return {
      'thingName': thingName,
    };
  }
}

/// Contains an error that occurs from a request to disassociate a client device
/// from a core device. The <a
/// href="https://docs.aws.amazon.com/greengrass/v2/APIReference/API_BatchDisassociateClientDeviceWithCoreDevice.html">BatchDisassociateClientDeviceWithCoreDevice</a>
/// operation returns a list of these errors.
class DisassociateClientDeviceFromCoreDeviceErrorEntry {
  /// The error code for the request.
  final String? code;

  /// A message that provides additional information about the error.
  final String? message;

  /// The name of the IoT thing whose disassociate request failed.
  final String? thingName;

  DisassociateClientDeviceFromCoreDeviceErrorEntry({
    this.code,
    this.message,
    this.thingName,
  });

  factory DisassociateClientDeviceFromCoreDeviceErrorEntry.fromJson(
      Map<String, dynamic> json) {
    return DisassociateClientDeviceFromCoreDeviceErrorEntry(
      code: json['code'] as String?,
      message: json['message'] as String?,
      thingName: json['thingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final thingName = this.thingName;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (thingName != null) 'thingName': thingName,
    };
  }
}

class DisassociateServiceRoleFromAccountResponse {
  /// The time when the service role was disassociated from IoT Greengrass for
  /// your Amazon Web Services account in this Amazon Web Services Region.
  final String? disassociatedAt;

  DisassociateServiceRoleFromAccountResponse({
    this.disassociatedAt,
  });

  factory DisassociateServiceRoleFromAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateServiceRoleFromAccountResponse(
      disassociatedAt: json['DisassociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disassociatedAt = this.disassociatedAt;
    return {
      if (disassociatedAt != null) 'DisassociatedAt': disassociatedAt,
    };
  }
}

/// Contains information about a deployment job that IoT Greengrass sends to a
/// Greengrass core device.
class EffectiveDeployment {
  /// The status of the deployment job on the Greengrass core device.
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> – The deployment job is running.
  /// </li>
  /// <li>
  /// <code>QUEUED</code> – The deployment job is in the job queue and waiting to
  /// run.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – The deployment failed. For more information, see the
  /// <code>statusDetails</code> field.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> – The deployment to an IoT thing was completed
  /// successfully.
  /// </li>
  /// <li>
  /// <code>TIMED_OUT</code> – The deployment didn't complete in the allotted
  /// time.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> – The deployment was canceled by the user.
  /// </li>
  /// <li>
  /// <code>REJECTED</code> – The deployment was rejected. For more information,
  /// see the <code>statusDetails</code> field.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> – The deployment to an IoT thing group was completed
  /// successfully.
  /// </li>
  /// </ul>
  final EffectiveDeploymentExecutionStatus coreDeviceExecutionStatus;

  /// The time at which the deployment was created, expressed in ISO 8601 format.
  final DateTime creationTimestamp;

  /// The ID of the deployment.
  final String deploymentId;

  /// The name of the deployment.
  final String deploymentName;

  /// The time at which the deployment job was last modified, expressed in ISO
  /// 8601 format.
  final DateTime modifiedTimestamp;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target IoT thing or thing group.
  final String targetArn;

  /// The description of the deployment job.
  final String? description;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IoT job that applies the deployment to target devices.
  final String? iotJobArn;

  /// The ID of the IoT job that applies the deployment to target devices.
  final String? iotJobId;

  /// The reason code for the update, if the job was updated.
  final String? reason;

  /// The status details that explain why a deployment has an error. This response
  /// will be null if the deployment is in a success state.
  final EffectiveDeploymentStatusDetails? statusDetails;

  EffectiveDeployment({
    required this.coreDeviceExecutionStatus,
    required this.creationTimestamp,
    required this.deploymentId,
    required this.deploymentName,
    required this.modifiedTimestamp,
    required this.targetArn,
    this.description,
    this.iotJobArn,
    this.iotJobId,
    this.reason,
    this.statusDetails,
  });

  factory EffectiveDeployment.fromJson(Map<String, dynamic> json) {
    return EffectiveDeployment(
      coreDeviceExecutionStatus: (json['coreDeviceExecutionStatus'] as String)
          .toEffectiveDeploymentExecutionStatus(),
      creationTimestamp:
          nonNullableTimeStampFromJson(json['creationTimestamp'] as Object),
      deploymentId: json['deploymentId'] as String,
      deploymentName: json['deploymentName'] as String,
      modifiedTimestamp:
          nonNullableTimeStampFromJson(json['modifiedTimestamp'] as Object),
      targetArn: json['targetArn'] as String,
      description: json['description'] as String?,
      iotJobArn: json['iotJobArn'] as String?,
      iotJobId: json['iotJobId'] as String?,
      reason: json['reason'] as String?,
      statusDetails: json['statusDetails'] != null
          ? EffectiveDeploymentStatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreDeviceExecutionStatus = this.coreDeviceExecutionStatus;
    final creationTimestamp = this.creationTimestamp;
    final deploymentId = this.deploymentId;
    final deploymentName = this.deploymentName;
    final modifiedTimestamp = this.modifiedTimestamp;
    final targetArn = this.targetArn;
    final description = this.description;
    final iotJobArn = this.iotJobArn;
    final iotJobId = this.iotJobId;
    final reason = this.reason;
    final statusDetails = this.statusDetails;
    return {
      'coreDeviceExecutionStatus': coreDeviceExecutionStatus.toValue(),
      'creationTimestamp': unixTimestampToJson(creationTimestamp),
      'deploymentId': deploymentId,
      'deploymentName': deploymentName,
      'modifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      'targetArn': targetArn,
      if (description != null) 'description': description,
      if (iotJobArn != null) 'iotJobArn': iotJobArn,
      if (iotJobId != null) 'iotJobId': iotJobId,
      if (reason != null) 'reason': reason,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

enum EffectiveDeploymentExecutionStatus {
  inProgress,
  queued,
  failed,
  completed,
  timedOut,
  canceled,
  rejected,
  succeeded,
}

extension EffectiveDeploymentExecutionStatusValueExtension
    on EffectiveDeploymentExecutionStatus {
  String toValue() {
    switch (this) {
      case EffectiveDeploymentExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case EffectiveDeploymentExecutionStatus.queued:
        return 'QUEUED';
      case EffectiveDeploymentExecutionStatus.failed:
        return 'FAILED';
      case EffectiveDeploymentExecutionStatus.completed:
        return 'COMPLETED';
      case EffectiveDeploymentExecutionStatus.timedOut:
        return 'TIMED_OUT';
      case EffectiveDeploymentExecutionStatus.canceled:
        return 'CANCELED';
      case EffectiveDeploymentExecutionStatus.rejected:
        return 'REJECTED';
      case EffectiveDeploymentExecutionStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension EffectiveDeploymentExecutionStatusFromString on String {
  EffectiveDeploymentExecutionStatus toEffectiveDeploymentExecutionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return EffectiveDeploymentExecutionStatus.inProgress;
      case 'QUEUED':
        return EffectiveDeploymentExecutionStatus.queued;
      case 'FAILED':
        return EffectiveDeploymentExecutionStatus.failed;
      case 'COMPLETED':
        return EffectiveDeploymentExecutionStatus.completed;
      case 'TIMED_OUT':
        return EffectiveDeploymentExecutionStatus.timedOut;
      case 'CANCELED':
        return EffectiveDeploymentExecutionStatus.canceled;
      case 'REJECTED':
        return EffectiveDeploymentExecutionStatus.rejected;
      case 'SUCCEEDED':
        return EffectiveDeploymentExecutionStatus.succeeded;
    }
    throw Exception(
        '$this is not known in enum EffectiveDeploymentExecutionStatus');
  }
}

/// Contains all error-related information for the deployment record. The status
/// details will be null if the deployment is in a success state.
/// <note>
/// Greengrass nucleus v2.8.0 or later is required to get an accurate
/// <code>errorStack</code> and <code>errorTypes</code> response. This field
/// will not be returned for earlier Greengrass nucleus versions.
/// </note>
class EffectiveDeploymentStatusDetails {
  /// Contains an ordered list of short error codes that range from the most
  /// generic error to the most specific one. The error codes describe the reason
  /// for failure whenever the <code>coreDeviceExecutionStatus</code> is in a
  /// failed state. The response will be an empty list if there is no error.
  final List<String>? errorStack;

  /// Contains tags which describe the error. You can use the error types to
  /// classify errors to assist with remediating the failure. The response will be
  /// an empty list if there is no error.
  final List<String>? errorTypes;

  EffectiveDeploymentStatusDetails({
    this.errorStack,
    this.errorTypes,
  });

  factory EffectiveDeploymentStatusDetails.fromJson(Map<String, dynamic> json) {
    return EffectiveDeploymentStatusDetails(
      errorStack: (json['errorStack'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      errorTypes: (json['errorTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorStack = this.errorStack;
    final errorTypes = this.errorTypes;
    return {
      if (errorStack != null) 'errorStack': errorStack,
      if (errorTypes != null) 'errorTypes': errorTypes,
    };
  }
}

class GetComponentResponse {
  /// The recipe of the component version.
  final Uint8List recipe;

  /// The format of the recipe.
  final RecipeOutputFormat recipeOutputFormat;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final Map<String, String>? tags;

  GetComponentResponse({
    required this.recipe,
    required this.recipeOutputFormat,
    this.tags,
  });

  factory GetComponentResponse.fromJson(Map<String, dynamic> json) {
    return GetComponentResponse(
      recipe: _s.decodeUint8List(json['recipe']! as String),
      recipeOutputFormat:
          (json['recipeOutputFormat'] as String).toRecipeOutputFormat(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final recipe = this.recipe;
    final recipeOutputFormat = this.recipeOutputFormat;
    final tags = this.tags;
    return {
      'recipe': base64Encode(recipe),
      'recipeOutputFormat': recipeOutputFormat.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class GetComponentVersionArtifactResponse {
  /// The URL of the artifact.
  final String preSignedUrl;

  GetComponentVersionArtifactResponse({
    required this.preSignedUrl,
  });

  factory GetComponentVersionArtifactResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComponentVersionArtifactResponse(
      preSignedUrl: json['preSignedUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final preSignedUrl = this.preSignedUrl;
    return {
      'preSignedUrl': preSignedUrl,
    };
  }
}

class GetConnectivityInfoResponse {
  /// The connectivity information for the core device.
  final List<ConnectivityInfo>? connectivityInfo;

  /// A message about the connectivity information request.
  final String? message;

  GetConnectivityInfoResponse({
    this.connectivityInfo,
    this.message,
  });

  factory GetConnectivityInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectivityInfoResponse(
      connectivityInfo: (json['ConnectivityInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectivityInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectivityInfo = this.connectivityInfo;
    final message = this.message;
    return {
      if (connectivityInfo != null) 'ConnectivityInfo': connectivityInfo,
      if (message != null) 'Message': message,
    };
  }
}

class GetCoreDeviceResponse {
  /// The computer architecture of the core device.
  final String? architecture;

  /// The name of the core device. This is also the name of the IoT thing.
  final String? coreDeviceThingName;

  /// The version of the IoT Greengrass Core software that the core device runs.
  /// This version is equivalent to the version of the Greengrass nucleus
  /// component that runs on the core device. For more information, see the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html">Greengrass
  /// nucleus component</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final String? coreVersion;

  /// The time at which the core device's status last updated, expressed in ISO
  /// 8601 format.
  final DateTime? lastStatusUpdateTimestamp;

  /// The operating system platform that the core device runs.
  final String? platform;

  /// The status of the core device. The core device status can be:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – The IoT Greengrass Core software and all components
  /// run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The IoT Greengrass Core software or a component is
  /// in a failed state on the core device.
  /// </li>
  /// </ul>
  final CoreDeviceStatus? status;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final Map<String, String>? tags;

  GetCoreDeviceResponse({
    this.architecture,
    this.coreDeviceThingName,
    this.coreVersion,
    this.lastStatusUpdateTimestamp,
    this.platform,
    this.status,
    this.tags,
  });

  factory GetCoreDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreDeviceResponse(
      architecture: json['architecture'] as String?,
      coreDeviceThingName: json['coreDeviceThingName'] as String?,
      coreVersion: json['coreVersion'] as String?,
      lastStatusUpdateTimestamp:
          timeStampFromJson(json['lastStatusUpdateTimestamp']),
      platform: json['platform'] as String?,
      status: (json['status'] as String?)?.toCoreDeviceStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final coreDeviceThingName = this.coreDeviceThingName;
    final coreVersion = this.coreVersion;
    final lastStatusUpdateTimestamp = this.lastStatusUpdateTimestamp;
    final platform = this.platform;
    final status = this.status;
    final tags = this.tags;
    return {
      if (architecture != null) 'architecture': architecture,
      if (coreDeviceThingName != null)
        'coreDeviceThingName': coreDeviceThingName,
      if (coreVersion != null) 'coreVersion': coreVersion,
      if (lastStatusUpdateTimestamp != null)
        'lastStatusUpdateTimestamp':
            unixTimestampToJson(lastStatusUpdateTimestamp),
      if (platform != null) 'platform': platform,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class GetDeploymentResponse {
  /// The components to deploy. This is a dictionary, where each key is the name
  /// of a component, and each key's value is the version and configuration to
  /// deploy for that component.
  final Map<String, ComponentDeploymentSpecification>? components;

  /// The time at which the deployment was created, expressed in ISO 8601 format.
  final DateTime? creationTimestamp;

  /// The ID of the deployment.
  final String? deploymentId;

  /// The name of the deployment.
  final String? deploymentName;

  /// The deployment policies for the deployment. These policies define how the
  /// deployment updates components and handles failure.
  final DeploymentPolicies? deploymentPolicies;

  /// The status of the deployment.
  final DeploymentStatus? deploymentStatus;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IoT job that applies the deployment to target devices.
  final String? iotJobArn;

  /// The job configuration for the deployment configuration. The job
  /// configuration specifies the rollout, timeout, and stop configurations for
  /// the deployment configuration.
  final DeploymentIoTJobConfiguration? iotJobConfiguration;

  /// The ID of the IoT job that applies the deployment to target devices.
  final String? iotJobId;

  /// Whether or not the deployment is the latest revision for its target.
  final bool? isLatestForTarget;

  /// The parent deployment's target <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// within a subdeployment.
  final String? parentTargetArn;

  /// The revision number of the deployment.
  final String? revisionId;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
  final Map<String, String>? tags;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target IoT thing or thing group.
  final String? targetArn;

  GetDeploymentResponse({
    this.components,
    this.creationTimestamp,
    this.deploymentId,
    this.deploymentName,
    this.deploymentPolicies,
    this.deploymentStatus,
    this.iotJobArn,
    this.iotJobConfiguration,
    this.iotJobId,
    this.isLatestForTarget,
    this.parentTargetArn,
    this.revisionId,
    this.tags,
    this.targetArn,
  });

  factory GetDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return GetDeploymentResponse(
      components: (json['components'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              ComponentDeploymentSpecification.fromJson(
                  e as Map<String, dynamic>))),
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      deploymentId: json['deploymentId'] as String?,
      deploymentName: json['deploymentName'] as String?,
      deploymentPolicies: json['deploymentPolicies'] != null
          ? DeploymentPolicies.fromJson(
              json['deploymentPolicies'] as Map<String, dynamic>)
          : null,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      iotJobArn: json['iotJobArn'] as String?,
      iotJobConfiguration: json['iotJobConfiguration'] != null
          ? DeploymentIoTJobConfiguration.fromJson(
              json['iotJobConfiguration'] as Map<String, dynamic>)
          : null,
      iotJobId: json['iotJobId'] as String?,
      isLatestForTarget: json['isLatestForTarget'] as bool?,
      parentTargetArn: json['parentTargetArn'] as String?,
      revisionId: json['revisionId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final creationTimestamp = this.creationTimestamp;
    final deploymentId = this.deploymentId;
    final deploymentName = this.deploymentName;
    final deploymentPolicies = this.deploymentPolicies;
    final deploymentStatus = this.deploymentStatus;
    final iotJobArn = this.iotJobArn;
    final iotJobConfiguration = this.iotJobConfiguration;
    final iotJobId = this.iotJobId;
    final isLatestForTarget = this.isLatestForTarget;
    final parentTargetArn = this.parentTargetArn;
    final revisionId = this.revisionId;
    final tags = this.tags;
    final targetArn = this.targetArn;
    return {
      if (components != null) 'components': components,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentName != null) 'deploymentName': deploymentName,
      if (deploymentPolicies != null) 'deploymentPolicies': deploymentPolicies,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (iotJobArn != null) 'iotJobArn': iotJobArn,
      if (iotJobConfiguration != null)
        'iotJobConfiguration': iotJobConfiguration,
      if (iotJobId != null) 'iotJobId': iotJobId,
      if (isLatestForTarget != null) 'isLatestForTarget': isLatestForTarget,
      if (parentTargetArn != null) 'parentTargetArn': parentTargetArn,
      if (revisionId != null) 'revisionId': revisionId,
      if (tags != null) 'tags': tags,
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

class GetServiceRoleForAccountResponse {
  /// The time when the service role was associated with IoT Greengrass for your
  /// Amazon Web Services account in this Amazon Web Services Region.
  final String? associatedAt;

  /// The ARN of the service role that is associated with IoT Greengrass for your
  /// Amazon Web Services account in this Amazon Web Services Region.
  final String? roleArn;

  GetServiceRoleForAccountResponse({
    this.associatedAt,
    this.roleArn,
  });

  factory GetServiceRoleForAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceRoleForAccountResponse(
      associatedAt: json['AssociatedAt'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    final roleArn = this.roleArn;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Contains information about a component on a Greengrass core device.
class InstalledComponent {
  /// The name of the component.
  final String? componentName;

  /// The version of the component.
  final String? componentVersion;

  /// Whether or not the component is a root component.
  final bool? isRoot;

  /// The most recent deployment source that brought the component to the
  /// Greengrass core device. For a thing group deployment or thing deployment,
  /// the source will be the ID of the last deployment that contained the
  /// component. For local deployments it will be <code>LOCAL</code>.
  /// <note>
  /// Any deployment will attempt to reinstall currently broken components on the
  /// device, which will update the last installation source.
  /// </note>
  final String? lastInstallationSource;

  /// The last time the Greengrass core device sent a message containing a
  /// component's state to the Amazon Web Services Cloud.
  ///
  /// A component does not need to see a state change for this field to update.
  final DateTime? lastReportedTimestamp;

  /// The status of how current the data is.
  ///
  /// This response is based off of component state changes. The status reflects
  /// component disruptions and deployments. If a component only sees a
  /// configuration update during a deployment, it might not undergo a state
  /// change and this status would not be updated.
  final DateTime? lastStatusChangeTimestamp;

  /// The lifecycle state of the component.
  final InstalledComponentLifecycleState? lifecycleState;

  /// A detailed response about the lifecycle state of the component that explains
  /// the reason why a component has an error or is broken.
  final String? lifecycleStateDetails;

  /// The status codes that indicate the reason for failure whenever the
  /// <code>lifecycleState</code> has an error or is in a broken state.
  /// <note>
  /// Greengrass nucleus v2.8.0 or later is required to get an accurate
  /// <code>lifecycleStatusCodes</code> response. This response can be inaccurate
  /// in earlier Greengrass nucleus versions.
  /// </note>
  final List<String>? lifecycleStatusCodes;

  InstalledComponent({
    this.componentName,
    this.componentVersion,
    this.isRoot,
    this.lastInstallationSource,
    this.lastReportedTimestamp,
    this.lastStatusChangeTimestamp,
    this.lifecycleState,
    this.lifecycleStateDetails,
    this.lifecycleStatusCodes,
  });

  factory InstalledComponent.fromJson(Map<String, dynamic> json) {
    return InstalledComponent(
      componentName: json['componentName'] as String?,
      componentVersion: json['componentVersion'] as String?,
      isRoot: json['isRoot'] as bool?,
      lastInstallationSource: json['lastInstallationSource'] as String?,
      lastReportedTimestamp: timeStampFromJson(json['lastReportedTimestamp']),
      lastStatusChangeTimestamp:
          timeStampFromJson(json['lastStatusChangeTimestamp']),
      lifecycleState: (json['lifecycleState'] as String?)
          ?.toInstalledComponentLifecycleState(),
      lifecycleStateDetails: json['lifecycleStateDetails'] as String?,
      lifecycleStatusCodes: (json['lifecycleStatusCodes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    final isRoot = this.isRoot;
    final lastInstallationSource = this.lastInstallationSource;
    final lastReportedTimestamp = this.lastReportedTimestamp;
    final lastStatusChangeTimestamp = this.lastStatusChangeTimestamp;
    final lifecycleState = this.lifecycleState;
    final lifecycleStateDetails = this.lifecycleStateDetails;
    final lifecycleStatusCodes = this.lifecycleStatusCodes;
    return {
      if (componentName != null) 'componentName': componentName,
      if (componentVersion != null) 'componentVersion': componentVersion,
      if (isRoot != null) 'isRoot': isRoot,
      if (lastInstallationSource != null)
        'lastInstallationSource': lastInstallationSource,
      if (lastReportedTimestamp != null)
        'lastReportedTimestamp': unixTimestampToJson(lastReportedTimestamp),
      if (lastStatusChangeTimestamp != null)
        'lastStatusChangeTimestamp':
            unixTimestampToJson(lastStatusChangeTimestamp),
      if (lifecycleState != null) 'lifecycleState': lifecycleState.toValue(),
      if (lifecycleStateDetails != null)
        'lifecycleStateDetails': lifecycleStateDetails,
      if (lifecycleStatusCodes != null)
        'lifecycleStatusCodes': lifecycleStatusCodes,
    };
  }
}

enum InstalledComponentLifecycleState {
  $new,
  installed,
  starting,
  running,
  stopping,
  errored,
  broken,
  finished,
}

extension InstalledComponentLifecycleStateValueExtension
    on InstalledComponentLifecycleState {
  String toValue() {
    switch (this) {
      case InstalledComponentLifecycleState.$new:
        return 'NEW';
      case InstalledComponentLifecycleState.installed:
        return 'INSTALLED';
      case InstalledComponentLifecycleState.starting:
        return 'STARTING';
      case InstalledComponentLifecycleState.running:
        return 'RUNNING';
      case InstalledComponentLifecycleState.stopping:
        return 'STOPPING';
      case InstalledComponentLifecycleState.errored:
        return 'ERRORED';
      case InstalledComponentLifecycleState.broken:
        return 'BROKEN';
      case InstalledComponentLifecycleState.finished:
        return 'FINISHED';
    }
  }
}

extension InstalledComponentLifecycleStateFromString on String {
  InstalledComponentLifecycleState toInstalledComponentLifecycleState() {
    switch (this) {
      case 'NEW':
        return InstalledComponentLifecycleState.$new;
      case 'INSTALLED':
        return InstalledComponentLifecycleState.installed;
      case 'STARTING':
        return InstalledComponentLifecycleState.starting;
      case 'RUNNING':
        return InstalledComponentLifecycleState.running;
      case 'STOPPING':
        return InstalledComponentLifecycleState.stopping;
      case 'ERRORED':
        return InstalledComponentLifecycleState.errored;
      case 'BROKEN':
        return InstalledComponentLifecycleState.broken;
      case 'FINISHED':
        return InstalledComponentLifecycleState.finished;
    }
    throw Exception(
        '$this is not known in enum InstalledComponentLifecycleState');
  }
}

enum InstalledComponentTopologyFilter {
  all,
  root,
}

extension InstalledComponentTopologyFilterValueExtension
    on InstalledComponentTopologyFilter {
  String toValue() {
    switch (this) {
      case InstalledComponentTopologyFilter.all:
        return 'ALL';
      case InstalledComponentTopologyFilter.root:
        return 'ROOT';
    }
  }
}

extension InstalledComponentTopologyFilterFromString on String {
  InstalledComponentTopologyFilter toInstalledComponentTopologyFilter() {
    switch (this) {
      case 'ALL':
        return InstalledComponentTopologyFilter.all;
      case 'ROOT':
        return InstalledComponentTopologyFilter.root;
    }
    throw Exception(
        '$this is not known in enum InstalledComponentTopologyFilter');
  }
}

enum IoTJobAbortAction {
  cancel,
}

extension IoTJobAbortActionValueExtension on IoTJobAbortAction {
  String toValue() {
    switch (this) {
      case IoTJobAbortAction.cancel:
        return 'CANCEL';
    }
  }
}

extension IoTJobAbortActionFromString on String {
  IoTJobAbortAction toIoTJobAbortAction() {
    switch (this) {
      case 'CANCEL':
        return IoTJobAbortAction.cancel;
    }
    throw Exception('$this is not known in enum IoTJobAbortAction');
  }
}

/// Contains a list of criteria that define when and how to cancel a
/// configuration deployment.
class IoTJobAbortConfig {
  /// The list of criteria that define when and how to cancel the configuration
  /// deployment.
  final List<IoTJobAbortCriteria> criteriaList;

  IoTJobAbortConfig({
    required this.criteriaList,
  });

  factory IoTJobAbortConfig.fromJson(Map<String, dynamic> json) {
    return IoTJobAbortConfig(
      criteriaList: (json['criteriaList'] as List)
          .whereNotNull()
          .map((e) => IoTJobAbortCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final criteriaList = this.criteriaList;
    return {
      'criteriaList': criteriaList,
    };
  }
}

/// Contains criteria that define when and how to cancel a job.
///
/// The deployment stops if the following conditions are true:
/// <ol>
/// <li>
/// The number of things that receive the deployment exceeds the
/// <code>minNumberOfExecutedThings</code>.
/// </li>
/// <li>
/// The percentage of failures with type <code>failureType</code> exceeds the
/// <code>thresholdPercentage</code>.
/// </li> </ol>
class IoTJobAbortCriteria {
  /// The action to perform when the criteria are met.
  final IoTJobAbortAction action;

  /// The type of job deployment failure that can cancel a job.
  final IoTJobExecutionFailureType failureType;

  /// The minimum number of things that receive the configuration before the job
  /// can cancel.
  final int minNumberOfExecutedThings;

  /// The minimum percentage of <code>failureType</code> failures that occur
  /// before the job can cancel.
  ///
  /// This parameter supports up to two digits after the decimal (for example, you
  /// can specify <code>10.9</code> or <code>10.99</code>, but not
  /// <code>10.999</code>).
  final double thresholdPercentage;

  IoTJobAbortCriteria({
    required this.action,
    required this.failureType,
    required this.minNumberOfExecutedThings,
    required this.thresholdPercentage,
  });

  factory IoTJobAbortCriteria.fromJson(Map<String, dynamic> json) {
    return IoTJobAbortCriteria(
      action: (json['action'] as String).toIoTJobAbortAction(),
      failureType:
          (json['failureType'] as String).toIoTJobExecutionFailureType(),
      minNumberOfExecutedThings: json['minNumberOfExecutedThings'] as int,
      thresholdPercentage: json['thresholdPercentage'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final failureType = this.failureType;
    final minNumberOfExecutedThings = this.minNumberOfExecutedThings;
    final thresholdPercentage = this.thresholdPercentage;
    return {
      'action': action.toValue(),
      'failureType': failureType.toValue(),
      'minNumberOfExecutedThings': minNumberOfExecutedThings,
      'thresholdPercentage': thresholdPercentage,
    };
  }
}

enum IoTJobExecutionFailureType {
  failed,
  rejected,
  timedOut,
  all,
}

extension IoTJobExecutionFailureTypeValueExtension
    on IoTJobExecutionFailureType {
  String toValue() {
    switch (this) {
      case IoTJobExecutionFailureType.failed:
        return 'FAILED';
      case IoTJobExecutionFailureType.rejected:
        return 'REJECTED';
      case IoTJobExecutionFailureType.timedOut:
        return 'TIMED_OUT';
      case IoTJobExecutionFailureType.all:
        return 'ALL';
    }
  }
}

extension IoTJobExecutionFailureTypeFromString on String {
  IoTJobExecutionFailureType toIoTJobExecutionFailureType() {
    switch (this) {
      case 'FAILED':
        return IoTJobExecutionFailureType.failed;
      case 'REJECTED':
        return IoTJobExecutionFailureType.rejected;
      case 'TIMED_OUT':
        return IoTJobExecutionFailureType.timedOut;
      case 'ALL':
        return IoTJobExecutionFailureType.all;
    }
    throw Exception('$this is not known in enum IoTJobExecutionFailureType');
  }
}

/// Contains information about the rollout configuration for a job. This
/// configuration defines the rate at which the job deploys a configuration to a
/// fleet of target devices.
class IoTJobExecutionsRolloutConfig {
  /// The exponential rate to increase the job rollout rate.
  final IoTJobExponentialRolloutRate? exponentialRate;

  /// The maximum number of devices that receive a pending job notification, per
  /// minute.
  final int? maximumPerMinute;

  IoTJobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });

  factory IoTJobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) {
    return IoTJobExecutionsRolloutConfig(
      exponentialRate: json['exponentialRate'] != null
          ? IoTJobExponentialRolloutRate.fromJson(
              json['exponentialRate'] as Map<String, dynamic>)
          : null,
      maximumPerMinute: json['maximumPerMinute'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final exponentialRate = this.exponentialRate;
    final maximumPerMinute = this.maximumPerMinute;
    return {
      if (exponentialRate != null) 'exponentialRate': exponentialRate,
      if (maximumPerMinute != null) 'maximumPerMinute': maximumPerMinute,
    };
  }
}

/// Contains information about an exponential rollout rate for a configuration
/// deployment job.
class IoTJobExponentialRolloutRate {
  /// The minimum number of devices that receive a pending job notification, per
  /// minute, when the job starts. This parameter defines the initial rollout rate
  /// of the job.
  final int baseRatePerMinute;

  /// The exponential factor to increase the rollout rate for the job.
  ///
  /// This parameter supports up to one digit after the decimal (for example, you
  /// can specify <code>1.5</code>, but not <code>1.55</code>).
  final double incrementFactor;

  /// The criteria to increase the rollout rate for the job.
  final IoTJobRateIncreaseCriteria rateIncreaseCriteria;

  IoTJobExponentialRolloutRate({
    required this.baseRatePerMinute,
    required this.incrementFactor,
    required this.rateIncreaseCriteria,
  });

  factory IoTJobExponentialRolloutRate.fromJson(Map<String, dynamic> json) {
    return IoTJobExponentialRolloutRate(
      baseRatePerMinute: json['baseRatePerMinute'] as int,
      incrementFactor: json['incrementFactor'] as double,
      rateIncreaseCriteria: IoTJobRateIncreaseCriteria.fromJson(
          json['rateIncreaseCriteria'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final baseRatePerMinute = this.baseRatePerMinute;
    final incrementFactor = this.incrementFactor;
    final rateIncreaseCriteria = this.rateIncreaseCriteria;
    return {
      'baseRatePerMinute': baseRatePerMinute,
      'incrementFactor': incrementFactor,
      'rateIncreaseCriteria': rateIncreaseCriteria,
    };
  }
}

/// Contains information about criteria to meet before a job increases its
/// rollout rate. Specify either <code>numberOfNotifiedThings</code> or
/// <code>numberOfSucceededThings</code>.
class IoTJobRateIncreaseCriteria {
  /// The number of devices to receive the job notification before the rollout
  /// rate increases.
  final int? numberOfNotifiedThings;

  /// The number of devices to successfully run the configuration job before the
  /// rollout rate increases.
  final int? numberOfSucceededThings;

  IoTJobRateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });

  factory IoTJobRateIncreaseCriteria.fromJson(Map<String, dynamic> json) {
    return IoTJobRateIncreaseCriteria(
      numberOfNotifiedThings: json['numberOfNotifiedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfNotifiedThings = this.numberOfNotifiedThings;
    final numberOfSucceededThings = this.numberOfSucceededThings;
    return {
      if (numberOfNotifiedThings != null)
        'numberOfNotifiedThings': numberOfNotifiedThings,
      if (numberOfSucceededThings != null)
        'numberOfSucceededThings': numberOfSucceededThings,
    };
  }
}

/// Contains information about the timeout configuration for a job.
class IoTJobTimeoutConfig {
  /// The amount of time, in minutes, that devices have to complete the job. The
  /// timer starts when the job status is set to <code>IN_PROGRESS</code>. If the
  /// job status doesn't change to a terminal state before the time expires, then
  /// the job status is set to <code>TIMED_OUT</code>.
  ///
  /// The timeout interval must be between 1 minute and 7 days (10080 minutes).
  final int? inProgressTimeoutInMinutes;

  IoTJobTimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });

  factory IoTJobTimeoutConfig.fromJson(Map<String, dynamic> json) {
    return IoTJobTimeoutConfig(
      inProgressTimeoutInMinutes: json['inProgressTimeoutInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inProgressTimeoutInMinutes = this.inProgressTimeoutInMinutes;
    return {
      if (inProgressTimeoutInMinutes != null)
        'inProgressTimeoutInMinutes': inProgressTimeoutInMinutes,
    };
  }
}

enum IotEndpointType {
  fips,
  standard,
}

extension IotEndpointTypeValueExtension on IotEndpointType {
  String toValue() {
    switch (this) {
      case IotEndpointType.fips:
        return 'fips';
      case IotEndpointType.standard:
        return 'standard';
    }
  }
}

extension IotEndpointTypeFromString on String {
  IotEndpointType toIotEndpointType() {
    switch (this) {
      case 'fips':
        return IotEndpointType.fips;
      case 'standard':
        return IotEndpointType.standard;
    }
    throw Exception('$this is not known in enum IotEndpointType');
  }
}

/// Contains information about a container in which Lambda functions run on
/// Greengrass core devices.
class LambdaContainerParams {
  /// The list of system devices that the container can access.
  final List<LambdaDeviceMount>? devices;

  /// The memory size of the container, expressed in kilobytes.
  ///
  /// Default: <code>16384</code> (16 MB)
  final int? memorySizeInKB;

  /// Whether or not the container can read information from the device's
  /// <code>/sys</code> folder.
  ///
  /// Default: <code>false</code>
  final bool? mountROSysfs;

  /// The list of volumes that the container can access.
  final List<LambdaVolumeMount>? volumes;

  LambdaContainerParams({
    this.devices,
    this.memorySizeInKB,
    this.mountROSysfs,
    this.volumes,
  });

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final memorySizeInKB = this.memorySizeInKB;
    final mountROSysfs = this.mountROSysfs;
    final volumes = this.volumes;
    return {
      if (devices != null) 'devices': devices,
      if (memorySizeInKB != null) 'memorySizeInKB': memorySizeInKB,
      if (mountROSysfs != null) 'mountROSysfs': mountROSysfs,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// Contains information about a device that Linux processes in a container can
/// access.
class LambdaDeviceMount {
  /// The mount path for the device in the file system.
  final String path;

  /// Whether or not to add the component's system user as an owner of the device.
  ///
  /// Default: <code>false</code>
  final bool? addGroupOwner;

  /// The permission to access the device: read/only (<code>ro</code>) or
  /// read/write (<code>rw</code>).
  ///
  /// Default: <code>ro</code>
  final LambdaFilesystemPermission? permission;

  LambdaDeviceMount({
    required this.path,
    this.addGroupOwner,
    this.permission,
  });

  Map<String, dynamic> toJson() {
    final path = this.path;
    final addGroupOwner = this.addGroupOwner;
    final permission = this.permission;
    return {
      'path': path,
      if (addGroupOwner != null) 'addGroupOwner': addGroupOwner,
      if (permission != null) 'permission': permission.toValue(),
    };
  }
}

/// Contains information about an event source for an Lambda function. The event
/// source defines the topics on which this Lambda function subscribes to
/// receive messages that run the function.
class LambdaEventSource {
  /// The topic to which to subscribe to receive event messages.
  final String topic;

  /// The type of event source. Choose from the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>PUB_SUB</code> – Subscribe to local publish/subscribe messages. This
  /// event source type doesn't support MQTT wildcards (<code>+</code> and
  /// <code>#</code>) in the event source topic.
  /// </li>
  /// <li>
  /// <code>IOT_CORE</code> – Subscribe to Amazon Web Services IoT Core MQTT
  /// messages. This event source type supports MQTT wildcards (<code>+</code> and
  /// <code>#</code>) in the event source topic.
  /// </li>
  /// </ul>
  final LambdaEventSourceType type;

  LambdaEventSource({
    required this.topic,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final topic = this.topic;
    final type = this.type;
    return {
      'topic': topic,
      'type': type.toValue(),
    };
  }
}

enum LambdaEventSourceType {
  pubSub,
  iotCore,
}

extension LambdaEventSourceTypeValueExtension on LambdaEventSourceType {
  String toValue() {
    switch (this) {
      case LambdaEventSourceType.pubSub:
        return 'PUB_SUB';
      case LambdaEventSourceType.iotCore:
        return 'IOT_CORE';
    }
  }
}

extension LambdaEventSourceTypeFromString on String {
  LambdaEventSourceType toLambdaEventSourceType() {
    switch (this) {
      case 'PUB_SUB':
        return LambdaEventSourceType.pubSub;
      case 'IOT_CORE':
        return LambdaEventSourceType.iotCore;
    }
    throw Exception('$this is not known in enum LambdaEventSourceType');
  }
}

/// Contains parameters for a Lambda function that runs on IoT Greengrass.
class LambdaExecutionParameters {
  /// The map of environment variables that are available to the Lambda function
  /// when it runs.
  final Map<String, String>? environmentVariables;

  /// The list of event sources to which to subscribe to receive work messages.
  /// The Lambda function runs when it receives a message from an event source.
  /// You can subscribe this function to local publish/subscribe messages and
  /// Amazon Web Services IoT Core MQTT messages.
  final List<LambdaEventSource>? eventSources;

  /// The list of arguments to pass to the Lambda function when it runs.
  final List<String>? execArgs;

  /// The encoding type that the Lambda function supports.
  ///
  /// Default: <code>json</code>
  final LambdaInputPayloadEncodingType? inputPayloadEncodingType;

  /// The parameters for the Linux process that contains the Lambda function.
  final LambdaLinuxProcessParams? linuxProcessParams;

  /// The maximum amount of time in seconds that a non-pinned Lambda function can
  /// idle before the IoT Greengrass Core software stops its process.
  final int? maxIdleTimeInSeconds;

  /// The maximum number of instances that a non-pinned Lambda function can run at
  /// the same time.
  final int? maxInstancesCount;

  /// The maximum size of the message queue for the Lambda function component. The
  /// IoT Greengrass core stores messages in a FIFO (first-in-first-out) queue
  /// until it can run the Lambda function to consume each message.
  final int? maxQueueSize;

  /// Whether or not the Lambda function is pinned, or long-lived.
  ///
  /// <ul>
  /// <li>
  /// A pinned Lambda function starts when IoT Greengrass starts and keeps running
  /// in its own container.
  /// </li>
  /// <li>
  /// A non-pinned Lambda function starts only when it receives a work item and
  /// exists after it idles for <code>maxIdleTimeInSeconds</code>. If the function
  /// has multiple work items, the IoT Greengrass Core software creates multiple
  /// instances of the function.
  /// </li>
  /// </ul>
  /// Default: <code>true</code>
  final bool? pinned;

  /// The interval in seconds at which a pinned (also known as long-lived) Lambda
  /// function component sends status updates to the Lambda manager component.
  final int? statusTimeoutInSeconds;

  /// The maximum amount of time in seconds that the Lambda function can process a
  /// work item.
  final int? timeoutInSeconds;

  LambdaExecutionParameters({
    this.environmentVariables,
    this.eventSources,
    this.execArgs,
    this.inputPayloadEncodingType,
    this.linuxProcessParams,
    this.maxIdleTimeInSeconds,
    this.maxInstancesCount,
    this.maxQueueSize,
    this.pinned,
    this.statusTimeoutInSeconds,
    this.timeoutInSeconds,
  });

  Map<String, dynamic> toJson() {
    final environmentVariables = this.environmentVariables;
    final eventSources = this.eventSources;
    final execArgs = this.execArgs;
    final inputPayloadEncodingType = this.inputPayloadEncodingType;
    final linuxProcessParams = this.linuxProcessParams;
    final maxIdleTimeInSeconds = this.maxIdleTimeInSeconds;
    final maxInstancesCount = this.maxInstancesCount;
    final maxQueueSize = this.maxQueueSize;
    final pinned = this.pinned;
    final statusTimeoutInSeconds = this.statusTimeoutInSeconds;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (eventSources != null) 'eventSources': eventSources,
      if (execArgs != null) 'execArgs': execArgs,
      if (inputPayloadEncodingType != null)
        'inputPayloadEncodingType': inputPayloadEncodingType.toValue(),
      if (linuxProcessParams != null) 'linuxProcessParams': linuxProcessParams,
      if (maxIdleTimeInSeconds != null)
        'maxIdleTimeInSeconds': maxIdleTimeInSeconds,
      if (maxInstancesCount != null) 'maxInstancesCount': maxInstancesCount,
      if (maxQueueSize != null) 'maxQueueSize': maxQueueSize,
      if (pinned != null) 'pinned': pinned,
      if (statusTimeoutInSeconds != null)
        'statusTimeoutInSeconds': statusTimeoutInSeconds,
      if (timeoutInSeconds != null) 'timeoutInSeconds': timeoutInSeconds,
    };
  }
}

enum LambdaFilesystemPermission {
  ro,
  rw,
}

extension LambdaFilesystemPermissionValueExtension
    on LambdaFilesystemPermission {
  String toValue() {
    switch (this) {
      case LambdaFilesystemPermission.ro:
        return 'ro';
      case LambdaFilesystemPermission.rw:
        return 'rw';
    }
  }
}

extension LambdaFilesystemPermissionFromString on String {
  LambdaFilesystemPermission toLambdaFilesystemPermission() {
    switch (this) {
      case 'ro':
        return LambdaFilesystemPermission.ro;
      case 'rw':
        return LambdaFilesystemPermission.rw;
    }
    throw Exception('$this is not known in enum LambdaFilesystemPermission');
  }
}

/// Contains information about an Lambda function to import to create a
/// component.
class LambdaFunctionRecipeSource {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Lambda function. The ARN must include the version of the function to
  /// import. You can't use version aliases like <code>$LATEST</code>.
  final String lambdaArn;

  /// The component versions on which this Lambda function component depends.
  final Map<String, ComponentDependencyRequirement>? componentDependencies;

  /// The system and runtime parameters for the Lambda function as it runs on the
  /// Greengrass core device.
  final LambdaExecutionParameters? componentLambdaParameters;

  /// The name of the component.
  ///
  /// Defaults to the name of the Lambda function.
  final String? componentName;

  /// The platforms that the component version supports.
  final List<ComponentPlatform>? componentPlatforms;

  /// The version of the component.
  ///
  /// Defaults to the version of the Lambda function as a semantic version. For
  /// example, if your function version is <code>3</code>, the component version
  /// becomes <code>3.0.0</code>.
  final String? componentVersion;

  LambdaFunctionRecipeSource({
    required this.lambdaArn,
    this.componentDependencies,
    this.componentLambdaParameters,
    this.componentName,
    this.componentPlatforms,
    this.componentVersion,
  });

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    final componentDependencies = this.componentDependencies;
    final componentLambdaParameters = this.componentLambdaParameters;
    final componentName = this.componentName;
    final componentPlatforms = this.componentPlatforms;
    final componentVersion = this.componentVersion;
    return {
      'lambdaArn': lambdaArn,
      if (componentDependencies != null)
        'componentDependencies': componentDependencies,
      if (componentLambdaParameters != null)
        'componentLambdaParameters': componentLambdaParameters,
      if (componentName != null) 'componentName': componentName,
      if (componentPlatforms != null) 'componentPlatforms': componentPlatforms,
      if (componentVersion != null) 'componentVersion': componentVersion,
    };
  }
}

enum LambdaInputPayloadEncodingType {
  json,
  binary,
}

extension LambdaInputPayloadEncodingTypeValueExtension
    on LambdaInputPayloadEncodingType {
  String toValue() {
    switch (this) {
      case LambdaInputPayloadEncodingType.json:
        return 'json';
      case LambdaInputPayloadEncodingType.binary:
        return 'binary';
    }
  }
}

extension LambdaInputPayloadEncodingTypeFromString on String {
  LambdaInputPayloadEncodingType toLambdaInputPayloadEncodingType() {
    switch (this) {
      case 'json':
        return LambdaInputPayloadEncodingType.json;
      case 'binary':
        return LambdaInputPayloadEncodingType.binary;
    }
    throw Exception(
        '$this is not known in enum LambdaInputPayloadEncodingType');
  }
}

enum LambdaIsolationMode {
  greengrassContainer,
  noContainer,
}

extension LambdaIsolationModeValueExtension on LambdaIsolationMode {
  String toValue() {
    switch (this) {
      case LambdaIsolationMode.greengrassContainer:
        return 'GreengrassContainer';
      case LambdaIsolationMode.noContainer:
        return 'NoContainer';
    }
  }
}

extension LambdaIsolationModeFromString on String {
  LambdaIsolationMode toLambdaIsolationMode() {
    switch (this) {
      case 'GreengrassContainer':
        return LambdaIsolationMode.greengrassContainer;
      case 'NoContainer':
        return LambdaIsolationMode.noContainer;
    }
    throw Exception('$this is not known in enum LambdaIsolationMode');
  }
}

/// Contains parameters for a Linux process that contains an Lambda function.
class LambdaLinuxProcessParams {
  /// The parameters for the container in which the Lambda function runs.
  final LambdaContainerParams? containerParams;

  /// The isolation mode for the process that contains the Lambda function. The
  /// process can run in an isolated runtime environment inside the IoT Greengrass
  /// container, or as a regular process outside any container.
  ///
  /// Default: <code>GreengrassContainer</code>
  final LambdaIsolationMode? isolationMode;

  LambdaLinuxProcessParams({
    this.containerParams,
    this.isolationMode,
  });

  Map<String, dynamic> toJson() {
    final containerParams = this.containerParams;
    final isolationMode = this.isolationMode;
    return {
      if (containerParams != null) 'containerParams': containerParams,
      if (isolationMode != null) 'isolationMode': isolationMode.toValue(),
    };
  }
}

/// Contains information about a volume that Linux processes in a container can
/// access. When you define a volume, the IoT Greengrass Core software mounts
/// the source files to the destination inside the container.
class LambdaVolumeMount {
  /// The path to the logical volume in the file system.
  final String destinationPath;

  /// The path to the physical volume in the file system.
  final String sourcePath;

  /// Whether or not to add the IoT Greengrass user group as an owner of the
  /// volume.
  ///
  /// Default: <code>false</code>
  final bool? addGroupOwner;

  /// The permission to access the volume: read/only (<code>ro</code>) or
  /// read/write (<code>rw</code>).
  ///
  /// Default: <code>ro</code>
  final LambdaFilesystemPermission? permission;

  LambdaVolumeMount({
    required this.destinationPath,
    required this.sourcePath,
    this.addGroupOwner,
    this.permission,
  });

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final sourcePath = this.sourcePath;
    final addGroupOwner = this.addGroupOwner;
    final permission = this.permission;
    return {
      'destinationPath': destinationPath,
      'sourcePath': sourcePath,
      if (addGroupOwner != null) 'addGroupOwner': addGroupOwner,
      if (permission != null) 'permission': permission.toValue(),
    };
  }
}

class ListClientDevicesAssociatedWithCoreDeviceResponse {
  /// A list that describes the client devices that are associated with the core
  /// device.
  final List<AssociatedClientDevice>? associatedClientDevices;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListClientDevicesAssociatedWithCoreDeviceResponse({
    this.associatedClientDevices,
    this.nextToken,
  });

  factory ListClientDevicesAssociatedWithCoreDeviceResponse.fromJson(
      Map<String, dynamic> json) {
    return ListClientDevicesAssociatedWithCoreDeviceResponse(
      associatedClientDevices: (json['associatedClientDevices'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AssociatedClientDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedClientDevices = this.associatedClientDevices;
    final nextToken = this.nextToken;
    return {
      if (associatedClientDevices != null)
        'associatedClientDevices': associatedClientDevices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComponentVersionsResponse {
  /// A list of versions that exist for the component.
  final List<ComponentVersionListItem>? componentVersions;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListComponentVersionsResponse({
    this.componentVersions,
    this.nextToken,
  });

  factory ListComponentVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentVersionsResponse(
      componentVersions: (json['componentVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ComponentVersionListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentVersions = this.componentVersions;
    final nextToken = this.nextToken;
    return {
      if (componentVersions != null) 'componentVersions': componentVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComponentsResponse {
  /// A list that summarizes each component.
  final List<Component>? components;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListComponentsResponse({
    this.components,
    this.nextToken,
  });

  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentsResponse(
      components: (json['components'] as List?)
          ?.whereNotNull()
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final nextToken = this.nextToken;
    return {
      if (components != null) 'components': components,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCoreDevicesResponse {
  /// A list that summarizes each core device.
  final List<CoreDevice>? coreDevices;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListCoreDevicesResponse({
    this.coreDevices,
    this.nextToken,
  });

  factory ListCoreDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListCoreDevicesResponse(
      coreDevices: (json['coreDevices'] as List?)
          ?.whereNotNull()
          .map((e) => CoreDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreDevices = this.coreDevices;
    final nextToken = this.nextToken;
    return {
      if (coreDevices != null) 'coreDevices': coreDevices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeploymentsResponse {
  /// A list that summarizes each deployment.
  final List<Deployment>? deployments;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListDeploymentsResponse({
    this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsResponse(
      deployments: (json['deployments'] as List?)
          ?.whereNotNull()
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      if (deployments != null) 'deployments': deployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEffectiveDeploymentsResponse {
  /// A list that summarizes each deployment on the core device.
  final List<EffectiveDeployment>? effectiveDeployments;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListEffectiveDeploymentsResponse({
    this.effectiveDeployments,
    this.nextToken,
  });

  factory ListEffectiveDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEffectiveDeploymentsResponse(
      effectiveDeployments: (json['effectiveDeployments'] as List?)
          ?.whereNotNull()
          .map((e) => EffectiveDeployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveDeployments = this.effectiveDeployments;
    final nextToken = this.nextToken;
    return {
      if (effectiveDeployments != null)
        'effectiveDeployments': effectiveDeployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListInstalledComponentsResponse {
  /// A list that summarizes each component on the core device.
  /// <note>
  /// Greengrass nucleus v2.7.0 or later is required to get an accurate
  /// <code>lastStatusChangeTimestamp</code> response. This response can be
  /// inaccurate in earlier Greengrass nucleus versions.
  /// </note> <note>
  /// Greengrass nucleus v2.8.0 or later is required to get an accurate
  /// <code>lastInstallationSource</code> and <code>lastReportedTimestamp</code>
  /// response. This response can be inaccurate or null in earlier Greengrass
  /// nucleus versions.
  /// </note>
  final List<InstalledComponent>? installedComponents;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListInstalledComponentsResponse({
    this.installedComponents,
    this.nextToken,
  });

  factory ListInstalledComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListInstalledComponentsResponse(
      installedComponents: (json['installedComponents'] as List?)
          ?.whereNotNull()
          .map((e) => InstalledComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final installedComponents = this.installedComponents;
    final nextToken = this.nextToken;
    return {
      if (installedComponents != null)
        'installedComponents': installedComponents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/tag-resources.html">Tag
  /// your resources</a> in the <i>IoT Greengrass V2 Developer Guide</i>.
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

enum RecipeOutputFormat {
  json,
  yaml,
}

extension RecipeOutputFormatValueExtension on RecipeOutputFormat {
  String toValue() {
    switch (this) {
      case RecipeOutputFormat.json:
        return 'JSON';
      case RecipeOutputFormat.yaml:
        return 'YAML';
    }
  }
}

extension RecipeOutputFormatFromString on String {
  RecipeOutputFormat toRecipeOutputFormat() {
    switch (this) {
      case 'JSON':
        return RecipeOutputFormat.json;
      case 'YAML':
        return RecipeOutputFormat.yaml;
    }
    throw Exception('$this is not known in enum RecipeOutputFormat');
  }
}

class ResolveComponentCandidatesResponse {
  /// A list of components that meet the requirements that you specify in the
  /// request. This list includes each component's recipe that you can use to
  /// install the component.
  final List<ResolvedComponentVersion>? resolvedComponentVersions;

  ResolveComponentCandidatesResponse({
    this.resolvedComponentVersions,
  });

  factory ResolveComponentCandidatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ResolveComponentCandidatesResponse(
      resolvedComponentVersions: (json['resolvedComponentVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResolvedComponentVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resolvedComponentVersions = this.resolvedComponentVersions;
    return {
      if (resolvedComponentVersions != null)
        'resolvedComponentVersions': resolvedComponentVersions,
    };
  }
}

/// Contains information about a component version that is compatible to run on
/// a Greengrass core device.
class ResolvedComponentVersion {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  final String? arn;

  /// The name of the component.
  final String? componentName;

  /// The version of the component.
  final String? componentVersion;

  /// A message that communicates details about the vendor guidance state of the
  /// component version. This message communicates why a component version is
  /// discontinued or deleted.
  final String? message;

  /// The recipe of the component version.
  final Uint8List? recipe;

  /// The vendor guidance state for the component version. This state indicates
  /// whether the component version has any issues that you should consider before
  /// you deploy it. The vendor guidance state can be:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – This component version is available and recommended
  /// for use.
  /// </li>
  /// <li>
  /// <code>DISCONTINUED</code> – This component version has been discontinued by
  /// its publisher. You can deploy this component version, but we recommend that
  /// you use a different version of this component.
  /// </li>
  /// <li>
  /// <code>DELETED</code> – This component version has been deleted by its
  /// publisher, so you can't deploy it. If you have any existing deployments that
  /// specify this component version, those deployments will fail.
  /// </li>
  /// </ul>
  final VendorGuidance? vendorGuidance;

  ResolvedComponentVersion({
    this.arn,
    this.componentName,
    this.componentVersion,
    this.message,
    this.recipe,
    this.vendorGuidance,
  });

  factory ResolvedComponentVersion.fromJson(Map<String, dynamic> json) {
    return ResolvedComponentVersion(
      arn: json['arn'] as String?,
      componentName: json['componentName'] as String?,
      componentVersion: json['componentVersion'] as String?,
      message: json['message'] as String?,
      recipe: _s.decodeNullableUint8List(json['recipe'] as String?),
      vendorGuidance: (json['vendorGuidance'] as String?)?.toVendorGuidance(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentName = this.componentName;
    final componentVersion = this.componentVersion;
    final message = this.message;
    final recipe = this.recipe;
    final vendorGuidance = this.vendorGuidance;
    return {
      if (arn != null) 'arn': arn,
      if (componentName != null) 'componentName': componentName,
      if (componentVersion != null) 'componentVersion': componentVersion,
      if (message != null) 'message': message,
      if (recipe != null) 'recipe': base64Encode(recipe),
      if (vendorGuidance != null) 'vendorGuidance': vendorGuidance.toValue(),
    };
  }
}

enum S3EndpointType {
  regional,
  global,
}

extension S3EndpointTypeValueExtension on S3EndpointType {
  String toValue() {
    switch (this) {
      case S3EndpointType.regional:
        return 'REGIONAL';
      case S3EndpointType.global:
        return 'GLOBAL';
    }
  }
}

extension S3EndpointTypeFromString on String {
  S3EndpointType toS3EndpointType() {
    switch (this) {
      case 'REGIONAL':
        return S3EndpointType.regional;
      case 'GLOBAL':
        return S3EndpointType.global;
    }
    throw Exception('$this is not known in enum S3EndpointType');
  }
}

/// Contains information about system resource limits that the IoT Greengrass
/// Core software applies to a component's processes. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-system-resource-limits">Configure
/// system resource limits for components</a>.
class SystemResourceLimits {
  /// The maximum amount of CPU time that a component's processes can use on the
  /// core device. A core device's total CPU time is equivalent to the device's
  /// number of CPU cores. For example, on a core device with 4 CPU cores, you can
  /// set this value to <code>2</code> to limit the component's processes to 50
  /// percent usage of each CPU core. On a device with 1 CPU core, you can set
  /// this value to <code>0.25</code> to limit the component's processes to 25
  /// percent usage of the CPU. If you set this value to a number greater than the
  /// number of CPU cores, the IoT Greengrass Core software doesn't limit the
  /// component's CPU usage.
  final double? cpus;

  /// The maximum amount of RAM, expressed in kilobytes, that a component's
  /// processes can use on the core device.
  final int? memory;

  SystemResourceLimits({
    this.cpus,
    this.memory,
  });

  factory SystemResourceLimits.fromJson(Map<String, dynamic> json) {
    return SystemResourceLimits(
      cpus: json['cpus'] as double?,
      memory: json['memory'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final memory = this.memory;
    return {
      if (cpus != null) 'cpus': cpus,
      if (memory != null) 'memory': memory,
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

class UpdateConnectivityInfoResponse {
  /// A message about the connectivity information update request.
  final String? message;

  /// The new version of the connectivity information for the core device.
  final String? version;

  UpdateConnectivityInfoResponse({
    this.message,
    this.version,
  });

  factory UpdateConnectivityInfoResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectivityInfoResponse(
      message: json['Message'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final version = this.version;
    return {
      if (message != null) 'Message': message,
      if (version != null) 'Version': version,
    };
  }
}

enum VendorGuidance {
  active,
  discontinued,
  deleted,
}

extension VendorGuidanceValueExtension on VendorGuidance {
  String toValue() {
    switch (this) {
      case VendorGuidance.active:
        return 'ACTIVE';
      case VendorGuidance.discontinued:
        return 'DISCONTINUED';
      case VendorGuidance.deleted:
        return 'DELETED';
    }
  }
}

extension VendorGuidanceFromString on String {
  VendorGuidance toVendorGuidance() {
    switch (this) {
      case 'ACTIVE':
        return VendorGuidance.active;
      case 'DISCONTINUED':
        return VendorGuidance.discontinued;
      case 'DELETED':
        return VendorGuidance.deleted;
    }
    throw Exception('$this is not known in enum VendorGuidance');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class RequestAlreadyInProgressException extends _s.GenericAwsException {
  RequestAlreadyInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestAlreadyInProgressException',
            message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'RequestAlreadyInProgressException': (type, message) =>
      RequestAlreadyInProgressException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
