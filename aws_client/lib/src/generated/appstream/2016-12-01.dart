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

part '2016-12-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appstream2',
            signingName: 'appstream',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String fleetName,
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.AssociateFleet'
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
      },
    );

    return AssociateFleetResult.fromJson(jsonResponse.body);
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
    @_s.required List<UserStackAssociation> userStackAssociations,
  }) async {
    ArgumentError.checkNotNull(userStackAssociations, 'userStackAssociations');
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
    @_s.required List<UserStackAssociation> userStackAssociations,
  }) async {
    ArgumentError.checkNotNull(userStackAssociations, 'userStackAssociations');
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
    @_s.required String destinationImageName,
    @_s.required String destinationRegion,
    @_s.required String sourceImageName,
    String destinationImageDescription,
  }) async {
    ArgumentError.checkNotNull(destinationImageName, 'destinationImageName');
    _s.validateStringPattern(
      'destinationImageName',
      destinationImageName,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationRegion, 'destinationRegion');
    _s.validateStringLength(
      'destinationRegion',
      destinationRegion,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceImageName, 'sourceImageName');
    _s.validateStringPattern(
      'sourceImageName',
      sourceImageName,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'destinationImageDescription',
      destinationImageDescription,
      0,
      256,
    );
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
  /// Parameter [serviceAccountCredentials] :
  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  Future<CreateDirectoryConfigResult> createDirectoryConfig({
    @_s.required String directoryName,
    @_s.required List<String> organizationalUnitDistinguishedNames,
    ServiceAccountCredentials serviceAccountCredentials,
  }) async {
    ArgumentError.checkNotNull(directoryName, 'directoryName');
    ArgumentError.checkNotNull(organizationalUnitDistinguishedNames,
        'organizationalUnitDistinguishedNames');
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
        if (serviceAccountCredentials != null)
          'ServiceAccountCredentials': serviceAccountCredentials,
      },
    );

    return CreateDirectoryConfigResult.fromJson(jsonResponse.body);
  }

  /// Creates a fleet. A fleet consists of streaming instances that run a
  /// specified image.
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
  /// Parameter [computeCapacity] :
  /// The desired capacity for the fleet.
  ///
  /// Parameter [instanceType] :
  /// The instance type to use when launching fleet instances. The following
  /// instance types are available:
  ///
  /// <ul>
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
  /// A unique name for the fleet.
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
  /// Parameter [maxUserDurationInSeconds] :
  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
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
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the fleet.
  Future<CreateFleetResult> createFleet({
    @_s.required ComputeCapacity computeCapacity,
    @_s.required String instanceType,
    @_s.required String name,
    String description,
    int disconnectTimeoutInSeconds,
    String displayName,
    DomainJoinInfo domainJoinInfo,
    bool enableDefaultInternetAccess,
    FleetType fleetType,
    String iamRoleArn,
    int idleDisconnectTimeoutInSeconds,
    String imageArn,
    String imageName,
    int maxUserDurationInSeconds,
    StreamView streamView,
    Map<String, String> tags,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(computeCapacity, 'computeCapacity');
    ArgumentError.checkNotNull(instanceType, 'instanceType');
    _s.validateStringLength(
      'instanceType',
      instanceType,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    _s.validateStringPattern(
      'iamRoleArn',
      iamRoleArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringPattern(
      'imageArn',
      imageArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringLength(
      'imageName',
      imageName,
      1,
      1152921504606846976,
    );
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
        'ComputeCapacity': computeCapacity,
        'InstanceType': instanceType,
        'Name': name,
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
        if (maxUserDurationInSeconds != null)
          'MaxUserDurationInSeconds': maxUserDurationInSeconds,
        if (streamView != null) 'StreamView': streamView.toValue(),
        if (tags != null) 'Tags': tags,
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
    @_s.required String instanceType,
    @_s.required String name,
    List<AccessEndpoint> accessEndpoints,
    String appstreamAgentVersion,
    String description,
    String displayName,
    DomainJoinInfo domainJoinInfo,
    bool enableDefaultInternetAccess,
    String iamRoleArn,
    String imageArn,
    String imageName,
    Map<String, String> tags,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(instanceType, 'instanceType');
    _s.validateStringLength(
      'instanceType',
      instanceType,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'appstreamAgentVersion',
      appstreamAgentVersion,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    _s.validateStringPattern(
      'iamRoleArn',
      iamRoleArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringPattern(
      'imageArn',
      imageArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringLength(
      'imageName',
      imageName,
      1,
      1152921504606846976,
    );
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
    @_s.required String name,
    int validity,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    @_s.required String name,
    List<AccessEndpoint> accessEndpoints,
    ApplicationSettings applicationSettings,
    String description,
    String displayName,
    List<String> embedHostDomains,
    String feedbackURL,
    String redirectURL,
    List<StorageConnector> storageConnectors,
    Map<String, String> tags,
    List<UserSetting> userSettings,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    _s.validateStringLength(
      'feedbackURL',
      feedbackURL,
      0,
      1000,
    );
    _s.validateStringLength(
      'redirectURL',
      redirectURL,
      0,
      1000,
    );
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
  /// the name that you specified as <b>Name</b> in the Image Assistant.
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
    @_s.required String fleetName,
    @_s.required String stackName,
    @_s.required String userId,
    String applicationId,
    String sessionContext,
    int validity,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      2,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationId',
      applicationId,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'sessionContext',
      sessionContext,
      1,
      1152921504606846976,
    );
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
    @_s.required AuthenticationType authenticationType,
    @_s.required String userName,
    String firstName,
    String lastName,
    MessageAction messageAction,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'firstName',
      firstName,
      0,
      2048,
    );
    _s.validateStringPattern(
      'firstName',
      firstName,
      r'''^[A-Za-z0-9_\-\s]+$''',
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      0,
      2048,
    );
    _s.validateStringPattern(
      'lastName',
      lastName,
      r'''^[A-Za-z0-9_\-\s]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType?.toValue() ?? '',
        'UserName': userName,
        if (firstName != null) 'FirstName': firstName,
        if (lastName != null) 'LastName': lastName,
        if (messageAction != null) 'MessageAction': messageAction.toValue(),
      },
    );

    return CreateUserResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryName,
  }) async {
    ArgumentError.checkNotNull(directoryName, 'directoryName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteDirectoryConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryName': directoryName,
      },
    );

    return DeleteDirectoryConfigResult.fromJson(jsonResponse.body);
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteFleet'
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

    return DeleteFleetResult.fromJson(jsonResponse.body);
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
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
    @_s.required String name,
    @_s.required String sharedAccountId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sharedAccountId, 'sharedAccountId');
    _s.validateStringPattern(
      'sharedAccountId',
      sharedAccountId,
      r'''^\d+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteImagePermissions'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteImagePermissionsResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified stack. After the stack is deleted, the application
  /// streaming environment provided by the stack is no longer available to
  /// users. Also, any reservations made for application streaming sessions for
  /// the stack are released.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the stack.
  Future<void> deleteStack({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteStack'
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

    return DeleteStackResult.fromJson(jsonResponse.body);
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteUsageReportSubscriptionResult.fromJson(jsonResponse.body);
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
    @_s.required AuthenticationType authenticationType,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType?.toValue() ?? '',
        'UserName': userName,
      },
    );

    return DeleteUserResult.fromJson(jsonResponse.body);
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
    List<String> directoryNames,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    List<String> names,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    int maxResults,
    List<String> names,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    @_s.required String name,
    int maxResults,
    String nextToken,
    List<String> sharedAwsAccountIds,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
    List<String> arns,
    int maxResults,
    List<String> names,
    String nextToken,
    VisibilityType type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
    @_s.required String fleetName,
    @_s.required String stackName,
    AuthenticationType authenticationType,
    int limit,
    String nextToken,
    String userId,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'userId',
      userId,
      2,
      128,
    );
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
    List<String> names,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    AuthenticationType authenticationType,
    int maxResults,
    String nextToken,
    String stackName,
    String userName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
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
    @_s.required AuthenticationType authenticationType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
        'AuthenticationType': authenticationType?.toValue() ?? '',
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
    @_s.required AuthenticationType authenticationType,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DisableUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType?.toValue() ?? '',
        'UserName': userName,
      },
    );

    return DisableUserResult.fromJson(jsonResponse.body);
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
    @_s.required String fleetName,
    @_s.required String stackName,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.DisassociateFleet'
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
      },
    );

    return DisassociateFleetResult.fromJson(jsonResponse.body);
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
    @_s.required AuthenticationType authenticationType,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.EnableUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthenticationType': authenticationType?.toValue() ?? '',
        'UserName': userName,
      },
    );

    return EnableUserResult.fromJson(jsonResponse.body);
  }

  /// Immediately stops the specified streaming session.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the streaming session.
  Future<void> expireSession({
    @_s.required String sessionId,
  }) async {
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    _s.validateStringLength(
      'sessionId',
      sessionId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.ExpireSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return ExpireSessionResult.fromJson(jsonResponse.body);
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
    @_s.required String stackName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(stackName, 'stackName');
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    @_s.required String fleetName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
      isRequired: true,
    );
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StartFleet'
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

    return StartFleetResult.fromJson(jsonResponse.body);
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
    @_s.required String name,
    String appstreamAgentVersion,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'appstreamAgentVersion',
      appstreamAgentVersion,
      1,
      100,
    );
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

  /// Stops the specified fleet.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the fleet.
  Future<void> stopFleet({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.StopFleet'
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

    return StopFleetResult.fromJson(jsonResponse.body);
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
  /// Parameter [organizationalUnitDistinguishedNames] :
  /// The distinguished names of the organizational units for computer accounts.
  ///
  /// Parameter [serviceAccountCredentials] :
  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  Future<UpdateDirectoryConfigResult> updateDirectoryConfig({
    @_s.required String directoryName,
    List<String> organizationalUnitDistinguishedNames,
    ServiceAccountCredentials serviceAccountCredentials,
  }) async {
    ArgumentError.checkNotNull(directoryName, 'directoryName');
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
        if (organizationalUnitDistinguishedNames != null)
          'OrganizationalUnitDistinguishedNames':
              organizationalUnitDistinguishedNames,
        if (serviceAccountCredentials != null)
          'ServiceAccountCredentials': serviceAccountCredentials,
      },
    );

    return UpdateDirectoryConfigResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified fleet.
  ///
  /// If the fleet is in the <code>STOPPED</code> state, you can update any
  /// attribute except the fleet name. If the fleet is in the
  /// <code>RUNNING</code> state, you can update the <code>DisplayName</code>,
  /// <code>ComputeCapacity</code>, <code>ImageARN</code>,
  /// <code>ImageName</code>, <code>IdleDisconnectTimeoutInSeconds</code>, and
  /// <code>DisconnectTimeoutInSeconds</code> attributes. If the fleet is in the
  /// <code>STARTING</code> or <code>STOPPING</code> state, you can't update it.
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
  /// The desired capacity for the fleet.
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
  /// Parameter [maxUserDurationInSeconds] :
  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  ///
  /// Parameter [name] :
  /// A unique name for the fleet.
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
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the fleet.
  Future<UpdateFleetResult> updateFleet({
    List<FleetAttribute> attributesToDelete,
    ComputeCapacity computeCapacity,
    bool deleteVpcConfig,
    String description,
    int disconnectTimeoutInSeconds,
    String displayName,
    DomainJoinInfo domainJoinInfo,
    bool enableDefaultInternetAccess,
    String iamRoleArn,
    int idleDisconnectTimeoutInSeconds,
    String imageArn,
    String imageName,
    String instanceType,
    int maxUserDurationInSeconds,
    String name,
    StreamView streamView,
    VpcConfig vpcConfig,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    _s.validateStringPattern(
      'iamRoleArn',
      iamRoleArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringPattern(
      'imageArn',
      imageArn,
      r'''^arn:aws(?:\-cn|\-iso\-b|\-iso|\-us\-gov)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.\\-]{0,1023}$''',
    );
    _s.validateStringLength(
      'imageName',
      imageName,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'instanceType',
      instanceType,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
    );
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
              attributesToDelete.map((e) => e?.toValue() ?? '').toList(),
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
        if (maxUserDurationInSeconds != null)
          'MaxUserDurationInSeconds': maxUserDurationInSeconds,
        if (name != null) 'Name': name,
        if (streamView != null) 'StreamView': streamView.toValue(),
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
    @_s.required ImagePermissions imagePermissions,
    @_s.required String name,
    @_s.required String sharedAccountId,
  }) async {
    ArgumentError.checkNotNull(imagePermissions, 'imagePermissions');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,100}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sharedAccountId, 'sharedAccountId');
    _s.validateStringPattern(
      'sharedAccountId',
      sharedAccountId,
      r'''^\d+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PhotonAdminProxyService.UpdateImagePermissions'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateImagePermissionsResult.fromJson(jsonResponse.body);
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
  /// Parameter [userSettings] :
  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default, these actions are enabled.
  Future<UpdateStackResult> updateStack({
    @_s.required String name,
    List<AccessEndpoint> accessEndpoints,
    ApplicationSettings applicationSettings,
    List<StackAttribute> attributesToDelete,
    bool deleteStorageConnectors,
    String description,
    String displayName,
    List<String> embedHostDomains,
    String feedbackURL,
    String redirectURL,
    List<StorageConnector> storageConnectors,
    List<UserSetting> userSettings,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    _s.validateStringLength(
      'feedbackURL',
      feedbackURL,
      0,
      1000,
    );
    _s.validateStringLength(
      'redirectURL',
      redirectURL,
      0,
      1000,
    );
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
              attributesToDelete.map((e) => e?.toValue() ?? '').toList(),
        if (deleteStorageConnectors != null)
          'DeleteStorageConnectors': deleteStorageConnectors,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
        if (embedHostDomains != null) 'EmbedHostDomains': embedHostDomains,
        if (feedbackURL != null) 'FeedbackURL': feedbackURL,
        if (redirectURL != null) 'RedirectURL': redirectURL,
        if (storageConnectors != null) 'StorageConnectors': storageConnectors,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessEndpoint {
  /// The type of interface endpoint.
  @_s.JsonKey(name: 'EndpointType')
  final AccessEndpointType endpointType;

  /// The identifier (ID) of the VPC in which the interface endpoint is used.
  @_s.JsonKey(name: 'VpceId')
  final String vpceId;

  AccessEndpoint({
    @_s.required this.endpointType,
    this.vpceId,
  });
  factory AccessEndpoint.fromJson(Map<String, dynamic> json) =>
      _$AccessEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$AccessEndpointToJson(this);
}

enum AccessEndpointType {
  @_s.JsonValue('STREAMING')
  streaming,
}

enum Action {
  @_s.JsonValue('CLIPBOARD_COPY_FROM_LOCAL_DEVICE')
  clipboardCopyFromLocalDevice,
  @_s.JsonValue('CLIPBOARD_COPY_TO_LOCAL_DEVICE')
  clipboardCopyToLocalDevice,
  @_s.JsonValue('FILE_UPLOAD')
  fileUpload,
  @_s.JsonValue('FILE_DOWNLOAD')
  fileDownload,
  @_s.JsonValue('PRINTING_TO_LOCAL_DEVICE')
  printingToLocalDevice,
}

/// Describes an application in the application catalog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Application {
  /// The application name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// If there is a problem, the application can be disabled after image creation.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The URL for the application icon. This URL might be time-limited.
  @_s.JsonKey(name: 'IconURL')
  final String iconURL;

  /// The arguments that are passed to the application at launch.
  @_s.JsonKey(name: 'LaunchParameters')
  final String launchParameters;

  /// The path to the application executable in the instance.
  @_s.JsonKey(name: 'LaunchPath')
  final String launchPath;

  /// Additional attributes that describe the application.
  @_s.JsonKey(name: 'Metadata')
  final Map<String, String> metadata;

  /// The name of the application.
  @_s.JsonKey(name: 'Name')
  final String name;

  Application({
    this.displayName,
    this.enabled,
    this.iconURL,
    this.launchParameters,
    this.launchPath,
    this.metadata,
    this.name,
  });
  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}

/// The persistent application settings for users of a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationSettings {
  /// Enables or disables persistent application settings for users during their
  /// streaming sessions.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored. You can allow the same persistent application settings
  /// to be used across multiple stacks by specifying the same settings group for
  /// each stack.
  @_s.JsonKey(name: 'SettingsGroup')
  final String settingsGroup;

  ApplicationSettings({
    @_s.required this.enabled,
    this.settingsGroup,
  });
  Map<String, dynamic> toJson() => _$ApplicationSettingsToJson(this);
}

/// Describes the persistent application settings for users of a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSettingsResponse {
  /// Specifies whether persistent application settings are enabled for users
  /// during their streaming sessions.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The S3 bucket where users’ persistent application settings are stored. When
  /// persistent application settings are enabled for the first time for an
  /// account in an AWS Region, an S3 bucket is created. The bucket is unique to
  /// the AWS account and the Region.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored.
  @_s.JsonKey(name: 'SettingsGroup')
  final String settingsGroup;

  ApplicationSettingsResponse({
    this.enabled,
    this.s3BucketName,
    this.settingsGroup,
  });
  factory ApplicationSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateFleetResult {
  AssociateFleetResult();
  factory AssociateFleetResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateFleetResultFromJson(json);
}

enum AuthenticationType {
  @_s.JsonValue('API')
  api,
  @_s.JsonValue('SAML')
  saml,
  @_s.JsonValue('USERPOOL')
  userpool,
}

extension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.api:
        return 'API';
      case AuthenticationType.saml:
        return 'SAML';
      case AuthenticationType.userpool:
        return 'USERPOOL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  @_s.JsonKey(name: 'errors')
  final List<UserStackAssociationError> errors;

  BatchAssociateUserStackResult({
    this.errors,
  });
  factory BatchAssociateUserStackResult.fromJson(Map<String, dynamic> json) =>
      _$BatchAssociateUserStackResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  @_s.JsonKey(name: 'errors')
  final List<UserStackAssociationError> errors;

  BatchDisassociateUserStackResult({
    this.errors,
  });
  factory BatchDisassociateUserStackResult.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateUserStackResultFromJson(json);
}

/// Describes the capacity for a fleet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComputeCapacity {
  /// The desired number of streaming instances.
  @_s.JsonKey(name: 'DesiredInstances')
  final int desiredInstances;

  ComputeCapacity({
    @_s.required this.desiredInstances,
  });
  Map<String, dynamic> toJson() => _$ComputeCapacityToJson(this);
}

/// Describes the capacity status for a fleet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComputeCapacityStatus {
  /// The desired number of streaming instances.
  @_s.JsonKey(name: 'Desired')
  final int desired;

  /// The number of currently available instances that can be used to stream
  /// sessions.
  @_s.JsonKey(name: 'Available')
  final int available;

  /// The number of instances in use for streaming.
  @_s.JsonKey(name: 'InUse')
  final int inUse;

  /// The total number of simultaneous streaming instances that are running.
  @_s.JsonKey(name: 'Running')
  final int running;

  ComputeCapacityStatus({
    @_s.required this.desired,
    this.available,
    this.inUse,
    this.running,
  });
  factory ComputeCapacityStatus.fromJson(Map<String, dynamic> json) =>
      _$ComputeCapacityStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopyImageResponse {
  /// The name of the destination image.
  @_s.JsonKey(name: 'DestinationImageName')
  final String destinationImageName;

  CopyImageResponse({
    this.destinationImageName,
  });
  factory CopyImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectoryConfigResult {
  /// Information about the directory configuration.
  @_s.JsonKey(name: 'DirectoryConfig')
  final DirectoryConfig directoryConfig;

  CreateDirectoryConfigResult({
    this.directoryConfig,
  });
  factory CreateDirectoryConfigResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDirectoryConfigResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFleetResult {
  /// Information about the fleet.
  @_s.JsonKey(name: 'Fleet')
  final Fleet fleet;

  CreateFleetResult({
    this.fleet,
  });
  factory CreateFleetResult.fromJson(Map<String, dynamic> json) =>
      _$CreateFleetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImageBuilderResult {
  /// Information about the image builder.
  @_s.JsonKey(name: 'ImageBuilder')
  final ImageBuilder imageBuilder;

  CreateImageBuilderResult({
    this.imageBuilder,
  });
  factory CreateImageBuilderResult.fromJson(Map<String, dynamic> json) =>
      _$CreateImageBuilderResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImageBuilderStreamingURLResult {
  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Expires')
  final DateTime expires;

  /// The URL to start the AppStream 2.0 streaming session.
  @_s.JsonKey(name: 'StreamingURL')
  final String streamingURL;

  CreateImageBuilderStreamingURLResult({
    this.expires,
    this.streamingURL,
  });
  factory CreateImageBuilderStreamingURLResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateImageBuilderStreamingURLResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStackResult {
  /// Information about the stack.
  @_s.JsonKey(name: 'Stack')
  final Stack stack;

  CreateStackResult({
    this.stack,
  });
  factory CreateStackResult.fromJson(Map<String, dynamic> json) =>
      _$CreateStackResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStreamingURLResult {
  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Expires')
  final DateTime expires;

  /// The URL to start the AppStream 2.0 streaming session.
  @_s.JsonKey(name: 'StreamingURL')
  final String streamingURL;

  CreateStreamingURLResult({
    this.expires,
    this.streamingURL,
  });
  factory CreateStreamingURLResult.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamingURLResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The schedule for generating usage reports.
  @_s.JsonKey(name: 'Schedule')
  final UsageReportSchedule schedule;

  CreateUsageReportSubscriptionResult({
    this.s3BucketName,
    this.schedule,
  });
  factory CreateUsageReportSubscriptionResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUsageReportSubscriptionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResult {
  CreateUserResult();
  factory CreateUserResult.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectoryConfigResult {
  DeleteDirectoryConfigResult();
  factory DeleteDirectoryConfigResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDirectoryConfigResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFleetResult {
  DeleteFleetResult();
  factory DeleteFleetResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteFleetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImageBuilderResult {
  /// Information about the image builder.
  @_s.JsonKey(name: 'ImageBuilder')
  final ImageBuilder imageBuilder;

  DeleteImageBuilderResult({
    this.imageBuilder,
  });
  factory DeleteImageBuilderResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteImageBuilderResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImagePermissionsResult {
  DeleteImagePermissionsResult();
  factory DeleteImagePermissionsResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteImagePermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImageResult {
  /// Information about the image.
  @_s.JsonKey(name: 'Image')
  final Image image;

  DeleteImageResult({
    this.image,
  });
  factory DeleteImageResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteImageResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteStackResult {
  DeleteStackResult();
  factory DeleteStackResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteStackResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUsageReportSubscriptionResult {
  DeleteUsageReportSubscriptionResult();
  factory DeleteUsageReportSubscriptionResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteUsageReportSubscriptionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserResult {
  DeleteUserResult();
  factory DeleteUserResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectoryConfigsResult {
  /// Information about the directory configurations. Note that although the
  /// response syntax in this topic includes the account password, this password
  /// is not returned in the actual response.
  @_s.JsonKey(name: 'DirectoryConfigs')
  final List<DirectoryConfig> directoryConfigs;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDirectoryConfigsResult({
    this.directoryConfigs,
    this.nextToken,
  });
  factory DescribeDirectoryConfigsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDirectoryConfigsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetsResult {
  /// Information about the fleets.
  @_s.JsonKey(name: 'Fleets')
  final List<Fleet> fleets;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFleetsResult({
    this.fleets,
    this.nextToken,
  });
  factory DescribeFleetsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImageBuildersResult {
  /// Information about the image builders.
  @_s.JsonKey(name: 'ImageBuilders')
  final List<ImageBuilder> imageBuilders;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeImageBuildersResult({
    this.imageBuilders,
    this.nextToken,
  });
  factory DescribeImageBuildersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeImageBuildersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImagePermissionsResult {
  /// The name of the private image.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The permissions for a private image that you own.
  @_s.JsonKey(name: 'SharedImagePermissionsList')
  final List<SharedImagePermissions> sharedImagePermissionsList;

  DescribeImagePermissionsResult({
    this.name,
    this.nextToken,
    this.sharedImagePermissionsList,
  });
  factory DescribeImagePermissionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeImagePermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImagesResult {
  /// Information about the images.
  @_s.JsonKey(name: 'Images')
  final List<Image> images;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeImagesResult({
    this.images,
    this.nextToken,
  });
  factory DescribeImagesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeImagesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSessionsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the streaming sessions.
  @_s.JsonKey(name: 'Sessions')
  final List<Session> sessions;

  DescribeSessionsResult({
    this.nextToken,
    this.sessions,
  });
  factory DescribeSessionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeSessionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStacksResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the stacks.
  @_s.JsonKey(name: 'Stacks')
  final List<Stack> stacks;

  DescribeStacksResult({
    this.nextToken,
    this.stacks,
  });
  factory DescribeStacksResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeStacksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUsageReportSubscriptionsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the usage report subscription.
  @_s.JsonKey(name: 'UsageReportSubscriptions')
  final List<UsageReportSubscription> usageReportSubscriptions;

  DescribeUsageReportSubscriptionsResult({
    this.nextToken,
    this.usageReportSubscriptions,
  });
  factory DescribeUsageReportSubscriptionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUsageReportSubscriptionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserStackAssociationsResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The UserStackAssociation objects.
  @_s.JsonKey(name: 'UserStackAssociations')
  final List<UserStackAssociation> userStackAssociations;

  DescribeUserStackAssociationsResult({
    this.nextToken,
    this.userStackAssociations,
  });
  factory DescribeUserStackAssociationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUserStackAssociationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUsersResult {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about users in the user pool.
  @_s.JsonKey(name: 'Users')
  final List<User> users;

  DescribeUsersResult({
    this.nextToken,
    this.users,
  });
  factory DescribeUsersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeUsersResultFromJson(json);
}

/// Describes the configuration information required to join fleets and image
/// builders to Microsoft Active Directory domains.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectoryConfig {
  /// The fully qualified name of the directory (for example, corp.example.com).
  @_s.JsonKey(name: 'DirectoryName')
  final String directoryName;

  /// The time the directory configuration was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The distinguished names of the organizational units for computer accounts.
  @_s.JsonKey(name: 'OrganizationalUnitDistinguishedNames')
  final List<String> organizationalUnitDistinguishedNames;

  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  @_s.JsonKey(name: 'ServiceAccountCredentials')
  final ServiceAccountCredentials serviceAccountCredentials;

  DirectoryConfig({
    @_s.required this.directoryName,
    this.createdTime,
    this.organizationalUnitDistinguishedNames,
    this.serviceAccountCredentials,
  });
  factory DirectoryConfig.fromJson(Map<String, dynamic> json) =>
      _$DirectoryConfigFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableUserResult {
  DisableUserResult();
  factory DisableUserResult.fromJson(Map<String, dynamic> json) =>
      _$DisableUserResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateFleetResult {
  DisassociateFleetResult();
  factory DisassociateFleetResult.fromJson(Map<String, dynamic> json) =>
      _$DisassociateFleetResultFromJson(json);
}

/// Describes the configuration information required to join fleets and image
/// builders to Microsoft Active Directory domains.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainJoinInfo {
  /// The fully qualified name of the directory (for example, corp.example.com).
  @_s.JsonKey(name: 'DirectoryName')
  final String directoryName;

  /// The distinguished name of the organizational unit for computer accounts.
  @_s.JsonKey(name: 'OrganizationalUnitDistinguishedName')
  final String organizationalUnitDistinguishedName;

  DomainJoinInfo({
    this.directoryName,
    this.organizationalUnitDistinguishedName,
  });
  factory DomainJoinInfo.fromJson(Map<String, dynamic> json) =>
      _$DomainJoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DomainJoinInfoToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableUserResult {
  EnableUserResult();
  factory EnableUserResult.fromJson(Map<String, dynamic> json) =>
      _$EnableUserResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExpireSessionResult {
  ExpireSessionResult();
  factory ExpireSessionResult.fromJson(Map<String, dynamic> json) =>
      _$ExpireSessionResultFromJson(json);
}

/// Describes a fleet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Fleet {
  /// The Amazon Resource Name (ARN) for the fleet.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The capacity status for the fleet.
  @_s.JsonKey(name: 'ComputeCapacityStatus')
  final ComputeCapacityStatus computeCapacityStatus;

  /// The instance type to use when launching fleet instances. The following
  /// instance types are available:
  ///
  /// <ul>
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
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The name of the fleet.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current state for the fleet.
  @_s.JsonKey(name: 'State')
  final FleetState state;

  /// The time the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description to display.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The amount of time that a streaming session remains active after users
  /// disconnect. If they try to reconnect to the streaming session after a
  /// disconnection or network interruption within this time interval, they are
  /// connected to their previous session. Otherwise, they are connected to a new
  /// session with a new streaming instance.
  ///
  /// Specify a value between 60 and 360000.
  @_s.JsonKey(name: 'DisconnectTimeoutInSeconds')
  final int disconnectTimeoutInSeconds;

  /// The fleet name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// fleet to a Microsoft Active Directory domain.
  @_s.JsonKey(name: 'DomainJoinInfo')
  final DomainJoinInfo domainJoinInfo;

  /// Indicates whether default internet access is enabled for the fleet.
  @_s.JsonKey(name: 'EnableDefaultInternetAccess')
  final bool enableDefaultInternetAccess;

  /// The fleet errors.
  @_s.JsonKey(name: 'FleetErrors')
  final List<FleetError> fleetErrors;

  /// The fleet type.
  /// <dl> <dt>ALWAYS_ON</dt> <dd>
  /// Provides users with instant-on access to their apps. You are charged for all
  /// running instances in your fleet, even if no users are streaming apps.
  /// </dd> <dt>ON_DEMAND</dt> <dd>
  /// Provide users with access to applications after they connect, which takes
  /// one to two minutes. You are charged for instance streaming when users are
  /// connected and a small hourly fee for instances that are not streaming apps.
  /// </dd> </dl>
  @_s.JsonKey(name: 'FleetType')
  final FleetType fleetType;

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
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

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
  @_s.JsonKey(name: 'IdleDisconnectTimeoutInSeconds')
  final int idleDisconnectTimeoutInSeconds;

  /// The ARN for the public, private, or shared image.
  @_s.JsonKey(name: 'ImageArn')
  final String imageArn;

  /// The name of the image used to create the fleet.
  @_s.JsonKey(name: 'ImageName')
  final String imageName;

  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  @_s.JsonKey(name: 'MaxUserDurationInSeconds')
  final int maxUserDurationInSeconds;

  /// The AppStream 2.0 view that is displayed to your users when they stream from
  /// the fleet. When <code>APP</code> is specified, only the windows of
  /// applications opened by users display. When <code>DESKTOP</code> is
  /// specified, the standard desktop that is provided by the operating system
  /// displays.
  ///
  /// The default value is <code>APP</code>.
  @_s.JsonKey(name: 'StreamView')
  final StreamView streamView;

  /// The VPC configuration for the fleet.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  Fleet({
    @_s.required this.arn,
    @_s.required this.computeCapacityStatus,
    @_s.required this.instanceType,
    @_s.required this.name,
    @_s.required this.state,
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
    this.maxUserDurationInSeconds,
    this.streamView,
    this.vpcConfig,
  });
  factory Fleet.fromJson(Map<String, dynamic> json) => _$FleetFromJson(json);
}

/// The fleet attribute.
enum FleetAttribute {
  @_s.JsonValue('VPC_CONFIGURATION')
  vpcConfiguration,
  @_s.JsonValue('VPC_CONFIGURATION_SECURITY_GROUP_IDS')
  vpcConfigurationSecurityGroupIds,
  @_s.JsonValue('DOMAIN_JOIN_INFO')
  domainJoinInfo,
  @_s.JsonValue('IAM_ROLE_ARN')
  iamRoleArn,
}

extension on FleetAttribute {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a fleet error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FleetError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final FleetErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  FleetError({
    this.errorCode,
    this.errorMessage,
  });
  factory FleetError.fromJson(Map<String, dynamic> json) =>
      _$FleetErrorFromJson(json);
}

enum FleetErrorCode {
  @_s.JsonValue('IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION')
  iamServiceRoleMissingEniDescribeAction,
  @_s.JsonValue('IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION')
  iamServiceRoleMissingEniCreateAction,
  @_s.JsonValue('IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION')
  iamServiceRoleMissingEniDeleteAction,
  @_s.JsonValue('NETWORK_INTERFACE_LIMIT_EXCEEDED')
  networkInterfaceLimitExceeded,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
  @_s.JsonValue('IAM_SERVICE_ROLE_IS_MISSING')
  iamServiceRoleIsMissing,
  @_s.JsonValue('MACHINE_ROLE_IS_MISSING')
  machineRoleIsMissing,
  @_s.JsonValue('STS_DISABLED_IN_REGION')
  stsDisabledInRegion,
  @_s.JsonValue('SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES')
  subnetHasInsufficientIpAddresses,
  @_s.JsonValue('IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION')
  iamServiceRoleMissingDescribeSubnetAction,
  @_s.JsonValue('SUBNET_NOT_FOUND')
  subnetNotFound,
  @_s.JsonValue('IMAGE_NOT_FOUND')
  imageNotFound,
  @_s.JsonValue('INVALID_SUBNET_CONFIGURATION')
  invalidSubnetConfiguration,
  @_s.JsonValue('SECURITY_GROUPS_NOT_FOUND')
  securityGroupsNotFound,
  @_s.JsonValue('IGW_NOT_ATTACHED')
  igwNotAttached,
  @_s.JsonValue('IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION')
  iamServiceRoleMissingDescribeSecurityGroupsAction,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_FILE_NOT_FOUND')
  domainJoinErrorFileNotFound,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_ACCESS_DENIED')
  domainJoinErrorAccessDenied,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_LOGON_FAILURE')
  domainJoinErrorLogonFailure,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_INVALID_PARAMETER')
  domainJoinErrorInvalidParameter,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_MORE_DATA')
  domainJoinErrorMoreData,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN')
  domainJoinErrorNoSuchDomain,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_NOT_SUPPORTED')
  domainJoinErrorNotSupported,
  @_s.JsonValue('DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME')
  domainJoinNerrInvalidWorkgroupName,
  @_s.JsonValue('DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED')
  domainJoinNerrWorkstationNotStarted,
  @_s.JsonValue('DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED')
  domainJoinErrorDsMachineAccountQuotaExceeded,
  @_s.JsonValue('DOMAIN_JOIN_NERR_PASSWORD_EXPIRED')
  domainJoinNerrPasswordExpired,
  @_s.JsonValue('DOMAIN_JOIN_INTERNAL_SERVICE_ERROR')
  domainJoinInternalServiceError,
}

enum FleetState {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
}

enum FleetType {
  @_s.JsonValue('ALWAYS_ON')
  alwaysOn,
  @_s.JsonValue('ON_DEMAND')
  onDemand,
}

extension on FleetType {
  String toValue() {
    switch (this) {
      case FleetType.alwaysOn:
        return 'ALWAYS_ON';
      case FleetType.onDemand:
        return 'ON_DEMAND';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Image {
  /// The name of the image.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The applications associated with the image.
  @_s.JsonKey(name: 'Applications')
  final List<Application> applications;

  /// The version of the AppStream 2.0 agent to use for instances that are
  /// launched from this image.
  @_s.JsonKey(name: 'AppstreamAgentVersion')
  final String appstreamAgentVersion;

  /// The ARN of the image.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ARN of the image from which this image was created.
  @_s.JsonKey(name: 'BaseImageArn')
  final String baseImageArn;

  /// The time the image was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description to display.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The image name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the image builder that was used to create the private image. If
  /// the image is shared, this value is null.
  @_s.JsonKey(name: 'ImageBuilderName')
  final String imageBuilderName;

  /// Indicates whether an image builder can be launched from this image.
  @_s.JsonKey(name: 'ImageBuilderSupported')
  final bool imageBuilderSupported;

  /// The permissions to provide to the destination AWS account for the specified
  /// image.
  @_s.JsonKey(name: 'ImagePermissions')
  final ImagePermissions imagePermissions;

  /// The operating system platform of the image.
  @_s.JsonKey(name: 'Platform')
  final PlatformType platform;

  /// The release date of the public base image. For private images, this date is
  /// the release date of the base image from which the image was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PublicBaseImageReleasedDate')
  final DateTime publicBaseImageReleasedDate;

  /// The image starts in the <code>PENDING</code> state. If image creation
  /// succeeds, the state is <code>AVAILABLE</code>. If image creation fails, the
  /// state is <code>FAILED</code>.
  @_s.JsonKey(name: 'State')
  final ImageState state;

  /// The reason why the last state change occurred.
  @_s.JsonKey(name: 'StateChangeReason')
  final ImageStateChangeReason stateChangeReason;

  /// Indicates whether the image is public or private.
  @_s.JsonKey(name: 'Visibility')
  final VisibilityType visibility;

  Image({
    @_s.required this.name,
    this.applications,
    this.appstreamAgentVersion,
    this.arn,
    this.baseImageArn,
    this.createdTime,
    this.description,
    this.displayName,
    this.imageBuilderName,
    this.imageBuilderSupported,
    this.imagePermissions,
    this.platform,
    this.publicBaseImageReleasedDate,
    this.state,
    this.stateChangeReason,
    this.visibility,
  });
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

/// Describes a virtual machine that is used to create an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageBuilder {
  /// The name of the image builder.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The list of virtual private cloud (VPC) interface endpoint objects.
  /// Administrators can connect to the image builder only through the specified
  /// endpoints.
  @_s.JsonKey(name: 'AccessEndpoints')
  final List<AccessEndpoint> accessEndpoints;

  /// The version of the AppStream 2.0 agent that is currently being used by the
  /// image builder.
  @_s.JsonKey(name: 'AppstreamAgentVersion')
  final String appstreamAgentVersion;

  /// The ARN for the image builder.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time stamp when the image builder was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description to display.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The image builder name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// image builder to a Microsoft Active Directory domain.
  @_s.JsonKey(name: 'DomainJoinInfo')
  final DomainJoinInfo domainJoinInfo;

  /// Enables or disables default internet access for the image builder.
  @_s.JsonKey(name: 'EnableDefaultInternetAccess')
  final bool enableDefaultInternetAccess;

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
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// The ARN of the image from which this builder was created.
  @_s.JsonKey(name: 'ImageArn')
  final String imageArn;

  /// The image builder errors.
  @_s.JsonKey(name: 'ImageBuilderErrors')
  final List<ResourceError> imageBuilderErrors;

  /// The instance type for the image builder. The following instance types are
  /// available:
  ///
  /// <ul>
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
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;
  @_s.JsonKey(name: 'NetworkAccessConfiguration')
  final NetworkAccessConfiguration networkAccessConfiguration;

  /// The operating system platform of the image builder.
  @_s.JsonKey(name: 'Platform')
  final PlatformType platform;

  /// The state of the image builder.
  @_s.JsonKey(name: 'State')
  final ImageBuilderState state;

  /// The reason why the last state change occurred.
  @_s.JsonKey(name: 'StateChangeReason')
  final ImageBuilderStateChangeReason stateChangeReason;

  /// The VPC configuration of the image builder.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  ImageBuilder({
    @_s.required this.name,
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
  factory ImageBuilder.fromJson(Map<String, dynamic> json) =>
      _$ImageBuilderFromJson(json);
}

enum ImageBuilderState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('UPDATING_AGENT')
  updatingAgent,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('REBOOTING')
  rebooting,
  @_s.JsonValue('SNAPSHOTTING')
  snapshotting,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// Describes the reason why the last image builder state change occurred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageBuilderStateChangeReason {
  /// The state change reason code.
  @_s.JsonKey(name: 'Code')
  final ImageBuilderStateChangeReasonCode code;

  /// The state change reason message.
  @_s.JsonKey(name: 'Message')
  final String message;

  ImageBuilderStateChangeReason({
    this.code,
    this.message,
  });
  factory ImageBuilderStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$ImageBuilderStateChangeReasonFromJson(json);
}

enum ImageBuilderStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('IMAGE_UNAVAILABLE')
  imageUnavailable,
}

/// Describes the permissions for an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImagePermissions {
  /// Indicates whether the image can be used for a fleet.
  @_s.JsonKey(name: 'allowFleet')
  final bool allowFleet;

  /// Indicates whether the image can be used for an image builder.
  @_s.JsonKey(name: 'allowImageBuilder')
  final bool allowImageBuilder;

  ImagePermissions({
    this.allowFleet,
    this.allowImageBuilder,
  });
  factory ImagePermissions.fromJson(Map<String, dynamic> json) =>
      _$ImagePermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePermissionsToJson(this);
}

enum ImageState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COPYING')
  copying,
  @_s.JsonValue('DELETING')
  deleting,
}

/// Describes the reason why the last image state change occurred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageStateChangeReason {
  /// The state change reason code.
  @_s.JsonKey(name: 'Code')
  final ImageStateChangeReasonCode code;

  /// The state change reason message.
  @_s.JsonKey(name: 'Message')
  final String message;

  ImageStateChangeReason({
    this.code,
    this.message,
  });
  factory ImageStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$ImageStateChangeReasonFromJson(json);
}

enum ImageStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('IMAGE_BUILDER_NOT_AVAILABLE')
  imageBuilderNotAvailable,
  @_s.JsonValue('IMAGE_COPY_FAILURE')
  imageCopyFailure,
}

/// Describes the error that is returned when a usage report can't be generated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LastReportGenerationExecutionError {
  /// The error code for the error that is returned when a usage report can't be
  /// generated.
  @_s.JsonKey(name: 'ErrorCode')
  final UsageReportExecutionErrorCode errorCode;

  /// The error message for the error that is returned when a usage report can't
  /// be generated.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  LastReportGenerationExecutionError({
    this.errorCode,
    this.errorMessage,
  });
  factory LastReportGenerationExecutionError.fromJson(
          Map<String, dynamic> json) =>
      _$LastReportGenerationExecutionErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociatedFleetsResult {
  /// The name of the fleet.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociatedFleetsResult({
    this.names,
    this.nextToken,
  });
  factory ListAssociatedFleetsResult.fromJson(Map<String, dynamic> json) =>
      _$ListAssociatedFleetsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociatedStacksResult {
  /// The name of the stack.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociatedStacksResult({
    this.names,
    this.nextToken,
  });
  factory ListAssociatedStacksResult.fromJson(Map<String, dynamic> json) =>
      _$ListAssociatedStacksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The information about the tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum MessageAction {
  @_s.JsonValue('SUPPRESS')
  suppress,
  @_s.JsonValue('RESEND')
  resend,
}

extension on MessageAction {
  String toValue() {
    switch (this) {
      case MessageAction.suppress:
        return 'SUPPRESS';
      case MessageAction.resend:
        return 'RESEND';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the network details of the fleet or image builder instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkAccessConfiguration {
  /// The resource identifier of the elastic network interface that is attached to
  /// instances in your VPC. All network interfaces have the eni-xxxxxxxx resource
  /// identifier.
  @_s.JsonKey(name: 'EniId')
  final String eniId;

  /// The private IP address of the elastic network interface that is attached to
  /// instances in your VPC.
  @_s.JsonKey(name: 'EniPrivateIpAddress')
  final String eniPrivateIpAddress;

  NetworkAccessConfiguration({
    this.eniId,
    this.eniPrivateIpAddress,
  });
  factory NetworkAccessConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NetworkAccessConfigurationFromJson(json);
}

enum Permission {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum PlatformType {
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('WINDOWS_SERVER_2016')
  windowsServer_2016,
  @_s.JsonValue('WINDOWS_SERVER_2019')
  windowsServer_2019,
}

/// Describes a resource error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final FleetErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The time the error occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ErrorTimestamp')
  final DateTime errorTimestamp;

  ResourceError({
    this.errorCode,
    this.errorMessage,
    this.errorTimestamp,
  });
  factory ResourceError.fromJson(Map<String, dynamic> json) =>
      _$ResourceErrorFromJson(json);
}

/// Describes the credentials for the service account used by the fleet or image
/// builder to connect to the directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceAccountCredentials {
  /// The user name of the account. This account must have the following
  /// privileges: create computer objects, join computers to the domain, and
  /// change/reset the password on descendant computer objects for the
  /// organizational units specified.
  @_s.JsonKey(name: 'AccountName')
  final String accountName;

  /// The password for the account.
  @_s.JsonKey(name: 'AccountPassword')
  final String accountPassword;

  ServiceAccountCredentials({
    @_s.required this.accountName,
    @_s.required this.accountPassword,
  });
  factory ServiceAccountCredentials.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountCredentialsToJson(this);
}

/// Describes a streaming session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Session {
  /// The name of the fleet for the streaming session.
  @_s.JsonKey(name: 'FleetName')
  final String fleetName;

  /// The identifier of the streaming session.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the stack for the streaming session.
  @_s.JsonKey(name: 'StackName')
  final String stackName;

  /// The current state of the streaming session.
  @_s.JsonKey(name: 'State')
  final SessionState state;

  /// The identifier of the user for whom the session was created.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// The authentication method. The user is authenticated using a streaming URL
  /// (<code>API</code>) or SAML 2.0 federation (<code>SAML</code>).
  @_s.JsonKey(name: 'AuthenticationType')
  final AuthenticationType authenticationType;

  /// Specifies whether a user is connected to the streaming session.
  @_s.JsonKey(name: 'ConnectionState')
  final SessionConnectionState connectionState;

  /// The time when the streaming session is set to expire. This time is based on
  /// the <code>MaxUserDurationinSeconds</code> value, which determines the
  /// maximum length of time that a streaming session can run. A streaming session
  /// might end earlier than the time specified in
  /// <code>SessionMaxExpirationTime</code>, when the
  /// <code>DisconnectTimeOutInSeconds</code> elapses or the user chooses to end
  /// his or her session. If the <code>DisconnectTimeOutInSeconds</code> elapses,
  /// or the user chooses to end his or her session, the streaming instance is
  /// terminated and the streaming session ends.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'MaxExpirationTime')
  final DateTime maxExpirationTime;

  /// The network details for the streaming session.
  @_s.JsonKey(name: 'NetworkAccessConfiguration')
  final NetworkAccessConfiguration networkAccessConfiguration;

  /// The time when a streaming instance is dedicated for the user.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  Session({
    @_s.required this.fleetName,
    @_s.required this.id,
    @_s.required this.stackName,
    @_s.required this.state,
    @_s.required this.userId,
    this.authenticationType,
    this.connectionState,
    this.maxExpirationTime,
    this.networkAccessConfiguration,
    this.startTime,
  });
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

enum SessionConnectionState {
  @_s.JsonValue('CONNECTED')
  connected,
  @_s.JsonValue('NOT_CONNECTED')
  notConnected,
}

/// Possible values for the state of a streaming session.
enum SessionState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Describes the permissions that are available to the specified AWS account
/// for a shared image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SharedImagePermissions {
  /// Describes the permissions for a shared image.
  @_s.JsonKey(name: 'imagePermissions')
  final ImagePermissions imagePermissions;

  /// The 12-digit identifier of the AWS account with which the image is shared.
  @_s.JsonKey(name: 'sharedAccountId')
  final String sharedAccountId;

  SharedImagePermissions({
    @_s.required this.imagePermissions,
    @_s.required this.sharedAccountId,
  });
  factory SharedImagePermissions.fromJson(Map<String, dynamic> json) =>
      _$SharedImagePermissionsFromJson(json);
}

/// Describes a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stack {
  /// The name of the stack.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The list of virtual private cloud (VPC) interface endpoint objects. Users of
  /// the stack can connect to AppStream 2.0 only through the specified endpoints.
  @_s.JsonKey(name: 'AccessEndpoints')
  final List<AccessEndpoint> accessEndpoints;

  /// The persistent application settings for users of the stack.
  @_s.JsonKey(name: 'ApplicationSettings')
  final ApplicationSettingsResponse applicationSettings;

  /// The ARN of the stack.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time the stack was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description to display.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The stack name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The domains where AppStream 2.0 streaming sessions can be embedded in an
  /// iframe. You must approve the domains that you want to host embedded
  /// AppStream 2.0 streaming sessions.
  @_s.JsonKey(name: 'EmbedHostDomains')
  final List<String> embedHostDomains;

  /// The URL that users are redirected to after they click the Send Feedback
  /// link. If no URL is specified, no Send Feedback link is displayed.
  @_s.JsonKey(name: 'FeedbackURL')
  final String feedbackURL;

  /// The URL that users are redirected to after their streaming session ends.
  @_s.JsonKey(name: 'RedirectURL')
  final String redirectURL;

  /// The errors for the stack.
  @_s.JsonKey(name: 'StackErrors')
  final List<StackError> stackErrors;

  /// The storage connectors to enable.
  @_s.JsonKey(name: 'StorageConnectors')
  final List<StorageConnector> storageConnectors;

  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default these actions are enabled.
  @_s.JsonKey(name: 'UserSettings')
  final List<UserSetting> userSettings;

  Stack({
    @_s.required this.name,
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
    this.userSettings,
  });
  factory Stack.fromJson(Map<String, dynamic> json) => _$StackFromJson(json);
}

enum StackAttribute {
  @_s.JsonValue('STORAGE_CONNECTORS')
  storageConnectors,
  @_s.JsonValue('STORAGE_CONNECTOR_HOMEFOLDERS')
  storageConnectorHomefolders,
  @_s.JsonValue('STORAGE_CONNECTOR_GOOGLE_DRIVE')
  storageConnectorGoogleDrive,
  @_s.JsonValue('STORAGE_CONNECTOR_ONE_DRIVE')
  storageConnectorOneDrive,
  @_s.JsonValue('REDIRECT_URL')
  redirectUrl,
  @_s.JsonValue('FEEDBACK_URL')
  feedbackUrl,
  @_s.JsonValue('THEME_NAME')
  themeName,
  @_s.JsonValue('USER_SETTINGS')
  userSettings,
  @_s.JsonValue('EMBED_HOST_DOMAINS')
  embedHostDomains,
  @_s.JsonValue('IAM_ROLE_ARN')
  iamRoleArn,
  @_s.JsonValue('ACCESS_ENDPOINTS')
  accessEndpoints,
}

extension on StackAttribute {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a stack error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StackError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final StackErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  StackError({
    this.errorCode,
    this.errorMessage,
  });
  factory StackError.fromJson(Map<String, dynamic> json) =>
      _$StackErrorFromJson(json);
}

enum StackErrorCode {
  @_s.JsonValue('STORAGE_CONNECTOR_ERROR')
  storageConnectorError,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFleetResult {
  StartFleetResult();
  factory StartFleetResult.fromJson(Map<String, dynamic> json) =>
      _$StartFleetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImageBuilderResult {
  /// Information about the image builder.
  @_s.JsonKey(name: 'ImageBuilder')
  final ImageBuilder imageBuilder;

  StartImageBuilderResult({
    this.imageBuilder,
  });
  factory StartImageBuilderResult.fromJson(Map<String, dynamic> json) =>
      _$StartImageBuilderResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopFleetResult {
  StopFleetResult();
  factory StopFleetResult.fromJson(Map<String, dynamic> json) =>
      _$StopFleetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopImageBuilderResult {
  /// Information about the image builder.
  @_s.JsonKey(name: 'ImageBuilder')
  final ImageBuilder imageBuilder;

  StopImageBuilderResult({
    this.imageBuilder,
  });
  factory StopImageBuilderResult.fromJson(Map<String, dynamic> json) =>
      _$StopImageBuilderResultFromJson(json);
}

/// Describes a connector that enables persistent storage for users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StorageConnector {
  /// The type of storage connector.
  @_s.JsonKey(name: 'ConnectorType')
  final StorageConnectorType connectorType;

  /// The names of the domains for the account.
  @_s.JsonKey(name: 'Domains')
  final List<String> domains;

  /// The ARN of the storage connector.
  @_s.JsonKey(name: 'ResourceIdentifier')
  final String resourceIdentifier;

  StorageConnector({
    @_s.required this.connectorType,
    this.domains,
    this.resourceIdentifier,
  });
  factory StorageConnector.fromJson(Map<String, dynamic> json) =>
      _$StorageConnectorFromJson(json);

  Map<String, dynamic> toJson() => _$StorageConnectorToJson(this);
}

/// The type of storage connector.
enum StorageConnectorType {
  @_s.JsonValue('HOMEFOLDERS')
  homefolders,
  @_s.JsonValue('GOOGLE_DRIVE')
  googleDrive,
  @_s.JsonValue('ONE_DRIVE')
  oneDrive,
}

enum StreamView {
  @_s.JsonValue('APP')
  app,
  @_s.JsonValue('DESKTOP')
  desktop,
}

extension on StreamView {
  String toValue() {
    switch (this) {
      case StreamView.app:
        return 'APP';
      case StreamView.desktop:
        return 'DESKTOP';
    }
    throw Exception('Unknown enum value: $this');
  }
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDirectoryConfigResult {
  /// Information about the Directory Config object.
  @_s.JsonKey(name: 'DirectoryConfig')
  final DirectoryConfig directoryConfig;

  UpdateDirectoryConfigResult({
    this.directoryConfig,
  });
  factory UpdateDirectoryConfigResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDirectoryConfigResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFleetResult {
  /// Information about the fleet.
  @_s.JsonKey(name: 'Fleet')
  final Fleet fleet;

  UpdateFleetResult({
    this.fleet,
  });
  factory UpdateFleetResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateFleetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateImagePermissionsResult {
  UpdateImagePermissionsResult();
  factory UpdateImagePermissionsResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateImagePermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateStackResult {
  /// Information about the stack.
  @_s.JsonKey(name: 'Stack')
  final Stack stack;

  UpdateStackResult({
    this.stack,
  });
  factory UpdateStackResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateStackResultFromJson(json);
}

enum UsageReportExecutionErrorCode {
  @_s.JsonValue('RESOURCE_NOT_FOUND')
  resourceNotFound,
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
}

enum UsageReportSchedule {
  @_s.JsonValue('DAILY')
  daily,
}

/// Describes information about the usage report subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageReportSubscription {
  /// The time when the last usage report was generated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastGeneratedReportDate')
  final DateTime lastGeneratedReportDate;

  /// The Amazon S3 bucket where generated reports are stored.
  ///
  /// If you enabled on-instance session scripts and Amazon S3 logging for your
  /// session script configuration, AppStream 2.0 created an S3 bucket to store
  /// the script output. The bucket is unique to your account and Region. When you
  /// enable usage reporting in this case, AppStream 2.0 uses the same bucket to
  /// store your usage reports. If you haven't already enabled on-instance session
  /// scripts, when you enable usage reports, AppStream 2.0 creates a new S3
  /// bucket.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The schedule for generating usage reports.
  @_s.JsonKey(name: 'Schedule')
  final UsageReportSchedule schedule;

  /// The errors that were returned if usage reports couldn't be generated.
  @_s.JsonKey(name: 'SubscriptionErrors')
  final List<LastReportGenerationExecutionError> subscriptionErrors;

  UsageReportSubscription({
    this.lastGeneratedReportDate,
    this.s3BucketName,
    this.schedule,
    this.subscriptionErrors,
  });
  factory UsageReportSubscription.fromJson(Map<String, dynamic> json) =>
      _$UsageReportSubscriptionFromJson(json);
}

/// Describes a user in the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The authentication type for the user.
  @_s.JsonKey(name: 'AuthenticationType')
  final AuthenticationType authenticationType;

  /// The ARN of the user.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time the user was created in the user pool.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Specifies whether the user in the user pool is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The first name, or given name, of the user.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name, or surname, of the user.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

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
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The email address of the user.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  @_s.JsonKey(name: 'UserName')
  final String userName;

  User({
    @_s.required this.authenticationType,
    this.arn,
    this.createdTime,
    this.enabled,
    this.firstName,
    this.lastName,
    this.status,
    this.userName,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Describes an action and whether the action is enabled or disabled for users
/// during their streaming sessions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserSetting {
  /// The action that is enabled or disabled.
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// Indicates whether the action is enabled or disabled.
  @_s.JsonKey(name: 'Permission')
  final Permission permission;

  UserSetting({
    @_s.required this.action,
    @_s.required this.permission,
  });
  factory UserSetting.fromJson(Map<String, dynamic> json) =>
      _$UserSettingFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingToJson(this);
}

/// Describes a user in the user pool and the associated stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserStackAssociation {
  /// The authentication type for the user.
  @_s.JsonKey(name: 'AuthenticationType')
  final AuthenticationType authenticationType;

  /// The name of the stack that is associated with the user.
  @_s.JsonKey(name: 'StackName')
  final String stackName;

  /// The email address of the user who is associated with the stack.
  /// <note>
  /// Users' email addresses are case-sensitive.
  /// </note>
  @_s.JsonKey(name: 'UserName')
  final String userName;

  /// Specifies whether a welcome email is sent to a user after the user is
  /// created in the user pool.
  @_s.JsonKey(name: 'SendEmailNotification')
  final bool sendEmailNotification;

  UserStackAssociation({
    @_s.required this.authenticationType,
    @_s.required this.stackName,
    @_s.required this.userName,
    this.sendEmailNotification,
  });
  factory UserStackAssociation.fromJson(Map<String, dynamic> json) =>
      _$UserStackAssociationFromJson(json);

  Map<String, dynamic> toJson() => _$UserStackAssociationToJson(this);
}

/// Describes the error that is returned when a user can’t be associated with or
/// disassociated from a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserStackAssociationError {
  /// The error code for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  @_s.JsonKey(name: 'ErrorCode')
  final UserStackAssociationErrorCode errorCode;

  /// The error message for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// Information about the user and associated stack.
  @_s.JsonKey(name: 'UserStackAssociation')
  final UserStackAssociation userStackAssociation;

  UserStackAssociationError({
    this.errorCode,
    this.errorMessage,
    this.userStackAssociation,
  });
  factory UserStackAssociationError.fromJson(Map<String, dynamic> json) =>
      _$UserStackAssociationErrorFromJson(json);
}

enum UserStackAssociationErrorCode {
  @_s.JsonValue('STACK_NOT_FOUND')
  stackNotFound,
  @_s.JsonValue('USER_NAME_NOT_FOUND')
  userNameNotFound,
  @_s.JsonValue('DIRECTORY_NOT_FOUND')
  directoryNotFound,
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
}

enum VisibilityType {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
  private,
  @_s.JsonValue('SHARED')
  shared,
}

extension on VisibilityType {
  String toValue() {
    switch (this) {
      case VisibilityType.public:
        return 'PUBLIC';
      case VisibilityType.private:
        return 'PRIVATE';
      case VisibilityType.shared:
        return 'SHARED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes VPC configuration information for fleets and image builders.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VpcConfig {
  /// The identifiers of the security groups for the fleet or image builder.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The identifiers of the subnets to which a network interface is attached from
  /// the fleet instance or image builder instance. Fleet instances use one or
  /// more subnets. Image builder instances use one subnet.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VpcConfig({
    this.securityGroupIds,
    this.subnetIds,
  });
  factory VpcConfig.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConfigToJson(this);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class IncompatibleImageException extends _s.GenericAwsException {
  IncompatibleImageException({String type, String message})
      : super(type: type, code: 'IncompatibleImageException', message: message);
}

class InvalidAccountStatusException extends _s.GenericAwsException {
  InvalidAccountStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAccountStatusException',
            message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String type, String message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class RequestLimitExceededException extends _s.GenericAwsException {
  RequestLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'RequestLimitExceededException',
            message: message);
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

class ResourceNotAvailableException extends _s.GenericAwsException {
  ResourceNotAvailableException({String type, String message})
      : super(
            type: type,
            code: 'ResourceNotAvailableException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
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
