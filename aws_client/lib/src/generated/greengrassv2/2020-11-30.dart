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

part '2020-11-30.g.dart';

/// AWS IoT Greengrass brings local compute, messaging, data management, sync,
/// and ML inference capabilities to edge devices. This enables devices to
/// collect and analyze data closer to the source of information, react
/// autonomously to local events, and communicate securely with each other on
/// local networks. Local devices can also communicate securely with AWS IoT
/// Core and export IoT data to the AWS Cloud. AWS IoT Greengrass developers can
/// use AWS Lambda functions and components to create and deploy applications to
/// fleets of edge devices for local operation.
///
/// AWS IoT Greengrass Version 2 provides a new major version of the AWS IoT
/// Greengrass Core software, new APIs, and a new console. Use this API
/// reference to learn how to use the AWS IoT Greengrass V2 API operations to
/// manage components, manage deployments, and core devices.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/what-is-iot-greengrass.html">What
/// is AWS IoT Greengrass?</a> in the <i>AWS IoT Greengrass V2 Developer
/// Guide</i>.
class GreengrassV2 {
  final _s.RestJsonProtocol _protocol;
  GreengrassV2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'greengrass',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String deploymentId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    _s.validateStringLength(
      'deploymentId',
      deploymentId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/greengrass/v2/deployments/${Uri.encodeComponent(deploymentId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDeploymentResponse.fromJson(response);
  }

  /// Creates a component. Components are software that run on AWS IoT
  /// Greengrass core devices. After you develop and test a component on your
  /// core device, you can use this operation to upload your component to AWS
  /// IoT Greengrass. Then, you can deploy the component to other core devices.
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
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html">AWS
  /// IoT Greengrass component recipe reference</a> in the <i>AWS IoT Greengrass
  /// V2 Developer Guide</i>.
  ///
  /// To create a component from a recipe, specify <code>inlineRecipe</code>
  /// when you call this operation.
  /// </li>
  /// <li>
  /// <b>Create components from Lambda functions</b>
  ///
  /// Create a component from an AWS Lambda function that runs on AWS IoT
  /// Greengrass. This creates a recipe and artifacts from the Lambda function's
  /// deployment package. You can use this operation to migrate Lambda functions
  /// from AWS IoT Greengrass V1 to AWS IoT Greengrass V2.
  ///
  /// This function only accepts Lambda functions that use the following
  /// runtimes:
  ///
  /// <ul>
  /// <li>
  /// Python 2.7 – <code>python2.7</code>
  /// </li>
  /// <li>
  /// Python 3.7 – <code>python3.7</code>
  /// </li>
  /// <li>
  /// Python 3.8 – <code>python3.8</code>
  /// </li>
  /// <li>
  /// Java 8 – <code>java8</code>
  /// </li>
  /// <li>
  /// Node.js 10 – <code>nodejs10.x</code>
  /// </li>
  /// <li>
  /// Node.js 12 – <code>nodejs12.x</code>
  /// </li>
  /// </ul>
  /// To create a component from a Lambda function, specify
  /// <code>lambdaFunction</code> when you call this operation.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag
  /// your resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  Future<CreateComponentVersionResponse> createComponentVersion({
    Uint8List inlineRecipe,
    LambdaFunctionRecipeSource lambdaFunction,
    Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
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

  /// Creates a continuous deployment for a target, which is a AWS IoT
  /// Greengrass core device or group of core devices. When you add a new core
  /// device to a group of core devices that has a deployment, AWS IoT
  /// Greengrass deploys that group's deployment to the new device.
  ///
  /// You can define one deployment for each target. When you create a new
  /// deployment for a target that has an existing deployment, you replace the
  /// previous deployment. AWS IoT Greengrass applies the new deployment to the
  /// target devices.
  ///
  /// Every deployment has a revision number that indicates how many deployment
  /// revisions you define for a target. Use this operation to create a new
  /// revision of an existing deployment. This operation returns the revision
  /// number of the new deployment when you create it.
  ///
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/latest/developerguide/create-deployments.html">Create
  /// deployments</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target AWS IoT thing or thing group.
  ///
  /// Parameter [components] :
  /// The components to deploy. This is a dictionary, where each key is the name
  /// of a component, and each key's value is the version and configuration to
  /// deploy for that component.
  ///
  /// Parameter [deploymentName] :
  /// The name of the deployment.
  ///
  /// You can create deployments without names. If you create a deployment
  /// without a name, the AWS IoT Greengrass V2 console shows the deployment
  /// name as <code>&lt;targetType&gt;:&lt;targetName&gt;</code>, where
  /// <code>targetType</code> and <code>targetName</code> are the type and name
  /// of the deployment target.
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
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag
  /// your resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  Future<CreateDeploymentResponse> createDeployment({
    @_s.required String targetArn,
    Map<String, ComponentDeploymentSpecification> components,
    String deploymentName,
    DeploymentPolicies deploymentPolicies,
    DeploymentIoTJobConfiguration iotJobConfiguration,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    _s.validateStringPattern(
      'targetArn',
      targetArn,
      r'''arn:aws(-cn|-us-gov)?:iot:[^:]+:[0-9]+:(thing|thinggroup)/.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'deploymentName',
      deploymentName,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'targetArn': targetArn,
      if (components != null) 'components': components,
      if (deploymentName != null) 'deploymentName': deploymentName,
      if (deploymentPolicies != null) 'deploymentPolicies': deploymentPolicies,
      if (iotJobConfiguration != null)
        'iotJobConfiguration': iotJobConfiguration,
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

  /// Deletes a version of a component from AWS IoT Greengrass.
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):components:[^:]+:versions:[^:]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/v2/components/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a AWS IoT Greengrass core device, which is an AWS IoT thing. This
  /// operation removes the core device from the list of core devices. This
  /// operation doesn't delete the AWS IoT thing. For more information about how
  /// to delete the AWS IoT thing, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_DeleteThing.html">DeleteThing</a>
  /// in the <i>AWS IoT API Reference</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the AWS IoT thing.
  Future<void> deleteCoreDevice({
    @_s.required String coreDeviceThingName,
  }) async {
    ArgumentError.checkNotNull(coreDeviceThingName, 'coreDeviceThingName');
    _s.validateStringLength(
      'coreDeviceThingName',
      coreDeviceThingName,
      1,
      128,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}',
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):components:[^:]+:versions:[^:]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/components/${Uri.encodeComponent(arn)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeComponentResponse.fromJson(response);
  }

  /// Gets the recipe for a version of a component. Core devices can call this
  /// operation to identify the artifacts and requirements to install a
  /// component.
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
    @_s.required String arn,
    RecipeOutputFormat recipeOutputFormat,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):components:[^:]+:versions:[^:]+''',
      isRequired: true,
    );
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

  /// Gets the pre-signed URL to a component artifact in an S3 bucket. Core
  /// devices can call this operation to identify the URL that they can use to
  /// download an artifact to install.
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
  /// Parameter [artifactName] :
  /// The name of the artifact.
  Future<GetComponentVersionArtifactResponse> getComponentVersionArtifact({
    @_s.required String arn,
    @_s.required String artifactName,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):components:[^:]+:versions:[^:]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(artifactName, 'artifactName');
    _s.validateStringLength(
      'artifactName',
      artifactName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/components/${Uri.encodeComponent(arn)}/artifacts/${artifactName.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentVersionArtifactResponse.fromJson(response);
  }

  /// Retrieves metadata for a AWS IoT Greengrass core device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the AWS IoT thing.
  Future<GetCoreDeviceResponse> getCoreDevice({
    @_s.required String coreDeviceThingName,
  }) async {
    ArgumentError.checkNotNull(coreDeviceThingName, 'coreDeviceThingName');
    _s.validateStringLength(
      'coreDeviceThingName',
      coreDeviceThingName,
      1,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreDeviceResponse.fromJson(response);
  }

  /// Gets a deployment. Deployments define the components that run on AWS IoT
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
    @_s.required String deploymentId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    _s.validateStringLength(
      'deploymentId',
      deploymentId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/v2/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentResponse.fromJson(response);
  }

  /// Retrieves a paginated list of all versions for a component.
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
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListComponentVersionsResponse> listComponentVersions({
    @_s.required String arn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):components:[^:]+''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
    ComponentVisibilityScope scope,
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

  /// Retrieves a paginated list of AWS IoT Greengrass core devices.
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
  /// <code>HEALTHY</code> – The AWS IoT Greengrass Core software and all
  /// components run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The AWS IoT Greengrass Core software or a
  /// component is in a failed state on the core device.
  /// </li>
  /// </ul>
  ///
  /// Parameter [thingGroupArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the AWS IoT thing group by which to filter. If you specify this
  /// parameter, the list includes only core devices that are members of this
  /// thing group.
  Future<ListCoreDevicesResponse> listCoreDevices({
    int maxResults,
    String nextToken,
    CoreDeviceStatus status,
    String thingGroupArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'thingGroupArn',
      thingGroupArn,
      r'''arn:aws(-cn|-us-gov)?:iot:[^:]+:[0-9]+:thinggroup/.+''',
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
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [targetArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target AWS IoT thing or thing group.
  Future<ListDeploymentsResponse> listDeployments({
    DeploymentHistoryFilter historyFilter,
    int maxResults,
    String nextToken,
    String targetArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'targetArn',
      targetArn,
      r'''arn:aws(-cn|-us-gov)?:iot:[^:]+:[0-9]+:(thing|thinggroup)/.+''',
    );
    final $query = <String, List<String>>{
      if (historyFilter != null) 'historyFilter': [historyFilter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
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

  /// Retrieves a paginated list of deployment jobs that AWS IoT Greengrass
  /// sends to AWS IoT Greengrass core devices.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the AWS IoT thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListEffectiveDeploymentsResponse> listEffectiveDeployments({
    @_s.required String coreDeviceThingName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(coreDeviceThingName, 'coreDeviceThingName');
    _s.validateStringLength(
      'coreDeviceThingName',
      coreDeviceThingName,
      1,
      128,
      isRequired: true,
    );
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

  /// Retrieves a paginated list of the components that a AWS IoT Greengrass
  /// core device runs.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [coreDeviceThingName] :
  /// The name of the core device. This is also the name of the AWS IoT thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListInstalledComponentsResponse> listInstalledComponents({
    @_s.required String coreDeviceThingName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(coreDeviceThingName, 'coreDeviceThingName');
    _s.validateStringLength(
      'coreDeviceThingName',
      coreDeviceThingName,
      1,
      128,
      isRequired: true,
    );
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
          '/greengrass/v2/coreDevices/${Uri.encodeComponent(coreDeviceThingName)}/installedComponents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstalledComponentsResponse.fromJson(response);
  }

  /// Retrieves the list of tags for an AWS IoT Greengrass resource.
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):(components|deployments|coreDevices):.+''',
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

  /// Retrieves a list of components that meet the component, version, and
  /// platform requirements of a deployment. AWS IoT Greengrass core devices
  /// call this operation when they receive a deployment to identify the
  /// components to install.
  ///
  /// This operation identifies components that meet all dependency requirements
  /// for a deployment. If the requirements conflict, then this operation
  /// returns an error and the deployment fails. For example, this occurs if
  /// component <code>A</code> requires version <code>&gt;2.0.0</code> and
  /// component <code>B</code> requires version <code>&lt;2.0.0</code> of a
  /// component dependency.
  ///
  /// When you specify the component candidates to resolve, AWS IoT Greengrass
  /// compares each component's digest from the core device with the component's
  /// digest in the AWS Cloud. If the digests don't match, then AWS IoT
  /// Greengrass specifies to use the version from the AWS Cloud.
  /// <important>
  /// To use this operation, you must use the data plane API endpoint and
  /// authenticate with an AWS IoT device certificate. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/general/latest/gr/greengrass.html">AWS
  /// IoT Greengrass endpoints and quotas</a>.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [componentCandidates] :
  /// The list of components to resolve.
  ///
  /// Parameter [platform] :
  /// The platform to use to resolve compatible components.
  Future<ResolveComponentCandidatesResponse> resolveComponentCandidates({
    @_s.required List<ComponentCandidate> componentCandidates,
    @_s.required ComponentPlatform platform,
  }) async {
    ArgumentError.checkNotNull(componentCandidates, 'componentCandidates');
    ArgumentError.checkNotNull(platform, 'platform');
    final $payload = <String, dynamic>{
      'componentCandidates': componentCandidates,
      'platform': platform,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/v2/resolveComponentCandidates',
      exceptionFnMap: _exceptionFns,
    );
    return ResolveComponentCandidatesResponse.fromJson(response);
  }

  /// Adds tags to an AWS IoT Greengrass resource. If a tag already exists for
  /// the resource, this operation updates the tag's value.
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
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag
  /// your resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):(components|deployments|coreDevices):.+''',
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
    return TagResourceResponse.fromJson(response);
  }

  /// Removes a tag from an AWS IoT Greengrass resource.
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws(-cn|-us-gov)?:greengrass:[^:]+:(aws|[0-9]+):(components|deployments|coreDevices):.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelDeploymentResponse {
  /// A message that communicates if the cancel was successful.
  @_s.JsonKey(name: 'message')
  final String message;

  CancelDeploymentResponse({
    this.message,
  });
  factory CancelDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelDeploymentResponseFromJson(json);
}

enum CloudComponentState {
  @_s.JsonValue('REQUESTED')
  requested,
  @_s.JsonValue('INITIATED')
  initiated,
  @_s.JsonValue('DEPLOYABLE')
  deployable,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

/// Contains the status of a component in the AWS IoT Greengrass service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudComponentStatus {
  /// The state of the component.
  @_s.JsonKey(name: 'componentState')
  final CloudComponentState componentState;

  /// A dictionary of errors that communicate why the component is in an error
  /// state. For example, if AWS IoT Greengrass can't access an artifact for the
  /// component, then <code>errors</code> contains the artifact's URI as a key,
  /// and the error message as the value for that key.
  @_s.JsonKey(name: 'errors')
  final Map<String, String> errors;

  /// A message that communicates details, such as errors, about the status of the
  /// component.
  @_s.JsonKey(name: 'message')
  final String message;

  CloudComponentStatus({
    this.componentState,
    this.errors,
    this.message,
  });
  factory CloudComponentStatus.fromJson(Map<String, dynamic> json) =>
      _$CloudComponentStatusFromJson(json);
}

/// Contains information about a component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Component {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The latest version of the component and its details.
  @_s.JsonKey(name: 'latestVersion')
  final ComponentLatestVersion latestVersion;

  Component({
    this.arn,
    this.componentName,
    this.latestVersion,
  });
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}

/// Contains information about a component that is a candidate to deploy to a
/// AWS IoT Greengrass core device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComponentCandidate {
  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The version requirements for the component's dependencies. AWS IoT
  /// Greengrass core devices get the version requirements from component recipes.
  ///
  /// AWS IoT Greengrass V2 uses semantic version constraints. For more
  /// information, see <a href="https://semver.org/">Semantic Versioning</a>.
  @_s.JsonKey(name: 'versionRequirements')
  final Map<String, String> versionRequirements;

  ComponentCandidate({
    this.componentName,
    this.componentVersion,
    this.versionRequirements,
  });
  Map<String, dynamic> toJson() => _$ComponentCandidateToJson(this);
}

/// Contains information about a deployment's update to a component's
/// configuration on Greengrass core devices. For more information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html">Update
/// component configurations</a> in the <i>AWS IoT Greengrass V2 Developer
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComponentConfigurationUpdate {
  /// A serialized JSON string that contains the configuration object to merge to
  /// target devices. The core device merges this configuration with the
  /// component's existing configuration. If this is the first time a component
  /// deploys on a device, the core device merges this configuration with the
  /// component's default configuration. This means that the core device keeps
  /// it's existing configuration for keys and values that you don't specify in
  /// this object. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html#merge-configuration-update">Merge
  /// configuration updates</a> in the <i>AWS IoT Greengrass V2 Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'merge')
  final String merge;

  /// The list of configuration nodes to reset to default values on target
  /// devices. Use JSON pointers to specify each node to reset. JSON pointers
  /// start with a forward slash (<code>/</code>) and use forward slashes to
  /// separate the key for each level in the object. For more information, see the
  /// <a href="https://tools.ietf.org/html/rfc6901">JSON pointer specification</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html#reset-configuration-update">Reset
  /// configuration updates</a> in the <i>AWS IoT Greengrass V2 Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'reset')
  final List<String> reset;

  ComponentConfigurationUpdate({
    this.merge,
    this.reset,
  });
  factory ComponentConfigurationUpdate.fromJson(Map<String, dynamic> json) =>
      _$ComponentConfigurationUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentConfigurationUpdateToJson(this);
}

/// Contains information about a component dependency for a Lambda function
/// component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'dependencyType')
  final ComponentDependencyType dependencyType;

  /// The component version requirement for the component dependency.
  ///
  /// AWS IoT Greengrass V2 uses semantic version constraints. For more
  /// information, see <a href="https://semver.org/">Semantic Versioning</a>.
  @_s.JsonKey(name: 'versionRequirement')
  final String versionRequirement;

  ComponentDependencyRequirement({
    this.dependencyType,
    this.versionRequirement,
  });
  Map<String, dynamic> toJson() => _$ComponentDependencyRequirementToJson(this);
}

enum ComponentDependencyType {
  @_s.JsonValue('HARD')
  hard,
  @_s.JsonValue('SOFT')
  soft,
}

/// Contains information about a component to deploy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComponentDeploymentSpecification {
  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The configuration updates to deploy for the component. You can define
  /// <i>reset</i> updates and <i>merge</i> updates. A reset updates the keys that
  /// you specify to the default configuration for the component. A merge updates
  /// the core device's component configuration with the keys and values that you
  /// specify. The AWS IoT Greengrass Core software applies reset updates before
  /// it applies merge updates. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/update-component-configurations.html">Update
  /// component configurations</a> in the <i>AWS IoT Greengrass V2 Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'configurationUpdate')
  final ComponentConfigurationUpdate configurationUpdate;

  /// The system user and group that the AWS IoT Greengrass Core software uses to
  /// run component processes on the core device. If you omit this parameter, the
  /// AWS IoT Greengrass Core software uses the system user and group that you
  /// configure for the core device. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
  /// the user and group that run components</a> in the <i>AWS IoT Greengrass V2
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'runWith')
  final ComponentRunWith runWith;

  ComponentDeploymentSpecification({
    this.componentVersion,
    this.configurationUpdate,
    this.runWith,
  });
  factory ComponentDeploymentSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$ComponentDeploymentSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ComponentDeploymentSpecificationToJson(this);
}

/// Contains information about the latest version of a component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComponentLatestVersion {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The description of the component version.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The platforms that the component version supports.
  @_s.JsonKey(name: 'platforms')
  final List<ComponentPlatform> platforms;

  /// The publisher of the component version.
  @_s.JsonKey(name: 'publisher')
  final String publisher;

  ComponentLatestVersion({
    this.arn,
    this.componentVersion,
    this.creationTimestamp,
    this.description,
    this.platforms,
    this.publisher,
  });
  factory ComponentLatestVersion.fromJson(Map<String, dynamic> json) =>
      _$ComponentLatestVersionFromJson(json);
}

/// Contains information about a platform that a component supports.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComponentPlatform {
  /// A dictionary of attributes for the platform. The AWS IoT Greengrass Core
  /// software defines the <code>os</code> and <code>platform</code> by default.
  /// You can specify additional platform attributes for a core device when you
  /// deploy the AWS IoT Greengrass nucleus component. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html">AWS
  /// IoT Greengrass nucleus component</a> in the <i>AWS IoT Greengrass V2
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The friendly name of the platform. This name helps you identify the
  /// platform.
  ///
  /// If you omit this parameter, AWS IoT Greengrass creates a friendly name from
  /// the <code>os</code> and <code>architecture</code> of the platform.
  @_s.JsonKey(name: 'name')
  final String name;

  ComponentPlatform({
    this.attributes,
    this.name,
  });
  factory ComponentPlatform.fromJson(Map<String, dynamic> json) =>
      _$ComponentPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentPlatformToJson(this);
}

/// Contains information system user and group that the AWS IoT Greengrass Core
/// software uses to run component processes on the core device. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-greengrass-core-v2.html#configure-component-user">Configure
/// the user and group that run components</a> in the <i>AWS IoT Greengrass V2
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComponentRunWith {
  /// The POSIX system user and (optional) group to use to run this component.
  /// Specify the user and group separated by a colon (<code>:</code>) in the
  /// following format: <code>user:group</code>. The group is optional. If you
  /// don't specify a group, the AWS IoT Greengrass Core software uses the primary
  /// user for the group.
  @_s.JsonKey(name: 'posixUser')
  final String posixUser;

  ComponentRunWith({
    this.posixUser,
  });
  factory ComponentRunWith.fromJson(Map<String, dynamic> json) =>
      _$ComponentRunWithFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentRunWithToJson(this);
}

/// Contains information about a component version in a list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComponentVersionListItem {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  ComponentVersionListItem({
    this.arn,
    this.componentName,
    this.componentVersion,
  });
  factory ComponentVersionListItem.fromJson(Map<String, dynamic> json) =>
      _$ComponentVersionListItemFromJson(json);
}

enum ComponentVisibilityScope {
  @_s.JsonValue('PRIVATE')
  private,
  @_s.JsonValue('PUBLIC')
  public,
}

extension on ComponentVisibilityScope {
  String toValue() {
    switch (this) {
      case ComponentVisibilityScope.private:
        return 'PRIVATE';
      case ComponentVisibilityScope.public:
        return 'PUBLIC';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a AWS IoT Greengrass core device, which is an AWS
/// IoT thing that runs the AWS IoT Greengrass Core software.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoreDevice {
  /// The name of the core device. This is also the name of the AWS IoT thing.
  @_s.JsonKey(name: 'coreDeviceThingName')
  final String coreDeviceThingName;

  /// The time at which the core device's status last updated, expressed in ISO
  /// 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStatusUpdateTimestamp')
  final DateTime lastStatusUpdateTimestamp;

  /// The status of the core device. Core devices can have the following statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – The AWS IoT Greengrass Core software and all
  /// components run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The AWS IoT Greengrass Core software or a component
  /// is in a failed state on the core device.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final CoreDeviceStatus status;

  CoreDevice({
    this.coreDeviceThingName,
    this.lastStatusUpdateTimestamp,
    this.status,
  });
  factory CoreDevice.fromJson(Map<String, dynamic> json) =>
      _$CoreDeviceFromJson(json);
}

enum CoreDeviceStatus {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
}

extension on CoreDeviceStatus {
  String toValue() {
    switch (this) {
      case CoreDeviceStatus.healthy:
        return 'HEALTHY';
      case CoreDeviceStatus.unhealthy:
        return 'UNHEALTHY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateComponentVersionResponse {
  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The status of the component version in AWS IoT Greengrass V2. This status is
  /// different from the status of the component on a core device.
  @_s.JsonKey(name: 'status')
  final CloudComponentStatus status;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  CreateComponentVersionResponse({
    @_s.required this.componentName,
    @_s.required this.componentVersion,
    @_s.required this.creationTimestamp,
    @_s.required this.status,
    this.arn,
  });
  factory CreateComponentVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateComponentVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResponse {
  /// The ID of the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobArn')
  final String iotJobArn;

  /// The ID of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobId')
  final String iotJobId;

  CreateDeploymentResponse({
    this.deploymentId,
    this.iotJobArn,
    this.iotJobId,
  });
  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentResponseFromJson(json);
}

/// Contains information about a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployment {
  /// The time at which the deployment was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The name of the deployment.
  ///
  /// You can create deployments without names. If you create a deployment without
  /// a name, the AWS IoT Greengrass V2 console shows the deployment name as
  /// <code>&lt;targetType&gt;:&lt;targetName&gt;</code>, where
  /// <code>targetType</code> and <code>targetName</code> are the type and name of
  /// the deployment target.
  @_s.JsonKey(name: 'deploymentName')
  final String deploymentName;

  /// The status of the deployment.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// Whether or not the deployment is the latest revision for its target.
  @_s.JsonKey(name: 'isLatestForTarget')
  final bool isLatestForTarget;

  /// The revision number of the deployment.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target AWS IoT thing or thing group.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  Deployment({
    this.creationTimestamp,
    this.deploymentId,
    this.deploymentName,
    this.deploymentStatus,
    this.isLatestForTarget,
    this.revisionId,
    this.targetArn,
  });
  factory Deployment.fromJson(Map<String, dynamic> json) =>
      _$DeploymentFromJson(json);
}

/// Contains information about a deployment's policy that defines when
/// components are safe to update.
///
/// Each component on a device can report whether or not it's ready to update.
/// After a component and its dependencies are ready, they can apply the update
/// in the deployment. You can configure whether or not the deployment notifies
/// components of an update and waits for a response. You specify the amount of
/// time each component has to respond to the update notification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  /// IPC operation. For more information, see the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/latest/developerguide/create-deployments.html">Create
  /// deployments</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>SKIP_NOTIFY_COMPONENTS</code> – The deployment doesn't notify
  /// components or wait for them to be safe to update.
  /// </li>
  /// </ul>
  /// Default: <code>NOTIFY_COMPONENTS</code>
  @_s.JsonKey(name: 'action')
  final DeploymentComponentUpdatePolicyAction action;

  /// The amount of time in seconds that each component on a device has to report
  /// that it's safe to update. If the component waits for longer than this
  /// timeout, then the deployment proceeds on the device.
  ///
  /// Default: <code>60</code>
  @_s.JsonKey(name: 'timeoutInSeconds')
  final int timeoutInSeconds;

  DeploymentComponentUpdatePolicy({
    this.action,
    this.timeoutInSeconds,
  });
  factory DeploymentComponentUpdatePolicy.fromJson(Map<String, dynamic> json) =>
      _$DeploymentComponentUpdatePolicyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeploymentComponentUpdatePolicyToJson(this);
}

enum DeploymentComponentUpdatePolicyAction {
  @_s.JsonValue('NOTIFY_COMPONENTS')
  notifyComponents,
  @_s.JsonValue('SKIP_NOTIFY_COMPONENTS')
  skipNotifyComponents,
}

/// Contains information about how long a component on a core device can
/// validate its configuration updates before it times out. Components can use
/// the <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-subscribetovalidateconfigurationupdates">SubscribeToValidateConfigurationUpdates</a>
/// IPC operation to receive notifications when a deployment specifies a
/// configuration update. Then, components can respond with the <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/interprocess-communication.html#ipc-operation-sendconfigurationvalidityreport">SendConfigurationValidityReport</a>
/// IPC operation. For more information, see the <a
/// href="https://docs.aws.amazon.com/greengrass/v2/latest/developerguide/create-deployments.html">Create
/// deployments</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentConfigurationValidationPolicy {
  /// The amount of time in seconds that a component can validate its
  /// configuration updates. If the validation time exceeds this timeout, then the
  /// deployment proceeds for the device.
  ///
  /// Default: <code>30</code>
  @_s.JsonKey(name: 'timeoutInSeconds')
  final int timeoutInSeconds;

  DeploymentConfigurationValidationPolicy({
    this.timeoutInSeconds,
  });
  factory DeploymentConfigurationValidationPolicy.fromJson(
          Map<String, dynamic> json) =>
      _$DeploymentConfigurationValidationPolicyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeploymentConfigurationValidationPolicyToJson(this);
}

enum DeploymentFailureHandlingPolicy {
  @_s.JsonValue('ROLLBACK')
  rollback,
  @_s.JsonValue('DO_NOTHING')
  doNothing,
}

enum DeploymentHistoryFilter {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('LATEST_ONLY')
  latestOnly,
}

extension on DeploymentHistoryFilter {
  String toValue() {
    switch (this) {
      case DeploymentHistoryFilter.all:
        return 'ALL';
      case DeploymentHistoryFilter.latestOnly:
        return 'LATEST_ONLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about an AWS IoT job configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentIoTJobConfiguration {
  /// The stop configuration for the job. This configuration defines when and how
  /// to stop a job rollout.
  @_s.JsonKey(name: 'abortConfig')
  final IoTJobAbortConfig abortConfig;

  /// The rollout configuration for the job. This configuration defines the rate
  /// at which the job rolls out to the fleet of target devices.
  @_s.JsonKey(name: 'jobExecutionsRolloutConfig')
  final IoTJobExecutionsRolloutConfig jobExecutionsRolloutConfig;

  /// The timeout configuration for the job. This configuration defines the amount
  /// of time each device has to complete the job.
  @_s.JsonKey(name: 'timeoutConfig')
  final IoTJobTimeoutConfig timeoutConfig;

  DeploymentIoTJobConfiguration({
    this.abortConfig,
    this.jobExecutionsRolloutConfig,
    this.timeoutConfig,
  });
  factory DeploymentIoTJobConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DeploymentIoTJobConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentIoTJobConfigurationToJson(this);
}

/// Contains information about policies that define how a deployment updates
/// components and handles failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentPolicies {
  /// The component update policy for the configuration deployment. This policy
  /// defines when it's safe to deploy the configuration to devices.
  @_s.JsonKey(name: 'componentUpdatePolicy')
  final DeploymentComponentUpdatePolicy componentUpdatePolicy;

  /// The configuration validation policy for the configuration deployment. This
  /// policy defines how long each component has to validate its configure
  /// updates.
  @_s.JsonKey(name: 'configurationValidationPolicy')
  final DeploymentConfigurationValidationPolicy configurationValidationPolicy;

  /// The failure handling policy for the configuration deployment. This policy
  /// defines what to do if the deployment fails.
  ///
  /// Default: <code>ROLLBACK</code>
  @_s.JsonKey(name: 'failureHandlingPolicy')
  final DeploymentFailureHandlingPolicy failureHandlingPolicy;

  DeploymentPolicies({
    this.componentUpdatePolicy,
    this.configurationValidationPolicy,
    this.failureHandlingPolicy,
  });
  factory DeploymentPolicies.fromJson(Map<String, dynamic> json) =>
      _$DeploymentPoliciesFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentPoliciesToJson(this);
}

enum DeploymentStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INACTIVE')
  inactive,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComponentResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The time at which the component was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The description of the component version.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The platforms that the component version supports.
  @_s.JsonKey(name: 'platforms')
  final List<ComponentPlatform> platforms;

  /// The publisher of the component version.
  @_s.JsonKey(name: 'publisher')
  final String publisher;

  /// The status of the component version in AWS IoT Greengrass V2. This status is
  /// different from the status of the component on a core device.
  @_s.JsonKey(name: 'status')
  final CloudComponentStatus status;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag your
  /// resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory DescribeComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeComponentResponseFromJson(json);
}

/// Contains information about a deployment job that AWS IoT Greengrass sends to
/// a AWS IoT Greengrass core device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EffectiveDeployment {
  /// The status of the deployment job on the AWS IoT Greengrass core device.
  @_s.JsonKey(name: 'coreDeviceExecutionStatus')
  final EffectiveDeploymentExecutionStatus coreDeviceExecutionStatus;

  /// The time at which the deployment was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The name of the deployment.
  ///
  /// You can create deployments without names. If you create a deployment without
  /// a name, the AWS IoT Greengrass V2 console shows the deployment name as
  /// <code>&lt;targetType&gt;:&lt;targetName&gt;</code>, where
  /// <code>targetType</code> and <code>targetName</code> are the type and name of
  /// the deployment target.
  @_s.JsonKey(name: 'deploymentName')
  final String deploymentName;

  /// The time at which the deployment job was last modified, expressed in ISO
  /// 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'modifiedTimestamp')
  final DateTime modifiedTimestamp;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target AWS IoT thing or thing group.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// The description of the deployment job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobArn')
  final String iotJobArn;

  /// The ID of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobId')
  final String iotJobId;

  /// The reason code for the update, if the job was updated.
  @_s.JsonKey(name: 'reason')
  final String reason;

  EffectiveDeployment({
    @_s.required this.coreDeviceExecutionStatus,
    @_s.required this.creationTimestamp,
    @_s.required this.deploymentId,
    @_s.required this.deploymentName,
    @_s.required this.modifiedTimestamp,
    @_s.required this.targetArn,
    this.description,
    this.iotJobArn,
    this.iotJobId,
    this.reason,
  });
  factory EffectiveDeployment.fromJson(Map<String, dynamic> json) =>
      _$EffectiveDeploymentFromJson(json);
}

enum EffectiveDeploymentExecutionStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('REJECTED')
  rejected,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComponentResponse {
  /// The recipe of the component version.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'recipe')
  final Uint8List recipe;

  /// The format of the recipe.
  @_s.JsonKey(name: 'recipeOutputFormat')
  final RecipeOutputFormat recipeOutputFormat;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag your
  /// resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetComponentResponse({
    @_s.required this.recipe,
    @_s.required this.recipeOutputFormat,
    this.tags,
  });
  factory GetComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComponentVersionArtifactResponse {
  /// The URL to the artifact.
  @_s.JsonKey(name: 'preSignedUrl')
  final String preSignedUrl;

  GetComponentVersionArtifactResponse({
    @_s.required this.preSignedUrl,
  });
  factory GetComponentVersionArtifactResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetComponentVersionArtifactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCoreDeviceResponse {
  /// The computer architecture of the core device.
  @_s.JsonKey(name: 'architecture')
  final String architecture;

  /// The name of the core device. This is also the name of the AWS IoT thing.
  @_s.JsonKey(name: 'coreDeviceThingName')
  final String coreDeviceThingName;

  /// The version of the AWS IoT Greengrass Core software that the core device
  /// runs. This version is equivalent to the version of the AWS IoT Greengrass
  /// nucleus component that runs on the core device. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/greengrass-nucleus-component.html">AWS
  /// IoT Greengrass nucleus component</a> in the <i>AWS IoT Greengrass V2
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'coreVersion')
  final String coreVersion;

  /// The time at which the core device's status last updated, expressed in ISO
  /// 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStatusUpdateTimestamp')
  final DateTime lastStatusUpdateTimestamp;

  /// The operating system platform that the core device runs.
  @_s.JsonKey(name: 'platform')
  final String platform;

  /// The status of the core device. The core device status can be:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code> – The AWS IoT Greengrass Core software and all
  /// components run on the core device without issue.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The AWS IoT Greengrass Core software or a component
  /// is in a failed state on the core device.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final CoreDeviceStatus status;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag your
  /// resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetCoreDeviceResponse({
    this.architecture,
    this.coreDeviceThingName,
    this.coreVersion,
    this.lastStatusUpdateTimestamp,
    this.platform,
    this.status,
    this.tags,
  });
  factory GetCoreDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCoreDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentResponse {
  /// The components to deploy. This is a dictionary, where each key is the name
  /// of a component, and each key's value is the version and configuration to
  /// deploy for that component.
  @_s.JsonKey(name: 'components')
  final Map<String, ComponentDeploymentSpecification> components;

  /// The time at which the deployment was created, expressed in ISO 8601 format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTimestamp')
  final DateTime creationTimestamp;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The name of the deployment.
  ///
  /// You can create deployments without names. If you create a deployment without
  /// a name, the AWS IoT Greengrass V2 console shows the deployment name as
  /// <code>&lt;targetType&gt;:&lt;targetName&gt;</code>, where
  /// <code>targetType</code> and <code>targetName</code> are the type and name of
  /// the deployment target.
  @_s.JsonKey(name: 'deploymentName')
  final String deploymentName;

  /// The deployment policies for the deployment. These policies define how the
  /// deployment updates components and handles failure.
  @_s.JsonKey(name: 'deploymentPolicies')
  final DeploymentPolicies deploymentPolicies;

  /// The status of the deployment.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobArn')
  final String iotJobArn;

  /// The job configuration for the deployment configuration. The job
  /// configuration specifies the rollout, timeout, and stop configurations for
  /// the deployment configuration.
  @_s.JsonKey(name: 'iotJobConfiguration')
  final DeploymentIoTJobConfiguration iotJobConfiguration;

  /// The ID of the AWS IoT job that applies the deployment to target devices.
  @_s.JsonKey(name: 'iotJobId')
  final String iotJobId;

  /// Whether or not the deployment is the latest revision for its target.
  @_s.JsonKey(name: 'isLatestForTarget')
  final bool isLatestForTarget;

  /// The revision number of the deployment.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag your
  /// resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the target AWS IoT thing or thing group.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

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
    this.revisionId,
    this.tags,
    this.targetArn,
  });
  factory GetDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentResponseFromJson(json);
}

/// Contains information about a component on a AWS IoT Greengrass core device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstalledComponent {
  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// Whether or not the component is a root component.
  @_s.JsonKey(name: 'isRoot')
  final bool isRoot;

  /// The lifecycle state of the component.
  @_s.JsonKey(name: 'lifecycleState')
  final InstalledComponentLifecycleState lifecycleState;

  /// The details about the lifecycle state of the component.
  @_s.JsonKey(name: 'lifecycleStateDetails')
  final String lifecycleStateDetails;

  InstalledComponent({
    this.componentName,
    this.componentVersion,
    this.isRoot,
    this.lifecycleState,
    this.lifecycleStateDetails,
  });
  factory InstalledComponent.fromJson(Map<String, dynamic> json) =>
      _$InstalledComponentFromJson(json);
}

enum InstalledComponentLifecycleState {
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('INSTALLED')
  installed,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('ERRORED')
  errored,
  @_s.JsonValue('BROKEN')
  broken,
  @_s.JsonValue('FINISHED')
  finished,
}

enum IoTJobAbortAction {
  @_s.JsonValue('CANCEL')
  cancel,
}

/// Contains a list of criteria that define when and how to cancel a
/// configuration deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobAbortConfig {
  /// The list of criteria that define when and how to cancel the configuration
  /// deployment.
  @_s.JsonKey(name: 'criteriaList')
  final List<IoTJobAbortCriteria> criteriaList;

  IoTJobAbortConfig({
    @_s.required this.criteriaList,
  });
  factory IoTJobAbortConfig.fromJson(Map<String, dynamic> json) =>
      _$IoTJobAbortConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobAbortConfigToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobAbortCriteria {
  /// The action to perform when the criteria are met.
  @_s.JsonKey(name: 'action')
  final IoTJobAbortAction action;

  /// The type of job deployment failure that can cancel a job.
  @_s.JsonKey(name: 'failureType')
  final IoTJobExecutionFailureType failureType;

  /// The minimum number of things that receive the configuration before the job
  /// can cancel.
  @_s.JsonKey(name: 'minNumberOfExecutedThings')
  final int minNumberOfExecutedThings;

  /// The minimum percentage of <code>failureType</code> failures that occur
  /// before the job can cancel.
  ///
  /// This parameter supports up to two digits after the decimal (for example, you
  /// can specify <code>10.9</code> or <code>10.99</code>, but not
  /// <code>10.999</code>).
  @_s.JsonKey(name: 'thresholdPercentage')
  final double thresholdPercentage;

  IoTJobAbortCriteria({
    @_s.required this.action,
    @_s.required this.failureType,
    @_s.required this.minNumberOfExecutedThings,
    @_s.required this.thresholdPercentage,
  });
  factory IoTJobAbortCriteria.fromJson(Map<String, dynamic> json) =>
      _$IoTJobAbortCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobAbortCriteriaToJson(this);
}

enum IoTJobExecutionFailureType {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('ALL')
  all,
}

/// Contains information about the rollout configuration for a job. This
/// configuration defines the rate at which the job deploys a configuration to a
/// fleet of target devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobExecutionsRolloutConfig {
  /// The exponential rate to increase the job rollout rate.
  @_s.JsonKey(name: 'exponentialRate')
  final IoTJobExponentialRolloutRate exponentialRate;

  /// The maximum number of devices that receive a pending job notification, per
  /// minute.
  @_s.JsonKey(name: 'maximumPerMinute')
  final int maximumPerMinute;

  IoTJobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });
  factory IoTJobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) =>
      _$IoTJobExecutionsRolloutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobExecutionsRolloutConfigToJson(this);
}

/// Contains information about an exponential rollout rate for a configuration
/// deployment job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobExponentialRolloutRate {
  /// The minimum number of devices that receive a pending job notification, per
  /// minute, when the job starts. This parameter defines the initial rollout rate
  /// of the job.
  @_s.JsonKey(name: 'baseRatePerMinute')
  final int baseRatePerMinute;

  /// The exponential factor to increase the rollout rate for the job.
  ///
  /// This parameter supports up to one digit after the decimal (for example, you
  /// can specify <code>1.5</code>, but not <code>1.55</code>).
  @_s.JsonKey(name: 'incrementFactor')
  final double incrementFactor;

  /// The criteria to increase the rollout rate for the job.
  @_s.JsonKey(name: 'rateIncreaseCriteria')
  final IoTJobRateIncreaseCriteria rateIncreaseCriteria;

  IoTJobExponentialRolloutRate({
    @_s.required this.baseRatePerMinute,
    @_s.required this.incrementFactor,
    @_s.required this.rateIncreaseCriteria,
  });
  factory IoTJobExponentialRolloutRate.fromJson(Map<String, dynamic> json) =>
      _$IoTJobExponentialRolloutRateFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobExponentialRolloutRateToJson(this);
}

/// Contains information about criteria to meet before a job increases its
/// rollout rate. Specify either <code>numberOfNotifiedThings</code> or
/// <code>numberOfSucceededThings</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobRateIncreaseCriteria {
  /// The number of devices to receive the job notification before the rollout
  /// rate increases.
  @_s.JsonKey(name: 'numberOfNotifiedThings')
  final int numberOfNotifiedThings;

  /// The number of devices to successfully run the configuration job before the
  /// rollout rate increases.
  @_s.JsonKey(name: 'numberOfSucceededThings')
  final int numberOfSucceededThings;

  IoTJobRateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });
  factory IoTJobRateIncreaseCriteria.fromJson(Map<String, dynamic> json) =>
      _$IoTJobRateIncreaseCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobRateIncreaseCriteriaToJson(this);
}

/// Contains information about the timeout configuration for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IoTJobTimeoutConfig {
  /// The amount of time, in minutes, that devices have to complete the job. The
  /// timer starts when the job status is set to <code>IN_PROGRESS</code>. If the
  /// job status doesn't change to a terminal state before the time expires, then
  /// the job status is set to <code>TIMED_OUT</code>.
  ///
  /// The timeout interval must be between 1 minute and 7 days (10080 minutes).
  @_s.JsonKey(name: 'inProgressTimeoutInMinutes')
  final int inProgressTimeoutInMinutes;

  IoTJobTimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });
  factory IoTJobTimeoutConfig.fromJson(Map<String, dynamic> json) =>
      _$IoTJobTimeoutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IoTJobTimeoutConfigToJson(this);
}

/// Contains information about a container in which AWS Lambda functions run on
/// AWS IoT Greengrass core devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaContainerParams {
  /// The list of system devices that the container can access.
  @_s.JsonKey(name: 'devices')
  final List<LambdaDeviceMount> devices;

  /// The memory size of the container, expressed in kilobytes.
  ///
  /// Default: <code>16384</code> (16 MB)
  @_s.JsonKey(name: 'memorySizeInKB')
  final int memorySizeInKB;

  /// Whether or not the container can read information from the device's
  /// <code>/sys</code> folder.
  ///
  /// Default: <code>false</code>
  @_s.JsonKey(name: 'mountROSysfs')
  final bool mountROSysfs;

  /// The list of volumes that the container can access.
  @_s.JsonKey(name: 'volumes')
  final List<LambdaVolumeMount> volumes;

  LambdaContainerParams({
    this.devices,
    this.memorySizeInKB,
    this.mountROSysfs,
    this.volumes,
  });
  Map<String, dynamic> toJson() => _$LambdaContainerParamsToJson(this);
}

/// Contains information about a device that Linux processes in a container can
/// access.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaDeviceMount {
  /// The mount path for the device in the file system.
  @_s.JsonKey(name: 'path')
  final String path;

  /// Whether or not to add the component's system user as an owner of the device.
  ///
  /// Default: <code>false</code>
  @_s.JsonKey(name: 'addGroupOwner')
  final bool addGroupOwner;

  /// The permission to access the device: read/only (<code>ro</code>) or
  /// read/write (<code>rw</code>).
  ///
  /// Default: <code>ro</code>
  @_s.JsonKey(name: 'permission')
  final LambdaFilesystemPermission permission;

  LambdaDeviceMount({
    @_s.required this.path,
    this.addGroupOwner,
    this.permission,
  });
  Map<String, dynamic> toJson() => _$LambdaDeviceMountToJson(this);
}

/// Contains information about an event source for an AWS Lambda function. The
/// event source defines the topics on which this Lambda function subscribes to
/// receive messages that run the function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaEventSource {
  /// The topic to which to subscribe to receive event messages.
  @_s.JsonKey(name: 'topic')
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
  /// <code>IOT_CORE</code> – Subscribe to AWS IoT Core MQTT messages. This event
  /// source type supports MQTT wildcards (<code>+</code> and <code>#</code>) in
  /// the event source topic.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final LambdaEventSourceType type;

  LambdaEventSource({
    @_s.required this.topic,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$LambdaEventSourceToJson(this);
}

enum LambdaEventSourceType {
  @_s.JsonValue('PUB_SUB')
  pubSub,
  @_s.JsonValue('IOT_CORE')
  iotCore,
}

/// Contains parameters for a Lambda function that runs on AWS IoT Greengrass.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaExecutionParameters {
  /// The map of environment variables that are available to the Lambda function
  /// when it runs.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The list of event sources to which to subscribe to receive work messages.
  /// The Lambda function runs when it receives a message from an event source.
  /// You can subscribe this function to local publish/subscribe messages and AWS
  /// IoT Core MQTT messages.
  @_s.JsonKey(name: 'eventSources')
  final List<LambdaEventSource> eventSources;

  /// The list of arguments to pass to the Lambda function when it runs.
  @_s.JsonKey(name: 'execArgs')
  final List<String> execArgs;

  /// The encoding type that the Lambda function supports.
  ///
  /// Default: <code>json</code>
  @_s.JsonKey(name: 'inputPayloadEncodingType')
  final LambdaInputPayloadEncodingType inputPayloadEncodingType;

  /// The parameters for the Linux process that contains the Lambda function.
  @_s.JsonKey(name: 'linuxProcessParams')
  final LambdaLinuxProcessParams linuxProcessParams;

  /// The maximum amount of time in seconds that a non-pinned Lambda function can
  /// idle before the AWS IoT Greengrass Core software stops its process.
  @_s.JsonKey(name: 'maxIdleTimeInSeconds')
  final int maxIdleTimeInSeconds;

  /// The maximum number of instances that a non-pinned Lambda function can run at
  /// the same time.
  @_s.JsonKey(name: 'maxInstancesCount')
  final int maxInstancesCount;

  /// The maximum size of the message queue for the Lambda function component. The
  /// AWS IoT Greengrass core stores messages in a FIFO (first-in-first-out) queue
  /// until it can run the Lambda function to consume each message.
  @_s.JsonKey(name: 'maxQueueSize')
  final int maxQueueSize;

  /// Whether or not the Lambda function is pinned, or long-lived.
  ///
  /// <ul>
  /// <li>
  /// A pinned Lambda function starts when AWS IoT Greengrass starts and keeps
  /// running in its own container.
  /// </li>
  /// <li>
  /// A non-pinned Lambda function starts only when it receives a work item and
  /// exists after it idles for <code>maxIdleTimeInSeconds</code>. If the function
  /// has multiple work items, the AWS IoT Greengrass Core software creates
  /// multiple instances of the function.
  /// </li>
  /// </ul>
  /// Default: <code>true</code>
  @_s.JsonKey(name: 'pinned')
  final bool pinned;

  /// The interval in seconds at which a pinned (also known as long-lived) Lambda
  /// function component sends status updates to the Lambda manager component.
  @_s.JsonKey(name: 'statusTimeoutInSeconds')
  final int statusTimeoutInSeconds;

  /// The maximum amount of time in seconds that the Lambda function can process a
  /// work item.
  @_s.JsonKey(name: 'timeoutInSeconds')
  final int timeoutInSeconds;

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
  Map<String, dynamic> toJson() => _$LambdaExecutionParametersToJson(this);
}

enum LambdaFilesystemPermission {
  @_s.JsonValue('ro')
  ro,
  @_s.JsonValue('rw')
  rw,
}

/// Contains information about an AWS Lambda function to import to create a
/// component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaFunctionRecipeSource {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Lambda function. The ARN must include the version of the function to
  /// import. You can't use version aliases like <code>$LATEST</code>.
  @_s.JsonKey(name: 'lambdaArn')
  final String lambdaArn;

  /// The component versions on which this Lambda function component depends.
  @_s.JsonKey(name: 'componentDependencies')
  final Map<String, ComponentDependencyRequirement> componentDependencies;

  /// The system and runtime parameters for the Lambda function as it runs on the
  /// AWS IoT Greengrass core device.
  @_s.JsonKey(name: 'componentLambdaParameters')
  final LambdaExecutionParameters componentLambdaParameters;

  /// The name of the component.
  ///
  /// Defaults to the name of the Lambda function.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The platforms that the component version supports.
  @_s.JsonKey(name: 'componentPlatforms')
  final List<ComponentPlatform> componentPlatforms;

  /// The version of the component.
  ///
  /// Defaults to the version of the Lambda function as a semantic version. For
  /// example, if your function version is <code>3</code>, the component version
  /// becomes <code>3.0.0</code>.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  LambdaFunctionRecipeSource({
    @_s.required this.lambdaArn,
    this.componentDependencies,
    this.componentLambdaParameters,
    this.componentName,
    this.componentPlatforms,
    this.componentVersion,
  });
  Map<String, dynamic> toJson() => _$LambdaFunctionRecipeSourceToJson(this);
}

enum LambdaInputPayloadEncodingType {
  @_s.JsonValue('json')
  json,
  @_s.JsonValue('binary')
  binary,
}

enum LambdaIsolationMode {
  @_s.JsonValue('GreengrassContainer')
  greengrassContainer,
  @_s.JsonValue('NoContainer')
  noContainer,
}

/// Contains parameters for a Linux process that contains an AWS Lambda
/// function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaLinuxProcessParams {
  /// The parameters for the container in which the Lambda function runs.
  @_s.JsonKey(name: 'containerParams')
  final LambdaContainerParams containerParams;

  /// The isolation mode for the process that contains the Lambda function. The
  /// process can run in an isolated runtime environment inside the AWS IoT
  /// Greengrass container, or as a regular process outside any container.
  ///
  /// Default: <code>GreengrassContainer</code>
  @_s.JsonKey(name: 'isolationMode')
  final LambdaIsolationMode isolationMode;

  LambdaLinuxProcessParams({
    this.containerParams,
    this.isolationMode,
  });
  Map<String, dynamic> toJson() => _$LambdaLinuxProcessParamsToJson(this);
}

/// Contains information about a volume that Linux processes in a container can
/// access. When you define a volume, the AWS IoT Greengrass Core software
/// mounts the source files to the destination inside the container.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaVolumeMount {
  /// The path to the logical volume in the file system.
  @_s.JsonKey(name: 'destinationPath')
  final String destinationPath;

  /// The path to the physical volume in the file system.
  @_s.JsonKey(name: 'sourcePath')
  final String sourcePath;

  /// Whether or not to add the AWS IoT Greengrass user group as an owner of the
  /// volume.
  ///
  /// Default: <code>false</code>
  @_s.JsonKey(name: 'addGroupOwner')
  final bool addGroupOwner;

  /// The permission to access the volume: read/only (<code>ro</code>) or
  /// read/write (<code>rw</code>).
  ///
  /// Default: <code>ro</code>
  @_s.JsonKey(name: 'permission')
  final LambdaFilesystemPermission permission;

  LambdaVolumeMount({
    @_s.required this.destinationPath,
    @_s.required this.sourcePath,
    this.addGroupOwner,
    this.permission,
  });
  Map<String, dynamic> toJson() => _$LambdaVolumeMountToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComponentVersionsResponse {
  /// A list of versions that exist for the component.
  @_s.JsonKey(name: 'componentVersions')
  final List<ComponentVersionListItem> componentVersions;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListComponentVersionsResponse({
    this.componentVersions,
    this.nextToken,
  });
  factory ListComponentVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListComponentVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComponentsResponse {
  /// A list that summarizes each component.
  @_s.JsonKey(name: 'components')
  final List<Component> components;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListComponentsResponse({
    this.components,
    this.nextToken,
  });
  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListComponentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCoreDevicesResponse {
  /// A list that summarizes each core device.
  @_s.JsonKey(name: 'coreDevices')
  final List<CoreDevice> coreDevices;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListCoreDevicesResponse({
    this.coreDevices,
    this.nextToken,
  });
  factory ListCoreDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCoreDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentsResponse {
  /// A list that summarizes each deployment.
  @_s.JsonKey(name: 'deployments')
  final List<Deployment> deployments;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentsResponse({
    this.deployments,
    this.nextToken,
  });
  factory ListDeploymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEffectiveDeploymentsResponse {
  /// A list that summarizes each deployment on the core device.
  @_s.JsonKey(name: 'effectiveDeployments')
  final List<EffectiveDeployment> effectiveDeployments;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListEffectiveDeploymentsResponse({
    this.effectiveDeployments,
    this.nextToken,
  });
  factory ListEffectiveDeploymentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListEffectiveDeploymentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstalledComponentsResponse {
  /// A list that summarizes each component on the core device.
  @_s.JsonKey(name: 'installedComponents')
  final List<InstalledComponent> installedComponents;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInstalledComponentsResponse({
    this.installedComponents,
    this.nextToken,
  });
  factory ListInstalledComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInstalledComponentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/tag-resources.html">Tag your
  /// resources</a> in the <i>AWS IoT Greengrass V2 Developer Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum RecipeOutputFormat {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('YAML')
  yaml,
}

extension on RecipeOutputFormat {
  String toValue() {
    switch (this) {
      case RecipeOutputFormat.json:
        return 'JSON';
      case RecipeOutputFormat.yaml:
        return 'YAML';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolveComponentCandidatesResponse {
  /// A list of components that meet the requirements that you specify in the
  /// request. This list includes each component's recipe that you can use to
  /// install the component.
  @_s.JsonKey(name: 'resolvedComponentVersions')
  final List<ResolvedComponentVersion> resolvedComponentVersions;

  ResolveComponentCandidatesResponse({
    this.resolvedComponentVersions,
  });
  factory ResolveComponentCandidatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ResolveComponentCandidatesResponseFromJson(json);
}

/// Contains information about a component version that is compatible to run on
/// a AWS IoT Greengrass core device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolvedComponentVersion {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the component version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the component.
  @_s.JsonKey(name: 'componentName')
  final String componentName;

  /// The version of the component.
  @_s.JsonKey(name: 'componentVersion')
  final String componentVersion;

  /// The recipe of the component version.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'recipe')
  final Uint8List recipe;

  ResolvedComponentVersion({
    this.arn,
    this.componentName,
    this.componentVersion,
    this.recipe,
  });
  factory ResolvedComponentVersion.fromJson(Map<String, dynamic> json) =>
      _$ResolvedComponentVersionFromJson(json);
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
