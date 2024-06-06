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

/// This is the Proton Service API Reference. It provides descriptions, syntax
/// and usage examples for each of the <a
/// href="https://docs.aws.amazon.com/proton/latest/APIReference/API_Operations.html">actions</a>
/// and <a
/// href="https://docs.aws.amazon.com/proton/latest/APIReference/API_Types.html">data
/// types</a> for the Proton service.
///
/// The documentation for each action shows the Query API request parameters and
/// the XML response.
///
/// Alternatively, you can use the Amazon Web Services CLI to access an API. For
/// more information, see the <a
/// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html">Amazon
/// Web Services Command Line Interface User Guide</a>.
///
/// The Proton service is a two-pronged automation framework. Administrators
/// create service templates to provide standardized infrastructure and
/// deployment tooling for serverless and container based applications.
/// Developers, in turn, select from the available service templates to automate
/// their application or service deployments.
///
/// Because administrators define the infrastructure and tooling that Proton
/// deploys and manages, they need permissions to use all of the listed API
/// operations.
///
/// When developers select a specific infrastructure and tooling set, Proton
/// deploys their applications. To monitor their applications that are running
/// on Proton, developers need permissions to the service <i>create</i>,
/// <i>list</i>, <i>update</i> and <i>delete</i> API operations and the service
/// instance <i>list</i> and <i>update</i> API operations.
///
/// To learn more about Proton, see the <a
/// href="https://docs.aws.amazon.com/proton/latest/userguide/Welcome.html">Proton
/// User Guide</a>.
///
/// <b>Ensuring Idempotency</b>
///
/// When you make a mutating API request, the request typically returns a result
/// before the asynchronous workflows of the operation are complete. Operations
/// might also time out or encounter other server issues before they're
/// complete, even if the request already returned a result. This might make it
/// difficult to determine whether the request succeeded. Moreover, you might
/// need to retry the request multiple times to ensure that the operation
/// completes successfully. However, if the original request and the subsequent
/// retries are successful, the operation occurs multiple times. This means that
/// you might create more resources than you intended.
///
/// <i>Idempotency</i> ensures that an API request action completes no more than
/// one time. With an idempotent request, if the original request action
/// completes successfully, any subsequent retries complete successfully without
/// performing any further actions. However, the result might contain updated
/// information, such as the current creation status.
///
/// The following lists of APIs are grouped according to methods that ensure
/// idempotency.
///
/// <b>Idempotent create APIs with a client token</b>
///
/// The API actions in this list support idempotency with the use of a <i>client
/// token</i>. The corresponding Amazon Web Services CLI commands also support
/// idempotency using a client token. A client token is a unique, case-sensitive
/// string of up to 64 ASCII characters. To make an idempotent API request using
/// one of these actions, specify a client token in the request. We recommend
/// that you <i>don't</i> reuse the same client token for other API requests. If
/// you don’t provide a client token for these APIs, a default client token is
/// automatically provided by SDKs.
///
/// Given a request action that has succeeded:
///
/// If you retry the request using the same client token and the same
/// parameters, the retry succeeds without performing any further actions other
/// than returning the original resource detail data in the response.
///
/// If you retry the request using the same client token, but one or more of the
/// parameters are different, the retry throws a
/// <code>ValidationException</code> with an
/// <code>IdempotentParameterMismatch</code> error.
///
/// Client tokens expire eight hours after a request is made. If you retry the
/// request with the expired token, a new resource is created.
///
/// If the original resource is deleted and you retry the request, a new
/// resource is created.
///
/// Idempotent create APIs with a client token:
///
/// <ul>
/// <li>
/// CreateEnvironmentTemplateVersion
/// </li>
/// <li>
/// CreateServiceTemplateVersion
/// </li>
/// <li>
/// CreateEnvironmentAccountConnection
/// </li>
/// </ul>
/// <b>Idempotent create APIs</b>
///
/// Given a request action that has succeeded:
///
/// If you retry the request with an API from this group, and the original
/// resource <i>hasn't</i> been modified, the retry succeeds without performing
/// any further actions other than returning the original resource detail data
/// in the response.
///
/// If the original resource has been modified, the retry throws a
/// <code>ConflictException</code>.
///
/// If you retry with different input parameters, the retry throws a
/// <code>ValidationException</code> with an
/// <code>IdempotentParameterMismatch</code> error.
///
/// Idempotent create APIs:
///
/// <ul>
/// <li>
/// CreateEnvironmentTemplate
/// </li>
/// <li>
/// CreateServiceTemplate
/// </li>
/// <li>
/// CreateEnvironment
/// </li>
/// <li>
/// CreateService
/// </li>
/// </ul>
/// <b>Idempotent delete APIs</b>
///
/// Given a request action that has succeeded:
///
/// When you retry the request with an API from this group and the resource was
/// deleted, its metadata is returned in the response.
///
/// If you retry and the resource doesn't exist, the response is empty.
///
/// In both cases, the retry succeeds.
///
/// Idempotent delete APIs:
///
/// <ul>
/// <li>
/// DeleteEnvironmentTemplate
/// </li>
/// <li>
/// DeleteEnvironmentTemplateVersion
/// </li>
/// <li>
/// DeleteServiceTemplate
/// </li>
/// <li>
/// DeleteServiceTemplateVersion
/// </li>
/// <li>
/// DeleteEnvironmentAccountConnection
/// </li>
/// </ul>
/// <b>Asynchronous idempotent delete APIs</b>
///
/// Given a request action that has succeeded:
///
/// If you retry the request with an API from this group, if the original
/// request delete operation status is <code>DELETE_IN_PROGRESS</code>, the
/// retry returns the resource detail data in the response without performing
/// any further actions.
///
/// If the original request delete operation is complete, a retry returns an
/// empty response.
///
/// Asynchronous idempotent delete APIs:
///
/// <ul>
/// <li>
/// DeleteEnvironment
/// </li>
/// <li>
/// DeleteService
/// </li>
/// </ul>
class Proton {
  final _s.JsonProtocol _protocol;
  Proton({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'proton',
            signingName: 'proton',
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

  /// In a management account, an environment account connection request is
  /// accepted. When the environment account connection request is accepted,
  /// Proton can use the associated IAM role to provision environment
  /// infrastructure resources in the associated environment account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment account connection.
  Future<AcceptEnvironmentAccountConnectionOutput>
      acceptEnvironmentAccountConnection({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.AcceptEnvironmentAccountConnection'
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

    return AcceptEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to cancel a component deployment (for a component that is in the
  /// <code>IN_PROGRESS</code> deployment status).
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component with the deployment to cancel.
  Future<CancelComponentDeploymentOutput> cancelComponentDeployment({
    required String componentName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CancelComponentDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'componentName': componentName,
      },
    );

    return CancelComponentDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to cancel an environment deployment on an
  /// <a>UpdateEnvironment</a> action, if the deployment is
  /// <code>IN_PROGRESS</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-update.html">Update
  /// an environment</a> in the <i>Proton User guide</i>.
  ///
  /// The following list includes potential cancellation scenarios.
  ///
  /// <ul>
  /// <li>
  /// If the cancellation attempt succeeds, the resulting deployment state is
  /// <code>CANCELLED</code>.
  /// </li>
  /// <li>
  /// If the cancellation attempt fails, the resulting deployment state is
  /// <code>FAILED</code>.
  /// </li>
  /// <li>
  /// If the current <a>UpdateEnvironment</a> action succeeds before the
  /// cancellation attempt starts, the resulting deployment state is
  /// <code>SUCCEEDED</code> and the cancellation attempt has no effect.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// The name of the environment with the deployment to cancel.
  Future<CancelEnvironmentDeploymentOutput> cancelEnvironmentDeployment({
    required String environmentName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CancelEnvironmentDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentName': environmentName,
      },
    );

    return CancelEnvironmentDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to cancel a service instance deployment on an
  /// <a>UpdateServiceInstance</a> action, if the deployment is
  /// <code>IN_PROGRESS</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-instance-update.html">Update
  /// a service instance</a> in the <i>Proton User guide</i>.
  ///
  /// The following list includes potential cancellation scenarios.
  ///
  /// <ul>
  /// <li>
  /// If the cancellation attempt succeeds, the resulting deployment state is
  /// <code>CANCELLED</code>.
  /// </li>
  /// <li>
  /// If the cancellation attempt fails, the resulting deployment state is
  /// <code>FAILED</code>.
  /// </li>
  /// <li>
  /// If the current <a>UpdateServiceInstance</a> action succeeds before the
  /// cancellation attempt starts, the resulting deployment state is
  /// <code>SUCCEEDED</code> and the cancellation attempt has no effect.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance with the deployment to cancel.
  ///
  /// Parameter [serviceName] :
  /// The name of the service with the service instance deployment to cancel.
  Future<CancelServiceInstanceDeploymentOutput>
      cancelServiceInstanceDeployment({
    required String serviceInstanceName,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CancelServiceInstanceDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceInstanceName': serviceInstanceName,
        'serviceName': serviceName,
      },
    );

    return CancelServiceInstanceDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to cancel a service pipeline deployment on an
  /// <a>UpdateServicePipeline</a> action, if the deployment is
  /// <code>IN_PROGRESS</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-pipeline-update.html">Update
  /// a service pipeline</a> in the <i>Proton User guide</i>.
  ///
  /// The following list includes potential cancellation scenarios.
  ///
  /// <ul>
  /// <li>
  /// If the cancellation attempt succeeds, the resulting deployment state is
  /// <code>CANCELLED</code>.
  /// </li>
  /// <li>
  /// If the cancellation attempt fails, the resulting deployment state is
  /// <code>FAILED</code>.
  /// </li>
  /// <li>
  /// If the current <a>UpdateServicePipeline</a> action succeeds before the
  /// cancellation attempt starts, the resulting deployment state is
  /// <code>SUCCEEDED</code> and the cancellation attempt has no effect.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service with the service pipeline deployment to cancel.
  Future<CancelServicePipelineDeploymentOutput>
      cancelServicePipelineDeployment({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CancelServicePipelineDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );

    return CancelServicePipelineDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Create an Proton component. A component is an infrastructure extension for
  /// a service instance.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [manifest] :
  /// A path to a manifest file that lists the Infrastructure as Code (IaC)
  /// file, template language, and rendering engine for infrastructure that a
  /// custom component provisions.
  ///
  /// Parameter [name] :
  /// The customer-provided name of the component.
  ///
  /// Parameter [templateFile] :
  /// A path to the Infrastructure as Code (IaC) file describing infrastructure
  /// that a custom component provisions.
  /// <note>
  /// Components support a single IaC file, even if you use Terraform as your
  /// template language.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// The client token for the created component.
  ///
  /// Parameter [description] :
  /// An optional customer-provided description of the component.
  ///
  /// Parameter [environmentName] :
  /// The name of the Proton environment that you want to associate this
  /// component with. You must specify this when you don't specify
  /// <code>serviceInstanceName</code> and <code>serviceName</code>.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance that you want to attach this component
  /// to. If you don't specify this, the component isn't attached to any service
  /// instance. Specify both <code>serviceInstanceName</code> and
  /// <code>serviceName</code> or neither of them.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that <code>serviceInstanceName</code> is
  /// associated with. If you don't specify this, the component isn't attached
  /// to any service instance. Specify both <code>serviceInstanceName</code> and
  /// <code>serviceName</code> or neither of them.
  ///
  /// Parameter [serviceSpec] :
  /// The service spec that you want the component to use to access service
  /// inputs. Set this only when you attach the component to a service instance.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// component. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateComponentOutput> createComponent({
    required String manifest,
    required String name,
    required String templateFile,
    String? clientToken,
    String? description,
    String? environmentName,
    String? serviceInstanceName,
    String? serviceName,
    String? serviceSpec,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'manifest': manifest,
        'name': name,
        'templateFile': templateFile,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (environmentName != null) 'environmentName': environmentName,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
        if (serviceName != null) 'serviceName': serviceName,
        if (serviceSpec != null) 'serviceSpec': serviceSpec,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateComponentOutput.fromJson(jsonResponse.body);
  }

  /// Deploy a new environment. An Proton environment is created from an
  /// environment template that defines infrastructure and resources that can be
  /// shared across services.
  /// <p class="title"> <b>You can provision environments using the following
  /// methods:</b>
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services-managed provisioning: Proton makes direct calls to
  /// provision your resources.
  /// </li>
  /// <li>
  /// Self-managed provisioning: Proton makes pull requests on your repository
  /// to provide compiled infrastructure as code (IaC) files that your IaC
  /// engine uses to provision resources.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html">Environments</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html">Provisioning
  /// methods</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment.
  ///
  /// Parameter [spec] :
  /// A YAML formatted string that provides inputs as defined in the environment
  /// template bundle schema file. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html">Environments</a>
  /// in the <i>Proton User Guide</i>.
  ///
  /// Parameter [templateMajorVersion] :
  /// The major version of the environment template.
  ///
  /// Parameter [templateName] :
  /// The name of the environment template. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html">Environment
  /// Templates</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [codebuildRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that allows Proton
  /// to provision infrastructure using CodeBuild-based provisioning on your
  /// behalf.
  ///
  /// To use CodeBuild-based provisioning for the environment or for any service
  /// instance running in the environment, specify either the
  /// <code>environmentAccountConnectionId</code> or
  /// <code>codebuildRoleArn</code> parameter.
  ///
  /// Parameter [componentRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses
  /// when provisioning directly defined components in this environment. It
  /// determines the scope of infrastructure that a component can provision.
  ///
  /// You must specify <code>componentRoleArn</code> to allow directly defined
  /// components to be associated with this environment.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [description] :
  /// A description of the environment that's being created and deployed.
  ///
  /// Parameter [environmentAccountConnectionId] :
  /// The ID of the environment account connection that you provide if you're
  /// provisioning your environment infrastructure resources to an environment
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// To use Amazon Web Services-managed provisioning for the environment,
  /// specify either the <code>environmentAccountConnectionId</code> or
  /// <code>protonServiceRoleArn</code> parameter and omit the
  /// <code>provisioningRepository</code> parameter.
  ///
  /// Parameter [protonServiceRoleArn] :
  /// The Amazon Resource Name (ARN) of the Proton service role that allows
  /// Proton to make calls to other services on your behalf.
  ///
  /// To use Amazon Web Services-managed provisioning for the environment,
  /// specify either the <code>environmentAccountConnectionId</code> or
  /// <code>protonServiceRoleArn</code> parameter and omit the
  /// <code>provisioningRepository</code> parameter.
  ///
  /// Parameter [provisioningRepository] :
  /// The linked repository that you use to host your rendered infrastructure
  /// templates for self-managed provisioning. A linked repository is a
  /// repository that has been registered with Proton. For more information, see
  /// <a>CreateRepository</a>.
  ///
  /// To use self-managed provisioning for the environment, specify this
  /// parameter and omit the <code>environmentAccountConnectionId</code> and
  /// <code>protonServiceRoleArn</code> parameters.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// environment. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [templateMinorVersion] :
  /// The minor version of the environment template.
  Future<CreateEnvironmentOutput> createEnvironment({
    required String name,
    required String spec,
    required String templateMajorVersion,
    required String templateName,
    String? codebuildRoleArn,
    String? componentRoleArn,
    String? description,
    String? environmentAccountConnectionId,
    String? protonServiceRoleArn,
    RepositoryBranchInput? provisioningRepository,
    List<Tag>? tags,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'spec': spec,
        'templateMajorVersion': templateMajorVersion,
        'templateName': templateName,
        if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
        if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
        if (description != null) 'description': description,
        if (environmentAccountConnectionId != null)
          'environmentAccountConnectionId': environmentAccountConnectionId,
        if (protonServiceRoleArn != null)
          'protonServiceRoleArn': protonServiceRoleArn,
        if (provisioningRepository != null)
          'provisioningRepository': provisioningRepository,
        if (tags != null) 'tags': tags,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return CreateEnvironmentOutput.fromJson(jsonResponse.body);
  }

  /// Create an environment account connection in an environment account so that
  /// environment infrastructure resources can be provisioned in the environment
  /// account from a management account.
  ///
  /// An environment account connection is a secure bi-directional connection
  /// between a <i>management account</i> and an <i>environment account</i> that
  /// maintains authorization and permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// The name of the Proton environment that's created in the associated
  /// management account.
  ///
  /// Parameter [managementAccountId] :
  /// The ID of the management account that accepts or rejects the environment
  /// account connection. You create and manage the Proton environment in this
  /// account. If the management account accepts the environment account
  /// connection, Proton can use the associated IAM role to provision
  /// environment infrastructure resources in the associated environment
  /// account.
  ///
  /// Parameter [clientToken] :
  /// When included, if two identical requests are made with the same client
  /// token, Proton returns the environment account connection that the first
  /// request created.
  ///
  /// Parameter [codebuildRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role in the environment
  /// account. Proton uses this role to provision infrastructure resources using
  /// CodeBuild-based provisioning in the associated environment account.
  ///
  /// Parameter [componentRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses
  /// when provisioning directly defined components in the associated
  /// environment account. It determines the scope of infrastructure that a
  /// component can provision in the account.
  ///
  /// You must specify <code>componentRoleArn</code> to allow directly defined
  /// components to be associated with any environments running in this account.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that's created in
  /// the environment account. Proton uses this role to provision infrastructure
  /// resources in the associated environment account.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// environment account connection. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateEnvironmentAccountConnectionOutput>
      createEnvironmentAccountConnection({
    required String environmentName,
    required String managementAccountId,
    String? clientToken,
    String? codebuildRoleArn,
    String? componentRoleArn,
    String? roleArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateEnvironmentAccountConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentName': environmentName,
        'managementAccountId': managementAccountId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
        if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
        if (roleArn != null) 'roleArn': roleArn,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Create an environment template for Proton. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html">Environment
  /// Templates</a> in the <i>Proton User Guide</i>.
  ///
  /// You can create an environment template in one of the two following ways:
  ///
  /// <ul>
  /// <li>
  /// Register and publish a <i>standard</i> environment template that instructs
  /// Proton to deploy and manage environment infrastructure.
  /// </li>
  /// <li>
  /// Register and publish a <i>customer managed</i> environment template that
  /// connects Proton to your existing provisioned infrastructure that you
  /// manage. Proton <i>doesn't</i> manage your existing provisioned
  /// infrastructure. To create an environment template for customer provisioned
  /// and managed infrastructure, include the <code>provisioning</code>
  /// parameter and set the value to <code>CUSTOMER_MANAGED</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/template-create.html">Register
  /// and publish an environment template</a> in the <i>Proton User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment template.
  ///
  /// Parameter [description] :
  /// A description of the environment template.
  ///
  /// Parameter [displayName] :
  /// The environment template name as displayed in the developer interface.
  ///
  /// Parameter [encryptionKey] :
  /// A customer provided encryption key that Proton uses to encrypt data.
  ///
  /// Parameter [provisioning] :
  /// When included, indicates that the environment template is for customer
  /// provisioned and managed infrastructure.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// environment template. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateEnvironmentTemplateOutput> createEnvironmentTemplate({
    required String name,
    String? description,
    String? displayName,
    String? encryptionKey,
    Provisioning? provisioning,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateEnvironmentTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (displayName != null) 'displayName': displayName,
        if (encryptionKey != null) 'encryptionKey': encryptionKey,
        if (provisioning != null) 'provisioning': provisioning.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEnvironmentTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Create a new major or minor version of an environment template. A major
  /// version of an environment template is a version that <i>isn't</i>
  /// backwards compatible. A minor version of an environment template is a
  /// version that's backwards compatible within its major version.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [source] :
  /// An object that includes the template bundle S3 bucket path and name for
  /// the new version of an template.
  ///
  /// Parameter [templateName] :
  /// The name of the environment template.
  ///
  /// Parameter [clientToken] :
  /// When included, if two identical requests are made with the same client
  /// token, Proton returns the environment template version that the first
  /// request created.
  ///
  /// Parameter [description] :
  /// A description of the new version of an environment template.
  ///
  /// Parameter [majorVersion] :
  /// To create a new minor version of the environment template, include
  /// <code>major Version</code>.
  ///
  /// To create a new major and minor version of the environment template,
  /// exclude <code>major Version</code>.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// environment template version. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateEnvironmentTemplateVersionOutput>
      createEnvironmentTemplateVersion({
    required TemplateVersionSourceInput source,
    required String templateName,
    String? clientToken,
    String? description,
    String? majorVersion,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateEnvironmentTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'source': source,
        'templateName': templateName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (majorVersion != null) 'majorVersion': majorVersion,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEnvironmentTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Create and register a link to a repository. Proton uses the link to
  /// repeatedly access the repository, to either push to it (self-managed
  /// provisioning) or pull from it (template sync). You can share a linked
  /// repository across multiple resources (like environments using self-managed
  /// provisioning, or synced templates). When you create a repository link,
  /// Proton creates a <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/using-service-linked-roles.html">service-linked
  /// role</a> for you.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self">Self-managed
  /// provisioning</a>, <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles">Template
  /// bundles</a>, and <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html">Template
  /// sync configurations</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of your AWS CodeStar connection that
  /// connects Proton to your repository provider account. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html">Setting
  /// up for Proton</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [name] :
  /// The repository name (for example, <code>myrepos/myrepo</code>).
  ///
  /// Parameter [provider] :
  /// The repository provider.
  ///
  /// Parameter [encryptionKey] :
  /// The ARN of your customer Amazon Web Services Key Management Service
  /// (Amazon Web Services KMS) key.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// repository. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateRepositoryOutput> createRepository({
    required String connectionArn,
    required String name,
    required RepositoryProvider provider,
    String? encryptionKey,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionArn': connectionArn,
        'name': name,
        'provider': provider.toValue(),
        if (encryptionKey != null) 'encryptionKey': encryptionKey,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Create an Proton service. An Proton service is an instantiation of a
  /// service template and often includes several service instances and
  /// pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-services.html">Services</a>
  /// in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The service name.
  ///
  /// Parameter [spec] :
  /// A link to a spec file that provides inputs as defined in the service
  /// template bundle schema file. The spec file is in YAML format. <i>Don’t</i>
  /// include pipeline inputs in the spec if your service template
  /// <i>doesn’t</i> include a service pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-create-svc.html">Create
  /// a service</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [templateMajorVersion] :
  /// The major version of the service template that was used to create the
  /// service.
  ///
  /// Parameter [templateName] :
  /// The name of the service template that's used to create the service.
  ///
  /// Parameter [branchName] :
  /// The name of the code repository branch that holds the code that's deployed
  /// in Proton. <i>Don't</i> include this parameter if your service template
  /// <i>doesn't</i> include a service pipeline.
  ///
  /// Parameter [description] :
  /// A description of the Proton service.
  ///
  /// Parameter [repositoryConnectionArn] :
  /// The Amazon Resource Name (ARN) of the repository connection. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol">Setting
  /// up an AWS CodeStar connection</a> in the <i>Proton User Guide</i>.
  /// <i>Don't</i> include this parameter if your service template
  /// <i>doesn't</i> include a service pipeline.
  ///
  /// Parameter [repositoryId] :
  /// The ID of the code repository. <i>Don't</i> include this parameter if your
  /// service template <i>doesn't</i> include a service pipeline.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// service. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [templateMinorVersion] :
  /// The minor version of the service template that was used to create the
  /// service.
  Future<CreateServiceOutput> createService({
    required String name,
    required String spec,
    required String templateMajorVersion,
    required String templateName,
    String? branchName,
    String? description,
    String? repositoryConnectionArn,
    String? repositoryId,
    List<Tag>? tags,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'spec': spec,
        'templateMajorVersion': templateMajorVersion,
        'templateName': templateName,
        if (branchName != null) 'branchName': branchName,
        if (description != null) 'description': description,
        if (repositoryConnectionArn != null)
          'repositoryConnectionArn': repositoryConnectionArn,
        if (repositoryId != null) 'repositoryId': repositoryId,
        if (tags != null) 'tags': tags,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return CreateServiceOutput.fromJson(jsonResponse.body);
  }

  /// Create a service instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service instance to create.
  ///
  /// Parameter [serviceName] :
  /// The name of the service the service instance is added to.
  ///
  /// Parameter [spec] :
  /// The spec for the service instance you want to create.
  ///
  /// Parameter [clientToken] :
  /// The client token of the service instance to create.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// service instance. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [templateMajorVersion] :
  /// To create a new major and minor version of the service template,
  /// <i>exclude</i> <code>major Version</code>.
  ///
  /// Parameter [templateMinorVersion] :
  /// To create a new minor version of the service template, include a
  /// <code>major Version</code>.
  Future<CreateServiceInstanceOutput> createServiceInstance({
    required String name,
    required String serviceName,
    required String spec,
    String? clientToken,
    List<Tag>? tags,
    String? templateMajorVersion,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateServiceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'serviceName': serviceName,
        'spec': spec,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'tags': tags,
        if (templateMajorVersion != null)
          'templateMajorVersion': templateMajorVersion,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return CreateServiceInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Create the Proton Ops configuration file.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [branch] :
  /// The repository branch for your Proton Ops file.
  ///
  /// Parameter [filePath] :
  /// The path to the Proton Ops file.
  ///
  /// Parameter [repositoryName] :
  /// The repository name.
  ///
  /// Parameter [repositoryProvider] :
  /// The provider type for your repository.
  ///
  /// Parameter [serviceName] :
  /// The name of the service the Proton Ops file is for.
  Future<CreateServiceSyncConfigOutput> createServiceSyncConfig({
    required String branch,
    required String filePath,
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateServiceSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branch': branch,
        'filePath': filePath,
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'serviceName': serviceName,
      },
    );

    return CreateServiceSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Create a service template. The administrator creates a service template to
  /// define standardized infrastructure and an optional CI/CD service pipeline.
  /// Developers, in turn, select the service template from Proton. If the
  /// selected service template includes a service pipeline definition, they
  /// provide a link to their source code repository. Proton then deploys and
  /// manages the infrastructure defined by the selected service template. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html">Proton
  /// templates</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service template.
  ///
  /// Parameter [description] :
  /// A description of the service template.
  ///
  /// Parameter [displayName] :
  /// The name of the service template as displayed in the developer interface.
  ///
  /// Parameter [encryptionKey] :
  /// A customer provided encryption key that's used to encrypt data.
  ///
  /// Parameter [pipelineProvisioning] :
  /// By default, Proton provides a service pipeline for your service. When this
  /// parameter is included, it indicates that an Proton service pipeline
  /// <i>isn't</i> provided for your service. After it's included, it
  /// <i>can't</i> be changed. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles">Template
  /// bundles</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// service template. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateServiceTemplateOutput> createServiceTemplate({
    required String name,
    String? description,
    String? displayName,
    String? encryptionKey,
    Provisioning? pipelineProvisioning,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateServiceTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (displayName != null) 'displayName': displayName,
        if (encryptionKey != null) 'encryptionKey': encryptionKey,
        if (pipelineProvisioning != null)
          'pipelineProvisioning': pipelineProvisioning.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateServiceTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Create a new major or minor version of a service template. A major version
  /// of a service template is a version that <i>isn't</i> backward compatible.
  /// A minor version of a service template is a version that's backward
  /// compatible within its major version.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [compatibleEnvironmentTemplates] :
  /// An array of environment template objects that are compatible with the new
  /// service template version. A service instance based on this service
  /// template version can run in environments based on compatible templates.
  ///
  /// Parameter [source] :
  /// An object that includes the template bundle S3 bucket path and name for
  /// the new version of a service template.
  ///
  /// Parameter [templateName] :
  /// The name of the service template.
  ///
  /// Parameter [clientToken] :
  /// When included, if two identical requests are made with the same client
  /// token, Proton returns the service template version that the first request
  /// created.
  ///
  /// Parameter [description] :
  /// A description of the new version of a service template.
  ///
  /// Parameter [majorVersion] :
  /// To create a new minor version of the service template, include a
  /// <code>major Version</code>.
  ///
  /// To create a new major and minor version of the service template,
  /// <i>exclude</i> <code>major Version</code>.
  ///
  /// Parameter [supportedComponentSources] :
  /// An array of supported component sources. Components with supported sources
  /// can be attached to service instances based on this service template
  /// version.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the Proton
  /// service template version. A tag is a key-value pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  Future<CreateServiceTemplateVersionOutput> createServiceTemplateVersion({
    required List<CompatibleEnvironmentTemplateInput>
        compatibleEnvironmentTemplates,
    required TemplateVersionSourceInput source,
    required String templateName,
    String? clientToken,
    String? description,
    String? majorVersion,
    List<ServiceTemplateSupportedComponentSourceType>?
        supportedComponentSources,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateServiceTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'compatibleEnvironmentTemplates': compatibleEnvironmentTemplates,
        'source': source,
        'templateName': templateName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (majorVersion != null) 'majorVersion': majorVersion,
        if (supportedComponentSources != null)
          'supportedComponentSources':
              supportedComponentSources.map((e) => e.toValue()).toList(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateServiceTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Set up a template to create new template versions automatically by
  /// tracking a linked repository. A linked repository is a repository that has
  /// been registered with Proton. For more information, see
  /// <a>CreateRepository</a>.
  ///
  /// When a commit is pushed to your linked repository, Proton checks for
  /// changes to your repository template bundles. If it detects a template
  /// bundle change, a new major or minor version of its template is created, if
  /// the version doesn’t already exist. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html">Template
  /// sync configurations</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [branch] :
  /// The repository branch for your template.
  ///
  /// Parameter [repositoryName] :
  /// The repository name (for example, <code>myrepos/myrepo</code>).
  ///
  /// Parameter [repositoryProvider] :
  /// The provider type for your repository.
  ///
  /// Parameter [templateName] :
  /// The name of your registered template.
  ///
  /// Parameter [templateType] :
  /// The type of the registered template.
  ///
  /// Parameter [subdirectory] :
  /// A repository subdirectory path to your template bundle directory. When
  /// included, Proton limits the template bundle search to this repository
  /// directory.
  Future<CreateTemplateSyncConfigOutput> createTemplateSyncConfig({
    required String branch,
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required String templateName,
    required TemplateType templateType,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.CreateTemplateSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branch': branch,
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'templateName': templateName,
        'templateType': templateType.toValue(),
        if (subdirectory != null) 'subdirectory': subdirectory,
      },
    );

    return CreateTemplateSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Delete an Proton component resource.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the component to delete.
  Future<DeleteComponentOutput> deleteComponent({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteComponentOutput.fromJson(jsonResponse.body);
  }

  /// Delete the deployment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the deployment to delete.
  Future<DeleteDeploymentOutput> deleteDeployment({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteDeployment'
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

    return DeleteDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Delete an environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment to delete.
  Future<DeleteEnvironmentOutput> deleteEnvironment({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteEnvironmentOutput.fromJson(jsonResponse.body);
  }

  /// In an environment account, delete an environment account connection.
  ///
  /// After you delete an environment account connection that’s in use by an
  /// Proton environment, Proton <i>can’t</i> manage the environment
  /// infrastructure resources until a new environment account connection is
  /// accepted for the environment account and associated environment. You're
  /// responsible for cleaning up provisioned resources that remain without an
  /// environment connection.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment account connection to delete.
  Future<DeleteEnvironmentAccountConnectionOutput>
      deleteEnvironmentAccountConnection({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteEnvironmentAccountConnection'
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

    return DeleteEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// If no other major or minor versions of an environment template exist,
  /// delete the environment template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment template to delete.
  Future<DeleteEnvironmentTemplateOutput> deleteEnvironmentTemplate({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteEnvironmentTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteEnvironmentTemplateOutput.fromJson(jsonResponse.body);
  }

  /// If no other minor versions of an environment template exist, delete a
  /// major version of the environment template if it's not the
  /// <code>Recommended</code> version. Delete the <code>Recommended</code>
  /// version of the environment template if no other major versions or minor
  /// versions of the environment template exist. A major version of an
  /// environment template is a version that's not backward compatible.
  ///
  /// Delete a minor version of an environment template if it <i>isn't</i> the
  /// <code>Recommended</code> version. Delete a <code>Recommended</code> minor
  /// version of the environment template if no other minor versions of the
  /// environment template exist. A minor version of an environment template is
  /// a version that's backward compatible.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// The environment template major version to delete.
  ///
  /// Parameter [minorVersion] :
  /// The environment template minor version to delete.
  ///
  /// Parameter [templateName] :
  /// The name of the environment template.
  Future<DeleteEnvironmentTemplateVersionOutput>
      deleteEnvironmentTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteEnvironmentTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
      },
    );

    return DeleteEnvironmentTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// De-register and unlink your repository.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The repository name.
  ///
  /// Parameter [provider] :
  /// The repository provider.
  Future<DeleteRepositoryOutput> deleteRepository({
    required String name,
    required RepositoryProvider provider,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'provider': provider.toValue(),
      },
    );

    return DeleteRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Delete a service, with its instances and pipeline.
  /// <note>
  /// You can't delete a service if it has any service instances that have
  /// components attached to them.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service to delete.
  Future<DeleteServiceOutput> deleteService({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteServiceOutput.fromJson(jsonResponse.body);
  }

  /// Delete the Proton Ops file.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you want to delete the service sync
  /// configuration for.
  Future<DeleteServiceSyncConfigOutput> deleteServiceSyncConfig({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteServiceSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );

    return DeleteServiceSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// If no other major or minor versions of the service template exist, delete
  /// the service template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service template to delete.
  Future<DeleteServiceTemplateOutput> deleteServiceTemplate({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteServiceTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteServiceTemplateOutput.fromJson(jsonResponse.body);
  }

  /// If no other minor versions of a service template exist, delete a major
  /// version of the service template if it's not the <code>Recommended</code>
  /// version. Delete the <code>Recommended</code> version of the service
  /// template if no other major versions or minor versions of the service
  /// template exist. A major version of a service template is a version that
  /// <i>isn't</i> backwards compatible.
  ///
  /// Delete a minor version of a service template if it's not the
  /// <code>Recommended</code> version. Delete a <code>Recommended</code> minor
  /// version of the service template if no other minor versions of the service
  /// template exist. A minor version of a service template is a version that's
  /// backwards compatible.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// The service template major version to delete.
  ///
  /// Parameter [minorVersion] :
  /// The service template minor version to delete.
  ///
  /// Parameter [templateName] :
  /// The name of the service template.
  Future<DeleteServiceTemplateVersionOutput> deleteServiceTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteServiceTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
      },
    );

    return DeleteServiceTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Delete a template sync configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The template name.
  ///
  /// Parameter [templateType] :
  /// The template type.
  Future<DeleteTemplateSyncConfigOutput> deleteTemplateSyncConfig({
    required String templateName,
    required TemplateType templateType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.DeleteTemplateSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'templateName': templateName,
        'templateType': templateType.toValue(),
      },
    );

    return DeleteTemplateSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Get detail data for Proton account-wide settings.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  Future<GetAccountSettingsOutput> getAccountSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a component.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the component that you want to get the detailed data for.
  Future<GetComponentOutput> getComponent({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetComponentOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a deployment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the deployment that you want to get the detailed data for.
  ///
  /// Parameter [componentName] :
  /// The name of a component that you want to get the detailed data for.
  ///
  /// Parameter [environmentName] :
  /// The name of a environment that you want to get the detailed data for.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance associated with the given deployment ID.
  /// <code>serviceName</code> must be specified to identify the service
  /// instance.
  ///
  /// Parameter [serviceName] :
  /// The name of the service associated with the given deployment ID.
  Future<GetDeploymentOutput> getDeployment({
    required String id,
    String? componentName,
    String? environmentName,
    String? serviceInstanceName,
    String? serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (componentName != null) 'componentName': componentName,
        if (environmentName != null) 'environmentName': environmentName,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
        if (serviceName != null) 'serviceName': serviceName,
      },
    );

    return GetDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for an environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment that you want to get the detailed data for.
  Future<GetEnvironmentOutput> getEnvironment({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetEnvironmentOutput.fromJson(jsonResponse.body);
  }

  /// In an environment account, get the detailed data for an environment
  /// account connection.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment account connection that you want to get the
  /// detailed data for.
  Future<GetEnvironmentAccountConnectionOutput>
      getEnvironmentAccountConnection({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetEnvironmentAccountConnection'
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

    return GetEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for an environment template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment template that you want to get the detailed
  /// data for.
  Future<GetEnvironmentTemplateOutput> getEnvironmentTemplate({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetEnvironmentTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetEnvironmentTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a major or minor version of an environment template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// To get environment template major version detail data, include <code>major
  /// Version</code>.
  ///
  /// Parameter [minorVersion] :
  /// To get environment template minor version detail data, include
  /// <code>minorVersion</code>.
  ///
  /// Parameter [templateName] :
  /// The name of the environment template a version of which you want to get
  /// detailed data for.
  Future<GetEnvironmentTemplateVersionOutput> getEnvironmentTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetEnvironmentTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
      },
    );

    return GetEnvironmentTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Get detail data for a linked repository.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The repository name, for example <code>myrepos/myrepo</code>.
  ///
  /// Parameter [provider] :
  /// The repository provider.
  Future<GetRepositoryOutput> getRepository({
    required String name,
    required RepositoryProvider provider,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'provider': provider.toValue(),
      },
    );

    return GetRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Get the sync status of a repository used for Proton template sync. For
  /// more information about template sync, see .
  /// <note>
  /// A repository sync status isn't tied to the Proton Repository resource (or
  /// any other Proton resource). Therefore, tags on an Proton Repository
  /// resource have no effect on this action. Specifically, you can't use these
  /// tags to control access to this action using Attribute-based access control
  /// (ABAC).
  ///
  /// For more information about ABAC, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-tags">ABAC</a>
  /// in the <i>Proton User Guide</i>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [branch] :
  /// The repository branch.
  ///
  /// Parameter [repositoryName] :
  /// The repository name.
  ///
  /// Parameter [repositoryProvider] :
  /// The repository provider.
  ///
  /// Parameter [syncType] :
  /// The repository sync type.
  Future<GetRepositorySyncStatusOutput> getRepositorySyncStatus({
    required String branch,
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required SyncType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetRepositorySyncStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branch': branch,
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'syncType': syncType.toValue(),
      },
    );

    return GetRepositorySyncStatusOutput.fromJson(jsonResponse.body);
  }

  /// Get counts of Proton resources.
  ///
  /// For infrastructure-provisioning resources (environments, services, service
  /// instances, pipelines), the action returns staleness counts. A resource is
  /// stale when it's behind the recommended version of the Proton template that
  /// it uses and it needs an update to become current.
  ///
  /// The action returns staleness counts (counts of resources that are
  /// up-to-date, behind a template major version, or behind a template minor
  /// version), the total number of resources, and the number of resources that
  /// are in a failed state, grouped by resource type. Components, environments,
  /// and service templates return less information - see the
  /// <code>components</code>, <code>environments</code>, and
  /// <code>serviceTemplates</code> field descriptions.
  ///
  /// For context, the action also returns the total number of each type of
  /// Proton template in the Amazon Web Services account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/monitoring-dashboard.html">Proton
  /// dashboard</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetResourcesSummaryOutput> getResourcesSummary() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetResourcesSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetResourcesSummaryOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service that you want to get the detailed data for.
  Future<GetServiceOutput> getService({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetServiceOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a service instance. A service instance is an
  /// instantiation of service template and it runs in a specific environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of a service instance that you want to get the detailed data for.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you want the service instance input for.
  Future<GetServiceInstanceOutput> getServiceInstance({
    required String name,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'serviceName': serviceName,
      },
    );

    return GetServiceInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Get the status of the synced service instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance that you want the sync status input for.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that the service instance belongs to.
  Future<GetServiceInstanceSyncStatusOutput> getServiceInstanceSyncStatus({
    required String serviceInstanceName,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceInstanceSyncStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceInstanceName': serviceInstanceName,
        'serviceName': serviceName,
      },
    );

    return GetServiceInstanceSyncStatusOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for the service sync blocker summary.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you want to get the service sync blocker
  /// summary for. If given only the service name, all instances are blocked.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance that you want to get the service sync
  /// blocker summary for. If given bothe the instance name and the service
  /// name, only the instance is blocked.
  Future<GetServiceSyncBlockerSummaryOutput> getServiceSyncBlockerSummary({
    required String serviceName,
    String? serviceInstanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceSyncBlockerSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
      },
    );

    return GetServiceSyncBlockerSummaryOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed information for the service sync configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you want to get the service sync
  /// configuration for.
  Future<GetServiceSyncConfigOutput> getServiceSyncConfig({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );

    return GetServiceSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a service template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service template that you want to get detailed data for.
  Future<GetServiceTemplateOutput> getServiceTemplate({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetServiceTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Get detailed data for a major or minor version of a service template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// To get service template major version detail data, include <code>major
  /// Version</code>.
  ///
  /// Parameter [minorVersion] :
  /// To get service template minor version detail data, include
  /// <code>minorVersion</code>.
  ///
  /// Parameter [templateName] :
  /// The name of the service template a version of which you want to get
  /// detailed data for.
  Future<GetServiceTemplateVersionOutput> getServiceTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetServiceTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
      },
    );

    return GetServiceTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Get detail data for a template sync configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The template name.
  ///
  /// Parameter [templateType] :
  /// The template type.
  Future<GetTemplateSyncConfigOutput> getTemplateSyncConfig({
    required String templateName,
    required TemplateType templateType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetTemplateSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'templateName': templateName,
        'templateType': templateType.toValue(),
      },
    );

    return GetTemplateSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Get the status of a template sync.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The template name.
  ///
  /// Parameter [templateType] :
  /// The template type.
  ///
  /// Parameter [templateVersion] :
  /// The template major version.
  Future<GetTemplateSyncStatusOutput> getTemplateSyncStatus({
    required String templateName,
    required TemplateType templateType,
    required String templateVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.GetTemplateSyncStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'templateName': templateName,
        'templateType': templateType.toValue(),
        'templateVersion': templateVersion,
      },
    );

    return GetTemplateSyncStatusOutput.fromJson(jsonResponse.body);
  }

  /// Get a list of component Infrastructure as Code (IaC) outputs.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component whose outputs you want.
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment whose outputs you want.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next output in the array of
  /// outputs, after the list of outputs that was previously requested.
  Future<ListComponentOutputsOutput> listComponentOutputs({
    required String componentName,
    String? deploymentId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListComponentOutputs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'componentName': componentName,
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListComponentOutputsOutput.fromJson(jsonResponse.body);
  }

  /// List provisioned resources for a component with details.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component whose provisioned resources you want.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next provisioned resource in
  /// the array of provisioned resources, after the list of provisioned
  /// resources that was previously requested.
  Future<ListComponentProvisionedResourcesOutput>
      listComponentProvisionedResources({
    required String componentName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListComponentProvisionedResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'componentName': componentName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListComponentProvisionedResourcesOutput.fromJson(jsonResponse.body);
  }

  /// List components with summary data. You can filter the result list by
  /// environment, service, or a single service instance.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// The name of an environment for result list filtering. Proton returns
  /// components associated with the environment or attached to service
  /// instances running in it.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of components to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next component in the array of
  /// components, after the list of components that was previously requested.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of a service instance for result list filtering. Proton returns
  /// the component attached to the service instance, if any.
  ///
  /// Parameter [serviceName] :
  /// The name of a service for result list filtering. Proton returns components
  /// attached to service instances of the service.
  Future<ListComponentsOutput> listComponents({
    String? environmentName,
    int? maxResults,
    String? nextToken,
    String? serviceInstanceName,
    String? serviceName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListComponents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (environmentName != null) 'environmentName': environmentName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
        if (serviceName != null) 'serviceName': serviceName,
      },
    );

    return ListComponentsOutput.fromJson(jsonResponse.body);
  }

  /// List deployments. You can filter the result list by environment, service,
  /// or a single service instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of a component for result list filtering. Proton returns
  /// deployments associated with that component.
  ///
  /// Parameter [environmentName] :
  /// The name of an environment for result list filtering. Proton returns
  /// deployments associated with the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of deployments to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next deployment in the array of
  /// deployment, after the list of deployment that was previously requested.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of a service instance for result list filtering. Proton returns
  /// the deployments associated with the service instance.
  ///
  /// Parameter [serviceName] :
  /// The name of a service for result list filtering. Proton returns
  /// deployments associated with service instances of the service.
  Future<ListDeploymentsOutput> listDeployments({
    String? componentName,
    String? environmentName,
    int? maxResults,
    String? nextToken,
    String? serviceInstanceName,
    String? serviceName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListDeployments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (componentName != null) 'componentName': componentName,
        if (environmentName != null) 'environmentName': environmentName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
        if (serviceName != null) 'serviceName': serviceName,
      },
    );

    return ListDeploymentsOutput.fromJson(jsonResponse.body);
  }

  /// View a list of environment account connections.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [requestedBy] :
  /// The type of account making the
  /// <code>ListEnvironmentAccountConnections</code> request.
  ///
  /// Parameter [environmentName] :
  /// The environment name that's associated with each listed environment
  /// account connection.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environment account connections to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next environment account
  /// connection in the array of environment account connections, after the list
  /// of environment account connections that was previously requested.
  ///
  /// Parameter [statuses] :
  /// The status details for each listed environment account connection.
  Future<ListEnvironmentAccountConnectionsOutput>
      listEnvironmentAccountConnections({
    required EnvironmentAccountConnectionRequesterAccountType requestedBy,
    String? environmentName,
    int? maxResults,
    String? nextToken,
    List<EnvironmentAccountConnectionStatus>? statuses,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironmentAccountConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'requestedBy': requestedBy.toValue(),
        if (environmentName != null) 'environmentName': environmentName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (statuses != null)
          'statuses': statuses.map((e) => e.toValue()).toList(),
      },
    );

    return ListEnvironmentAccountConnectionsOutput.fromJson(jsonResponse.body);
  }

  /// List the infrastructure as code outputs for your environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// The environment name.
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment whose outputs you want.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next environment output in the
  /// array of environment outputs, after the list of environment outputs that
  /// was previously requested.
  Future<ListEnvironmentOutputsOutput> listEnvironmentOutputs({
    required String environmentName,
    String? deploymentId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironmentOutputs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentName': environmentName,
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentOutputsOutput.fromJson(jsonResponse.body);
  }

  /// List the provisioned resources for your environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// The environment name.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next environment provisioned
  /// resource in the array of environment provisioned resources, after the list
  /// of environment provisioned resources that was previously requested.
  Future<ListEnvironmentProvisionedResourcesOutput>
      listEnvironmentProvisionedResources({
    required String environmentName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironmentProvisionedResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentName': environmentName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentProvisionedResourcesOutput.fromJson(
        jsonResponse.body);
  }

  /// List major or minor versions of an environment template with detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The name of the environment template.
  ///
  /// Parameter [majorVersion] :
  /// To view a list of minor of versions under a major version of an
  /// environment template, include <code>major Version</code>.
  ///
  /// To view a list of major versions of an environment template,
  /// <i>exclude</i> <code>major Version</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of major or minor versions of an environment template
  /// to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next major or minor version in
  /// the array of major or minor versions of an environment template, after the
  /// list of major or minor versions that was previously requested.
  Future<ListEnvironmentTemplateVersionsOutput>
      listEnvironmentTemplateVersions({
    required String templateName,
    String? majorVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironmentTemplateVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'templateName': templateName,
        if (majorVersion != null) 'majorVersion': majorVersion,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentTemplateVersionsOutput.fromJson(jsonResponse.body);
  }

  /// List environment templates.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environment templates to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next environment template in
  /// the array of environment templates, after the list of environment
  /// templates that was previously requested.
  Future<ListEnvironmentTemplatesOutput> listEnvironmentTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironmentTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentTemplatesOutput.fromJson(jsonResponse.body);
  }

  /// List environments with detail data summaries.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentTemplates] :
  /// An array of the versions of the environment template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environments to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next environment in the array
  /// of environments, after the list of environments that was previously
  /// requested.
  Future<ListEnvironmentsOutput> listEnvironments({
    List<EnvironmentTemplateFilter>? environmentTemplates,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListEnvironments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (environmentTemplates != null)
          'environmentTemplates': environmentTemplates,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentsOutput.fromJson(jsonResponse.body);
  }

  /// List linked repositories with detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repositories to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next repository in the array of
  /// repositories, after the list of repositories previously requested.
  Future<ListRepositoriesOutput> listRepositories({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRepositoriesOutput.fromJson(jsonResponse.body);
  }

  /// List repository sync definitions with detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [repositoryName] :
  /// The repository name.
  ///
  /// Parameter [repositoryProvider] :
  /// The repository provider.
  ///
  /// Parameter [syncType] :
  /// The sync type. The only supported value is <code>TEMPLATE_SYNC</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next repository sync definition
  /// in the array of repository sync definitions, after the list of repository
  /// sync definitions previously requested.
  Future<ListRepositorySyncDefinitionsOutput> listRepositorySyncDefinitions({
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required SyncType syncType,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListRepositorySyncDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'syncType': syncType.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRepositorySyncDefinitionsOutput.fromJson(jsonResponse.body);
  }

  /// Get a list service of instance Infrastructure as Code (IaC) outputs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance whose outputs you want.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that <code>serviceInstanceName</code> is
  /// associated to.
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment whose outputs you want.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next output in the array of
  /// outputs, after the list of outputs that was previously requested.
  Future<ListServiceInstanceOutputsOutput> listServiceInstanceOutputs({
    required String serviceInstanceName,
    required String serviceName,
    String? deploymentId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServiceInstanceOutputs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceInstanceName': serviceInstanceName,
        'serviceName': serviceName,
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServiceInstanceOutputsOutput.fromJson(jsonResponse.body);
  }

  /// List provisioned resources for a service instance with details.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance whose provisioned resources you want.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that <code>serviceInstanceName</code> is
  /// associated to.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next provisioned resource in
  /// the array of provisioned resources, after the list of provisioned
  /// resources that was previously requested.
  Future<ListServiceInstanceProvisionedResourcesOutput>
      listServiceInstanceProvisionedResources({
    required String serviceInstanceName,
    required String serviceName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AwsProton20200720.ListServiceInstanceProvisionedResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceInstanceName': serviceInstanceName,
        'serviceName': serviceName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServiceInstanceProvisionedResourcesOutput.fromJson(
        jsonResponse.body);
  }

  /// List service instances with summary data. This action lists service
  /// instances of all services in the Amazon Web Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// An array of filtering criteria that scope down the result list. By
  /// default, all service instances in the Amazon Web Services account are
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service instances to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next service in the array of
  /// service instances, after the list of service instances that was previously
  /// requested.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that the service instance belongs to.
  ///
  /// Parameter [sortBy] :
  /// The field that the result list is sorted by.
  ///
  /// When you choose to sort by <code>serviceName</code>, service instances
  /// within each service are sorted by service instance name.
  ///
  /// Default: <code>serviceName</code>
  ///
  /// Parameter [sortOrder] :
  /// Result list sort order.
  ///
  /// Default: <code>ASCENDING</code>
  Future<ListServiceInstancesOutput> listServiceInstances({
    List<ListServiceInstancesFilter>? filters,
    int? maxResults,
    String? nextToken,
    String? serviceName,
    ListServiceInstancesSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServiceInstances'
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
        if (serviceName != null) 'serviceName': serviceName,
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListServiceInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Get a list of service pipeline Infrastructure as Code (IaC) outputs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service whose pipeline's outputs you want.
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment you want the outputs for.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next output in the array of
  /// outputs, after the list of outputs that was previously requested.
  Future<ListServicePipelineOutputsOutput> listServicePipelineOutputs({
    required String serviceName,
    String? deploymentId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServicePipelineOutputs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServicePipelineOutputsOutput.fromJson(jsonResponse.body);
  }

  /// List provisioned resources for a service and pipeline with details.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service whose pipeline's provisioned resources you want.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next provisioned resource in
  /// the array of provisioned resources, after the list of provisioned
  /// resources that was previously requested.
  Future<ListServicePipelineProvisionedResourcesOutput>
      listServicePipelineProvisionedResources({
    required String serviceName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AwsProton20200720.ListServicePipelineProvisionedResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServicePipelineProvisionedResourcesOutput.fromJson(
        jsonResponse.body);
  }

  /// List major or minor versions of a service template with detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The name of the service template.
  ///
  /// Parameter [majorVersion] :
  /// To view a list of minor of versions under a major version of a service
  /// template, include <code>major Version</code>.
  ///
  /// To view a list of major versions of a service template, <i>exclude</i>
  /// <code>major Version</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of major or minor versions of a service template to
  /// list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next major or minor version in
  /// the array of major or minor versions of a service template, after the list
  /// of major or minor versions that was previously requested.
  Future<ListServiceTemplateVersionsOutput> listServiceTemplateVersions({
    required String templateName,
    String? majorVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServiceTemplateVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'templateName': templateName,
        if (majorVersion != null) 'majorVersion': majorVersion,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServiceTemplateVersionsOutput.fromJson(jsonResponse.body);
  }

  /// List service templates with detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service templates to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next service template in the
  /// array of service templates, after the list of service templates previously
  /// requested.
  Future<ListServiceTemplatesOutput> listServiceTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServiceTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServiceTemplatesOutput.fromJson(jsonResponse.body);
  }

  /// List services with summaries of detail data.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of services to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next service in the array of
  /// services, after the list of services that was previously requested.
  Future<ListServicesOutput> listServices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServicesOutput.fromJson(jsonResponse.body);
  }

  /// List tags for a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for the listed tags.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags to list.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the location of the next resource tag in the array
  /// of resource tags, after the list of resource tags that was previously
  /// requested.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.ListTagsForResource'
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

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Notify Proton of status changes to a provisioned resource when you use
  /// self-managed provisioning.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self">Self-managed
  /// provisioning</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The provisioned resource Amazon Resource Name (ARN).
  ///
  /// Parameter [deploymentId] :
  /// The deployment ID for your provisioned resource.
  ///
  /// Parameter [outputs] :
  /// The provisioned resource state change detail data that's returned by
  /// Proton.
  ///
  /// Parameter [status] :
  /// The status of your provisioned resource.
  ///
  /// Parameter [statusMessage] :
  /// The deployment status message for your provisioned resource.
  Future<void> notifyResourceDeploymentStatusChange({
    required String resourceArn,
    String? deploymentId,
    List<Output>? outputs,
    ResourceDeploymentStatus? status,
    String? statusMessage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.NotifyResourceDeploymentStatusChange'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (outputs != null) 'outputs': outputs,
        if (status != null) 'status': status.toValue(),
        if (statusMessage != null) 'statusMessage': statusMessage,
      },
    );
  }

  /// In a management account, reject an environment account connection from
  /// another environment account.
  ///
  /// After you reject an environment account connection request, you
  /// <i>can't</i> accept or use the rejected environment account connection.
  ///
  /// You <i>can’t</i> reject an environment account connection that's connected
  /// to an environment.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment account connection to reject.
  Future<RejectEnvironmentAccountConnectionOutput>
      rejectEnvironmentAccountConnection({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.RejectEnvironmentAccountConnection'
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

    return RejectEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Tag a resource. A tag is a key-value pair of metadata that you associate
  /// with an Proton resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Proton resource to apply customer
  /// tags to.
  ///
  /// Parameter [tags] :
  /// A list of customer tags to apply to the Proton resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.TagResource'
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

  /// Remove a customer tag from a resource. A tag is a key-value pair of
  /// metadata associated with an Proton resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/resources.html">Proton
  /// resources and tagging</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove customer tags
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// A list of customer tag keys that indicate the customer tags to be removed
  /// from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UntagResource'
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

  /// Update Proton settings that are used for multiple services in the Amazon
  /// Web Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deletePipelineProvisioningRepository] :
  /// Set to <code>true</code> to remove a configured pipeline repository from
  /// the account settings. Don't set this field if you are updating the
  /// configured pipeline repository.
  ///
  /// Parameter [pipelineCodebuildRoleArn] :
  /// The Amazon Resource Name (ARN) of the service role you want to use for
  /// provisioning pipelines. Proton assumes this role for CodeBuild-based
  /// provisioning.
  ///
  /// Parameter [pipelineProvisioningRepository] :
  /// A linked repository for pipeline provisioning. Specify it if you have
  /// environments configured for self-managed provisioning with services that
  /// include pipelines. A linked repository is a repository that has been
  /// registered with Proton. For more information, see <a>CreateRepository</a>.
  ///
  /// To remove a previously configured repository, set
  /// <code>deletePipelineProvisioningRepository</code> to <code>true</code>,
  /// and don't set <code>pipelineProvisioningRepository</code>.
  ///
  /// Parameter [pipelineServiceRoleArn] :
  /// The Amazon Resource Name (ARN) of the service role you want to use for
  /// provisioning pipelines. Assumed by Proton for Amazon Web Services-managed
  /// provisioning, and by customer-owned automation for self-managed
  /// provisioning.
  ///
  /// To remove a previously configured ARN, specify an empty string.
  Future<UpdateAccountSettingsOutput> updateAccountSettings({
    bool? deletePipelineProvisioningRepository,
    String? pipelineCodebuildRoleArn,
    RepositoryBranchInput? pipelineProvisioningRepository,
    String? pipelineServiceRoleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deletePipelineProvisioningRepository != null)
          'deletePipelineProvisioningRepository':
              deletePipelineProvisioningRepository,
        if (pipelineCodebuildRoleArn != null)
          'pipelineCodebuildRoleArn': pipelineCodebuildRoleArn,
        if (pipelineProvisioningRepository != null)
          'pipelineProvisioningRepository': pipelineProvisioningRepository,
        if (pipelineServiceRoleArn != null)
          'pipelineServiceRoleArn': pipelineServiceRoleArn,
      },
    );

    return UpdateAccountSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Update a component.
  ///
  /// There are a few modes for updating a component. The
  /// <code>deploymentType</code> field defines the mode.
  /// <note>
  /// You can't update a component while its deployment status, or the
  /// deployment status of a service instance attached to it, is
  /// <code>IN_PROGRESS</code>.
  /// </note>
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deploymentType] :
  /// The deployment type. It defines the mode for updating a component, as
  /// follows:
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated. You can only specify
  /// <code>description</code> in this mode.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the component is deployed and updated with the new
  /// <code>serviceSpec</code>, <code>templateSource</code>, and/or
  /// <code>type</code> that you provide. Only requested parameters are updated.
  /// </dd> </dl>
  ///
  /// Parameter [name] :
  /// The name of the component to update.
  ///
  /// Parameter [clientToken] :
  /// The client token for the updated component.
  ///
  /// Parameter [description] :
  /// An optional customer-provided description of the component.
  ///
  /// Parameter [serviceInstanceName] :
  /// The name of the service instance that you want to attach this component
  /// to. Don't specify to keep the component's current service instance
  /// attachment. Specify an empty string to detach the component from the
  /// service instance it's attached to. Specify non-empty values for both
  /// <code>serviceInstanceName</code> and <code>serviceName</code> or for
  /// neither of them.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that <code>serviceInstanceName</code> is
  /// associated with. Don't specify to keep the component's current service
  /// instance attachment. Specify an empty string to detach the component from
  /// the service instance it's attached to. Specify non-empty values for both
  /// <code>serviceInstanceName</code> and <code>serviceName</code> or for
  /// neither of them.
  ///
  /// Parameter [serviceSpec] :
  /// The service spec that you want the component to use to access service
  /// inputs. Set this only when the component is attached to a service
  /// instance.
  ///
  /// Parameter [templateFile] :
  /// A path to the Infrastructure as Code (IaC) file describing infrastructure
  /// that a custom component provisions.
  /// <note>
  /// Components support a single IaC file, even if you use Terraform as your
  /// template language.
  /// </note>
  Future<UpdateComponentOutput> updateComponent({
    required ComponentDeploymentUpdateType deploymentType,
    required String name,
    String? clientToken,
    String? description,
    String? serviceInstanceName,
    String? serviceName,
    String? serviceSpec,
    String? templateFile,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentType': deploymentType.toValue(),
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (serviceInstanceName != null)
          'serviceInstanceName': serviceInstanceName,
        if (serviceName != null) 'serviceName': serviceName,
        if (serviceSpec != null) 'serviceSpec': serviceSpec,
        if (templateFile != null) 'templateFile': templateFile,
      },
    );

    return UpdateComponentOutput.fromJson(jsonResponse.body);
  }

  /// Update an environment.
  ///
  /// If the environment is associated with an environment account connection,
  /// <i>don't</i> update or include the <code>protonServiceRoleArn</code> and
  /// <code>provisioningRepository</code> parameter to update or connect to an
  /// environment account connection.
  ///
  /// You can only update to a new environment account connection if that
  /// connection was created in the same environment account that the current
  /// environment account connection was created in. The account connection must
  /// also be associated with the current environment.
  ///
  /// If the environment <i>isn't</i> associated with an environment account
  /// connection, <i>don't</i> update or include the
  /// <code>environmentAccountConnectionId</code> parameter. You <i>can't</i>
  /// update or connect the environment to an environment account connection if
  /// it <i>isn't</i> already associated with an environment connection.
  ///
  /// You can update either the <code>environmentAccountConnectionId</code> or
  /// <code>protonServiceRoleArn</code> parameter and value. You can’t update
  /// both.
  ///
  /// If the environment was configured for Amazon Web Services-managed
  /// provisioning, omit the <code>provisioningRepository</code> parameter.
  ///
  /// If the environment was configured for self-managed provisioning, specify
  /// the <code>provisioningRepository</code> parameter and omit the
  /// <code>protonServiceRoleArn</code> and
  /// <code>environmentAccountConnectionId</code> parameters.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html">Environments</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html">Provisioning
  /// methods</a> in the <i>Proton User Guide</i>.
  ///
  /// There are four modes for updating an environment. The
  /// <code>deploymentType</code> field defines the mode.
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the new spec
  /// that you provide. Only requested parameters are updated. <i>Don’t</i>
  /// include minor or major version parameters when you use this
  /// <code>deployment-type</code>.
  /// </dd> <dt/> <dd>
  /// <code>MINOR_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the published,
  /// recommended (latest) minor version of the current major version in use, by
  /// default. You can also specify a different minor version of the current
  /// major version in use.
  /// </dd> <dt/> <dd>
  /// <code>MAJOR_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the published,
  /// recommended (latest) major and minor version of the current template, by
  /// default. You can also specify a different major version that's higher than
  /// the major version in use and a minor version.
  /// </dd> </dl>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deploymentType] :
  /// There are four modes for updating an environment. The
  /// <code>deploymentType</code> field defines the mode.
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the new spec
  /// that you provide. Only requested parameters are updated. <i>Don’t</i>
  /// include major or minor version parameters when you use this
  /// <code>deployment-type</code>.
  /// </dd> <dt/> <dd>
  /// <code>MINOR_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the published,
  /// recommended (latest) minor version of the current major version in use, by
  /// default. You can also specify a different minor version of the current
  /// major version in use.
  /// </dd> <dt/> <dd>
  /// <code>MAJOR_VERSION</code>
  ///
  /// In this mode, the environment is deployed and updated with the published,
  /// recommended (latest) major and minor version of the current template, by
  /// default. You can also specify a different major version that is higher
  /// than the major version in use and a minor version (optional).
  /// </dd> </dl>
  ///
  /// Parameter [name] :
  /// The name of the environment to update.
  ///
  /// Parameter [codebuildRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that allows Proton
  /// to provision infrastructure using CodeBuild-based provisioning on your
  /// behalf.
  ///
  /// Parameter [componentRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses
  /// when provisioning directly defined components in this environment. It
  /// determines the scope of infrastructure that a component can provision.
  ///
  /// The environment must have a <code>componentRoleArn</code> to allow
  /// directly defined components to be associated with the environment.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [description] :
  /// A description of the environment update.
  ///
  /// Parameter [environmentAccountConnectionId] :
  /// The ID of the environment account connection.
  ///
  /// You can only update to a new environment account connection if it was
  /// created in the same environment account that the current environment
  /// account connection was created in and is associated with the current
  /// environment.
  ///
  /// Parameter [protonServiceRoleArn] :
  /// The Amazon Resource Name (ARN) of the Proton service role that allows
  /// Proton to make API calls to other services your behalf.
  ///
  /// Parameter [provisioningRepository] :
  /// The linked repository that you use to host your rendered infrastructure
  /// templates for self-managed provisioning. A linked repository is a
  /// repository that has been registered with Proton. For more information, see
  /// <a>CreateRepository</a>.
  ///
  /// Parameter [spec] :
  /// The formatted specification that defines the update.
  ///
  /// Parameter [templateMajorVersion] :
  /// The major version of the environment to update.
  ///
  /// Parameter [templateMinorVersion] :
  /// The minor version of the environment to update.
  Future<UpdateEnvironmentOutput> updateEnvironment({
    required DeploymentUpdateType deploymentType,
    required String name,
    String? codebuildRoleArn,
    String? componentRoleArn,
    String? description,
    String? environmentAccountConnectionId,
    String? protonServiceRoleArn,
    RepositoryBranchInput? provisioningRepository,
    String? spec,
    String? templateMajorVersion,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentType': deploymentType.toValue(),
        'name': name,
        if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
        if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
        if (description != null) 'description': description,
        if (environmentAccountConnectionId != null)
          'environmentAccountConnectionId': environmentAccountConnectionId,
        if (protonServiceRoleArn != null)
          'protonServiceRoleArn': protonServiceRoleArn,
        if (provisioningRepository != null)
          'provisioningRepository': provisioningRepository,
        if (spec != null) 'spec': spec,
        if (templateMajorVersion != null)
          'templateMajorVersion': templateMajorVersion,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return UpdateEnvironmentOutput.fromJson(jsonResponse.body);
  }

  /// In an environment account, update an environment account connection to use
  /// a new IAM role.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html">Environment
  /// account connections</a> in the <i>Proton User guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment account connection to update.
  ///
  /// Parameter [codebuildRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role in the environment
  /// account. Proton uses this role to provision infrastructure resources using
  /// CodeBuild-based provisioning in the associated environment account.
  ///
  /// Parameter [componentRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses
  /// when provisioning directly defined components in the associated
  /// environment account. It determines the scope of infrastructure that a
  /// component can provision in the account.
  ///
  /// The environment account connection must have a
  /// <code>componentRoleArn</code> to allow directly defined components to be
  /// associated with any environments running in the account.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role that's associated
  /// with the environment account connection to update.
  Future<UpdateEnvironmentAccountConnectionOutput>
      updateEnvironmentAccountConnection({
    required String id,
    String? codebuildRoleArn,
    String? componentRoleArn,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateEnvironmentAccountConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
        if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
        if (roleArn != null) 'roleArn': roleArn,
      },
    );

    return UpdateEnvironmentAccountConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Update an environment template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment template to update.
  ///
  /// Parameter [description] :
  /// A description of the environment template update.
  ///
  /// Parameter [displayName] :
  /// The name of the environment template to update as displayed in the
  /// developer interface.
  Future<UpdateEnvironmentTemplateOutput> updateEnvironmentTemplate({
    required String name,
    String? description,
    String? displayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateEnvironmentTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (displayName != null) 'displayName': displayName,
      },
    );

    return UpdateEnvironmentTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Update a major or minor version of an environment template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// To update a major version of an environment template, include <code>major
  /// Version</code>.
  ///
  /// Parameter [minorVersion] :
  /// To update a minor version of an environment template, include
  /// <code>minorVersion</code>.
  ///
  /// Parameter [templateName] :
  /// The name of the environment template.
  ///
  /// Parameter [description] :
  /// A description of environment template version to update.
  ///
  /// Parameter [status] :
  /// The status of the environment template minor version to update.
  Future<UpdateEnvironmentTemplateVersionOutput>
      updateEnvironmentTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
    String? description,
    TemplateVersionStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateEnvironmentTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
        if (description != null) 'description': description,
        if (status != null) 'status': status.toValue(),
      },
    );

    return UpdateEnvironmentTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Edit a service description or use a spec to add and delete service
  /// instances.
  /// <note>
  /// Existing service instances and the service pipeline <i>can't</i> be edited
  /// using this API. They can only be deleted.
  /// </note>
  /// Use the <code>description</code> parameter to modify the description.
  ///
  /// Edit the <code>spec</code> parameter to add or delete instances.
  /// <note>
  /// You can't delete a service instance (remove it from the spec) if it has an
  /// attached component.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service to edit.
  ///
  /// Parameter [description] :
  /// The edited service description.
  ///
  /// Parameter [spec] :
  /// Lists the service instances to add and the existing service instances to
  /// remain. Omit the existing service instances to delete from the list.
  /// <i>Don't</i> include edits to the existing service instances or pipeline.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-update.html">Edit
  /// a service</a> in the <i>Proton User Guide</i>.
  Future<UpdateServiceOutput> updateService({
    required String name,
    String? description,
    String? spec,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (spec != null) 'spec': spec,
      },
    );

    return UpdateServiceOutput.fromJson(jsonResponse.body);
  }

  /// Update a service instance.
  ///
  /// There are a few modes for updating a service instance. The
  /// <code>deploymentType</code> field defines the mode.
  /// <note>
  /// You can't update a service instance while its deployment status, or the
  /// deployment status of a component attached to it, is
  /// <code>IN_PROGRESS</code>.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deploymentType] :
  /// The deployment type. It defines the mode for updating a service instance,
  /// as follows:
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the service instance is deployed and updated with the new
  /// spec that you provide. Only requested parameters are updated. <i>Don’t</i>
  /// include major or minor version parameters when you use this deployment
  /// type.
  /// </dd> <dt/> <dd>
  /// <code>MINOR_VERSION</code>
  ///
  /// In this mode, the service instance is deployed and updated with the
  /// published, recommended (latest) minor version of the current major version
  /// in use, by default. You can also specify a different minor version of the
  /// current major version in use.
  /// </dd> <dt/> <dd>
  /// <code>MAJOR_VERSION</code>
  ///
  /// In this mode, the service instance is deployed and updated with the
  /// published, recommended (latest) major and minor version of the current
  /// template, by default. You can specify a different major version that's
  /// higher than the major version in use and a minor version.
  /// </dd> </dl>
  ///
  /// Parameter [name] :
  /// The name of the service instance to update.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that the service instance belongs to.
  ///
  /// Parameter [clientToken] :
  /// The client token of the service instance to update.
  ///
  /// Parameter [spec] :
  /// The formatted specification that defines the service instance update.
  ///
  /// Parameter [templateMajorVersion] :
  /// The major version of the service template to update.
  ///
  /// Parameter [templateMinorVersion] :
  /// The minor version of the service template to update.
  Future<UpdateServiceInstanceOutput> updateServiceInstance({
    required DeploymentUpdateType deploymentType,
    required String name,
    required String serviceName,
    String? clientToken,
    String? spec,
    String? templateMajorVersion,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServiceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentType': deploymentType.toValue(),
        'name': name,
        'serviceName': serviceName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (spec != null) 'spec': spec,
        if (templateMajorVersion != null)
          'templateMajorVersion': templateMajorVersion,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return UpdateServiceInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Update the service pipeline.
  ///
  /// There are four modes for updating a service pipeline. The
  /// <code>deploymentType</code> field defines the mode.
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the new
  /// spec that you provide. Only requested parameters are updated. <i>Don’t</i>
  /// include major or minor version parameters when you use this
  /// <code>deployment-type</code>.
  /// </dd> <dt/> <dd>
  /// <code>MINOR_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the
  /// published, recommended (latest) minor version of the current major version
  /// in use, by default. You can specify a different minor version of the
  /// current major version in use.
  /// </dd> <dt/> <dd>
  /// <code>MAJOR_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the
  /// published, recommended (latest) major and minor version of the current
  /// template by default. You can specify a different major version that's
  /// higher than the major version in use and a minor version.
  /// </dd> </dl>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deploymentType] :
  /// The deployment type.
  ///
  /// There are four modes for updating a service pipeline. The
  /// <code>deploymentType</code> field defines the mode.
  /// <dl> <dt/> <dd>
  /// <code>NONE</code>
  ///
  /// In this mode, a deployment <i>doesn't</i> occur. Only the requested
  /// metadata parameters are updated.
  /// </dd> <dt/> <dd>
  /// <code>CURRENT_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the new
  /// spec that you provide. Only requested parameters are updated. <i>Don’t</i>
  /// include major or minor version parameters when you use this
  /// <code>deployment-type</code>.
  /// </dd> <dt/> <dd>
  /// <code>MINOR_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the
  /// published, recommended (latest) minor version of the current major version
  /// in use, by default. You can specify a different minor version of the
  /// current major version in use.
  /// </dd> <dt/> <dd>
  /// <code>MAJOR_VERSION</code>
  ///
  /// In this mode, the service pipeline is deployed and updated with the
  /// published, recommended (latest) major and minor version of the current
  /// template, by default. You can specify a different major version that's
  /// higher than the major version in use and a minor version.
  /// </dd> </dl>
  ///
  /// Parameter [serviceName] :
  /// The name of the service to that the pipeline is associated with.
  ///
  /// Parameter [spec] :
  /// The spec for the service pipeline to update.
  ///
  /// Parameter [templateMajorVersion] :
  /// The major version of the service template that was used to create the
  /// service that the pipeline is associated with.
  ///
  /// Parameter [templateMinorVersion] :
  /// The minor version of the service template that was used to create the
  /// service that the pipeline is associated with.
  Future<UpdateServicePipelineOutput> updateServicePipeline({
    required DeploymentUpdateType deploymentType,
    required String serviceName,
    required String spec,
    String? templateMajorVersion,
    String? templateMinorVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServicePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentType': deploymentType.toValue(),
        'serviceName': serviceName,
        'spec': spec,
        if (templateMajorVersion != null)
          'templateMajorVersion': templateMajorVersion,
        if (templateMinorVersion != null)
          'templateMinorVersion': templateMinorVersion,
      },
    );

    return UpdateServicePipelineOutput.fromJson(jsonResponse.body);
  }

  /// Update the service sync blocker by resolving it.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the service sync blocker.
  ///
  /// Parameter [resolvedReason] :
  /// The reason the service sync blocker was resolved.
  Future<UpdateServiceSyncBlockerOutput> updateServiceSyncBlocker({
    required String id,
    required String resolvedReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServiceSyncBlocker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'resolvedReason': resolvedReason,
      },
    );

    return UpdateServiceSyncBlockerOutput.fromJson(jsonResponse.body);
  }

  /// Update the Proton Ops config file.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [branch] :
  /// The name of the code repository branch where the Proton Ops file is found.
  ///
  /// Parameter [filePath] :
  /// The path to the Proton Ops file.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the Proton Ops file is found.
  ///
  /// Parameter [repositoryProvider] :
  /// The name of the repository provider where the Proton Ops file is found.
  ///
  /// Parameter [serviceName] :
  /// The name of the service the Proton Ops file is for.
  Future<UpdateServiceSyncConfigOutput> updateServiceSyncConfig({
    required String branch,
    required String filePath,
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServiceSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branch': branch,
        'filePath': filePath,
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'serviceName': serviceName,
      },
    );

    return UpdateServiceSyncConfigOutput.fromJson(jsonResponse.body);
  }

  /// Update a service template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the service template to update.
  ///
  /// Parameter [description] :
  /// A description of the service template update.
  ///
  /// Parameter [displayName] :
  /// The name of the service template to update that's displayed in the
  /// developer interface.
  Future<UpdateServiceTemplateOutput> updateServiceTemplate({
    required String name,
    String? description,
    String? displayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServiceTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (displayName != null) 'displayName': displayName,
      },
    );

    return UpdateServiceTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Update a major or minor version of a service template.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersion] :
  /// To update a major version of a service template, include <code>major
  /// Version</code>.
  ///
  /// Parameter [minorVersion] :
  /// To update a minor version of a service template, include
  /// <code>minorVersion</code>.
  ///
  /// Parameter [templateName] :
  /// The name of the service template.
  ///
  /// Parameter [compatibleEnvironmentTemplates] :
  /// An array of environment template objects that are compatible with this
  /// service template version. A service instance based on this service
  /// template version can run in environments based on compatible templates.
  ///
  /// Parameter [description] :
  /// A description of a service template version to update.
  ///
  /// Parameter [status] :
  /// The status of the service template minor version to update.
  ///
  /// Parameter [supportedComponentSources] :
  /// An array of supported component sources. Components with supported sources
  /// can be attached to service instances based on this service template
  /// version.
  /// <note>
  /// A change to <code>supportedComponentSources</code> doesn't impact existing
  /// component attachments to instances based on this template version. A
  /// change only affects later associations.
  /// </note>
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  Future<UpdateServiceTemplateVersionOutput> updateServiceTemplateVersion({
    required String majorVersion,
    required String minorVersion,
    required String templateName,
    List<CompatibleEnvironmentTemplateInput>? compatibleEnvironmentTemplates,
    String? description,
    TemplateVersionStatus? status,
    List<ServiceTemplateSupportedComponentSourceType>?
        supportedComponentSources,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateServiceTemplateVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersion': majorVersion,
        'minorVersion': minorVersion,
        'templateName': templateName,
        if (compatibleEnvironmentTemplates != null)
          'compatibleEnvironmentTemplates': compatibleEnvironmentTemplates,
        if (description != null) 'description': description,
        if (status != null) 'status': status.toValue(),
        if (supportedComponentSources != null)
          'supportedComponentSources':
              supportedComponentSources.map((e) => e.toValue()).toList(),
      },
    );

    return UpdateServiceTemplateVersionOutput.fromJson(jsonResponse.body);
  }

  /// Update template sync configuration parameters, except for the
  /// <code>templateName</code> and <code>templateType</code>. Repository
  /// details (branch, name, and provider) should be of a linked repository. A
  /// linked repository is a repository that has been registered with Proton.
  /// For more information, see <a>CreateRepository</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [branch] :
  /// The repository branch for your template.
  ///
  /// Parameter [repositoryName] :
  /// The repository name (for example, <code>myrepos/myrepo</code>).
  ///
  /// Parameter [repositoryProvider] :
  /// The repository provider.
  ///
  /// Parameter [templateName] :
  /// The synced template name.
  ///
  /// Parameter [templateType] :
  /// The synced template type.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory path to your template bundle version. When included, limits
  /// the template bundle search to this repository directory.
  Future<UpdateTemplateSyncConfigOutput> updateTemplateSyncConfig({
    required String branch,
    required String repositoryName,
    required RepositoryProvider repositoryProvider,
    required String templateName,
    required TemplateType templateType,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AwsProton20200720.UpdateTemplateSyncConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branch': branch,
        'repositoryName': repositoryName,
        'repositoryProvider': repositoryProvider.toValue(),
        'templateName': templateName,
        'templateType': templateType.toValue(),
        if (subdirectory != null) 'subdirectory': subdirectory,
      },
    );

    return UpdateTemplateSyncConfigOutput.fromJson(jsonResponse.body);
  }
}

class AcceptEnvironmentAccountConnectionOutput {
  /// The environment account connection data that's returned by Proton.
  final EnvironmentAccountConnection environmentAccountConnection;

  AcceptEnvironmentAccountConnectionOutput({
    required this.environmentAccountConnection,
  });

  factory AcceptEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return AcceptEnvironmentAccountConnectionOutput(
      environmentAccountConnection: EnvironmentAccountConnection.fromJson(
          json['environmentAccountConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

/// Proton settings that are used for multiple services in the Amazon Web
/// Services account.
class AccountSettings {
  /// The Amazon Resource Name (ARN) of the service role that Proton uses for
  /// provisioning pipelines. Proton assumes this role for CodeBuild-based
  /// provisioning.
  final String? pipelineCodebuildRoleArn;

  /// The linked repository for pipeline provisioning. Required if you have
  /// environments configured for self-managed provisioning with services that
  /// include pipelines. A linked repository is a repository that has been
  /// registered with Proton. For more information, see <a>CreateRepository</a>.
  final RepositoryBranch? pipelineProvisioningRepository;

  /// The Amazon Resource Name (ARN) of the service role you want to use for
  /// provisioning pipelines. Assumed by Proton for Amazon Web Services-managed
  /// provisioning, and by customer-owned automation for self-managed
  /// provisioning.
  final String? pipelineServiceRoleArn;

  AccountSettings({
    this.pipelineCodebuildRoleArn,
    this.pipelineProvisioningRepository,
    this.pipelineServiceRoleArn,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) {
    return AccountSettings(
      pipelineCodebuildRoleArn: json['pipelineCodebuildRoleArn'] as String?,
      pipelineProvisioningRepository: json['pipelineProvisioningRepository'] !=
              null
          ? RepositoryBranch.fromJson(
              json['pipelineProvisioningRepository'] as Map<String, dynamic>)
          : null,
      pipelineServiceRoleArn: json['pipelineServiceRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineCodebuildRoleArn = this.pipelineCodebuildRoleArn;
    final pipelineProvisioningRepository = this.pipelineProvisioningRepository;
    final pipelineServiceRoleArn = this.pipelineServiceRoleArn;
    return {
      if (pipelineCodebuildRoleArn != null)
        'pipelineCodebuildRoleArn': pipelineCodebuildRoleArn,
      if (pipelineProvisioningRepository != null)
        'pipelineProvisioningRepository': pipelineProvisioningRepository,
      if (pipelineServiceRoleArn != null)
        'pipelineServiceRoleArn': pipelineServiceRoleArn,
    };
  }
}

enum BlockerStatus {
  active,
  resolved,
}

extension BlockerStatusValueExtension on BlockerStatus {
  String toValue() {
    switch (this) {
      case BlockerStatus.active:
        return 'ACTIVE';
      case BlockerStatus.resolved:
        return 'RESOLVED';
    }
  }
}

extension BlockerStatusFromString on String {
  BlockerStatus toBlockerStatus() {
    switch (this) {
      case 'ACTIVE':
        return BlockerStatus.active;
      case 'RESOLVED':
        return BlockerStatus.resolved;
    }
    throw Exception('$this is not known in enum BlockerStatus');
  }
}

enum BlockerType {
  automated,
}

extension BlockerTypeValueExtension on BlockerType {
  String toValue() {
    switch (this) {
      case BlockerType.automated:
        return 'AUTOMATED';
    }
  }
}

extension BlockerTypeFromString on String {
  BlockerType toBlockerType() {
    switch (this) {
      case 'AUTOMATED':
        return BlockerType.automated;
    }
    throw Exception('$this is not known in enum BlockerType');
  }
}

class CancelComponentDeploymentOutput {
  /// The detailed data of the component with the deployment that is being
  /// canceled.
  final Component component;

  CancelComponentDeploymentOutput({
    required this.component,
  });

  factory CancelComponentDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return CancelComponentDeploymentOutput(
      component: Component.fromJson(json['component'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      'component': component,
    };
  }
}

class CancelEnvironmentDeploymentOutput {
  /// The environment summary data that's returned by Proton.
  final Environment environment;

  CancelEnvironmentDeploymentOutput({
    required this.environment,
  });

  factory CancelEnvironmentDeploymentOutput.fromJson(
      Map<String, dynamic> json) {
    return CancelEnvironmentDeploymentOutput(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      'environment': environment,
    };
  }
}

class CancelServiceInstanceDeploymentOutput {
  /// The service instance summary data that's returned by Proton.
  final ServiceInstance serviceInstance;

  CancelServiceInstanceDeploymentOutput({
    required this.serviceInstance,
  });

  factory CancelServiceInstanceDeploymentOutput.fromJson(
      Map<String, dynamic> json) {
    return CancelServiceInstanceDeploymentOutput(
      serviceInstance: ServiceInstance.fromJson(
          json['serviceInstance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstance = this.serviceInstance;
    return {
      'serviceInstance': serviceInstance,
    };
  }
}

class CancelServicePipelineDeploymentOutput {
  /// The service pipeline detail data that's returned by Proton.
  final ServicePipeline pipeline;

  CancelServicePipelineDeploymentOutput({
    required this.pipeline,
  });

  factory CancelServicePipelineDeploymentOutput.fromJson(
      Map<String, dynamic> json) {
    return CancelServicePipelineDeploymentOutput(
      pipeline:
          ServicePipeline.fromJson(json['pipeline'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      'pipeline': pipeline,
    };
  }
}

/// Compatible environment template data.
class CompatibleEnvironmentTemplate {
  /// The major version of the compatible environment template.
  final String majorVersion;

  /// The compatible environment template name.
  final String templateName;

  CompatibleEnvironmentTemplate({
    required this.majorVersion,
    required this.templateName,
  });

  factory CompatibleEnvironmentTemplate.fromJson(Map<String, dynamic> json) {
    return CompatibleEnvironmentTemplate(
      majorVersion: json['majorVersion'] as String,
      templateName: json['templateName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final majorVersion = this.majorVersion;
    final templateName = this.templateName;
    return {
      'majorVersion': majorVersion,
      'templateName': templateName,
    };
  }
}

/// Compatible environment template data.
class CompatibleEnvironmentTemplateInput {
  /// The major version of the compatible environment template.
  final String majorVersion;

  /// The compatible environment template name.
  final String templateName;

  CompatibleEnvironmentTemplateInput({
    required this.majorVersion,
    required this.templateName,
  });

  Map<String, dynamic> toJson() {
    final majorVersion = this.majorVersion;
    final templateName = this.templateName;
    return {
      'majorVersion': majorVersion,
      'templateName': templateName,
    };
  }
}

/// Detailed data of an Proton component resource.
///
/// For more information about components, see <a
/// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
/// components</a> in the <i>Proton User Guide</i>.
class Component {
  /// The Amazon Resource Name (ARN) of the component.
  final String arn;

  /// The time when the component was created.
  final DateTime createdAt;

  /// The component deployment status.
  final DeploymentStatus deploymentStatus;

  /// The name of the Proton environment that this component is associated with.
  final String environmentName;

  /// The time when the component was last modified.
  final DateTime lastModifiedAt;

  /// The name of the component.
  final String name;

  /// The message associated with the component deployment status.
  final String? deploymentStatusMessage;

  /// A description of the component.
  final String? description;

  /// The ID of the last attempted deployment of this component.
  final String? lastAttemptedDeploymentId;

  /// The last token the client requested.
  final String? lastClientRequestToken;

  /// The time when a deployment of the component was last attempted.
  final DateTime? lastDeploymentAttemptedAt;

  /// The time when the component was last deployed successfully.
  final DateTime? lastDeploymentSucceededAt;

  /// The ID of the last successful deployment of this component.
  final String? lastSucceededDeploymentId;

  /// The name of the service instance that this component is attached to.
  /// Provided when a component is attached to a service instance.
  final String? serviceInstanceName;

  /// The name of the service that <code>serviceInstanceName</code> is associated
  /// with. Provided when a component is attached to a service instance.
  final String? serviceName;

  /// The service spec that the component uses to access service inputs. Provided
  /// when a component is attached to a service instance.
  final String? serviceSpec;

  Component({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.lastModifiedAt,
    required this.name,
    this.deploymentStatusMessage,
    this.description,
    this.lastAttemptedDeploymentId,
    this.lastClientRequestToken,
    this.lastDeploymentAttemptedAt,
    this.lastDeploymentSucceededAt,
    this.lastSucceededDeploymentId,
    this.serviceInstanceName,
    this.serviceName,
    this.serviceSpec,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastClientRequestToken: json['lastClientRequestToken'] as String?,
      lastDeploymentAttemptedAt:
          timeStampFromJson(json['lastDeploymentAttemptedAt']),
      lastDeploymentSucceededAt:
          timeStampFromJson(json['lastDeploymentSucceededAt']),
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      serviceInstanceName: json['serviceInstanceName'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceSpec: json['serviceSpec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastClientRequestToken = this.lastClientRequestToken;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final serviceInstanceName = this.serviceInstanceName;
    final serviceName = this.serviceName;
    final serviceSpec = this.serviceSpec;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastClientRequestToken != null)
        'lastClientRequestToken': lastClientRequestToken,
      if (lastDeploymentAttemptedAt != null)
        'lastDeploymentAttemptedAt':
            unixTimestampToJson(lastDeploymentAttemptedAt),
      if (lastDeploymentSucceededAt != null)
        'lastDeploymentSucceededAt':
            unixTimestampToJson(lastDeploymentSucceededAt),
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceSpec != null) 'serviceSpec': serviceSpec,
    };
  }
}

enum ComponentDeploymentUpdateType {
  none,
  currentVersion,
}

extension ComponentDeploymentUpdateTypeValueExtension
    on ComponentDeploymentUpdateType {
  String toValue() {
    switch (this) {
      case ComponentDeploymentUpdateType.none:
        return 'NONE';
      case ComponentDeploymentUpdateType.currentVersion:
        return 'CURRENT_VERSION';
    }
  }
}

extension ComponentDeploymentUpdateTypeFromString on String {
  ComponentDeploymentUpdateType toComponentDeploymentUpdateType() {
    switch (this) {
      case 'NONE':
        return ComponentDeploymentUpdateType.none;
      case 'CURRENT_VERSION':
        return ComponentDeploymentUpdateType.currentVersion;
    }
    throw Exception('$this is not known in enum ComponentDeploymentUpdateType');
  }
}

/// The detailed data about the current state of the component.
class ComponentState {
  /// The name of the service instance that this component is attached to.
  /// Provided when a component is attached to a service instance.
  final String? serviceInstanceName;

  /// The name of the service that <code>serviceInstanceName</code> is associated
  /// with. Provided when a component is attached to a service instance.
  final String? serviceName;

  /// The service spec that the component uses to access service inputs. Provided
  /// when a component is attached to a service instance.
  final String? serviceSpec;

  /// The template file used.
  final String? templateFile;

  ComponentState({
    this.serviceInstanceName,
    this.serviceName,
    this.serviceSpec,
    this.templateFile,
  });

  factory ComponentState.fromJson(Map<String, dynamic> json) {
    return ComponentState(
      serviceInstanceName: json['serviceInstanceName'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceSpec: json['serviceSpec'] as String?,
      templateFile: json['templateFile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstanceName = this.serviceInstanceName;
    final serviceName = this.serviceName;
    final serviceSpec = this.serviceSpec;
    final templateFile = this.templateFile;
    return {
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceSpec != null) 'serviceSpec': serviceSpec,
      if (templateFile != null) 'templateFile': templateFile,
    };
  }
}

/// Summary data of an Proton component resource.
///
/// For more information about components, see <a
/// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
/// components</a> in the <i>Proton User Guide</i>.
class ComponentSummary {
  /// The Amazon Resource Name (ARN) of the component.
  final String arn;

  /// The time when the component was created.
  final DateTime createdAt;

  /// The component deployment status.
  final DeploymentStatus deploymentStatus;

  /// The name of the Proton environment that this component is associated with.
  final String environmentName;

  /// The time when the component was last modified.
  final DateTime lastModifiedAt;

  /// The name of the component.
  final String name;

  /// The message associated with the component deployment status.
  final String? deploymentStatusMessage;

  /// The ID of the last attempted deployment of this component.
  final String? lastAttemptedDeploymentId;

  /// The time when a deployment of the component was last attempted.
  final DateTime? lastDeploymentAttemptedAt;

  /// The time when the component was last deployed successfully.
  final DateTime? lastDeploymentSucceededAt;

  /// The ID of the last successful deployment of this component.
  final String? lastSucceededDeploymentId;

  /// The name of the service instance that this component is attached to.
  /// Provided when a component is attached to a service instance.
  final String? serviceInstanceName;

  /// The name of the service that <code>serviceInstanceName</code> is associated
  /// with. Provided when a component is attached to a service instance.
  final String? serviceName;

  ComponentSummary({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.lastModifiedAt,
    required this.name,
    this.deploymentStatusMessage,
    this.lastAttemptedDeploymentId,
    this.lastDeploymentAttemptedAt,
    this.lastDeploymentSucceededAt,
    this.lastSucceededDeploymentId,
    this.serviceInstanceName,
    this.serviceName,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastDeploymentAttemptedAt:
          timeStampFromJson(json['lastDeploymentAttemptedAt']),
      lastDeploymentSucceededAt:
          timeStampFromJson(json['lastDeploymentSucceededAt']),
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      serviceInstanceName: json['serviceInstanceName'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final serviceInstanceName = this.serviceInstanceName;
    final serviceName = this.serviceName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastDeploymentAttemptedAt != null)
        'lastDeploymentAttemptedAt':
            unixTimestampToJson(lastDeploymentAttemptedAt),
      if (lastDeploymentSucceededAt != null)
        'lastDeploymentSucceededAt':
            unixTimestampToJson(lastDeploymentSucceededAt),
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// Summary counts of each Proton resource type.
class CountsSummary {
  /// The total number of components in the Amazon Web Services account.
  ///
  /// The semantics of the <code>components</code> field are different from the
  /// semantics of results for other infrastructure-provisioning resources. That's
  /// because at this time components don't have associated templates, therefore
  /// they don't have the concept of staleness. The <code>components</code> object
  /// will only contain <code>total</code> and <code>failed</code> members.
  final ResourceCountsSummary? components;

  /// The total number of environment templates in the Amazon Web Services
  /// account. The <code>environmentTemplates</code> object will only contain
  /// <code>total</code> members.
  final ResourceCountsSummary? environmentTemplates;

  /// The staleness counts for Proton environments in the Amazon Web Services
  /// account. The <code>environments</code> object will only contain
  /// <code>total</code> members.
  final ResourceCountsSummary? environments;

  /// The staleness counts for Proton pipelines in the Amazon Web Services
  /// account.
  final ResourceCountsSummary? pipelines;

  /// The staleness counts for Proton service instances in the Amazon Web Services
  /// account.
  final ResourceCountsSummary? serviceInstances;

  /// The total number of service templates in the Amazon Web Services account.
  /// The <code>serviceTemplates</code> object will only contain
  /// <code>total</code> members.
  final ResourceCountsSummary? serviceTemplates;

  /// The staleness counts for Proton services in the Amazon Web Services account.
  final ResourceCountsSummary? services;

  CountsSummary({
    this.components,
    this.environmentTemplates,
    this.environments,
    this.pipelines,
    this.serviceInstances,
    this.serviceTemplates,
    this.services,
  });

  factory CountsSummary.fromJson(Map<String, dynamic> json) {
    return CountsSummary(
      components: json['components'] != null
          ? ResourceCountsSummary.fromJson(
              json['components'] as Map<String, dynamic>)
          : null,
      environmentTemplates: json['environmentTemplates'] != null
          ? ResourceCountsSummary.fromJson(
              json['environmentTemplates'] as Map<String, dynamic>)
          : null,
      environments: json['environments'] != null
          ? ResourceCountsSummary.fromJson(
              json['environments'] as Map<String, dynamic>)
          : null,
      pipelines: json['pipelines'] != null
          ? ResourceCountsSummary.fromJson(
              json['pipelines'] as Map<String, dynamic>)
          : null,
      serviceInstances: json['serviceInstances'] != null
          ? ResourceCountsSummary.fromJson(
              json['serviceInstances'] as Map<String, dynamic>)
          : null,
      serviceTemplates: json['serviceTemplates'] != null
          ? ResourceCountsSummary.fromJson(
              json['serviceTemplates'] as Map<String, dynamic>)
          : null,
      services: json['services'] != null
          ? ResourceCountsSummary.fromJson(
              json['services'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final environmentTemplates = this.environmentTemplates;
    final environments = this.environments;
    final pipelines = this.pipelines;
    final serviceInstances = this.serviceInstances;
    final serviceTemplates = this.serviceTemplates;
    final services = this.services;
    return {
      if (components != null) 'components': components,
      if (environmentTemplates != null)
        'environmentTemplates': environmentTemplates,
      if (environments != null) 'environments': environments,
      if (pipelines != null) 'pipelines': pipelines,
      if (serviceInstances != null) 'serviceInstances': serviceInstances,
      if (serviceTemplates != null) 'serviceTemplates': serviceTemplates,
      if (services != null) 'services': services,
    };
  }
}

class CreateComponentOutput {
  /// The detailed data of the created component.
  final Component component;

  CreateComponentOutput({
    required this.component,
  });

  factory CreateComponentOutput.fromJson(Map<String, dynamic> json) {
    return CreateComponentOutput(
      component: Component.fromJson(json['component'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      'component': component,
    };
  }
}

class CreateEnvironmentAccountConnectionOutput {
  /// The environment account connection detail data that's returned by Proton.
  final EnvironmentAccountConnection environmentAccountConnection;

  CreateEnvironmentAccountConnectionOutput({
    required this.environmentAccountConnection,
  });

  factory CreateEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateEnvironmentAccountConnectionOutput(
      environmentAccountConnection: EnvironmentAccountConnection.fromJson(
          json['environmentAccountConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

class CreateEnvironmentOutput {
  /// The environment detail data that's returned by Proton.
  final Environment environment;

  CreateEnvironmentOutput({
    required this.environment,
  });

  factory CreateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentOutput(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      'environment': environment,
    };
  }
}

class CreateEnvironmentTemplateOutput {
  /// The environment template detail data that's returned by Proton.
  final EnvironmentTemplate environmentTemplate;

  CreateEnvironmentTemplateOutput({
    required this.environmentTemplate,
  });

  factory CreateEnvironmentTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentTemplateOutput(
      environmentTemplate: EnvironmentTemplate.fromJson(
          json['environmentTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplate = this.environmentTemplate;
    return {
      'environmentTemplate': environmentTemplate,
    };
  }
}

class CreateEnvironmentTemplateVersionOutput {
  /// The environment template detail data that's returned by Proton.
  final EnvironmentTemplateVersion environmentTemplateVersion;

  CreateEnvironmentTemplateVersionOutput({
    required this.environmentTemplateVersion,
  });

  factory CreateEnvironmentTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateEnvironmentTemplateVersionOutput(
      environmentTemplateVersion: EnvironmentTemplateVersion.fromJson(
          json['environmentTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplateVersion = this.environmentTemplateVersion;
    return {
      'environmentTemplateVersion': environmentTemplateVersion,
    };
  }
}

class CreateRepositoryOutput {
  /// The repository link's detail data that's returned by Proton.
  final Repository repository;

  CreateRepositoryOutput({
    required this.repository,
  });

  factory CreateRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryOutput(
      repository:
          Repository.fromJson(json['repository'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      'repository': repository,
    };
  }
}

class CreateServiceInstanceOutput {
  /// The detailed data of the service instance being created.
  final ServiceInstance serviceInstance;

  CreateServiceInstanceOutput({
    required this.serviceInstance,
  });

  factory CreateServiceInstanceOutput.fromJson(Map<String, dynamic> json) {
    return CreateServiceInstanceOutput(
      serviceInstance: ServiceInstance.fromJson(
          json['serviceInstance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstance = this.serviceInstance;
    return {
      'serviceInstance': serviceInstance,
    };
  }
}

class CreateServiceOutput {
  /// The service detail data that's returned by Proton.
  final Service service;

  CreateServiceOutput({
    required this.service,
  });

  factory CreateServiceOutput.fromJson(Map<String, dynamic> json) {
    return CreateServiceOutput(
      service: Service.fromJson(json['service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

class CreateServiceSyncConfigOutput {
  /// The detailed data of the Proton Ops file.
  final ServiceSyncConfig? serviceSyncConfig;

  CreateServiceSyncConfigOutput({
    this.serviceSyncConfig,
  });

  factory CreateServiceSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return CreateServiceSyncConfigOutput(
      serviceSyncConfig: json['serviceSyncConfig'] != null
          ? ServiceSyncConfig.fromJson(
              json['serviceSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSyncConfig = this.serviceSyncConfig;
    return {
      if (serviceSyncConfig != null) 'serviceSyncConfig': serviceSyncConfig,
    };
  }
}

class CreateServiceTemplateOutput {
  /// The service template detail data that's returned by Proton.
  final ServiceTemplate serviceTemplate;

  CreateServiceTemplateOutput({
    required this.serviceTemplate,
  });

  factory CreateServiceTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreateServiceTemplateOutput(
      serviceTemplate: ServiceTemplate.fromJson(
          json['serviceTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplate = this.serviceTemplate;
    return {
      'serviceTemplate': serviceTemplate,
    };
  }
}

class CreateServiceTemplateVersionOutput {
  /// The service template version summary of detail data that's returned by
  /// Proton.
  final ServiceTemplateVersion serviceTemplateVersion;

  CreateServiceTemplateVersionOutput({
    required this.serviceTemplateVersion,
  });

  factory CreateServiceTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceTemplateVersionOutput(
      serviceTemplateVersion: ServiceTemplateVersion.fromJson(
          json['serviceTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplateVersion = this.serviceTemplateVersion;
    return {
      'serviceTemplateVersion': serviceTemplateVersion,
    };
  }
}

class CreateTemplateSyncConfigOutput {
  /// The template sync configuration detail data that's returned by Proton.
  final TemplateSyncConfig? templateSyncConfig;

  CreateTemplateSyncConfigOutput({
    this.templateSyncConfig,
  });

  factory CreateTemplateSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return CreateTemplateSyncConfigOutput(
      templateSyncConfig: json['templateSyncConfig'] != null
          ? TemplateSyncConfig.fromJson(
              json['templateSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final templateSyncConfig = this.templateSyncConfig;
    return {
      if (templateSyncConfig != null) 'templateSyncConfig': templateSyncConfig,
    };
  }
}

class DeleteComponentOutput {
  /// The detailed data of the component being deleted.
  final Component? component;

  DeleteComponentOutput({
    this.component,
  });

  factory DeleteComponentOutput.fromJson(Map<String, dynamic> json) {
    return DeleteComponentOutput(
      component: json['component'] != null
          ? Component.fromJson(json['component'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      if (component != null) 'component': component,
    };
  }
}

class DeleteDeploymentOutput {
  /// The detailed data of the deployment being deleted.
  final Deployment? deployment;

  DeleteDeploymentOutput({
    this.deployment,
  });

  factory DeleteDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDeploymentOutput(
      deployment: json['deployment'] != null
          ? Deployment.fromJson(json['deployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deployment = this.deployment;
    return {
      if (deployment != null) 'deployment': deployment,
    };
  }
}

class DeleteEnvironmentAccountConnectionOutput {
  /// The detailed data of the environment account connection being deleted.
  final EnvironmentAccountConnection? environmentAccountConnection;

  DeleteEnvironmentAccountConnectionOutput({
    this.environmentAccountConnection,
  });

  factory DeleteEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return DeleteEnvironmentAccountConnectionOutput(
      environmentAccountConnection: json['environmentAccountConnection'] != null
          ? EnvironmentAccountConnection.fromJson(
              json['environmentAccountConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      if (environmentAccountConnection != null)
        'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

class DeleteEnvironmentOutput {
  /// The detailed data of the environment being deleted.
  final Environment? environment;

  DeleteEnvironmentOutput({
    this.environment,
  });

  factory DeleteEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return DeleteEnvironmentOutput(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class DeleteEnvironmentTemplateOutput {
  /// The detailed data of the environment template being deleted.
  final EnvironmentTemplate? environmentTemplate;

  DeleteEnvironmentTemplateOutput({
    this.environmentTemplate,
  });

  factory DeleteEnvironmentTemplateOutput.fromJson(Map<String, dynamic> json) {
    return DeleteEnvironmentTemplateOutput(
      environmentTemplate: json['environmentTemplate'] != null
          ? EnvironmentTemplate.fromJson(
              json['environmentTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplate = this.environmentTemplate;
    return {
      if (environmentTemplate != null)
        'environmentTemplate': environmentTemplate,
    };
  }
}

class DeleteEnvironmentTemplateVersionOutput {
  /// The detailed data of the environment template version being deleted.
  final EnvironmentTemplateVersion? environmentTemplateVersion;

  DeleteEnvironmentTemplateVersionOutput({
    this.environmentTemplateVersion,
  });

  factory DeleteEnvironmentTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return DeleteEnvironmentTemplateVersionOutput(
      environmentTemplateVersion: json['environmentTemplateVersion'] != null
          ? EnvironmentTemplateVersion.fromJson(
              json['environmentTemplateVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplateVersion = this.environmentTemplateVersion;
    return {
      if (environmentTemplateVersion != null)
        'environmentTemplateVersion': environmentTemplateVersion,
    };
  }
}

class DeleteRepositoryOutput {
  /// The deleted repository link's detail data that's returned by Proton.
  final Repository? repository;

  DeleteRepositoryOutput({
    this.repository,
  });

  factory DeleteRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryOutput(
      repository: json['repository'] != null
          ? Repository.fromJson(json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

class DeleteServiceOutput {
  /// The detailed data of the service being deleted.
  final Service? service;

  DeleteServiceOutput({
    this.service,
  });

  factory DeleteServiceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteServiceOutput(
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'service': service,
    };
  }
}

class DeleteServiceSyncConfigOutput {
  /// The detailed data for the service sync config.
  final ServiceSyncConfig? serviceSyncConfig;

  DeleteServiceSyncConfigOutput({
    this.serviceSyncConfig,
  });

  factory DeleteServiceSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return DeleteServiceSyncConfigOutput(
      serviceSyncConfig: json['serviceSyncConfig'] != null
          ? ServiceSyncConfig.fromJson(
              json['serviceSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSyncConfig = this.serviceSyncConfig;
    return {
      if (serviceSyncConfig != null) 'serviceSyncConfig': serviceSyncConfig,
    };
  }
}

class DeleteServiceTemplateOutput {
  /// The detailed data of the service template being deleted.
  final ServiceTemplate? serviceTemplate;

  DeleteServiceTemplateOutput({
    this.serviceTemplate,
  });

  factory DeleteServiceTemplateOutput.fromJson(Map<String, dynamic> json) {
    return DeleteServiceTemplateOutput(
      serviceTemplate: json['serviceTemplate'] != null
          ? ServiceTemplate.fromJson(
              json['serviceTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplate = this.serviceTemplate;
    return {
      if (serviceTemplate != null) 'serviceTemplate': serviceTemplate,
    };
  }
}

class DeleteServiceTemplateVersionOutput {
  /// The detailed data of the service template version being deleted.
  final ServiceTemplateVersion? serviceTemplateVersion;

  DeleteServiceTemplateVersionOutput({
    this.serviceTemplateVersion,
  });

  factory DeleteServiceTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return DeleteServiceTemplateVersionOutput(
      serviceTemplateVersion: json['serviceTemplateVersion'] != null
          ? ServiceTemplateVersion.fromJson(
              json['serviceTemplateVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplateVersion = this.serviceTemplateVersion;
    return {
      if (serviceTemplateVersion != null)
        'serviceTemplateVersion': serviceTemplateVersion,
    };
  }
}

class DeleteTemplateSyncConfigOutput {
  /// The template sync configuration detail data that's returned by Proton.
  final TemplateSyncConfig? templateSyncConfig;

  DeleteTemplateSyncConfigOutput({
    this.templateSyncConfig,
  });

  factory DeleteTemplateSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTemplateSyncConfigOutput(
      templateSyncConfig: json['templateSyncConfig'] != null
          ? TemplateSyncConfig.fromJson(
              json['templateSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final templateSyncConfig = this.templateSyncConfig;
    return {
      if (templateSyncConfig != null) 'templateSyncConfig': templateSyncConfig,
    };
  }
}

/// The detailed information about a deployment.
class Deployment {
  /// The Amazon Resource Name (ARN) of the deployment.
  final String arn;

  /// The date and time the deployment was created.
  final DateTime createdAt;

  /// The status of the deployment.
  final DeploymentStatus deploymentStatus;

  /// The name of the environment associated with this deployment.
  final String environmentName;

  /// The ID of the deployment.
  final String id;

  /// The date and time the deployment was last modified.
  final DateTime lastModifiedAt;

  /// The Amazon Resource Name (ARN) of the target of the deployment.
  final String targetArn;

  /// The date and time the depoyment target was created.
  final DateTime targetResourceCreatedAt;

  /// The resource type of the deployment target. It can be an environment,
  /// service, service instance, or component.
  final DeploymentTargetResourceType targetResourceType;

  /// The date and time the deployment was completed.
  final DateTime? completedAt;

  /// The name of the component associated with this deployment.
  final String? componentName;

  /// The deployment status message.
  final String? deploymentStatusMessage;

  /// The initial state of the target resource at the time of the deployment.
  final DeploymentState? initialState;

  /// The ID of the last attempted deployment.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment.
  final String? lastSucceededDeploymentId;

  /// The name of the deployment's service instance.
  final String? serviceInstanceName;

  /// The name of the service in this deployment.
  final String? serviceName;

  /// The target state of the target resource at the time of the deployment.
  final DeploymentState? targetState;

  Deployment({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.id,
    required this.lastModifiedAt,
    required this.targetArn,
    required this.targetResourceCreatedAt,
    required this.targetResourceType,
    this.completedAt,
    this.componentName,
    this.deploymentStatusMessage,
    this.initialState,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
    this.serviceInstanceName,
    this.serviceName,
    this.targetState,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      targetArn: json['targetArn'] as String,
      targetResourceCreatedAt: nonNullableTimeStampFromJson(
          json['targetResourceCreatedAt'] as Object),
      targetResourceType: (json['targetResourceType'] as String)
          .toDeploymentTargetResourceType(),
      completedAt: timeStampFromJson(json['completedAt']),
      componentName: json['componentName'] as String?,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      initialState: json['initialState'] != null
          ? DeploymentState.fromJson(
              json['initialState'] as Map<String, dynamic>)
          : null,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      serviceInstanceName: json['serviceInstanceName'] as String?,
      serviceName: json['serviceName'] as String?,
      targetState: json['targetState'] != null
          ? DeploymentState.fromJson(
              json['targetState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final id = this.id;
    final lastModifiedAt = this.lastModifiedAt;
    final targetArn = this.targetArn;
    final targetResourceCreatedAt = this.targetResourceCreatedAt;
    final targetResourceType = this.targetResourceType;
    final completedAt = this.completedAt;
    final componentName = this.componentName;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final initialState = this.initialState;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final serviceInstanceName = this.serviceInstanceName;
    final serviceName = this.serviceName;
    final targetState = this.targetState;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'id': id,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'targetArn': targetArn,
      'targetResourceCreatedAt': unixTimestampToJson(targetResourceCreatedAt),
      'targetResourceType': targetResourceType.toValue(),
      if (completedAt != null) 'completedAt': unixTimestampToJson(completedAt),
      if (componentName != null) 'componentName': componentName,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (initialState != null) 'initialState': initialState,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
      if (serviceName != null) 'serviceName': serviceName,
      if (targetState != null) 'targetState': targetState,
    };
  }
}

/// The detailed data about the current state of the deployment.
class DeploymentState {
  /// The state of the component associated with the deployment.
  final ComponentState? component;

  /// The state of the environment associated with the deployment.
  final EnvironmentState? environment;

  /// The state of the service instance associated with the deployment.
  final ServiceInstanceState? serviceInstance;

  /// The state of the service pipeline associated with the deployment.
  final ServicePipelineState? servicePipeline;

  DeploymentState({
    this.component,
    this.environment,
    this.serviceInstance,
    this.servicePipeline,
  });

  factory DeploymentState.fromJson(Map<String, dynamic> json) {
    return DeploymentState(
      component: json['component'] != null
          ? ComponentState.fromJson(json['component'] as Map<String, dynamic>)
          : null,
      environment: json['environment'] != null
          ? EnvironmentState.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
      serviceInstance: json['serviceInstance'] != null
          ? ServiceInstanceState.fromJson(
              json['serviceInstance'] as Map<String, dynamic>)
          : null,
      servicePipeline: json['servicePipeline'] != null
          ? ServicePipelineState.fromJson(
              json['servicePipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    final environment = this.environment;
    final serviceInstance = this.serviceInstance;
    final servicePipeline = this.servicePipeline;
    return {
      if (component != null) 'component': component,
      if (environment != null) 'environment': environment,
      if (serviceInstance != null) 'serviceInstance': serviceInstance,
      if (servicePipeline != null) 'servicePipeline': servicePipeline,
    };
  }
}

enum DeploymentStatus {
  inProgress,
  failed,
  succeeded,
  deleteInProgress,
  deleteFailed,
  deleteComplete,
  cancelling,
  cancelled,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.inProgress:
        return 'IN_PROGRESS';
      case DeploymentStatus.failed:
        return 'FAILED';
      case DeploymentStatus.succeeded:
        return 'SUCCEEDED';
      case DeploymentStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case DeploymentStatus.deleteFailed:
        return 'DELETE_FAILED';
      case DeploymentStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case DeploymentStatus.cancelling:
        return 'CANCELLING';
      case DeploymentStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return DeploymentStatus.inProgress;
      case 'FAILED':
        return DeploymentStatus.failed;
      case 'SUCCEEDED':
        return DeploymentStatus.succeeded;
      case 'DELETE_IN_PROGRESS':
        return DeploymentStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return DeploymentStatus.deleteFailed;
      case 'DELETE_COMPLETE':
        return DeploymentStatus.deleteComplete;
      case 'CANCELLING':
        return DeploymentStatus.cancelling;
      case 'CANCELLED':
        return DeploymentStatus.cancelled;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

/// Summary data of the deployment.
class DeploymentSummary {
  /// The Amazon Resource Name (ARN) of the deployment.
  final String arn;

  /// The date and time the deployment was created.
  final DateTime createdAt;

  /// The current status of the deployment.
  final DeploymentStatus deploymentStatus;

  /// The name of the environment associated with the deployment.
  final String environmentName;

  /// The ID of the deployment.
  final String id;

  /// The date and time the deployment was last modified.
  final DateTime lastModifiedAt;

  /// The Amazon Resource Name (ARN) of the target of the deployment.
  final String targetArn;

  /// The date and time the target resource was created.
  final DateTime targetResourceCreatedAt;

  /// The resource type of the deployment target. It can be an environment,
  /// service, service instance, or component.
  final DeploymentTargetResourceType targetResourceType;

  /// The date and time the deployment was completed.
  final DateTime? completedAt;

  /// The name of the component associated with the deployment.
  final String? componentName;

  /// The ID of the last attempted deployment.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment.
  final String? lastSucceededDeploymentId;

  /// The name of the service instance associated with the deployment.
  final String? serviceInstanceName;

  /// The name of the service associated with the deployment.
  final String? serviceName;

  DeploymentSummary({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.id,
    required this.lastModifiedAt,
    required this.targetArn,
    required this.targetResourceCreatedAt,
    required this.targetResourceType,
    this.completedAt,
    this.componentName,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
    this.serviceInstanceName,
    this.serviceName,
  });

  factory DeploymentSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      targetArn: json['targetArn'] as String,
      targetResourceCreatedAt: nonNullableTimeStampFromJson(
          json['targetResourceCreatedAt'] as Object),
      targetResourceType: (json['targetResourceType'] as String)
          .toDeploymentTargetResourceType(),
      completedAt: timeStampFromJson(json['completedAt']),
      componentName: json['componentName'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      serviceInstanceName: json['serviceInstanceName'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final id = this.id;
    final lastModifiedAt = this.lastModifiedAt;
    final targetArn = this.targetArn;
    final targetResourceCreatedAt = this.targetResourceCreatedAt;
    final targetResourceType = this.targetResourceType;
    final completedAt = this.completedAt;
    final componentName = this.componentName;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final serviceInstanceName = this.serviceInstanceName;
    final serviceName = this.serviceName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'id': id,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'targetArn': targetArn,
      'targetResourceCreatedAt': unixTimestampToJson(targetResourceCreatedAt),
      'targetResourceType': targetResourceType.toValue(),
      if (completedAt != null) 'completedAt': unixTimestampToJson(completedAt),
      if (componentName != null) 'componentName': componentName,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

enum DeploymentTargetResourceType {
  environment,
  servicePipeline,
  serviceInstance,
  component,
}

extension DeploymentTargetResourceTypeValueExtension
    on DeploymentTargetResourceType {
  String toValue() {
    switch (this) {
      case DeploymentTargetResourceType.environment:
        return 'ENVIRONMENT';
      case DeploymentTargetResourceType.servicePipeline:
        return 'SERVICE_PIPELINE';
      case DeploymentTargetResourceType.serviceInstance:
        return 'SERVICE_INSTANCE';
      case DeploymentTargetResourceType.component:
        return 'COMPONENT';
    }
  }
}

extension DeploymentTargetResourceTypeFromString on String {
  DeploymentTargetResourceType toDeploymentTargetResourceType() {
    switch (this) {
      case 'ENVIRONMENT':
        return DeploymentTargetResourceType.environment;
      case 'SERVICE_PIPELINE':
        return DeploymentTargetResourceType.servicePipeline;
      case 'SERVICE_INSTANCE':
        return DeploymentTargetResourceType.serviceInstance;
      case 'COMPONENT':
        return DeploymentTargetResourceType.component;
    }
    throw Exception('$this is not known in enum DeploymentTargetResourceType');
  }
}

enum DeploymentUpdateType {
  none,
  currentVersion,
  minorVersion,
  majorVersion,
}

extension DeploymentUpdateTypeValueExtension on DeploymentUpdateType {
  String toValue() {
    switch (this) {
      case DeploymentUpdateType.none:
        return 'NONE';
      case DeploymentUpdateType.currentVersion:
        return 'CURRENT_VERSION';
      case DeploymentUpdateType.minorVersion:
        return 'MINOR_VERSION';
      case DeploymentUpdateType.majorVersion:
        return 'MAJOR_VERSION';
    }
  }
}

extension DeploymentUpdateTypeFromString on String {
  DeploymentUpdateType toDeploymentUpdateType() {
    switch (this) {
      case 'NONE':
        return DeploymentUpdateType.none;
      case 'CURRENT_VERSION':
        return DeploymentUpdateType.currentVersion;
      case 'MINOR_VERSION':
        return DeploymentUpdateType.minorVersion;
      case 'MAJOR_VERSION':
        return DeploymentUpdateType.majorVersion;
    }
    throw Exception('$this is not known in enum DeploymentUpdateType');
  }
}

/// Detailed data of an Proton environment resource. An Proton environment is a
/// set of resources shared across Proton services.
class Environment {
  /// The Amazon Resource Name (ARN) of the environment.
  final String arn;

  /// The time when the environment was created.
  final DateTime createdAt;

  /// The environment deployment status.
  final DeploymentStatus deploymentStatus;

  /// The time when a deployment of the environment was last attempted.
  final DateTime lastDeploymentAttemptedAt;

  /// The time when the environment was last deployed successfully.
  final DateTime lastDeploymentSucceededAt;

  /// The name of the environment.
  final String name;

  /// The major version of the environment template.
  final String templateMajorVersion;

  /// The minor version of the environment template.
  final String templateMinorVersion;

  /// The Amazon Resource Name (ARN) of the environment template.
  final String templateName;

  /// The Amazon Resource Name (ARN) of the IAM service role that allows Proton to
  /// provision infrastructure using CodeBuild-based provisioning on your behalf.
  final String? codebuildRoleArn;

  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses when
  /// provisioning directly defined components in this environment. It determines
  /// the scope of infrastructure that a component can provision.
  ///
  /// The environment must have a <code>componentRoleArn</code> to allow directly
  /// defined components to be associated with the environment.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  final String? componentRoleArn;

  /// An environment deployment status message.
  final String? deploymentStatusMessage;

  /// The description of the environment.
  final String? description;

  /// The ID of the environment account connection that's used to provision
  /// infrastructure resources in an environment account.
  final String? environmentAccountConnectionId;

  /// The ID of the environment account that the environment infrastructure
  /// resources are provisioned in.
  final String? environmentAccountId;

  /// The ID of the last attempted deployment of this environment.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment of this environment.
  final String? lastSucceededDeploymentId;

  /// The Amazon Resource Name (ARN) of the Proton service role that allows Proton
  /// to make calls to other services on your behalf.
  final String? protonServiceRoleArn;

  /// When included, indicates that the environment template is for customer
  /// provisioned and managed infrastructure.
  final Provisioning? provisioning;

  /// The linked repository that you use to host your rendered infrastructure
  /// templates for self-managed provisioning. A linked repository is a repository
  /// that has been registered with Proton. For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/APIReference/API_CreateRepository.html">CreateRepository</a>.
  final RepositoryBranch? provisioningRepository;

  /// The environment spec.
  final String? spec;

  Environment({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.lastDeploymentAttemptedAt,
    required this.lastDeploymentSucceededAt,
    required this.name,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.codebuildRoleArn,
    this.componentRoleArn,
    this.deploymentStatusMessage,
    this.description,
    this.environmentAccountConnectionId,
    this.environmentAccountId,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
    this.protonServiceRoleArn,
    this.provisioning,
    this.provisioningRepository,
    this.spec,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      lastDeploymentAttemptedAt: nonNullableTimeStampFromJson(
          json['lastDeploymentAttemptedAt'] as Object),
      lastDeploymentSucceededAt: nonNullableTimeStampFromJson(
          json['lastDeploymentSucceededAt'] as Object),
      name: json['name'] as String,
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      codebuildRoleArn: json['codebuildRoleArn'] as String?,
      componentRoleArn: json['componentRoleArn'] as String?,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
      environmentAccountConnectionId:
          json['environmentAccountConnectionId'] as String?,
      environmentAccountId: json['environmentAccountId'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      protonServiceRoleArn: json['protonServiceRoleArn'] as String?,
      provisioning: (json['provisioning'] as String?)?.toProvisioning(),
      provisioningRepository: json['provisioningRepository'] != null
          ? RepositoryBranch.fromJson(
              json['provisioningRepository'] as Map<String, dynamic>)
          : null,
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final name = this.name;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final codebuildRoleArn = this.codebuildRoleArn;
    final componentRoleArn = this.componentRoleArn;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    final environmentAccountConnectionId = this.environmentAccountConnectionId;
    final environmentAccountId = this.environmentAccountId;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final protonServiceRoleArn = this.protonServiceRoleArn;
    final provisioning = this.provisioning;
    final provisioningRepository = this.provisioningRepository;
    final spec = this.spec;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'lastDeploymentAttemptedAt':
          unixTimestampToJson(lastDeploymentAttemptedAt),
      'lastDeploymentSucceededAt':
          unixTimestampToJson(lastDeploymentSucceededAt),
      'name': name,
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
      if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
      if (environmentAccountConnectionId != null)
        'environmentAccountConnectionId': environmentAccountConnectionId,
      if (environmentAccountId != null)
        'environmentAccountId': environmentAccountId,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (protonServiceRoleArn != null)
        'protonServiceRoleArn': protonServiceRoleArn,
      if (provisioning != null) 'provisioning': provisioning.toValue(),
      if (provisioningRepository != null)
        'provisioningRepository': provisioningRepository,
      if (spec != null) 'spec': spec,
    };
  }
}

/// Detailed data of an Proton environment account connection resource.
class EnvironmentAccountConnection {
  /// The Amazon Resource Name (ARN) of the environment account connection.
  final String arn;

  /// The environment account that's connected to the environment account
  /// connection.
  final String environmentAccountId;

  /// The name of the environment that's associated with the environment account
  /// connection.
  final String environmentName;

  /// The ID of the environment account connection.
  final String id;

  /// The time when the environment account connection was last modified.
  final DateTime lastModifiedAt;

  /// The ID of the management account that's connected to the environment account
  /// connection.
  final String managementAccountId;

  /// The time when the environment account connection request was made.
  final DateTime requestedAt;

  /// The IAM service role that's associated with the environment account
  /// connection.
  final String roleArn;

  /// The status of the environment account connection.
  final EnvironmentAccountConnectionStatus status;

  /// The Amazon Resource Name (ARN) of an IAM service role in the environment
  /// account. Proton uses this role to provision infrastructure resources using
  /// CodeBuild-based provisioning in the associated environment account.
  final String? codebuildRoleArn;

  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses when
  /// provisioning directly defined components in the associated environment
  /// account. It determines the scope of infrastructure that a component can
  /// provision in the account.
  ///
  /// The environment account connection must have a <code>componentRoleArn</code>
  /// to allow directly defined components to be associated with any environments
  /// running in the account.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  final String? componentRoleArn;

  EnvironmentAccountConnection({
    required this.arn,
    required this.environmentAccountId,
    required this.environmentName,
    required this.id,
    required this.lastModifiedAt,
    required this.managementAccountId,
    required this.requestedAt,
    required this.roleArn,
    required this.status,
    this.codebuildRoleArn,
    this.componentRoleArn,
  });

  factory EnvironmentAccountConnection.fromJson(Map<String, dynamic> json) {
    return EnvironmentAccountConnection(
      arn: json['arn'] as String,
      environmentAccountId: json['environmentAccountId'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      managementAccountId: json['managementAccountId'] as String,
      requestedAt: nonNullableTimeStampFromJson(json['requestedAt'] as Object),
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toEnvironmentAccountConnectionStatus(),
      codebuildRoleArn: json['codebuildRoleArn'] as String?,
      componentRoleArn: json['componentRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environmentAccountId = this.environmentAccountId;
    final environmentName = this.environmentName;
    final id = this.id;
    final lastModifiedAt = this.lastModifiedAt;
    final managementAccountId = this.managementAccountId;
    final requestedAt = this.requestedAt;
    final roleArn = this.roleArn;
    final status = this.status;
    final codebuildRoleArn = this.codebuildRoleArn;
    final componentRoleArn = this.componentRoleArn;
    return {
      'arn': arn,
      'environmentAccountId': environmentAccountId,
      'environmentName': environmentName,
      'id': id,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'managementAccountId': managementAccountId,
      'requestedAt': unixTimestampToJson(requestedAt),
      'roleArn': roleArn,
      'status': status.toValue(),
      if (codebuildRoleArn != null) 'codebuildRoleArn': codebuildRoleArn,
      if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
    };
  }
}

enum EnvironmentAccountConnectionRequesterAccountType {
  managementAccount,
  environmentAccount,
}

extension EnvironmentAccountConnectionRequesterAccountTypeValueExtension
    on EnvironmentAccountConnectionRequesterAccountType {
  String toValue() {
    switch (this) {
      case EnvironmentAccountConnectionRequesterAccountType.managementAccount:
        return 'MANAGEMENT_ACCOUNT';
      case EnvironmentAccountConnectionRequesterAccountType.environmentAccount:
        return 'ENVIRONMENT_ACCOUNT';
    }
  }
}

extension EnvironmentAccountConnectionRequesterAccountTypeFromString on String {
  EnvironmentAccountConnectionRequesterAccountType
      toEnvironmentAccountConnectionRequesterAccountType() {
    switch (this) {
      case 'MANAGEMENT_ACCOUNT':
        return EnvironmentAccountConnectionRequesterAccountType
            .managementAccount;
      case 'ENVIRONMENT_ACCOUNT':
        return EnvironmentAccountConnectionRequesterAccountType
            .environmentAccount;
    }
    throw Exception(
        '$this is not known in enum EnvironmentAccountConnectionRequesterAccountType');
  }
}

enum EnvironmentAccountConnectionStatus {
  pending,
  connected,
  rejected,
}

extension EnvironmentAccountConnectionStatusValueExtension
    on EnvironmentAccountConnectionStatus {
  String toValue() {
    switch (this) {
      case EnvironmentAccountConnectionStatus.pending:
        return 'PENDING';
      case EnvironmentAccountConnectionStatus.connected:
        return 'CONNECTED';
      case EnvironmentAccountConnectionStatus.rejected:
        return 'REJECTED';
    }
  }
}

extension EnvironmentAccountConnectionStatusFromString on String {
  EnvironmentAccountConnectionStatus toEnvironmentAccountConnectionStatus() {
    switch (this) {
      case 'PENDING':
        return EnvironmentAccountConnectionStatus.pending;
      case 'CONNECTED':
        return EnvironmentAccountConnectionStatus.connected;
      case 'REJECTED':
        return EnvironmentAccountConnectionStatus.rejected;
    }
    throw Exception(
        '$this is not known in enum EnvironmentAccountConnectionStatus');
  }
}

/// Summary data of an Proton environment account connection resource.
class EnvironmentAccountConnectionSummary {
  /// The Amazon Resource Name (ARN) of the environment account connection.
  final String arn;

  /// The ID of the environment account that's connected to the environment
  /// account connection.
  final String environmentAccountId;

  /// The name of the environment that's associated with the environment account
  /// connection.
  final String environmentName;

  /// The ID of the environment account connection.
  final String id;

  /// The time when the environment account connection was last modified.
  final DateTime lastModifiedAt;

  /// The ID of the management account that's connected to the environment account
  /// connection.
  final String managementAccountId;

  /// The time when the environment account connection request was made.
  final DateTime requestedAt;

  /// The IAM service role that's associated with the environment account
  /// connection.
  final String roleArn;

  /// The status of the environment account connection.
  final EnvironmentAccountConnectionStatus status;

  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses when
  /// provisioning directly defined components in the associated environment
  /// account. It determines the scope of infrastructure that a component can
  /// provision in the account.
  ///
  /// The environment account connection must have a <code>componentRoleArn</code>
  /// to allow directly defined components to be associated with any environments
  /// running in the account.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  final String? componentRoleArn;

  EnvironmentAccountConnectionSummary({
    required this.arn,
    required this.environmentAccountId,
    required this.environmentName,
    required this.id,
    required this.lastModifiedAt,
    required this.managementAccountId,
    required this.requestedAt,
    required this.roleArn,
    required this.status,
    this.componentRoleArn,
  });

  factory EnvironmentAccountConnectionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentAccountConnectionSummary(
      arn: json['arn'] as String,
      environmentAccountId: json['environmentAccountId'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      managementAccountId: json['managementAccountId'] as String,
      requestedAt: nonNullableTimeStampFromJson(json['requestedAt'] as Object),
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toEnvironmentAccountConnectionStatus(),
      componentRoleArn: json['componentRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environmentAccountId = this.environmentAccountId;
    final environmentName = this.environmentName;
    final id = this.id;
    final lastModifiedAt = this.lastModifiedAt;
    final managementAccountId = this.managementAccountId;
    final requestedAt = this.requestedAt;
    final roleArn = this.roleArn;
    final status = this.status;
    final componentRoleArn = this.componentRoleArn;
    return {
      'arn': arn,
      'environmentAccountId': environmentAccountId,
      'environmentName': environmentName,
      'id': id,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'managementAccountId': managementAccountId,
      'requestedAt': unixTimestampToJson(requestedAt),
      'roleArn': roleArn,
      'status': status.toValue(),
      if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
    };
  }
}

/// The detailed data about the current state of the environment.
class EnvironmentState {
  /// The major version of the environment template that was used to create the
  /// environment.
  final String templateMajorVersion;

  /// The minor version of the environment template that was used to create the
  /// environment.
  final String templateMinorVersion;

  /// The name of the environment template that was used to create the
  /// environment.
  final String templateName;

  /// The environment spec that was used to create the environment.
  final String? spec;

  EnvironmentState({
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.spec,
  });

  factory EnvironmentState.fromJson(Map<String, dynamic> json) {
    return EnvironmentState(
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final spec = this.spec;
    return {
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (spec != null) 'spec': spec,
    };
  }
}

/// Summary data of an Proton environment resource. An Proton environment is a
/// set of resources shared across Proton services.
class EnvironmentSummary {
  /// The Amazon Resource Name (ARN) of the environment.
  final String arn;

  /// The time when the environment was created.
  final DateTime createdAt;

  /// The environment deployment status.
  final DeploymentStatus deploymentStatus;

  /// The time when a deployment of the environment was last attempted.
  final DateTime lastDeploymentAttemptedAt;

  /// The time when the environment was last deployed successfully.
  final DateTime lastDeploymentSucceededAt;

  /// The name of the environment.
  final String name;

  /// The major version of the environment template.
  final String templateMajorVersion;

  /// The minor version of the environment template.
  final String templateMinorVersion;

  /// The name of the environment template.
  final String templateName;

  /// The Amazon Resource Name (ARN) of the IAM service role that Proton uses when
  /// provisioning directly defined components in this environment. It determines
  /// the scope of infrastructure that a component can provision.
  ///
  /// The environment must have a <code>componentRoleArn</code> to allow directly
  /// defined components to be associated with the environment.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  final String? componentRoleArn;

  /// An environment deployment status message.
  final String? deploymentStatusMessage;

  /// The description of the environment.
  final String? description;

  /// The ID of the environment account connection that the environment is
  /// associated with.
  final String? environmentAccountConnectionId;

  /// The ID of the environment account that the environment infrastructure
  /// resources are provisioned in.
  final String? environmentAccountId;

  /// The ID of the last attempted deployment of this environment.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment of this environment.
  final String? lastSucceededDeploymentId;

  /// The Amazon Resource Name (ARN) of the Proton service role that allows Proton
  /// to make calls to other services on your behalf.
  final String? protonServiceRoleArn;

  /// When included, indicates that the environment template is for customer
  /// provisioned and managed infrastructure.
  final Provisioning? provisioning;

  EnvironmentSummary({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.lastDeploymentAttemptedAt,
    required this.lastDeploymentSucceededAt,
    required this.name,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.componentRoleArn,
    this.deploymentStatusMessage,
    this.description,
    this.environmentAccountConnectionId,
    this.environmentAccountId,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
    this.protonServiceRoleArn,
    this.provisioning,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      lastDeploymentAttemptedAt: nonNullableTimeStampFromJson(
          json['lastDeploymentAttemptedAt'] as Object),
      lastDeploymentSucceededAt: nonNullableTimeStampFromJson(
          json['lastDeploymentSucceededAt'] as Object),
      name: json['name'] as String,
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      componentRoleArn: json['componentRoleArn'] as String?,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
      environmentAccountConnectionId:
          json['environmentAccountConnectionId'] as String?,
      environmentAccountId: json['environmentAccountId'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      protonServiceRoleArn: json['protonServiceRoleArn'] as String?,
      provisioning: (json['provisioning'] as String?)?.toProvisioning(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final name = this.name;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final componentRoleArn = this.componentRoleArn;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    final environmentAccountConnectionId = this.environmentAccountConnectionId;
    final environmentAccountId = this.environmentAccountId;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final protonServiceRoleArn = this.protonServiceRoleArn;
    final provisioning = this.provisioning;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'lastDeploymentAttemptedAt':
          unixTimestampToJson(lastDeploymentAttemptedAt),
      'lastDeploymentSucceededAt':
          unixTimestampToJson(lastDeploymentSucceededAt),
      'name': name,
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (componentRoleArn != null) 'componentRoleArn': componentRoleArn,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
      if (environmentAccountConnectionId != null)
        'environmentAccountConnectionId': environmentAccountConnectionId,
      if (environmentAccountId != null)
        'environmentAccountId': environmentAccountId,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (protonServiceRoleArn != null)
        'protonServiceRoleArn': protonServiceRoleArn,
      if (provisioning != null) 'provisioning': provisioning.toValue(),
    };
  }
}

/// The environment template data.
class EnvironmentTemplate {
  /// The Amazon Resource Name (ARN) of the environment template.
  final String arn;

  /// The time when the environment template was created.
  final DateTime createdAt;

  /// The time when the environment template was last modified.
  final DateTime lastModifiedAt;

  /// The name of the environment template.
  final String name;

  /// A description of the environment template.
  final String? description;

  /// The name of the environment template as displayed in the developer
  /// interface.
  final String? displayName;

  /// The customer provided encryption key for the environment template.
  final String? encryptionKey;

  /// When included, indicates that the environment template is for customer
  /// provisioned and managed infrastructure.
  final Provisioning? provisioning;

  /// The ID of the recommended version of the environment template.
  final String? recommendedVersion;

  EnvironmentTemplate({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    this.description,
    this.displayName,
    this.encryptionKey,
    this.provisioning,
    this.recommendedVersion,
  });

  factory EnvironmentTemplate.fromJson(Map<String, dynamic> json) {
    return EnvironmentTemplate(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      encryptionKey: json['encryptionKey'] as String?,
      provisioning: (json['provisioning'] as String?)?.toProvisioning(),
      recommendedVersion: json['recommendedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final encryptionKey = this.encryptionKey;
    final provisioning = this.provisioning;
    final recommendedVersion = this.recommendedVersion;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (provisioning != null) 'provisioning': provisioning.toValue(),
      if (recommendedVersion != null) 'recommendedVersion': recommendedVersion,
    };
  }
}

/// A search filter for environment templates.
class EnvironmentTemplateFilter {
  /// Include <code>majorVersion</code> to filter search for a major version.
  final String majorVersion;

  /// Include <code>templateName</code> to filter search for a template name.
  final String templateName;

  EnvironmentTemplateFilter({
    required this.majorVersion,
    required this.templateName,
  });

  Map<String, dynamic> toJson() {
    final majorVersion = this.majorVersion;
    final templateName = this.templateName;
    return {
      'majorVersion': majorVersion,
      'templateName': templateName,
    };
  }
}

/// The environment template data.
class EnvironmentTemplateSummary {
  /// The Amazon Resource Name (ARN) of the environment template.
  final String arn;

  /// The time when the environment template was created.
  final DateTime createdAt;

  /// The time when the environment template was last modified.
  final DateTime lastModifiedAt;

  /// The name of the environment template.
  final String name;

  /// A description of the environment template.
  final String? description;

  /// The name of the environment template as displayed in the developer
  /// interface.
  final String? displayName;

  /// When included, indicates that the environment template is for customer
  /// provisioned and managed infrastructure.
  final Provisioning? provisioning;

  /// The recommended version of the environment template.
  final String? recommendedVersion;

  EnvironmentTemplateSummary({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    this.description,
    this.displayName,
    this.provisioning,
    this.recommendedVersion,
  });

  factory EnvironmentTemplateSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentTemplateSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      provisioning: (json['provisioning'] as String?)?.toProvisioning(),
      recommendedVersion: json['recommendedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final provisioning = this.provisioning;
    final recommendedVersion = this.recommendedVersion;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (provisioning != null) 'provisioning': provisioning.toValue(),
      if (recommendedVersion != null) 'recommendedVersion': recommendedVersion,
    };
  }
}

/// The environment template version data.
class EnvironmentTemplateVersion {
  /// The Amazon Resource Name (ARN) of the version of an environment template.
  final String arn;

  /// The time when the version of an environment template was created.
  final DateTime createdAt;

  /// The time when the version of an environment template was last modified.
  final DateTime lastModifiedAt;

  /// The latest major version that's associated with the version of an
  /// environment template.
  final String majorVersion;

  /// The minor version of an environment template.
  final String minorVersion;

  /// The status of the version of an environment template.
  final TemplateVersionStatus status;

  /// The name of the version of an environment template.
  final String templateName;

  /// A description of the minor version of an environment template.
  final String? description;

  /// The recommended minor version of the environment template.
  final String? recommendedMinorVersion;

  /// The schema of the version of an environment template.
  final String? schema;

  /// The status message of the version of an environment template.
  final String? statusMessage;

  EnvironmentTemplateVersion({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.majorVersion,
    required this.minorVersion,
    required this.status,
    required this.templateName,
    this.description,
    this.recommendedMinorVersion,
    this.schema,
    this.statusMessage,
  });

  factory EnvironmentTemplateVersion.fromJson(Map<String, dynamic> json) {
    return EnvironmentTemplateVersion(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      majorVersion: json['majorVersion'] as String,
      minorVersion: json['minorVersion'] as String,
      status: (json['status'] as String).toTemplateVersionStatus(),
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      recommendedMinorVersion: json['recommendedMinorVersion'] as String?,
      schema: json['schema'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final majorVersion = this.majorVersion;
    final minorVersion = this.minorVersion;
    final status = this.status;
    final templateName = this.templateName;
    final description = this.description;
    final recommendedMinorVersion = this.recommendedMinorVersion;
    final schema = this.schema;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'majorVersion': majorVersion,
      'minorVersion': minorVersion,
      'status': status.toValue(),
      'templateName': templateName,
      if (description != null) 'description': description,
      if (recommendedMinorVersion != null)
        'recommendedMinorVersion': recommendedMinorVersion,
      if (schema != null) 'schema': schema,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// A summary of the version of an environment template detail data.
class EnvironmentTemplateVersionSummary {
  /// The Amazon Resource Name (ARN) of the version of an environment template.
  final String arn;

  /// The time when the version of an environment template was created.
  final DateTime createdAt;

  /// The time when the version of an environment template was last modified.
  final DateTime lastModifiedAt;

  /// The latest major version that's associated with the version of an
  /// environment template.
  final String majorVersion;

  /// The version of an environment template.
  final String minorVersion;

  /// The status of the version of an environment template.
  final TemplateVersionStatus status;

  /// The name of the environment template.
  final String templateName;

  /// A description of the version of an environment template.
  final String? description;

  /// The recommended minor version of the environment template.
  final String? recommendedMinorVersion;

  /// The status message of the version of an environment template.
  final String? statusMessage;

  EnvironmentTemplateVersionSummary({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.majorVersion,
    required this.minorVersion,
    required this.status,
    required this.templateName,
    this.description,
    this.recommendedMinorVersion,
    this.statusMessage,
  });

  factory EnvironmentTemplateVersionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentTemplateVersionSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      majorVersion: json['majorVersion'] as String,
      minorVersion: json['minorVersion'] as String,
      status: (json['status'] as String).toTemplateVersionStatus(),
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      recommendedMinorVersion: json['recommendedMinorVersion'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final majorVersion = this.majorVersion;
    final minorVersion = this.minorVersion;
    final status = this.status;
    final templateName = this.templateName;
    final description = this.description;
    final recommendedMinorVersion = this.recommendedMinorVersion;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'majorVersion': majorVersion,
      'minorVersion': minorVersion,
      'status': status.toValue(),
      'templateName': templateName,
      if (description != null) 'description': description,
      if (recommendedMinorVersion != null)
        'recommendedMinorVersion': recommendedMinorVersion,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetAccountSettingsOutput {
  /// The Proton pipeline service role detail data that's returned by Proton.
  final AccountSettings? accountSettings;

  GetAccountSettingsOutput({
    this.accountSettings,
  });

  factory GetAccountSettingsOutput.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsOutput(
      accountSettings: json['accountSettings'] != null
          ? AccountSettings.fromJson(
              json['accountSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    return {
      if (accountSettings != null) 'accountSettings': accountSettings,
    };
  }
}

class GetComponentOutput {
  /// The detailed data of the requested component.
  final Component? component;

  GetComponentOutput({
    this.component,
  });

  factory GetComponentOutput.fromJson(Map<String, dynamic> json) {
    return GetComponentOutput(
      component: json['component'] != null
          ? Component.fromJson(json['component'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      if (component != null) 'component': component,
    };
  }
}

class GetDeploymentOutput {
  /// The detailed data of the requested deployment.
  final Deployment? deployment;

  GetDeploymentOutput({
    this.deployment,
  });

  factory GetDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentOutput(
      deployment: json['deployment'] != null
          ? Deployment.fromJson(json['deployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deployment = this.deployment;
    return {
      if (deployment != null) 'deployment': deployment,
    };
  }
}

class GetEnvironmentAccountConnectionOutput {
  /// The detailed data of the requested environment account connection.
  final EnvironmentAccountConnection environmentAccountConnection;

  GetEnvironmentAccountConnectionOutput({
    required this.environmentAccountConnection,
  });

  factory GetEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return GetEnvironmentAccountConnectionOutput(
      environmentAccountConnection: EnvironmentAccountConnection.fromJson(
          json['environmentAccountConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

class GetEnvironmentOutput {
  /// The detailed data of the requested environment.
  final Environment environment;

  GetEnvironmentOutput({
    required this.environment,
  });

  factory GetEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentOutput(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      'environment': environment,
    };
  }
}

class GetEnvironmentTemplateOutput {
  /// The detailed data of the requested environment template.
  final EnvironmentTemplate environmentTemplate;

  GetEnvironmentTemplateOutput({
    required this.environmentTemplate,
  });

  factory GetEnvironmentTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentTemplateOutput(
      environmentTemplate: EnvironmentTemplate.fromJson(
          json['environmentTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplate = this.environmentTemplate;
    return {
      'environmentTemplate': environmentTemplate,
    };
  }
}

class GetEnvironmentTemplateVersionOutput {
  /// The detailed data of the requested environment template version.
  final EnvironmentTemplateVersion environmentTemplateVersion;

  GetEnvironmentTemplateVersionOutput({
    required this.environmentTemplateVersion,
  });

  factory GetEnvironmentTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return GetEnvironmentTemplateVersionOutput(
      environmentTemplateVersion: EnvironmentTemplateVersion.fromJson(
          json['environmentTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplateVersion = this.environmentTemplateVersion;
    return {
      'environmentTemplateVersion': environmentTemplateVersion,
    };
  }
}

class GetRepositoryOutput {
  /// The repository link's detail data that's returned by Proton.
  final Repository repository;

  GetRepositoryOutput({
    required this.repository,
  });

  factory GetRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositoryOutput(
      repository:
          Repository.fromJson(json['repository'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      'repository': repository,
    };
  }
}

class GetRepositorySyncStatusOutput {
  /// The repository sync status detail data that's returned by Proton.
  final RepositorySyncAttempt? latestSync;

  GetRepositorySyncStatusOutput({
    this.latestSync,
  });

  factory GetRepositorySyncStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositorySyncStatusOutput(
      latestSync: json['latestSync'] != null
          ? RepositorySyncAttempt.fromJson(
              json['latestSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final latestSync = this.latestSync;
    return {
      if (latestSync != null) 'latestSync': latestSync,
    };
  }
}

class GetResourcesSummaryOutput {
  /// Summary counts of each Proton resource type.
  final CountsSummary counts;

  GetResourcesSummaryOutput({
    required this.counts,
  });

  factory GetResourcesSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcesSummaryOutput(
      counts: CountsSummary.fromJson(json['counts'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final counts = this.counts;
    return {
      'counts': counts,
    };
  }
}

class GetServiceInstanceOutput {
  /// The detailed data of the requested service instance.
  final ServiceInstance serviceInstance;

  GetServiceInstanceOutput({
    required this.serviceInstance,
  });

  factory GetServiceInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceInstanceOutput(
      serviceInstance: ServiceInstance.fromJson(
          json['serviceInstance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstance = this.serviceInstance;
    return {
      'serviceInstance': serviceInstance,
    };
  }
}

class GetServiceInstanceSyncStatusOutput {
  /// The service instance sync desired state that's returned by Proton
  final Revision? desiredState;

  /// The detailed data of the latest successful sync with the service instance.
  final ResourceSyncAttempt? latestSuccessfulSync;

  /// The detailed data of the latest sync with the service instance.
  final ResourceSyncAttempt? latestSync;

  GetServiceInstanceSyncStatusOutput({
    this.desiredState,
    this.latestSuccessfulSync,
    this.latestSync,
  });

  factory GetServiceInstanceSyncStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return GetServiceInstanceSyncStatusOutput(
      desiredState: json['desiredState'] != null
          ? Revision.fromJson(json['desiredState'] as Map<String, dynamic>)
          : null,
      latestSuccessfulSync: json['latestSuccessfulSync'] != null
          ? ResourceSyncAttempt.fromJson(
              json['latestSuccessfulSync'] as Map<String, dynamic>)
          : null,
      latestSync: json['latestSync'] != null
          ? ResourceSyncAttempt.fromJson(
              json['latestSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final latestSuccessfulSync = this.latestSuccessfulSync;
    final latestSync = this.latestSync;
    return {
      if (desiredState != null) 'desiredState': desiredState,
      if (latestSuccessfulSync != null)
        'latestSuccessfulSync': latestSuccessfulSync,
      if (latestSync != null) 'latestSync': latestSync,
    };
  }
}

class GetServiceOutput {
  /// The detailed data of the requested service.
  final Service? service;

  GetServiceOutput({
    this.service,
  });

  factory GetServiceOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceOutput(
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'service': service,
    };
  }
}

class GetServiceSyncBlockerSummaryOutput {
  /// The detailed data of the requested service sync blocker summary.
  final ServiceSyncBlockerSummary? serviceSyncBlockerSummary;

  GetServiceSyncBlockerSummaryOutput({
    this.serviceSyncBlockerSummary,
  });

  factory GetServiceSyncBlockerSummaryOutput.fromJson(
      Map<String, dynamic> json) {
    return GetServiceSyncBlockerSummaryOutput(
      serviceSyncBlockerSummary: json['serviceSyncBlockerSummary'] != null
          ? ServiceSyncBlockerSummary.fromJson(
              json['serviceSyncBlockerSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSyncBlockerSummary = this.serviceSyncBlockerSummary;
    return {
      if (serviceSyncBlockerSummary != null)
        'serviceSyncBlockerSummary': serviceSyncBlockerSummary,
    };
  }
}

class GetServiceSyncConfigOutput {
  /// The detailed data of the requested service sync configuration.
  final ServiceSyncConfig? serviceSyncConfig;

  GetServiceSyncConfigOutput({
    this.serviceSyncConfig,
  });

  factory GetServiceSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceSyncConfigOutput(
      serviceSyncConfig: json['serviceSyncConfig'] != null
          ? ServiceSyncConfig.fromJson(
              json['serviceSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSyncConfig = this.serviceSyncConfig;
    return {
      if (serviceSyncConfig != null) 'serviceSyncConfig': serviceSyncConfig,
    };
  }
}

class GetServiceTemplateOutput {
  /// The detailed data of the requested service template.
  final ServiceTemplate serviceTemplate;

  GetServiceTemplateOutput({
    required this.serviceTemplate,
  });

  factory GetServiceTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceTemplateOutput(
      serviceTemplate: ServiceTemplate.fromJson(
          json['serviceTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplate = this.serviceTemplate;
    return {
      'serviceTemplate': serviceTemplate,
    };
  }
}

class GetServiceTemplateVersionOutput {
  /// The detailed data of the requested service template version.
  final ServiceTemplateVersion serviceTemplateVersion;

  GetServiceTemplateVersionOutput({
    required this.serviceTemplateVersion,
  });

  factory GetServiceTemplateVersionOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceTemplateVersionOutput(
      serviceTemplateVersion: ServiceTemplateVersion.fromJson(
          json['serviceTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplateVersion = this.serviceTemplateVersion;
    return {
      'serviceTemplateVersion': serviceTemplateVersion,
    };
  }
}

class GetTemplateSyncConfigOutput {
  /// The template sync configuration detail data that's returned by Proton.
  final TemplateSyncConfig? templateSyncConfig;

  GetTemplateSyncConfigOutput({
    this.templateSyncConfig,
  });

  factory GetTemplateSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return GetTemplateSyncConfigOutput(
      templateSyncConfig: json['templateSyncConfig'] != null
          ? TemplateSyncConfig.fromJson(
              json['templateSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final templateSyncConfig = this.templateSyncConfig;
    return {
      if (templateSyncConfig != null) 'templateSyncConfig': templateSyncConfig,
    };
  }
}

class GetTemplateSyncStatusOutput {
  /// The template sync desired state that's returned by Proton.
  final Revision? desiredState;

  /// The details of the last successful sync that's returned by Proton.
  final ResourceSyncAttempt? latestSuccessfulSync;

  /// The details of the last sync that's returned by Proton.
  final ResourceSyncAttempt? latestSync;

  GetTemplateSyncStatusOutput({
    this.desiredState,
    this.latestSuccessfulSync,
    this.latestSync,
  });

  factory GetTemplateSyncStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetTemplateSyncStatusOutput(
      desiredState: json['desiredState'] != null
          ? Revision.fromJson(json['desiredState'] as Map<String, dynamic>)
          : null,
      latestSuccessfulSync: json['latestSuccessfulSync'] != null
          ? ResourceSyncAttempt.fromJson(
              json['latestSuccessfulSync'] as Map<String, dynamic>)
          : null,
      latestSync: json['latestSync'] != null
          ? ResourceSyncAttempt.fromJson(
              json['latestSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final latestSuccessfulSync = this.latestSuccessfulSync;
    final latestSync = this.latestSync;
    return {
      if (desiredState != null) 'desiredState': desiredState,
      if (latestSuccessfulSync != null)
        'latestSuccessfulSync': latestSuccessfulSync,
      if (latestSync != null) 'latestSync': latestSync,
    };
  }
}

class ListComponentOutputsOutput {
  /// An array of component Infrastructure as Code (IaC) outputs.
  final List<Output> outputs;

  /// A token that indicates the location of the next output in the array of
  /// outputs, after the list of outputs that was previously requested.
  final String? nextToken;

  ListComponentOutputsOutput({
    required this.outputs,
    this.nextToken,
  });

  factory ListComponentOutputsOutput.fromJson(Map<String, dynamic> json) {
    return ListComponentOutputsOutput(
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputs = this.outputs;
    final nextToken = this.nextToken;
    return {
      'outputs': outputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComponentProvisionedResourcesOutput {
  /// An array of provisioned resources for a component.
  final List<ProvisionedResource> provisionedResources;

  /// A token that indicates the location of the next provisioned resource in the
  /// array of provisioned resources, after the current requested list of
  /// provisioned resources.
  final String? nextToken;

  ListComponentProvisionedResourcesOutput({
    required this.provisionedResources,
    this.nextToken,
  });

  factory ListComponentProvisionedResourcesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListComponentProvisionedResourcesOutput(
      provisionedResources: (json['provisionedResources'] as List)
          .whereNotNull()
          .map((e) => ProvisionedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedResources = this.provisionedResources;
    final nextToken = this.nextToken;
    return {
      'provisionedResources': provisionedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComponentsOutput {
  /// An array of components with summary data.
  final List<ComponentSummary> components;

  /// A token that indicates the location of the next component in the array of
  /// components, after the current requested list of components.
  final String? nextToken;

  ListComponentsOutput({
    required this.components,
    this.nextToken,
  });

  factory ListComponentsOutput.fromJson(Map<String, dynamic> json) {
    return ListComponentsOutput(
      components: (json['components'] as List)
          .whereNotNull()
          .map((e) => ComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final nextToken = this.nextToken;
    return {
      'components': components,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeploymentsOutput {
  /// An array of deployment with summary data.
  final List<DeploymentSummary> deployments;

  /// A token that indicates the location of the next deployment in the array of
  /// deployment, after the current requested list of deployment.
  final String? nextToken;

  ListDeploymentsOutput({
    required this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsOutput(
      deployments: (json['deployments'] as List)
          .whereNotNull()
          .map((e) => DeploymentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      'deployments': deployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentAccountConnectionsOutput {
  /// An array of environment account connections with details that's returned by
  /// Proton.
  final List<EnvironmentAccountConnectionSummary> environmentAccountConnections;

  /// A token that indicates the location of the next environment account
  /// connection in the array of environment account connections, after the
  /// current requested list of environment account connections.
  final String? nextToken;

  ListEnvironmentAccountConnectionsOutput({
    required this.environmentAccountConnections,
    this.nextToken,
  });

  factory ListEnvironmentAccountConnectionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListEnvironmentAccountConnectionsOutput(
      environmentAccountConnections:
          (json['environmentAccountConnections'] as List)
              .whereNotNull()
              .map((e) => EnvironmentAccountConnectionSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnections = this.environmentAccountConnections;
    final nextToken = this.nextToken;
    return {
      'environmentAccountConnections': environmentAccountConnections,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentOutputsOutput {
  /// An array of environment outputs with detail data.
  final List<Output> outputs;

  /// A token that indicates the location of the next environment output in the
  /// array of environment outputs, after the current requested list of
  /// environment outputs.
  final String? nextToken;

  ListEnvironmentOutputsOutput({
    required this.outputs,
    this.nextToken,
  });

  factory ListEnvironmentOutputsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentOutputsOutput(
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputs = this.outputs;
    final nextToken = this.nextToken;
    return {
      'outputs': outputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentProvisionedResourcesOutput {
  /// An array of environment provisioned resources.
  final List<ProvisionedResource> provisionedResources;

  /// A token that indicates the location of the next environment provisioned
  /// resource in the array of provisioned resources, after the current requested
  /// list of environment provisioned resources.
  final String? nextToken;

  ListEnvironmentProvisionedResourcesOutput({
    required this.provisionedResources,
    this.nextToken,
  });

  factory ListEnvironmentProvisionedResourcesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListEnvironmentProvisionedResourcesOutput(
      provisionedResources: (json['provisionedResources'] as List)
          .whereNotNull()
          .map((e) => ProvisionedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedResources = this.provisionedResources;
    final nextToken = this.nextToken;
    return {
      'provisionedResources': provisionedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentTemplateVersionsOutput {
  /// An array of major or minor versions of an environment template detail data.
  final List<EnvironmentTemplateVersionSummary> templateVersions;

  /// A token that indicates the location of the next major or minor version in
  /// the array of major or minor versions of an environment template, after the
  /// list of major or minor versions that was previously requested.
  final String? nextToken;

  ListEnvironmentTemplateVersionsOutput({
    required this.templateVersions,
    this.nextToken,
  });

  factory ListEnvironmentTemplateVersionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListEnvironmentTemplateVersionsOutput(
      templateVersions: (json['templateVersions'] as List)
          .whereNotNull()
          .map((e) => EnvironmentTemplateVersionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateVersions = this.templateVersions;
    final nextToken = this.nextToken;
    return {
      'templateVersions': templateVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentTemplatesOutput {
  /// An array of environment templates with detail data.
  final List<EnvironmentTemplateSummary> templates;

  /// A token that indicates the location of the next environment template in the
  /// array of environment templates, after the current requested list of
  /// environment templates.
  final String? nextToken;

  ListEnvironmentTemplatesOutput({
    required this.templates,
    this.nextToken,
  });

  factory ListEnvironmentTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentTemplatesOutput(
      templates: (json['templates'] as List)
          .whereNotNull()
          .map((e) =>
              EnvironmentTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templates = this.templates;
    final nextToken = this.nextToken;
    return {
      'templates': templates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentsOutput {
  /// An array of environment detail data summaries.
  final List<EnvironmentSummary> environments;

  /// A token that indicates the location of the next environment in the array of
  /// environments, after the current requested list of environments.
  final String? nextToken;

  ListEnvironmentsOutput({
    required this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsOutput(
      environments: (json['environments'] as List)
          .whereNotNull()
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRepositoriesOutput {
  /// An array of repository links.
  final List<RepositorySummary> repositories;

  /// A token that indicates the location of the next repository in the array of
  /// repositories, after the current requested list of repositories.
  final String? nextToken;

  ListRepositoriesOutput({
    required this.repositories,
    this.nextToken,
  });

  factory ListRepositoriesOutput.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesOutput(
      repositories: (json['repositories'] as List)
          .whereNotNull()
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositories = this.repositories;
    final nextToken = this.nextToken;
    return {
      'repositories': repositories,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRepositorySyncDefinitionsOutput {
  /// An array of repository sync definitions.
  final List<RepositorySyncDefinition> syncDefinitions;

  /// A token that indicates the location of the next repository sync definition
  /// in the array of repository sync definitions, after the current requested
  /// list of repository sync definitions.
  final String? nextToken;

  ListRepositorySyncDefinitionsOutput({
    required this.syncDefinitions,
    this.nextToken,
  });

  factory ListRepositorySyncDefinitionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRepositorySyncDefinitionsOutput(
      syncDefinitions: (json['syncDefinitions'] as List)
          .whereNotNull()
          .map((e) =>
              RepositorySyncDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final syncDefinitions = this.syncDefinitions;
    final nextToken = this.nextToken;
    return {
      'syncDefinitions': syncDefinitions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServiceInstanceOutputsOutput {
  /// An array of service instance Infrastructure as Code (IaC) outputs.
  final List<Output> outputs;

  /// A token that indicates the location of the next output in the array of
  /// outputs, after the current requested list of outputs.
  final String? nextToken;

  ListServiceInstanceOutputsOutput({
    required this.outputs,
    this.nextToken,
  });

  factory ListServiceInstanceOutputsOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceInstanceOutputsOutput(
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputs = this.outputs;
    final nextToken = this.nextToken;
    return {
      'outputs': outputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServiceInstanceProvisionedResourcesOutput {
  /// An array of provisioned resources for a service instance.
  final List<ProvisionedResource> provisionedResources;

  /// A token that indicates the location of the next provisioned resource in the
  /// array of provisioned resources, after the current requested list of
  /// provisioned resources.
  final String? nextToken;

  ListServiceInstanceProvisionedResourcesOutput({
    required this.provisionedResources,
    this.nextToken,
  });

  factory ListServiceInstanceProvisionedResourcesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListServiceInstanceProvisionedResourcesOutput(
      provisionedResources: (json['provisionedResources'] as List)
          .whereNotNull()
          .map((e) => ProvisionedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedResources = this.provisionedResources;
    final nextToken = this.nextToken;
    return {
      'provisionedResources': provisionedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A filtering criterion to scope down the result list of the
/// <a>ListServiceInstances</a> action.
class ListServiceInstancesFilter {
  /// The name of a filtering criterion.
  final ListServiceInstancesFilterBy? key;

  /// A value to filter by.
  ///
  /// With the date/time keys (<code>*At{Before,After}</code>), the value is a
  /// valid <a href="https://datatracker.ietf.org/doc/html/rfc3339.html">RFC
  /// 3339</a> string with no UTC offset and with an optional fractional precision
  /// (for example, <code>1985-04-12T23:20:50.52Z</code>).
  final String? value;

  ListServiceInstancesFilter({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum ListServiceInstancesFilterBy {
  name,
  deploymentStatus,
  templateName,
  serviceName,
  deployedTemplateVersionStatus,
  environmentName,
  lastDeploymentAttemptedAtBefore,
  lastDeploymentAttemptedAtAfter,
  createdAtBefore,
  createdAtAfter,
}

extension ListServiceInstancesFilterByValueExtension
    on ListServiceInstancesFilterBy {
  String toValue() {
    switch (this) {
      case ListServiceInstancesFilterBy.name:
        return 'name';
      case ListServiceInstancesFilterBy.deploymentStatus:
        return 'deploymentStatus';
      case ListServiceInstancesFilterBy.templateName:
        return 'templateName';
      case ListServiceInstancesFilterBy.serviceName:
        return 'serviceName';
      case ListServiceInstancesFilterBy.deployedTemplateVersionStatus:
        return 'deployedTemplateVersionStatus';
      case ListServiceInstancesFilterBy.environmentName:
        return 'environmentName';
      case ListServiceInstancesFilterBy.lastDeploymentAttemptedAtBefore:
        return 'lastDeploymentAttemptedAtBefore';
      case ListServiceInstancesFilterBy.lastDeploymentAttemptedAtAfter:
        return 'lastDeploymentAttemptedAtAfter';
      case ListServiceInstancesFilterBy.createdAtBefore:
        return 'createdAtBefore';
      case ListServiceInstancesFilterBy.createdAtAfter:
        return 'createdAtAfter';
    }
  }
}

extension ListServiceInstancesFilterByFromString on String {
  ListServiceInstancesFilterBy toListServiceInstancesFilterBy() {
    switch (this) {
      case 'name':
        return ListServiceInstancesFilterBy.name;
      case 'deploymentStatus':
        return ListServiceInstancesFilterBy.deploymentStatus;
      case 'templateName':
        return ListServiceInstancesFilterBy.templateName;
      case 'serviceName':
        return ListServiceInstancesFilterBy.serviceName;
      case 'deployedTemplateVersionStatus':
        return ListServiceInstancesFilterBy.deployedTemplateVersionStatus;
      case 'environmentName':
        return ListServiceInstancesFilterBy.environmentName;
      case 'lastDeploymentAttemptedAtBefore':
        return ListServiceInstancesFilterBy.lastDeploymentAttemptedAtBefore;
      case 'lastDeploymentAttemptedAtAfter':
        return ListServiceInstancesFilterBy.lastDeploymentAttemptedAtAfter;
      case 'createdAtBefore':
        return ListServiceInstancesFilterBy.createdAtBefore;
      case 'createdAtAfter':
        return ListServiceInstancesFilterBy.createdAtAfter;
    }
    throw Exception('$this is not known in enum ListServiceInstancesFilterBy');
  }
}

class ListServiceInstancesOutput {
  /// An array of service instances with summary data.
  final List<ServiceInstanceSummary> serviceInstances;

  /// A token that indicates the location of the next service instance in the
  /// array of service instances, after the current requested list of service
  /// instances.
  final String? nextToken;

  ListServiceInstancesOutput({
    required this.serviceInstances,
    this.nextToken,
  });

  factory ListServiceInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceInstancesOutput(
      serviceInstances: (json['serviceInstances'] as List)
          .whereNotNull()
          .map(
              (e) => ServiceInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstances = this.serviceInstances;
    final nextToken = this.nextToken;
    return {
      'serviceInstances': serviceInstances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListServiceInstancesSortBy {
  name,
  deploymentStatus,
  templateName,
  serviceName,
  environmentName,
  lastDeploymentAttemptedAt,
  createdAt,
}

extension ListServiceInstancesSortByValueExtension
    on ListServiceInstancesSortBy {
  String toValue() {
    switch (this) {
      case ListServiceInstancesSortBy.name:
        return 'name';
      case ListServiceInstancesSortBy.deploymentStatus:
        return 'deploymentStatus';
      case ListServiceInstancesSortBy.templateName:
        return 'templateName';
      case ListServiceInstancesSortBy.serviceName:
        return 'serviceName';
      case ListServiceInstancesSortBy.environmentName:
        return 'environmentName';
      case ListServiceInstancesSortBy.lastDeploymentAttemptedAt:
        return 'lastDeploymentAttemptedAt';
      case ListServiceInstancesSortBy.createdAt:
        return 'createdAt';
    }
  }
}

extension ListServiceInstancesSortByFromString on String {
  ListServiceInstancesSortBy toListServiceInstancesSortBy() {
    switch (this) {
      case 'name':
        return ListServiceInstancesSortBy.name;
      case 'deploymentStatus':
        return ListServiceInstancesSortBy.deploymentStatus;
      case 'templateName':
        return ListServiceInstancesSortBy.templateName;
      case 'serviceName':
        return ListServiceInstancesSortBy.serviceName;
      case 'environmentName':
        return ListServiceInstancesSortBy.environmentName;
      case 'lastDeploymentAttemptedAt':
        return ListServiceInstancesSortBy.lastDeploymentAttemptedAt;
      case 'createdAt':
        return ListServiceInstancesSortBy.createdAt;
    }
    throw Exception('$this is not known in enum ListServiceInstancesSortBy');
  }
}

class ListServicePipelineOutputsOutput {
  /// An array of service pipeline Infrastructure as Code (IaC) outputs.
  final List<Output> outputs;

  /// A token that indicates the location of the next output in the array of
  /// outputs, after the current requested list of outputs.
  final String? nextToken;

  ListServicePipelineOutputsOutput({
    required this.outputs,
    this.nextToken,
  });

  factory ListServicePipelineOutputsOutput.fromJson(Map<String, dynamic> json) {
    return ListServicePipelineOutputsOutput(
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputs = this.outputs;
    final nextToken = this.nextToken;
    return {
      'outputs': outputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServicePipelineProvisionedResourcesOutput {
  /// An array of provisioned resources for a service and pipeline.
  final List<ProvisionedResource> provisionedResources;

  /// A token that indicates the location of the next provisioned resource in the
  /// array of provisioned resources, after the current requested list of
  /// provisioned resources.
  final String? nextToken;

  ListServicePipelineProvisionedResourcesOutput({
    required this.provisionedResources,
    this.nextToken,
  });

  factory ListServicePipelineProvisionedResourcesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListServicePipelineProvisionedResourcesOutput(
      provisionedResources: (json['provisionedResources'] as List)
          .whereNotNull()
          .map((e) => ProvisionedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedResources = this.provisionedResources;
    final nextToken = this.nextToken;
    return {
      'provisionedResources': provisionedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServiceTemplateVersionsOutput {
  /// An array of major or minor versions of a service template with detail data.
  final List<ServiceTemplateVersionSummary> templateVersions;

  /// A token that indicates the location of the next major or minor version in
  /// the array of major or minor versions of a service template, after the
  /// current requested list of service major or minor versions.
  final String? nextToken;

  ListServiceTemplateVersionsOutput({
    required this.templateVersions,
    this.nextToken,
  });

  factory ListServiceTemplateVersionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListServiceTemplateVersionsOutput(
      templateVersions: (json['templateVersions'] as List)
          .whereNotNull()
          .map((e) =>
              ServiceTemplateVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateVersions = this.templateVersions;
    final nextToken = this.nextToken;
    return {
      'templateVersions': templateVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServiceTemplatesOutput {
  /// An array of service templates with detail data.
  final List<ServiceTemplateSummary> templates;

  /// A token that indicates the location of the next service template in the
  /// array of service templates, after the current requested list of service
  /// templates.
  final String? nextToken;

  ListServiceTemplatesOutput({
    required this.templates,
    this.nextToken,
  });

  factory ListServiceTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceTemplatesOutput(
      templates: (json['templates'] as List)
          .whereNotNull()
          .map(
              (e) => ServiceTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templates = this.templates;
    final nextToken = this.nextToken;
    return {
      'templates': templates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServicesOutput {
  /// An array of services with summaries of detail data.
  final List<ServiceSummary> services;

  /// A token that indicates the location of the next service in the array of
  /// services, after the current requested list of services.
  final String? nextToken;

  ListServicesOutput({
    required this.services,
    this.nextToken,
  });

  factory ListServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListServicesOutput(
      services: (json['services'] as List)
          .whereNotNull()
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final services = this.services;
    final nextToken = this.nextToken;
    return {
      'services': services,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// A list of resource tags with detail data.
  final List<Tag> tags;

  /// A token that indicates the location of the next resource tag in the array of
  /// resource tags, after the current requested list of resource tags.
  final String? nextToken;

  ListTagsForResourceOutput({
    required this.tags,
    this.nextToken,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final nextToken = this.nextToken;
    return {
      'tags': tags,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class NotifyResourceDeploymentStatusChangeOutput {
  NotifyResourceDeploymentStatusChangeOutput();

  factory NotifyResourceDeploymentStatusChangeOutput.fromJson(
      Map<String, dynamic> _) {
    return NotifyResourceDeploymentStatusChangeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An infrastructure as code defined resource output.
class Output {
  /// The output key.
  final String? key;

  /// The output value.
  final String? valueString;

  Output({
    this.key,
    this.valueString,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      key: json['key'] as String?,
      valueString: json['valueString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final valueString = this.valueString;
    return {
      if (key != null) 'key': key,
      if (valueString != null) 'valueString': valueString,
    };
  }
}

/// Detail data for a provisioned resource.
class ProvisionedResource {
  /// The provisioned resource identifier.
  final String? identifier;

  /// The provisioned resource name.
  final String? name;

  /// The resource provisioning engine. At this time, <code>CLOUDFORMATION</code>
  /// can be used for Amazon Web Services-managed provisioning, and
  /// <code>TERRAFORM</code> can be used for self-managed provisioning.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self">Self-managed
  /// provisioning</a> in the <i>Proton User Guide</i>.
  final ProvisionedResourceEngine? provisioningEngine;

  ProvisionedResource({
    this.identifier,
    this.name,
    this.provisioningEngine,
  });

  factory ProvisionedResource.fromJson(Map<String, dynamic> json) {
    return ProvisionedResource(
      identifier: json['identifier'] as String?,
      name: json['name'] as String?,
      provisioningEngine: (json['provisioningEngine'] as String?)
          ?.toProvisionedResourceEngine(),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final name = this.name;
    final provisioningEngine = this.provisioningEngine;
    return {
      if (identifier != null) 'identifier': identifier,
      if (name != null) 'name': name,
      if (provisioningEngine != null)
        'provisioningEngine': provisioningEngine.toValue(),
    };
  }
}

/// List of provisioning engines
enum ProvisionedResourceEngine {
  cloudformation,
  terraform,
}

extension ProvisionedResourceEngineValueExtension on ProvisionedResourceEngine {
  String toValue() {
    switch (this) {
      case ProvisionedResourceEngine.cloudformation:
        return 'CLOUDFORMATION';
      case ProvisionedResourceEngine.terraform:
        return 'TERRAFORM';
    }
  }
}

extension ProvisionedResourceEngineFromString on String {
  ProvisionedResourceEngine toProvisionedResourceEngine() {
    switch (this) {
      case 'CLOUDFORMATION':
        return ProvisionedResourceEngine.cloudformation;
      case 'TERRAFORM':
        return ProvisionedResourceEngine.terraform;
    }
    throw Exception('$this is not known in enum ProvisionedResourceEngine');
  }
}

enum Provisioning {
  customerManaged,
}

extension ProvisioningValueExtension on Provisioning {
  String toValue() {
    switch (this) {
      case Provisioning.customerManaged:
        return 'CUSTOMER_MANAGED';
    }
  }
}

extension ProvisioningFromString on String {
  Provisioning toProvisioning() {
    switch (this) {
      case 'CUSTOMER_MANAGED':
        return Provisioning.customerManaged;
    }
    throw Exception('$this is not known in enum Provisioning');
  }
}

class RejectEnvironmentAccountConnectionOutput {
  /// The environment connection account detail data that's returned by Proton.
  final EnvironmentAccountConnection environmentAccountConnection;

  RejectEnvironmentAccountConnectionOutput({
    required this.environmentAccountConnection,
  });

  factory RejectEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return RejectEnvironmentAccountConnectionOutput(
      environmentAccountConnection: EnvironmentAccountConnection.fromJson(
          json['environmentAccountConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

/// Detailed data of a linked repository—a repository that has been registered
/// with Proton.
class Repository {
  /// The Amazon Resource Name (ARN) of the linked repository.
  final String arn;

  /// The Amazon Resource Name (ARN) of your AWS CodeStar connection that connects
  /// Proton to your repository provider account.
  final String connectionArn;

  /// The repository name.
  final String name;

  /// The repository provider.
  final RepositoryProvider provider;

  /// Your customer Amazon Web Services KMS encryption key.
  final String? encryptionKey;

  Repository({
    required this.arn,
    required this.connectionArn,
    required this.name,
    required this.provider,
    this.encryptionKey,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      arn: json['arn'] as String,
      connectionArn: json['connectionArn'] as String,
      name: json['name'] as String,
      provider: (json['provider'] as String).toRepositoryProvider(),
      encryptionKey: json['encryptionKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectionArn = this.connectionArn;
    final name = this.name;
    final provider = this.provider;
    final encryptionKey = this.encryptionKey;
    return {
      'arn': arn,
      'connectionArn': connectionArn,
      'name': name,
      'provider': provider.toValue(),
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
    };
  }
}

/// Detail data for a linked repository branch.
class RepositoryBranch {
  /// The Amazon Resource Name (ARN) of the linked repository.
  final String arn;

  /// The repository branch.
  final String branch;

  /// The repository name.
  final String name;

  /// The repository provider.
  final RepositoryProvider provider;

  RepositoryBranch({
    required this.arn,
    required this.branch,
    required this.name,
    required this.provider,
  });

  factory RepositoryBranch.fromJson(Map<String, dynamic> json) {
    return RepositoryBranch(
      arn: json['arn'] as String,
      branch: json['branch'] as String,
      name: json['name'] as String,
      provider: (json['provider'] as String).toRepositoryProvider(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final branch = this.branch;
    final name = this.name;
    final provider = this.provider;
    return {
      'arn': arn,
      'branch': branch,
      'name': name,
      'provider': provider.toValue(),
    };
  }
}

/// Detail input data for a linked repository branch.
class RepositoryBranchInput {
  /// The repository branch.
  final String branch;

  /// The repository name.
  final String name;

  /// The repository provider.
  final RepositoryProvider provider;

  RepositoryBranchInput({
    required this.branch,
    required this.name,
    required this.provider,
  });

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final name = this.name;
    final provider = this.provider;
    return {
      'branch': branch,
      'name': name,
      'provider': provider.toValue(),
    };
  }
}

enum RepositoryProvider {
  github,
  githubEnterprise,
  bitbucket,
}

extension RepositoryProviderValueExtension on RepositoryProvider {
  String toValue() {
    switch (this) {
      case RepositoryProvider.github:
        return 'GITHUB';
      case RepositoryProvider.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case RepositoryProvider.bitbucket:
        return 'BITBUCKET';
    }
  }
}

extension RepositoryProviderFromString on String {
  RepositoryProvider toRepositoryProvider() {
    switch (this) {
      case 'GITHUB':
        return RepositoryProvider.github;
      case 'GITHUB_ENTERPRISE':
        return RepositoryProvider.githubEnterprise;
      case 'BITBUCKET':
        return RepositoryProvider.bitbucket;
    }
    throw Exception('$this is not known in enum RepositoryProvider');
  }
}

/// Summary data of a linked repository—a repository that has been registered
/// with Proton.
class RepositorySummary {
  /// The Amazon Resource Name (ARN) of the linked repository.
  final String arn;

  /// The Amazon Resource Name (ARN) of the of your connection that connects
  /// Proton to your repository.
  final String connectionArn;

  /// The repository name.
  final String name;

  /// The repository provider.
  final RepositoryProvider provider;

  RepositorySummary({
    required this.arn,
    required this.connectionArn,
    required this.name,
    required this.provider,
  });

  factory RepositorySummary.fromJson(Map<String, dynamic> json) {
    return RepositorySummary(
      arn: json['arn'] as String,
      connectionArn: json['connectionArn'] as String,
      name: json['name'] as String,
      provider: (json['provider'] as String).toRepositoryProvider(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectionArn = this.connectionArn;
    final name = this.name;
    final provider = this.provider;
    return {
      'arn': arn,
      'connectionArn': connectionArn,
      'name': name,
      'provider': provider.toValue(),
    };
  }
}

/// Detail data for a repository sync attempt activated by a push to a
/// repository.
class RepositorySyncAttempt {
  /// Detail data for sync attempt events.
  final List<RepositorySyncEvent> events;

  /// The time when the sync attempt started.
  final DateTime startedAt;

  /// The sync attempt status.
  final RepositorySyncStatus status;

  RepositorySyncAttempt({
    required this.events,
    required this.startedAt,
    required this.status,
  });

  factory RepositorySyncAttempt.fromJson(Map<String, dynamic> json) {
    return RepositorySyncAttempt(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => RepositorySyncEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      status: (json['status'] as String).toRepositorySyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      'events': events,
      'startedAt': unixTimestampToJson(startedAt),
      'status': status.toValue(),
    };
  }
}

/// A repository sync definition.
class RepositorySyncDefinition {
  /// The repository branch.
  final String branch;

  /// The directory in the repository.
  final String directory;

  /// The resource that is synced from.
  final String parent;

  /// The resource that is synced to.
  final String target;

  RepositorySyncDefinition({
    required this.branch,
    required this.directory,
    required this.parent,
    required this.target,
  });

  factory RepositorySyncDefinition.fromJson(Map<String, dynamic> json) {
    return RepositorySyncDefinition(
      branch: json['branch'] as String,
      directory: json['directory'] as String,
      parent: json['parent'] as String,
      target: json['target'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final directory = this.directory;
    final parent = this.parent;
    final target = this.target;
    return {
      'branch': branch,
      'directory': directory,
      'parent': parent,
      'target': target,
    };
  }
}

/// Repository sync event detail data for a sync attempt.
class RepositorySyncEvent {
  /// Event detail for a repository sync attempt.
  final String event;

  /// The time that the sync event occurred.
  final DateTime time;

  /// The type of event.
  final String type;

  /// The external ID of the sync event.
  final String? externalId;

  RepositorySyncEvent({
    required this.event,
    required this.time,
    required this.type,
    this.externalId,
  });

  factory RepositorySyncEvent.fromJson(Map<String, dynamic> json) {
    return RepositorySyncEvent(
      event: json['event'] as String,
      time: nonNullableTimeStampFromJson(json['time'] as Object),
      type: json['type'] as String,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final time = this.time;
    final type = this.type;
    final externalId = this.externalId;
    return {
      'event': event,
      'time': unixTimestampToJson(time),
      'type': type,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

enum RepositorySyncStatus {
  initiated,
  inProgress,
  succeeded,
  failed,
  queued,
}

extension RepositorySyncStatusValueExtension on RepositorySyncStatus {
  String toValue() {
    switch (this) {
      case RepositorySyncStatus.initiated:
        return 'INITIATED';
      case RepositorySyncStatus.inProgress:
        return 'IN_PROGRESS';
      case RepositorySyncStatus.succeeded:
        return 'SUCCEEDED';
      case RepositorySyncStatus.failed:
        return 'FAILED';
      case RepositorySyncStatus.queued:
        return 'QUEUED';
    }
  }
}

extension RepositorySyncStatusFromString on String {
  RepositorySyncStatus toRepositorySyncStatus() {
    switch (this) {
      case 'INITIATED':
        return RepositorySyncStatus.initiated;
      case 'IN_PROGRESS':
        return RepositorySyncStatus.inProgress;
      case 'SUCCEEDED':
        return RepositorySyncStatus.succeeded;
      case 'FAILED':
        return RepositorySyncStatus.failed;
      case 'QUEUED':
        return RepositorySyncStatus.queued;
    }
    throw Exception('$this is not known in enum RepositorySyncStatus');
  }
}

/// Summary counts of each Proton resource types.
class ResourceCountsSummary {
  /// The total number of resources of this type in the Amazon Web Services
  /// account.
  final int total;

  /// The number of resources of this type in the Amazon Web Services account that
  /// need a major template version update.
  final int? behindMajor;

  /// The number of resources of this type in the Amazon Web Services account that
  /// need a minor template version update.
  final int? behindMinor;

  /// The number of resources of this type in the Amazon Web Services account that
  /// failed to deploy.
  final int? failed;

  /// The number of resources of this type in the Amazon Web Services account that
  /// are up-to-date with their template.
  final int? upToDate;

  ResourceCountsSummary({
    required this.total,
    this.behindMajor,
    this.behindMinor,
    this.failed,
    this.upToDate,
  });

  factory ResourceCountsSummary.fromJson(Map<String, dynamic> json) {
    return ResourceCountsSummary(
      total: json['total'] as int,
      behindMajor: json['behindMajor'] as int?,
      behindMinor: json['behindMinor'] as int?,
      failed: json['failed'] as int?,
      upToDate: json['upToDate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final total = this.total;
    final behindMajor = this.behindMajor;
    final behindMinor = this.behindMinor;
    final failed = this.failed;
    final upToDate = this.upToDate;
    return {
      'total': total,
      if (behindMajor != null) 'behindMajor': behindMajor,
      if (behindMinor != null) 'behindMinor': behindMinor,
      if (failed != null) 'failed': failed,
      if (upToDate != null) 'upToDate': upToDate,
    };
  }
}

/// The state that a PR-based deployment can be updated to.
enum ResourceDeploymentStatus {
  inProgress,
  failed,
  succeeded,
}

extension ResourceDeploymentStatusValueExtension on ResourceDeploymentStatus {
  String toValue() {
    switch (this) {
      case ResourceDeploymentStatus.inProgress:
        return 'IN_PROGRESS';
      case ResourceDeploymentStatus.failed:
        return 'FAILED';
      case ResourceDeploymentStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ResourceDeploymentStatusFromString on String {
  ResourceDeploymentStatus toResourceDeploymentStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ResourceDeploymentStatus.inProgress;
      case 'FAILED':
        return ResourceDeploymentStatus.failed;
      case 'SUCCEEDED':
        return ResourceDeploymentStatus.succeeded;
    }
    throw Exception('$this is not known in enum ResourceDeploymentStatus');
  }
}

/// Detail data for a resource sync attempt activated by a push to a repository.
class ResourceSyncAttempt {
  /// An array of events with detail data.
  final List<ResourceSyncEvent> events;

  /// Detail data for the initial repository commit, path and push.
  final Revision initialRevision;

  /// The time when the sync attempt started.
  final DateTime startedAt;

  /// The status of the sync attempt.
  final ResourceSyncStatus status;

  /// The resource that is synced to.
  final String target;

  /// Detail data for the target revision.
  final Revision targetRevision;

  ResourceSyncAttempt({
    required this.events,
    required this.initialRevision,
    required this.startedAt,
    required this.status,
    required this.target,
    required this.targetRevision,
  });

  factory ResourceSyncAttempt.fromJson(Map<String, dynamic> json) {
    return ResourceSyncAttempt(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => ResourceSyncEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialRevision:
          Revision.fromJson(json['initialRevision'] as Map<String, dynamic>),
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      status: (json['status'] as String).toResourceSyncStatus(),
      target: json['target'] as String,
      targetRevision:
          Revision.fromJson(json['targetRevision'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final initialRevision = this.initialRevision;
    final startedAt = this.startedAt;
    final status = this.status;
    final target = this.target;
    final targetRevision = this.targetRevision;
    return {
      'events': events,
      'initialRevision': initialRevision,
      'startedAt': unixTimestampToJson(startedAt),
      'status': status.toValue(),
      'target': target,
      'targetRevision': targetRevision,
    };
  }
}

/// Detail data for a resource sync event.
class ResourceSyncEvent {
  /// A resource sync event.
  final String event;

  /// The time when the event occurred.
  final DateTime time;

  /// The type of event.
  final String type;

  /// The external ID for the event.
  final String? externalId;

  ResourceSyncEvent({
    required this.event,
    required this.time,
    required this.type,
    this.externalId,
  });

  factory ResourceSyncEvent.fromJson(Map<String, dynamic> json) {
    return ResourceSyncEvent(
      event: json['event'] as String,
      time: nonNullableTimeStampFromJson(json['time'] as Object),
      type: json['type'] as String,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final time = this.time;
    final type = this.type;
    final externalId = this.externalId;
    return {
      'event': event,
      'time': unixTimestampToJson(time),
      'type': type,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

enum ResourceSyncStatus {
  initiated,
  inProgress,
  succeeded,
  failed,
}

extension ResourceSyncStatusValueExtension on ResourceSyncStatus {
  String toValue() {
    switch (this) {
      case ResourceSyncStatus.initiated:
        return 'INITIATED';
      case ResourceSyncStatus.inProgress:
        return 'IN_PROGRESS';
      case ResourceSyncStatus.succeeded:
        return 'SUCCEEDED';
      case ResourceSyncStatus.failed:
        return 'FAILED';
    }
  }
}

extension ResourceSyncStatusFromString on String {
  ResourceSyncStatus toResourceSyncStatus() {
    switch (this) {
      case 'INITIATED':
        return ResourceSyncStatus.initiated;
      case 'IN_PROGRESS':
        return ResourceSyncStatus.inProgress;
      case 'SUCCEEDED':
        return ResourceSyncStatus.succeeded;
      case 'FAILED':
        return ResourceSyncStatus.failed;
    }
    throw Exception('$this is not known in enum ResourceSyncStatus');
  }
}

/// Revision detail data for a commit and push that activates a sync attempt
class Revision {
  /// The repository branch.
  final String branch;

  /// The repository directory changed by a commit and push that activated the
  /// sync attempt.
  final String directory;

  /// The repository name.
  final String repositoryName;

  /// The repository provider.
  final RepositoryProvider repositoryProvider;

  /// The secure hash algorithm (SHA) hash for the revision.
  final String sha;

  Revision({
    required this.branch,
    required this.directory,
    required this.repositoryName,
    required this.repositoryProvider,
    required this.sha,
  });

  factory Revision.fromJson(Map<String, dynamic> json) {
    return Revision(
      branch: json['branch'] as String,
      directory: json['directory'] as String,
      repositoryName: json['repositoryName'] as String,
      repositoryProvider:
          (json['repositoryProvider'] as String).toRepositoryProvider(),
      sha: json['sha'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final directory = this.directory;
    final repositoryName = this.repositoryName;
    final repositoryProvider = this.repositoryProvider;
    final sha = this.sha;
    return {
      'branch': branch,
      'directory': directory,
      'repositoryName': repositoryName,
      'repositoryProvider': repositoryProvider.toValue(),
      'sha': sha,
    };
  }
}

/// Template bundle S3 bucket data.
class S3ObjectSource {
  /// The name of the S3 bucket that contains a template bundle.
  final String bucket;

  /// The path to the S3 bucket that contains a template bundle.
  final String key;

  S3ObjectSource({
    required this.bucket,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'bucket': bucket,
      'key': key,
    };
  }
}

/// Detailed data of an Proton service resource.
class Service {
  /// The Amazon Resource Name (ARN) of the service.
  final String arn;

  /// The time when the service was created.
  final DateTime createdAt;

  /// The time when the service was last modified.
  final DateTime lastModifiedAt;

  /// The name of the service.
  final String name;

  /// The formatted specification that defines the service.
  final String spec;

  /// The status of the service.
  final ServiceStatus status;

  /// The name of the service template.
  final String templateName;

  /// The name of the code repository branch that holds the code that's deployed
  /// in Proton.
  final String? branchName;

  /// A description of the service.
  final String? description;

  /// The service pipeline detail data.
  final ServicePipeline? pipeline;

  /// The Amazon Resource Name (ARN) of the repository connection. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol">Setting
  /// up an AWS CodeStar connection</a> in the <i>Proton User Guide</i>.
  final String? repositoryConnectionArn;

  /// The ID of the source code repository.
  final String? repositoryId;

  /// A service status message.
  final String? statusMessage;

  Service({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    required this.spec,
    required this.status,
    required this.templateName,
    this.branchName,
    this.description,
    this.pipeline,
    this.repositoryConnectionArn,
    this.repositoryId,
    this.statusMessage,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      spec: json['spec'] as String,
      status: (json['status'] as String).toServiceStatus(),
      templateName: json['templateName'] as String,
      branchName: json['branchName'] as String?,
      description: json['description'] as String?,
      pipeline: json['pipeline'] != null
          ? ServicePipeline.fromJson(json['pipeline'] as Map<String, dynamic>)
          : null,
      repositoryConnectionArn: json['repositoryConnectionArn'] as String?,
      repositoryId: json['repositoryId'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final spec = this.spec;
    final status = this.status;
    final templateName = this.templateName;
    final branchName = this.branchName;
    final description = this.description;
    final pipeline = this.pipeline;
    final repositoryConnectionArn = this.repositoryConnectionArn;
    final repositoryId = this.repositoryId;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      'spec': spec,
      'status': status.toValue(),
      'templateName': templateName,
      if (branchName != null) 'branchName': branchName,
      if (description != null) 'description': description,
      if (pipeline != null) 'pipeline': pipeline,
      if (repositoryConnectionArn != null)
        'repositoryConnectionArn': repositoryConnectionArn,
      if (repositoryId != null) 'repositoryId': repositoryId,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Detailed data of an Proton service instance resource.
class ServiceInstance {
  /// The Amazon Resource Name (ARN) of the service instance.
  final String arn;

  /// The time when the service instance was created.
  final DateTime createdAt;

  /// The service instance deployment status.
  final DeploymentStatus deploymentStatus;

  /// The name of the environment that the service instance was deployed into.
  final String environmentName;

  /// The time when a deployment of the service instance was last attempted.
  final DateTime lastDeploymentAttemptedAt;

  /// The time when the service instance was last deployed successfully.
  final DateTime lastDeploymentSucceededAt;

  /// The name of the service instance.
  final String name;

  /// The name of the service that the service instance belongs to.
  final String serviceName;

  /// The major version of the service template that was used to create the
  /// service instance.
  final String templateMajorVersion;

  /// The minor version of the service template that was used to create the
  /// service instance.
  final String templateMinorVersion;

  /// The name of the service template that was used to create the service
  /// instance.
  final String templateName;

  /// The message associated with the service instance deployment status.
  final String? deploymentStatusMessage;

  /// The ID of the last attempted deployment of this service instance.
  final String? lastAttemptedDeploymentId;

  /// The last client request token received.
  final String? lastClientRequestToken;

  /// The ID of the last successful deployment of this service instance.
  final String? lastSucceededDeploymentId;

  /// The service spec that was used to create the service instance.
  final String? spec;

  ServiceInstance({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.lastDeploymentAttemptedAt,
    required this.lastDeploymentSucceededAt,
    required this.name,
    required this.serviceName,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.deploymentStatusMessage,
    this.lastAttemptedDeploymentId,
    this.lastClientRequestToken,
    this.lastSucceededDeploymentId,
    this.spec,
  });

  factory ServiceInstance.fromJson(Map<String, dynamic> json) {
    return ServiceInstance(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      lastDeploymentAttemptedAt: nonNullableTimeStampFromJson(
          json['lastDeploymentAttemptedAt'] as Object),
      lastDeploymentSucceededAt: nonNullableTimeStampFromJson(
          json['lastDeploymentSucceededAt'] as Object),
      name: json['name'] as String,
      serviceName: json['serviceName'] as String,
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastClientRequestToken: json['lastClientRequestToken'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final name = this.name;
    final serviceName = this.serviceName;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastClientRequestToken = this.lastClientRequestToken;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final spec = this.spec;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'lastDeploymentAttemptedAt':
          unixTimestampToJson(lastDeploymentAttemptedAt),
      'lastDeploymentSucceededAt':
          unixTimestampToJson(lastDeploymentSucceededAt),
      'name': name,
      'serviceName': serviceName,
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastClientRequestToken != null)
        'lastClientRequestToken': lastClientRequestToken,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (spec != null) 'spec': spec,
    };
  }
}

/// The detailed data about the current state of this service instance.
class ServiceInstanceState {
  /// The service spec that was used to create the service instance.
  final String spec;

  /// The major version of the service template that was used to create the
  /// service pipeline.
  final String templateMajorVersion;

  /// The minor version of the service template that was used to create the
  /// service pipeline.
  final String templateMinorVersion;

  /// The name of the service template that was used to create the service
  /// instance.
  final String templateName;

  /// The IDs for the last successful components deployed for this service
  /// instance.
  final List<String>? lastSuccessfulComponentDeploymentIds;

  /// The ID for the last successful environment deployed for this service
  /// instance.
  final String? lastSuccessfulEnvironmentDeploymentId;

  /// The ID for the last successful service pipeline deployed for this service
  /// instance.
  final String? lastSuccessfulServicePipelineDeploymentId;

  ServiceInstanceState({
    required this.spec,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.lastSuccessfulComponentDeploymentIds,
    this.lastSuccessfulEnvironmentDeploymentId,
    this.lastSuccessfulServicePipelineDeploymentId,
  });

  factory ServiceInstanceState.fromJson(Map<String, dynamic> json) {
    return ServiceInstanceState(
      spec: json['spec'] as String,
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      lastSuccessfulComponentDeploymentIds:
          (json['lastSuccessfulComponentDeploymentIds'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      lastSuccessfulEnvironmentDeploymentId:
          json['lastSuccessfulEnvironmentDeploymentId'] as String?,
      lastSuccessfulServicePipelineDeploymentId:
          json['lastSuccessfulServicePipelineDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final spec = this.spec;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final lastSuccessfulComponentDeploymentIds =
        this.lastSuccessfulComponentDeploymentIds;
    final lastSuccessfulEnvironmentDeploymentId =
        this.lastSuccessfulEnvironmentDeploymentId;
    final lastSuccessfulServicePipelineDeploymentId =
        this.lastSuccessfulServicePipelineDeploymentId;
    return {
      'spec': spec,
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (lastSuccessfulComponentDeploymentIds != null)
        'lastSuccessfulComponentDeploymentIds':
            lastSuccessfulComponentDeploymentIds,
      if (lastSuccessfulEnvironmentDeploymentId != null)
        'lastSuccessfulEnvironmentDeploymentId':
            lastSuccessfulEnvironmentDeploymentId,
      if (lastSuccessfulServicePipelineDeploymentId != null)
        'lastSuccessfulServicePipelineDeploymentId':
            lastSuccessfulServicePipelineDeploymentId,
    };
  }
}

/// Summary data of an Proton service instance resource.
class ServiceInstanceSummary {
  /// The Amazon Resource Name (ARN) of the service instance.
  final String arn;

  /// The time when the service instance was created.
  final DateTime createdAt;

  /// The service instance deployment status.
  final DeploymentStatus deploymentStatus;

  /// The name of the environment that the service instance was deployed into.
  final String environmentName;

  /// The time when a deployment of the service was last attempted.
  final DateTime lastDeploymentAttemptedAt;

  /// The time when the service was last deployed successfully.
  final DateTime lastDeploymentSucceededAt;

  /// The name of the service instance.
  final String name;

  /// The name of the service that the service instance belongs to.
  final String serviceName;

  /// The service instance template major version.
  final String templateMajorVersion;

  /// The service instance template minor version.
  final String templateMinorVersion;

  /// The name of the service template.
  final String templateName;

  /// A service instance deployment status message.
  final String? deploymentStatusMessage;

  /// The ID of the last attempted deployment of this service instance.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment of this service instance.
  final String? lastSucceededDeploymentId;

  ServiceInstanceSummary({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.environmentName,
    required this.lastDeploymentAttemptedAt,
    required this.lastDeploymentSucceededAt,
    required this.name,
    required this.serviceName,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.deploymentStatusMessage,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
  });

  factory ServiceInstanceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceInstanceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      environmentName: json['environmentName'] as String,
      lastDeploymentAttemptedAt: nonNullableTimeStampFromJson(
          json['lastDeploymentAttemptedAt'] as Object),
      lastDeploymentSucceededAt: nonNullableTimeStampFromJson(
          json['lastDeploymentSucceededAt'] as Object),
      name: json['name'] as String,
      serviceName: json['serviceName'] as String,
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final environmentName = this.environmentName;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final name = this.name;
    final serviceName = this.serviceName;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'environmentName': environmentName,
      'lastDeploymentAttemptedAt':
          unixTimestampToJson(lastDeploymentAttemptedAt),
      'lastDeploymentSucceededAt':
          unixTimestampToJson(lastDeploymentSucceededAt),
      'name': name,
      'serviceName': serviceName,
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
    };
  }
}

/// Detailed data of an Proton service instance pipeline resource.
class ServicePipeline {
  /// The Amazon Resource Name (ARN) of the service pipeline.
  final String arn;

  /// The time when the service pipeline was created.
  final DateTime createdAt;

  /// The deployment status of the service pipeline.
  final DeploymentStatus deploymentStatus;

  /// The time when a deployment of the service pipeline was last attempted.
  final DateTime lastDeploymentAttemptedAt;

  /// The time when the service pipeline was last deployed successfully.
  final DateTime lastDeploymentSucceededAt;

  /// The major version of the service template that was used to create the
  /// service pipeline.
  final String templateMajorVersion;

  /// The minor version of the service template that was used to create the
  /// service pipeline.
  final String templateMinorVersion;

  /// The name of the service template that was used to create the service
  /// pipeline.
  final String templateName;

  /// A service pipeline deployment status message.
  final String? deploymentStatusMessage;

  /// The ID of the last attempted deployment of this service pipeline.
  final String? lastAttemptedDeploymentId;

  /// The ID of the last successful deployment of this service pipeline.
  final String? lastSucceededDeploymentId;

  /// The service spec that was used to create the service pipeline.
  final String? spec;

  ServicePipeline({
    required this.arn,
    required this.createdAt,
    required this.deploymentStatus,
    required this.lastDeploymentAttemptedAt,
    required this.lastDeploymentSucceededAt,
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.deploymentStatusMessage,
    this.lastAttemptedDeploymentId,
    this.lastSucceededDeploymentId,
    this.spec,
  });

  factory ServicePipeline.fromJson(Map<String, dynamic> json) {
    return ServicePipeline(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deploymentStatus:
          (json['deploymentStatus'] as String).toDeploymentStatus(),
      lastDeploymentAttemptedAt: nonNullableTimeStampFromJson(
          json['lastDeploymentAttemptedAt'] as Object),
      lastDeploymentSucceededAt: nonNullableTimeStampFromJson(
          json['lastDeploymentSucceededAt'] as Object),
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      lastAttemptedDeploymentId: json['lastAttemptedDeploymentId'] as String?,
      lastSucceededDeploymentId: json['lastSucceededDeploymentId'] as String?,
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentStatus = this.deploymentStatus;
    final lastDeploymentAttemptedAt = this.lastDeploymentAttemptedAt;
    final lastDeploymentSucceededAt = this.lastDeploymentSucceededAt;
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final lastAttemptedDeploymentId = this.lastAttemptedDeploymentId;
    final lastSucceededDeploymentId = this.lastSucceededDeploymentId;
    final spec = this.spec;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'deploymentStatus': deploymentStatus.toValue(),
      'lastDeploymentAttemptedAt':
          unixTimestampToJson(lastDeploymentAttemptedAt),
      'lastDeploymentSucceededAt':
          unixTimestampToJson(lastDeploymentSucceededAt),
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (lastAttemptedDeploymentId != null)
        'lastAttemptedDeploymentId': lastAttemptedDeploymentId,
      if (lastSucceededDeploymentId != null)
        'lastSucceededDeploymentId': lastSucceededDeploymentId,
      if (spec != null) 'spec': spec,
    };
  }
}

/// The detailed data about the current state of the service pipeline.
class ServicePipelineState {
  /// The major version of the service template that was used to create the
  /// service pipeline.
  final String templateMajorVersion;

  /// The minor version of the service template that was used to create the
  /// service pipeline.
  final String templateMinorVersion;

  /// The name of the service template that was used to create the service
  /// pipeline.
  final String templateName;

  /// The service spec that was used to create the service pipeline.
  final String? spec;

  ServicePipelineState({
    required this.templateMajorVersion,
    required this.templateMinorVersion,
    required this.templateName,
    this.spec,
  });

  factory ServicePipelineState.fromJson(Map<String, dynamic> json) {
    return ServicePipelineState(
      templateMajorVersion: json['templateMajorVersion'] as String,
      templateMinorVersion: json['templateMinorVersion'] as String,
      templateName: json['templateName'] as String,
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateMajorVersion = this.templateMajorVersion;
    final templateMinorVersion = this.templateMinorVersion;
    final templateName = this.templateName;
    final spec = this.spec;
    return {
      'templateMajorVersion': templateMajorVersion,
      'templateMinorVersion': templateMinorVersion,
      'templateName': templateName,
      if (spec != null) 'spec': spec,
    };
  }
}

enum ServiceStatus {
  createInProgress,
  createFailedCleanupInProgress,
  createFailedCleanupComplete,
  createFailedCleanupFailed,
  createFailed,
  active,
  deleteInProgress,
  deleteFailed,
  updateInProgress,
  updateFailedCleanupInProgress,
  updateFailedCleanupComplete,
  updateFailedCleanupFailed,
  updateFailed,
  updateCompleteCleanupFailed,
}

extension ServiceStatusValueExtension on ServiceStatus {
  String toValue() {
    switch (this) {
      case ServiceStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ServiceStatus.createFailedCleanupInProgress:
        return 'CREATE_FAILED_CLEANUP_IN_PROGRESS';
      case ServiceStatus.createFailedCleanupComplete:
        return 'CREATE_FAILED_CLEANUP_COMPLETE';
      case ServiceStatus.createFailedCleanupFailed:
        return 'CREATE_FAILED_CLEANUP_FAILED';
      case ServiceStatus.createFailed:
        return 'CREATE_FAILED';
      case ServiceStatus.active:
        return 'ACTIVE';
      case ServiceStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ServiceStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ServiceStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ServiceStatus.updateFailedCleanupInProgress:
        return 'UPDATE_FAILED_CLEANUP_IN_PROGRESS';
      case ServiceStatus.updateFailedCleanupComplete:
        return 'UPDATE_FAILED_CLEANUP_COMPLETE';
      case ServiceStatus.updateFailedCleanupFailed:
        return 'UPDATE_FAILED_CLEANUP_FAILED';
      case ServiceStatus.updateFailed:
        return 'UPDATE_FAILED';
      case ServiceStatus.updateCompleteCleanupFailed:
        return 'UPDATE_COMPLETE_CLEANUP_FAILED';
    }
  }
}

extension ServiceStatusFromString on String {
  ServiceStatus toServiceStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ServiceStatus.createInProgress;
      case 'CREATE_FAILED_CLEANUP_IN_PROGRESS':
        return ServiceStatus.createFailedCleanupInProgress;
      case 'CREATE_FAILED_CLEANUP_COMPLETE':
        return ServiceStatus.createFailedCleanupComplete;
      case 'CREATE_FAILED_CLEANUP_FAILED':
        return ServiceStatus.createFailedCleanupFailed;
      case 'CREATE_FAILED':
        return ServiceStatus.createFailed;
      case 'ACTIVE':
        return ServiceStatus.active;
      case 'DELETE_IN_PROGRESS':
        return ServiceStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return ServiceStatus.deleteFailed;
      case 'UPDATE_IN_PROGRESS':
        return ServiceStatus.updateInProgress;
      case 'UPDATE_FAILED_CLEANUP_IN_PROGRESS':
        return ServiceStatus.updateFailedCleanupInProgress;
      case 'UPDATE_FAILED_CLEANUP_COMPLETE':
        return ServiceStatus.updateFailedCleanupComplete;
      case 'UPDATE_FAILED_CLEANUP_FAILED':
        return ServiceStatus.updateFailedCleanupFailed;
      case 'UPDATE_FAILED':
        return ServiceStatus.updateFailed;
      case 'UPDATE_COMPLETE_CLEANUP_FAILED':
        return ServiceStatus.updateCompleteCleanupFailed;
    }
    throw Exception('$this is not known in enum ServiceStatus');
  }
}

/// Summary data of an Proton service resource.
class ServiceSummary {
  /// The Amazon Resource Name (ARN) of the service.
  final String arn;

  /// The time when the service was created.
  final DateTime createdAt;

  /// The time when the service was last modified.
  final DateTime lastModifiedAt;

  /// The name of the service.
  final String name;

  /// The status of the service.
  final ServiceStatus status;

  /// The name of the service template.
  final String templateName;

  /// A description of the service.
  final String? description;

  /// A service status message.
  final String? statusMessage;

  ServiceSummary({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    required this.status,
    required this.templateName,
    this.description,
    this.statusMessage,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toServiceStatus(),
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final status = this.status;
    final templateName = this.templateName;
    final description = this.description;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      'status': status.toValue(),
      'templateName': templateName,
      if (description != null) 'description': description,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// If a service instance is manually updated, Proton wants to prevent
/// accidentally overriding a manual change.
///
/// A blocker is created because of the manual update or deletion of a service
/// instance. The summary describes the blocker as being active or resolved.
class ServiceSyncBlockerSummary {
  /// The name of the service that you want to get the sync blocker summary for.
  /// If given a service instance name and a service name, it will return the
  /// blockers only applying to the instance that is blocked.
  ///
  /// If given only a service name, it will return the blockers that apply to all
  /// of the instances. In order to get the blockers for a single instance, you
  /// will need to make two distinct calls, one to get the sync blocker summary
  /// for the service and the other to get the sync blocker for the service
  /// instance.
  final String serviceName;

  /// The latest active blockers for the synced service.
  final List<SyncBlocker>? latestBlockers;

  /// The name of the service instance that you want sync your service
  /// configuration with.
  final String? serviceInstanceName;

  ServiceSyncBlockerSummary({
    required this.serviceName,
    this.latestBlockers,
    this.serviceInstanceName,
  });

  factory ServiceSyncBlockerSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSyncBlockerSummary(
      serviceName: json['serviceName'] as String,
      latestBlockers: (json['latestBlockers'] as List?)
          ?.whereNotNull()
          .map((e) => SyncBlocker.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceInstanceName: json['serviceInstanceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final latestBlockers = this.latestBlockers;
    final serviceInstanceName = this.serviceInstanceName;
    return {
      'serviceName': serviceName,
      if (latestBlockers != null) 'latestBlockers': latestBlockers,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
    };
  }
}

/// Detailed data of the service sync configuration.
class ServiceSyncConfig {
  /// The name of the code repository branch that holds the service code Proton
  /// will sync with.
  final String branch;

  /// The file path to the service sync configuration file.
  final String filePath;

  /// The name of the code repository that holds the service code Proton will sync
  /// with.
  final String repositoryName;

  /// The name of the repository provider that holds the repository Proton will
  /// sync with.
  final RepositoryProvider repositoryProvider;

  /// The name of the service that the service instance is added to.
  final String serviceName;

  ServiceSyncConfig({
    required this.branch,
    required this.filePath,
    required this.repositoryName,
    required this.repositoryProvider,
    required this.serviceName,
  });

  factory ServiceSyncConfig.fromJson(Map<String, dynamic> json) {
    return ServiceSyncConfig(
      branch: json['branch'] as String,
      filePath: json['filePath'] as String,
      repositoryName: json['repositoryName'] as String,
      repositoryProvider:
          (json['repositoryProvider'] as String).toRepositoryProvider(),
      serviceName: json['serviceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final filePath = this.filePath;
    final repositoryName = this.repositoryName;
    final repositoryProvider = this.repositoryProvider;
    final serviceName = this.serviceName;
    return {
      'branch': branch,
      'filePath': filePath,
      'repositoryName': repositoryName,
      'repositoryProvider': repositoryProvider.toValue(),
      'serviceName': serviceName,
    };
  }
}

/// Detailed data of an Proton service template resource.
class ServiceTemplate {
  /// The Amazon Resource Name (ARN) of the service template.
  final String arn;

  /// The time when the service template was created.
  final DateTime createdAt;

  /// The time when the service template was last modified.
  final DateTime lastModifiedAt;

  /// The name of the service template.
  final String name;

  /// A description of the service template.
  final String? description;

  /// The service template name as displayed in the developer interface.
  final String? displayName;

  /// The customer provided service template encryption key that's used to encrypt
  /// data.
  final String? encryptionKey;

  /// If <code>pipelineProvisioning</code> is <code>true</code>, a service
  /// pipeline is included in the service template. Otherwise, a service pipeline
  /// <i>isn't</i> included in the service template.
  final Provisioning? pipelineProvisioning;

  /// The recommended version of the service template.
  final String? recommendedVersion;

  ServiceTemplate({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    this.description,
    this.displayName,
    this.encryptionKey,
    this.pipelineProvisioning,
    this.recommendedVersion,
  });

  factory ServiceTemplate.fromJson(Map<String, dynamic> json) {
    return ServiceTemplate(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      encryptionKey: json['encryptionKey'] as String?,
      pipelineProvisioning:
          (json['pipelineProvisioning'] as String?)?.toProvisioning(),
      recommendedVersion: json['recommendedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final encryptionKey = this.encryptionKey;
    final pipelineProvisioning = this.pipelineProvisioning;
    final recommendedVersion = this.recommendedVersion;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (pipelineProvisioning != null)
        'pipelineProvisioning': pipelineProvisioning.toValue(),
      if (recommendedVersion != null) 'recommendedVersion': recommendedVersion,
    };
  }
}

/// Summary data of an Proton service template resource.
class ServiceTemplateSummary {
  /// The Amazon Resource Name (ARN) of the service template.
  final String arn;

  /// The time when the service template was created.
  final DateTime createdAt;

  /// The time when the service template was last modified.
  final DateTime lastModifiedAt;

  /// The name of the service template.
  final String name;

  /// A description of the service template.
  final String? description;

  /// The service template name as displayed in the developer interface.
  final String? displayName;

  /// If <code>pipelineProvisioning</code> is <code>true</code>, a service
  /// pipeline is included in the service template, otherwise a service pipeline
  /// <i>isn't</i> included in the service template.
  final Provisioning? pipelineProvisioning;

  /// The recommended version of the service template.
  final String? recommendedVersion;

  ServiceTemplateSummary({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.name,
    this.description,
    this.displayName,
    this.pipelineProvisioning,
    this.recommendedVersion,
  });

  factory ServiceTemplateSummary.fromJson(Map<String, dynamic> json) {
    return ServiceTemplateSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      pipelineProvisioning:
          (json['pipelineProvisioning'] as String?)?.toProvisioning(),
      recommendedVersion: json['recommendedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final pipelineProvisioning = this.pipelineProvisioning;
    final recommendedVersion = this.recommendedVersion;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (pipelineProvisioning != null)
        'pipelineProvisioning': pipelineProvisioning.toValue(),
      if (recommendedVersion != null) 'recommendedVersion': recommendedVersion,
    };
  }
}

enum ServiceTemplateSupportedComponentSourceType {
  directlyDefined,
}

extension ServiceTemplateSupportedComponentSourceTypeValueExtension
    on ServiceTemplateSupportedComponentSourceType {
  String toValue() {
    switch (this) {
      case ServiceTemplateSupportedComponentSourceType.directlyDefined:
        return 'DIRECTLY_DEFINED';
    }
  }
}

extension ServiceTemplateSupportedComponentSourceTypeFromString on String {
  ServiceTemplateSupportedComponentSourceType
      toServiceTemplateSupportedComponentSourceType() {
    switch (this) {
      case 'DIRECTLY_DEFINED':
        return ServiceTemplateSupportedComponentSourceType.directlyDefined;
    }
    throw Exception(
        '$this is not known in enum ServiceTemplateSupportedComponentSourceType');
  }
}

/// Detailed data of an Proton service template version resource.
class ServiceTemplateVersion {
  /// The Amazon Resource Name (ARN) of the version of a service template.
  final String arn;

  /// An array of compatible environment template names for the major version of a
  /// service template.
  final List<CompatibleEnvironmentTemplate> compatibleEnvironmentTemplates;

  /// The time when the version of a service template was created.
  final DateTime createdAt;

  /// The time when the version of a service template was last modified.
  final DateTime lastModifiedAt;

  /// The latest major version that's associated with the version of a service
  /// template.
  final String majorVersion;

  /// The minor version of a service template.
  final String minorVersion;

  /// The service template version status.
  final TemplateVersionStatus status;

  /// The name of the version of a service template.
  final String templateName;

  /// A description of the version of a service template.
  final String? description;

  /// The recommended minor version of the service template.
  final String? recommendedMinorVersion;

  /// The schema of the version of a service template.
  final String? schema;

  /// A service template version status message.
  final String? statusMessage;

  /// An array of supported component sources. Components with supported sources
  /// can be attached to service instances based on this service template version.
  ///
  /// For more information about components, see <a
  /// href="https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html">Proton
  /// components</a> in the <i>Proton User Guide</i>.
  final List<ServiceTemplateSupportedComponentSourceType>?
      supportedComponentSources;

  ServiceTemplateVersion({
    required this.arn,
    required this.compatibleEnvironmentTemplates,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.majorVersion,
    required this.minorVersion,
    required this.status,
    required this.templateName,
    this.description,
    this.recommendedMinorVersion,
    this.schema,
    this.statusMessage,
    this.supportedComponentSources,
  });

  factory ServiceTemplateVersion.fromJson(Map<String, dynamic> json) {
    return ServiceTemplateVersion(
      arn: json['arn'] as String,
      compatibleEnvironmentTemplates: (json['compatibleEnvironmentTemplates']
              as List)
          .whereNotNull()
          .map((e) =>
              CompatibleEnvironmentTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      majorVersion: json['majorVersion'] as String,
      minorVersion: json['minorVersion'] as String,
      status: (json['status'] as String).toTemplateVersionStatus(),
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      recommendedMinorVersion: json['recommendedMinorVersion'] as String?,
      schema: json['schema'] as String?,
      statusMessage: json['statusMessage'] as String?,
      supportedComponentSources: (json['supportedComponentSources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as String).toServiceTemplateSupportedComponentSourceType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final compatibleEnvironmentTemplates = this.compatibleEnvironmentTemplates;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final majorVersion = this.majorVersion;
    final minorVersion = this.minorVersion;
    final status = this.status;
    final templateName = this.templateName;
    final description = this.description;
    final recommendedMinorVersion = this.recommendedMinorVersion;
    final schema = this.schema;
    final statusMessage = this.statusMessage;
    final supportedComponentSources = this.supportedComponentSources;
    return {
      'arn': arn,
      'compatibleEnvironmentTemplates': compatibleEnvironmentTemplates,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'majorVersion': majorVersion,
      'minorVersion': minorVersion,
      'status': status.toValue(),
      'templateName': templateName,
      if (description != null) 'description': description,
      if (recommendedMinorVersion != null)
        'recommendedMinorVersion': recommendedMinorVersion,
      if (schema != null) 'schema': schema,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (supportedComponentSources != null)
        'supportedComponentSources':
            supportedComponentSources.map((e) => e.toValue()).toList(),
    };
  }
}

/// Summary data of an Proton service template version resource.
class ServiceTemplateVersionSummary {
  /// The Amazon Resource Name (ARN) of the version of a service template.
  final String arn;

  /// The time when the version of a service template was created.
  final DateTime createdAt;

  /// The time when the version of a service template was last modified.
  final DateTime lastModifiedAt;

  /// The latest major version that's associated with the version of a service
  /// template.
  final String majorVersion;

  /// The minor version of a service template.
  final String minorVersion;

  /// The service template minor version status.
  final TemplateVersionStatus status;

  /// The name of the service template.
  final String templateName;

  /// A description of the version of a service template.
  final String? description;

  /// The recommended minor version of the service template.
  final String? recommendedMinorVersion;

  /// A service template minor version status message.
  final String? statusMessage;

  ServiceTemplateVersionSummary({
    required this.arn,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.majorVersion,
    required this.minorVersion,
    required this.status,
    required this.templateName,
    this.description,
    this.recommendedMinorVersion,
    this.statusMessage,
  });

  factory ServiceTemplateVersionSummary.fromJson(Map<String, dynamic> json) {
    return ServiceTemplateVersionSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      majorVersion: json['majorVersion'] as String,
      minorVersion: json['minorVersion'] as String,
      status: (json['status'] as String).toTemplateVersionStatus(),
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      recommendedMinorVersion: json['recommendedMinorVersion'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final majorVersion = this.majorVersion;
    final minorVersion = this.minorVersion;
    final status = this.status;
    final templateName = this.templateName;
    final description = this.description;
    final recommendedMinorVersion = this.recommendedMinorVersion;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'majorVersion': majorVersion,
      'minorVersion': minorVersion,
      'status': status.toValue(),
      'templateName': templateName,
      if (description != null) 'description': description,
      if (recommendedMinorVersion != null)
        'recommendedMinorVersion': recommendedMinorVersion,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Detailed data of the sync blocker.
class SyncBlocker {
  /// The time when the sync blocker was created.
  final DateTime createdAt;

  /// The reason why the sync blocker was created.
  final String createdReason;

  /// The ID of the sync blocker.
  final String id;

  /// The status of the sync blocker.
  final BlockerStatus status;

  /// The type of the sync blocker.
  final BlockerType type;

  /// The contexts for the sync blocker.
  final List<SyncBlockerContext>? contexts;

  /// The time the sync blocker was resolved.
  final DateTime? resolvedAt;

  /// The reason the sync blocker was resolved.
  final String? resolvedReason;

  SyncBlocker({
    required this.createdAt,
    required this.createdReason,
    required this.id,
    required this.status,
    required this.type,
    this.contexts,
    this.resolvedAt,
    this.resolvedReason,
  });

  factory SyncBlocker.fromJson(Map<String, dynamic> json) {
    return SyncBlocker(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdReason: json['createdReason'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toBlockerStatus(),
      type: (json['type'] as String).toBlockerType(),
      contexts: (json['contexts'] as List?)
          ?.whereNotNull()
          .map((e) => SyncBlockerContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolvedAt: timeStampFromJson(json['resolvedAt']),
      resolvedReason: json['resolvedReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdReason = this.createdReason;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    final contexts = this.contexts;
    final resolvedAt = this.resolvedAt;
    final resolvedReason = this.resolvedReason;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdReason': createdReason,
      'id': id,
      'status': status.toValue(),
      'type': type.toValue(),
      if (contexts != null) 'contexts': contexts,
      if (resolvedAt != null) 'resolvedAt': unixTimestampToJson(resolvedAt),
      if (resolvedReason != null) 'resolvedReason': resolvedReason,
    };
  }
}

/// Detailed data of the context of the sync blocker.
class SyncBlockerContext {
  /// The key for the sync blocker context.
  final String key;

  /// The value of the sync blocker context.
  final String value;

  SyncBlockerContext({
    required this.key,
    required this.value,
  });

  factory SyncBlockerContext.fromJson(Map<String, dynamic> json) {
    return SyncBlockerContext(
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

enum SyncType {
  templateSync,
  serviceSync,
}

extension SyncTypeValueExtension on SyncType {
  String toValue() {
    switch (this) {
      case SyncType.templateSync:
        return 'TEMPLATE_SYNC';
      case SyncType.serviceSync:
        return 'SERVICE_SYNC';
    }
  }
}

extension SyncTypeFromString on String {
  SyncType toSyncType() {
    switch (this) {
      case 'TEMPLATE_SYNC':
        return SyncType.templateSync;
      case 'SERVICE_SYNC':
        return SyncType.serviceSync;
    }
    throw Exception('$this is not known in enum SyncType');
  }
}

/// A description of a resource tag.
class Tag {
  /// The key of the resource tag.
  final String key;

  /// The value of the resource tag.
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

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The detail data for a template sync configuration.
class TemplateSyncConfig {
  /// The repository branch.
  final String branch;

  /// The repository name (for example, <code>myrepos/myrepo</code>).
  final String repositoryName;

  /// The repository provider.
  final RepositoryProvider repositoryProvider;

  /// The template name.
  final String templateName;

  /// The template type.
  final TemplateType templateType;

  /// A subdirectory path to your template bundle version.
  final String? subdirectory;

  TemplateSyncConfig({
    required this.branch,
    required this.repositoryName,
    required this.repositoryProvider,
    required this.templateName,
    required this.templateType,
    this.subdirectory,
  });

  factory TemplateSyncConfig.fromJson(Map<String, dynamic> json) {
    return TemplateSyncConfig(
      branch: json['branch'] as String,
      repositoryName: json['repositoryName'] as String,
      repositoryProvider:
          (json['repositoryProvider'] as String).toRepositoryProvider(),
      templateName: json['templateName'] as String,
      templateType: (json['templateType'] as String).toTemplateType(),
      subdirectory: json['subdirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final repositoryName = this.repositoryName;
    final repositoryProvider = this.repositoryProvider;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final subdirectory = this.subdirectory;
    return {
      'branch': branch,
      'repositoryName': repositoryName,
      'repositoryProvider': repositoryProvider.toValue(),
      'templateName': templateName,
      'templateType': templateType.toValue(),
      if (subdirectory != null) 'subdirectory': subdirectory,
    };
  }
}

enum TemplateType {
  environment,
  service,
}

extension TemplateTypeValueExtension on TemplateType {
  String toValue() {
    switch (this) {
      case TemplateType.environment:
        return 'ENVIRONMENT';
      case TemplateType.service:
        return 'SERVICE';
    }
  }
}

extension TemplateTypeFromString on String {
  TemplateType toTemplateType() {
    switch (this) {
      case 'ENVIRONMENT':
        return TemplateType.environment;
      case 'SERVICE':
        return TemplateType.service;
    }
    throw Exception('$this is not known in enum TemplateType');
  }
}

/// Template version source data.
class TemplateVersionSourceInput {
  /// An S3 source object that includes the template bundle S3 path and name for a
  /// template minor version.
  final S3ObjectSource? s3;

  TemplateVersionSourceInput({
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

enum TemplateVersionStatus {
  registrationInProgress,
  registrationFailed,
  draft,
  published,
}

extension TemplateVersionStatusValueExtension on TemplateVersionStatus {
  String toValue() {
    switch (this) {
      case TemplateVersionStatus.registrationInProgress:
        return 'REGISTRATION_IN_PROGRESS';
      case TemplateVersionStatus.registrationFailed:
        return 'REGISTRATION_FAILED';
      case TemplateVersionStatus.draft:
        return 'DRAFT';
      case TemplateVersionStatus.published:
        return 'PUBLISHED';
    }
  }
}

extension TemplateVersionStatusFromString on String {
  TemplateVersionStatus toTemplateVersionStatus() {
    switch (this) {
      case 'REGISTRATION_IN_PROGRESS':
        return TemplateVersionStatus.registrationInProgress;
      case 'REGISTRATION_FAILED':
        return TemplateVersionStatus.registrationFailed;
      case 'DRAFT':
        return TemplateVersionStatus.draft;
      case 'PUBLISHED':
        return TemplateVersionStatus.published;
    }
    throw Exception('$this is not known in enum TemplateVersionStatus');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAccountSettingsOutput {
  /// The Proton pipeline service role and repository data shared across the
  /// Amazon Web Services account.
  final AccountSettings accountSettings;

  UpdateAccountSettingsOutput({
    required this.accountSettings,
  });

  factory UpdateAccountSettingsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAccountSettingsOutput(
      accountSettings: AccountSettings.fromJson(
          json['accountSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    return {
      'accountSettings': accountSettings,
    };
  }
}

class UpdateComponentOutput {
  /// The detailed data of the updated component.
  final Component component;

  UpdateComponentOutput({
    required this.component,
  });

  factory UpdateComponentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateComponentOutput(
      component: Component.fromJson(json['component'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      'component': component,
    };
  }
}

class UpdateEnvironmentAccountConnectionOutput {
  /// The environment account connection detail data that's returned by Proton.
  final EnvironmentAccountConnection environmentAccountConnection;

  UpdateEnvironmentAccountConnectionOutput({
    required this.environmentAccountConnection,
  });

  factory UpdateEnvironmentAccountConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateEnvironmentAccountConnectionOutput(
      environmentAccountConnection: EnvironmentAccountConnection.fromJson(
          json['environmentAccountConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentAccountConnection = this.environmentAccountConnection;
    return {
      'environmentAccountConnection': environmentAccountConnection,
    };
  }
}

class UpdateEnvironmentOutput {
  /// The environment detail data that's returned by Proton.
  final Environment environment;

  UpdateEnvironmentOutput({
    required this.environment,
  });

  factory UpdateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentOutput(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      'environment': environment,
    };
  }
}

class UpdateEnvironmentTemplateOutput {
  /// The environment template detail data that's returned by Proton.
  final EnvironmentTemplate environmentTemplate;

  UpdateEnvironmentTemplateOutput({
    required this.environmentTemplate,
  });

  factory UpdateEnvironmentTemplateOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentTemplateOutput(
      environmentTemplate: EnvironmentTemplate.fromJson(
          json['environmentTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplate = this.environmentTemplate;
    return {
      'environmentTemplate': environmentTemplate,
    };
  }
}

class UpdateEnvironmentTemplateVersionOutput {
  /// The environment template version detail data that's returned by Proton.
  final EnvironmentTemplateVersion environmentTemplateVersion;

  UpdateEnvironmentTemplateVersionOutput({
    required this.environmentTemplateVersion,
  });

  factory UpdateEnvironmentTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateEnvironmentTemplateVersionOutput(
      environmentTemplateVersion: EnvironmentTemplateVersion.fromJson(
          json['environmentTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentTemplateVersion = this.environmentTemplateVersion;
    return {
      'environmentTemplateVersion': environmentTemplateVersion,
    };
  }
}

class UpdateServiceInstanceOutput {
  /// The service instance summary data that's returned by Proton.
  final ServiceInstance serviceInstance;

  UpdateServiceInstanceOutput({
    required this.serviceInstance,
  });

  factory UpdateServiceInstanceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceInstanceOutput(
      serviceInstance: ServiceInstance.fromJson(
          json['serviceInstance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceInstance = this.serviceInstance;
    return {
      'serviceInstance': serviceInstance,
    };
  }
}

class UpdateServiceOutput {
  /// The service detail data that's returned by Proton.
  final Service service;

  UpdateServiceOutput({
    required this.service,
  });

  factory UpdateServiceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceOutput(
      service: Service.fromJson(json['service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

class UpdateServicePipelineOutput {
  /// The pipeline details that are returned by Proton.
  final ServicePipeline pipeline;

  UpdateServicePipelineOutput({
    required this.pipeline,
  });

  factory UpdateServicePipelineOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServicePipelineOutput(
      pipeline:
          ServicePipeline.fromJson(json['pipeline'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      'pipeline': pipeline,
    };
  }
}

class UpdateServiceSyncBlockerOutput {
  /// The name of the service that you want to update the service sync blocker
  /// for.
  final String serviceName;

  /// The detailed data on the service sync blocker that was updated.
  final SyncBlocker serviceSyncBlocker;

  /// The name of the service instance that you want to update the service sync
  /// blocker for.
  final String? serviceInstanceName;

  UpdateServiceSyncBlockerOutput({
    required this.serviceName,
    required this.serviceSyncBlocker,
    this.serviceInstanceName,
  });

  factory UpdateServiceSyncBlockerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceSyncBlockerOutput(
      serviceName: json['serviceName'] as String,
      serviceSyncBlocker: SyncBlocker.fromJson(
          json['serviceSyncBlocker'] as Map<String, dynamic>),
      serviceInstanceName: json['serviceInstanceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final serviceSyncBlocker = this.serviceSyncBlocker;
    final serviceInstanceName = this.serviceInstanceName;
    return {
      'serviceName': serviceName,
      'serviceSyncBlocker': serviceSyncBlocker,
      if (serviceInstanceName != null)
        'serviceInstanceName': serviceInstanceName,
    };
  }
}

class UpdateServiceSyncConfigOutput {
  /// The detailed data of the Proton Ops file.
  final ServiceSyncConfig? serviceSyncConfig;

  UpdateServiceSyncConfigOutput({
    this.serviceSyncConfig,
  });

  factory UpdateServiceSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceSyncConfigOutput(
      serviceSyncConfig: json['serviceSyncConfig'] != null
          ? ServiceSyncConfig.fromJson(
              json['serviceSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSyncConfig = this.serviceSyncConfig;
    return {
      if (serviceSyncConfig != null) 'serviceSyncConfig': serviceSyncConfig,
    };
  }
}

class UpdateServiceTemplateOutput {
  /// The service template detail data that's returned by Proton.
  final ServiceTemplate serviceTemplate;

  UpdateServiceTemplateOutput({
    required this.serviceTemplate,
  });

  factory UpdateServiceTemplateOutput.fromJson(Map<String, dynamic> json) {
    return UpdateServiceTemplateOutput(
      serviceTemplate: ServiceTemplate.fromJson(
          json['serviceTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplate = this.serviceTemplate;
    return {
      'serviceTemplate': serviceTemplate,
    };
  }
}

class UpdateServiceTemplateVersionOutput {
  /// The service template version detail data that's returned by Proton.
  final ServiceTemplateVersion serviceTemplateVersion;

  UpdateServiceTemplateVersionOutput({
    required this.serviceTemplateVersion,
  });

  factory UpdateServiceTemplateVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateServiceTemplateVersionOutput(
      serviceTemplateVersion: ServiceTemplateVersion.fromJson(
          json['serviceTemplateVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceTemplateVersion = this.serviceTemplateVersion;
    return {
      'serviceTemplateVersion': serviceTemplateVersion,
    };
  }
}

class UpdateTemplateSyncConfigOutput {
  /// The template sync configuration detail data that's returned by Proton.
  final TemplateSyncConfig? templateSyncConfig;

  UpdateTemplateSyncConfigOutput({
    this.templateSyncConfig,
  });

  factory UpdateTemplateSyncConfigOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTemplateSyncConfigOutput(
      templateSyncConfig: json['templateSyncConfig'] != null
          ? TemplateSyncConfig.fromJson(
              json['templateSyncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final templateSyncConfig = this.templateSyncConfig;
    return {
      if (templateSyncConfig != null) 'templateSyncConfig': templateSyncConfig,
    };
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
