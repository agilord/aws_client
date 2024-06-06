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

/// This is the <i>Amazon AppStream 2.0 API Reference</i>. This documentation
/// provides descriptions and syntax for each of the actions and data types in
/// AppStream 2.0. AppStream 2.0 is a fully managed, secure application
/// streaming service that lets you stream desktop applications to users without
/// rewriting applications. AppStream 2.0 manages the AWS resources that are
/// required to host and run your applications, scales automatically, and
/// provides access to your users on demand.
/// <note>
/// You can call the AppStream 2.0 API operations by using an interface VPC
/// endpoint (interface endpoint). For more information, see <a
/// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/access-api-cli-through-interface-vpc-endpoint.html">Access
/// AppStream 2.0 API Operations and CLI Commands Through an Interface VPC
/// Endpoint</a> in the <i>Amazon AppStream 2.0 Administration Guide</i>.
/// </note>
/// To learn more about AppStream 2.0, see the following resources:
class AppStream {
  final _s.JsonProtocol _protocol;
  AppStream({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appstream2',
            signingName: 'appstream',
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

  /// Associates the specified app block builder with the specified app block.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appBlockArn] :
  /// The ARN of the app block.
  ///
  /// Parameter [appBlockBuilderName] :
  /// The name of the app block builder.
  Future<AssociateAppBlockBuilderAppBlockResult>
      associateAppBlockBuilderAppBlock({
    required String appBlockArn,
    required String appBlockBuilderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.AssociateAppBlockBuilderAppBlock'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppBlockArn': appBlockArn,
        'AppBlockBuilderName': appBlockBuilderName,
      },
    );

    return AssociateAppBlockBuilderAppBlockResult.fromJson(jsonResponse.body);
  }

  /// Associates the specified application with the specified fleet. This is
  /// only supported for Elastic fleets.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [applicationArn] :
  /// The ARN of the application.
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  Future<AssociateApplicationFleetResult> associateApplicationFleet({
    required String applicationArn,
    required String fleetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.AssociateApplicationFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'FleetName': fleetName,
      },
    );

    return AssociateApplicationFleetResult.fromJson(jsonResponse.body);
  }

  /// Associates an application to entitle.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The identifier of the application.
  ///
  /// Parameter [entitlementName] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack.
  Future<void> associateApplicationToEntitlement({
    required String applicationIdentifier,
    required String entitlementName,
    required String stackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.AssociateApplicationToEntitlement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationIdentifier': applicationIdentifier,
        'EntitlementName': entitlementName,
        'StackName': stackName,
      },
    );
  }

  /// Associates the specified fleet with the specified stack.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [IncompatibleImageException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  ///
  /// Parameter [stackName] :
  /// The name of the stack.
  Future<void> associateFleet({
    required String fleetName,
    required String stackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.AssociateFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetName': fleetName,
        'StackName': stackName,
      },
    );
  }

  /// Associates the specified users with the specified stacks. Users in a user
  /// pool cannot be assigned to stacks with fleets that are joined to an Active
  /// Directory domain.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [userStackAssociations] :
  /// The list of UserStackAssociation objects.
  Future<BatchAssociateUserStackResult> batchAssociateUserStack({
    required List<UserStackAssociation> userStackAssociations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.BatchAssociateUserStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserStackAssociations': userStackAssociations,
      },
    );

    return BatchAssociateUserStackResult.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified users from the specified stacks.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [userStackAssociations] :
  /// The list of UserStackAssociation objects.
  Future<BatchDisassociateUserStackResult> batchDisassociateUserStack({
    required List<UserStackAssociation> userStackAssociations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.BatchDisassociateUserStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserStackAssociations': userStackAssociations,
      },
    );

    return BatchDisassociateUserStackResult.fromJson(jsonResponse.body);
  }

  /// Copies the image within the same region or to a new region within the same
  /// AWS account. Note that any tags you added to the image will not be copied.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [IncompatibleImageException].
  ///
  /// Parameter [destinationImageName] :
  /// The name that the image will have when it is copied to the destination.
  ///
  /// Parameter [destinationRegion] :
  /// The destination region to which the image will be copied. This parameter
  /// is required, even if you are copying an image within the same region.
  ///
  /// Parameter [sourceImageName] :
  /// The name of the image to copy.
  ///
  /// Parameter [destinationImageDescription] :
  /// The description that the image will have when it is copied to the
  /// destination.
  Future<CopyImageResponse> copyImage({
    required String destinationImageName,
    required String destinationRegion,
    required String sourceImageName,
    String? destinationImageDescription,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CopyImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationImageName': destinationImageName,
        'DestinationRegion': destinationRegion,
        'SourceImageName': sourceImageName,
        if (destinationImageDescription != null)
          'DestinationImageDescription': destinationImageDescription,
      },
    );

    return CopyImageResponse.fromJson(jsonResponse.body);
  }

  /// Creates an app block.
  ///
  /// App blocks are an Amazon AppStream 2.0 resource that stores the details
  /// about the virtual hard disk in an S3 bucket. It also stores the setup
  /// script with details about how to mount the virtual hard disk. The virtual
  /// hard disk includes the application binaries and other files necessary to
  /// launch your applications. Multiple applications can be assigned to a
  /// single app block.
  ///
  /// This is only supported for Elastic fleets.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [name] :
  /// The name of the app block.
  ///
  /// Parameter [sourceS3Location] :
  /// The source S3 location of the app block.
  ///
  /// Parameter [description] :
  /// The description of the app block.
  ///
  /// Parameter [displayName] :
  /// The display name of the app block. This is not displayed to the user.
  ///
  /// Parameter [packagingType] :
  /// The packaging type of the app block.
  ///
  /// Parameter [postSetupScriptDetails] :
  /// The post setup script details of the app block. This can only be provided
  /// for the <code>APPSTREAM2</code> PackagingType.
  ///
  /// Parameter [setupScriptDetails] :
  /// The setup script details of the app block. This must be provided for the
  /// <code>CUSTOM</code> PackagingType.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the app block.
  Future<CreateAppBlockResult> createAppBlock({
    required String name,
    required S3Location sourceS3Location,
    String? description,
    String? displayName,
    PackagingType? packagingType,
    ScriptDetails? postSetupScriptDetails,
    ScriptDetails? setupScriptDetails,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateAppBlock'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'SourceS3Location': sourceS3Location,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (packagingType != null) 'PackagingType': packagingType.toValue(),
        if (postSetupScriptDetails != null)
          'PostSetupScriptDetails': postSetupScriptDetails,
        if (setupScriptDetails != null)
          'SetupScriptDetails': setupScriptDetails,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAppBlockResult.fromJson(jsonResponse.body);
  }

  /// Creates an app block builder.
  ///
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [InvalidRoleException].
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching the app block builder. The
  /// following instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The unique name for the app block builder.
  ///
  /// Parameter [platform] :
  /// The platform of the app block builder.
  ///
  /// <code>WINDOWS_SERVER_2019</code> is the only valid value.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the app block builder.
  ///
  /// App block builders require that you specify at least two subnets in
  /// different availability zones.
  ///
  /// Parameter [accessEndpoints] :
  /// The list of interface VPC endpoint (interface endpoint) objects.
  /// Administrators can connect to the app block builder only through the
  /// specified endpoints.
  ///
  /// Parameter [description] :
  /// The description of the app block builder.
  ///
  /// Parameter [displayName] :
  /// The display name of the app block builder.
  ///
  /// Parameter [enableDefaultInternetAccess] :
  /// Enables or disables default internet access for the app block builder.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to apply to the app block
  /// builder. To assume a role, the app block builder calls the AWS Security
  /// Token Service (STS) <code>AssumeRole</code> API operation and passes the
  /// ARN of the role to use. The operation creates a new session with temporary
  /// credentials. AppStream 2.0 retrieves the temporary credentials and creates
  /// the <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the app block builder. A tag is a key-value
  /// pair, and the value is optional. For example, Environment=Test. If you do
  /// not specify a value, Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  Future<CreateAppBlockBuilderResult> createAppBlockBuilder({
    required String instanceType,
    required String name,
    required AppBlockBuilderPlatformType platform,
    required VpcConfig vpcConfig,
    List<AccessEndpoint>? accessEndpoints,
    String? description,
    String? displayName,
    bool? enableDefaultInternetAccess,
    String? iamRoleArn,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateAppBlockBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceType': instanceType,
        'Name': name,
        'Platform': platform.toValue(),
        'VpcConfig': vpcConfig,
        if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (enableDefaultInternetAccess != null)
          'EnableDefaultInternetAccess': enableDefaultInternetAccess,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAppBlockBuilderResult.fromJson(jsonResponse.body);
  }

  /// Creates a URL to start a create app block builder streaming session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appBlockBuilderName] :
  /// The name of the app block builder.
  ///
  /// Parameter [validity] :
  /// The time that the streaming URL will be valid, in seconds. Specify a value
  /// between 1 and 604800 seconds. The default is 3600 seconds.
  Future<CreateAppBlockBuilderStreamingURLResult>
      createAppBlockBuilderStreamingURL({
    required String appBlockBuilderName,
    int? validity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.CreateAppBlockBuilderStreamingURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppBlockBuilderName': appBlockBuilderName,
        if (validity != null) 'Validity': validity,
      },
    );

    return CreateAppBlockBuilderStreamingURLResult.fromJson(jsonResponse.body);
  }

  /// Creates an application.
  ///
  /// Applications are an Amazon AppStream 2.0 resource that stores the details
  /// about how to launch applications on Elastic fleet streaming instances. An
  /// application consists of the launch details, icon, and display name.
  /// Applications are associated with an app block that contains the
  /// application binaries and other files. The applications assigned to an
  /// Elastic fleet are the applications users can launch.
  ///
  /// This is only supported for Elastic fleets.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appBlockArn] :
  /// The app block ARN to which the application should be associated
  ///
  /// Parameter [iconS3Location] :
  /// The location in S3 of the application icon.
  ///
  /// Parameter [instanceFamilies] :
  /// The instance families the application supports. Valid values are
  /// GENERAL_PURPOSE and GRAPHICS_G4.
  ///
  /// Parameter [launchPath] :
  /// The launch path of the application.
  ///
  /// Parameter [name] :
  /// The name of the application. This name is visible to users when display
  /// name is not specified.
  ///
  /// Parameter [platforms] :
  /// The platforms the application supports. WINDOWS_SERVER_2019 and
  /// AMAZON_LINUX2 are supported for Elastic fleets.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [displayName] :
  /// The display name of the application. This name is visible to users in the
  /// application catalog.
  ///
  /// Parameter [launchParameters] :
  /// The launch parameters of the application.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the application.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory of the application.
  Future<CreateApplicationResult> createApplication({
    required String appBlockArn,
    required S3Location iconS3Location,
    required List<String> instanceFamilies,
    required String launchPath,
    required String name,
    required List<PlatformType> platforms,
    String? description,
    String? displayName,
    String? launchParameters,
    Map<String, String>? tags,
    String? workingDirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppBlockArn': appBlockArn,
        'IconS3Location': iconS3Location,
        'InstanceFamilies': instanceFamilies,
        'LaunchPath': launchPath,
        'Name': name,
        'Platforms': platforms.map((e) => e.toValue()).toList(),
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (launchParameters != null) 'LaunchParameters': launchParameters,
        if (tags != null) 'Tags': tags,
        if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
      },
    );

    return CreateApplicationResult.fromJson(jsonResponse.body);
  }

  /// Creates a Directory Config object in AppStream 2.0. This object includes
  /// the configuration information required to join fleets and image builders
  /// to Microsoft Active Directory domains.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidRoleException].
  ///
  /// Parameter [directoryName] :
  /// The fully qualified name of the directory (for example, corp.example.com).
  ///
  /// Parameter [organizationalUnitDistinguishedNames] :
  /// The distinguished names of the organizational units for computer accounts.
  ///
  /// Parameter [certificateBasedAuthProperties] :
  /// The certificate-based authentication properties used to authenticate SAML
  /// 2.0 Identity Provider (IdP) user identities to Active Directory
  /// domain-joined streaming instances. Fallback is turned on by default when
  /// certificate-based authentication is <b>Enabled</b> . Fallback allows users
  /// to log in using their AD domain password if certificate-based
  /// authentication is unsuccessful, or to unlock a desktop lock screen.
  /// <b>Enabled_no_directory_login_fallback</b> enables certificate-based
  /// authentication, but does not allow users to log in using their AD domain
  /// password. Users will be disconnected to re-authenticate using
  /// certificates.
  ///
  /// Parameter [serviceAccountCredentials] :
  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  Future<CreateDirectoryConfigResult> createDirectoryConfig({
    required String directoryName,
    required List<String> organizationalUnitDistinguishedNames,
    CertificateBasedAuthProperties? certificateBasedAuthProperties,
    ServiceAccountCredentials? serviceAccountCredentials,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateDirectoryConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryName': directoryName,
        'OrganizationalUnitDistinguishedNames':
            organizationalUnitDistinguishedNames,
        if (certificateBasedAuthProperties != null)
          'CertificateBasedAuthProperties': certificateBasedAuthProperties,
        if (serviceAccountCredentials != null)
          'ServiceAccountCredentials': serviceAccountCredentials,
      },
    );

    return CreateDirectoryConfigResult.fromJson(jsonResponse.body);
  }

  /// Creates a new entitlement. Entitlements control access to specific
  /// applications within a stack, based on user attributes. Entitlements apply
  /// to SAML 2.0 federated user identities. Amazon AppStream 2.0 user pool and
  /// streaming URL users are entitled to all applications in a stack.
  /// Entitlements don't apply to the desktop stream view application, or to
  /// applications managed by a dynamic app provider using the Dynamic
  /// Application Framework.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [EntitlementAlreadyExistsException].
  ///
  /// Parameter [appVisibility] :
  /// Specifies whether all or selected apps are entitled.
  ///
  /// Parameter [attributes] :
  /// The attributes of the entitlement.
  ///
  /// Parameter [name] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  ///
  /// Parameter [description] :
  /// The description of the entitlement.
  Future<CreateEntitlementResult> createEntitlement({
    required AppVisibility appVisibility,
    required List<EntitlementAttribute> attributes,
    required String name,
    required String stackName,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateEntitlement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppVisibility': appVisibility.toValue(),
        'Attributes': attributes,
        'Name': name,
        'StackName': stackName,
        if (description != null) 'Description': description,
      },
    );

    return CreateEntitlementResult.fromJson(jsonResponse.body);
  }

  /// Creates a fleet. A fleet consists of streaming instances that your users
  /// access for their applications and desktops.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [InvalidRoleException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [IncompatibleImageException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching fleet instances. The following
  /// instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.large
  /// </li>
  /// <li>
  /// stream.compute.xlarge
  /// </li>
  /// <li>
  /// stream.compute.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.4xlarge
  /// </li>
  /// <li>
  /// stream.compute.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.large
  /// </li>
  /// <li>
  /// stream.memory.xlarge
  /// </li>
  /// <li>
  /// stream.memory.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.4xlarge
  /// </li>
  /// <li>
  /// stream.memory.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.large
  /// </li>
  /// <li>
  /// stream.memory.z1d.xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.3xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.6xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.large
  /// </li>
  /// <li>
  /// stream.graphics-design.xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-desktop.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.16xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.16xlarge
  /// </li>
  /// </ul>
  /// The following instance types are available for Elastic fleets:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A unique name for the fleet.
  ///
  /// Parameter [computeCapacity] :
  /// The desired capacity for the fleet. This is not allowed for Elastic
  /// fleets. For Elastic fleets, specify MaxConcurrentSessions instead.
  ///
  /// Parameter [description] :
  /// The description to display.
  ///
  /// Parameter [disconnectTimeoutInSeconds] :
  /// The amount of time that a streaming session remains active after users
  /// disconnect. If users try to reconnect to the streaming session after a
  /// disconnection or network interruption within this time interval, they are
  /// connected to their previous session. Otherwise, they are connected to a
  /// new session with a new streaming instance.
  ///
  /// Specify a value between 60 and 360000.
  ///
  /// Parameter [displayName] :
  /// The fleet name to display.
  ///
  /// Parameter [domainJoinInfo] :
  /// The name of the directory and organizational unit (OU) to use to join the
  /// fleet to a Microsoft Active Directory domain. This is not allowed for
  /// Elastic fleets.
  ///
  /// Parameter [enableDefaultInternetAccess] :
  /// Enables or disables default internet access for the fleet.
  ///
  /// Parameter [fleetType] :
  /// The fleet type.
  /// <dl> <dt>ALWAYS_ON</dt> <dd>
  /// Provides users with instant-on access to their apps. You are charged for
  /// all running instances in your fleet, even if no users are streaming apps.
  /// </dd> <dt>ON_DEMAND</dt> <dd>
  /// Provide users with access to applications after they connect, which takes
  /// one to two minutes. You are charged for instance streaming when users are
  /// connected and a small hourly fee for instances that are not streaming
  /// apps.
  /// </dd> </dl>
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To
  /// assume a role, a fleet instance calls the AWS Security Token Service (STS)
  /// <code>AssumeRole</code> API operation and passes the ARN of the role to
  /// use. The operation creates a new session with temporary credentials.
  /// AppStream 2.0 retrieves the temporary credentials and creates the
  /// <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// Parameter [idleDisconnectTimeoutInSeconds] :
  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the
  /// <code>DisconnectTimeoutInSeconds</code> time interval begins. Users are
  /// notified before they are disconnected due to inactivity. If they try to
  /// reconnect to the streaming session before the time interval specified in
  /// <code>DisconnectTimeoutInSeconds</code> elapses, they are connected to
  /// their previous session. Users are considered idle when they stop providing
  /// keyboard or mouse input during their streaming session. File uploads and
  /// downloads, audio in, audio out, and pixels changing do not qualify as user
  /// activity. If users continue to be idle after the time interval in
  /// <code>IdleDisconnectTimeoutInSeconds</code> elapses, they are
  /// disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a
  /// value of 0. Otherwise, specify a value between 60 and 3600. The default
  /// value is 0.
  /// <note>
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120,
  /// and 180). If you don't do this, the value is rounded to the nearest
  /// minute. For example, if you specify a value of 70, users are disconnected
  /// after 1 minute of inactivity. If you specify a value that is at the
  /// midpoint between two different minutes, the value is rounded up. For
  /// example, if you specify a value of 90, users are disconnected after 2
  /// minutes of inactivity.
  /// </note>
  ///
  /// Parameter [imageArn] :
  /// The ARN of the public, private, or shared image to use.
  ///
  /// Parameter [imageName] :
  /// The name of the image used to create the fleet.
  ///
  /// Parameter [maxConcurrentSessions] :
  /// The maximum concurrent sessions of the Elastic fleet. This is required for
  /// Elastic fleets, and not allowed for other fleet types.
  ///
  /// Parameter [maxSessionsPerInstance] :
  /// The maximum number of user sessions on an instance. This only applies to
  /// multi-session fleets.
  ///
  /// Parameter [maxUserDurationInSeconds] :
  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 432000.
  ///
  /// Parameter [platform] :
  /// The fleet platform. WINDOWS_SERVER_2019 and AMAZON_LINUX2 are supported
  /// for Elastic fleets.
  ///
  /// Parameter [sessionScriptS3Location] :
  /// The S3 location of the session scripts configuration zip file. This only
  /// applies to Elastic fleets.
  ///
  /// Parameter [streamView] :
  /// The AppStream 2.0 view that is displayed to your users when they stream
  /// from the fleet. When <code>APP</code> is specified, only the windows of
  /// applications opened by users display. When <code>DESKTOP</code> is
  /// specified, the standard desktop that is provided by the operating system
  /// displays.
  ///
  /// The default value is <code>APP</code>.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the fleet. A tag is a key-value pair, and the
  /// value is optional. For example, Environment=Test. If you do not specify a
  /// value, Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// Parameter [usbDeviceFilterStrings] :
  /// The USB device filter strings that specify which USB devices a user can
  /// redirect to the fleet streaming session, when using the Windows native
  /// client. This is allowed but not required for Elastic fleets.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the fleet. This is required for Elastic fleets,
  /// but not required for other fleet types. Elastic fleets require that you
  /// specify at least two subnets in different availability zones.
  Future<CreateFleetResult> createFleet({
    required String instanceType,
    required String name,
    ComputeCapacity? computeCapacity,
    String? description,
    int? disconnectTimeoutInSeconds,
    String? displayName,
    DomainJoinInfo? domainJoinInfo,
    bool? enableDefaultInternetAccess,
    FleetType? fleetType,
    String? iamRoleArn,
    int? idleDisconnectTimeoutInSeconds,
    String? imageArn,
    String? imageName,
    int? maxConcurrentSessions,
    int? maxSessionsPerInstance,
    int? maxUserDurationInSeconds,
    PlatformType? platform,
    S3Location? sessionScriptS3Location,
    StreamView? streamView,
    Map<String, String>? tags,
    List<String>? usbDeviceFilterStrings,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceType': instanceType,
        'Name': name,
        if (computeCapacity != null) 'ComputeCapacity': computeCapacity,
        if (description != null) 'Description': description,
        if (disconnectTimeoutInSeconds != null)
          'DisconnectTimeoutInSeconds': disconnectTimeoutInSeconds,
        if (displayName != null) 'DisplayName': displayName,
        if (domainJoinInfo != null) 'DomainJoinInfo': domainJoinInfo,
        if (enableDefaultInternetAccess != null)
          'EnableDefaultInternetAccess': enableDefaultInternetAccess,
        if (fleetType != null) 'FleetType': fleetType.toValue(),
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (idleDisconnectTimeoutInSeconds != null)
          'IdleDisconnectTimeoutInSeconds': idleDisconnectTimeoutInSeconds,
        if (imageArn != null) 'ImageArn': imageArn,
        if (imageName != null) 'ImageName': imageName,
        if (maxConcurrentSessions != null)
          'MaxConcurrentSessions': maxConcurrentSessions,
        if (maxSessionsPerInstance != null)
          'MaxSessionsPerInstance': maxSessionsPerInstance,
        if (maxUserDurationInSeconds != null)
          'MaxUserDurationInSeconds': maxUserDurationInSeconds,
        if (platform != null) 'Platform': platform.toValue(),
        if (sessionScriptS3Location != null)
          'SessionScriptS3Location': sessionScriptS3Location,
        if (streamView != null) 'StreamView': streamView.toValue(),
        if (tags != null) 'Tags': tags,
        if (usbDeviceFilterStrings != null)
          'UsbDeviceFilterStrings': usbDeviceFilterStrings,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateFleetResult.fromJson(jsonResponse.body);
  }

  /// Creates an image builder. An image builder is a virtual machine that is
  /// used to create an image.
  ///
  /// The initial state of the builder is <code>PENDING</code>. When it is
  /// ready, the state is <code>RUNNING</code>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRoleException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [IncompatibleImageException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching the image builder. The following
  /// instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.compute.large
  /// </li>
  /// <li>
  /// stream.compute.xlarge
  /// </li>
  /// <li>
  /// stream.compute.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.4xlarge
  /// </li>
  /// <li>
  /// stream.compute.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.large
  /// </li>
  /// <li>
  /// stream.memory.xlarge
  /// </li>
  /// <li>
  /// stream.memory.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.4xlarge
  /// </li>
  /// <li>
  /// stream.memory.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.large
  /// </li>
  /// <li>
  /// stream.memory.z1d.xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.3xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.6xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.large
  /// </li>
  /// <li>
  /// stream.graphics-design.xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-desktop.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.16xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.16xlarge
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A unique name for the image builder.
  ///
  /// Parameter [accessEndpoints] :
  /// The list of interface VPC endpoint (interface endpoint) objects.
  /// Administrators can connect to the image builder only through the specified
  /// endpoints.
  ///
  /// Parameter [appstreamAgentVersion] :
  /// The version of the AppStream 2.0 agent to use for this image builder. To
  /// use the latest version of the AppStream 2.0 agent, specify [LATEST].
  ///
  /// Parameter [description] :
  /// The description to display.
  ///
  /// Parameter [displayName] :
  /// The image builder name to display.
  ///
  /// Parameter [domainJoinInfo] :
  /// The name of the directory and organizational unit (OU) to use to join the
  /// image builder to a Microsoft Active Directory domain.
  ///
  /// Parameter [enableDefaultInternetAccess] :
  /// Enables or disables default internet access for the image builder.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to apply to the image
  /// builder. To assume a role, the image builder calls the AWS Security Token
  /// Service (STS) <code>AssumeRole</code> API operation and passes the ARN of
  /// the role to use. The operation creates a new session with temporary
  /// credentials. AppStream 2.0 retrieves the temporary credentials and creates
  /// the <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// Parameter [imageArn] :
  /// The ARN of the public, private, or shared image to use.
  ///
  /// Parameter [imageName] :
  /// The name of the image used to create the image builder.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the image builder. A tag is a key-value pair,
  /// and the value is optional. For example, Environment=Test. If you do not
  /// specify a value, Environment=.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the image builder. You can specify only one
  /// subnet.
  Future<CreateImageBuilderResult> createImageBuilder({
    required String instanceType,
    required String name,
    List<AccessEndpoint>? accessEndpoints,
    String? appstreamAgentVersion,
    String? description,
    String? displayName,
    DomainJoinInfo? domainJoinInfo,
    bool? enableDefaultInternetAccess,
    String? iamRoleArn,
    String? imageArn,
    String? imageName,
    Map<String, String>? tags,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateImageBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceType': instanceType,
        'Name': name,
        if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
        if (appstreamAgentVersion != null)
          'AppstreamAgentVersion': appstreamAgentVersion,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (domainJoinInfo != null) 'DomainJoinInfo': domainJoinInfo,
        if (enableDefaultInternetAccess != null)
          'EnableDefaultInternetAccess': enableDefaultInternetAccess,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (imageArn != null) 'ImageArn': imageArn,
        if (imageName != null) 'ImageName': imageName,
        if (tags != null) 'Tags': tags,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateImageBuilderResult.fromJson(jsonResponse.body);
  }

  /// Creates a URL to start an image builder streaming session.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the image builder.
  ///
  /// Parameter [validity] :
  /// The time that the streaming URL will be valid, in seconds. Specify a value
  /// between 1 and 604800 seconds. The default is 3600 seconds.
  Future<CreateImageBuilderStreamingURLResult> createImageBuilderStreamingURL({
    required String name,
    int? validity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateImageBuilderStreamingURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (validity != null) 'Validity': validity,
      },
    );

    return CreateImageBuilderStreamingURLResult.fromJson(jsonResponse.body);
  }

  /// Creates a stack to start streaming applications to users. A stack consists
  /// of an associated fleet, user access policies, and storage configurations.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRoleException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// The name of the stack.
  ///
  /// Parameter [accessEndpoints] :
  /// The list of interface VPC endpoint (interface endpoint) objects. Users of
  /// the stack can connect to AppStream 2.0 only through the specified
  /// endpoints.
  ///
  /// Parameter [applicationSettings] :
  /// The persistent application settings for users of a stack. When these
  /// settings are enabled, changes that users make to applications and Windows
  /// settings are automatically saved after each session and applied to the
  /// next session.
  ///
  /// Parameter [description] :
  /// The description to display.
  ///
  /// Parameter [displayName] :
  /// The stack name to display.
  ///
  /// Parameter [embedHostDomains] :
  /// The domains where AppStream 2.0 streaming sessions can be embedded in an
  /// iframe. You must approve the domains that you want to host embedded
  /// AppStream 2.0 streaming sessions.
  ///
  /// Parameter [feedbackURL] :
  /// The URL that users are redirected to after they click the Send Feedback
  /// link. If no URL is specified, no Send Feedback link is displayed.
  ///
  /// Parameter [redirectURL] :
  /// The URL that users are redirected to after their streaming session ends.
  ///
  /// Parameter [storageConnectors] :
  /// The storage connectors to enable.
  ///
  /// Parameter [streamingExperienceSettings] :
  /// The streaming protocol you want your stack to prefer. This can be UDP or
  /// TCP. Currently, UDP is only supported in the Windows native client.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the stack. A tag is a key-value pair, and the
  /// value is optional. For example, Environment=Test. If you do not specify a
  /// value, Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// Parameter [userSettings] :
  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default, these actions are enabled.
  Future<CreateStackResult> createStack({
    required String name,
    List<AccessEndpoint>? accessEndpoints,
    ApplicationSettings? applicationSettings,
    String? description,
    String? displayName,
    List<String>? embedHostDomains,
    String? feedbackURL,
    String? redirectURL,
    List<StorageConnector>? storageConnectors,
    StreamingExperienceSettings? streamingExperienceSettings,
    Map<String, String>? tags,
    List<UserSetting>? userSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
        if (applicationSettings != null)
          'ApplicationSettings': applicationSettings,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (embedHostDomains != null) 'EmbedHostDomains': embedHostDomains,
        if (feedbackURL != null) 'FeedbackURL': feedbackURL,
        if (redirectURL != null) 'RedirectURL': redirectURL,
        if (storageConnectors != null) 'StorageConnectors': storageConnectors,
        if (streamingExperienceSettings != null)
          'StreamingExperienceSettings': streamingExperienceSettings,
        if (tags != null) 'Tags': tags,
        if (userSettings != null) 'UserSettings': userSettings,
      },
    );

    return CreateStackResult.fromJson(jsonResponse.body);
  }

  /// Creates a temporary URL to start an AppStream 2.0 streaming session for
  /// the specified user. A streaming URL enables application streaming to be
  /// tested without user setup.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  ///
  /// Parameter [stackName] :
  /// The name of the stack.
  ///
  /// Parameter [userId] :
  /// The identifier of the user.
  ///
  /// Parameter [applicationId] :
  /// The name of the application to launch after the session starts. This is
  /// the name that you specified as <b>Name</b> in the Image Assistant. If your
  /// fleet is enabled for the <b>Desktop</b> stream view, you can also choose
  /// to launch directly to the operating system desktop. To do so, specify
  /// <b>Desktop</b>.
  ///
  /// Parameter [sessionContext] :
  /// The session context. For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/managing-stacks-fleets.html#managing-stacks-fleets-parameters">Session
  /// Context</a> in the <i>Amazon AppStream 2.0 Administration Guide</i>.
  ///
  /// Parameter [validity] :
  /// The time that the streaming URL will be valid, in seconds. Specify a value
  /// between 1 and 604800 seconds. The default is 60 seconds.
  Future<CreateStreamingURLResult> createStreamingURL({
    required String fleetName,
    required String stackName,
    required String userId,
    String? applicationId,
    String? sessionContext,
    int? validity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateStreamingURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetName': fleetName,
        'StackName': stackName,
        'UserId': userId,
        if (applicationId != null) 'ApplicationId': applicationId,
        if (sessionContext != null) 'SessionContext': sessionContext,
        if (validity != null) 'Validity': validity,
      },
    );

    return CreateStreamingURLResult.fromJson(jsonResponse.body);
  }

  /// Creates a new image with the latest Windows operating system updates,
  /// driver updates, and AppStream 2.0 agent software.
  ///
  /// For more information, see the "Update an Image by Using Managed AppStream
  /// 2.0 Image Updates" section in <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/administer-images.html">Administer
  /// Your AppStream 2.0 Images</a>, in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [IncompatibleImageException].
  ///
  /// Parameter [existingImageName] :
  /// The name of the image to update.
  ///
  /// Parameter [newImageName] :
  /// The name of the new image. The name must be unique within the AWS account
  /// and Region.
  ///
  /// Parameter [dryRun] :
  /// Indicates whether to display the status of image update availability
  /// before AppStream 2.0 initiates the process of creating a new updated
  /// image. If this value is set to <code>true</code>, AppStream 2.0 displays
  /// whether image updates are available. If this value is set to
  /// <code>false</code>, AppStream 2.0 initiates the process of creating a new
  /// updated image without displaying whether image updates are available.
  ///
  /// Parameter [newImageDescription] :
  /// The description to display for the new image.
  ///
  /// Parameter [newImageDisplayName] :
  /// The name to display for the new image.
  ///
  /// Parameter [newImageTags] :
  /// The tags to associate with the new image. A tag is a key-value pair, and
  /// the value is optional. For example, Environment=Test. If you do not
  /// specify a value, Environment=.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  Future<CreateUpdatedImageResult> createUpdatedImage({
    required String existingImageName,
    required String newImageName,
    bool? dryRun,
    String? newImageDescription,
    String? newImageDisplayName,
    Map<String, String>? newImageTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateUpdatedImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'existingImageName': existingImageName,
        'newImageName': newImageName,
        if (dryRun != null) 'dryRun': dryRun,
        if (newImageDescription != null)
          'newImageDescription': newImageDescription,
        if (newImageDisplayName != null)
          'newImageDisplayName': newImageDisplayName,
        if (newImageTags != null) 'newImageTags': newImageTags,
      },
    );

    return CreateUpdatedImageResult.fromJson(jsonResponse.body);
  }

  /// Creates a usage report subscription. Usage reports are generated daily.
  ///
  /// May throw [InvalidRoleException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [LimitExceededException].
  Future<CreateUsageReportSubscriptionResult>
      createUsageReportSubscription() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateUsageReportSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return CreateUsageReportSubscriptionResult.fromJson(jsonResponse.body);
  }

  /// Creates a new user in the user pool.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [LimitExceededException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the user. You must specify USERPOOL.
  ///
  /// Parameter [userName] :
  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive. During login, if they specify
  /// an email address that doesn't use the same capitalization as the email
  /// address specified when their user pool account was created, a "user does
  /// not exist" error message displays.
  /// </note>
  ///
  /// Parameter [firstName] :
  /// The first name, or given name, of the user.
  ///
  /// Parameter [lastName] :
  /// The last name, or surname, of the user.
  ///
  /// Parameter [messageAction] :
  /// The action to take for the welcome email that is sent to a user after the
  /// user is created in the user pool. If you specify SUPPRESS, no email is
  /// sent. If you specify RESEND, do not specify the first name or last name of
  /// the user. If the value is null, the email is sent.
  /// <note>
  /// The temporary password in the welcome email is valid for only 7 days. If
  /// users don’t set their passwords within 7 days, you must send them a new
  /// welcome email.
  /// </note>
  Future<void> createUser({
    required AuthenticationType authenticationType,
    required String userName,
    String? firstName,
    String? lastName,
    MessageAction? messageAction,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType.toValue(),
        'UserName': userName,
        if (firstName != null) 'FirstName': firstName,
        if (lastName != null) 'LastName': lastName,
        if (messageAction != null) 'MessageAction': messageAction.toValue(),
      },
    );
  }

  /// Deletes an app block.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the app block.
  Future<void> deleteAppBlock({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteAppBlock'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes an app block builder.
  ///
  /// An app block builder can only be deleted when it has no association with
  /// an app block.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the app block builder.
  Future<void> deleteAppBlockBuilder({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteAppBlockBuilder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes an application.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the application.
  Future<void> deleteApplication({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes the specified Directory Config object from AppStream 2.0. This
  /// object includes the information required to join streaming instances to an
  /// Active Directory domain.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryName] :
  /// The name of the directory configuration.
  Future<void> deleteDirectoryConfig({
    required String directoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteDirectoryConfig'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryName': directoryName,
      },
    );
  }

  /// Deletes the specified entitlement.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  Future<void> deleteEntitlement({
    required String name,
    required String stackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteEntitlement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'StackName': stackName,
      },
    );
  }

  /// Deletes the specified fleet.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the fleet.
  Future<void> deleteFleet({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes the specified image. You cannot delete an image when it is in use.
  /// After you delete an image, you cannot provision new capacity using the
  /// image.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the image.
  Future<DeleteImageResult> deleteImage({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteImageResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified image builder and releases the capacity.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the image builder.
  Future<DeleteImageBuilderResult> deleteImageBuilder({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteImageBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteImageBuilderResult.fromJson(jsonResponse.body);
  }

  /// Deletes permissions for the specified private image. After you delete
  /// permissions for an image, AWS accounts to which you previously granted
  /// these permissions can no longer use the image.
  ///
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the private image.
  ///
  /// Parameter [sharedAccountId] :
  /// The 12-digit identifier of the AWS account for which to delete image
  /// permissions.
  Future<void> deleteImagePermissions({
    required String name,
    required String sharedAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteImagePermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'SharedAccountId': sharedAccountId,
      },
    );
  }

  /// Deletes the specified stack. After the stack is deleted, the application
  /// streaming environment provided by the stack is no longer available to
  /// users. Also, any reservations made for application streaming sessions for
  /// the stack are released.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the stack.
  Future<void> deleteStack({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteStack'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Disables usage report generation.
  ///
  /// May throw [InvalidAccountStatusException].
  /// May throw [ResourceNotFoundException].
  Future<void> deleteUsageReportSubscription() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteUsageReportSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Deletes a user from the user pool.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the user. You must specify USERPOOL.
  ///
  /// Parameter [userName] :
  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  Future<void> deleteUser({
    required AuthenticationType authenticationType,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType.toValue(),
        'UserName': userName,
      },
    );
  }

  /// Retrieves a list that describes one or more app block builder
  /// associations.
  ///
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appBlockArn] :
  /// The ARN of the app block.
  ///
  /// Parameter [appBlockBuilderName] :
  /// The name of the app block builder.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeAppBlockBuilderAppBlockAssociationsResult>
      describeAppBlockBuilderAppBlockAssociations({
    String? appBlockArn,
    String? appBlockBuilderName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.DescribeAppBlockBuilderAppBlockAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appBlockArn != null) 'AppBlockArn': appBlockArn,
        if (appBlockBuilderName != null)
          'AppBlockBuilderName': appBlockBuilderName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAppBlockBuilderAppBlockAssociationsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves a list that describes one or more app block builders.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results. The maximum value is 25.
  ///
  /// Parameter [names] :
  /// The names of the app block builders.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeAppBlockBuildersResult> describeAppBlockBuilders({
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeAppBlockBuilders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAppBlockBuildersResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more app blocks.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arns] :
  /// The ARNs of the app blocks.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeAppBlocksResult> describeAppBlocks({
    List<String>? arns,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeAppBlocks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arns != null) 'Arns': arns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAppBlocksResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more application fleet
  /// associations. Either ApplicationArn or FleetName must be specified.
  ///
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [applicationArn] :
  /// The ARN of the application.
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeApplicationFleetAssociationsResult>
      describeApplicationFleetAssociations({
    String? applicationArn,
    String? fleetName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.DescribeApplicationFleetAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationArn != null) 'ApplicationArn': applicationArn,
        if (fleetName != null) 'FleetName': fleetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeApplicationFleetAssociationsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves a list that describes one or more applications.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arns] :
  /// The ARNs for the applications.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeApplicationsResult> describeApplications({
    List<String>? arns,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arns != null) 'Arns': arns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeApplicationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified Directory Config
  /// objects for AppStream 2.0, if the names for these objects are provided.
  /// Otherwise, all Directory Config objects in the account are described.
  /// These objects include the configuration information required to join
  /// fleets and image builders to Microsoft Active Directory domains.
  ///
  /// Although the response syntax in this topic includes the account password,
  /// this password is not returned in the actual response.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryNames] :
  /// The directory names.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeDirectoryConfigsResult> describeDirectoryConfigs({
    List<String>? directoryNames,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeDirectoryConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryNames != null) 'DirectoryNames': directoryNames,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeDirectoryConfigsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one of more entitlements.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [name] :
  /// The name of the entitlement.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<DescribeEntitlementsResult> describeEntitlements({
    required String stackName,
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeEntitlements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackName': stackName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (name != null) 'Name': name,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeEntitlementsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified fleets, if the fleet
  /// names are provided. Otherwise, all fleets in the account are described.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [names] :
  /// The names of the fleets to describe.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeFleetsResult> describeFleets({
    List<String>? names,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFleetsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified image builders, if
  /// the image builder names are provided. Otherwise, all image builders in the
  /// account are described.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [names] :
  /// The names of the image builders to describe.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeImageBuildersResult> describeImageBuilders({
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeImageBuilders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeImageBuildersResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes the permissions for shared AWS account IDs
  /// on a private image that you own.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the private image for which to describe permissions. The image
  /// must be one that you own.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  ///
  /// Parameter [sharedAwsAccountIds] :
  /// The 12-digit identifier of one or more AWS accounts with which the image
  /// is shared.
  Future<DescribeImagePermissionsResult> describeImagePermissions({
    required String name,
    int? maxResults,
    String? nextToken,
    List<String>? sharedAwsAccountIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeImagePermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sharedAwsAccountIds != null)
          'SharedAwsAccountIds': sharedAwsAccountIds,
      },
    );

    return DescribeImagePermissionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified images, if the image
  /// names or image ARNs are provided. Otherwise, all images in the account are
  /// described.
  ///
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arns] :
  /// The ARNs of the public, private, and shared images to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [names] :
  /// The names of the public or private images to describe.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  ///
  /// Parameter [type] :
  /// The type of image (public, private, or shared) to describe.
  Future<DescribeImagesResult> describeImages({
    List<String>? arns,
    int? maxResults,
    List<String>? names,
    String? nextToken,
    VisibilityType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arns != null) 'Arns': arns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DescribeImagesResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes the streaming sessions for a specified
  /// stack and fleet. If a UserId is provided for the stack and fleet, only
  /// streaming sessions for that user are described. If an authentication type
  /// is not provided, the default is to authenticate users using a streaming
  /// URL.
  ///
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet. This value is case-sensitive.
  ///
  /// Parameter [stackName] :
  /// The name of the stack. This value is case-sensitive.
  ///
  /// Parameter [authenticationType] :
  /// The authentication method. Specify <code>API</code> for a user
  /// authenticated using a streaming URL or <code>SAML</code> for a SAML
  /// federated user. The default is to authenticate users using a streaming
  /// URL.
  ///
  /// Parameter [instanceId] :
  /// The identifier for the instance hosting the session.
  ///
  /// Parameter [limit] :
  /// The size of each page of results. The default value is 20 and the maximum
  /// value is 50.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  ///
  /// Parameter [userId] :
  /// The user identifier (ID). If you specify a user ID, you must also specify
  /// the authentication type.
  Future<DescribeSessionsResult> describeSessions({
    required String fleetName,
    required String stackName,
    AuthenticationType? authenticationType,
    String? instanceId,
    int? limit,
    String? nextToken,
    String? userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetName': fleetName,
        'StackName': stackName,
        if (authenticationType != null)
          'AuthenticationType': authenticationType.toValue(),
        if (instanceId != null) 'InstanceId': instanceId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (userId != null) 'UserId': userId,
      },
    );

    return DescribeSessionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified stacks, if the stack
  /// names are provided. Otherwise, all stacks in the account are described.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [names] :
  /// The names of the stacks to describe.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeStacksResult> describeStacks({
    List<String>? names,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeStacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeStacksResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more usage report subscriptions.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccountStatusException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeUsageReportSubscriptionsResult>
      describeUsageReportSubscriptions({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeUsageReportSubscriptions'
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
      },
    );

    return DescribeUsageReportSubscriptionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes the UserStackAssociation objects. You must
  /// specify either or both of the following:
  ///
  /// <ul>
  /// <li>
  /// The stack name
  /// </li>
  /// <li>
  /// The user name (email address of the user associated with the stack) and
  /// the authentication type for the user
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the user who is associated with the stack. You
  /// must specify USERPOOL.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  ///
  /// Parameter [stackName] :
  /// The name of the stack that is associated with the user.
  ///
  /// Parameter [userName] :
  /// The email address of the user who is associated with the stack.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  Future<DescribeUserStackAssociationsResult> describeUserStackAssociations({
    AuthenticationType? authenticationType,
    int? maxResults,
    String? nextToken,
    String? stackName,
    String? userName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeUserStackAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (authenticationType != null)
          'AuthenticationType': authenticationType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (stackName != null) 'StackName': stackName,
        if (userName != null) 'UserName': userName,
      },
    );

    return DescribeUserStackAssociationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified users in the user
  /// pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the users in the user pool to describe. You
  /// must specify USERPOOL.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeUsersResult> describeUsers({
    required AuthenticationType authenticationType,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DescribeUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeUsersResult.fromJson(jsonResponse.body);
  }

  /// Disables the specified user in the user pool. Users can't sign in to
  /// AppStream 2.0 until they are re-enabled. This action does not delete the
  /// user.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the user. You must specify USERPOOL.
  ///
  /// Parameter [userName] :
  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  Future<void> disableUser({
    required AuthenticationType authenticationType,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DisableUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType.toValue(),
        'UserName': userName,
      },
    );
  }

  /// Disassociates a specified app block builder from a specified app block.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appBlockArn] :
  /// The ARN of the app block.
  ///
  /// Parameter [appBlockBuilderName] :
  /// The name of the app block builder.
  Future<void> disassociateAppBlockBuilderAppBlock({
    required String appBlockArn,
    required String appBlockBuilderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.DisassociateAppBlockBuilderAppBlock'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppBlockArn': appBlockArn,
        'AppBlockBuilderName': appBlockBuilderName,
      },
    );
  }

  /// Disassociates the specified application from the fleet.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [applicationArn] :
  /// The ARN of the application.
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  Future<void> disassociateApplicationFleet({
    required String applicationArn,
    required String fleetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DisassociateApplicationFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationArn': applicationArn,
        'FleetName': fleetName,
      },
    );
  }

  /// Deletes the specified application from the specified entitlement.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The identifier of the application to remove from the entitlement.
  ///
  /// Parameter [entitlementName] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  Future<void> disassociateApplicationFromEntitlement({
    required String applicationIdentifier,
    required String entitlementName,
    required String stackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PhotonAdminProxyService.DisassociateApplicationFromEntitlement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationIdentifier': applicationIdentifier,
        'EntitlementName': entitlementName,
        'StackName': stackName,
      },
    );
  }

  /// Disassociates the specified fleet from the specified stack.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  ///
  /// Parameter [stackName] :
  /// The name of the stack.
  Future<void> disassociateFleet({
    required String fleetName,
    required String stackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DisassociateFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetName': fleetName,
        'StackName': stackName,
      },
    );
  }

  /// Enables a user in the user pool. After being enabled, users can sign in to
  /// AppStream 2.0 and open applications from the stacks to which they are
  /// assigned.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccountStatusException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type for the user. You must specify USERPOOL.
  ///
  /// Parameter [userName] :
  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive. During login, if they specify
  /// an email address that doesn't use the same capitalization as the email
  /// address specified when their user pool account was created, a "user does
  /// not exist" error message displays.
  /// </note>
  Future<void> enableUser({
    required AuthenticationType authenticationType,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.EnableUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType.toValue(),
        'UserName': userName,
      },
    );
  }

  /// Immediately stops the specified streaming session.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the streaming session.
  Future<void> expireSession({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ExpireSession'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );
  }

  /// Retrieves the name of the fleet that is associated with the specified
  /// stack.
  ///
  /// Parameter [stackName] :
  /// The name of the stack.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListAssociatedFleetsResult> listAssociatedFleets({
    required String stackName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ListAssociatedFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackName': stackName,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociatedFleetsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the name of the stack with which the specified fleet is
  /// associated.
  ///
  /// Parameter [fleetName] :
  /// The name of the fleet.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListAssociatedStacksResult> listAssociatedStacks({
    required String fleetName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ListAssociatedStacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetName': fleetName,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociatedStacksResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of entitled applications.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  ///
  /// Parameter [entitlementName] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListEntitledApplicationsResult> listEntitledApplications({
    required String entitlementName,
    required String stackName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ListEntitledApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntitlementName': entitlementName,
        'StackName': stackName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntitledApplicationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of all tags for the specified AppStream 2.0 resource. You
  /// can tag AppStream 2.0 image builders, images, fleets, and stacks.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Starts an app block builder.
  ///
  /// An app block builder can only be started when it's associated with an app
  /// block.
  ///
  /// Starting an app block builder starts a new instance, which is equivalent
  /// to an elastic fleet instance with application builder assistance
  /// functionality.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [LimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [RequestLimitExceededException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the app block builder.
  Future<StartAppBlockBuilderResult> startAppBlockBuilder({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StartAppBlockBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return StartAppBlockBuilderResult.fromJson(jsonResponse.body);
  }

  /// Starts the specified fleet.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [InvalidRoleException].
  ///
  /// Parameter [name] :
  /// The name of the fleet.
  Future<void> startFleet({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StartFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Starts the specified image builder.
  ///
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [IncompatibleImageException].
  ///
  /// Parameter [name] :
  /// The name of the image builder.
  ///
  /// Parameter [appstreamAgentVersion] :
  /// The version of the AppStream 2.0 agent to use for this image builder. To
  /// use the latest version of the AppStream 2.0 agent, specify [LATEST].
  Future<StartImageBuilderResult> startImageBuilder({
    required String name,
    String? appstreamAgentVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StartImageBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (appstreamAgentVersion != null)
          'AppstreamAgentVersion': appstreamAgentVersion,
      },
    );

    return StartImageBuilderResult.fromJson(jsonResponse.body);
  }

  /// Stops an app block builder.
  ///
  /// Stopping an app block builder terminates the instance, and the instance
  /// state is not persisted.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the app block builder.
  Future<StopAppBlockBuilderResult> stopAppBlockBuilder({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StopAppBlockBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return StopAppBlockBuilderResult.fromJson(jsonResponse.body);
  }

  /// Stops the specified fleet.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the fleet.
  Future<void> stopFleet({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StopFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Stops the specified image builder.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the image builder.
  Future<StopImageBuilderResult> stopImageBuilder({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StopImageBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return StopImageBuilderResult.fromJson(jsonResponse.body);
  }

  /// Adds or overwrites one or more tags for the specified AppStream 2.0
  /// resource. You can tag AppStream 2.0 image builders, images, fleets, and
  /// stacks.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, this operation updates its value.
  ///
  /// To list the current tags for your resources, use
  /// <a>ListTagsForResource</a>. To disassociate tags from your resources, use
  /// <a>UntagResource</a>.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to associate. A tag is a key-value pair, and the value is
  /// optional. For example, Environment=Test. If you do not specify a value,
  /// Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Disassociates one or more specified tags from the specified AppStream 2.0
  /// resource.
  ///
  /// To list the current tags for your resources, use
  /// <a>ListTagsForResource</a>.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging
  /// Your Resources</a> in the <i>Amazon AppStream 2.0 Administration
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys for the tags to disassociate.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates an app block builder.
  ///
  /// If the app block builder is in the <code>STARTING</code> or
  /// <code>STOPPING</code> state, you can't update it. If the app block builder
  /// is in the <code>RUNNING</code> state, you can only update the DisplayName
  /// and Description. If the app block builder is in the <code>STOPPED</code>
  /// state, you can update any attribute except the Name.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidRoleException].
  /// May throw [LimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [RequestLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The unique name for the app block builder.
  ///
  /// Parameter [accessEndpoints] :
  /// The list of interface VPC endpoint (interface endpoint) objects.
  /// Administrators can connect to the app block builder only through the
  /// specified endpoints.
  ///
  /// Parameter [attributesToDelete] :
  /// The attributes to delete from the app block builder.
  ///
  /// Parameter [description] :
  /// The description of the app block builder.
  ///
  /// Parameter [displayName] :
  /// The display name of the app block builder.
  ///
  /// Parameter [enableDefaultInternetAccess] :
  /// Enables or disables default internet access for the app block builder.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to apply to the app block
  /// builder. To assume a role, the app block builder calls the AWS Security
  /// Token Service (STS) <code>AssumeRole</code> API operation and passes the
  /// ARN of the role to use. The operation creates a new session with temporary
  /// credentials. AppStream 2.0 retrieves the temporary credentials and creates
  /// the <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching the app block builder. The
  /// following instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// </ul>
  ///
  /// Parameter [platform] :
  /// The platform of the app block builder.
  ///
  /// <code>WINDOWS_SERVER_2019</code> is the only valid value.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the app block builder.
  ///
  /// App block builders require that you specify at least two subnets in
  /// different availability zones.
  Future<UpdateAppBlockBuilderResult> updateAppBlockBuilder({
    required String name,
    List<AccessEndpoint>? accessEndpoints,
    List<AppBlockBuilderAttribute>? attributesToDelete,
    String? description,
    String? displayName,
    bool? enableDefaultInternetAccess,
    String? iamRoleArn,
    String? instanceType,
    PlatformType? platform,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateAppBlockBuilder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
        if (attributesToDelete != null)
          'AttributesToDelete':
              attributesToDelete.map((e) => e.toValue()).toList(),
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (enableDefaultInternetAccess != null)
          'EnableDefaultInternetAccess': enableDefaultInternetAccess,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (instanceType != null) 'InstanceType': instanceType,
        if (platform != null) 'Platform': platform.toValue(),
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return UpdateAppBlockBuilderResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified application.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the application. This name is visible to users when display
  /// name is not specified.
  ///
  /// Parameter [appBlockArn] :
  /// The ARN of the app block.
  ///
  /// Parameter [attributesToDelete] :
  /// The attributes to delete for an application.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [displayName] :
  /// The display name of the application. This name is visible to users in the
  /// application catalog.
  ///
  /// Parameter [iconS3Location] :
  /// The icon S3 location of the application.
  ///
  /// Parameter [launchParameters] :
  /// The launch parameters of the application.
  ///
  /// Parameter [launchPath] :
  /// The launch path of the application.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory of the application.
  Future<UpdateApplicationResult> updateApplication({
    required String name,
    String? appBlockArn,
    List<ApplicationAttribute>? attributesToDelete,
    String? description,
    String? displayName,
    S3Location? iconS3Location,
    String? launchParameters,
    String? launchPath,
    String? workingDirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (appBlockArn != null) 'AppBlockArn': appBlockArn,
        if (attributesToDelete != null)
          'AttributesToDelete':
              attributesToDelete.map((e) => e.toValue()).toList(),
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (iconS3Location != null) 'IconS3Location': iconS3Location,
        if (launchParameters != null) 'LaunchParameters': launchParameters,
        if (launchPath != null) 'LaunchPath': launchPath,
        if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
      },
    );

    return UpdateApplicationResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified Directory Config object in AppStream 2.0. This
  /// object includes the configuration information required to join fleets and
  /// image builders to Microsoft Active Directory domains.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidRoleException].
  ///
  /// Parameter [directoryName] :
  /// The name of the Directory Config object.
  ///
  /// Parameter [certificateBasedAuthProperties] :
  /// The certificate-based authentication properties used to authenticate SAML
  /// 2.0 Identity Provider (IdP) user identities to Active Directory
  /// domain-joined streaming instances. Fallback is turned on by default when
  /// certificate-based authentication is <b>Enabled</b> . Fallback allows users
  /// to log in using their AD domain password if certificate-based
  /// authentication is unsuccessful, or to unlock a desktop lock screen.
  /// <b>Enabled_no_directory_login_fallback</b> enables certificate-based
  /// authentication, but does not allow users to log in using their AD domain
  /// password. Users will be disconnected to re-authenticate using
  /// certificates.
  ///
  /// Parameter [organizationalUnitDistinguishedNames] :
  /// The distinguished names of the organizational units for computer accounts.
  ///
  /// Parameter [serviceAccountCredentials] :
  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  Future<UpdateDirectoryConfigResult> updateDirectoryConfig({
    required String directoryName,
    CertificateBasedAuthProperties? certificateBasedAuthProperties,
    List<String>? organizationalUnitDistinguishedNames,
    ServiceAccountCredentials? serviceAccountCredentials,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateDirectoryConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryName': directoryName,
        if (certificateBasedAuthProperties != null)
          'CertificateBasedAuthProperties': certificateBasedAuthProperties,
        if (organizationalUnitDistinguishedNames != null)
          'OrganizationalUnitDistinguishedNames':
              organizationalUnitDistinguishedNames,
        if (serviceAccountCredentials != null)
          'ServiceAccountCredentials': serviceAccountCredentials,
      },
    );

    return UpdateDirectoryConfigResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified entitlement.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntitlementNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the entitlement.
  ///
  /// Parameter [stackName] :
  /// The name of the stack with which the entitlement is associated.
  ///
  /// Parameter [appVisibility] :
  /// Specifies whether all or only selected apps are entitled.
  ///
  /// Parameter [attributes] :
  /// The attributes of the entitlement.
  ///
  /// Parameter [description] :
  /// The description of the entitlement.
  Future<UpdateEntitlementResult> updateEntitlement({
    required String name,
    required String stackName,
    AppVisibility? appVisibility,
    List<EntitlementAttribute>? attributes,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateEntitlement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'StackName': stackName,
        if (appVisibility != null) 'AppVisibility': appVisibility.toValue(),
        if (attributes != null) 'Attributes': attributes,
        if (description != null) 'Description': description,
      },
    );

    return UpdateEntitlementResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified fleet.
  ///
  /// If the fleet is in the <code>STOPPED</code> state, you can update any
  /// attribute except the fleet name.
  ///
  /// If the fleet is in the <code>RUNNING</code> state, you can update the
  /// following based on the fleet type:
  ///
  /// <ul>
  /// <li>
  /// Always-On and On-Demand fleet types
  ///
  /// You can update the <code>DisplayName</code>, <code>ComputeCapacity</code>,
  /// <code>ImageARN</code>, <code>ImageName</code>,
  /// <code>IdleDisconnectTimeoutInSeconds</code>, and
  /// <code>DisconnectTimeoutInSeconds</code> attributes.
  /// </li>
  /// <li>
  /// Elastic fleet type
  ///
  /// You can update the <code>DisplayName</code>,
  /// <code>IdleDisconnectTimeoutInSeconds</code>,
  /// <code>DisconnectTimeoutInSeconds</code>,
  /// <code>MaxConcurrentSessions</code>, <code>SessionScriptS3Location</code>
  /// and <code>UsbDeviceFilterStrings</code> attributes.
  /// </li>
  /// </ul>
  /// If the fleet is in the <code>STARTING</code> or <code>STOPPED</code>
  /// state, you can't update it.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [InvalidRoleException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [IncompatibleImageException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [attributesToDelete] :
  /// The fleet attributes to delete.
  ///
  /// Parameter [computeCapacity] :
  /// The desired capacity for the fleet. This is not allowed for Elastic
  /// fleets.
  ///
  /// Parameter [deleteVpcConfig] :
  /// Deletes the VPC association for the specified fleet.
  ///
  /// Parameter [description] :
  /// The description to display.
  ///
  /// Parameter [disconnectTimeoutInSeconds] :
  /// The amount of time that a streaming session remains active after users
  /// disconnect. If users try to reconnect to the streaming session after a
  /// disconnection or network interruption within this time interval, they are
  /// connected to their previous session. Otherwise, they are connected to a
  /// new session with a new streaming instance.
  ///
  /// Specify a value between 60 and 360000.
  ///
  /// Parameter [displayName] :
  /// The fleet name to display.
  ///
  /// Parameter [domainJoinInfo] :
  /// The name of the directory and organizational unit (OU) to use to join the
  /// fleet to a Microsoft Active Directory domain.
  ///
  /// Parameter [enableDefaultInternetAccess] :
  /// Enables or disables default internet access for the fleet.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To
  /// assume a role, a fleet instance calls the AWS Security Token Service (STS)
  /// <code>AssumeRole</code> API operation and passes the ARN of the role to
  /// use. The operation creates a new session with temporary credentials.
  /// AppStream 2.0 retrieves the temporary credentials and creates the
  /// <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  ///
  /// Parameter [idleDisconnectTimeoutInSeconds] :
  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the
  /// <code>DisconnectTimeoutInSeconds</code> time interval begins. Users are
  /// notified before they are disconnected due to inactivity. If users try to
  /// reconnect to the streaming session before the time interval specified in
  /// <code>DisconnectTimeoutInSeconds</code> elapses, they are connected to
  /// their previous session. Users are considered idle when they stop providing
  /// keyboard or mouse input during their streaming session. File uploads and
  /// downloads, audio in, audio out, and pixels changing do not qualify as user
  /// activity. If users continue to be idle after the time interval in
  /// <code>IdleDisconnectTimeoutInSeconds</code> elapses, they are
  /// disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a
  /// value of 0. Otherwise, specify a value between 60 and 3600. The default
  /// value is 0.
  /// <note>
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120,
  /// and 180). If you don't do this, the value is rounded to the nearest
  /// minute. For example, if you specify a value of 70, users are disconnected
  /// after 1 minute of inactivity. If you specify a value that is at the
  /// midpoint between two different minutes, the value is rounded up. For
  /// example, if you specify a value of 90, users are disconnected after 2
  /// minutes of inactivity.
  /// </note>
  ///
  /// Parameter [imageArn] :
  /// The ARN of the public, private, or shared image to use.
  ///
  /// Parameter [imageName] :
  /// The name of the image used to create the fleet.
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching fleet instances. The following
  /// instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.large
  /// </li>
  /// <li>
  /// stream.compute.xlarge
  /// </li>
  /// <li>
  /// stream.compute.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.4xlarge
  /// </li>
  /// <li>
  /// stream.compute.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.large
  /// </li>
  /// <li>
  /// stream.memory.xlarge
  /// </li>
  /// <li>
  /// stream.memory.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.4xlarge
  /// </li>
  /// <li>
  /// stream.memory.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.large
  /// </li>
  /// <li>
  /// stream.memory.z1d.xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.3xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.6xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.large
  /// </li>
  /// <li>
  /// stream.graphics-design.xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-desktop.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.16xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.16xlarge
  /// </li>
  /// </ul>
  /// The following instance types are available for Elastic fleets:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.standard.xlarge
  /// </li>
  /// <li>
  /// stream.standard.2xlarge
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxConcurrentSessions] :
  /// The maximum number of concurrent sessions for a fleet.
  ///
  /// Parameter [maxSessionsPerInstance] :
  /// The maximum number of user sessions on an instance. This only applies to
  /// multi-session fleets.
  ///
  /// Parameter [maxUserDurationInSeconds] :
  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 432000.
  ///
  /// Parameter [name] :
  /// A unique name for the fleet.
  ///
  /// Parameter [platform] :
  /// The platform of the fleet. WINDOWS_SERVER_2019 and AMAZON_LINUX2 are
  /// supported for Elastic fleets.
  ///
  /// Parameter [sessionScriptS3Location] :
  /// The S3 location of the session scripts configuration zip file. This only
  /// applies to Elastic fleets.
  ///
  /// Parameter [streamView] :
  /// The AppStream 2.0 view that is displayed to your users when they stream
  /// from the fleet. When <code>APP</code> is specified, only the windows of
  /// applications opened by users display. When <code>DESKTOP</code> is
  /// specified, the standard desktop that is provided by the operating system
  /// displays.
  ///
  /// The default value is <code>APP</code>.
  ///
  /// Parameter [usbDeviceFilterStrings] :
  /// The USB device filter strings that specify which USB devices a user can
  /// redirect to the fleet streaming session, when using the Windows native
  /// client. This is allowed but not required for Elastic fleets.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the fleet. This is required for Elastic fleets,
  /// but not required for other fleet types. Elastic fleets require that you
  /// specify at least two subnets in different availability zones.
  Future<UpdateFleetResult> updateFleet({
    List<FleetAttribute>? attributesToDelete,
    ComputeCapacity? computeCapacity,
    bool? deleteVpcConfig,
    String? description,
    int? disconnectTimeoutInSeconds,
    String? displayName,
    DomainJoinInfo? domainJoinInfo,
    bool? enableDefaultInternetAccess,
    String? iamRoleArn,
    int? idleDisconnectTimeoutInSeconds,
    String? imageArn,
    String? imageName,
    String? instanceType,
    int? maxConcurrentSessions,
    int? maxSessionsPerInstance,
    int? maxUserDurationInSeconds,
    String? name,
    PlatformType? platform,
    S3Location? sessionScriptS3Location,
    StreamView? streamView,
    List<String>? usbDeviceFilterStrings,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attributesToDelete != null)
          'AttributesToDelete':
              attributesToDelete.map((e) => e.toValue()).toList(),
        if (computeCapacity != null) 'ComputeCapacity': computeCapacity,
        if (deleteVpcConfig != null) 'DeleteVpcConfig': deleteVpcConfig,
        if (description != null) 'Description': description,
        if (disconnectTimeoutInSeconds != null)
          'DisconnectTimeoutInSeconds': disconnectTimeoutInSeconds,
        if (displayName != null) 'DisplayName': displayName,
        if (domainJoinInfo != null) 'DomainJoinInfo': domainJoinInfo,
        if (enableDefaultInternetAccess != null)
          'EnableDefaultInternetAccess': enableDefaultInternetAccess,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (idleDisconnectTimeoutInSeconds != null)
          'IdleDisconnectTimeoutInSeconds': idleDisconnectTimeoutInSeconds,
        if (imageArn != null) 'ImageArn': imageArn,
        if (imageName != null) 'ImageName': imageName,
        if (instanceType != null) 'InstanceType': instanceType,
        if (maxConcurrentSessions != null)
          'MaxConcurrentSessions': maxConcurrentSessions,
        if (maxSessionsPerInstance != null)
          'MaxSessionsPerInstance': maxSessionsPerInstance,
        if (maxUserDurationInSeconds != null)
          'MaxUserDurationInSeconds': maxUserDurationInSeconds,
        if (name != null) 'Name': name,
        if (platform != null) 'Platform': platform.toValue(),
        if (sessionScriptS3Location != null)
          'SessionScriptS3Location': sessionScriptS3Location,
        if (streamView != null) 'StreamView': streamView.toValue(),
        if (usbDeviceFilterStrings != null)
          'UsbDeviceFilterStrings': usbDeviceFilterStrings,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return UpdateFleetResult.fromJson(jsonResponse.body);
  }

  /// Adds or updates permissions for the specified private image.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotAvailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [imagePermissions] :
  /// The permissions for the image.
  ///
  /// Parameter [name] :
  /// The name of the private image.
  ///
  /// Parameter [sharedAccountId] :
  /// The 12-digit identifier of the AWS account for which you want add or
  /// update image permissions.
  Future<void> updateImagePermissions({
    required ImagePermissions imagePermissions,
    required String name,
    required String sharedAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateImagePermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImagePermissions': imagePermissions,
        'Name': name,
        'SharedAccountId': sharedAccountId,
      },
    );
  }

  /// Updates the specified fields for the specified stack.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidRoleException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccountStatusException].
  /// May throw [IncompatibleImageException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the stack.
  ///
  /// Parameter [accessEndpoints] :
  /// The list of interface VPC endpoint (interface endpoint) objects. Users of
  /// the stack can connect to AppStream 2.0 only through the specified
  /// endpoints.
  ///
  /// Parameter [applicationSettings] :
  /// The persistent application settings for users of a stack. When these
  /// settings are enabled, changes that users make to applications and Windows
  /// settings are automatically saved after each session and applied to the
  /// next session.
  ///
  /// Parameter [attributesToDelete] :
  /// The stack attributes to delete.
  ///
  /// Parameter [deleteStorageConnectors] :
  /// Deletes the storage connectors currently enabled for the stack.
  ///
  /// Parameter [description] :
  /// The description to display.
  ///
  /// Parameter [displayName] :
  /// The stack name to display.
  ///
  /// Parameter [embedHostDomains] :
  /// The domains where AppStream 2.0 streaming sessions can be embedded in an
  /// iframe. You must approve the domains that you want to host embedded
  /// AppStream 2.0 streaming sessions.
  ///
  /// Parameter [feedbackURL] :
  /// The URL that users are redirected to after they choose the Send Feedback
  /// link. If no URL is specified, no Send Feedback link is displayed.
  ///
  /// Parameter [redirectURL] :
  /// The URL that users are redirected to after their streaming session ends.
  ///
  /// Parameter [storageConnectors] :
  /// The storage connectors to enable.
  ///
  /// Parameter [streamingExperienceSettings] :
  /// The streaming protocol you want your stack to prefer. This can be UDP or
  /// TCP. Currently, UDP is only supported in the Windows native client.
  ///
  /// Parameter [userSettings] :
  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default, these actions are enabled.
  Future<UpdateStackResult> updateStack({
    required String name,
    List<AccessEndpoint>? accessEndpoints,
    ApplicationSettings? applicationSettings,
    List<StackAttribute>? attributesToDelete,
    bool? deleteStorageConnectors,
    String? description,
    String? displayName,
    List<String>? embedHostDomains,
    String? feedbackURL,
    String? redirectURL,
    List<StorageConnector>? storageConnectors,
    StreamingExperienceSettings? streamingExperienceSettings,
    List<UserSetting>? userSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
        if (applicationSettings != null)
          'ApplicationSettings': applicationSettings,
        if (attributesToDelete != null)
          'AttributesToDelete':
              attributesToDelete.map((e) => e.toValue()).toList(),
        if (deleteStorageConnectors != null)
          'DeleteStorageConnectors': deleteStorageConnectors,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (embedHostDomains != null) 'EmbedHostDomains': embedHostDomains,
        if (feedbackURL != null) 'FeedbackURL': feedbackURL,
        if (redirectURL != null) 'RedirectURL': redirectURL,
        if (storageConnectors != null) 'StorageConnectors': storageConnectors,
        if (streamingExperienceSettings != null)
          'StreamingExperienceSettings': streamingExperienceSettings,
        if (userSettings != null) 'UserSettings': userSettings,
      },
    );

    return UpdateStackResult.fromJson(jsonResponse.body);
  }
}

/// Describes an interface VPC endpoint (interface endpoint) that lets you
/// create a private connection between the virtual private cloud (VPC) that you
/// specify and AppStream 2.0. When you specify an interface endpoint for a
/// stack, users of the stack can connect to AppStream 2.0 only through that
/// endpoint. When you specify an interface endpoint for an image builder,
/// administrators can connect to the image builder only through that endpoint.
class AccessEndpoint {
  /// The type of interface endpoint.
  final AccessEndpointType endpointType;

  /// The identifier (ID) of the VPC in which the interface endpoint is used.
  final String? vpceId;

  AccessEndpoint({
    required this.endpointType,
    this.vpceId,
  });

  factory AccessEndpoint.fromJson(Map<String, dynamic> json) {
    return AccessEndpoint(
      endpointType: (json['EndpointType'] as String).toAccessEndpointType(),
      vpceId: json['VpceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointType = this.endpointType;
    final vpceId = this.vpceId;
    return {
      'EndpointType': endpointType.toValue(),
      if (vpceId != null) 'VpceId': vpceId,
    };
  }
}

enum AccessEndpointType {
  streaming,
}

extension AccessEndpointTypeValueExtension on AccessEndpointType {
  String toValue() {
    switch (this) {
      case AccessEndpointType.streaming:
        return 'STREAMING';
    }
  }
}

extension AccessEndpointTypeFromString on String {
  AccessEndpointType toAccessEndpointType() {
    switch (this) {
      case 'STREAMING':
        return AccessEndpointType.streaming;
    }
    throw Exception('$this is not known in enum AccessEndpointType');
  }
}

enum Action {
  clipboardCopyFromLocalDevice,
  clipboardCopyToLocalDevice,
  fileUpload,
  fileDownload,
  printingToLocalDevice,
  domainPasswordSignin,
  domainSmartCardSignin,
}

extension ActionValueExtension on Action {
  String toValue() {
    switch (this) {
      case Action.clipboardCopyFromLocalDevice:
        return 'CLIPBOARD_COPY_FROM_LOCAL_DEVICE';
      case Action.clipboardCopyToLocalDevice:
        return 'CLIPBOARD_COPY_TO_LOCAL_DEVICE';
      case Action.fileUpload:
        return 'FILE_UPLOAD';
      case Action.fileDownload:
        return 'FILE_DOWNLOAD';
      case Action.printingToLocalDevice:
        return 'PRINTING_TO_LOCAL_DEVICE';
      case Action.domainPasswordSignin:
        return 'DOMAIN_PASSWORD_SIGNIN';
      case Action.domainSmartCardSignin:
        return 'DOMAIN_SMART_CARD_SIGNIN';
    }
  }
}

extension ActionFromString on String {
  Action toAction() {
    switch (this) {
      case 'CLIPBOARD_COPY_FROM_LOCAL_DEVICE':
        return Action.clipboardCopyFromLocalDevice;
      case 'CLIPBOARD_COPY_TO_LOCAL_DEVICE':
        return Action.clipboardCopyToLocalDevice;
      case 'FILE_UPLOAD':
        return Action.fileUpload;
      case 'FILE_DOWNLOAD':
        return Action.fileDownload;
      case 'PRINTING_TO_LOCAL_DEVICE':
        return Action.printingToLocalDevice;
      case 'DOMAIN_PASSWORD_SIGNIN':
        return Action.domainPasswordSignin;
      case 'DOMAIN_SMART_CARD_SIGNIN':
        return Action.domainSmartCardSignin;
    }
    throw Exception('$this is not known in enum Action');
  }
}

/// Describes an app block.
///
/// App blocks are an Amazon AppStream 2.0 resource that stores the details
/// about the virtual hard disk in an S3 bucket. It also stores the setup script
/// with details about how to mount the virtual hard disk. The virtual hard disk
/// includes the application binaries and other files necessary to launch your
/// applications. Multiple applications can be assigned to a single app block.
///
/// This is only supported for Elastic fleets.
class AppBlock {
  /// The ARN of the app block.
  final String arn;

  /// The name of the app block.
  final String name;

  /// The errors of the app block.
  final List<ErrorDetails>? appBlockErrors;

  /// The created time of the app block.
  final DateTime? createdTime;

  /// The description of the app block.
  final String? description;

  /// The display name of the app block.
  final String? displayName;

  /// The packaging type of the app block.
  final PackagingType? packagingType;

  /// The post setup script details of the app block.
  ///
  /// This only applies to app blocks with PackagingType <code>APPSTREAM2</code>.
  final ScriptDetails? postSetupScriptDetails;

  /// The setup script details of the app block.
  ///
  /// This only applies to app blocks with PackagingType <code>CUSTOM</code>.
  final ScriptDetails? setupScriptDetails;

  /// The source S3 location of the app block.
  final S3Location? sourceS3Location;

  /// The state of the app block.
  ///
  /// An app block with AppStream 2.0 packaging will be in the
  /// <code>INACTIVE</code> state if no application package (VHD) is assigned to
  /// it. After an application package (VHD) is created by an app block builder
  /// for an app block, it becomes <code>ACTIVE</code>.
  ///
  /// Custom app blocks are always in the <code>ACTIVE</code> state and no action
  /// is required to use them.
  final AppBlockState? state;

  AppBlock({
    required this.arn,
    required this.name,
    this.appBlockErrors,
    this.createdTime,
    this.description,
    this.displayName,
    this.packagingType,
    this.postSetupScriptDetails,
    this.setupScriptDetails,
    this.sourceS3Location,
    this.state,
  });

  factory AppBlock.fromJson(Map<String, dynamic> json) {
    return AppBlock(
      arn: json['Arn'] as String,
      name: json['Name'] as String,
      appBlockErrors: (json['AppBlockErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      packagingType: (json['PackagingType'] as String?)?.toPackagingType(),
      postSetupScriptDetails: json['PostSetupScriptDetails'] != null
          ? ScriptDetails.fromJson(
              json['PostSetupScriptDetails'] as Map<String, dynamic>)
          : null,
      setupScriptDetails: json['SetupScriptDetails'] != null
          ? ScriptDetails.fromJson(
              json['SetupScriptDetails'] as Map<String, dynamic>)
          : null,
      sourceS3Location: json['SourceS3Location'] != null
          ? S3Location.fromJson(
              json['SourceS3Location'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toAppBlockState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final appBlockErrors = this.appBlockErrors;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final packagingType = this.packagingType;
    final postSetupScriptDetails = this.postSetupScriptDetails;
    final setupScriptDetails = this.setupScriptDetails;
    final sourceS3Location = this.sourceS3Location;
    final state = this.state;
    return {
      'Arn': arn,
      'Name': name,
      if (appBlockErrors != null) 'AppBlockErrors': appBlockErrors,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (packagingType != null) 'PackagingType': packagingType.toValue(),
      if (postSetupScriptDetails != null)
        'PostSetupScriptDetails': postSetupScriptDetails,
      if (setupScriptDetails != null) 'SetupScriptDetails': setupScriptDetails,
      if (sourceS3Location != null) 'SourceS3Location': sourceS3Location,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Describes an app block builder.
class AppBlockBuilder {
  /// The ARN of the app block builder.
  final String arn;

  /// The instance type of the app block builder.
  final String instanceType;

  /// The name of the app block builder.
  final String name;

  /// The platform of the app block builder.
  ///
  /// <code>WINDOWS_SERVER_2019</code> is the only valid value.
  final AppBlockBuilderPlatformType platform;

  /// The state of the app block builder.
  final AppBlockBuilderState state;

  /// The VPC configuration for the app block builder.
  final VpcConfig vpcConfig;

  /// The list of interface VPC endpoint (interface endpoint) objects.
  /// Administrators can connect to the app block builder only through the
  /// specified endpoints.
  final List<AccessEndpoint>? accessEndpoints;

  /// The app block builder errors.
  final List<ResourceError>? appBlockBuilderErrors;

  /// The creation time of the app block builder.
  final DateTime? createdTime;

  /// The description of the app block builder.
  final String? description;

  /// The display name of the app block builder.
  final String? displayName;

  /// Indicates whether default internet access is enabled for the app block
  /// builder.
  final bool? enableDefaultInternetAccess;

  /// The ARN of the IAM role that is applied to the app block builder.
  final String? iamRoleArn;

  /// The state change reason.
  final AppBlockBuilderStateChangeReason? stateChangeReason;

  AppBlockBuilder({
    required this.arn,
    required this.instanceType,
    required this.name,
    required this.platform,
    required this.state,
    required this.vpcConfig,
    this.accessEndpoints,
    this.appBlockBuilderErrors,
    this.createdTime,
    this.description,
    this.displayName,
    this.enableDefaultInternetAccess,
    this.iamRoleArn,
    this.stateChangeReason,
  });

  factory AppBlockBuilder.fromJson(Map<String, dynamic> json) {
    return AppBlockBuilder(
      arn: json['Arn'] as String,
      instanceType: json['InstanceType'] as String,
      name: json['Name'] as String,
      platform: (json['Platform'] as String).toAppBlockBuilderPlatformType(),
      state: (json['State'] as String).toAppBlockBuilderState(),
      vpcConfig: VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
      accessEndpoints: (json['AccessEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => AccessEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      appBlockBuilderErrors: (json['AppBlockBuilderErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      enableDefaultInternetAccess: json['EnableDefaultInternetAccess'] as bool?,
      iamRoleArn: json['IamRoleArn'] as String?,
      stateChangeReason: json['StateChangeReason'] != null
          ? AppBlockBuilderStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final instanceType = this.instanceType;
    final name = this.name;
    final platform = this.platform;
    final state = this.state;
    final vpcConfig = this.vpcConfig;
    final accessEndpoints = this.accessEndpoints;
    final appBlockBuilderErrors = this.appBlockBuilderErrors;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final enableDefaultInternetAccess = this.enableDefaultInternetAccess;
    final iamRoleArn = this.iamRoleArn;
    final stateChangeReason = this.stateChangeReason;
    return {
      'Arn': arn,
      'InstanceType': instanceType,
      'Name': name,
      'Platform': platform.toValue(),
      'State': state.toValue(),
      'VpcConfig': vpcConfig,
      if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
      if (appBlockBuilderErrors != null)
        'AppBlockBuilderErrors': appBlockBuilderErrors,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (enableDefaultInternetAccess != null)
        'EnableDefaultInternetAccess': enableDefaultInternetAccess,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
    };
  }
}

/// Describes an association between an app block builder and app block.
class AppBlockBuilderAppBlockAssociation {
  /// The ARN of the app block.
  final String appBlockArn;

  /// The name of the app block builder.
  final String appBlockBuilderName;

  AppBlockBuilderAppBlockAssociation({
    required this.appBlockArn,
    required this.appBlockBuilderName,
  });

  factory AppBlockBuilderAppBlockAssociation.fromJson(
      Map<String, dynamic> json) {
    return AppBlockBuilderAppBlockAssociation(
      appBlockArn: json['AppBlockArn'] as String,
      appBlockBuilderName: json['AppBlockBuilderName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockArn = this.appBlockArn;
    final appBlockBuilderName = this.appBlockBuilderName;
    return {
      'AppBlockArn': appBlockArn,
      'AppBlockBuilderName': appBlockBuilderName,
    };
  }
}

enum AppBlockBuilderAttribute {
  iamRoleArn,
  accessEndpoints,
  vpcConfigurationSecurityGroupIds,
}

extension AppBlockBuilderAttributeValueExtension on AppBlockBuilderAttribute {
  String toValue() {
    switch (this) {
      case AppBlockBuilderAttribute.iamRoleArn:
        return 'IAM_ROLE_ARN';
      case AppBlockBuilderAttribute.accessEndpoints:
        return 'ACCESS_ENDPOINTS';
      case AppBlockBuilderAttribute.vpcConfigurationSecurityGroupIds:
        return 'VPC_CONFIGURATION_SECURITY_GROUP_IDS';
    }
  }
}

extension AppBlockBuilderAttributeFromString on String {
  AppBlockBuilderAttribute toAppBlockBuilderAttribute() {
    switch (this) {
      case 'IAM_ROLE_ARN':
        return AppBlockBuilderAttribute.iamRoleArn;
      case 'ACCESS_ENDPOINTS':
        return AppBlockBuilderAttribute.accessEndpoints;
      case 'VPC_CONFIGURATION_SECURITY_GROUP_IDS':
        return AppBlockBuilderAttribute.vpcConfigurationSecurityGroupIds;
    }
    throw Exception('$this is not known in enum AppBlockBuilderAttribute');
  }
}

enum AppBlockBuilderPlatformType {
  windowsServer_2019,
}

extension AppBlockBuilderPlatformTypeValueExtension
    on AppBlockBuilderPlatformType {
  String toValue() {
    switch (this) {
      case AppBlockBuilderPlatformType.windowsServer_2019:
        return 'WINDOWS_SERVER_2019';
    }
  }
}

extension AppBlockBuilderPlatformTypeFromString on String {
  AppBlockBuilderPlatformType toAppBlockBuilderPlatformType() {
    switch (this) {
      case 'WINDOWS_SERVER_2019':
        return AppBlockBuilderPlatformType.windowsServer_2019;
    }
    throw Exception('$this is not known in enum AppBlockBuilderPlatformType');
  }
}

enum AppBlockBuilderState {
  starting,
  running,
  stopping,
  stopped,
}

extension AppBlockBuilderStateValueExtension on AppBlockBuilderState {
  String toValue() {
    switch (this) {
      case AppBlockBuilderState.starting:
        return 'STARTING';
      case AppBlockBuilderState.running:
        return 'RUNNING';
      case AppBlockBuilderState.stopping:
        return 'STOPPING';
      case AppBlockBuilderState.stopped:
        return 'STOPPED';
    }
  }
}

extension AppBlockBuilderStateFromString on String {
  AppBlockBuilderState toAppBlockBuilderState() {
    switch (this) {
      case 'STARTING':
        return AppBlockBuilderState.starting;
      case 'RUNNING':
        return AppBlockBuilderState.running;
      case 'STOPPING':
        return AppBlockBuilderState.stopping;
      case 'STOPPED':
        return AppBlockBuilderState.stopped;
    }
    throw Exception('$this is not known in enum AppBlockBuilderState');
  }
}

/// Describes the reason why the last app block builder state change occurred.
class AppBlockBuilderStateChangeReason {
  /// The state change reason code.
  final AppBlockBuilderStateChangeReasonCode? code;

  /// The state change reason message.
  final String? message;

  AppBlockBuilderStateChangeReason({
    this.code,
    this.message,
  });

  factory AppBlockBuilderStateChangeReason.fromJson(Map<String, dynamic> json) {
    return AppBlockBuilderStateChangeReason(
      code: (json['Code'] as String?)?.toAppBlockBuilderStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum AppBlockBuilderStateChangeReasonCode {
  internalError,
}

extension AppBlockBuilderStateChangeReasonCodeValueExtension
    on AppBlockBuilderStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case AppBlockBuilderStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension AppBlockBuilderStateChangeReasonCodeFromString on String {
  AppBlockBuilderStateChangeReasonCode
      toAppBlockBuilderStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return AppBlockBuilderStateChangeReasonCode.internalError;
    }
    throw Exception(
        '$this is not known in enum AppBlockBuilderStateChangeReasonCode');
  }
}

enum AppBlockState {
  inactive,
  active,
}

extension AppBlockStateValueExtension on AppBlockState {
  String toValue() {
    switch (this) {
      case AppBlockState.inactive:
        return 'INACTIVE';
      case AppBlockState.active:
        return 'ACTIVE';
    }
  }
}

extension AppBlockStateFromString on String {
  AppBlockState toAppBlockState() {
    switch (this) {
      case 'INACTIVE':
        return AppBlockState.inactive;
      case 'ACTIVE':
        return AppBlockState.active;
    }
    throw Exception('$this is not known in enum AppBlockState');
  }
}

enum AppVisibility {
  all,
  associated,
}

extension AppVisibilityValueExtension on AppVisibility {
  String toValue() {
    switch (this) {
      case AppVisibility.all:
        return 'ALL';
      case AppVisibility.associated:
        return 'ASSOCIATED';
    }
  }
}

extension AppVisibilityFromString on String {
  AppVisibility toAppVisibility() {
    switch (this) {
      case 'ALL':
        return AppVisibility.all;
      case 'ASSOCIATED':
        return AppVisibility.associated;
    }
    throw Exception('$this is not known in enum AppVisibility');
  }
}

/// Describes an application in the application catalog.
class Application {
  /// The app block ARN of the application.
  final String? appBlockArn;

  /// The ARN of the application.
  final String? arn;

  /// The time at which the application was created within the app block.
  final DateTime? createdTime;

  /// The description of the application.
  final String? description;

  /// The application name to display.
  final String? displayName;

  /// If there is a problem, the application can be disabled after image creation.
  final bool? enabled;

  /// The S3 location of the application icon.
  final S3Location? iconS3Location;

  /// The URL for the application icon. This URL might be time-limited.
  final String? iconURL;

  /// The instance families for the application.
  final List<String>? instanceFamilies;

  /// The arguments that are passed to the application at launch.
  final String? launchParameters;

  /// The path to the application executable in the instance.
  final String? launchPath;

  /// Additional attributes that describe the application.
  final Map<String, String>? metadata;

  /// The name of the application.
  final String? name;

  /// The platforms on which the application can run.
  final List<PlatformType>? platforms;

  /// The working directory for the application.
  final String? workingDirectory;

  Application({
    this.appBlockArn,
    this.arn,
    this.createdTime,
    this.description,
    this.displayName,
    this.enabled,
    this.iconS3Location,
    this.iconURL,
    this.instanceFamilies,
    this.launchParameters,
    this.launchPath,
    this.metadata,
    this.name,
    this.platforms,
    this.workingDirectory,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      appBlockArn: json['AppBlockArn'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      enabled: json['Enabled'] as bool?,
      iconS3Location: json['IconS3Location'] != null
          ? S3Location.fromJson(json['IconS3Location'] as Map<String, dynamic>)
          : null,
      iconURL: json['IconURL'] as String?,
      instanceFamilies: (json['InstanceFamilies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      launchParameters: json['LaunchParameters'] as String?,
      launchPath: json['LaunchPath'] as String?,
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['Name'] as String?,
      platforms: (json['Platforms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPlatformType())
          .toList(),
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockArn = this.appBlockArn;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final enabled = this.enabled;
    final iconS3Location = this.iconS3Location;
    final iconURL = this.iconURL;
    final instanceFamilies = this.instanceFamilies;
    final launchParameters = this.launchParameters;
    final launchPath = this.launchPath;
    final metadata = this.metadata;
    final name = this.name;
    final platforms = this.platforms;
    final workingDirectory = this.workingDirectory;
    return {
      if (appBlockArn != null) 'AppBlockArn': appBlockArn,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (enabled != null) 'Enabled': enabled,
      if (iconS3Location != null) 'IconS3Location': iconS3Location,
      if (iconURL != null) 'IconURL': iconURL,
      if (instanceFamilies != null) 'InstanceFamilies': instanceFamilies,
      if (launchParameters != null) 'LaunchParameters': launchParameters,
      if (launchPath != null) 'LaunchPath': launchPath,
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
      if (platforms != null)
        'Platforms': platforms.map((e) => e.toValue()).toList(),
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

enum ApplicationAttribute {
  launchParameters,
  workingDirectory,
}

extension ApplicationAttributeValueExtension on ApplicationAttribute {
  String toValue() {
    switch (this) {
      case ApplicationAttribute.launchParameters:
        return 'LAUNCH_PARAMETERS';
      case ApplicationAttribute.workingDirectory:
        return 'WORKING_DIRECTORY';
    }
  }
}

extension ApplicationAttributeFromString on String {
  ApplicationAttribute toApplicationAttribute() {
    switch (this) {
      case 'LAUNCH_PARAMETERS':
        return ApplicationAttribute.launchParameters;
      case 'WORKING_DIRECTORY':
        return ApplicationAttribute.workingDirectory;
    }
    throw Exception('$this is not known in enum ApplicationAttribute');
  }
}

/// Describes the application fleet association.
class ApplicationFleetAssociation {
  /// The ARN of the application associated with the fleet.
  final String applicationArn;

  /// The name of the fleet associated with the application.
  final String fleetName;

  ApplicationFleetAssociation({
    required this.applicationArn,
    required this.fleetName,
  });

  factory ApplicationFleetAssociation.fromJson(Map<String, dynamic> json) {
    return ApplicationFleetAssociation(
      applicationArn: json['ApplicationArn'] as String,
      fleetName: json['FleetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final fleetName = this.fleetName;
    return {
      'ApplicationArn': applicationArn,
      'FleetName': fleetName,
    };
  }
}

/// The persistent application settings for users of a stack.
class ApplicationSettings {
  /// Enables or disables persistent application settings for users during their
  /// streaming sessions.
  final bool enabled;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored. You can allow the same persistent application settings
  /// to be used across multiple stacks by specifying the same settings group for
  /// each stack.
  final String? settingsGroup;

  ApplicationSettings({
    required this.enabled,
    this.settingsGroup,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final settingsGroup = this.settingsGroup;
    return {
      'Enabled': enabled,
      if (settingsGroup != null) 'SettingsGroup': settingsGroup,
    };
  }
}

/// Describes the persistent application settings for users of a stack.
class ApplicationSettingsResponse {
  /// Specifies whether persistent application settings are enabled for users
  /// during their streaming sessions.
  final bool? enabled;

  /// The S3 bucket where users’ persistent application settings are stored. When
  /// persistent application settings are enabled for the first time for an
  /// account in an AWS Region, an S3 bucket is created. The bucket is unique to
  /// the AWS account and the Region.
  final String? s3BucketName;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored.
  final String? settingsGroup;

  ApplicationSettingsResponse({
    this.enabled,
    this.s3BucketName,
    this.settingsGroup,
  });

  factory ApplicationSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ApplicationSettingsResponse(
      enabled: json['Enabled'] as bool?,
      s3BucketName: json['S3BucketName'] as String?,
      settingsGroup: json['SettingsGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final s3BucketName = this.s3BucketName;
    final settingsGroup = this.settingsGroup;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (settingsGroup != null) 'SettingsGroup': settingsGroup,
    };
  }
}

class AssociateAppBlockBuilderAppBlockResult {
  /// The list of app block builders associated with app blocks.
  final AppBlockBuilderAppBlockAssociation? appBlockBuilderAppBlockAssociation;

  AssociateAppBlockBuilderAppBlockResult({
    this.appBlockBuilderAppBlockAssociation,
  });

  factory AssociateAppBlockBuilderAppBlockResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateAppBlockBuilderAppBlockResult(
      appBlockBuilderAppBlockAssociation:
          json['AppBlockBuilderAppBlockAssociation'] != null
              ? AppBlockBuilderAppBlockAssociation.fromJson(
                  json['AppBlockBuilderAppBlockAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilderAppBlockAssociation =
        this.appBlockBuilderAppBlockAssociation;
    return {
      if (appBlockBuilderAppBlockAssociation != null)
        'AppBlockBuilderAppBlockAssociation':
            appBlockBuilderAppBlockAssociation,
    };
  }
}

class AssociateApplicationFleetResult {
  /// If fleet name is specified, this returns the list of applications that are
  /// associated to it. If application ARN is specified, this returns the list of
  /// fleets to which it is associated.
  final ApplicationFleetAssociation? applicationFleetAssociation;

  AssociateApplicationFleetResult({
    this.applicationFleetAssociation,
  });

  factory AssociateApplicationFleetResult.fromJson(Map<String, dynamic> json) {
    return AssociateApplicationFleetResult(
      applicationFleetAssociation: json['ApplicationFleetAssociation'] != null
          ? ApplicationFleetAssociation.fromJson(
              json['ApplicationFleetAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationFleetAssociation = this.applicationFleetAssociation;
    return {
      if (applicationFleetAssociation != null)
        'ApplicationFleetAssociation': applicationFleetAssociation,
    };
  }
}

class AssociateApplicationToEntitlementResult {
  AssociateApplicationToEntitlementResult();

  factory AssociateApplicationToEntitlementResult.fromJson(
      Map<String, dynamic> _) {
    return AssociateApplicationToEntitlementResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateFleetResult {
  AssociateFleetResult();

  factory AssociateFleetResult.fromJson(Map<String, dynamic> _) {
    return AssociateFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AuthenticationType {
  api,
  saml,
  userpool,
  awsAd,
}

extension AuthenticationTypeValueExtension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.api:
        return 'API';
      case AuthenticationType.saml:
        return 'SAML';
      case AuthenticationType.userpool:
        return 'USERPOOL';
      case AuthenticationType.awsAd:
        return 'AWS_AD';
    }
  }
}

extension AuthenticationTypeFromString on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'API':
        return AuthenticationType.api;
      case 'SAML':
        return AuthenticationType.saml;
      case 'USERPOOL':
        return AuthenticationType.userpool;
      case 'AWS_AD':
        return AuthenticationType.awsAd;
    }
    throw Exception('$this is not known in enum AuthenticationType');
  }
}

class BatchAssociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  final List<UserStackAssociationError>? errors;

  BatchAssociateUserStackResult({
    this.errors,
  });

  factory BatchAssociateUserStackResult.fromJson(Map<String, dynamic> json) {
    return BatchAssociateUserStackResult(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UserStackAssociationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class BatchDisassociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  final List<UserStackAssociationError>? errors;

  BatchDisassociateUserStackResult({
    this.errors,
  });

  factory BatchDisassociateUserStackResult.fromJson(Map<String, dynamic> json) {
    return BatchDisassociateUserStackResult(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UserStackAssociationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// The certificate-based authentication properties used to authenticate SAML
/// 2.0 Identity Provider (IdP) user identities to Active Directory
/// domain-joined streaming instances. Fallback is turned on by default when
/// certificate-based authentication is <b>Enabled</b> . Fallback allows users
/// to log in using their AD domain password if certificate-based authentication
/// is unsuccessful, or to unlock a desktop lock screen.
/// <b>Enabled_no_directory_login_fallback</b> enables certificate-based
/// authentication, but does not allow users to log in using their AD domain
/// password. Users will be disconnected to re-authenticate using certificates.
class CertificateBasedAuthProperties {
  /// The ARN of the AWS Certificate Manager Private CA resource.
  final String? certificateAuthorityArn;

  /// The status of the certificate-based authentication properties.
  final CertificateBasedAuthStatus? status;

  CertificateBasedAuthProperties({
    this.certificateAuthorityArn,
    this.status,
  });

  factory CertificateBasedAuthProperties.fromJson(Map<String, dynamic> json) {
    return CertificateBasedAuthProperties(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      status: (json['Status'] as String?)?.toCertificateBasedAuthStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final status = this.status;
    return {
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum CertificateBasedAuthStatus {
  disabled,
  enabled,
  enabledNoDirectoryLoginFallback,
}

extension CertificateBasedAuthStatusValueExtension
    on CertificateBasedAuthStatus {
  String toValue() {
    switch (this) {
      case CertificateBasedAuthStatus.disabled:
        return 'DISABLED';
      case CertificateBasedAuthStatus.enabled:
        return 'ENABLED';
      case CertificateBasedAuthStatus.enabledNoDirectoryLoginFallback:
        return 'ENABLED_NO_DIRECTORY_LOGIN_FALLBACK';
    }
  }
}

extension CertificateBasedAuthStatusFromString on String {
  CertificateBasedAuthStatus toCertificateBasedAuthStatus() {
    switch (this) {
      case 'DISABLED':
        return CertificateBasedAuthStatus.disabled;
      case 'ENABLED':
        return CertificateBasedAuthStatus.enabled;
      case 'ENABLED_NO_DIRECTORY_LOGIN_FALLBACK':
        return CertificateBasedAuthStatus.enabledNoDirectoryLoginFallback;
    }
    throw Exception('$this is not known in enum CertificateBasedAuthStatus');
  }
}

/// Describes the capacity for a fleet.
class ComputeCapacity {
  /// The desired number of streaming instances.
  final int? desiredInstances;

  /// The desired number of user sessions for a multi-session fleet. This is not
  /// allowed for single-session fleets.
  ///
  /// When you create a fleet, you must set either the DesiredSessions or
  /// DesiredInstances attribute, based on the type of fleet you create. You can’t
  /// define both attributes or leave both attributes blank.
  final int? desiredSessions;

  ComputeCapacity({
    this.desiredInstances,
    this.desiredSessions,
  });

  Map<String, dynamic> toJson() {
    final desiredInstances = this.desiredInstances;
    final desiredSessions = this.desiredSessions;
    return {
      if (desiredInstances != null) 'DesiredInstances': desiredInstances,
      if (desiredSessions != null) 'DesiredSessions': desiredSessions,
    };
  }
}

/// Describes the capacity status for a fleet.
class ComputeCapacityStatus {
  /// The desired number of streaming instances.
  final int desired;

  /// The number of user sessions currently being used for streaming sessions.
  /// This only applies to multi-session fleets.
  final int? activeUserSessions;

  /// The total number of session slots that are available for streaming or are
  /// currently streaming.
  ///
  /// ActualUserSessionCapacity = AvailableUserSessionCapacity +
  /// ActiveUserSessions
  ///
  /// This only applies to multi-session fleets.
  final int? actualUserSessions;

  /// The number of currently available instances that can be used to stream
  /// sessions.
  final int? available;

  /// The number of idle session slots currently available for user sessions.
  ///
  /// AvailableUserSessionCapacity = ActualUserSessionCapacity -
  /// ActiveUserSessions
  ///
  /// This only applies to multi-session fleets.
  final int? availableUserSessions;

  /// The total number of sessions slots that are either running or pending. This
  /// represents the total number of concurrent streaming sessions your fleet can
  /// support in a steady state.
  ///
  /// DesiredUserSessionCapacity = ActualUserSessionCapacity +
  /// PendingUserSessionCapacity
  ///
  /// This only applies to multi-session fleets.
  final int? desiredUserSessions;

  /// The number of instances in use for streaming.
  final int? inUse;

  /// The total number of simultaneous streaming instances that are running.
  final int? running;

  ComputeCapacityStatus({
    required this.desired,
    this.activeUserSessions,
    this.actualUserSessions,
    this.available,
    this.availableUserSessions,
    this.desiredUserSessions,
    this.inUse,
    this.running,
  });

  factory ComputeCapacityStatus.fromJson(Map<String, dynamic> json) {
    return ComputeCapacityStatus(
      desired: json['Desired'] as int,
      activeUserSessions: json['ActiveUserSessions'] as int?,
      actualUserSessions: json['ActualUserSessions'] as int?,
      available: json['Available'] as int?,
      availableUserSessions: json['AvailableUserSessions'] as int?,
      desiredUserSessions: json['DesiredUserSessions'] as int?,
      inUse: json['InUse'] as int?,
      running: json['Running'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final desired = this.desired;
    final activeUserSessions = this.activeUserSessions;
    final actualUserSessions = this.actualUserSessions;
    final available = this.available;
    final availableUserSessions = this.availableUserSessions;
    final desiredUserSessions = this.desiredUserSessions;
    final inUse = this.inUse;
    final running = this.running;
    return {
      'Desired': desired,
      if (activeUserSessions != null) 'ActiveUserSessions': activeUserSessions,
      if (actualUserSessions != null) 'ActualUserSessions': actualUserSessions,
      if (available != null) 'Available': available,
      if (availableUserSessions != null)
        'AvailableUserSessions': availableUserSessions,
      if (desiredUserSessions != null)
        'DesiredUserSessions': desiredUserSessions,
      if (inUse != null) 'InUse': inUse,
      if (running != null) 'Running': running,
    };
  }
}

class CopyImageResponse {
  /// The name of the destination image.
  final String? destinationImageName;

  CopyImageResponse({
    this.destinationImageName,
  });

  factory CopyImageResponse.fromJson(Map<String, dynamic> json) {
    return CopyImageResponse(
      destinationImageName: json['DestinationImageName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationImageName = this.destinationImageName;
    return {
      if (destinationImageName != null)
        'DestinationImageName': destinationImageName,
    };
  }
}

class CreateAppBlockBuilderResult {
  final AppBlockBuilder? appBlockBuilder;

  CreateAppBlockBuilderResult({
    this.appBlockBuilder,
  });

  factory CreateAppBlockBuilderResult.fromJson(Map<String, dynamic> json) {
    return CreateAppBlockBuilderResult(
      appBlockBuilder: json['AppBlockBuilder'] != null
          ? AppBlockBuilder.fromJson(
              json['AppBlockBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilder = this.appBlockBuilder;
    return {
      if (appBlockBuilder != null) 'AppBlockBuilder': appBlockBuilder,
    };
  }
}

class CreateAppBlockBuilderStreamingURLResult {
  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  final DateTime? expires;

  /// The URL to start the streaming session.
  final String? streamingURL;

  CreateAppBlockBuilderStreamingURLResult({
    this.expires,
    this.streamingURL,
  });

  factory CreateAppBlockBuilderStreamingURLResult.fromJson(
      Map<String, dynamic> json) {
    return CreateAppBlockBuilderStreamingURLResult(
      expires: timeStampFromJson(json['Expires']),
      streamingURL: json['StreamingURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expires = this.expires;
    final streamingURL = this.streamingURL;
    return {
      if (expires != null) 'Expires': unixTimestampToJson(expires),
      if (streamingURL != null) 'StreamingURL': streamingURL,
    };
  }
}

class CreateAppBlockResult {
  /// The app block.
  final AppBlock? appBlock;

  CreateAppBlockResult({
    this.appBlock,
  });

  factory CreateAppBlockResult.fromJson(Map<String, dynamic> json) {
    return CreateAppBlockResult(
      appBlock: json['AppBlock'] != null
          ? AppBlock.fromJson(json['AppBlock'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlock = this.appBlock;
    return {
      if (appBlock != null) 'AppBlock': appBlock,
    };
  }
}

class CreateApplicationResult {
  final Application? application;

  CreateApplicationResult({
    this.application,
  });

  factory CreateApplicationResult.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResult(
      application: json['Application'] != null
          ? Application.fromJson(json['Application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'Application': application,
    };
  }
}

class CreateDirectoryConfigResult {
  /// Information about the directory configuration.
  final DirectoryConfig? directoryConfig;

  CreateDirectoryConfigResult({
    this.directoryConfig,
  });

  factory CreateDirectoryConfigResult.fromJson(Map<String, dynamic> json) {
    return CreateDirectoryConfigResult(
      directoryConfig: json['DirectoryConfig'] != null
          ? DirectoryConfig.fromJson(
              json['DirectoryConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryConfig = this.directoryConfig;
    return {
      if (directoryConfig != null) 'DirectoryConfig': directoryConfig,
    };
  }
}

class CreateEntitlementResult {
  /// The entitlement.
  final Entitlement? entitlement;

  CreateEntitlementResult({
    this.entitlement,
  });

  factory CreateEntitlementResult.fromJson(Map<String, dynamic> json) {
    return CreateEntitlementResult(
      entitlement: json['Entitlement'] != null
          ? Entitlement.fromJson(json['Entitlement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlement = this.entitlement;
    return {
      if (entitlement != null) 'Entitlement': entitlement,
    };
  }
}

class CreateFleetResult {
  /// Information about the fleet.
  final Fleet? fleet;

  CreateFleetResult({
    this.fleet,
  });

  factory CreateFleetResult.fromJson(Map<String, dynamic> json) {
    return CreateFleetResult(
      fleet: json['Fleet'] != null
          ? Fleet.fromJson(json['Fleet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    return {
      if (fleet != null) 'Fleet': fleet,
    };
  }
}

class CreateImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder? imageBuilder;

  CreateImageBuilderResult({
    this.imageBuilder,
  });

  factory CreateImageBuilderResult.fromJson(Map<String, dynamic> json) {
    return CreateImageBuilderResult(
      imageBuilder: json['ImageBuilder'] != null
          ? ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuilder = this.imageBuilder;
    return {
      if (imageBuilder != null) 'ImageBuilder': imageBuilder,
    };
  }
}

class CreateImageBuilderStreamingURLResult {
  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  final DateTime? expires;

  /// The URL to start the AppStream 2.0 streaming session.
  final String? streamingURL;

  CreateImageBuilderStreamingURLResult({
    this.expires,
    this.streamingURL,
  });

  factory CreateImageBuilderStreamingURLResult.fromJson(
      Map<String, dynamic> json) {
    return CreateImageBuilderStreamingURLResult(
      expires: timeStampFromJson(json['Expires']),
      streamingURL: json['StreamingURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expires = this.expires;
    final streamingURL = this.streamingURL;
    return {
      if (expires != null) 'Expires': unixTimestampToJson(expires),
      if (streamingURL != null) 'StreamingURL': streamingURL,
    };
  }
}

class CreateStackResult {
  /// Information about the stack.
  final Stack? stack;

  CreateStackResult({
    this.stack,
  });

  factory CreateStackResult.fromJson(Map<String, dynamic> json) {
    return CreateStackResult(
      stack: json['Stack'] != null
          ? Stack.fromJson(json['Stack'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stack = this.stack;
    return {
      if (stack != null) 'Stack': stack,
    };
  }
}

class CreateStreamingURLResult {
  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  final DateTime? expires;

  /// The URL to start the AppStream 2.0 streaming session.
  final String? streamingURL;

  CreateStreamingURLResult({
    this.expires,
    this.streamingURL,
  });

  factory CreateStreamingURLResult.fromJson(Map<String, dynamic> json) {
    return CreateStreamingURLResult(
      expires: timeStampFromJson(json['Expires']),
      streamingURL: json['StreamingURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expires = this.expires;
    final streamingURL = this.streamingURL;
    return {
      if (expires != null) 'Expires': unixTimestampToJson(expires),
      if (streamingURL != null) 'StreamingURL': streamingURL,
    };
  }
}

class CreateUpdatedImageResult {
  /// Indicates whether a new image can be created.
  final bool? canUpdateImage;
  final Image? image;

  CreateUpdatedImageResult({
    this.canUpdateImage,
    this.image,
  });

  factory CreateUpdatedImageResult.fromJson(Map<String, dynamic> json) {
    return CreateUpdatedImageResult(
      canUpdateImage: json['canUpdateImage'] as bool?,
      image: json['image'] != null
          ? Image.fromJson(json['image'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final canUpdateImage = this.canUpdateImage;
    final image = this.image;
    return {
      if (canUpdateImage != null) 'canUpdateImage': canUpdateImage,
      if (image != null) 'image': image,
    };
  }
}

class CreateUsageReportSubscriptionResult {
  /// The Amazon S3 bucket where generated reports are stored.
  ///
  /// If you enabled on-instance session scripts and Amazon S3 logging for your
  /// session script configuration, AppStream 2.0 created an S3 bucket to store
  /// the script output. The bucket is unique to your account and Region. When you
  /// enable usage reporting in this case, AppStream 2.0 uses the same bucket to
  /// store your usage reports. If you haven't already enabled on-instance session
  /// scripts, when you enable usage reports, AppStream 2.0 creates a new S3
  /// bucket.
  final String? s3BucketName;

  /// The schedule for generating usage reports.
  final UsageReportSchedule? schedule;

  CreateUsageReportSubscriptionResult({
    this.s3BucketName,
    this.schedule,
  });

  factory CreateUsageReportSubscriptionResult.fromJson(
      Map<String, dynamic> json) {
    return CreateUsageReportSubscriptionResult(
      s3BucketName: json['S3BucketName'] as String?,
      schedule: (json['Schedule'] as String?)?.toUsageReportSchedule(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final schedule = this.schedule;
    return {
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (schedule != null) 'Schedule': schedule.toValue(),
    };
  }
}

class CreateUserResult {
  CreateUserResult();

  factory CreateUserResult.fromJson(Map<String, dynamic> _) {
    return CreateUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppBlockBuilderResult {
  DeleteAppBlockBuilderResult();

  factory DeleteAppBlockBuilderResult.fromJson(Map<String, dynamic> _) {
    return DeleteAppBlockBuilderResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppBlockResult {
  DeleteAppBlockResult();

  factory DeleteAppBlockResult.fromJson(Map<String, dynamic> _) {
    return DeleteAppBlockResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationResult {
  DeleteApplicationResult();

  factory DeleteApplicationResult.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDirectoryConfigResult {
  DeleteDirectoryConfigResult();

  factory DeleteDirectoryConfigResult.fromJson(Map<String, dynamic> _) {
    return DeleteDirectoryConfigResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEntitlementResult {
  DeleteEntitlementResult();

  factory DeleteEntitlementResult.fromJson(Map<String, dynamic> _) {
    return DeleteEntitlementResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFleetResult {
  DeleteFleetResult();

  factory DeleteFleetResult.fromJson(Map<String, dynamic> _) {
    return DeleteFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder? imageBuilder;

  DeleteImageBuilderResult({
    this.imageBuilder,
  });

  factory DeleteImageBuilderResult.fromJson(Map<String, dynamic> json) {
    return DeleteImageBuilderResult(
      imageBuilder: json['ImageBuilder'] != null
          ? ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuilder = this.imageBuilder;
    return {
      if (imageBuilder != null) 'ImageBuilder': imageBuilder,
    };
  }
}

class DeleteImagePermissionsResult {
  DeleteImagePermissionsResult();

  factory DeleteImagePermissionsResult.fromJson(Map<String, dynamic> _) {
    return DeleteImagePermissionsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteImageResult {
  /// Information about the image.
  final Image? image;

  DeleteImageResult({
    this.image,
  });

  factory DeleteImageResult.fromJson(Map<String, dynamic> json) {
    return DeleteImageResult(
      image: json['Image'] != null
          ? Image.fromJson(json['Image'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    return {
      if (image != null) 'Image': image,
    };
  }
}

class DeleteStackResult {
  DeleteStackResult();

  factory DeleteStackResult.fromJson(Map<String, dynamic> _) {
    return DeleteStackResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUsageReportSubscriptionResult {
  DeleteUsageReportSubscriptionResult();

  factory DeleteUsageReportSubscriptionResult.fromJson(Map<String, dynamic> _) {
    return DeleteUsageReportSubscriptionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserResult {
  DeleteUserResult();

  factory DeleteUserResult.fromJson(Map<String, dynamic> _) {
    return DeleteUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAppBlockBuilderAppBlockAssociationsResult {
  /// This list of app block builders associated with app blocks.
  final List<AppBlockBuilderAppBlockAssociation>?
      appBlockBuilderAppBlockAssociations;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeAppBlockBuilderAppBlockAssociationsResult({
    this.appBlockBuilderAppBlockAssociations,
    this.nextToken,
  });

  factory DescribeAppBlockBuilderAppBlockAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppBlockBuilderAppBlockAssociationsResult(
      appBlockBuilderAppBlockAssociations:
          (json['AppBlockBuilderAppBlockAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => AppBlockBuilderAppBlockAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilderAppBlockAssociations =
        this.appBlockBuilderAppBlockAssociations;
    final nextToken = this.nextToken;
    return {
      if (appBlockBuilderAppBlockAssociations != null)
        'AppBlockBuilderAppBlockAssociations':
            appBlockBuilderAppBlockAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAppBlockBuildersResult {
  /// The list that describes one or more app block builders.
  final List<AppBlockBuilder>? appBlockBuilders;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeAppBlockBuildersResult({
    this.appBlockBuilders,
    this.nextToken,
  });

  factory DescribeAppBlockBuildersResult.fromJson(Map<String, dynamic> json) {
    return DescribeAppBlockBuildersResult(
      appBlockBuilders: (json['AppBlockBuilders'] as List?)
          ?.whereNotNull()
          .map((e) => AppBlockBuilder.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilders = this.appBlockBuilders;
    final nextToken = this.nextToken;
    return {
      if (appBlockBuilders != null) 'AppBlockBuilders': appBlockBuilders,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAppBlocksResult {
  /// The app blocks in the list.
  final List<AppBlock>? appBlocks;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeAppBlocksResult({
    this.appBlocks,
    this.nextToken,
  });

  factory DescribeAppBlocksResult.fromJson(Map<String, dynamic> json) {
    return DescribeAppBlocksResult(
      appBlocks: (json['AppBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => AppBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlocks = this.appBlocks;
    final nextToken = this.nextToken;
    return {
      if (appBlocks != null) 'AppBlocks': appBlocks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeApplicationFleetAssociationsResult {
  /// The application fleet associations in the list.
  final List<ApplicationFleetAssociation>? applicationFleetAssociations;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeApplicationFleetAssociationsResult({
    this.applicationFleetAssociations,
    this.nextToken,
  });

  factory DescribeApplicationFleetAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationFleetAssociationsResult(
      applicationFleetAssociations: (json['ApplicationFleetAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationFleetAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationFleetAssociations = this.applicationFleetAssociations;
    final nextToken = this.nextToken;
    return {
      if (applicationFleetAssociations != null)
        'ApplicationFleetAssociations': applicationFleetAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeApplicationsResult {
  /// The applications in the list.
  final List<Application>? applications;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeApplicationsResult({
    this.applications,
    this.nextToken,
  });

  factory DescribeApplicationsResult.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationsResult(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'Applications': applications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeDirectoryConfigsResult {
  /// Information about the directory configurations. Note that although the
  /// response syntax in this topic includes the account password, this password
  /// is not returned in the actual response.
  final List<DirectoryConfig>? directoryConfigs;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  DescribeDirectoryConfigsResult({
    this.directoryConfigs,
    this.nextToken,
  });

  factory DescribeDirectoryConfigsResult.fromJson(Map<String, dynamic> json) {
    return DescribeDirectoryConfigsResult(
      directoryConfigs: (json['DirectoryConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => DirectoryConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryConfigs = this.directoryConfigs;
    final nextToken = this.nextToken;
    return {
      if (directoryConfigs != null) 'DirectoryConfigs': directoryConfigs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeEntitlementsResult {
  /// The entitlements.
  final List<Entitlement>? entitlements;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  DescribeEntitlementsResult({
    this.entitlements,
    this.nextToken,
  });

  factory DescribeEntitlementsResult.fromJson(Map<String, dynamic> json) {
    return DescribeEntitlementsResult(
      entitlements: (json['Entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    final nextToken = this.nextToken;
    return {
      if (entitlements != null) 'Entitlements': entitlements,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeFleetsResult {
  /// Information about the fleets.
  final List<Fleet>? fleets;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  DescribeFleetsResult({
    this.fleets,
    this.nextToken,
  });

  factory DescribeFleetsResult.fromJson(Map<String, dynamic> json) {
    return DescribeFleetsResult(
      fleets: (json['Fleets'] as List?)
          ?.whereNotNull()
          .map((e) => Fleet.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final nextToken = this.nextToken;
    return {
      if (fleets != null) 'Fleets': fleets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeImageBuildersResult {
  /// Information about the image builders.
  final List<ImageBuilder>? imageBuilders;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  DescribeImageBuildersResult({
    this.imageBuilders,
    this.nextToken,
  });

  factory DescribeImageBuildersResult.fromJson(Map<String, dynamic> json) {
    return DescribeImageBuildersResult(
      imageBuilders: (json['ImageBuilders'] as List?)
          ?.whereNotNull()
          .map((e) => ImageBuilder.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuilders = this.imageBuilders;
    final nextToken = this.nextToken;
    return {
      if (imageBuilders != null) 'ImageBuilders': imageBuilders,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeImagePermissionsResult {
  /// The name of the private image.
  final String? name;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The permissions for a private image that you own.
  final List<SharedImagePermissions>? sharedImagePermissionsList;

  DescribeImagePermissionsResult({
    this.name,
    this.nextToken,
    this.sharedImagePermissionsList,
  });

  factory DescribeImagePermissionsResult.fromJson(Map<String, dynamic> json) {
    return DescribeImagePermissionsResult(
      name: json['Name'] as String?,
      nextToken: json['NextToken'] as String?,
      sharedImagePermissionsList: (json['SharedImagePermissionsList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SharedImagePermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final nextToken = this.nextToken;
    final sharedImagePermissionsList = this.sharedImagePermissionsList;
    return {
      if (name != null) 'Name': name,
      if (nextToken != null) 'NextToken': nextToken,
      if (sharedImagePermissionsList != null)
        'SharedImagePermissionsList': sharedImagePermissionsList,
    };
  }
}

class DescribeImagesResult {
  /// Information about the images.
  final List<Image>? images;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  DescribeImagesResult({
    this.images,
    this.nextToken,
  });

  factory DescribeImagesResult.fromJson(Map<String, dynamic> json) {
    return DescribeImagesResult(
      images: (json['Images'] as List?)
          ?.whereNotNull()
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final images = this.images;
    final nextToken = this.nextToken;
    return {
      if (images != null) 'Images': images,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeSessionsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// Information about the streaming sessions.
  final List<Session>? sessions;

  DescribeSessionsResult({
    this.nextToken,
    this.sessions,
  });

  factory DescribeSessionsResult.fromJson(Map<String, dynamic> json) {
    return DescribeSessionsResult(
      nextToken: json['NextToken'] as String?,
      sessions: (json['Sessions'] as List?)
          ?.whereNotNull()
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sessions != null) 'Sessions': sessions,
    };
  }
}

class DescribeStacksResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// Information about the stacks.
  final List<Stack>? stacks;

  DescribeStacksResult({
    this.nextToken,
    this.stacks,
  });

  factory DescribeStacksResult.fromJson(Map<String, dynamic> json) {
    return DescribeStacksResult(
      nextToken: json['NextToken'] as String?,
      stacks: (json['Stacks'] as List?)
          ?.whereNotNull()
          .map((e) => Stack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stacks = this.stacks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stacks != null) 'Stacks': stacks,
    };
  }
}

class DescribeUsageReportSubscriptionsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// Information about the usage report subscription.
  final List<UsageReportSubscription>? usageReportSubscriptions;

  DescribeUsageReportSubscriptionsResult({
    this.nextToken,
    this.usageReportSubscriptions,
  });

  factory DescribeUsageReportSubscriptionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeUsageReportSubscriptionsResult(
      nextToken: json['NextToken'] as String?,
      usageReportSubscriptions: (json['UsageReportSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UsageReportSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final usageReportSubscriptions = this.usageReportSubscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (usageReportSubscriptions != null)
        'UsageReportSubscriptions': usageReportSubscriptions,
    };
  }
}

class DescribeUserStackAssociationsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The UserStackAssociation objects.
  final List<UserStackAssociation>? userStackAssociations;

  DescribeUserStackAssociationsResult({
    this.nextToken,
    this.userStackAssociations,
  });

  factory DescribeUserStackAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeUserStackAssociationsResult(
      nextToken: json['NextToken'] as String?,
      userStackAssociations: (json['UserStackAssociations'] as List?)
          ?.whereNotNull()
          .map((e) => UserStackAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userStackAssociations = this.userStackAssociations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (userStackAssociations != null)
        'UserStackAssociations': userStackAssociations,
    };
  }
}

class DescribeUsersResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// Information about users in the user pool.
  final List<User>? users;

  DescribeUsersResult({
    this.nextToken,
    this.users,
  });

  factory DescribeUsersResult.fromJson(Map<String, dynamic> json) {
    return DescribeUsersResult(
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

/// Describes the configuration information required to join fleets and image
/// builders to Microsoft Active Directory domains.
class DirectoryConfig {
  /// The fully qualified name of the directory (for example, corp.example.com).
  final String directoryName;

  /// The certificate-based authentication properties used to authenticate SAML
  /// 2.0 Identity Provider (IdP) user identities to Active Directory
  /// domain-joined streaming instances. Fallback is turned on by default when
  /// certificate-based authentication is <b>Enabled</b> . Fallback allows users
  /// to log in using their AD domain password if certificate-based authentication
  /// is unsuccessful, or to unlock a desktop lock screen.
  /// <b>Enabled_no_directory_login_fallback</b> enables certificate-based
  /// authentication, but does not allow users to log in using their AD domain
  /// password. Users will be disconnected to re-authenticate using certificates.
  final CertificateBasedAuthProperties? certificateBasedAuthProperties;

  /// The time the directory configuration was created.
  final DateTime? createdTime;

  /// The distinguished names of the organizational units for computer accounts.
  final List<String>? organizationalUnitDistinguishedNames;

  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  final ServiceAccountCredentials? serviceAccountCredentials;

  DirectoryConfig({
    required this.directoryName,
    this.certificateBasedAuthProperties,
    this.createdTime,
    this.organizationalUnitDistinguishedNames,
    this.serviceAccountCredentials,
  });

  factory DirectoryConfig.fromJson(Map<String, dynamic> json) {
    return DirectoryConfig(
      directoryName: json['DirectoryName'] as String,
      certificateBasedAuthProperties: json['CertificateBasedAuthProperties'] !=
              null
          ? CertificateBasedAuthProperties.fromJson(
              json['CertificateBasedAuthProperties'] as Map<String, dynamic>)
          : null,
      createdTime: timeStampFromJson(json['CreatedTime']),
      organizationalUnitDistinguishedNames:
          (json['OrganizationalUnitDistinguishedNames'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      serviceAccountCredentials: json['ServiceAccountCredentials'] != null
          ? ServiceAccountCredentials.fromJson(
              json['ServiceAccountCredentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryName = this.directoryName;
    final certificateBasedAuthProperties = this.certificateBasedAuthProperties;
    final createdTime = this.createdTime;
    final organizationalUnitDistinguishedNames =
        this.organizationalUnitDistinguishedNames;
    final serviceAccountCredentials = this.serviceAccountCredentials;
    return {
      'DirectoryName': directoryName,
      if (certificateBasedAuthProperties != null)
        'CertificateBasedAuthProperties': certificateBasedAuthProperties,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (organizationalUnitDistinguishedNames != null)
        'OrganizationalUnitDistinguishedNames':
            organizationalUnitDistinguishedNames,
      if (serviceAccountCredentials != null)
        'ServiceAccountCredentials': serviceAccountCredentials,
    };
  }
}

class DisableUserResult {
  DisableUserResult();

  factory DisableUserResult.fromJson(Map<String, dynamic> _) {
    return DisableUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateAppBlockBuilderAppBlockResult {
  DisassociateAppBlockBuilderAppBlockResult();

  factory DisassociateAppBlockBuilderAppBlockResult.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAppBlockBuilderAppBlockResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateApplicationFleetResult {
  DisassociateApplicationFleetResult();

  factory DisassociateApplicationFleetResult.fromJson(Map<String, dynamic> _) {
    return DisassociateApplicationFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateApplicationFromEntitlementResult {
  DisassociateApplicationFromEntitlementResult();

  factory DisassociateApplicationFromEntitlementResult.fromJson(
      Map<String, dynamic> _) {
    return DisassociateApplicationFromEntitlementResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFleetResult {
  DisassociateFleetResult();

  factory DisassociateFleetResult.fromJson(Map<String, dynamic> _) {
    return DisassociateFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the configuration information required to join fleets and image
/// builders to Microsoft Active Directory domains.
class DomainJoinInfo {
  /// The fully qualified name of the directory (for example, corp.example.com).
  final String? directoryName;

  /// The distinguished name of the organizational unit for computer accounts.
  final String? organizationalUnitDistinguishedName;

  DomainJoinInfo({
    this.directoryName,
    this.organizationalUnitDistinguishedName,
  });

  factory DomainJoinInfo.fromJson(Map<String, dynamic> json) {
    return DomainJoinInfo(
      directoryName: json['DirectoryName'] as String?,
      organizationalUnitDistinguishedName:
          json['OrganizationalUnitDistinguishedName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryName = this.directoryName;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    return {
      if (directoryName != null) 'DirectoryName': directoryName,
      if (organizationalUnitDistinguishedName != null)
        'OrganizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
    };
  }
}

class EnableUserResult {
  EnableUserResult();

  factory EnableUserResult.fromJson(Map<String, dynamic> _) {
    return EnableUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The application associated to an entitlement. Access is controlled based on
/// user attributes.
class EntitledApplication {
  /// The identifier of the application.
  final String applicationIdentifier;

  EntitledApplication({
    required this.applicationIdentifier,
  });

  factory EntitledApplication.fromJson(Map<String, dynamic> json) {
    return EntitledApplication(
      applicationIdentifier: json['ApplicationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationIdentifier = this.applicationIdentifier;
    return {
      'ApplicationIdentifier': applicationIdentifier,
    };
  }
}

/// Specifies an entitlement. Entitlements control access to specific
/// applications within a stack, based on user attributes. Entitlements apply to
/// SAML 2.0 federated user identities. Amazon AppStream 2.0 user pool and
/// streaming URL users are entitled to all applications in a stack.
/// Entitlements don't apply to the desktop stream view application, or to
/// applications managed by a dynamic app provider using the Dynamic Application
/// Framework.
class Entitlement {
  /// Specifies whether all or selected apps are entitled.
  final AppVisibility appVisibility;

  /// The attributes of the entitlement.
  final List<EntitlementAttribute> attributes;

  /// The name of the entitlement.
  final String name;

  /// The name of the stack with which the entitlement is associated.
  final String stackName;

  /// The time when the entitlement was created.
  final DateTime? createdTime;

  /// The description of the entitlement.
  final String? description;

  /// The time when the entitlement was last modified.
  final DateTime? lastModifiedTime;

  Entitlement({
    required this.appVisibility,
    required this.attributes,
    required this.name,
    required this.stackName,
    this.createdTime,
    this.description,
    this.lastModifiedTime,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return Entitlement(
      appVisibility: (json['AppVisibility'] as String).toAppVisibility(),
      attributes: (json['Attributes'] as List)
          .whereNotNull()
          .map((e) => EntitlementAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String,
      stackName: json['StackName'] as String,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final appVisibility = this.appVisibility;
    final attributes = this.attributes;
    final name = this.name;
    final stackName = this.stackName;
    final createdTime = this.createdTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'AppVisibility': appVisibility.toValue(),
      'Attributes': attributes,
      'Name': name,
      'StackName': stackName,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// An attribute associated with an entitlement. Application entitlements work
/// by matching a supported SAML 2.0 attribute name to a value when a user
/// identity federates to an Amazon AppStream 2.0 SAML application.
class EntitlementAttribute {
  /// A supported AWS IAM SAML <code>PrincipalTag</code> attribute that is matched
  /// to the associated value when a user identity federates into an Amazon
  /// AppStream 2.0 SAML application.
  ///
  /// The following are valid values:
  ///
  /// <ul>
  /// <li>
  /// roles
  /// </li>
  /// <li>
  /// department
  /// </li>
  /// <li>
  /// organization
  /// </li>
  /// <li>
  /// groups
  /// </li>
  /// <li>
  /// title
  /// </li>
  /// <li>
  /// costCenter
  /// </li>
  /// <li>
  /// userType
  /// </li>
  /// </ul>
  ///
  final String name;

  /// A value that is matched to a supported SAML attribute name when a user
  /// identity federates into an Amazon AppStream 2.0 SAML application.
  final String value;

  EntitlementAttribute({
    required this.name,
    required this.value,
  });

  factory EntitlementAttribute.fromJson(Map<String, dynamic> json) {
    return EntitlementAttribute(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The error details.
class ErrorDetails {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? errorMessage;

  ErrorDetails({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class ExpireSessionResult {
  ExpireSessionResult();

  factory ExpireSessionResult.fromJson(Map<String, dynamic> _) {
    return ExpireSessionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes a fleet.
class Fleet {
  /// The Amazon Resource Name (ARN) for the fleet.
  final String arn;

  /// The capacity status for the fleet.
  final ComputeCapacityStatus computeCapacityStatus;

  /// The instance type to use when launching fleet instances. The following
  /// instance types are available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.compute.large
  /// </li>
  /// <li>
  /// stream.compute.xlarge
  /// </li>
  /// <li>
  /// stream.compute.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.4xlarge
  /// </li>
  /// <li>
  /// stream.compute.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.large
  /// </li>
  /// <li>
  /// stream.memory.xlarge
  /// </li>
  /// <li>
  /// stream.memory.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.4xlarge
  /// </li>
  /// <li>
  /// stream.memory.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.large
  /// </li>
  /// <li>
  /// stream.memory.z1d.xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.3xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.6xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.large
  /// </li>
  /// <li>
  /// stream.graphics-design.xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-desktop.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.16xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.16xlarge
  /// </li>
  /// </ul>
  final String instanceType;

  /// The name of the fleet.
  final String name;

  /// The current state for the fleet.
  final FleetState state;

  /// The time the fleet was created.
  final DateTime? createdTime;

  /// The description to display.
  final String? description;

  /// The amount of time that a streaming session remains active after users
  /// disconnect. If they try to reconnect to the streaming session after a
  /// disconnection or network interruption within this time interval, they are
  /// connected to their previous session. Otherwise, they are connected to a new
  /// session with a new streaming instance.
  ///
  /// Specify a value between 60 and 360000.
  final int? disconnectTimeoutInSeconds;

  /// The fleet name to display.
  final String? displayName;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// fleet to a Microsoft Active Directory domain.
  final DomainJoinInfo? domainJoinInfo;

  /// Indicates whether default internet access is enabled for the fleet.
  final bool? enableDefaultInternetAccess;

  /// The fleet errors.
  final List<FleetError>? fleetErrors;

  /// The fleet type.
  /// <dl> <dt>ALWAYS_ON</dt> <dd>
  /// Provides users with instant-on access to their apps. You are charged for all
  /// running instances in your fleet, even if no users are streaming apps.
  /// </dd> <dt>ON_DEMAND</dt> <dd>
  /// Provide users with access to applications after they connect, which takes
  /// one to two minutes. You are charged for instance streaming when users are
  /// connected and a small hourly fee for instances that are not streaming apps.
  /// </dd> </dl>
  final FleetType? fleetType;

  /// The ARN of the IAM role that is applied to the fleet. To assume a role, the
  /// fleet instance calls the AWS Security Token Service (STS)
  /// <code>AssumeRole</code> API operation and passes the ARN of the role to use.
  /// The operation creates a new session with temporary credentials. AppStream
  /// 2.0 retrieves the temporary credentials and creates the
  /// <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  final String? iamRoleArn;

  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the
  /// <code>DisconnectTimeoutInSeconds</code> time interval begins. Users are
  /// notified before they are disconnected due to inactivity. If users try to
  /// reconnect to the streaming session before the time interval specified in
  /// <code>DisconnectTimeoutInSeconds</code> elapses, they are connected to their
  /// previous session. Users are considered idle when they stop providing
  /// keyboard or mouse input during their streaming session. File uploads and
  /// downloads, audio in, audio out, and pixels changing do not qualify as user
  /// activity. If users continue to be idle after the time interval in
  /// <code>IdleDisconnectTimeoutInSeconds</code> elapses, they are disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a value
  /// of 0. Otherwise, specify a value between 60 and 3600. The default value is
  /// 0.
  /// <note>
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120, and
  /// 180). If you don't do this, the value is rounded to the nearest minute. For
  /// example, if you specify a value of 70, users are disconnected after 1 minute
  /// of inactivity. If you specify a value that is at the midpoint between two
  /// different minutes, the value is rounded up. For example, if you specify a
  /// value of 90, users are disconnected after 2 minutes of inactivity.
  /// </note>
  final int? idleDisconnectTimeoutInSeconds;

  /// The ARN for the public, private, or shared image.
  final String? imageArn;

  /// The name of the image used to create the fleet.
  final String? imageName;

  /// The maximum number of concurrent sessions for the fleet.
  final int? maxConcurrentSessions;

  /// The maximum number of user sessions on an instance. This only applies to
  /// multi-session fleets.
  final int? maxSessionsPerInstance;

  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  final int? maxUserDurationInSeconds;

  /// The platform of the fleet.
  final PlatformType? platform;

  /// The S3 location of the session scripts configuration zip file. This only
  /// applies to Elastic fleets.
  final S3Location? sessionScriptS3Location;

  /// The AppStream 2.0 view that is displayed to your users when they stream from
  /// the fleet. When <code>APP</code> is specified, only the windows of
  /// applications opened by users display. When <code>DESKTOP</code> is
  /// specified, the standard desktop that is provided by the operating system
  /// displays.
  ///
  /// The default value is <code>APP</code>.
  final StreamView? streamView;

  /// The USB device filter strings associated with the fleet.
  final List<String>? usbDeviceFilterStrings;

  /// The VPC configuration for the fleet.
  final VpcConfig? vpcConfig;

  Fleet({
    required this.arn,
    required this.computeCapacityStatus,
    required this.instanceType,
    required this.name,
    required this.state,
    this.createdTime,
    this.description,
    this.disconnectTimeoutInSeconds,
    this.displayName,
    this.domainJoinInfo,
    this.enableDefaultInternetAccess,
    this.fleetErrors,
    this.fleetType,
    this.iamRoleArn,
    this.idleDisconnectTimeoutInSeconds,
    this.imageArn,
    this.imageName,
    this.maxConcurrentSessions,
    this.maxSessionsPerInstance,
    this.maxUserDurationInSeconds,
    this.platform,
    this.sessionScriptS3Location,
    this.streamView,
    this.usbDeviceFilterStrings,
    this.vpcConfig,
  });

  factory Fleet.fromJson(Map<String, dynamic> json) {
    return Fleet(
      arn: json['Arn'] as String,
      computeCapacityStatus: ComputeCapacityStatus.fromJson(
          json['ComputeCapacityStatus'] as Map<String, dynamic>),
      instanceType: json['InstanceType'] as String,
      name: json['Name'] as String,
      state: (json['State'] as String).toFleetState(),
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      disconnectTimeoutInSeconds: json['DisconnectTimeoutInSeconds'] as int?,
      displayName: json['DisplayName'] as String?,
      domainJoinInfo: json['DomainJoinInfo'] != null
          ? DomainJoinInfo.fromJson(
              json['DomainJoinInfo'] as Map<String, dynamic>)
          : null,
      enableDefaultInternetAccess: json['EnableDefaultInternetAccess'] as bool?,
      fleetErrors: (json['FleetErrors'] as List?)
          ?.whereNotNull()
          .map((e) => FleetError.fromJson(e as Map<String, dynamic>))
          .toList(),
      fleetType: (json['FleetType'] as String?)?.toFleetType(),
      iamRoleArn: json['IamRoleArn'] as String?,
      idleDisconnectTimeoutInSeconds:
          json['IdleDisconnectTimeoutInSeconds'] as int?,
      imageArn: json['ImageArn'] as String?,
      imageName: json['ImageName'] as String?,
      maxConcurrentSessions: json['MaxConcurrentSessions'] as int?,
      maxSessionsPerInstance: json['MaxSessionsPerInstance'] as int?,
      maxUserDurationInSeconds: json['MaxUserDurationInSeconds'] as int?,
      platform: (json['Platform'] as String?)?.toPlatformType(),
      sessionScriptS3Location: json['SessionScriptS3Location'] != null
          ? S3Location.fromJson(
              json['SessionScriptS3Location'] as Map<String, dynamic>)
          : null,
      streamView: (json['StreamView'] as String?)?.toStreamView(),
      usbDeviceFilterStrings: (json['UsbDeviceFilterStrings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final computeCapacityStatus = this.computeCapacityStatus;
    final instanceType = this.instanceType;
    final name = this.name;
    final state = this.state;
    final createdTime = this.createdTime;
    final description = this.description;
    final disconnectTimeoutInSeconds = this.disconnectTimeoutInSeconds;
    final displayName = this.displayName;
    final domainJoinInfo = this.domainJoinInfo;
    final enableDefaultInternetAccess = this.enableDefaultInternetAccess;
    final fleetErrors = this.fleetErrors;
    final fleetType = this.fleetType;
    final iamRoleArn = this.iamRoleArn;
    final idleDisconnectTimeoutInSeconds = this.idleDisconnectTimeoutInSeconds;
    final imageArn = this.imageArn;
    final imageName = this.imageName;
    final maxConcurrentSessions = this.maxConcurrentSessions;
    final maxSessionsPerInstance = this.maxSessionsPerInstance;
    final maxUserDurationInSeconds = this.maxUserDurationInSeconds;
    final platform = this.platform;
    final sessionScriptS3Location = this.sessionScriptS3Location;
    final streamView = this.streamView;
    final usbDeviceFilterStrings = this.usbDeviceFilterStrings;
    final vpcConfig = this.vpcConfig;
    return {
      'Arn': arn,
      'ComputeCapacityStatus': computeCapacityStatus,
      'InstanceType': instanceType,
      'Name': name,
      'State': state.toValue(),
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (disconnectTimeoutInSeconds != null)
        'DisconnectTimeoutInSeconds': disconnectTimeoutInSeconds,
      if (displayName != null) 'DisplayName': displayName,
      if (domainJoinInfo != null) 'DomainJoinInfo': domainJoinInfo,
      if (enableDefaultInternetAccess != null)
        'EnableDefaultInternetAccess': enableDefaultInternetAccess,
      if (fleetErrors != null) 'FleetErrors': fleetErrors,
      if (fleetType != null) 'FleetType': fleetType.toValue(),
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (idleDisconnectTimeoutInSeconds != null)
        'IdleDisconnectTimeoutInSeconds': idleDisconnectTimeoutInSeconds,
      if (imageArn != null) 'ImageArn': imageArn,
      if (imageName != null) 'ImageName': imageName,
      if (maxConcurrentSessions != null)
        'MaxConcurrentSessions': maxConcurrentSessions,
      if (maxSessionsPerInstance != null)
        'MaxSessionsPerInstance': maxSessionsPerInstance,
      if (maxUserDurationInSeconds != null)
        'MaxUserDurationInSeconds': maxUserDurationInSeconds,
      if (platform != null) 'Platform': platform.toValue(),
      if (sessionScriptS3Location != null)
        'SessionScriptS3Location': sessionScriptS3Location,
      if (streamView != null) 'StreamView': streamView.toValue(),
      if (usbDeviceFilterStrings != null)
        'UsbDeviceFilterStrings': usbDeviceFilterStrings,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// The fleet attribute.
enum FleetAttribute {
  vpcConfiguration,
  vpcConfigurationSecurityGroupIds,
  domainJoinInfo,
  iamRoleArn,
  usbDeviceFilterStrings,
  sessionScriptS3Location,
  maxSessionsPerInstance,
}

extension FleetAttributeValueExtension on FleetAttribute {
  String toValue() {
    switch (this) {
      case FleetAttribute.vpcConfiguration:
        return 'VPC_CONFIGURATION';
      case FleetAttribute.vpcConfigurationSecurityGroupIds:
        return 'VPC_CONFIGURATION_SECURITY_GROUP_IDS';
      case FleetAttribute.domainJoinInfo:
        return 'DOMAIN_JOIN_INFO';
      case FleetAttribute.iamRoleArn:
        return 'IAM_ROLE_ARN';
      case FleetAttribute.usbDeviceFilterStrings:
        return 'USB_DEVICE_FILTER_STRINGS';
      case FleetAttribute.sessionScriptS3Location:
        return 'SESSION_SCRIPT_S3_LOCATION';
      case FleetAttribute.maxSessionsPerInstance:
        return 'MAX_SESSIONS_PER_INSTANCE';
    }
  }
}

extension FleetAttributeFromString on String {
  FleetAttribute toFleetAttribute() {
    switch (this) {
      case 'VPC_CONFIGURATION':
        return FleetAttribute.vpcConfiguration;
      case 'VPC_CONFIGURATION_SECURITY_GROUP_IDS':
        return FleetAttribute.vpcConfigurationSecurityGroupIds;
      case 'DOMAIN_JOIN_INFO':
        return FleetAttribute.domainJoinInfo;
      case 'IAM_ROLE_ARN':
        return FleetAttribute.iamRoleArn;
      case 'USB_DEVICE_FILTER_STRINGS':
        return FleetAttribute.usbDeviceFilterStrings;
      case 'SESSION_SCRIPT_S3_LOCATION':
        return FleetAttribute.sessionScriptS3Location;
      case 'MAX_SESSIONS_PER_INSTANCE':
        return FleetAttribute.maxSessionsPerInstance;
    }
    throw Exception('$this is not known in enum FleetAttribute');
  }
}

/// Describes a fleet error.
class FleetError {
  /// The error code.
  final FleetErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  FleetError({
    this.errorCode,
    this.errorMessage,
  });

  factory FleetError.fromJson(Map<String, dynamic> json) {
    return FleetError(
      errorCode: (json['ErrorCode'] as String?)?.toFleetErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

enum FleetErrorCode {
  iamServiceRoleMissingEniDescribeAction,
  iamServiceRoleMissingEniCreateAction,
  iamServiceRoleMissingEniDeleteAction,
  networkInterfaceLimitExceeded,
  internalServiceError,
  iamServiceRoleIsMissing,
  machineRoleIsMissing,
  stsDisabledInRegion,
  subnetHasInsufficientIpAddresses,
  iamServiceRoleMissingDescribeSubnetAction,
  subnetNotFound,
  imageNotFound,
  invalidSubnetConfiguration,
  securityGroupsNotFound,
  igwNotAttached,
  iamServiceRoleMissingDescribeSecurityGroupsAction,
  fleetStopped,
  fleetInstanceProvisioningFailure,
  domainJoinErrorFileNotFound,
  domainJoinErrorAccessDenied,
  domainJoinErrorLogonFailure,
  domainJoinErrorInvalidParameter,
  domainJoinErrorMoreData,
  domainJoinErrorNoSuchDomain,
  domainJoinErrorNotSupported,
  domainJoinNerrInvalidWorkgroupName,
  domainJoinNerrWorkstationNotStarted,
  domainJoinErrorDsMachineAccountQuotaExceeded,
  domainJoinNerrPasswordExpired,
  domainJoinInternalServiceError,
}

extension FleetErrorCodeValueExtension on FleetErrorCode {
  String toValue() {
    switch (this) {
      case FleetErrorCode.iamServiceRoleMissingEniDescribeAction:
        return 'IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION';
      case FleetErrorCode.iamServiceRoleMissingEniCreateAction:
        return 'IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION';
      case FleetErrorCode.iamServiceRoleMissingEniDeleteAction:
        return 'IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION';
      case FleetErrorCode.networkInterfaceLimitExceeded:
        return 'NETWORK_INTERFACE_LIMIT_EXCEEDED';
      case FleetErrorCode.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
      case FleetErrorCode.iamServiceRoleIsMissing:
        return 'IAM_SERVICE_ROLE_IS_MISSING';
      case FleetErrorCode.machineRoleIsMissing:
        return 'MACHINE_ROLE_IS_MISSING';
      case FleetErrorCode.stsDisabledInRegion:
        return 'STS_DISABLED_IN_REGION';
      case FleetErrorCode.subnetHasInsufficientIpAddresses:
        return 'SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES';
      case FleetErrorCode.iamServiceRoleMissingDescribeSubnetAction:
        return 'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION';
      case FleetErrorCode.subnetNotFound:
        return 'SUBNET_NOT_FOUND';
      case FleetErrorCode.imageNotFound:
        return 'IMAGE_NOT_FOUND';
      case FleetErrorCode.invalidSubnetConfiguration:
        return 'INVALID_SUBNET_CONFIGURATION';
      case FleetErrorCode.securityGroupsNotFound:
        return 'SECURITY_GROUPS_NOT_FOUND';
      case FleetErrorCode.igwNotAttached:
        return 'IGW_NOT_ATTACHED';
      case FleetErrorCode.iamServiceRoleMissingDescribeSecurityGroupsAction:
        return 'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION';
      case FleetErrorCode.fleetStopped:
        return 'FLEET_STOPPED';
      case FleetErrorCode.fleetInstanceProvisioningFailure:
        return 'FLEET_INSTANCE_PROVISIONING_FAILURE';
      case FleetErrorCode.domainJoinErrorFileNotFound:
        return 'DOMAIN_JOIN_ERROR_FILE_NOT_FOUND';
      case FleetErrorCode.domainJoinErrorAccessDenied:
        return 'DOMAIN_JOIN_ERROR_ACCESS_DENIED';
      case FleetErrorCode.domainJoinErrorLogonFailure:
        return 'DOMAIN_JOIN_ERROR_LOGON_FAILURE';
      case FleetErrorCode.domainJoinErrorInvalidParameter:
        return 'DOMAIN_JOIN_ERROR_INVALID_PARAMETER';
      case FleetErrorCode.domainJoinErrorMoreData:
        return 'DOMAIN_JOIN_ERROR_MORE_DATA';
      case FleetErrorCode.domainJoinErrorNoSuchDomain:
        return 'DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN';
      case FleetErrorCode.domainJoinErrorNotSupported:
        return 'DOMAIN_JOIN_ERROR_NOT_SUPPORTED';
      case FleetErrorCode.domainJoinNerrInvalidWorkgroupName:
        return 'DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME';
      case FleetErrorCode.domainJoinNerrWorkstationNotStarted:
        return 'DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED';
      case FleetErrorCode.domainJoinErrorDsMachineAccountQuotaExceeded:
        return 'DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED';
      case FleetErrorCode.domainJoinNerrPasswordExpired:
        return 'DOMAIN_JOIN_NERR_PASSWORD_EXPIRED';
      case FleetErrorCode.domainJoinInternalServiceError:
        return 'DOMAIN_JOIN_INTERNAL_SERVICE_ERROR';
    }
  }
}

extension FleetErrorCodeFromString on String {
  FleetErrorCode toFleetErrorCode() {
    switch (this) {
      case 'IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION':
        return FleetErrorCode.iamServiceRoleMissingEniDescribeAction;
      case 'IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION':
        return FleetErrorCode.iamServiceRoleMissingEniCreateAction;
      case 'IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION':
        return FleetErrorCode.iamServiceRoleMissingEniDeleteAction;
      case 'NETWORK_INTERFACE_LIMIT_EXCEEDED':
        return FleetErrorCode.networkInterfaceLimitExceeded;
      case 'INTERNAL_SERVICE_ERROR':
        return FleetErrorCode.internalServiceError;
      case 'IAM_SERVICE_ROLE_IS_MISSING':
        return FleetErrorCode.iamServiceRoleIsMissing;
      case 'MACHINE_ROLE_IS_MISSING':
        return FleetErrorCode.machineRoleIsMissing;
      case 'STS_DISABLED_IN_REGION':
        return FleetErrorCode.stsDisabledInRegion;
      case 'SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES':
        return FleetErrorCode.subnetHasInsufficientIpAddresses;
      case 'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION':
        return FleetErrorCode.iamServiceRoleMissingDescribeSubnetAction;
      case 'SUBNET_NOT_FOUND':
        return FleetErrorCode.subnetNotFound;
      case 'IMAGE_NOT_FOUND':
        return FleetErrorCode.imageNotFound;
      case 'INVALID_SUBNET_CONFIGURATION':
        return FleetErrorCode.invalidSubnetConfiguration;
      case 'SECURITY_GROUPS_NOT_FOUND':
        return FleetErrorCode.securityGroupsNotFound;
      case 'IGW_NOT_ATTACHED':
        return FleetErrorCode.igwNotAttached;
      case 'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION':
        return FleetErrorCode.iamServiceRoleMissingDescribeSecurityGroupsAction;
      case 'FLEET_STOPPED':
        return FleetErrorCode.fleetStopped;
      case 'FLEET_INSTANCE_PROVISIONING_FAILURE':
        return FleetErrorCode.fleetInstanceProvisioningFailure;
      case 'DOMAIN_JOIN_ERROR_FILE_NOT_FOUND':
        return FleetErrorCode.domainJoinErrorFileNotFound;
      case 'DOMAIN_JOIN_ERROR_ACCESS_DENIED':
        return FleetErrorCode.domainJoinErrorAccessDenied;
      case 'DOMAIN_JOIN_ERROR_LOGON_FAILURE':
        return FleetErrorCode.domainJoinErrorLogonFailure;
      case 'DOMAIN_JOIN_ERROR_INVALID_PARAMETER':
        return FleetErrorCode.domainJoinErrorInvalidParameter;
      case 'DOMAIN_JOIN_ERROR_MORE_DATA':
        return FleetErrorCode.domainJoinErrorMoreData;
      case 'DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN':
        return FleetErrorCode.domainJoinErrorNoSuchDomain;
      case 'DOMAIN_JOIN_ERROR_NOT_SUPPORTED':
        return FleetErrorCode.domainJoinErrorNotSupported;
      case 'DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME':
        return FleetErrorCode.domainJoinNerrInvalidWorkgroupName;
      case 'DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED':
        return FleetErrorCode.domainJoinNerrWorkstationNotStarted;
      case 'DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED':
        return FleetErrorCode.domainJoinErrorDsMachineAccountQuotaExceeded;
      case 'DOMAIN_JOIN_NERR_PASSWORD_EXPIRED':
        return FleetErrorCode.domainJoinNerrPasswordExpired;
      case 'DOMAIN_JOIN_INTERNAL_SERVICE_ERROR':
        return FleetErrorCode.domainJoinInternalServiceError;
    }
    throw Exception('$this is not known in enum FleetErrorCode');
  }
}

enum FleetState {
  starting,
  running,
  stopping,
  stopped,
}

extension FleetStateValueExtension on FleetState {
  String toValue() {
    switch (this) {
      case FleetState.starting:
        return 'STARTING';
      case FleetState.running:
        return 'RUNNING';
      case FleetState.stopping:
        return 'STOPPING';
      case FleetState.stopped:
        return 'STOPPED';
    }
  }
}

extension FleetStateFromString on String {
  FleetState toFleetState() {
    switch (this) {
      case 'STARTING':
        return FleetState.starting;
      case 'RUNNING':
        return FleetState.running;
      case 'STOPPING':
        return FleetState.stopping;
      case 'STOPPED':
        return FleetState.stopped;
    }
    throw Exception('$this is not known in enum FleetState');
  }
}

enum FleetType {
  alwaysOn,
  onDemand,
  elastic,
}

extension FleetTypeValueExtension on FleetType {
  String toValue() {
    switch (this) {
      case FleetType.alwaysOn:
        return 'ALWAYS_ON';
      case FleetType.onDemand:
        return 'ON_DEMAND';
      case FleetType.elastic:
        return 'ELASTIC';
    }
  }
}

extension FleetTypeFromString on String {
  FleetType toFleetType() {
    switch (this) {
      case 'ALWAYS_ON':
        return FleetType.alwaysOn;
      case 'ON_DEMAND':
        return FleetType.onDemand;
      case 'ELASTIC':
        return FleetType.elastic;
    }
    throw Exception('$this is not known in enum FleetType');
  }
}

/// Describes an image.
class Image {
  /// The name of the image.
  final String name;

  /// The applications associated with the image.
  final List<Application>? applications;

  /// The version of the AppStream 2.0 agent to use for instances that are
  /// launched from this image.
  final String? appstreamAgentVersion;

  /// The ARN of the image.
  final String? arn;

  /// The ARN of the image from which this image was created.
  final String? baseImageArn;

  /// The time the image was created.
  final DateTime? createdTime;

  /// The description to display.
  final String? description;

  /// The image name to display.
  final String? displayName;

  /// The name of the image builder that was used to create the private image. If
  /// the image is shared, this value is null.
  final String? imageBuilderName;

  /// Indicates whether an image builder can be launched from this image.
  final bool? imageBuilderSupported;

  /// Describes the errors that are returned when a new image can't be created.
  final List<ResourceError>? imageErrors;

  /// The permissions to provide to the destination AWS account for the specified
  /// image.
  final ImagePermissions? imagePermissions;

  /// The operating system platform of the image.
  final PlatformType? platform;

  /// The release date of the public base image. For private images, this date is
  /// the release date of the base image from which the image was created.
  final DateTime? publicBaseImageReleasedDate;

  /// The image starts in the <code>PENDING</code> state. If image creation
  /// succeeds, the state is <code>AVAILABLE</code>. If image creation fails, the
  /// state is <code>FAILED</code>.
  final ImageState? state;

  /// The reason why the last state change occurred.
  final ImageStateChangeReason? stateChangeReason;

  /// Indicates whether the image is public or private.
  final VisibilityType? visibility;

  Image({
    required this.name,
    this.applications,
    this.appstreamAgentVersion,
    this.arn,
    this.baseImageArn,
    this.createdTime,
    this.description,
    this.displayName,
    this.imageBuilderName,
    this.imageBuilderSupported,
    this.imageErrors,
    this.imagePermissions,
    this.platform,
    this.publicBaseImageReleasedDate,
    this.state,
    this.stateChangeReason,
    this.visibility,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      name: json['Name'] as String,
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      appstreamAgentVersion: json['AppstreamAgentVersion'] as String?,
      arn: json['Arn'] as String?,
      baseImageArn: json['BaseImageArn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      imageBuilderName: json['ImageBuilderName'] as String?,
      imageBuilderSupported: json['ImageBuilderSupported'] as bool?,
      imageErrors: (json['ImageErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePermissions: json['ImagePermissions'] != null
          ? ImagePermissions.fromJson(
              json['ImagePermissions'] as Map<String, dynamic>)
          : null,
      platform: (json['Platform'] as String?)?.toPlatformType(),
      publicBaseImageReleasedDate:
          timeStampFromJson(json['PublicBaseImageReleasedDate']),
      state: (json['State'] as String?)?.toImageState(),
      stateChangeReason: json['StateChangeReason'] != null
          ? ImageStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      visibility: (json['Visibility'] as String?)?.toVisibilityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final applications = this.applications;
    final appstreamAgentVersion = this.appstreamAgentVersion;
    final arn = this.arn;
    final baseImageArn = this.baseImageArn;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final imageBuilderName = this.imageBuilderName;
    final imageBuilderSupported = this.imageBuilderSupported;
    final imageErrors = this.imageErrors;
    final imagePermissions = this.imagePermissions;
    final platform = this.platform;
    final publicBaseImageReleasedDate = this.publicBaseImageReleasedDate;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final visibility = this.visibility;
    return {
      'Name': name,
      if (applications != null) 'Applications': applications,
      if (appstreamAgentVersion != null)
        'AppstreamAgentVersion': appstreamAgentVersion,
      if (arn != null) 'Arn': arn,
      if (baseImageArn != null) 'BaseImageArn': baseImageArn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (imageBuilderName != null) 'ImageBuilderName': imageBuilderName,
      if (imageBuilderSupported != null)
        'ImageBuilderSupported': imageBuilderSupported,
      if (imageErrors != null) 'ImageErrors': imageErrors,
      if (imagePermissions != null) 'ImagePermissions': imagePermissions,
      if (platform != null) 'Platform': platform.toValue(),
      if (publicBaseImageReleasedDate != null)
        'PublicBaseImageReleasedDate':
            unixTimestampToJson(publicBaseImageReleasedDate),
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (visibility != null) 'Visibility': visibility.toValue(),
    };
  }
}

/// Describes a virtual machine that is used to create an image.
class ImageBuilder {
  /// The name of the image builder.
  final String name;

  /// The list of virtual private cloud (VPC) interface endpoint objects.
  /// Administrators can connect to the image builder only through the specified
  /// endpoints.
  final List<AccessEndpoint>? accessEndpoints;

  /// The version of the AppStream 2.0 agent that is currently being used by the
  /// image builder.
  final String? appstreamAgentVersion;

  /// The ARN for the image builder.
  final String? arn;

  /// The time stamp when the image builder was created.
  final DateTime? createdTime;

  /// The description to display.
  final String? description;

  /// The image builder name to display.
  final String? displayName;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// image builder to a Microsoft Active Directory domain.
  final DomainJoinInfo? domainJoinInfo;

  /// Enables or disables default internet access for the image builder.
  final bool? enableDefaultInternetAccess;

  /// The ARN of the IAM role that is applied to the image builder. To assume a
  /// role, the image builder calls the AWS Security Token Service (STS)
  /// <code>AssumeRole</code> API operation and passes the ARN of the role to use.
  /// The operation creates a new session with temporary credentials. AppStream
  /// 2.0 retrieves the temporary credentials and creates the
  /// <b>appstream_machine_role</b> credential profile on the instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html">Using
  /// an IAM Role to Grant Permissions to Applications and Scripts Running on
  /// AppStream 2.0 Streaming Instances</a> in the <i>Amazon AppStream 2.0
  /// Administration Guide</i>.
  final String? iamRoleArn;

  /// The ARN of the image from which this builder was created.
  final String? imageArn;

  /// The image builder errors.
  final List<ResourceError>? imageBuilderErrors;

  /// The instance type for the image builder. The following instance types are
  /// available:
  ///
  /// <ul>
  /// <li>
  /// stream.standard.small
  /// </li>
  /// <li>
  /// stream.standard.medium
  /// </li>
  /// <li>
  /// stream.standard.large
  /// </li>
  /// <li>
  /// stream.compute.large
  /// </li>
  /// <li>
  /// stream.compute.xlarge
  /// </li>
  /// <li>
  /// stream.compute.2xlarge
  /// </li>
  /// <li>
  /// stream.compute.4xlarge
  /// </li>
  /// <li>
  /// stream.compute.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.large
  /// </li>
  /// <li>
  /// stream.memory.xlarge
  /// </li>
  /// <li>
  /// stream.memory.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.4xlarge
  /// </li>
  /// <li>
  /// stream.memory.8xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.large
  /// </li>
  /// <li>
  /// stream.memory.z1d.xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.2xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.3xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.6xlarge
  /// </li>
  /// <li>
  /// stream.memory.z1d.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.large
  /// </li>
  /// <li>
  /// stream.graphics-design.xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics-design.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-desktop.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.2xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.12xlarge
  /// </li>
  /// <li>
  /// stream.graphics.g4dn.16xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.4xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.8xlarge
  /// </li>
  /// <li>
  /// stream.graphics-pro.16xlarge
  /// </li>
  /// </ul>
  final String? instanceType;
  final NetworkAccessConfiguration? networkAccessConfiguration;

  /// The operating system platform of the image builder.
  final PlatformType? platform;

  /// The state of the image builder.
  final ImageBuilderState? state;

  /// The reason why the last state change occurred.
  final ImageBuilderStateChangeReason? stateChangeReason;

  /// The VPC configuration of the image builder.
  final VpcConfig? vpcConfig;

  ImageBuilder({
    required this.name,
    this.accessEndpoints,
    this.appstreamAgentVersion,
    this.arn,
    this.createdTime,
    this.description,
    this.displayName,
    this.domainJoinInfo,
    this.enableDefaultInternetAccess,
    this.iamRoleArn,
    this.imageArn,
    this.imageBuilderErrors,
    this.instanceType,
    this.networkAccessConfiguration,
    this.platform,
    this.state,
    this.stateChangeReason,
    this.vpcConfig,
  });

  factory ImageBuilder.fromJson(Map<String, dynamic> json) {
    return ImageBuilder(
      name: json['Name'] as String,
      accessEndpoints: (json['AccessEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => AccessEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      appstreamAgentVersion: json['AppstreamAgentVersion'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      domainJoinInfo: json['DomainJoinInfo'] != null
          ? DomainJoinInfo.fromJson(
              json['DomainJoinInfo'] as Map<String, dynamic>)
          : null,
      enableDefaultInternetAccess: json['EnableDefaultInternetAccess'] as bool?,
      iamRoleArn: json['IamRoleArn'] as String?,
      imageArn: json['ImageArn'] as String?,
      imageBuilderErrors: (json['ImageBuilderErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceType: json['InstanceType'] as String?,
      networkAccessConfiguration: json['NetworkAccessConfiguration'] != null
          ? NetworkAccessConfiguration.fromJson(
              json['NetworkAccessConfiguration'] as Map<String, dynamic>)
          : null,
      platform: (json['Platform'] as String?)?.toPlatformType(),
      state: (json['State'] as String?)?.toImageBuilderState(),
      stateChangeReason: json['StateChangeReason'] != null
          ? ImageBuilderStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final accessEndpoints = this.accessEndpoints;
    final appstreamAgentVersion = this.appstreamAgentVersion;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final domainJoinInfo = this.domainJoinInfo;
    final enableDefaultInternetAccess = this.enableDefaultInternetAccess;
    final iamRoleArn = this.iamRoleArn;
    final imageArn = this.imageArn;
    final imageBuilderErrors = this.imageBuilderErrors;
    final instanceType = this.instanceType;
    final networkAccessConfiguration = this.networkAccessConfiguration;
    final platform = this.platform;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final vpcConfig = this.vpcConfig;
    return {
      'Name': name,
      if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
      if (appstreamAgentVersion != null)
        'AppstreamAgentVersion': appstreamAgentVersion,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (domainJoinInfo != null) 'DomainJoinInfo': domainJoinInfo,
      if (enableDefaultInternetAccess != null)
        'EnableDefaultInternetAccess': enableDefaultInternetAccess,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (imageArn != null) 'ImageArn': imageArn,
      if (imageBuilderErrors != null) 'ImageBuilderErrors': imageBuilderErrors,
      if (instanceType != null) 'InstanceType': instanceType,
      if (networkAccessConfiguration != null)
        'NetworkAccessConfiguration': networkAccessConfiguration,
      if (platform != null) 'Platform': platform.toValue(),
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

enum ImageBuilderState {
  pending,
  updatingAgent,
  running,
  stopping,
  stopped,
  rebooting,
  snapshotting,
  deleting,
  failed,
  updating,
  pendingQualification,
}

extension ImageBuilderStateValueExtension on ImageBuilderState {
  String toValue() {
    switch (this) {
      case ImageBuilderState.pending:
        return 'PENDING';
      case ImageBuilderState.updatingAgent:
        return 'UPDATING_AGENT';
      case ImageBuilderState.running:
        return 'RUNNING';
      case ImageBuilderState.stopping:
        return 'STOPPING';
      case ImageBuilderState.stopped:
        return 'STOPPED';
      case ImageBuilderState.rebooting:
        return 'REBOOTING';
      case ImageBuilderState.snapshotting:
        return 'SNAPSHOTTING';
      case ImageBuilderState.deleting:
        return 'DELETING';
      case ImageBuilderState.failed:
        return 'FAILED';
      case ImageBuilderState.updating:
        return 'UPDATING';
      case ImageBuilderState.pendingQualification:
        return 'PENDING_QUALIFICATION';
    }
  }
}

extension ImageBuilderStateFromString on String {
  ImageBuilderState toImageBuilderState() {
    switch (this) {
      case 'PENDING':
        return ImageBuilderState.pending;
      case 'UPDATING_AGENT':
        return ImageBuilderState.updatingAgent;
      case 'RUNNING':
        return ImageBuilderState.running;
      case 'STOPPING':
        return ImageBuilderState.stopping;
      case 'STOPPED':
        return ImageBuilderState.stopped;
      case 'REBOOTING':
        return ImageBuilderState.rebooting;
      case 'SNAPSHOTTING':
        return ImageBuilderState.snapshotting;
      case 'DELETING':
        return ImageBuilderState.deleting;
      case 'FAILED':
        return ImageBuilderState.failed;
      case 'UPDATING':
        return ImageBuilderState.updating;
      case 'PENDING_QUALIFICATION':
        return ImageBuilderState.pendingQualification;
    }
    throw Exception('$this is not known in enum ImageBuilderState');
  }
}

/// Describes the reason why the last image builder state change occurred.
class ImageBuilderStateChangeReason {
  /// The state change reason code.
  final ImageBuilderStateChangeReasonCode? code;

  /// The state change reason message.
  final String? message;

  ImageBuilderStateChangeReason({
    this.code,
    this.message,
  });

  factory ImageBuilderStateChangeReason.fromJson(Map<String, dynamic> json) {
    return ImageBuilderStateChangeReason(
      code: (json['Code'] as String?)?.toImageBuilderStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum ImageBuilderStateChangeReasonCode {
  internalError,
  imageUnavailable,
}

extension ImageBuilderStateChangeReasonCodeValueExtension
    on ImageBuilderStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case ImageBuilderStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case ImageBuilderStateChangeReasonCode.imageUnavailable:
        return 'IMAGE_UNAVAILABLE';
    }
  }
}

extension ImageBuilderStateChangeReasonCodeFromString on String {
  ImageBuilderStateChangeReasonCode toImageBuilderStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return ImageBuilderStateChangeReasonCode.internalError;
      case 'IMAGE_UNAVAILABLE':
        return ImageBuilderStateChangeReasonCode.imageUnavailable;
    }
    throw Exception(
        '$this is not known in enum ImageBuilderStateChangeReasonCode');
  }
}

/// Describes the permissions for an image.
class ImagePermissions {
  /// Indicates whether the image can be used for a fleet.
  final bool? allowFleet;

  /// Indicates whether the image can be used for an image builder.
  final bool? allowImageBuilder;

  ImagePermissions({
    this.allowFleet,
    this.allowImageBuilder,
  });

  factory ImagePermissions.fromJson(Map<String, dynamic> json) {
    return ImagePermissions(
      allowFleet: json['allowFleet'] as bool?,
      allowImageBuilder: json['allowImageBuilder'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowFleet = this.allowFleet;
    final allowImageBuilder = this.allowImageBuilder;
    return {
      if (allowFleet != null) 'allowFleet': allowFleet,
      if (allowImageBuilder != null) 'allowImageBuilder': allowImageBuilder,
    };
  }
}

enum ImageState {
  pending,
  available,
  failed,
  copying,
  deleting,
  creating,
  importing,
}

extension ImageStateValueExtension on ImageState {
  String toValue() {
    switch (this) {
      case ImageState.pending:
        return 'PENDING';
      case ImageState.available:
        return 'AVAILABLE';
      case ImageState.failed:
        return 'FAILED';
      case ImageState.copying:
        return 'COPYING';
      case ImageState.deleting:
        return 'DELETING';
      case ImageState.creating:
        return 'CREATING';
      case ImageState.importing:
        return 'IMPORTING';
    }
  }
}

extension ImageStateFromString on String {
  ImageState toImageState() {
    switch (this) {
      case 'PENDING':
        return ImageState.pending;
      case 'AVAILABLE':
        return ImageState.available;
      case 'FAILED':
        return ImageState.failed;
      case 'COPYING':
        return ImageState.copying;
      case 'DELETING':
        return ImageState.deleting;
      case 'CREATING':
        return ImageState.creating;
      case 'IMPORTING':
        return ImageState.importing;
    }
    throw Exception('$this is not known in enum ImageState');
  }
}

/// Describes the reason why the last image state change occurred.
class ImageStateChangeReason {
  /// The state change reason code.
  final ImageStateChangeReasonCode? code;

  /// The state change reason message.
  final String? message;

  ImageStateChangeReason({
    this.code,
    this.message,
  });

  factory ImageStateChangeReason.fromJson(Map<String, dynamic> json) {
    return ImageStateChangeReason(
      code: (json['Code'] as String?)?.toImageStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum ImageStateChangeReasonCode {
  internalError,
  imageBuilderNotAvailable,
  imageCopyFailure,
}

extension ImageStateChangeReasonCodeValueExtension
    on ImageStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case ImageStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case ImageStateChangeReasonCode.imageBuilderNotAvailable:
        return 'IMAGE_BUILDER_NOT_AVAILABLE';
      case ImageStateChangeReasonCode.imageCopyFailure:
        return 'IMAGE_COPY_FAILURE';
    }
  }
}

extension ImageStateChangeReasonCodeFromString on String {
  ImageStateChangeReasonCode toImageStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return ImageStateChangeReasonCode.internalError;
      case 'IMAGE_BUILDER_NOT_AVAILABLE':
        return ImageStateChangeReasonCode.imageBuilderNotAvailable;
      case 'IMAGE_COPY_FAILURE':
        return ImageStateChangeReasonCode.imageCopyFailure;
    }
    throw Exception('$this is not known in enum ImageStateChangeReasonCode');
  }
}

/// Describes the error that is returned when a usage report can't be generated.
class LastReportGenerationExecutionError {
  /// The error code for the error that is returned when a usage report can't be
  /// generated.
  final UsageReportExecutionErrorCode? errorCode;

  /// The error message for the error that is returned when a usage report can't
  /// be generated.
  final String? errorMessage;

  LastReportGenerationExecutionError({
    this.errorCode,
    this.errorMessage,
  });

  factory LastReportGenerationExecutionError.fromJson(
      Map<String, dynamic> json) {
    return LastReportGenerationExecutionError(
      errorCode:
          (json['ErrorCode'] as String?)?.toUsageReportExecutionErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class ListAssociatedFleetsResult {
  /// The name of the fleet.
  final List<String>? names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListAssociatedFleetsResult({
    this.names,
    this.nextToken,
  });

  factory ListAssociatedFleetsResult.fromJson(Map<String, dynamic> json) {
    return ListAssociatedFleetsResult(
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final names = this.names;
    final nextToken = this.nextToken;
    return {
      if (names != null) 'Names': names,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAssociatedStacksResult {
  /// The name of the stack.
  final List<String>? names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListAssociatedStacksResult({
    this.names,
    this.nextToken,
  });

  factory ListAssociatedStacksResult.fromJson(Map<String, dynamic> json) {
    return ListAssociatedStacksResult(
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final names = this.names;
    final nextToken = this.nextToken;
    return {
      if (names != null) 'Names': names,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEntitledApplicationsResult {
  /// The entitled applications.
  final List<EntitledApplication>? entitledApplications;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListEntitledApplicationsResult({
    this.entitledApplications,
    this.nextToken,
  });

  factory ListEntitledApplicationsResult.fromJson(Map<String, dynamic> json) {
    return ListEntitledApplicationsResult(
      entitledApplications: (json['EntitledApplications'] as List?)
          ?.whereNotNull()
          .map((e) => EntitledApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitledApplications = this.entitledApplications;
    final nextToken = this.nextToken;
    return {
      if (entitledApplications != null)
        'EntitledApplications': entitledApplications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The information about the tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MessageAction {
  suppress,
  resend,
}

extension MessageActionValueExtension on MessageAction {
  String toValue() {
    switch (this) {
      case MessageAction.suppress:
        return 'SUPPRESS';
      case MessageAction.resend:
        return 'RESEND';
    }
  }
}

extension MessageActionFromString on String {
  MessageAction toMessageAction() {
    switch (this) {
      case 'SUPPRESS':
        return MessageAction.suppress;
      case 'RESEND':
        return MessageAction.resend;
    }
    throw Exception('$this is not known in enum MessageAction');
  }
}

/// Describes the network details of the fleet or image builder instance.
class NetworkAccessConfiguration {
  /// The resource identifier of the elastic network interface that is attached to
  /// instances in your VPC. All network interfaces have the eni-xxxxxxxx resource
  /// identifier.
  final String? eniId;

  /// The private IP address of the elastic network interface that is attached to
  /// instances in your VPC.
  final String? eniPrivateIpAddress;

  NetworkAccessConfiguration({
    this.eniId,
    this.eniPrivateIpAddress,
  });

  factory NetworkAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkAccessConfiguration(
      eniId: json['EniId'] as String?,
      eniPrivateIpAddress: json['EniPrivateIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eniId = this.eniId;
    final eniPrivateIpAddress = this.eniPrivateIpAddress;
    return {
      if (eniId != null) 'EniId': eniId,
      if (eniPrivateIpAddress != null)
        'EniPrivateIpAddress': eniPrivateIpAddress,
    };
  }
}

enum PackagingType {
  custom,
  appstream2,
}

extension PackagingTypeValueExtension on PackagingType {
  String toValue() {
    switch (this) {
      case PackagingType.custom:
        return 'CUSTOM';
      case PackagingType.appstream2:
        return 'APPSTREAM2';
    }
  }
}

extension PackagingTypeFromString on String {
  PackagingType toPackagingType() {
    switch (this) {
      case 'CUSTOM':
        return PackagingType.custom;
      case 'APPSTREAM2':
        return PackagingType.appstream2;
    }
    throw Exception('$this is not known in enum PackagingType');
  }
}

enum Permission {
  enabled,
  disabled,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.enabled:
        return 'ENABLED';
      case Permission.disabled:
        return 'DISABLED';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'ENABLED':
        return Permission.enabled;
      case 'DISABLED':
        return Permission.disabled;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

enum PlatformType {
  windows,
  windowsServer_2016,
  windowsServer_2019,
  windowsServer_2022,
  amazonLinux2,
}

extension PlatformTypeValueExtension on PlatformType {
  String toValue() {
    switch (this) {
      case PlatformType.windows:
        return 'WINDOWS';
      case PlatformType.windowsServer_2016:
        return 'WINDOWS_SERVER_2016';
      case PlatformType.windowsServer_2019:
        return 'WINDOWS_SERVER_2019';
      case PlatformType.windowsServer_2022:
        return 'WINDOWS_SERVER_2022';
      case PlatformType.amazonLinux2:
        return 'AMAZON_LINUX2';
    }
  }
}

extension PlatformTypeFromString on String {
  PlatformType toPlatformType() {
    switch (this) {
      case 'WINDOWS':
        return PlatformType.windows;
      case 'WINDOWS_SERVER_2016':
        return PlatformType.windowsServer_2016;
      case 'WINDOWS_SERVER_2019':
        return PlatformType.windowsServer_2019;
      case 'WINDOWS_SERVER_2022':
        return PlatformType.windowsServer_2022;
      case 'AMAZON_LINUX2':
        return PlatformType.amazonLinux2;
    }
    throw Exception('$this is not known in enum PlatformType');
  }
}

enum PreferredProtocol {
  tcp,
  udp,
}

extension PreferredProtocolValueExtension on PreferredProtocol {
  String toValue() {
    switch (this) {
      case PreferredProtocol.tcp:
        return 'TCP';
      case PreferredProtocol.udp:
        return 'UDP';
    }
  }
}

extension PreferredProtocolFromString on String {
  PreferredProtocol toPreferredProtocol() {
    switch (this) {
      case 'TCP':
        return PreferredProtocol.tcp;
      case 'UDP':
        return PreferredProtocol.udp;
    }
    throw Exception('$this is not known in enum PreferredProtocol');
  }
}

/// Describes a resource error.
class ResourceError {
  /// The error code.
  final FleetErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The time the error occurred.
  final DateTime? errorTimestamp;

  ResourceError({
    this.errorCode,
    this.errorMessage,
    this.errorTimestamp,
  });

  factory ResourceError.fromJson(Map<String, dynamic> json) {
    return ResourceError(
      errorCode: (json['ErrorCode'] as String?)?.toFleetErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      errorTimestamp: timeStampFromJson(json['ErrorTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final errorTimestamp = this.errorTimestamp;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorTimestamp != null)
        'ErrorTimestamp': unixTimestampToJson(errorTimestamp),
    };
  }
}

/// Describes the S3 location.
class S3Location {
  /// The S3 bucket of the S3 object.
  final String s3Bucket;

  /// The S3 key of the S3 object.
  ///
  /// This is required when used for the following:
  ///
  /// <ul>
  /// <li>
  /// IconS3Location (Actions: CreateApplication and UpdateApplication)
  /// </li>
  /// <li>
  /// SessionScriptS3Location (Actions: CreateFleet and UpdateFleet)
  /// </li>
  /// <li>
  /// ScriptDetails (Actions: CreateAppBlock)
  /// </li>
  /// <li>
  /// SourceS3Location when creating an app block with <code>CUSTOM</code>
  /// PackagingType (Actions: CreateAppBlock)
  /// </li>
  /// <li>
  /// SourceS3Location when creating an app block with <code>APPSTREAM2</code>
  /// PackagingType, and using an existing application package (VHD file). In this
  /// case, <code>S3Key</code> refers to the VHD file. If a new application
  /// package is required, then <code>S3Key</code> is not required. (Actions:
  /// CreateAppBlock)
  /// </li>
  /// </ul>
  final String? s3Key;

  S3Location({
    required this.s3Bucket,
    this.s3Key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      s3Bucket: json['S3Bucket'] as String,
      s3Key: json['S3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

/// Describes the details of the script.
class ScriptDetails {
  /// The run path for the script.
  final String executablePath;

  /// The S3 object location for the script.
  final S3Location scriptS3Location;

  /// The run timeout, in seconds, for the script.
  final int timeoutInSeconds;

  /// The runtime parameters passed to the run path for the script.
  final String? executableParameters;

  ScriptDetails({
    required this.executablePath,
    required this.scriptS3Location,
    required this.timeoutInSeconds,
    this.executableParameters,
  });

  factory ScriptDetails.fromJson(Map<String, dynamic> json) {
    return ScriptDetails(
      executablePath: json['ExecutablePath'] as String,
      scriptS3Location:
          S3Location.fromJson(json['ScriptS3Location'] as Map<String, dynamic>),
      timeoutInSeconds: json['TimeoutInSeconds'] as int,
      executableParameters: json['ExecutableParameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executablePath = this.executablePath;
    final scriptS3Location = this.scriptS3Location;
    final timeoutInSeconds = this.timeoutInSeconds;
    final executableParameters = this.executableParameters;
    return {
      'ExecutablePath': executablePath,
      'ScriptS3Location': scriptS3Location,
      'TimeoutInSeconds': timeoutInSeconds,
      if (executableParameters != null)
        'ExecutableParameters': executableParameters,
    };
  }
}

/// Describes the credentials for the service account used by the fleet or image
/// builder to connect to the directory.
class ServiceAccountCredentials {
  /// The user name of the account. This account must have the following
  /// privileges: create computer objects, join computers to the domain, and
  /// change/reset the password on descendant computer objects for the
  /// organizational units specified.
  final String accountName;

  /// The password for the account.
  final String accountPassword;

  ServiceAccountCredentials({
    required this.accountName,
    required this.accountPassword,
  });

  factory ServiceAccountCredentials.fromJson(Map<String, dynamic> json) {
    return ServiceAccountCredentials(
      accountName: json['AccountName'] as String,
      accountPassword: json['AccountPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountName = this.accountName;
    final accountPassword = this.accountPassword;
    return {
      'AccountName': accountName,
      'AccountPassword': accountPassword,
    };
  }
}

/// Describes a streaming session.
class Session {
  /// The name of the fleet for the streaming session.
  final String fleetName;

  /// The identifier of the streaming session.
  final String id;

  /// The name of the stack for the streaming session.
  final String stackName;

  /// The current state of the streaming session.
  final SessionState state;

  /// The identifier of the user for whom the session was created.
  final String userId;

  /// The authentication method. The user is authenticated using a streaming URL
  /// (<code>API</code>) or SAML 2.0 federation (<code>SAML</code>).
  final AuthenticationType? authenticationType;

  /// Specifies whether a user is connected to the streaming session.
  final SessionConnectionState? connectionState;

  /// The identifier for the instance hosting the session.
  final String? instanceId;

  /// The time when the streaming session is set to expire. This time is based on
  /// the <code>MaxUserDurationinSeconds</code> value, which determines the
  /// maximum length of time that a streaming session can run. A streaming session
  /// might end earlier than the time specified in
  /// <code>SessionMaxExpirationTime</code>, when the
  /// <code>DisconnectTimeOutInSeconds</code> elapses or the user chooses to end
  /// his or her session. If the <code>DisconnectTimeOutInSeconds</code> elapses,
  /// or the user chooses to end his or her session, the streaming instance is
  /// terminated and the streaming session ends.
  final DateTime? maxExpirationTime;

  /// The network details for the streaming session.
  final NetworkAccessConfiguration? networkAccessConfiguration;

  /// The time when a streaming instance is dedicated for the user.
  final DateTime? startTime;

  Session({
    required this.fleetName,
    required this.id,
    required this.stackName,
    required this.state,
    required this.userId,
    this.authenticationType,
    this.connectionState,
    this.instanceId,
    this.maxExpirationTime,
    this.networkAccessConfiguration,
    this.startTime,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      fleetName: json['FleetName'] as String,
      id: json['Id'] as String,
      stackName: json['StackName'] as String,
      state: (json['State'] as String).toSessionState(),
      userId: json['UserId'] as String,
      authenticationType:
          (json['AuthenticationType'] as String?)?.toAuthenticationType(),
      connectionState:
          (json['ConnectionState'] as String?)?.toSessionConnectionState(),
      instanceId: json['InstanceId'] as String?,
      maxExpirationTime: timeStampFromJson(json['MaxExpirationTime']),
      networkAccessConfiguration: json['NetworkAccessConfiguration'] != null
          ? NetworkAccessConfiguration.fromJson(
              json['NetworkAccessConfiguration'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetName = this.fleetName;
    final id = this.id;
    final stackName = this.stackName;
    final state = this.state;
    final userId = this.userId;
    final authenticationType = this.authenticationType;
    final connectionState = this.connectionState;
    final instanceId = this.instanceId;
    final maxExpirationTime = this.maxExpirationTime;
    final networkAccessConfiguration = this.networkAccessConfiguration;
    final startTime = this.startTime;
    return {
      'FleetName': fleetName,
      'Id': id,
      'StackName': stackName,
      'State': state.toValue(),
      'UserId': userId,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (instanceId != null) 'InstanceId': instanceId,
      if (maxExpirationTime != null)
        'MaxExpirationTime': unixTimestampToJson(maxExpirationTime),
      if (networkAccessConfiguration != null)
        'NetworkAccessConfiguration': networkAccessConfiguration,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

enum SessionConnectionState {
  connected,
  notConnected,
}

extension SessionConnectionStateValueExtension on SessionConnectionState {
  String toValue() {
    switch (this) {
      case SessionConnectionState.connected:
        return 'CONNECTED';
      case SessionConnectionState.notConnected:
        return 'NOT_CONNECTED';
    }
  }
}

extension SessionConnectionStateFromString on String {
  SessionConnectionState toSessionConnectionState() {
    switch (this) {
      case 'CONNECTED':
        return SessionConnectionState.connected;
      case 'NOT_CONNECTED':
        return SessionConnectionState.notConnected;
    }
    throw Exception('$this is not known in enum SessionConnectionState');
  }
}

/// Possible values for the state of a streaming session.
enum SessionState {
  active,
  pending,
  expired,
}

extension SessionStateValueExtension on SessionState {
  String toValue() {
    switch (this) {
      case SessionState.active:
        return 'ACTIVE';
      case SessionState.pending:
        return 'PENDING';
      case SessionState.expired:
        return 'EXPIRED';
    }
  }
}

extension SessionStateFromString on String {
  SessionState toSessionState() {
    switch (this) {
      case 'ACTIVE':
        return SessionState.active;
      case 'PENDING':
        return SessionState.pending;
      case 'EXPIRED':
        return SessionState.expired;
    }
    throw Exception('$this is not known in enum SessionState');
  }
}

/// Describes the permissions that are available to the specified AWS account
/// for a shared image.
class SharedImagePermissions {
  /// Describes the permissions for a shared image.
  final ImagePermissions imagePermissions;

  /// The 12-digit identifier of the AWS account with which the image is shared.
  final String sharedAccountId;

  SharedImagePermissions({
    required this.imagePermissions,
    required this.sharedAccountId,
  });

  factory SharedImagePermissions.fromJson(Map<String, dynamic> json) {
    return SharedImagePermissions(
      imagePermissions: ImagePermissions.fromJson(
          json['imagePermissions'] as Map<String, dynamic>),
      sharedAccountId: json['sharedAccountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePermissions = this.imagePermissions;
    final sharedAccountId = this.sharedAccountId;
    return {
      'imagePermissions': imagePermissions,
      'sharedAccountId': sharedAccountId,
    };
  }
}

/// Describes a stack.
class Stack {
  /// The name of the stack.
  final String name;

  /// The list of virtual private cloud (VPC) interface endpoint objects. Users of
  /// the stack can connect to AppStream 2.0 only through the specified endpoints.
  final List<AccessEndpoint>? accessEndpoints;

  /// The persistent application settings for users of the stack.
  final ApplicationSettingsResponse? applicationSettings;

  /// The ARN of the stack.
  final String? arn;

  /// The time the stack was created.
  final DateTime? createdTime;

  /// The description to display.
  final String? description;

  /// The stack name to display.
  final String? displayName;

  /// The domains where AppStream 2.0 streaming sessions can be embedded in an
  /// iframe. You must approve the domains that you want to host embedded
  /// AppStream 2.0 streaming sessions.
  final List<String>? embedHostDomains;

  /// The URL that users are redirected to after they click the Send Feedback
  /// link. If no URL is specified, no Send Feedback link is displayed.
  final String? feedbackURL;

  /// The URL that users are redirected to after their streaming session ends.
  final String? redirectURL;

  /// The errors for the stack.
  final List<StackError>? stackErrors;

  /// The storage connectors to enable.
  final List<StorageConnector>? storageConnectors;

  /// The streaming protocol you want your stack to prefer. This can be UDP or
  /// TCP. Currently, UDP is only supported in the Windows native client.
  final StreamingExperienceSettings? streamingExperienceSettings;

  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default these actions are enabled.
  final List<UserSetting>? userSettings;

  Stack({
    required this.name,
    this.accessEndpoints,
    this.applicationSettings,
    this.arn,
    this.createdTime,
    this.description,
    this.displayName,
    this.embedHostDomains,
    this.feedbackURL,
    this.redirectURL,
    this.stackErrors,
    this.storageConnectors,
    this.streamingExperienceSettings,
    this.userSettings,
  });

  factory Stack.fromJson(Map<String, dynamic> json) {
    return Stack(
      name: json['Name'] as String,
      accessEndpoints: (json['AccessEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => AccessEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicationSettings: json['ApplicationSettings'] != null
          ? ApplicationSettingsResponse.fromJson(
              json['ApplicationSettings'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      embedHostDomains: (json['EmbedHostDomains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      feedbackURL: json['FeedbackURL'] as String?,
      redirectURL: json['RedirectURL'] as String?,
      stackErrors: (json['StackErrors'] as List?)
          ?.whereNotNull()
          .map((e) => StackError.fromJson(e as Map<String, dynamic>))
          .toList(),
      storageConnectors: (json['StorageConnectors'] as List?)
          ?.whereNotNull()
          .map((e) => StorageConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamingExperienceSettings: json['StreamingExperienceSettings'] != null
          ? StreamingExperienceSettings.fromJson(
              json['StreamingExperienceSettings'] as Map<String, dynamic>)
          : null,
      userSettings: (json['UserSettings'] as List?)
          ?.whereNotNull()
          .map((e) => UserSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final accessEndpoints = this.accessEndpoints;
    final applicationSettings = this.applicationSettings;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final displayName = this.displayName;
    final embedHostDomains = this.embedHostDomains;
    final feedbackURL = this.feedbackURL;
    final redirectURL = this.redirectURL;
    final stackErrors = this.stackErrors;
    final storageConnectors = this.storageConnectors;
    final streamingExperienceSettings = this.streamingExperienceSettings;
    final userSettings = this.userSettings;
    return {
      'Name': name,
      if (accessEndpoints != null) 'AccessEndpoints': accessEndpoints,
      if (applicationSettings != null)
        'ApplicationSettings': applicationSettings,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (embedHostDomains != null) 'EmbedHostDomains': embedHostDomains,
      if (feedbackURL != null) 'FeedbackURL': feedbackURL,
      if (redirectURL != null) 'RedirectURL': redirectURL,
      if (stackErrors != null) 'StackErrors': stackErrors,
      if (storageConnectors != null) 'StorageConnectors': storageConnectors,
      if (streamingExperienceSettings != null)
        'StreamingExperienceSettings': streamingExperienceSettings,
      if (userSettings != null) 'UserSettings': userSettings,
    };
  }
}

enum StackAttribute {
  storageConnectors,
  storageConnectorHomefolders,
  storageConnectorGoogleDrive,
  storageConnectorOneDrive,
  redirectUrl,
  feedbackUrl,
  themeName,
  userSettings,
  embedHostDomains,
  iamRoleArn,
  accessEndpoints,
  streamingExperienceSettings,
}

extension StackAttributeValueExtension on StackAttribute {
  String toValue() {
    switch (this) {
      case StackAttribute.storageConnectors:
        return 'STORAGE_CONNECTORS';
      case StackAttribute.storageConnectorHomefolders:
        return 'STORAGE_CONNECTOR_HOMEFOLDERS';
      case StackAttribute.storageConnectorGoogleDrive:
        return 'STORAGE_CONNECTOR_GOOGLE_DRIVE';
      case StackAttribute.storageConnectorOneDrive:
        return 'STORAGE_CONNECTOR_ONE_DRIVE';
      case StackAttribute.redirectUrl:
        return 'REDIRECT_URL';
      case StackAttribute.feedbackUrl:
        return 'FEEDBACK_URL';
      case StackAttribute.themeName:
        return 'THEME_NAME';
      case StackAttribute.userSettings:
        return 'USER_SETTINGS';
      case StackAttribute.embedHostDomains:
        return 'EMBED_HOST_DOMAINS';
      case StackAttribute.iamRoleArn:
        return 'IAM_ROLE_ARN';
      case StackAttribute.accessEndpoints:
        return 'ACCESS_ENDPOINTS';
      case StackAttribute.streamingExperienceSettings:
        return 'STREAMING_EXPERIENCE_SETTINGS';
    }
  }
}

extension StackAttributeFromString on String {
  StackAttribute toStackAttribute() {
    switch (this) {
      case 'STORAGE_CONNECTORS':
        return StackAttribute.storageConnectors;
      case 'STORAGE_CONNECTOR_HOMEFOLDERS':
        return StackAttribute.storageConnectorHomefolders;
      case 'STORAGE_CONNECTOR_GOOGLE_DRIVE':
        return StackAttribute.storageConnectorGoogleDrive;
      case 'STORAGE_CONNECTOR_ONE_DRIVE':
        return StackAttribute.storageConnectorOneDrive;
      case 'REDIRECT_URL':
        return StackAttribute.redirectUrl;
      case 'FEEDBACK_URL':
        return StackAttribute.feedbackUrl;
      case 'THEME_NAME':
        return StackAttribute.themeName;
      case 'USER_SETTINGS':
        return StackAttribute.userSettings;
      case 'EMBED_HOST_DOMAINS':
        return StackAttribute.embedHostDomains;
      case 'IAM_ROLE_ARN':
        return StackAttribute.iamRoleArn;
      case 'ACCESS_ENDPOINTS':
        return StackAttribute.accessEndpoints;
      case 'STREAMING_EXPERIENCE_SETTINGS':
        return StackAttribute.streamingExperienceSettings;
    }
    throw Exception('$this is not known in enum StackAttribute');
  }
}

/// Describes a stack error.
class StackError {
  /// The error code.
  final StackErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  StackError({
    this.errorCode,
    this.errorMessage,
  });

  factory StackError.fromJson(Map<String, dynamic> json) {
    return StackError(
      errorCode: (json['ErrorCode'] as String?)?.toStackErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

enum StackErrorCode {
  storageConnectorError,
  internalServiceError,
}

extension StackErrorCodeValueExtension on StackErrorCode {
  String toValue() {
    switch (this) {
      case StackErrorCode.storageConnectorError:
        return 'STORAGE_CONNECTOR_ERROR';
      case StackErrorCode.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
    }
  }
}

extension StackErrorCodeFromString on String {
  StackErrorCode toStackErrorCode() {
    switch (this) {
      case 'STORAGE_CONNECTOR_ERROR':
        return StackErrorCode.storageConnectorError;
      case 'INTERNAL_SERVICE_ERROR':
        return StackErrorCode.internalServiceError;
    }
    throw Exception('$this is not known in enum StackErrorCode');
  }
}

class StartAppBlockBuilderResult {
  final AppBlockBuilder? appBlockBuilder;

  StartAppBlockBuilderResult({
    this.appBlockBuilder,
  });

  factory StartAppBlockBuilderResult.fromJson(Map<String, dynamic> json) {
    return StartAppBlockBuilderResult(
      appBlockBuilder: json['AppBlockBuilder'] != null
          ? AppBlockBuilder.fromJson(
              json['AppBlockBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilder = this.appBlockBuilder;
    return {
      if (appBlockBuilder != null) 'AppBlockBuilder': appBlockBuilder,
    };
  }
}

class StartFleetResult {
  StartFleetResult();

  factory StartFleetResult.fromJson(Map<String, dynamic> _) {
    return StartFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder? imageBuilder;

  StartImageBuilderResult({
    this.imageBuilder,
  });

  factory StartImageBuilderResult.fromJson(Map<String, dynamic> json) {
    return StartImageBuilderResult(
      imageBuilder: json['ImageBuilder'] != null
          ? ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuilder = this.imageBuilder;
    return {
      if (imageBuilder != null) 'ImageBuilder': imageBuilder,
    };
  }
}

class StopAppBlockBuilderResult {
  final AppBlockBuilder? appBlockBuilder;

  StopAppBlockBuilderResult({
    this.appBlockBuilder,
  });

  factory StopAppBlockBuilderResult.fromJson(Map<String, dynamic> json) {
    return StopAppBlockBuilderResult(
      appBlockBuilder: json['AppBlockBuilder'] != null
          ? AppBlockBuilder.fromJson(
              json['AppBlockBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilder = this.appBlockBuilder;
    return {
      if (appBlockBuilder != null) 'AppBlockBuilder': appBlockBuilder,
    };
  }
}

class StopFleetResult {
  StopFleetResult();

  factory StopFleetResult.fromJson(Map<String, dynamic> _) {
    return StopFleetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder? imageBuilder;

  StopImageBuilderResult({
    this.imageBuilder,
  });

  factory StopImageBuilderResult.fromJson(Map<String, dynamic> json) {
    return StopImageBuilderResult(
      imageBuilder: json['ImageBuilder'] != null
          ? ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuilder = this.imageBuilder;
    return {
      if (imageBuilder != null) 'ImageBuilder': imageBuilder,
    };
  }
}

/// Describes a connector that enables persistent storage for users.
class StorageConnector {
  /// The type of storage connector.
  final StorageConnectorType connectorType;

  /// The names of the domains for the account.
  final List<String>? domains;

  /// The ARN of the storage connector.
  final String? resourceIdentifier;

  StorageConnector({
    required this.connectorType,
    this.domains,
    this.resourceIdentifier,
  });

  factory StorageConnector.fromJson(Map<String, dynamic> json) {
    return StorageConnector(
      connectorType: (json['ConnectorType'] as String).toStorageConnectorType(),
      domains: (json['Domains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceIdentifier: json['ResourceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorType = this.connectorType;
    final domains = this.domains;
    final resourceIdentifier = this.resourceIdentifier;
    return {
      'ConnectorType': connectorType.toValue(),
      if (domains != null) 'Domains': domains,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
    };
  }
}

/// The type of storage connector.
enum StorageConnectorType {
  homefolders,
  googleDrive,
  oneDrive,
}

extension StorageConnectorTypeValueExtension on StorageConnectorType {
  String toValue() {
    switch (this) {
      case StorageConnectorType.homefolders:
        return 'HOMEFOLDERS';
      case StorageConnectorType.googleDrive:
        return 'GOOGLE_DRIVE';
      case StorageConnectorType.oneDrive:
        return 'ONE_DRIVE';
    }
  }
}

extension StorageConnectorTypeFromString on String {
  StorageConnectorType toStorageConnectorType() {
    switch (this) {
      case 'HOMEFOLDERS':
        return StorageConnectorType.homefolders;
      case 'GOOGLE_DRIVE':
        return StorageConnectorType.googleDrive;
      case 'ONE_DRIVE':
        return StorageConnectorType.oneDrive;
    }
    throw Exception('$this is not known in enum StorageConnectorType');
  }
}

enum StreamView {
  app,
  desktop,
}

extension StreamViewValueExtension on StreamView {
  String toValue() {
    switch (this) {
      case StreamView.app:
        return 'APP';
      case StreamView.desktop:
        return 'DESKTOP';
    }
  }
}

extension StreamViewFromString on String {
  StreamView toStreamView() {
    switch (this) {
      case 'APP':
        return StreamView.app;
      case 'DESKTOP':
        return StreamView.desktop;
    }
    throw Exception('$this is not known in enum StreamView');
  }
}

/// The streaming protocol you want your stack to prefer. This can be UDP or
/// TCP. Currently, UDP is only supported in the Windows native client.
class StreamingExperienceSettings {
  /// The preferred protocol that you want to use while streaming your
  /// application.
  final PreferredProtocol? preferredProtocol;

  StreamingExperienceSettings({
    this.preferredProtocol,
  });

  factory StreamingExperienceSettings.fromJson(Map<String, dynamic> json) {
    return StreamingExperienceSettings(
      preferredProtocol:
          (json['PreferredProtocol'] as String?)?.toPreferredProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final preferredProtocol = this.preferredProtocol;
    return {
      if (preferredProtocol != null)
        'PreferredProtocol': preferredProtocol.toValue(),
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

class UpdateAppBlockBuilderResult {
  final AppBlockBuilder? appBlockBuilder;

  UpdateAppBlockBuilderResult({
    this.appBlockBuilder,
  });

  factory UpdateAppBlockBuilderResult.fromJson(Map<String, dynamic> json) {
    return UpdateAppBlockBuilderResult(
      appBlockBuilder: json['AppBlockBuilder'] != null
          ? AppBlockBuilder.fromJson(
              json['AppBlockBuilder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appBlockBuilder = this.appBlockBuilder;
    return {
      if (appBlockBuilder != null) 'AppBlockBuilder': appBlockBuilder,
    };
  }
}

class UpdateApplicationResult {
  final Application? application;

  UpdateApplicationResult({
    this.application,
  });

  factory UpdateApplicationResult.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResult(
      application: json['Application'] != null
          ? Application.fromJson(json['Application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'Application': application,
    };
  }
}

class UpdateDirectoryConfigResult {
  /// Information about the Directory Config object.
  final DirectoryConfig? directoryConfig;

  UpdateDirectoryConfigResult({
    this.directoryConfig,
  });

  factory UpdateDirectoryConfigResult.fromJson(Map<String, dynamic> json) {
    return UpdateDirectoryConfigResult(
      directoryConfig: json['DirectoryConfig'] != null
          ? DirectoryConfig.fromJson(
              json['DirectoryConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryConfig = this.directoryConfig;
    return {
      if (directoryConfig != null) 'DirectoryConfig': directoryConfig,
    };
  }
}

class UpdateEntitlementResult {
  /// The entitlement.
  final Entitlement? entitlement;

  UpdateEntitlementResult({
    this.entitlement,
  });

  factory UpdateEntitlementResult.fromJson(Map<String, dynamic> json) {
    return UpdateEntitlementResult(
      entitlement: json['Entitlement'] != null
          ? Entitlement.fromJson(json['Entitlement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlement = this.entitlement;
    return {
      if (entitlement != null) 'Entitlement': entitlement,
    };
  }
}

class UpdateFleetResult {
  /// Information about the fleet.
  final Fleet? fleet;

  UpdateFleetResult({
    this.fleet,
  });

  factory UpdateFleetResult.fromJson(Map<String, dynamic> json) {
    return UpdateFleetResult(
      fleet: json['Fleet'] != null
          ? Fleet.fromJson(json['Fleet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    return {
      if (fleet != null) 'Fleet': fleet,
    };
  }
}

class UpdateImagePermissionsResult {
  UpdateImagePermissionsResult();

  factory UpdateImagePermissionsResult.fromJson(Map<String, dynamic> _) {
    return UpdateImagePermissionsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStackResult {
  /// Information about the stack.
  final Stack? stack;

  UpdateStackResult({
    this.stack,
  });

  factory UpdateStackResult.fromJson(Map<String, dynamic> json) {
    return UpdateStackResult(
      stack: json['Stack'] != null
          ? Stack.fromJson(json['Stack'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stack = this.stack;
    return {
      if (stack != null) 'Stack': stack,
    };
  }
}

enum UsageReportExecutionErrorCode {
  resourceNotFound,
  accessDenied,
  internalServiceError,
}

extension UsageReportExecutionErrorCodeValueExtension
    on UsageReportExecutionErrorCode {
  String toValue() {
    switch (this) {
      case UsageReportExecutionErrorCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case UsageReportExecutionErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case UsageReportExecutionErrorCode.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
    }
  }
}

extension UsageReportExecutionErrorCodeFromString on String {
  UsageReportExecutionErrorCode toUsageReportExecutionErrorCode() {
    switch (this) {
      case 'RESOURCE_NOT_FOUND':
        return UsageReportExecutionErrorCode.resourceNotFound;
      case 'ACCESS_DENIED':
        return UsageReportExecutionErrorCode.accessDenied;
      case 'INTERNAL_SERVICE_ERROR':
        return UsageReportExecutionErrorCode.internalServiceError;
    }
    throw Exception('$this is not known in enum UsageReportExecutionErrorCode');
  }
}

enum UsageReportSchedule {
  daily,
}

extension UsageReportScheduleValueExtension on UsageReportSchedule {
  String toValue() {
    switch (this) {
      case UsageReportSchedule.daily:
        return 'DAILY';
    }
  }
}

extension UsageReportScheduleFromString on String {
  UsageReportSchedule toUsageReportSchedule() {
    switch (this) {
      case 'DAILY':
        return UsageReportSchedule.daily;
    }
    throw Exception('$this is not known in enum UsageReportSchedule');
  }
}

/// Describes information about the usage report subscription.
class UsageReportSubscription {
  /// The time when the last usage report was generated.
  final DateTime? lastGeneratedReportDate;

  /// The Amazon S3 bucket where generated reports are stored.
  ///
  /// If you enabled on-instance session scripts and Amazon S3 logging for your
  /// session script configuration, AppStream 2.0 created an S3 bucket to store
  /// the script output. The bucket is unique to your account and Region. When you
  /// enable usage reporting in this case, AppStream 2.0 uses the same bucket to
  /// store your usage reports. If you haven't already enabled on-instance session
  /// scripts, when you enable usage reports, AppStream 2.0 creates a new S3
  /// bucket.
  final String? s3BucketName;

  /// The schedule for generating usage reports.
  final UsageReportSchedule? schedule;

  /// The errors that were returned if usage reports couldn't be generated.
  final List<LastReportGenerationExecutionError>? subscriptionErrors;

  UsageReportSubscription({
    this.lastGeneratedReportDate,
    this.s3BucketName,
    this.schedule,
    this.subscriptionErrors,
  });

  factory UsageReportSubscription.fromJson(Map<String, dynamic> json) {
    return UsageReportSubscription(
      lastGeneratedReportDate:
          timeStampFromJson(json['LastGeneratedReportDate']),
      s3BucketName: json['S3BucketName'] as String?,
      schedule: (json['Schedule'] as String?)?.toUsageReportSchedule(),
      subscriptionErrors: (json['SubscriptionErrors'] as List?)
          ?.whereNotNull()
          .map((e) => LastReportGenerationExecutionError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastGeneratedReportDate = this.lastGeneratedReportDate;
    final s3BucketName = this.s3BucketName;
    final schedule = this.schedule;
    final subscriptionErrors = this.subscriptionErrors;
    return {
      if (lastGeneratedReportDate != null)
        'LastGeneratedReportDate': unixTimestampToJson(lastGeneratedReportDate),
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (schedule != null) 'Schedule': schedule.toValue(),
      if (subscriptionErrors != null) 'SubscriptionErrors': subscriptionErrors,
    };
  }
}

/// Describes a user in the user pool.
class User {
  /// The authentication type for the user.
  final AuthenticationType authenticationType;

  /// The ARN of the user.
  final String? arn;

  /// The date and time the user was created in the user pool.
  final DateTime? createdTime;

  /// Specifies whether the user in the user pool is enabled.
  final bool? enabled;

  /// The first name, or given name, of the user.
  final String? firstName;

  /// The last name, or surname, of the user.
  final String? lastName;

  /// The status of the user in the user pool. The status can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// UNCONFIRMED – The user is created but not confirmed.
  /// </li>
  /// <li>
  /// CONFIRMED – The user is confirmed.
  /// </li>
  /// <li>
  /// ARCHIVED – The user is no longer active.
  /// </li>
  /// <li>
  /// COMPROMISED – The user is disabled because of a potential security threat.
  /// </li>
  /// <li>
  /// UNKNOWN – The user status is not known.
  /// </li>
  /// </ul>
  final String? status;

  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  final String? userName;

  User({
    required this.authenticationType,
    this.arn,
    this.createdTime,
    this.enabled,
    this.firstName,
    this.lastName,
    this.status,
    this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      authenticationType:
          (json['AuthenticationType'] as String).toAuthenticationType(),
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      enabled: json['Enabled'] as bool?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      status: json['Status'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final enabled = this.enabled;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final status = this.status;
    final userName = this.userName;
    return {
      'AuthenticationType': authenticationType.toValue(),
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (enabled != null) 'Enabled': enabled,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (status != null) 'Status': status,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Describes an action and whether the action is enabled or disabled for users
/// during their streaming sessions.
class UserSetting {
  /// The action that is enabled or disabled.
  final Action action;

  /// Indicates whether the action is enabled or disabled.
  final Permission permission;

  /// Specifies the number of characters that can be copied by end users from the
  /// local device to the remote session, and to the local device from the remote
  /// session.
  ///
  /// This can be specified only for the
  /// <code>CLIPBOARD_COPY_FROM_LOCAL_DEVICE</code> and
  /// <code>CLIPBOARD_COPY_TO_LOCAL_DEVICE</code> actions.
  ///
  /// This defaults to 20,971,520 (20 MB) when unspecified and the permission is
  /// <code>ENABLED</code>. This can't be specified when the permission is
  /// <code>DISABLED</code>.
  ///
  /// This can only be specified for AlwaysOn and OnDemand fleets. The attribute
  /// is not supported on Elastic fleets.
  ///
  /// The value can be between 1 and 20,971,520 (20 MB).
  final int? maximumLength;

  UserSetting({
    required this.action,
    required this.permission,
    this.maximumLength,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) {
    return UserSetting(
      action: (json['Action'] as String).toAction(),
      permission: (json['Permission'] as String).toPermission(),
      maximumLength: json['MaximumLength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final permission = this.permission;
    final maximumLength = this.maximumLength;
    return {
      'Action': action.toValue(),
      'Permission': permission.toValue(),
      if (maximumLength != null) 'MaximumLength': maximumLength,
    };
  }
}

/// Describes a user in the user pool and the associated stack.
class UserStackAssociation {
  /// The authentication type for the user.
  final AuthenticationType authenticationType;

  /// The name of the stack that is associated with the user.
  final String stackName;

  /// The email address of the user who is associated with the stack.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  final String userName;

  /// Specifies whether a welcome email is sent to a user after the user is
  /// created in the user pool.
  final bool? sendEmailNotification;

  UserStackAssociation({
    required this.authenticationType,
    required this.stackName,
    required this.userName,
    this.sendEmailNotification,
  });

  factory UserStackAssociation.fromJson(Map<String, dynamic> json) {
    return UserStackAssociation(
      authenticationType:
          (json['AuthenticationType'] as String).toAuthenticationType(),
      stackName: json['StackName'] as String,
      userName: json['UserName'] as String,
      sendEmailNotification: json['SendEmailNotification'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final stackName = this.stackName;
    final userName = this.userName;
    final sendEmailNotification = this.sendEmailNotification;
    return {
      'AuthenticationType': authenticationType.toValue(),
      'StackName': stackName,
      'UserName': userName,
      if (sendEmailNotification != null)
        'SendEmailNotification': sendEmailNotification,
    };
  }
}

/// Describes the error that is returned when a user can’t be associated with or
/// disassociated from a stack.
class UserStackAssociationError {
  /// The error code for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  final UserStackAssociationErrorCode? errorCode;

  /// The error message for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  final String? errorMessage;

  /// Information about the user and associated stack.
  final UserStackAssociation? userStackAssociation;

  UserStackAssociationError({
    this.errorCode,
    this.errorMessage,
    this.userStackAssociation,
  });

  factory UserStackAssociationError.fromJson(Map<String, dynamic> json) {
    return UserStackAssociationError(
      errorCode:
          (json['ErrorCode'] as String?)?.toUserStackAssociationErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      userStackAssociation: json['UserStackAssociation'] != null
          ? UserStackAssociation.fromJson(
              json['UserStackAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final userStackAssociation = this.userStackAssociation;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (userStackAssociation != null)
        'UserStackAssociation': userStackAssociation,
    };
  }
}

enum UserStackAssociationErrorCode {
  stackNotFound,
  userNameNotFound,
  directoryNotFound,
  internalError,
}

extension UserStackAssociationErrorCodeValueExtension
    on UserStackAssociationErrorCode {
  String toValue() {
    switch (this) {
      case UserStackAssociationErrorCode.stackNotFound:
        return 'STACK_NOT_FOUND';
      case UserStackAssociationErrorCode.userNameNotFound:
        return 'USER_NAME_NOT_FOUND';
      case UserStackAssociationErrorCode.directoryNotFound:
        return 'DIRECTORY_NOT_FOUND';
      case UserStackAssociationErrorCode.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension UserStackAssociationErrorCodeFromString on String {
  UserStackAssociationErrorCode toUserStackAssociationErrorCode() {
    switch (this) {
      case 'STACK_NOT_FOUND':
        return UserStackAssociationErrorCode.stackNotFound;
      case 'USER_NAME_NOT_FOUND':
        return UserStackAssociationErrorCode.userNameNotFound;
      case 'DIRECTORY_NOT_FOUND':
        return UserStackAssociationErrorCode.directoryNotFound;
      case 'INTERNAL_ERROR':
        return UserStackAssociationErrorCode.internalError;
    }
    throw Exception('$this is not known in enum UserStackAssociationErrorCode');
  }
}

enum VisibilityType {
  public,
  private,
  shared,
}

extension VisibilityTypeValueExtension on VisibilityType {
  String toValue() {
    switch (this) {
      case VisibilityType.public:
        return 'PUBLIC';
      case VisibilityType.private:
        return 'PRIVATE';
      case VisibilityType.shared:
        return 'SHARED';
    }
  }
}

extension VisibilityTypeFromString on String {
  VisibilityType toVisibilityType() {
    switch (this) {
      case 'PUBLIC':
        return VisibilityType.public;
      case 'PRIVATE':
        return VisibilityType.private;
      case 'SHARED':
        return VisibilityType.shared;
    }
    throw Exception('$this is not known in enum VisibilityType');
  }
}

/// Describes VPC configuration information for fleets and image builders.
class VpcConfig {
  /// The identifiers of the security groups for the fleet or image builder.
  final List<String>? securityGroupIds;

  /// The identifiers of the subnets to which a network interface is attached from
  /// the fleet instance or image builder instance. Fleet instances use one or
  /// more subnets. Image builder instances use one subnet.
  final List<String>? subnetIds;

  VpcConfig({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class EntitlementAlreadyExistsException extends _s.GenericAwsException {
  EntitlementAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'EntitlementAlreadyExistsException',
            message: message);
}

class EntitlementNotFoundException extends _s.GenericAwsException {
  EntitlementNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'EntitlementNotFoundException', message: message);
}

class IncompatibleImageException extends _s.GenericAwsException {
  IncompatibleImageException({String? type, String? message})
      : super(type: type, code: 'IncompatibleImageException', message: message);
}

class InvalidAccountStatusException extends _s.GenericAwsException {
  InvalidAccountStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAccountStatusException',
            message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String? type, String? message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class RequestLimitExceededException extends _s.GenericAwsException {
  RequestLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestLimitExceededException',
            message: message);
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

class ResourceNotAvailableException extends _s.GenericAwsException {
  ResourceNotAvailableException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNotAvailableException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'EntitlementAlreadyExistsException': (type, message) =>
      EntitlementAlreadyExistsException(type: type, message: message),
  'EntitlementNotFoundException': (type, message) =>
      EntitlementNotFoundException(type: type, message: message),
  'IncompatibleImageException': (type, message) =>
      IncompatibleImageException(type: type, message: message),
  'InvalidAccountStatusException': (type, message) =>
      InvalidAccountStatusException(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidRoleException': (type, message) =>
      InvalidRoleException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'RequestLimitExceededException': (type, message) =>
      RequestLimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotAvailableException': (type, message) =>
      ResourceNotAvailableException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
