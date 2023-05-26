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

/// Welcome to the AWS Device Farm API documentation, which contains APIs for:
///
/// <ul>
/// <li>
/// Testing on desktop browsers
///
/// Device Farm makes it possible for you to test your web applications on
/// desktop browsers using Selenium. The APIs for desktop browser testing
/// contain <code>TestGrid</code> in their names. For more information, see <a
/// href="https://docs.aws.amazon.com/devicefarm/latest/testgrid/">Testing Web
/// Applications on Selenium with Device Farm</a>.
/// </li>
/// <li>
/// Testing on real mobile devices
///
/// Device Farm makes it possible for you to test apps on physical phones,
/// tablets, and other devices in the cloud. For more information, see the <a
/// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/">Device
/// Farm Developer Guide</a>.
/// </li>
/// </ul>
class DeviceFarm {
  final _s.JsonProtocol _protocol;
  DeviceFarm({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'devicefarm',
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

  /// Creates a device pool.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [name] :
  /// The device pool's name.
  ///
  /// Parameter [projectArn] :
  /// The ARN of the project for the device pool.
  ///
  /// Parameter [rules] :
  /// The device pool's rules.
  ///
  /// Parameter [description] :
  /// The device pool's description.
  ///
  /// Parameter [maxDevices] :
  /// The number of devices that Device Farm can add to your device pool. Device
  /// Farm adds devices that are available and meet the criteria that you assign
  /// for the <code>rules</code> parameter. Depending on how many devices meet
  /// these constraints, your device pool might contain fewer devices than the
  /// value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs
  /// that you incur by running tests.
  Future<CreateDevicePoolResult> createDevicePool({
    required String name,
    required String projectArn,
    required List<Rule> rules,
    String? description,
    int? maxDevices,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateDevicePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'projectArn': projectArn,
        'rules': rules,
        if (description != null) 'description': description,
        if (maxDevices != null) 'maxDevices': maxDevices,
      },
    );

    return CreateDevicePoolResult.fromJson(jsonResponse.body);
  }

  /// Creates a profile that can be applied to one or more private fleet device
  /// instances.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [name] :
  /// The name of your instance profile.
  ///
  /// Parameter [description] :
  /// The description of your instance profile.
  ///
  /// Parameter [excludeAppPackagesFromCleanup] :
  /// An array of strings that specifies the list of app packages that should
  /// not be cleaned up from the device after a test run.
  ///
  /// The list of packages is considered only if you set
  /// <code>packageCleanup</code> to <code>true</code>.
  ///
  /// Parameter [packageCleanup] :
  /// When set to <code>true</code>, Device Farm removes app packages after a
  /// test run. The default value is <code>false</code> for private devices.
  ///
  /// Parameter [rebootAfterUse] :
  /// When set to <code>true</code>, Device Farm reboots the instance after a
  /// test run. The default value is <code>true</code>.
  Future<CreateInstanceProfileResult> createInstanceProfile({
    required String name,
    String? description,
    List<String>? excludeAppPackagesFromCleanup,
    bool? packageCleanup,
    bool? rebootAfterUse,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateInstanceProfile'
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
        if (excludeAppPackagesFromCleanup != null)
          'excludeAppPackagesFromCleanup': excludeAppPackagesFromCleanup,
        if (packageCleanup != null) 'packageCleanup': packageCleanup,
        if (rebootAfterUse != null) 'rebootAfterUse': rebootAfterUse,
      },
    );

    return CreateInstanceProfileResult.fromJson(jsonResponse.body);
  }

  /// Creates a network profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [name] :
  /// The name for the new network profile.
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to create
  /// a network profile.
  ///
  /// Parameter [description] :
  /// The description of the network profile.
  ///
  /// Parameter [downlinkBandwidthBits] :
  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  ///
  /// Parameter [downlinkDelayMs] :
  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  ///
  /// Parameter [downlinkJitterMs] :
  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  ///
  /// Parameter [downlinkLossPercent] :
  /// Proportion of received packets that fail to arrive from 0 to 100 percent.
  ///
  /// Parameter [type] :
  /// The type of network profile to create. Valid values are listed here.
  ///
  /// Parameter [uplinkBandwidthBits] :
  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  ///
  /// Parameter [uplinkDelayMs] :
  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  ///
  /// Parameter [uplinkJitterMs] :
  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  ///
  /// Parameter [uplinkLossPercent] :
  /// Proportion of transmitted packets that fail to arrive from 0 to 100
  /// percent.
  Future<CreateNetworkProfileResult> createNetworkProfile({
    required String name,
    required String projectArn,
    String? description,
    int? downlinkBandwidthBits,
    int? downlinkDelayMs,
    int? downlinkJitterMs,
    int? downlinkLossPercent,
    NetworkProfileType? type,
    int? uplinkBandwidthBits,
    int? uplinkDelayMs,
    int? uplinkJitterMs,
    int? uplinkLossPercent,
  }) async {
    _s.validateNumRange(
      'downlinkLossPercent',
      downlinkLossPercent,
      0,
      100,
    );
    _s.validateNumRange(
      'uplinkLossPercent',
      uplinkLossPercent,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'projectArn': projectArn,
        if (description != null) 'description': description,
        if (downlinkBandwidthBits != null)
          'downlinkBandwidthBits': downlinkBandwidthBits,
        if (downlinkDelayMs != null) 'downlinkDelayMs': downlinkDelayMs,
        if (downlinkJitterMs != null) 'downlinkJitterMs': downlinkJitterMs,
        if (downlinkLossPercent != null)
          'downlinkLossPercent': downlinkLossPercent,
        if (type != null) 'type': type.toValue(),
        if (uplinkBandwidthBits != null)
          'uplinkBandwidthBits': uplinkBandwidthBits,
        if (uplinkDelayMs != null) 'uplinkDelayMs': uplinkDelayMs,
        if (uplinkJitterMs != null) 'uplinkJitterMs': uplinkJitterMs,
        if (uplinkLossPercent != null) 'uplinkLossPercent': uplinkLossPercent,
      },
    );

    return CreateNetworkProfileResult.fromJson(jsonResponse.body);
  }

  /// Creates a project.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  /// May throw [TagOperationException].
  ///
  /// Parameter [name] :
  /// The project's name.
  ///
  /// Parameter [defaultJobTimeoutMinutes] :
  /// Sets the execution timeout value (in minutes) for a project. All test runs
  /// in this project use the specified execution timeout value unless
  /// overridden when scheduling a run.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC security groups and subnets that are attached to a project.
  Future<CreateProjectResult> createProject({
    required String name,
    int? defaultJobTimeoutMinutes,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (defaultJobTimeoutMinutes != null)
          'defaultJobTimeoutMinutes': defaultJobTimeoutMinutes,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return CreateProjectResult.fromJson(jsonResponse.body);
  }

  /// Specifies and starts a remote access session.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device for which you want to create a remote access
  /// session.
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to create
  /// a remote access session.
  ///
  /// Parameter [clientId] :
  /// Unique identifier for the client. If you want access to multiple devices
  /// on the same client, you should pass the same <code>clientId</code> value
  /// in each call to <code>CreateRemoteAccessSession</code>. This identifier is
  /// required only if <code>remoteDebugEnabled</code> is set to
  /// <code>true</code>.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  ///
  /// Parameter [configuration] :
  /// The configuration information for the remote access session request.
  ///
  /// Parameter [instanceArn] :
  /// The Amazon Resource Name (ARN) of the device instance for which you want
  /// to create a remote access session.
  ///
  /// Parameter [interactionMode] :
  /// The interaction mode of the remote access session. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// INTERACTIVE: You can interact with the iOS device by viewing, touching,
  /// and rotating the screen. You cannot run XCUITest framework-based tests in
  /// this mode.
  /// </li>
  /// <li>
  /// NO_VIDEO: You are connected to the device, but cannot interact with it or
  /// view the screen. This mode has the fastest test execution speed. You can
  /// run XCUITest framework-based tests in this mode.
  /// </li>
  /// <li>
  /// VIDEO_ONLY: You can view the screen, but cannot touch or rotate it. You
  /// can run XCUITest framework-based tests and watch the screen in this mode.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the remote access session to create.
  ///
  /// Parameter [remoteDebugEnabled] :
  /// Set to <code>true</code> if you want to access devices remotely for
  /// debugging in your remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  ///
  /// Parameter [remoteRecordAppArn] :
  /// The Amazon Resource Name (ARN) for the app to be recorded in the remote
  /// access session.
  ///
  /// Parameter [remoteRecordEnabled] :
  /// Set to <code>true</code> to enable remote recording for the remote access
  /// session.
  ///
  /// Parameter [skipAppResign] :
  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your
  /// apps again.
  ///
  /// For more information on how Device Farm modifies your uploads during
  /// tests, see <a href="http://aws.amazon.com/device-farm/faqs/">Do you modify
  /// my app?</a>
  ///
  /// Parameter [sshPublicKey] :
  /// Ignored. The public key of the <code>ssh</code> key pair you want to use
  /// for connecting to remote devices in your remote debugging session. This
  /// key is required only if <code>remoteDebugEnabled</code> is set to
  /// <code>true</code>.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  Future<CreateRemoteAccessSessionResult> createRemoteAccessSession({
    required String deviceArn,
    required String projectArn,
    String? clientId,
    CreateRemoteAccessSessionConfiguration? configuration,
    String? instanceArn,
    InteractionMode? interactionMode,
    String? name,
    bool? remoteDebugEnabled,
    String? remoteRecordAppArn,
    bool? remoteRecordEnabled,
    bool? skipAppResign,
    String? sshPublicKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateRemoteAccessSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deviceArn': deviceArn,
        'projectArn': projectArn,
        if (clientId != null) 'clientId': clientId,
        if (configuration != null) 'configuration': configuration,
        if (instanceArn != null) 'instanceArn': instanceArn,
        if (interactionMode != null)
          'interactionMode': interactionMode.toValue(),
        if (name != null) 'name': name,
        if (remoteDebugEnabled != null)
          'remoteDebugEnabled': remoteDebugEnabled,
        if (remoteRecordAppArn != null)
          'remoteRecordAppArn': remoteRecordAppArn,
        if (remoteRecordEnabled != null)
          'remoteRecordEnabled': remoteRecordEnabled,
        if (skipAppResign != null) 'skipAppResign': skipAppResign,
        if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
      },
    );

    return CreateRemoteAccessSessionResult.fromJson(jsonResponse.body);
  }

  /// Creates a Selenium testing project. Projects are used to track
  /// <a>TestGridSession</a> instances.
  ///
  /// May throw [ArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [name] :
  /// Human-readable name of the Selenium testing project.
  ///
  /// Parameter [description] :
  /// Human-readable description of the project.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC security groups and subnets that are attached to a project.
  Future<CreateTestGridProjectResult> createTestGridProject({
    required String name,
    String? description,
    TestGridVpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateTestGridProject'
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
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return CreateTestGridProjectResult.fromJson(jsonResponse.body);
  }

  /// Creates a signed, short-term URL that can be passed to a Selenium
  /// <code>RemoteWebDriver</code> constructor.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [expiresInSeconds] :
  /// Lifetime, in seconds, of the URL.
  ///
  /// Parameter [projectArn] :
  /// ARN (from <a>CreateTestGridProject</a> or <a>ListTestGridProjects</a>) to
  /// associate with the short-term URL.
  Future<CreateTestGridUrlResult> createTestGridUrl({
    required int expiresInSeconds,
    required String projectArn,
  }) async {
    _s.validateNumRange(
      'expiresInSeconds',
      expiresInSeconds,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateTestGridUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'expiresInSeconds': expiresInSeconds,
        'projectArn': projectArn,
      },
    );

    return CreateTestGridUrlResult.fromJson(jsonResponse.body);
  }

  /// Uploads an app or test scripts.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [name] :
  /// The upload's file name. The name should not contain any forward slashes
  /// (<code>/</code>). If you are uploading an iOS app, the file name must end
  /// with the <code>.ipa</code> extension. If you are uploading an Android app,
  /// the file name must end with the <code>.apk</code> extension. For all
  /// others, the file name must end with the <code>.zip</code> file extension.
  ///
  /// Parameter [projectArn] :
  /// The ARN of the project for the upload.
  ///
  /// Parameter [type] :
  /// The upload's upload type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// ANDROID_APP
  /// </li>
  /// <li>
  /// IOS_APP
  /// </li>
  /// <li>
  /// WEB_APP
  /// </li>
  /// <li>
  /// EXTERNAL_DATA
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// CALABASH_TEST_PACKAGE
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATOR_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_SPEC
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_SPEC
  /// </li>
  /// </ul>
  /// If you call <code>CreateUpload</code> with <code>WEB_APP</code> specified,
  /// AWS Device Farm throws an <code>ArgumentException</code> error.
  ///
  /// Parameter [contentType] :
  /// The upload's content type (for example,
  /// <code>application/octet-stream</code>).
  Future<CreateUploadResult> createUpload({
    required String name,
    required String projectArn,
    required UploadType type,
    String? contentType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateUpload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'projectArn': projectArn,
        'type': type.toValue(),
        if (contentType != null) 'contentType': contentType,
      },
    );

    return CreateUploadResult.fromJson(jsonResponse.body);
  }

  /// Creates a configuration record in Device Farm for your Amazon Virtual
  /// Private Cloud (VPC) endpoint.
  ///
  /// May throw [ArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [serviceDnsName] :
  /// The DNS name of the service running in your VPC that you want Device Farm
  /// to test.
  ///
  /// Parameter [vpceConfigurationName] :
  /// The friendly name you give to your VPC endpoint configuration, to manage
  /// your configurations more easily.
  ///
  /// Parameter [vpceServiceName] :
  /// The name of the VPC endpoint service running in your AWS account that you
  /// want Device Farm to test.
  ///
  /// Parameter [vpceConfigurationDescription] :
  /// An optional description that provides details about your VPC endpoint
  /// configuration.
  Future<CreateVPCEConfigurationResult> createVPCEConfiguration({
    required String serviceDnsName,
    required String vpceConfigurationName,
    required String vpceServiceName,
    String? vpceConfigurationDescription,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.CreateVPCEConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceDnsName': serviceDnsName,
        'vpceConfigurationName': vpceConfigurationName,
        'vpceServiceName': vpceServiceName,
        if (vpceConfigurationDescription != null)
          'vpceConfigurationDescription': vpceConfigurationDescription,
      },
    );

    return CreateVPCEConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Deletes a device pool given the pool ARN. Does not allow deletion of
  /// curated pools owned by the system.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Represents the Amazon Resource Name (ARN) of the Device Farm device pool
  /// to delete.
  Future<void> deleteDevicePool({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteDevicePool'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a profile that can be applied to one or more private device
  /// instances.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the instance profile you are requesting
  /// to delete.
  Future<void> deleteInstanceProfile({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteInstanceProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a network profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The ARN of the network profile to delete.
  Future<void> deleteNetworkProfile({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteNetworkProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes an AWS Device Farm project, given the project ARN.
  ///
  /// Deleting this resource does not stop an in-progress run.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Represents the Amazon Resource Name (ARN) of the Device Farm project to
  /// delete.
  Future<void> deleteProject({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteProject'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a completed remote access session and its results.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the session for which you want to delete
  /// remote access.
  Future<void> deleteRemoteAccessSession({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteRemoteAccessSession'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes the run, given the run ARN.
  ///
  /// Deleting this resource does not stop an in-progress run.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for the run to delete.
  Future<void> deleteRun({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteRun'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a Selenium testing project and all content generated under it.
  /// <important>
  /// You cannot undo this operation.
  /// </important> <note>
  /// You cannot delete a project if it has active sessions.
  /// </note>
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [CannotDeleteException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [projectArn] :
  /// The ARN of the project to delete, from <a>CreateTestGridProject</a> or
  /// <a>ListTestGridProjects</a>.
  Future<void> deleteTestGridProject({
    required String projectArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteTestGridProject'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
      },
    );
  }

  /// Deletes an upload given the upload ARN.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Represents the Amazon Resource Name (ARN) of the Device Farm upload to
  /// delete.
  Future<void> deleteUpload({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteUpload'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a configuration for your Amazon Virtual Private Cloud (VPC)
  /// endpoint.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [ServiceAccountException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration you want
  /// to delete.
  Future<void> deleteVPCEConfiguration({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteVPCEConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Returns the number of unmetered iOS or unmetered Android devices that have
  /// been purchased by the account.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  Future<GetAccountSettingsResult> getAccountSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountSettingsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a unique device type.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The device type's ARN.
  Future<GetDeviceResult> getDevice({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetDeviceResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a device instance that belongs to a private
  /// device fleet.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the instance you're requesting
  /// information about.
  Future<GetDeviceInstanceResult> getDeviceInstance({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetDeviceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetDeviceInstanceResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a device pool.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The device pool's ARN.
  Future<GetDevicePoolResult> getDevicePool({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetDevicePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetDevicePoolResult.fromJson(jsonResponse.body);
  }

  /// Gets information about compatibility with a device pool.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [devicePoolArn] :
  /// The device pool's ARN.
  ///
  /// Parameter [appArn] :
  /// The ARN of the app that is associated with the specified device pool.
  ///
  /// Parameter [configuration] :
  /// An object that contains information about the settings for a run.
  ///
  /// Parameter [test] :
  /// Information about the uploaded test to be run against the device pool.
  ///
  /// Parameter [testType] :
  /// The test type for the specified device pool.
  ///
  /// Allowed values include the following:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ.
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER. For Android, an app explorer that traverses an Android
  /// app, interacting with it and capturing screenshots at the same time.
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT.
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG.
  /// </li>
  /// <li>
  /// APPIUM_PYTHON.
  /// </li>
  /// <li>
  /// APPIUM_NODE.
  /// </li>
  /// <li>
  /// APPIUM_RUBY.
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT.
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG.
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON.
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE.
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY.
  /// </li>
  /// <li>
  /// CALABASH.
  /// </li>
  /// <li>
  /// INSTRUMENTATION.
  /// </li>
  /// <li>
  /// UIAUTOMATION.
  /// </li>
  /// <li>
  /// UIAUTOMATOR.
  /// </li>
  /// <li>
  /// XCTEST.
  /// </li>
  /// <li>
  /// XCTEST_UI.
  /// </li>
  /// </ul>
  Future<GetDevicePoolCompatibilityResult> getDevicePoolCompatibility({
    required String devicePoolArn,
    String? appArn,
    ScheduleRunConfiguration? configuration,
    ScheduleRunTest? test,
    TestType? testType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetDevicePoolCompatibility'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'devicePoolArn': devicePoolArn,
        if (appArn != null) 'appArn': appArn,
        if (configuration != null) 'configuration': configuration,
        if (test != null) 'test': test,
        if (testType != null) 'testType': testType.toValue(),
      },
    );

    return GetDevicePoolCompatibilityResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified instance profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of an instance profile.
  Future<GetInstanceProfileResult> getInstanceProfile({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetInstanceProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetInstanceProfileResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a job.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The job's ARN.
  Future<GetJobResult> getJob({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetJobResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a network profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The ARN of the network profile to return information about.
  Future<GetNetworkProfileResult> getNetworkProfile({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetNetworkProfileResult.fromJson(jsonResponse.body);
  }

  /// Gets the current status and future status of all offerings purchased by an
  /// AWS account. The response indicates how many offerings are currently
  /// available and the offerings that will be available in the next period. The
  /// API returns a <code>NotEligible</code> error if the user is not permitted
  /// to invoke the operation. If you must be able to invoke this operation,
  /// contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<GetOfferingStatusResult> getOfferingStatus({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetOfferingStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetOfferingStatusResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a project.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The project's ARN.
  Future<GetProjectResult> getProject({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetProjectResult.fromJson(jsonResponse.body);
  }

  /// Returns a link to a currently running remote access session.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the remote access session about which
  /// you want to get session information.
  Future<GetRemoteAccessSessionResult> getRemoteAccessSession({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetRemoteAccessSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetRemoteAccessSessionResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a run.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The run's ARN.
  Future<GetRunResult> getRun({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetRunResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a suite.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The suite's ARN.
  Future<GetSuiteResult> getSuite({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetSuite'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetSuiteResult.fromJson(jsonResponse.body);
  }

  /// Gets information about a test.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The test's ARN.
  Future<GetTestResult> getTest({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetTest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetTestResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a Selenium testing project.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [projectArn] :
  /// The ARN of the Selenium testing project, from either
  /// <a>CreateTestGridProject</a> or <a>ListTestGridProjects</a>.
  Future<GetTestGridProjectResult> getTestGridProject({
    required String projectArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetTestGridProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
      },
    );

    return GetTestGridProjectResult.fromJson(jsonResponse.body);
  }

  /// A session is an instance of a browser created through a
  /// <code>RemoteWebDriver</code> with the URL from
  /// <a>CreateTestGridUrlResult$url</a>. You can use the following to look up
  /// sessions:
  ///
  /// <ul>
  /// <li>
  /// The session ARN (<a>GetTestGridSessionRequest$sessionArn</a>).
  /// </li>
  /// <li>
  /// The project ARN and a session ID
  /// (<a>GetTestGridSessionRequest$projectArn</a> and
  /// <a>GetTestGridSessionRequest$sessionId</a>).
  /// </li>
  /// </ul> <p/>
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [projectArn] :
  /// The ARN for the project that this session belongs to. See
  /// <a>CreateTestGridProject</a> and <a>ListTestGridProjects</a>.
  ///
  /// Parameter [sessionArn] :
  /// An ARN that uniquely identifies a <a>TestGridSession</a>.
  ///
  /// Parameter [sessionId] :
  /// An ID associated with this session.
  Future<GetTestGridSessionResult> getTestGridSession({
    String? projectArn,
    String? sessionArn,
    String? sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetTestGridSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (projectArn != null) 'projectArn': projectArn,
        if (sessionArn != null) 'sessionArn': sessionArn,
        if (sessionId != null) 'sessionId': sessionId,
      },
    );

    return GetTestGridSessionResult.fromJson(jsonResponse.body);
  }

  /// Gets information about an upload.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The upload's ARN.
  Future<GetUploadResult> getUpload({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetUpload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetUploadResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the configuration settings for your Amazon
  /// Virtual Private Cloud (VPC) endpoint.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration you want
  /// to describe.
  Future<GetVPCEConfigurationResult> getVPCEConfiguration({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.GetVPCEConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetVPCEConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Installs an application to the device in a remote access session. For
  /// Android applications, the file must be in .apk format. For iOS
  /// applications, the file must be in .ipa format.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [appArn] :
  /// The ARN of the app about which you are requesting information.
  ///
  /// Parameter [remoteAccessSessionArn] :
  /// The Amazon Resource Name (ARN) of the remote access session about which
  /// you are requesting information.
  Future<InstallToRemoteAccessSessionResult> installToRemoteAccessSession({
    required String appArn,
    required String remoteAccessSessionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.InstallToRemoteAccessSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appArn': appArn,
        'remoteAccessSessionArn': remoteAccessSessionArn,
      },
    );

    return InstallToRemoteAccessSessionResult.fromJson(jsonResponse.body);
  }

  /// Gets information about artifacts.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The run, job, suite, or test ARN.
  ///
  /// Parameter [type] :
  /// The artifacts' type.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// FILE
  /// </li>
  /// <li>
  /// LOG
  /// </li>
  /// <li>
  /// SCREENSHOT
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListArtifactsResult> listArtifacts({
    required String arn,
    required ArtifactCategory type,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListArtifacts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'type': type.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListArtifactsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the private device instances associated with one
  /// or more AWS accounts.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [maxResults] :
  /// An integer that specifies the maximum number of items you want to return
  /// in the API response.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListDeviceInstancesResult> listDeviceInstances({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListDeviceInstances'
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

    return ListDeviceInstancesResult.fromJson(jsonResponse.body);
  }

  /// Gets information about device pools.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The project ARN.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  ///
  /// Parameter [type] :
  /// The device pools' type.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// CURATED: A device pool that is created and managed by AWS Device Farm.
  /// </li>
  /// <li>
  /// PRIVATE: A device pool that is created and managed by the device pool
  /// developer.
  /// </li>
  /// </ul>
  Future<ListDevicePoolsResult> listDevicePools({
    required String arn,
    String? nextToken,
    DevicePoolType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListDevicePools'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
        if (type != null) 'type': type.toValue(),
      },
    );

    return ListDevicePoolsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about unique device types.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project.
  ///
  /// Parameter [filters] :
  /// Used to select a set of devices. A filter is made up of an attribute, an
  /// operator, and one or more values.
  ///
  /// <ul>
  /// <li>
  /// Attribute: The aspect of a device such as platform or model used as the
  /// selection criteria in a device filter.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// ARN: The Amazon Resource Name (ARN) of the device (for example,
  /// <code>arn:aws:devicefarm:us-west-2::device:12345Example</code>).
  /// </li>
  /// <li>
  /// PLATFORM: The device platform. Valid values are ANDROID or IOS.
  /// </li>
  /// <li>
  /// OS_VERSION: The operating system version (for example, 10.3.2).
  /// </li>
  /// <li>
  /// MODEL: The device model (for example, iPad 5th Gen).
  /// </li>
  /// <li>
  /// AVAILABILITY: The current availability of the device. Valid values are
  /// AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.
  /// </li>
  /// <li>
  /// FORM_FACTOR: The device form factor. Valid values are PHONE or TABLET.
  /// </li>
  /// <li>
  /// MANUFACTURER: The device manufacturer (for example, Apple).
  /// </li>
  /// <li>
  /// REMOTE_ACCESS_ENABLED: Whether the device is enabled for remote access.
  /// Valid values are TRUE or FALSE.
  /// </li>
  /// <li>
  /// REMOTE_DEBUG_ENABLED: Whether the device is enabled for remote debugging.
  /// Valid values are TRUE or FALSE. Because remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>, this attribute is ignored.
  /// </li>
  /// <li>
  /// INSTANCE_ARN: The Amazon Resource Name (ARN) of the device instance.
  /// </li>
  /// <li>
  /// INSTANCE_LABELS: The label of the device instance.
  /// </li>
  /// <li>
  /// FLEET_TYPE: The fleet type. Valid values are PUBLIC or PRIVATE.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Operator: The filter operator.
  ///
  /// <ul>
  /// <li>
  /// The EQUALS operator is available for every attribute except
  /// INSTANCE_LABELS.
  /// </li>
  /// <li>
  /// The CONTAINS operator is available for the INSTANCE_LABELS and MODEL
  /// attributes.
  /// </li>
  /// <li>
  /// The IN and NOT_IN operators are available for the ARN, OS_VERSION, MODEL,
  /// MANUFACTURER, and INSTANCE_ARN attributes.
  /// </li>
  /// <li>
  /// The LESS_THAN, GREATER_THAN, LESS_THAN_OR_EQUALS, and
  /// GREATER_THAN_OR_EQUALS operators are also available for the OS_VERSION
  /// attribute.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Values: An array of one or more filter values.
  ///
  /// <ul>
  /// <li>
  /// The IN and NOT_IN operators take a values array that has one or more
  /// elements.
  /// </li>
  /// <li>
  /// The other operators require an array with a single element.
  /// </li>
  /// <li>
  /// In a request, the AVAILABILITY attribute takes the following values:
  /// AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListDevicesResult> listDevices({
    String? arn,
    List<DeviceFilter>? filters,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListDevices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arn != null) 'arn': arn,
        if (filters != null) 'filters': filters,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDevicesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all the instance profiles in an AWS account.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [maxResults] :
  /// An integer that specifies the maximum number of items you want to return
  /// in the API response.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListInstanceProfilesResult> listInstanceProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListInstanceProfiles'
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

    return ListInstanceProfilesResult.fromJson(jsonResponse.body);
  }

  /// Gets information about jobs for a given test run.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The run's Amazon Resource Name (ARN).
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListJobsResult> listJobs({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListJobsResult.fromJson(jsonResponse.body);
  }

  /// Returns the list of available network profiles.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to list
  /// network profiles.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  ///
  /// Parameter [type] :
  /// The type of network profile to return information about. Valid values are
  /// listed here.
  Future<ListNetworkProfilesResult> listNetworkProfiles({
    required String arn,
    String? nextToken,
    NetworkProfileType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListNetworkProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
        if (type != null) 'type': type.toValue(),
      },
    );

    return ListNetworkProfilesResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of offering promotions. Each offering promotion record
  /// contains the ID and description of the promotion. The API returns a
  /// <code>NotEligible</code> error if the caller is not permitted to invoke
  /// the operation. Contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>
  /// if you must be able to invoke this operation.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListOfferingPromotionsResult> listOfferingPromotions({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListOfferingPromotions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListOfferingPromotionsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of all historical purchases, renewals, and system renewal
  /// transactions for an AWS account. The list is paginated and ordered by a
  /// descending timestamp (most recent transactions are first). The API returns
  /// a <code>NotEligible</code> error if the user is not permitted to invoke
  /// the operation. If you must be able to invoke this operation, contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListOfferingTransactionsResult> listOfferingTransactions({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListOfferingTransactions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListOfferingTransactionsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of products or offerings that the user can manage through
  /// the API. Each offering record indicates the recurring price per unit and
  /// the frequency for that offering. The API returns a
  /// <code>NotEligible</code> error if the user is not permitted to invoke the
  /// operation. If you must be able to invoke this operation, contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListOfferingsResult> listOfferings({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListOfferings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListOfferingsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about projects.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Optional. If no Amazon Resource Name (ARN) is specified, then AWS Device
  /// Farm returns a list of all projects for the AWS account. You can also
  /// specify a project ARN.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListProjectsResult> listProjects({
    String? arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arn != null) 'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListProjectsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of all currently running remote access sessions.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project about which you are
  /// requesting information.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListRemoteAccessSessionsResult> listRemoteAccessSessions({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListRemoteAccessSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRemoteAccessSessionsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about runs, given an AWS Device Farm project ARN.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to list
  /// runs.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListRunsResult> listRuns({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRunsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about samples, given an AWS Device Farm job ARN.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the job used to list samples.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListSamplesResult> listSamples({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListSamples'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSamplesResult.fromJson(jsonResponse.body);
  }

  /// Gets information about test suites for a given job.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The job's Amazon Resource Name (ARN).
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListSuitesResult> listSuites({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListSuites'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSuitesResult.fromJson(jsonResponse.body);
  }

  /// List the tags for an AWS Device Farm resource.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [TagOperationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource or resources for which to
  /// list tags. You can associate tags with the following Device Farm
  /// resources: <code>PROJECT</code>, <code>RUN</code>,
  /// <code>NETWORK_PROFILE</code>, <code>INSTANCE_PROFILE</code>,
  /// <code>DEVICE_INSTANCE</code>, <code>SESSION</code>,
  /// <code>DEVICE_POOL</code>, <code>DEVICE</code>, and
  /// <code>VPCE_CONFIGURATION</code>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of all Selenium testing projects in your account.
  ///
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [maxResult] :
  /// Return no more than this number of results.
  ///
  /// Parameter [nextToken] :
  /// From a response, used to continue a paginated listing.
  Future<ListTestGridProjectsResult> listTestGridProjects({
    int? maxResult,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTestGridProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResult != null) 'maxResult': maxResult,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTestGridProjectsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of the actions taken in a <a>TestGridSession</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [sessionArn] :
  /// The ARN of the session to retrieve.
  ///
  /// Parameter [maxResult] :
  /// The maximum number of sessions to return per response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<ListTestGridSessionActionsResult> listTestGridSessionActions({
    required String sessionArn,
    int? maxResult,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTestGridSessionActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'sessionArn': sessionArn,
        if (maxResult != null) 'maxResult': maxResult,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTestGridSessionActionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of artifacts created during the session.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [sessionArn] :
  /// The ARN of a <a>TestGridSession</a>.
  ///
  /// Parameter [maxResult] :
  /// The maximum number of results to be returned by a request.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  ///
  /// Parameter [type] :
  /// Limit results to a specified type of artifact.
  Future<ListTestGridSessionArtifactsResult> listTestGridSessionArtifacts({
    required String sessionArn,
    int? maxResult,
    String? nextToken,
    TestGridSessionArtifactCategory? type,
  }) async {
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTestGridSessionArtifacts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'sessionArn': sessionArn,
        if (maxResult != null) 'maxResult': maxResult,
        if (nextToken != null) 'nextToken': nextToken,
        if (type != null) 'type': type.toValue(),
      },
    );

    return ListTestGridSessionArtifactsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of sessions for a <a>TestGridProject</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [projectArn] :
  /// ARN of a <a>TestGridProject</a>.
  ///
  /// Parameter [creationTimeAfter] :
  /// Return only sessions created after this time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return only sessions created before this time.
  ///
  /// Parameter [endTimeAfter] :
  /// Return only sessions that ended after this time.
  ///
  /// Parameter [endTimeBefore] :
  /// Return only sessions that ended before this time.
  ///
  /// Parameter [maxResult] :
  /// Return only this many results at a time.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  ///
  /// Parameter [status] :
  /// Return only sessions in this state.
  Future<ListTestGridSessionsResult> listTestGridSessions({
    required String projectArn,
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    DateTime? endTimeAfter,
    DateTime? endTimeBefore,
    int? maxResult,
    String? nextToken,
    TestGridSessionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTestGridSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
        if (creationTimeAfter != null)
          'creationTimeAfter': unixTimestampToJson(creationTimeAfter),
        if (creationTimeBefore != null)
          'creationTimeBefore': unixTimestampToJson(creationTimeBefore),
        if (endTimeAfter != null)
          'endTimeAfter': unixTimestampToJson(endTimeAfter),
        if (endTimeBefore != null)
          'endTimeBefore': unixTimestampToJson(endTimeBefore),
        if (maxResult != null) 'maxResult': maxResult,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.toValue(),
      },
    );

    return ListTestGridSessionsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about tests in a given test suite.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The test suite's Amazon Resource Name (ARN).
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListTestsResult> listTests({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListTests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTestsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about unique problems, such as exceptions or crashes.
  ///
  /// Unique problems are defined as a single instance of an error across a run,
  /// job, or suite. For example, if a call in your application consistently
  /// raises an exception (<code>OutOfBoundsException in
  /// MyActivity.java:386</code>), <code>ListUniqueProblems</code> returns a
  /// single entry instead of many individual entries for that exception.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The unique problems' ARNs.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListUniqueProblemsResult> listUniqueProblems({
    required String arn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListUniqueProblems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListUniqueProblemsResult.fromJson(jsonResponse.body);
  }

  /// Gets information about uploads, given an AWS Device Farm project ARN.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to list
  /// uploads.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  ///
  /// Parameter [type] :
  /// The type of upload.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// ANDROID_APP
  /// </li>
  /// <li>
  /// IOS_APP
  /// </li>
  /// <li>
  /// WEB_APP
  /// </li>
  /// <li>
  /// EXTERNAL_DATA
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// CALABASH_TEST_PACKAGE
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATOR_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_SPEC
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_SPEC
  /// </li>
  /// </ul>
  Future<ListUploadsResult> listUploads({
    required String arn,
    String? nextToken,
    UploadType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListUploads'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (nextToken != null) 'nextToken': nextToken,
        if (type != null) 'type': type.toValue(),
      },
    );

    return ListUploadsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all Amazon Virtual Private Cloud (VPC) endpoint
  /// configurations in the AWS account.
  ///
  /// May throw [ArgumentException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [maxResults] :
  /// An integer that specifies the maximum number of items you want to return
  /// in the API response.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListVPCEConfigurationsResult> listVPCEConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ListVPCEConfigurations'
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

    return ListVPCEConfigurationsResult.fromJson(jsonResponse.body);
  }

  /// Immediately purchases offerings for an AWS account. Offerings renew with
  /// the latest total purchased quantity for an offering, unless the renewal
  /// was overridden. The API returns a <code>NotEligible</code> error if the
  /// user is not permitted to invoke the operation. If you must be able to
  /// invoke this operation, contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [offeringId] :
  /// The ID of the offering.
  ///
  /// Parameter [quantity] :
  /// The number of device slots to purchase in an offering request.
  ///
  /// Parameter [offeringPromotionId] :
  /// The ID of the offering promotion to be applied to the purchase.
  Future<PurchaseOfferingResult> purchaseOffering({
    required String offeringId,
    required int quantity,
    String? offeringPromotionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.PurchaseOffering'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'offeringId': offeringId,
        'quantity': quantity,
        if (offeringPromotionId != null)
          'offeringPromotionId': offeringPromotionId,
      },
    );

    return PurchaseOfferingResult.fromJson(jsonResponse.body);
  }

  /// Explicitly sets the quantity of devices to renew for an offering, starting
  /// from the <code>effectiveDate</code> of the next period. The API returns a
  /// <code>NotEligible</code> error if the user is not permitted to invoke the
  /// operation. If you must be able to invoke this operation, contact <a
  /// href="mailto:aws-devicefarm-support@amazon.com">aws-devicefarm-support@amazon.com</a>.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [NotEligibleException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [offeringId] :
  /// The ID of a request to renew an offering.
  ///
  /// Parameter [quantity] :
  /// The quantity requested in an offering renewal.
  Future<RenewOfferingResult> renewOffering({
    required String offeringId,
    required int quantity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.RenewOffering'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'offeringId': offeringId,
        'quantity': quantity,
      },
    );

    return RenewOfferingResult.fromJson(jsonResponse.body);
  }

  /// Schedules a run.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [IdempotencyException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [projectArn] :
  /// The ARN of the project for the run to be scheduled.
  ///
  /// Parameter [test] :
  /// Information about the test for the run to be scheduled.
  ///
  /// Parameter [appArn] :
  /// The ARN of an application package to run tests against, created with
  /// <a>CreateUpload</a>. See <a>ListUploads</a>.
  ///
  /// Parameter [configuration] :
  /// Information about the settings for the run to be scheduled.
  ///
  /// Parameter [devicePoolArn] :
  /// The ARN of the device pool for the run to be scheduled.
  ///
  /// Parameter [deviceSelectionConfiguration] :
  /// The filter criteria used to dynamically select a set of devices for a test
  /// run and the maximum number of devices to be included in the run.
  ///
  /// Either <b> <code>devicePoolArn</code> </b> or <b>
  /// <code>deviceSelectionConfiguration</code> </b> is required in a request.
  ///
  /// Parameter [executionConfiguration] :
  /// Specifies configuration information about a test run, such as the
  /// execution timeout (in minutes).
  ///
  /// Parameter [name] :
  /// The name for the run to be scheduled.
  Future<ScheduleRunResult> scheduleRun({
    required String projectArn,
    required ScheduleRunTest test,
    String? appArn,
    ScheduleRunConfiguration? configuration,
    String? devicePoolArn,
    DeviceSelectionConfiguration? deviceSelectionConfiguration,
    ExecutionConfiguration? executionConfiguration,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.ScheduleRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
        'test': test,
        if (appArn != null) 'appArn': appArn,
        if (configuration != null) 'configuration': configuration,
        if (devicePoolArn != null) 'devicePoolArn': devicePoolArn,
        if (deviceSelectionConfiguration != null)
          'deviceSelectionConfiguration': deviceSelectionConfiguration,
        if (executionConfiguration != null)
          'executionConfiguration': executionConfiguration,
        if (name != null) 'name': name,
      },
    );

    return ScheduleRunResult.fromJson(jsonResponse.body);
  }

  /// Initiates a stop request for the current job. AWS Device Farm immediately
  /// stops the job on the device where tests have not started. You are not
  /// billed for this device. On the device where tests have started, setup
  /// suite and teardown suite tests run to completion on the device. You are
  /// billed for setup, teardown, and any tests that were in progress or already
  /// completed.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Represents the Amazon Resource Name (ARN) of the Device Farm job to stop.
  Future<StopJobResult> stopJob({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.StopJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return StopJobResult.fromJson(jsonResponse.body);
  }

  /// Ends a specified remote access session.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the remote access session to stop.
  Future<StopRemoteAccessSessionResult> stopRemoteAccessSession({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.StopRemoteAccessSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return StopRemoteAccessSessionResult.fromJson(jsonResponse.body);
  }

  /// Initiates a stop request for the current test run. AWS Device Farm
  /// immediately stops the run on devices where tests have not started. You are
  /// not billed for these devices. On devices where tests have started
  /// executing, setup suite and teardown suite tests run to completion on those
  /// devices. You are billed for setup, teardown, and any tests that were in
  /// progress or already completed.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// Represents the Amazon Resource Name (ARN) of the Device Farm run to stop.
  Future<StopRunResult> stopRun({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.StopRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return StopRunResult.fromJson(jsonResponse.body);
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they are not changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [TagOperationException].
  /// May throw [TooManyTagsException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource or resources to which to
  /// add tags. You can associate tags with the following Device Farm resources:
  /// <code>PROJECT</code>, <code>RUN</code>, <code>NETWORK_PROFILE</code>,
  /// <code>INSTANCE_PROFILE</code>, <code>DEVICE_INSTANCE</code>,
  /// <code>SESSION</code>, <code>DEVICE_POOL</code>, <code>DEVICE</code>, and
  /// <code>VPCE_CONFIGURATION</code>.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters. Tag values can
  /// have a maximum length of 256 characters.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Deletes the specified tags from a resource.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [TagOperationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource or resources from which to
  /// delete tags. You can associate tags with the following Device Farm
  /// resources: <code>PROJECT</code>, <code>RUN</code>,
  /// <code>NETWORK_PROFILE</code>, <code>INSTANCE_PROFILE</code>,
  /// <code>DEVICE_INSTANCE</code>, <code>SESSION</code>,
  /// <code>DEVICE_POOL</code>, <code>DEVICE</code>, and
  /// <code>VPCE_CONFIGURATION</code>.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates information about a private device instance.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the device instance.
  ///
  /// Parameter [labels] :
  /// An array of strings that you want to associate with the device instance.
  ///
  /// Parameter [profileArn] :
  /// The ARN of the profile that you want to associate with the device
  /// instance.
  Future<UpdateDeviceInstanceResult> updateDeviceInstance({
    required String arn,
    List<String>? labels,
    String? profileArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateDeviceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (labels != null) 'labels': labels,
        if (profileArn != null) 'profileArn': profileArn,
      },
    );

    return UpdateDeviceInstanceResult.fromJson(jsonResponse.body);
  }

  /// Modifies the name, description, and rules in a device pool given the
  /// attributes and the pool ARN. Rule updates are all-or-nothing, meaning they
  /// can only be updated as a whole (or not at all).
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Device Farm device pool to update.
  ///
  /// Parameter [clearMaxDevices] :
  /// Sets whether the <code>maxDevices</code> parameter applies to your device
  /// pool. If you set this parameter to <code>true</code>, the
  /// <code>maxDevices</code> parameter does not apply, and Device Farm does not
  /// limit the number of devices that it adds to your device pool. In this
  /// case, Device Farm adds all available devices that meet the criteria
  /// specified in the <code>rules</code> parameter.
  ///
  /// If you use this parameter in your request, you cannot use the
  /// <code>maxDevices</code> parameter in the same request.
  ///
  /// Parameter [description] :
  /// A description of the device pool to update.
  ///
  /// Parameter [maxDevices] :
  /// The number of devices that Device Farm can add to your device pool. Device
  /// Farm adds devices that are available and that meet the criteria that you
  /// assign for the <code>rules</code> parameter. Depending on how many devices
  /// meet these constraints, your device pool might contain fewer devices than
  /// the value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs
  /// that you incur by running tests.
  ///
  /// If you use this parameter in your request, you cannot use the
  /// <code>clearMaxDevices</code> parameter in the same request.
  ///
  /// Parameter [name] :
  /// A string that represents the name of the device pool to update.
  ///
  /// Parameter [rules] :
  /// Represents the rules to modify for the device pool. Updating rules is
  /// optional. If you update rules for your request, the update replaces the
  /// existing rules.
  Future<UpdateDevicePoolResult> updateDevicePool({
    required String arn,
    bool? clearMaxDevices,
    String? description,
    int? maxDevices,
    String? name,
    List<Rule>? rules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateDevicePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (clearMaxDevices != null) 'clearMaxDevices': clearMaxDevices,
        if (description != null) 'description': description,
        if (maxDevices != null) 'maxDevices': maxDevices,
        if (name != null) 'name': name,
        if (rules != null) 'rules': rules,
      },
    );

    return UpdateDevicePoolResult.fromJson(jsonResponse.body);
  }

  /// Updates information about an existing private device instance profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the instance profile.
  ///
  /// Parameter [description] :
  /// The updated description for your instance profile.
  ///
  /// Parameter [excludeAppPackagesFromCleanup] :
  /// An array of strings that specifies the list of app packages that should
  /// not be cleaned up from the device after a test run is over.
  ///
  /// The list of packages is only considered if you set
  /// <code>packageCleanup</code> to <code>true</code>.
  ///
  /// Parameter [name] :
  /// The updated name for your instance profile.
  ///
  /// Parameter [packageCleanup] :
  /// The updated choice for whether you want to specify package cleanup. The
  /// default value is <code>false</code> for private devices.
  ///
  /// Parameter [rebootAfterUse] :
  /// The updated choice for whether you want to reboot the device after use.
  /// The default value is <code>true</code>.
  Future<UpdateInstanceProfileResult> updateInstanceProfile({
    required String arn,
    String? description,
    List<String>? excludeAppPackagesFromCleanup,
    String? name,
    bool? packageCleanup,
    bool? rebootAfterUse,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateInstanceProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (description != null) 'description': description,
        if (excludeAppPackagesFromCleanup != null)
          'excludeAppPackagesFromCleanup': excludeAppPackagesFromCleanup,
        if (name != null) 'name': name,
        if (packageCleanup != null) 'packageCleanup': packageCleanup,
        if (rebootAfterUse != null) 'rebootAfterUse': rebootAfterUse,
      },
    );

    return UpdateInstanceProfileResult.fromJson(jsonResponse.body);
  }

  /// Updates the network profile.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project for which you want to update
  /// network profile settings.
  ///
  /// Parameter [description] :
  /// The description of the network profile about which you are returning
  /// information.
  ///
  /// Parameter [downlinkBandwidthBits] :
  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  ///
  /// Parameter [downlinkDelayMs] :
  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  ///
  /// Parameter [downlinkJitterMs] :
  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  ///
  /// Parameter [downlinkLossPercent] :
  /// Proportion of received packets that fail to arrive from 0 to 100 percent.
  ///
  /// Parameter [name] :
  /// The name of the network profile about which you are returning information.
  ///
  /// Parameter [type] :
  /// The type of network profile to return information about. Valid values are
  /// listed here.
  ///
  /// Parameter [uplinkBandwidthBits] :
  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  ///
  /// Parameter [uplinkDelayMs] :
  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  ///
  /// Parameter [uplinkJitterMs] :
  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  ///
  /// Parameter [uplinkLossPercent] :
  /// Proportion of transmitted packets that fail to arrive from 0 to 100
  /// percent.
  Future<UpdateNetworkProfileResult> updateNetworkProfile({
    required String arn,
    String? description,
    int? downlinkBandwidthBits,
    int? downlinkDelayMs,
    int? downlinkJitterMs,
    int? downlinkLossPercent,
    String? name,
    NetworkProfileType? type,
    int? uplinkBandwidthBits,
    int? uplinkDelayMs,
    int? uplinkJitterMs,
    int? uplinkLossPercent,
  }) async {
    _s.validateNumRange(
      'downlinkLossPercent',
      downlinkLossPercent,
      0,
      100,
    );
    _s.validateNumRange(
      'uplinkLossPercent',
      uplinkLossPercent,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (description != null) 'description': description,
        if (downlinkBandwidthBits != null)
          'downlinkBandwidthBits': downlinkBandwidthBits,
        if (downlinkDelayMs != null) 'downlinkDelayMs': downlinkDelayMs,
        if (downlinkJitterMs != null) 'downlinkJitterMs': downlinkJitterMs,
        if (downlinkLossPercent != null)
          'downlinkLossPercent': downlinkLossPercent,
        if (name != null) 'name': name,
        if (type != null) 'type': type.toValue(),
        if (uplinkBandwidthBits != null)
          'uplinkBandwidthBits': uplinkBandwidthBits,
        if (uplinkDelayMs != null) 'uplinkDelayMs': uplinkDelayMs,
        if (uplinkJitterMs != null) 'uplinkJitterMs': uplinkJitterMs,
        if (uplinkLossPercent != null) 'uplinkLossPercent': uplinkLossPercent,
      },
    );

    return UpdateNetworkProfileResult.fromJson(jsonResponse.body);
  }

  /// Modifies the specified project name, given the project ARN and a new name.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the project whose name to update.
  ///
  /// Parameter [defaultJobTimeoutMinutes] :
  /// The number of minutes a test run in the project executes before it times
  /// out.
  ///
  /// Parameter [name] :
  /// A string that represents the new name of the project that you are
  /// updating.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC security groups and subnets that are attached to a project.
  Future<UpdateProjectResult> updateProject({
    required String arn,
    int? defaultJobTimeoutMinutes,
    String? name,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (defaultJobTimeoutMinutes != null)
          'defaultJobTimeoutMinutes': defaultJobTimeoutMinutes,
        if (name != null) 'name': name,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return UpdateProjectResult.fromJson(jsonResponse.body);
  }

  /// Change details of a project.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [projectArn] :
  /// ARN of the project to update.
  ///
  /// Parameter [description] :
  /// Human-readable description for the project.
  ///
  /// Parameter [name] :
  /// Human-readable name for the project.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC security groups and subnets that are attached to a project.
  Future<UpdateTestGridProjectResult> updateTestGridProject({
    required String projectArn,
    String? description,
    String? name,
    TestGridVpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateTestGridProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return UpdateTestGridProjectResult.fromJson(jsonResponse.body);
  }

  /// Updates an uploaded test spec.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceAccountException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the uploaded test spec.
  ///
  /// Parameter [contentType] :
  /// The upload's content type (for example, <code>application/x-yaml</code>).
  ///
  /// Parameter [editContent] :
  /// Set to true if the YAML file has changed and must be updated. Otherwise,
  /// set to false.
  ///
  /// Parameter [name] :
  /// The upload's test spec file name. The name must not contain any forward
  /// slashes (/). The test spec file name must end with the <code>.yaml</code>
  /// or <code>.yml</code> file extension.
  Future<UpdateUploadResult> updateUpload({
    required String arn,
    String? contentType,
    bool? editContent,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateUpload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (contentType != null) 'contentType': contentType,
        if (editContent != null) 'editContent': editContent,
        if (name != null) 'name': name,
      },
    );

    return UpdateUploadResult.fromJson(jsonResponse.body);
  }

  /// Updates information about an Amazon Virtual Private Cloud (VPC) endpoint
  /// configuration.
  ///
  /// May throw [ArgumentException].
  /// May throw [NotFoundException].
  /// May throw [ServiceAccountException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration you want
  /// to update.
  ///
  /// Parameter [serviceDnsName] :
  /// The DNS (domain) name used to connect to your private service in your VPC.
  /// The DNS name must not already be in use on the internet.
  ///
  /// Parameter [vpceConfigurationDescription] :
  /// An optional description that provides details about your VPC endpoint
  /// configuration.
  ///
  /// Parameter [vpceConfigurationName] :
  /// The friendly name you give to your VPC endpoint configuration to manage
  /// your configurations more easily.
  ///
  /// Parameter [vpceServiceName] :
  /// The name of the VPC endpoint service running in your AWS account that you
  /// want Device Farm to test.
  Future<UpdateVPCEConfigurationResult> updateVPCEConfiguration({
    required String arn,
    String? serviceDnsName,
    String? vpceConfigurationDescription,
    String? vpceConfigurationName,
    String? vpceServiceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UpdateVPCEConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (serviceDnsName != null) 'serviceDnsName': serviceDnsName,
        if (vpceConfigurationDescription != null)
          'vpceConfigurationDescription': vpceConfigurationDescription,
        if (vpceConfigurationName != null)
          'vpceConfigurationName': vpceConfigurationName,
        if (vpceServiceName != null) 'vpceServiceName': vpceServiceName,
      },
    );

    return UpdateVPCEConfigurationResult.fromJson(jsonResponse.body);
  }
}

/// A container for account-level settings in AWS Device Farm.
class AccountSettings {
  /// The AWS account number specified in the <code>AccountSettings</code>
  /// container.
  final String? awsAccountNumber;

  /// The default number of minutes (at the account level) a test run executes
  /// before it times out. The default value is 150 minutes.
  final int? defaultJobTimeoutMinutes;

  /// The maximum number of minutes a test run executes before it times out.
  final int? maxJobTimeoutMinutes;

  /// The maximum number of device slots that the AWS account can purchase. Each
  /// maximum is expressed as an <code>offering-id:number</code> pair, where the
  /// <code>offering-id</code> represents one of the IDs returned by the
  /// <code>ListOfferings</code> command.
  final Map<String, int>? maxSlots;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="http://aws.amazon.com/device-farm/faqs/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  final bool? skipAppResign;

  /// Information about an AWS account's usage of free trial device minutes.
  final TrialMinutes? trialMinutes;

  /// Returns the unmetered devices you have purchased or want to purchase.
  final Map<DevicePlatform, int>? unmeteredDevices;

  /// Returns the unmetered remote access devices you have purchased or want to
  /// purchase.
  final Map<DevicePlatform, int>? unmeteredRemoteAccessDevices;

  AccountSettings({
    this.awsAccountNumber,
    this.defaultJobTimeoutMinutes,
    this.maxJobTimeoutMinutes,
    this.maxSlots,
    this.skipAppResign,
    this.trialMinutes,
    this.unmeteredDevices,
    this.unmeteredRemoteAccessDevices,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) {
    return AccountSettings(
      awsAccountNumber: json['awsAccountNumber'] as String?,
      defaultJobTimeoutMinutes: json['defaultJobTimeoutMinutes'] as int?,
      maxJobTimeoutMinutes: json['maxJobTimeoutMinutes'] as int?,
      maxSlots: (json['maxSlots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      skipAppResign: json['skipAppResign'] as bool?,
      trialMinutes: json['trialMinutes'] != null
          ? TrialMinutes.fromJson(json['trialMinutes'] as Map<String, dynamic>)
          : null,
      unmeteredDevices: (json['unmeteredDevices'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDevicePlatform(), e as int)),
      unmeteredRemoteAccessDevices:
          (json['unmeteredRemoteAccessDevices'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toDevicePlatform(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountNumber = this.awsAccountNumber;
    final defaultJobTimeoutMinutes = this.defaultJobTimeoutMinutes;
    final maxJobTimeoutMinutes = this.maxJobTimeoutMinutes;
    final maxSlots = this.maxSlots;
    final skipAppResign = this.skipAppResign;
    final trialMinutes = this.trialMinutes;
    final unmeteredDevices = this.unmeteredDevices;
    final unmeteredRemoteAccessDevices = this.unmeteredRemoteAccessDevices;
    return {
      if (awsAccountNumber != null) 'awsAccountNumber': awsAccountNumber,
      if (defaultJobTimeoutMinutes != null)
        'defaultJobTimeoutMinutes': defaultJobTimeoutMinutes,
      if (maxJobTimeoutMinutes != null)
        'maxJobTimeoutMinutes': maxJobTimeoutMinutes,
      if (maxSlots != null) 'maxSlots': maxSlots,
      if (skipAppResign != null) 'skipAppResign': skipAppResign,
      if (trialMinutes != null) 'trialMinutes': trialMinutes,
      if (unmeteredDevices != null)
        'unmeteredDevices':
            unmeteredDevices.map((k, e) => MapEntry(k.toValue(), e)),
      if (unmeteredRemoteAccessDevices != null)
        'unmeteredRemoteAccessDevices': unmeteredRemoteAccessDevices
            .map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Represents the output of a test. Examples of artifacts include logs and
/// screenshots.
class Artifact {
  /// The artifact's ARN.
  final String? arn;

  /// The artifact's file extension.
  final String? extension;

  /// The artifact's name.
  final String? name;

  /// The artifact's type.
  ///
  /// Allowed values include the following:
  ///
  /// <ul>
  /// <li>
  /// UNKNOWN
  /// </li>
  /// <li>
  /// SCREENSHOT
  /// </li>
  /// <li>
  /// DEVICE_LOG
  /// </li>
  /// <li>
  /// MESSAGE_LOG
  /// </li>
  /// <li>
  /// VIDEO_LOG
  /// </li>
  /// <li>
  /// RESULT_LOG
  /// </li>
  /// <li>
  /// SERVICE_LOG
  /// </li>
  /// <li>
  /// WEBKIT_LOG
  /// </li>
  /// <li>
  /// INSTRUMENTATION_OUTPUT
  /// </li>
  /// <li>
  /// EXERCISER_MONKEY_OUTPUT: the artifact (log) generated by an Android fuzz
  /// test.
  /// </li>
  /// <li>
  /// CALABASH_JSON_OUTPUT
  /// </li>
  /// <li>
  /// CALABASH_PRETTY_OUTPUT
  /// </li>
  /// <li>
  /// CALABASH_STANDARD_OUTPUT
  /// </li>
  /// <li>
  /// CALABASH_JAVA_XML_OUTPUT
  /// </li>
  /// <li>
  /// AUTOMATION_OUTPUT
  /// </li>
  /// <li>
  /// APPIUM_SERVER_OUTPUT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_OUTPUT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_XML_OUTPUT
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_OUTPUT
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_XML_OUTPUT
  /// </li>
  /// <li>
  /// EXPLORER_EVENT_LOG
  /// </li>
  /// <li>
  /// EXPLORER_SUMMARY_LOG
  /// </li>
  /// <li>
  /// APPLICATION_CRASH_REPORT
  /// </li>
  /// <li>
  /// XCTEST_LOG
  /// </li>
  /// <li>
  /// VIDEO
  /// </li>
  /// <li>
  /// CUSTOMER_ARTIFACT
  /// </li>
  /// <li>
  /// CUSTOMER_ARTIFACT_LOG
  /// </li>
  /// <li>
  /// TESTSPEC_OUTPUT
  /// </li>
  /// </ul>
  final ArtifactType? type;

  /// The presigned Amazon S3 URL that can be used with a GET request to download
  /// the artifact's file.
  final String? url;

  Artifact({
    this.arn,
    this.extension,
    this.name,
    this.type,
    this.url,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      arn: json['arn'] as String?,
      extension: json['extension'] as String?,
      name: json['name'] as String?,
      type: (json['type'] as String?)?.toArtifactType(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final extension = this.extension;
    final name = this.name;
    final type = this.type;
    final url = this.url;
    return {
      if (arn != null) 'arn': arn,
      if (extension != null) 'extension': extension,
      if (name != null) 'name': name,
      if (type != null) 'type': type.toValue(),
      if (url != null) 'url': url,
    };
  }
}

enum ArtifactCategory {
  screenshot,
  file,
  log,
}

extension ArtifactCategoryValueExtension on ArtifactCategory {
  String toValue() {
    switch (this) {
      case ArtifactCategory.screenshot:
        return 'SCREENSHOT';
      case ArtifactCategory.file:
        return 'FILE';
      case ArtifactCategory.log:
        return 'LOG';
    }
  }
}

extension ArtifactCategoryFromString on String {
  ArtifactCategory toArtifactCategory() {
    switch (this) {
      case 'SCREENSHOT':
        return ArtifactCategory.screenshot;
      case 'FILE':
        return ArtifactCategory.file;
      case 'LOG':
        return ArtifactCategory.log;
    }
    throw Exception('$this is not known in enum ArtifactCategory');
  }
}

enum ArtifactType {
  unknown,
  screenshot,
  deviceLog,
  messageLog,
  videoLog,
  resultLog,
  serviceLog,
  webkitLog,
  instrumentationOutput,
  exerciserMonkeyOutput,
  calabashJsonOutput,
  calabashPrettyOutput,
  calabashStandardOutput,
  calabashJavaXmlOutput,
  automationOutput,
  appiumServerOutput,
  appiumJavaOutput,
  appiumJavaXmlOutput,
  appiumPythonOutput,
  appiumPythonXmlOutput,
  explorerEventLog,
  explorerSummaryLog,
  applicationCrashReport,
  xctestLog,
  video,
  customerArtifact,
  customerArtifactLog,
  testspecOutput,
}

extension ArtifactTypeValueExtension on ArtifactType {
  String toValue() {
    switch (this) {
      case ArtifactType.unknown:
        return 'UNKNOWN';
      case ArtifactType.screenshot:
        return 'SCREENSHOT';
      case ArtifactType.deviceLog:
        return 'DEVICE_LOG';
      case ArtifactType.messageLog:
        return 'MESSAGE_LOG';
      case ArtifactType.videoLog:
        return 'VIDEO_LOG';
      case ArtifactType.resultLog:
        return 'RESULT_LOG';
      case ArtifactType.serviceLog:
        return 'SERVICE_LOG';
      case ArtifactType.webkitLog:
        return 'WEBKIT_LOG';
      case ArtifactType.instrumentationOutput:
        return 'INSTRUMENTATION_OUTPUT';
      case ArtifactType.exerciserMonkeyOutput:
        return 'EXERCISER_MONKEY_OUTPUT';
      case ArtifactType.calabashJsonOutput:
        return 'CALABASH_JSON_OUTPUT';
      case ArtifactType.calabashPrettyOutput:
        return 'CALABASH_PRETTY_OUTPUT';
      case ArtifactType.calabashStandardOutput:
        return 'CALABASH_STANDARD_OUTPUT';
      case ArtifactType.calabashJavaXmlOutput:
        return 'CALABASH_JAVA_XML_OUTPUT';
      case ArtifactType.automationOutput:
        return 'AUTOMATION_OUTPUT';
      case ArtifactType.appiumServerOutput:
        return 'APPIUM_SERVER_OUTPUT';
      case ArtifactType.appiumJavaOutput:
        return 'APPIUM_JAVA_OUTPUT';
      case ArtifactType.appiumJavaXmlOutput:
        return 'APPIUM_JAVA_XML_OUTPUT';
      case ArtifactType.appiumPythonOutput:
        return 'APPIUM_PYTHON_OUTPUT';
      case ArtifactType.appiumPythonXmlOutput:
        return 'APPIUM_PYTHON_XML_OUTPUT';
      case ArtifactType.explorerEventLog:
        return 'EXPLORER_EVENT_LOG';
      case ArtifactType.explorerSummaryLog:
        return 'EXPLORER_SUMMARY_LOG';
      case ArtifactType.applicationCrashReport:
        return 'APPLICATION_CRASH_REPORT';
      case ArtifactType.xctestLog:
        return 'XCTEST_LOG';
      case ArtifactType.video:
        return 'VIDEO';
      case ArtifactType.customerArtifact:
        return 'CUSTOMER_ARTIFACT';
      case ArtifactType.customerArtifactLog:
        return 'CUSTOMER_ARTIFACT_LOG';
      case ArtifactType.testspecOutput:
        return 'TESTSPEC_OUTPUT';
    }
  }
}

extension ArtifactTypeFromString on String {
  ArtifactType toArtifactType() {
    switch (this) {
      case 'UNKNOWN':
        return ArtifactType.unknown;
      case 'SCREENSHOT':
        return ArtifactType.screenshot;
      case 'DEVICE_LOG':
        return ArtifactType.deviceLog;
      case 'MESSAGE_LOG':
        return ArtifactType.messageLog;
      case 'VIDEO_LOG':
        return ArtifactType.videoLog;
      case 'RESULT_LOG':
        return ArtifactType.resultLog;
      case 'SERVICE_LOG':
        return ArtifactType.serviceLog;
      case 'WEBKIT_LOG':
        return ArtifactType.webkitLog;
      case 'INSTRUMENTATION_OUTPUT':
        return ArtifactType.instrumentationOutput;
      case 'EXERCISER_MONKEY_OUTPUT':
        return ArtifactType.exerciserMonkeyOutput;
      case 'CALABASH_JSON_OUTPUT':
        return ArtifactType.calabashJsonOutput;
      case 'CALABASH_PRETTY_OUTPUT':
        return ArtifactType.calabashPrettyOutput;
      case 'CALABASH_STANDARD_OUTPUT':
        return ArtifactType.calabashStandardOutput;
      case 'CALABASH_JAVA_XML_OUTPUT':
        return ArtifactType.calabashJavaXmlOutput;
      case 'AUTOMATION_OUTPUT':
        return ArtifactType.automationOutput;
      case 'APPIUM_SERVER_OUTPUT':
        return ArtifactType.appiumServerOutput;
      case 'APPIUM_JAVA_OUTPUT':
        return ArtifactType.appiumJavaOutput;
      case 'APPIUM_JAVA_XML_OUTPUT':
        return ArtifactType.appiumJavaXmlOutput;
      case 'APPIUM_PYTHON_OUTPUT':
        return ArtifactType.appiumPythonOutput;
      case 'APPIUM_PYTHON_XML_OUTPUT':
        return ArtifactType.appiumPythonXmlOutput;
      case 'EXPLORER_EVENT_LOG':
        return ArtifactType.explorerEventLog;
      case 'EXPLORER_SUMMARY_LOG':
        return ArtifactType.explorerSummaryLog;
      case 'APPLICATION_CRASH_REPORT':
        return ArtifactType.applicationCrashReport;
      case 'XCTEST_LOG':
        return ArtifactType.xctestLog;
      case 'VIDEO':
        return ArtifactType.video;
      case 'CUSTOMER_ARTIFACT':
        return ArtifactType.customerArtifact;
      case 'CUSTOMER_ARTIFACT_LOG':
        return ArtifactType.customerArtifactLog;
      case 'TESTSPEC_OUTPUT':
        return ArtifactType.testspecOutput;
    }
    throw Exception('$this is not known in enum ArtifactType');
  }
}

enum BillingMethod {
  metered,
  unmetered,
}

extension BillingMethodValueExtension on BillingMethod {
  String toValue() {
    switch (this) {
      case BillingMethod.metered:
        return 'METERED';
      case BillingMethod.unmetered:
        return 'UNMETERED';
    }
  }
}

extension BillingMethodFromString on String {
  BillingMethod toBillingMethod() {
    switch (this) {
      case 'METERED':
        return BillingMethod.metered;
      case 'UNMETERED':
        return BillingMethod.unmetered;
    }
    throw Exception('$this is not known in enum BillingMethod');
  }
}

/// Represents the amount of CPU that an app is using on a physical device. Does
/// not represent system-wide CPU usage.
class CPU {
  /// The CPU's architecture (for example, x86 or ARM).
  final String? architecture;

  /// The clock speed of the device's CPU, expressed in hertz (Hz). For example, a
  /// 1.2 GHz CPU is expressed as 1200000000.
  final double? clock;

  /// The CPU's frequency.
  final String? frequency;

  CPU({
    this.architecture,
    this.clock,
    this.frequency,
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      architecture: json['architecture'] as String?,
      clock: json['clock'] as double?,
      frequency: json['frequency'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final clock = this.clock;
    final frequency = this.frequency;
    return {
      if (architecture != null) 'architecture': architecture,
      if (clock != null) 'clock': clock,
      if (frequency != null) 'frequency': frequency,
    };
  }
}

/// Represents entity counters.
class Counters {
  /// The number of errored entities.
  final int? errored;

  /// The number of failed entities.
  final int? failed;

  /// The number of passed entities.
  final int? passed;

  /// The number of skipped entities.
  final int? skipped;

  /// The number of stopped entities.
  final int? stopped;

  /// The total number of entities.
  final int? total;

  /// The number of warned entities.
  final int? warned;

  Counters({
    this.errored,
    this.failed,
    this.passed,
    this.skipped,
    this.stopped,
    this.total,
    this.warned,
  });

  factory Counters.fromJson(Map<String, dynamic> json) {
    return Counters(
      errored: json['errored'] as int?,
      failed: json['failed'] as int?,
      passed: json['passed'] as int?,
      skipped: json['skipped'] as int?,
      stopped: json['stopped'] as int?,
      total: json['total'] as int?,
      warned: json['warned'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errored = this.errored;
    final failed = this.failed;
    final passed = this.passed;
    final skipped = this.skipped;
    final stopped = this.stopped;
    final total = this.total;
    final warned = this.warned;
    return {
      if (errored != null) 'errored': errored,
      if (failed != null) 'failed': failed,
      if (passed != null) 'passed': passed,
      if (skipped != null) 'skipped': skipped,
      if (stopped != null) 'stopped': stopped,
      if (total != null) 'total': total,
      if (warned != null) 'warned': warned,
    };
  }
}

/// Represents the result of a create device pool request.
class CreateDevicePoolResult {
  /// The newly created device pool.
  final DevicePool? devicePool;

  CreateDevicePoolResult({
    this.devicePool,
  });

  factory CreateDevicePoolResult.fromJson(Map<String, dynamic> json) {
    return CreateDevicePoolResult(
      devicePool: json['devicePool'] != null
          ? DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePool = this.devicePool;
    return {
      if (devicePool != null) 'devicePool': devicePool,
    };
  }
}

class CreateInstanceProfileResult {
  /// An object that contains information about your instance profile.
  final InstanceProfile? instanceProfile;

  CreateInstanceProfileResult({
    this.instanceProfile,
  });

  factory CreateInstanceProfileResult.fromJson(Map<String, dynamic> json) {
    return CreateInstanceProfileResult(
      instanceProfile: json['instanceProfile'] != null
          ? InstanceProfile.fromJson(
              json['instanceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfile = this.instanceProfile;
    return {
      if (instanceProfile != null) 'instanceProfile': instanceProfile,
    };
  }
}

class CreateNetworkProfileResult {
  /// The network profile that is returned by the create network profile request.
  final NetworkProfile? networkProfile;

  CreateNetworkProfileResult({
    this.networkProfile,
  });

  factory CreateNetworkProfileResult.fromJson(Map<String, dynamic> json) {
    return CreateNetworkProfileResult(
      networkProfile: json['networkProfile'] != null
          ? NetworkProfile.fromJson(
              json['networkProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkProfile = this.networkProfile;
    return {
      if (networkProfile != null) 'networkProfile': networkProfile,
    };
  }
}

/// Represents the result of a create project request.
class CreateProjectResult {
  /// The newly created project.
  final Project? project;

  CreateProjectResult({
    this.project,
  });

  factory CreateProjectResult.fromJson(Map<String, dynamic> json) {
    return CreateProjectResult(
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

/// Configuration settings for a remote access session, including billing
/// method.
class CreateRemoteAccessSessionConfiguration {
  /// The billing method for the remote access session.
  final BillingMethod? billingMethod;

  /// An array of ARNs included in the VPC endpoint configuration.
  final List<String>? vpceConfigurationArns;

  CreateRemoteAccessSessionConfiguration({
    this.billingMethod,
    this.vpceConfigurationArns,
  });

  Map<String, dynamic> toJson() {
    final billingMethod = this.billingMethod;
    final vpceConfigurationArns = this.vpceConfigurationArns;
    return {
      if (billingMethod != null) 'billingMethod': billingMethod.toValue(),
      if (vpceConfigurationArns != null)
        'vpceConfigurationArns': vpceConfigurationArns,
    };
  }
}

/// Represents the server response from a request to create a remote access
/// session.
class CreateRemoteAccessSessionResult {
  /// A container that describes the remote access session when the request to
  /// create a remote access session is sent.
  final RemoteAccessSession? remoteAccessSession;

  CreateRemoteAccessSessionResult({
    this.remoteAccessSession,
  });

  factory CreateRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) {
    return CreateRemoteAccessSessionResult(
      remoteAccessSession: json['remoteAccessSession'] != null
          ? RemoteAccessSession.fromJson(
              json['remoteAccessSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final remoteAccessSession = this.remoteAccessSession;
    return {
      if (remoteAccessSession != null)
        'remoteAccessSession': remoteAccessSession,
    };
  }
}

class CreateTestGridProjectResult {
  /// ARN of the Selenium testing project that was created.
  final TestGridProject? testGridProject;

  CreateTestGridProjectResult({
    this.testGridProject,
  });

  factory CreateTestGridProjectResult.fromJson(Map<String, dynamic> json) {
    return CreateTestGridProjectResult(
      testGridProject: json['testGridProject'] != null
          ? TestGridProject.fromJson(
              json['testGridProject'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final testGridProject = this.testGridProject;
    return {
      if (testGridProject != null) 'testGridProject': testGridProject,
    };
  }
}

class CreateTestGridUrlResult {
  /// The number of seconds the URL from <a>CreateTestGridUrlResult$url</a> stays
  /// active.
  final DateTime? expires;

  /// A signed URL, expiring in <a>CreateTestGridUrlRequest$expiresInSeconds</a>
  /// seconds, to be passed to a <code>RemoteWebDriver</code>.
  final String? url;

  CreateTestGridUrlResult({
    this.expires,
    this.url,
  });

  factory CreateTestGridUrlResult.fromJson(Map<String, dynamic> json) {
    return CreateTestGridUrlResult(
      expires: timeStampFromJson(json['expires']),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expires = this.expires;
    final url = this.url;
    return {
      if (expires != null) 'expires': unixTimestampToJson(expires),
      if (url != null) 'url': url,
    };
  }
}

/// Represents the result of a create upload request.
class CreateUploadResult {
  /// The newly created upload.
  final Upload? upload;

  CreateUploadResult({
    this.upload,
  });

  factory CreateUploadResult.fromJson(Map<String, dynamic> json) {
    return CreateUploadResult(
      upload: json['upload'] != null
          ? Upload.fromJson(json['upload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final upload = this.upload;
    return {
      if (upload != null) 'upload': upload,
    };
  }
}

class CreateVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  final VPCEConfiguration? vpceConfiguration;

  CreateVPCEConfigurationResult({
    this.vpceConfiguration,
  });

  factory CreateVPCEConfigurationResult.fromJson(Map<String, dynamic> json) {
    return CreateVPCEConfigurationResult(
      vpceConfiguration: json['vpceConfiguration'] != null
          ? VPCEConfiguration.fromJson(
              json['vpceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpceConfiguration = this.vpceConfiguration;
    return {
      if (vpceConfiguration != null) 'vpceConfiguration': vpceConfiguration,
    };
  }
}

enum CurrencyCode {
  usd,
}

extension CurrencyCodeValueExtension on CurrencyCode {
  String toValue() {
    switch (this) {
      case CurrencyCode.usd:
        return 'USD';
    }
  }
}

extension CurrencyCodeFromString on String {
  CurrencyCode toCurrencyCode() {
    switch (this) {
      case 'USD':
        return CurrencyCode.usd;
    }
    throw Exception('$this is not known in enum CurrencyCode');
  }
}

/// A JSON object that specifies the paths where the artifacts generated by the
/// customer's tests, on the device or in the test environment, are pulled from.
///
/// Specify <code>deviceHostPaths</code> and optionally specify either
/// <code>iosPaths</code> or <code>androidPaths</code>.
///
/// For web app tests, you can specify both <code>iosPaths</code> and
/// <code>androidPaths</code>.
class CustomerArtifactPaths {
  /// Comma-separated list of paths on the Android device where the artifacts
  /// generated by the customer's tests are pulled from.
  final List<String>? androidPaths;

  /// Comma-separated list of paths in the test execution environment where the
  /// artifacts generated by the customer's tests are pulled from.
  final List<String>? deviceHostPaths;

  /// Comma-separated list of paths on the iOS device where the artifacts
  /// generated by the customer's tests are pulled from.
  final List<String>? iosPaths;

  CustomerArtifactPaths({
    this.androidPaths,
    this.deviceHostPaths,
    this.iosPaths,
  });

  factory CustomerArtifactPaths.fromJson(Map<String, dynamic> json) {
    return CustomerArtifactPaths(
      androidPaths: (json['androidPaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deviceHostPaths: (json['deviceHostPaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      iosPaths: (json['iosPaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final androidPaths = this.androidPaths;
    final deviceHostPaths = this.deviceHostPaths;
    final iosPaths = this.iosPaths;
    return {
      if (androidPaths != null) 'androidPaths': androidPaths,
      if (deviceHostPaths != null) 'deviceHostPaths': deviceHostPaths,
      if (iosPaths != null) 'iosPaths': iosPaths,
    };
  }
}

/// Represents the result of a delete device pool request.
class DeleteDevicePoolResult {
  DeleteDevicePoolResult();

  factory DeleteDevicePoolResult.fromJson(Map<String, dynamic> _) {
    return DeleteDevicePoolResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInstanceProfileResult {
  DeleteInstanceProfileResult();

  factory DeleteInstanceProfileResult.fromJson(Map<String, dynamic> _) {
    return DeleteInstanceProfileResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNetworkProfileResult {
  DeleteNetworkProfileResult();

  factory DeleteNetworkProfileResult.fromJson(Map<String, dynamic> _) {
    return DeleteNetworkProfileResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the result of a delete project request.
class DeleteProjectResult {
  DeleteProjectResult();

  factory DeleteProjectResult.fromJson(Map<String, dynamic> _) {
    return DeleteProjectResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response from the server when a request is made to delete the remote
/// access session.
class DeleteRemoteAccessSessionResult {
  DeleteRemoteAccessSessionResult();

  factory DeleteRemoteAccessSessionResult.fromJson(Map<String, dynamic> _) {
    return DeleteRemoteAccessSessionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the result of a delete run request.
class DeleteRunResult {
  DeleteRunResult();

  factory DeleteRunResult.fromJson(Map<String, dynamic> _) {
    return DeleteRunResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTestGridProjectResult {
  DeleteTestGridProjectResult();

  factory DeleteTestGridProjectResult.fromJson(Map<String, dynamic> _) {
    return DeleteTestGridProjectResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the result of a delete upload request.
class DeleteUploadResult {
  DeleteUploadResult();

  factory DeleteUploadResult.fromJson(Map<String, dynamic> _) {
    return DeleteUploadResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVPCEConfigurationResult {
  DeleteVPCEConfigurationResult();

  factory DeleteVPCEConfigurationResult.fromJson(Map<String, dynamic> _) {
    return DeleteVPCEConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a device type that an app is tested against.
class Device {
  /// The device's ARN.
  final String? arn;

  /// Indicates how likely a device is available for a test run. Currently
  /// available in the <a>ListDevices</a> and GetDevice API methods.
  final DeviceAvailability? availability;

  /// The device's carrier.
  final String? carrier;

  /// Information about the device's CPU.
  final CPU? cpu;

  /// The name of the fleet to which this device belongs.
  final String? fleetName;

  /// The type of fleet to which this device belongs. Possible values are PRIVATE
  /// and PUBLIC.
  final String? fleetType;

  /// The device's form factor.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PHONE
  /// </li>
  /// <li>
  /// TABLET
  /// </li>
  /// </ul>
  final DeviceFormFactor? formFactor;

  /// The device's heap size, expressed in bytes.
  final int? heapSize;

  /// The device's image name.
  final String? image;

  /// The instances that belong to this device.
  final List<DeviceInstance>? instances;

  /// The device's manufacturer name.
  final String? manufacturer;

  /// The device's total memory size, expressed in bytes.
  final int? memory;

  /// The device's model name.
  final String? model;

  /// The device's model ID.
  final String? modelId;

  /// The device's display name.
  final String? name;

  /// The device's operating system type.
  final String? os;

  /// The device's platform.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// ANDROID
  /// </li>
  /// <li>
  /// IOS
  /// </li>
  /// </ul>
  final DevicePlatform? platform;

  /// The device's radio.
  final String? radio;

  /// Specifies whether remote access has been enabled for the specified device.
  final bool? remoteAccessEnabled;

  /// This flag is set to <code>true</code> if remote debugging is enabled for the
  /// device.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  final bool? remoteDebugEnabled;

  /// The resolution of the device.
  final Resolution? resolution;

  Device({
    this.arn,
    this.availability,
    this.carrier,
    this.cpu,
    this.fleetName,
    this.fleetType,
    this.formFactor,
    this.heapSize,
    this.image,
    this.instances,
    this.manufacturer,
    this.memory,
    this.model,
    this.modelId,
    this.name,
    this.os,
    this.platform,
    this.radio,
    this.remoteAccessEnabled,
    this.remoteDebugEnabled,
    this.resolution,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      arn: json['arn'] as String?,
      availability: (json['availability'] as String?)?.toDeviceAvailability(),
      carrier: json['carrier'] as String?,
      cpu: json['cpu'] != null
          ? CPU.fromJson(json['cpu'] as Map<String, dynamic>)
          : null,
      fleetName: json['fleetName'] as String?,
      fleetType: json['fleetType'] as String?,
      formFactor: (json['formFactor'] as String?)?.toDeviceFormFactor(),
      heapSize: json['heapSize'] as int?,
      image: json['image'] as String?,
      instances: (json['instances'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      manufacturer: json['manufacturer'] as String?,
      memory: json['memory'] as int?,
      model: json['model'] as String?,
      modelId: json['modelId'] as String?,
      name: json['name'] as String?,
      os: json['os'] as String?,
      platform: (json['platform'] as String?)?.toDevicePlatform(),
      radio: json['radio'] as String?,
      remoteAccessEnabled: json['remoteAccessEnabled'] as bool?,
      remoteDebugEnabled: json['remoteDebugEnabled'] as bool?,
      resolution: json['resolution'] != null
          ? Resolution.fromJson(json['resolution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availability = this.availability;
    final carrier = this.carrier;
    final cpu = this.cpu;
    final fleetName = this.fleetName;
    final fleetType = this.fleetType;
    final formFactor = this.formFactor;
    final heapSize = this.heapSize;
    final image = this.image;
    final instances = this.instances;
    final manufacturer = this.manufacturer;
    final memory = this.memory;
    final model = this.model;
    final modelId = this.modelId;
    final name = this.name;
    final os = this.os;
    final platform = this.platform;
    final radio = this.radio;
    final remoteAccessEnabled = this.remoteAccessEnabled;
    final remoteDebugEnabled = this.remoteDebugEnabled;
    final resolution = this.resolution;
    return {
      if (arn != null) 'arn': arn,
      if (availability != null) 'availability': availability.toValue(),
      if (carrier != null) 'carrier': carrier,
      if (cpu != null) 'cpu': cpu,
      if (fleetName != null) 'fleetName': fleetName,
      if (fleetType != null) 'fleetType': fleetType,
      if (formFactor != null) 'formFactor': formFactor.toValue(),
      if (heapSize != null) 'heapSize': heapSize,
      if (image != null) 'image': image,
      if (instances != null) 'instances': instances,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (memory != null) 'memory': memory,
      if (model != null) 'model': model,
      if (modelId != null) 'modelId': modelId,
      if (name != null) 'name': name,
      if (os != null) 'os': os,
      if (platform != null) 'platform': platform.toValue(),
      if (radio != null) 'radio': radio,
      if (remoteAccessEnabled != null)
        'remoteAccessEnabled': remoteAccessEnabled,
      if (remoteDebugEnabled != null) 'remoteDebugEnabled': remoteDebugEnabled,
      if (resolution != null) 'resolution': resolution,
    };
  }
}

enum DeviceAttribute {
  arn,
  platform,
  formFactor,
  manufacturer,
  remoteAccessEnabled,
  remoteDebugEnabled,
  appiumVersion,
  instanceArn,
  instanceLabels,
  fleetType,
  osVersion,
  model,
  availability,
}

extension DeviceAttributeValueExtension on DeviceAttribute {
  String toValue() {
    switch (this) {
      case DeviceAttribute.arn:
        return 'ARN';
      case DeviceAttribute.platform:
        return 'PLATFORM';
      case DeviceAttribute.formFactor:
        return 'FORM_FACTOR';
      case DeviceAttribute.manufacturer:
        return 'MANUFACTURER';
      case DeviceAttribute.remoteAccessEnabled:
        return 'REMOTE_ACCESS_ENABLED';
      case DeviceAttribute.remoteDebugEnabled:
        return 'REMOTE_DEBUG_ENABLED';
      case DeviceAttribute.appiumVersion:
        return 'APPIUM_VERSION';
      case DeviceAttribute.instanceArn:
        return 'INSTANCE_ARN';
      case DeviceAttribute.instanceLabels:
        return 'INSTANCE_LABELS';
      case DeviceAttribute.fleetType:
        return 'FLEET_TYPE';
      case DeviceAttribute.osVersion:
        return 'OS_VERSION';
      case DeviceAttribute.model:
        return 'MODEL';
      case DeviceAttribute.availability:
        return 'AVAILABILITY';
    }
  }
}

extension DeviceAttributeFromString on String {
  DeviceAttribute toDeviceAttribute() {
    switch (this) {
      case 'ARN':
        return DeviceAttribute.arn;
      case 'PLATFORM':
        return DeviceAttribute.platform;
      case 'FORM_FACTOR':
        return DeviceAttribute.formFactor;
      case 'MANUFACTURER':
        return DeviceAttribute.manufacturer;
      case 'REMOTE_ACCESS_ENABLED':
        return DeviceAttribute.remoteAccessEnabled;
      case 'REMOTE_DEBUG_ENABLED':
        return DeviceAttribute.remoteDebugEnabled;
      case 'APPIUM_VERSION':
        return DeviceAttribute.appiumVersion;
      case 'INSTANCE_ARN':
        return DeviceAttribute.instanceArn;
      case 'INSTANCE_LABELS':
        return DeviceAttribute.instanceLabels;
      case 'FLEET_TYPE':
        return DeviceAttribute.fleetType;
      case 'OS_VERSION':
        return DeviceAttribute.osVersion;
      case 'MODEL':
        return DeviceAttribute.model;
      case 'AVAILABILITY':
        return DeviceAttribute.availability;
    }
    throw Exception('$this is not known in enum DeviceAttribute');
  }
}

enum DeviceAvailability {
  temporaryNotAvailable,
  busy,
  available,
  highlyAvailable,
}

extension DeviceAvailabilityValueExtension on DeviceAvailability {
  String toValue() {
    switch (this) {
      case DeviceAvailability.temporaryNotAvailable:
        return 'TEMPORARY_NOT_AVAILABLE';
      case DeviceAvailability.busy:
        return 'BUSY';
      case DeviceAvailability.available:
        return 'AVAILABLE';
      case DeviceAvailability.highlyAvailable:
        return 'HIGHLY_AVAILABLE';
    }
  }
}

extension DeviceAvailabilityFromString on String {
  DeviceAvailability toDeviceAvailability() {
    switch (this) {
      case 'TEMPORARY_NOT_AVAILABLE':
        return DeviceAvailability.temporaryNotAvailable;
      case 'BUSY':
        return DeviceAvailability.busy;
      case 'AVAILABLE':
        return DeviceAvailability.available;
      case 'HIGHLY_AVAILABLE':
        return DeviceAvailability.highlyAvailable;
    }
    throw Exception('$this is not known in enum DeviceAvailability');
  }
}

/// Represents a device filter used to select a set of devices to be included in
/// a test run. This data structure is passed in as the
/// <code>deviceSelectionConfiguration</code> parameter to
/// <code>ScheduleRun</code>. For an example of the JSON request syntax, see
/// <a>ScheduleRun</a>.
///
/// It is also passed in as the <code>filters</code> parameter to
/// <code>ListDevices</code>. For an example of the JSON request syntax, see
/// <a>ListDevices</a>.
class DeviceFilter {
  /// The aspect of a device such as platform or model used as the selection
  /// criteria in a device filter.
  ///
  /// The supported operators for each attribute are provided in the following
  /// list.
  /// <dl> <dt>ARN</dt> <dd>
  /// The Amazon Resource Name (ARN) of the device (for example,
  /// <code>arn:aws:devicefarm:us-west-2::device:12345Example</code>).
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>PLATFORM</dt> <dd>
  /// The device platform. Valid values are ANDROID or IOS.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>OS_VERSION</dt> <dd>
  /// The operating system version (for example, 10.3.2).
  ///
  /// Supported operators: <code>EQUALS</code>, <code>GREATER_THAN</code>,
  /// <code>GREATER_THAN_OR_EQUALS</code>, <code>IN</code>,
  /// <code>LESS_THAN</code>, <code>LESS_THAN_OR_EQUALS</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>MODEL</dt> <dd>
  /// The device model (for example, iPad 5th Gen).
  ///
  /// Supported operators: <code>CONTAINS</code>, <code>EQUALS</code>,
  /// <code>IN</code>, <code>NOT_IN</code>
  /// </dd> <dt>AVAILABILITY</dt> <dd>
  /// The current availability of the device. Valid values are AVAILABLE,
  /// HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>FORM_FACTOR</dt> <dd>
  /// The device form factor. Valid values are PHONE or TABLET.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>MANUFACTURER</dt> <dd>
  /// The device manufacturer (for example, Apple).
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>REMOTE_ACCESS_ENABLED</dt> <dd>
  /// Whether the device is enabled for remote access. Valid values are TRUE or
  /// FALSE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>REMOTE_DEBUG_ENABLED</dt> <dd>
  /// Whether the device is enabled for remote debugging. Valid values are TRUE or
  /// FALSE.
  ///
  /// Supported operators: <code>EQUALS</code>
  ///
  /// Because remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>, this filter is ignored.
  /// </dd> <dt>INSTANCE_ARN</dt> <dd>
  /// The Amazon Resource Name (ARN) of the device instance.
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>INSTANCE_LABELS</dt> <dd>
  /// The label of the device instance.
  ///
  /// Supported operators: <code>CONTAINS</code>
  /// </dd> <dt>FLEET_TYPE</dt> <dd>
  /// The fleet type. Valid values are PUBLIC or PRIVATE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> </dl>
  final DeviceFilterAttribute attribute;

  /// Specifies how Device Farm compares the filter's attribute to the value. See
  /// the attribute descriptions.
  final RuleOperator operator;

  /// An array of one or more filter values used in a device filter.
  /// <p class="title"> <b>Operator Values</b>
  ///
  /// <ul>
  /// <li>
  /// The IN and NOT_IN operators can take a values array that has more than one
  /// element.
  /// </li>
  /// <li>
  /// The other operators require an array with a single element.
  /// </li>
  /// </ul> <p class="title"> <b>Attribute Values</b>
  ///
  /// <ul>
  /// <li>
  /// The PLATFORM attribute can be set to ANDROID or IOS.
  /// </li>
  /// <li>
  /// The AVAILABILITY attribute can be set to AVAILABLE, HIGHLY_AVAILABLE, BUSY,
  /// or TEMPORARY_NOT_AVAILABLE.
  /// </li>
  /// <li>
  /// The FORM_FACTOR attribute can be set to PHONE or TABLET.
  /// </li>
  /// <li>
  /// The FLEET_TYPE attribute can be set to PUBLIC or PRIVATE.
  /// </li>
  /// </ul>
  final List<String> values;

  DeviceFilter({
    required this.attribute,
    required this.operator,
    required this.values,
  });

  factory DeviceFilter.fromJson(Map<String, dynamic> json) {
    return DeviceFilter(
      attribute: (json['attribute'] as String).toDeviceFilterAttribute(),
      operator: (json['operator'] as String).toRuleOperator(),
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final operator = this.operator;
    final values = this.values;
    return {
      'attribute': attribute.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum DeviceFilterAttribute {
  arn,
  platform,
  osVersion,
  model,
  availability,
  formFactor,
  manufacturer,
  remoteAccessEnabled,
  remoteDebugEnabled,
  instanceArn,
  instanceLabels,
  fleetType,
}

extension DeviceFilterAttributeValueExtension on DeviceFilterAttribute {
  String toValue() {
    switch (this) {
      case DeviceFilterAttribute.arn:
        return 'ARN';
      case DeviceFilterAttribute.platform:
        return 'PLATFORM';
      case DeviceFilterAttribute.osVersion:
        return 'OS_VERSION';
      case DeviceFilterAttribute.model:
        return 'MODEL';
      case DeviceFilterAttribute.availability:
        return 'AVAILABILITY';
      case DeviceFilterAttribute.formFactor:
        return 'FORM_FACTOR';
      case DeviceFilterAttribute.manufacturer:
        return 'MANUFACTURER';
      case DeviceFilterAttribute.remoteAccessEnabled:
        return 'REMOTE_ACCESS_ENABLED';
      case DeviceFilterAttribute.remoteDebugEnabled:
        return 'REMOTE_DEBUG_ENABLED';
      case DeviceFilterAttribute.instanceArn:
        return 'INSTANCE_ARN';
      case DeviceFilterAttribute.instanceLabels:
        return 'INSTANCE_LABELS';
      case DeviceFilterAttribute.fleetType:
        return 'FLEET_TYPE';
    }
  }
}

extension DeviceFilterAttributeFromString on String {
  DeviceFilterAttribute toDeviceFilterAttribute() {
    switch (this) {
      case 'ARN':
        return DeviceFilterAttribute.arn;
      case 'PLATFORM':
        return DeviceFilterAttribute.platform;
      case 'OS_VERSION':
        return DeviceFilterAttribute.osVersion;
      case 'MODEL':
        return DeviceFilterAttribute.model;
      case 'AVAILABILITY':
        return DeviceFilterAttribute.availability;
      case 'FORM_FACTOR':
        return DeviceFilterAttribute.formFactor;
      case 'MANUFACTURER':
        return DeviceFilterAttribute.manufacturer;
      case 'REMOTE_ACCESS_ENABLED':
        return DeviceFilterAttribute.remoteAccessEnabled;
      case 'REMOTE_DEBUG_ENABLED':
        return DeviceFilterAttribute.remoteDebugEnabled;
      case 'INSTANCE_ARN':
        return DeviceFilterAttribute.instanceArn;
      case 'INSTANCE_LABELS':
        return DeviceFilterAttribute.instanceLabels;
      case 'FLEET_TYPE':
        return DeviceFilterAttribute.fleetType;
    }
    throw Exception('$this is not known in enum DeviceFilterAttribute');
  }
}

enum DeviceFormFactor {
  phone,
  tablet,
}

extension DeviceFormFactorValueExtension on DeviceFormFactor {
  String toValue() {
    switch (this) {
      case DeviceFormFactor.phone:
        return 'PHONE';
      case DeviceFormFactor.tablet:
        return 'TABLET';
    }
  }
}

extension DeviceFormFactorFromString on String {
  DeviceFormFactor toDeviceFormFactor() {
    switch (this) {
      case 'PHONE':
        return DeviceFormFactor.phone;
      case 'TABLET':
        return DeviceFormFactor.tablet;
    }
    throw Exception('$this is not known in enum DeviceFormFactor');
  }
}

/// Represents the device instance.
class DeviceInstance {
  /// The Amazon Resource Name (ARN) of the device instance.
  final String? arn;

  /// The ARN of the device.
  final String? deviceArn;

  /// A object that contains information about the instance profile.
  final InstanceProfile? instanceProfile;

  /// An array of strings that describe the device instance.
  final List<String>? labels;

  /// The status of the device instance. Valid values are listed here.
  final InstanceStatus? status;

  /// Unique device identifier for the device instance.
  final String? udid;

  DeviceInstance({
    this.arn,
    this.deviceArn,
    this.instanceProfile,
    this.labels,
    this.status,
    this.udid,
  });

  factory DeviceInstance.fromJson(Map<String, dynamic> json) {
    return DeviceInstance(
      arn: json['arn'] as String?,
      deviceArn: json['deviceArn'] as String?,
      instanceProfile: json['instanceProfile'] != null
          ? InstanceProfile.fromJson(
              json['instanceProfile'] as Map<String, dynamic>)
          : null,
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toInstanceStatus(),
      udid: json['udid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deviceArn = this.deviceArn;
    final instanceProfile = this.instanceProfile;
    final labels = this.labels;
    final status = this.status;
    final udid = this.udid;
    return {
      if (arn != null) 'arn': arn,
      if (deviceArn != null) 'deviceArn': deviceArn,
      if (instanceProfile != null) 'instanceProfile': instanceProfile,
      if (labels != null) 'labels': labels,
      if (status != null) 'status': status.toValue(),
      if (udid != null) 'udid': udid,
    };
  }
}

/// Represents the total (metered or unmetered) minutes used by the resource to
/// run tests. Contains the sum of minutes consumed by all children.
class DeviceMinutes {
  /// When specified, represents only the sum of metered minutes used by the
  /// resource to run tests.
  final double? metered;

  /// When specified, represents the total minutes used by the resource to run
  /// tests.
  final double? total;

  /// When specified, represents only the sum of unmetered minutes used by the
  /// resource to run tests.
  final double? unmetered;

  DeviceMinutes({
    this.metered,
    this.total,
    this.unmetered,
  });

  factory DeviceMinutes.fromJson(Map<String, dynamic> json) {
    return DeviceMinutes(
      metered: json['metered'] as double?,
      total: json['total'] as double?,
      unmetered: json['unmetered'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metered = this.metered;
    final total = this.total;
    final unmetered = this.unmetered;
    return {
      if (metered != null) 'metered': metered,
      if (total != null) 'total': total,
      if (unmetered != null) 'unmetered': unmetered,
    };
  }
}

enum DevicePlatform {
  android,
  ios,
}

extension DevicePlatformValueExtension on DevicePlatform {
  String toValue() {
    switch (this) {
      case DevicePlatform.android:
        return 'ANDROID';
      case DevicePlatform.ios:
        return 'IOS';
    }
  }
}

extension DevicePlatformFromString on String {
  DevicePlatform toDevicePlatform() {
    switch (this) {
      case 'ANDROID':
        return DevicePlatform.android;
      case 'IOS':
        return DevicePlatform.ios;
    }
    throw Exception('$this is not known in enum DevicePlatform');
  }
}

/// Represents a collection of device types.
class DevicePool {
  /// The device pool's ARN.
  final String? arn;

  /// The device pool's description.
  final String? description;

  /// The number of devices that Device Farm can add to your device pool. Device
  /// Farm adds devices that are available and meet the criteria that you assign
  /// for the <code>rules</code> parameter. Depending on how many devices meet
  /// these constraints, your device pool might contain fewer devices than the
  /// value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs that
  /// you incur by running tests.
  final int? maxDevices;

  /// The device pool's name.
  final String? name;

  /// Information about the device pool's rules.
  final List<Rule>? rules;

  /// The device pool's type.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// CURATED: A device pool that is created and managed by AWS Device Farm.
  /// </li>
  /// <li>
  /// PRIVATE: A device pool that is created and managed by the device pool
  /// developer.
  /// </li>
  /// </ul>
  final DevicePoolType? type;

  DevicePool({
    this.arn,
    this.description,
    this.maxDevices,
    this.name,
    this.rules,
    this.type,
  });

  factory DevicePool.fromJson(Map<String, dynamic> json) {
    return DevicePool(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      maxDevices: json['maxDevices'] as int?,
      name: json['name'] as String?,
      rules: (json['rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.toDevicePoolType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final maxDevices = this.maxDevices;
    final name = this.name;
    final rules = this.rules;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (maxDevices != null) 'maxDevices': maxDevices,
      if (name != null) 'name': name,
      if (rules != null) 'rules': rules,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Represents a device pool compatibility result.
class DevicePoolCompatibilityResult {
  /// Whether the result was compatible with the device pool.
  final bool? compatible;

  /// The device (phone or tablet) to return information about.
  final Device? device;

  /// Information about the compatibility.
  final List<IncompatibilityMessage>? incompatibilityMessages;

  DevicePoolCompatibilityResult({
    this.compatible,
    this.device,
    this.incompatibilityMessages,
  });

  factory DevicePoolCompatibilityResult.fromJson(Map<String, dynamic> json) {
    return DevicePoolCompatibilityResult(
      compatible: json['compatible'] as bool?,
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
      incompatibilityMessages: (json['incompatibilityMessages'] as List?)
          ?.whereNotNull()
          .map(
              (e) => IncompatibilityMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatible = this.compatible;
    final device = this.device;
    final incompatibilityMessages = this.incompatibilityMessages;
    return {
      if (compatible != null) 'compatible': compatible,
      if (device != null) 'device': device,
      if (incompatibilityMessages != null)
        'incompatibilityMessages': incompatibilityMessages,
    };
  }
}

enum DevicePoolType {
  curated,
  private,
}

extension DevicePoolTypeValueExtension on DevicePoolType {
  String toValue() {
    switch (this) {
      case DevicePoolType.curated:
        return 'CURATED';
      case DevicePoolType.private:
        return 'PRIVATE';
    }
  }
}

extension DevicePoolTypeFromString on String {
  DevicePoolType toDevicePoolType() {
    switch (this) {
      case 'CURATED':
        return DevicePoolType.curated;
      case 'PRIVATE':
        return DevicePoolType.private;
    }
    throw Exception('$this is not known in enum DevicePoolType');
  }
}

/// Represents the device filters used in a test run and the maximum number of
/// devices to be included in the run. It is passed in as the
/// <code>deviceSelectionConfiguration</code> request parameter in
/// <a>ScheduleRun</a>.
class DeviceSelectionConfiguration {
  /// Used to dynamically select a set of devices for a test run. A filter is made
  /// up of an attribute, an operator, and one or more values.
  ///
  /// <ul>
  /// <li>
  /// <b>Attribute</b>
  ///
  /// The aspect of a device such as platform or model used as the selection
  /// criteria in a device filter.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// ARN: The Amazon Resource Name (ARN) of the device (for example,
  /// <code>arn:aws:devicefarm:us-west-2::device:12345Example</code>).
  /// </li>
  /// <li>
  /// PLATFORM: The device platform. Valid values are ANDROID or IOS.
  /// </li>
  /// <li>
  /// OS_VERSION: The operating system version (for example, 10.3.2).
  /// </li>
  /// <li>
  /// MODEL: The device model (for example, iPad 5th Gen).
  /// </li>
  /// <li>
  /// AVAILABILITY: The current availability of the device. Valid values are
  /// AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.
  /// </li>
  /// <li>
  /// FORM_FACTOR: The device form factor. Valid values are PHONE or TABLET.
  /// </li>
  /// <li>
  /// MANUFACTURER: The device manufacturer (for example, Apple).
  /// </li>
  /// <li>
  /// REMOTE_ACCESS_ENABLED: Whether the device is enabled for remote access.
  /// Valid values are TRUE or FALSE.
  /// </li>
  /// <li>
  /// REMOTE_DEBUG_ENABLED: Whether the device is enabled for remote debugging.
  /// Valid values are TRUE or FALSE. Because remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>, this filter is ignored.
  /// </li>
  /// <li>
  /// INSTANCE_ARN: The Amazon Resource Name (ARN) of the device instance.
  /// </li>
  /// <li>
  /// INSTANCE_LABELS: The label of the device instance.
  /// </li>
  /// <li>
  /// FLEET_TYPE: The fleet type. Valid values are PUBLIC or PRIVATE.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Operator</b>
  ///
  /// The filter operator.
  ///
  /// <ul>
  /// <li>
  /// The EQUALS operator is available for every attribute except INSTANCE_LABELS.
  /// </li>
  /// <li>
  /// The CONTAINS operator is available for the INSTANCE_LABELS and MODEL
  /// attributes.
  /// </li>
  /// <li>
  /// The IN and NOT_IN operators are available for the ARN, OS_VERSION, MODEL,
  /// MANUFACTURER, and INSTANCE_ARN attributes.
  /// </li>
  /// <li>
  /// The LESS_THAN, GREATER_THAN, LESS_THAN_OR_EQUALS, and GREATER_THAN_OR_EQUALS
  /// operators are also available for the OS_VERSION attribute.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Values</b>
  ///
  /// An array of one or more filter values.
  /// <p class="title"> <b>Operator Values</b>
  ///
  /// <ul>
  /// <li>
  /// The IN and NOT_IN operators can take a values array that has more than one
  /// element.
  /// </li>
  /// <li>
  /// The other operators require an array with a single element.
  /// </li>
  /// </ul> <p class="title"> <b>Attribute Values</b>
  ///
  /// <ul>
  /// <li>
  /// The PLATFORM attribute can be set to ANDROID or IOS.
  /// </li>
  /// <li>
  /// The AVAILABILITY attribute can be set to AVAILABLE, HIGHLY_AVAILABLE, BUSY,
  /// or TEMPORARY_NOT_AVAILABLE.
  /// </li>
  /// <li>
  /// The FORM_FACTOR attribute can be set to PHONE or TABLET.
  /// </li>
  /// <li>
  /// The FLEET_TYPE attribute can be set to PUBLIC or PRIVATE.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final List<DeviceFilter> filters;

  /// The maximum number of devices to be included in a test run.
  final int maxDevices;

  DeviceSelectionConfiguration({
    required this.filters,
    required this.maxDevices,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final maxDevices = this.maxDevices;
    return {
      'filters': filters,
      'maxDevices': maxDevices,
    };
  }
}

/// Contains the run results requested by the device selection configuration and
/// how many devices were returned. For an example of the JSON response syntax,
/// see <a>ScheduleRun</a>.
class DeviceSelectionResult {
  /// The filters in a device selection result.
  final List<DeviceFilter>? filters;

  /// The number of devices that matched the device filter selection criteria.
  final int? matchedDevicesCount;

  /// The maximum number of devices to be selected by a device filter and included
  /// in a test run.
  final int? maxDevices;

  DeviceSelectionResult({
    this.filters,
    this.matchedDevicesCount,
    this.maxDevices,
  });

  factory DeviceSelectionResult.fromJson(Map<String, dynamic> json) {
    return DeviceSelectionResult(
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchedDevicesCount: json['matchedDevicesCount'] as int?,
      maxDevices: json['maxDevices'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final matchedDevicesCount = this.matchedDevicesCount;
    final maxDevices = this.maxDevices;
    return {
      if (filters != null) 'filters': filters,
      if (matchedDevicesCount != null)
        'matchedDevicesCount': matchedDevicesCount,
      if (maxDevices != null) 'maxDevices': maxDevices,
    };
  }
}

/// Represents configuration information about a test run, such as the execution
/// timeout (in minutes).
class ExecutionConfiguration {
  /// True if account cleanup is enabled at the beginning of the test. Otherwise,
  /// false.
  final bool? accountsCleanup;

  /// True if app package cleanup is enabled at the beginning of the test.
  /// Otherwise, false.
  final bool? appPackagesCleanup;

  /// The number of minutes a test run executes before it times out.
  final int? jobTimeoutMinutes;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="http://aws.amazon.com/device-farm/faqs/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  final bool? skipAppResign;

  /// Set to true to enable video capture. Otherwise, set to false. The default is
  /// true.
  final bool? videoCapture;

  ExecutionConfiguration({
    this.accountsCleanup,
    this.appPackagesCleanup,
    this.jobTimeoutMinutes,
    this.skipAppResign,
    this.videoCapture,
  });

  Map<String, dynamic> toJson() {
    final accountsCleanup = this.accountsCleanup;
    final appPackagesCleanup = this.appPackagesCleanup;
    final jobTimeoutMinutes = this.jobTimeoutMinutes;
    final skipAppResign = this.skipAppResign;
    final videoCapture = this.videoCapture;
    return {
      if (accountsCleanup != null) 'accountsCleanup': accountsCleanup,
      if (appPackagesCleanup != null) 'appPackagesCleanup': appPackagesCleanup,
      if (jobTimeoutMinutes != null) 'jobTimeoutMinutes': jobTimeoutMinutes,
      if (skipAppResign != null) 'skipAppResign': skipAppResign,
      if (videoCapture != null) 'videoCapture': videoCapture,
    };
  }
}

enum ExecutionResult {
  pending,
  passed,
  warned,
  failed,
  skipped,
  errored,
  stopped,
}

extension ExecutionResultValueExtension on ExecutionResult {
  String toValue() {
    switch (this) {
      case ExecutionResult.pending:
        return 'PENDING';
      case ExecutionResult.passed:
        return 'PASSED';
      case ExecutionResult.warned:
        return 'WARNED';
      case ExecutionResult.failed:
        return 'FAILED';
      case ExecutionResult.skipped:
        return 'SKIPPED';
      case ExecutionResult.errored:
        return 'ERRORED';
      case ExecutionResult.stopped:
        return 'STOPPED';
    }
  }
}

extension ExecutionResultFromString on String {
  ExecutionResult toExecutionResult() {
    switch (this) {
      case 'PENDING':
        return ExecutionResult.pending;
      case 'PASSED':
        return ExecutionResult.passed;
      case 'WARNED':
        return ExecutionResult.warned;
      case 'FAILED':
        return ExecutionResult.failed;
      case 'SKIPPED':
        return ExecutionResult.skipped;
      case 'ERRORED':
        return ExecutionResult.errored;
      case 'STOPPED':
        return ExecutionResult.stopped;
    }
    throw Exception('$this is not known in enum ExecutionResult');
  }
}

enum ExecutionResultCode {
  parsingFailed,
  vpcEndpointSetupFailed,
}

extension ExecutionResultCodeValueExtension on ExecutionResultCode {
  String toValue() {
    switch (this) {
      case ExecutionResultCode.parsingFailed:
        return 'PARSING_FAILED';
      case ExecutionResultCode.vpcEndpointSetupFailed:
        return 'VPC_ENDPOINT_SETUP_FAILED';
    }
  }
}

extension ExecutionResultCodeFromString on String {
  ExecutionResultCode toExecutionResultCode() {
    switch (this) {
      case 'PARSING_FAILED':
        return ExecutionResultCode.parsingFailed;
      case 'VPC_ENDPOINT_SETUP_FAILED':
        return ExecutionResultCode.vpcEndpointSetupFailed;
    }
    throw Exception('$this is not known in enum ExecutionResultCode');
  }
}

enum ExecutionStatus {
  pending,
  pendingConcurrency,
  pendingDevice,
  processing,
  scheduling,
  preparing,
  running,
  completed,
  stopping,
}

extension ExecutionStatusValueExtension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.pending:
        return 'PENDING';
      case ExecutionStatus.pendingConcurrency:
        return 'PENDING_CONCURRENCY';
      case ExecutionStatus.pendingDevice:
        return 'PENDING_DEVICE';
      case ExecutionStatus.processing:
        return 'PROCESSING';
      case ExecutionStatus.scheduling:
        return 'SCHEDULING';
      case ExecutionStatus.preparing:
        return 'PREPARING';
      case ExecutionStatus.running:
        return 'RUNNING';
      case ExecutionStatus.completed:
        return 'COMPLETED';
      case ExecutionStatus.stopping:
        return 'STOPPING';
    }
  }
}

extension ExecutionStatusFromString on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'PENDING':
        return ExecutionStatus.pending;
      case 'PENDING_CONCURRENCY':
        return ExecutionStatus.pendingConcurrency;
      case 'PENDING_DEVICE':
        return ExecutionStatus.pendingDevice;
      case 'PROCESSING':
        return ExecutionStatus.processing;
      case 'SCHEDULING':
        return ExecutionStatus.scheduling;
      case 'PREPARING':
        return ExecutionStatus.preparing;
      case 'RUNNING':
        return ExecutionStatus.running;
      case 'COMPLETED':
        return ExecutionStatus.completed;
      case 'STOPPING':
        return ExecutionStatus.stopping;
    }
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

/// Represents the account settings return values from the
/// <code>GetAccountSettings</code> request.
class GetAccountSettingsResult {
  /// The account settings.
  final AccountSettings? accountSettings;

  GetAccountSettingsResult({
    this.accountSettings,
  });

  factory GetAccountSettingsResult.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResult(
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

class GetDeviceInstanceResult {
  /// An object that contains information about your device instance.
  final DeviceInstance? deviceInstance;

  GetDeviceInstanceResult({
    this.deviceInstance,
  });

  factory GetDeviceInstanceResult.fromJson(Map<String, dynamic> json) {
    return GetDeviceInstanceResult(
      deviceInstance: json['deviceInstance'] != null
          ? DeviceInstance.fromJson(
              json['deviceInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceInstance = this.deviceInstance;
    return {
      if (deviceInstance != null) 'deviceInstance': deviceInstance,
    };
  }
}

/// Represents the result of describe device pool compatibility request.
class GetDevicePoolCompatibilityResult {
  /// Information about compatible devices.
  final List<DevicePoolCompatibilityResult>? compatibleDevices;

  /// Information about incompatible devices.
  final List<DevicePoolCompatibilityResult>? incompatibleDevices;

  GetDevicePoolCompatibilityResult({
    this.compatibleDevices,
    this.incompatibleDevices,
  });

  factory GetDevicePoolCompatibilityResult.fromJson(Map<String, dynamic> json) {
    return GetDevicePoolCompatibilityResult(
      compatibleDevices: (json['compatibleDevices'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DevicePoolCompatibilityResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      incompatibleDevices: (json['incompatibleDevices'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DevicePoolCompatibilityResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleDevices = this.compatibleDevices;
    final incompatibleDevices = this.incompatibleDevices;
    return {
      if (compatibleDevices != null) 'compatibleDevices': compatibleDevices,
      if (incompatibleDevices != null)
        'incompatibleDevices': incompatibleDevices,
    };
  }
}

/// Represents the result of a get device pool request.
class GetDevicePoolResult {
  /// An object that contains information about the requested device pool.
  final DevicePool? devicePool;

  GetDevicePoolResult({
    this.devicePool,
  });

  factory GetDevicePoolResult.fromJson(Map<String, dynamic> json) {
    return GetDevicePoolResult(
      devicePool: json['devicePool'] != null
          ? DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePool = this.devicePool;
    return {
      if (devicePool != null) 'devicePool': devicePool,
    };
  }
}

/// Represents the result of a get device request.
class GetDeviceResult {
  /// An object that contains information about the requested device.
  final Device? device;

  GetDeviceResult({
    this.device,
  });

  factory GetDeviceResult.fromJson(Map<String, dynamic> json) {
    return GetDeviceResult(
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'device': device,
    };
  }
}

class GetInstanceProfileResult {
  /// An object that contains information about an instance profile.
  final InstanceProfile? instanceProfile;

  GetInstanceProfileResult({
    this.instanceProfile,
  });

  factory GetInstanceProfileResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceProfileResult(
      instanceProfile: json['instanceProfile'] != null
          ? InstanceProfile.fromJson(
              json['instanceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfile = this.instanceProfile;
    return {
      if (instanceProfile != null) 'instanceProfile': instanceProfile,
    };
  }
}

/// Represents the result of a get job request.
class GetJobResult {
  /// An object that contains information about the requested job.
  final Job? job;

  GetJobResult({
    this.job,
  });

  factory GetJobResult.fromJson(Map<String, dynamic> json) {
    return GetJobResult(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class GetNetworkProfileResult {
  /// The network profile.
  final NetworkProfile? networkProfile;

  GetNetworkProfileResult({
    this.networkProfile,
  });

  factory GetNetworkProfileResult.fromJson(Map<String, dynamic> json) {
    return GetNetworkProfileResult(
      networkProfile: json['networkProfile'] != null
          ? NetworkProfile.fromJson(
              json['networkProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkProfile = this.networkProfile;
    return {
      if (networkProfile != null) 'networkProfile': networkProfile,
    };
  }
}

/// Returns the status result for a device offering.
class GetOfferingStatusResult {
  /// When specified, gets the offering status for the current period.
  final Map<String, OfferingStatus>? current;

  /// When specified, gets the offering status for the next period.
  final Map<String, OfferingStatus>? nextPeriod;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  GetOfferingStatusResult({
    this.current,
    this.nextPeriod,
    this.nextToken,
  });

  factory GetOfferingStatusResult.fromJson(Map<String, dynamic> json) {
    return GetOfferingStatusResult(
      current: (json['current'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, OfferingStatus.fromJson(e as Map<String, dynamic>))),
      nextPeriod: (json['nextPeriod'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, OfferingStatus.fromJson(e as Map<String, dynamic>))),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final current = this.current;
    final nextPeriod = this.nextPeriod;
    final nextToken = this.nextToken;
    return {
      if (current != null) 'current': current,
      if (nextPeriod != null) 'nextPeriod': nextPeriod,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the result of a get project request.
class GetProjectResult {
  /// The project to get information about.
  final Project? project;

  GetProjectResult({
    this.project,
  });

  factory GetProjectResult.fromJson(Map<String, dynamic> json) {
    return GetProjectResult(
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

/// Represents the response from the server that lists detailed information
/// about the remote access session.
class GetRemoteAccessSessionResult {
  /// A container that lists detailed information about the remote access session.
  final RemoteAccessSession? remoteAccessSession;

  GetRemoteAccessSessionResult({
    this.remoteAccessSession,
  });

  factory GetRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) {
    return GetRemoteAccessSessionResult(
      remoteAccessSession: json['remoteAccessSession'] != null
          ? RemoteAccessSession.fromJson(
              json['remoteAccessSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final remoteAccessSession = this.remoteAccessSession;
    return {
      if (remoteAccessSession != null)
        'remoteAccessSession': remoteAccessSession,
    };
  }
}

/// Represents the result of a get run request.
class GetRunResult {
  /// The run to get results from.
  final Run? run;

  GetRunResult({
    this.run,
  });

  factory GetRunResult.fromJson(Map<String, dynamic> json) {
    return GetRunResult(
      run: json['run'] != null
          ? Run.fromJson(json['run'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final run = this.run;
    return {
      if (run != null) 'run': run,
    };
  }
}

/// Represents the result of a get suite request.
class GetSuiteResult {
  /// A collection of one or more tests.
  final Suite? suite;

  GetSuiteResult({
    this.suite,
  });

  factory GetSuiteResult.fromJson(Map<String, dynamic> json) {
    return GetSuiteResult(
      suite: json['suite'] != null
          ? Suite.fromJson(json['suite'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final suite = this.suite;
    return {
      if (suite != null) 'suite': suite,
    };
  }
}

class GetTestGridProjectResult {
  /// A <a>TestGridProject</a>.
  final TestGridProject? testGridProject;

  GetTestGridProjectResult({
    this.testGridProject,
  });

  factory GetTestGridProjectResult.fromJson(Map<String, dynamic> json) {
    return GetTestGridProjectResult(
      testGridProject: json['testGridProject'] != null
          ? TestGridProject.fromJson(
              json['testGridProject'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final testGridProject = this.testGridProject;
    return {
      if (testGridProject != null) 'testGridProject': testGridProject,
    };
  }
}

class GetTestGridSessionResult {
  /// The <a>TestGridSession</a> that was requested.
  final TestGridSession? testGridSession;

  GetTestGridSessionResult({
    this.testGridSession,
  });

  factory GetTestGridSessionResult.fromJson(Map<String, dynamic> json) {
    return GetTestGridSessionResult(
      testGridSession: json['testGridSession'] != null
          ? TestGridSession.fromJson(
              json['testGridSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final testGridSession = this.testGridSession;
    return {
      if (testGridSession != null) 'testGridSession': testGridSession,
    };
  }
}

/// Represents the result of a get test request.
class GetTestResult {
  /// A test condition that is evaluated.
  final Test? test;

  GetTestResult({
    this.test,
  });

  factory GetTestResult.fromJson(Map<String, dynamic> json) {
    return GetTestResult(
      test: json['test'] != null
          ? Test.fromJson(json['test'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final test = this.test;
    return {
      if (test != null) 'test': test,
    };
  }
}

/// Represents the result of a get upload request.
class GetUploadResult {
  /// An app or a set of one or more tests to upload or that have been uploaded.
  final Upload? upload;

  GetUploadResult({
    this.upload,
  });

  factory GetUploadResult.fromJson(Map<String, dynamic> json) {
    return GetUploadResult(
      upload: json['upload'] != null
          ? Upload.fromJson(json['upload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final upload = this.upload;
    return {
      if (upload != null) 'upload': upload,
    };
  }
}

class GetVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  final VPCEConfiguration? vpceConfiguration;

  GetVPCEConfigurationResult({
    this.vpceConfiguration,
  });

  factory GetVPCEConfigurationResult.fromJson(Map<String, dynamic> json) {
    return GetVPCEConfigurationResult(
      vpceConfiguration: json['vpceConfiguration'] != null
          ? VPCEConfiguration.fromJson(
              json['vpceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpceConfiguration = this.vpceConfiguration;
    return {
      if (vpceConfiguration != null) 'vpceConfiguration': vpceConfiguration,
    };
  }
}

/// Represents information about incompatibility.
class IncompatibilityMessage {
  /// A message about the incompatibility.
  final String? message;

  /// The type of incompatibility.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// ARN
  /// </li>
  /// <li>
  /// FORM_FACTOR (for example, phone or tablet)
  /// </li>
  /// <li>
  /// MANUFACTURER
  /// </li>
  /// <li>
  /// PLATFORM (for example, Android or iOS)
  /// </li>
  /// <li>
  /// REMOTE_ACCESS_ENABLED
  /// </li>
  /// <li>
  /// APPIUM_VERSION
  /// </li>
  /// </ul>
  final DeviceAttribute? type;

  IncompatibilityMessage({
    this.message,
    this.type,
  });

  factory IncompatibilityMessage.fromJson(Map<String, dynamic> json) {
    return IncompatibilityMessage(
      message: json['message'] as String?,
      type: (json['type'] as String?)?.toDeviceAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'message': message,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Represents the response from the server after AWS Device Farm makes a
/// request to install to a remote access session.
class InstallToRemoteAccessSessionResult {
  /// An app to upload or that has been uploaded.
  final Upload? appUpload;

  InstallToRemoteAccessSessionResult({
    this.appUpload,
  });

  factory InstallToRemoteAccessSessionResult.fromJson(
      Map<String, dynamic> json) {
    return InstallToRemoteAccessSessionResult(
      appUpload: json['appUpload'] != null
          ? Upload.fromJson(json['appUpload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appUpload = this.appUpload;
    return {
      if (appUpload != null) 'appUpload': appUpload,
    };
  }
}

/// Represents the instance profile.
class InstanceProfile {
  /// The Amazon Resource Name (ARN) of the instance profile.
  final String? arn;

  /// The description of the instance profile.
  final String? description;

  /// An array of strings containing the list of app packages that should not be
  /// cleaned up from the device after a test run completes.
  ///
  /// The list of packages is considered only if you set
  /// <code>packageCleanup</code> to <code>true</code>.
  final List<String>? excludeAppPackagesFromCleanup;

  /// The name of the instance profile.
  final String? name;

  /// When set to <code>true</code>, Device Farm removes app packages after a test
  /// run. The default value is <code>false</code> for private devices.
  final bool? packageCleanup;

  /// When set to <code>true</code>, Device Farm reboots the instance after a test
  /// run. The default value is <code>true</code>.
  final bool? rebootAfterUse;

  InstanceProfile({
    this.arn,
    this.description,
    this.excludeAppPackagesFromCleanup,
    this.name,
    this.packageCleanup,
    this.rebootAfterUse,
  });

  factory InstanceProfile.fromJson(Map<String, dynamic> json) {
    return InstanceProfile(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      excludeAppPackagesFromCleanup:
          (json['excludeAppPackagesFromCleanup'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      name: json['name'] as String?,
      packageCleanup: json['packageCleanup'] as bool?,
      rebootAfterUse: json['rebootAfterUse'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final excludeAppPackagesFromCleanup = this.excludeAppPackagesFromCleanup;
    final name = this.name;
    final packageCleanup = this.packageCleanup;
    final rebootAfterUse = this.rebootAfterUse;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (excludeAppPackagesFromCleanup != null)
        'excludeAppPackagesFromCleanup': excludeAppPackagesFromCleanup,
      if (name != null) 'name': name,
      if (packageCleanup != null) 'packageCleanup': packageCleanup,
      if (rebootAfterUse != null) 'rebootAfterUse': rebootAfterUse,
    };
  }
}

enum InstanceStatus {
  inUse,
  preparing,
  available,
  notAvailable,
}

extension InstanceStatusValueExtension on InstanceStatus {
  String toValue() {
    switch (this) {
      case InstanceStatus.inUse:
        return 'IN_USE';
      case InstanceStatus.preparing:
        return 'PREPARING';
      case InstanceStatus.available:
        return 'AVAILABLE';
      case InstanceStatus.notAvailable:
        return 'NOT_AVAILABLE';
    }
  }
}

extension InstanceStatusFromString on String {
  InstanceStatus toInstanceStatus() {
    switch (this) {
      case 'IN_USE':
        return InstanceStatus.inUse;
      case 'PREPARING':
        return InstanceStatus.preparing;
      case 'AVAILABLE':
        return InstanceStatus.available;
      case 'NOT_AVAILABLE':
        return InstanceStatus.notAvailable;
    }
    throw Exception('$this is not known in enum InstanceStatus');
  }
}

enum InteractionMode {
  interactive,
  noVideo,
  videoOnly,
}

extension InteractionModeValueExtension on InteractionMode {
  String toValue() {
    switch (this) {
      case InteractionMode.interactive:
        return 'INTERACTIVE';
      case InteractionMode.noVideo:
        return 'NO_VIDEO';
      case InteractionMode.videoOnly:
        return 'VIDEO_ONLY';
    }
  }
}

extension InteractionModeFromString on String {
  InteractionMode toInteractionMode() {
    switch (this) {
      case 'INTERACTIVE':
        return InteractionMode.interactive;
      case 'NO_VIDEO':
        return InteractionMode.noVideo;
      case 'VIDEO_ONLY':
        return InteractionMode.videoOnly;
    }
    throw Exception('$this is not known in enum InteractionMode');
  }
}

/// Represents a device.
class Job {
  /// The job's ARN.
  final String? arn;

  /// The job's result counters.
  final Counters? counters;

  /// When the job was created.
  final DateTime? created;

  /// The device (phone or tablet).
  final Device? device;

  /// Represents the total (metered or unmetered) minutes used by the job.
  final DeviceMinutes? deviceMinutes;

  /// The ARN of the instance.
  final String? instanceArn;

  /// A message about the job's result.
  final String? message;

  /// The job's name.
  final String? name;

  /// The job's result.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// The job's start time.
  final DateTime? started;

  /// The job's status.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PENDING_CONCURRENCY
  /// </li>
  /// <li>
  /// PENDING_DEVICE
  /// </li>
  /// <li>
  /// PROCESSING
  /// </li>
  /// <li>
  /// SCHEDULING
  /// </li>
  /// <li>
  /// PREPARING
  /// </li>
  /// <li>
  /// RUNNING
  /// </li>
  /// <li>
  /// COMPLETED
  /// </li>
  /// <li>
  /// STOPPING
  /// </li>
  /// </ul>
  final ExecutionStatus? status;

  /// The job's stop time.
  final DateTime? stopped;

  /// The job's type.
  ///
  /// Allowed values include the following:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER. For Android, an app explorer that traverses an Android
  /// app, interacting with it and capturing screenshots at the same time.
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_NODE
  /// </li>
  /// <li>
  /// APPIUM_RUBY
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY
  /// </li>
  /// <li>
  /// CALABASH
  /// </li>
  /// <li>
  /// INSTRUMENTATION
  /// </li>
  /// <li>
  /// UIAUTOMATION
  /// </li>
  /// <li>
  /// UIAUTOMATOR
  /// </li>
  /// <li>
  /// XCTEST
  /// </li>
  /// <li>
  /// XCTEST_UI
  /// </li>
  /// </ul>
  final TestType? type;

  /// This value is set to true if video capture is enabled. Otherwise, it is set
  /// to false.
  final bool? videoCapture;

  /// The endpoint for streaming device video.
  final String? videoEndpoint;

  Job({
    this.arn,
    this.counters,
    this.created,
    this.device,
    this.deviceMinutes,
    this.instanceArn,
    this.message,
    this.name,
    this.result,
    this.started,
    this.status,
    this.stopped,
    this.type,
    this.videoCapture,
    this.videoEndpoint,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      arn: json['arn'] as String?,
      counters: json['counters'] != null
          ? Counters.fromJson(json['counters'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
      deviceMinutes: json['deviceMinutes'] != null
          ? DeviceMinutes.fromJson(
              json['deviceMinutes'] as Map<String, dynamic>)
          : null,
      instanceArn: json['instanceArn'] as String?,
      message: json['message'] as String?,
      name: json['name'] as String?,
      result: (json['result'] as String?)?.toExecutionResult(),
      started: timeStampFromJson(json['started']),
      status: (json['status'] as String?)?.toExecutionStatus(),
      stopped: timeStampFromJson(json['stopped']),
      type: (json['type'] as String?)?.toTestType(),
      videoCapture: json['videoCapture'] as bool?,
      videoEndpoint: json['videoEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final counters = this.counters;
    final created = this.created;
    final device = this.device;
    final deviceMinutes = this.deviceMinutes;
    final instanceArn = this.instanceArn;
    final message = this.message;
    final name = this.name;
    final result = this.result;
    final started = this.started;
    final status = this.status;
    final stopped = this.stopped;
    final type = this.type;
    final videoCapture = this.videoCapture;
    final videoEndpoint = this.videoEndpoint;
    return {
      if (arn != null) 'arn': arn,
      if (counters != null) 'counters': counters,
      if (created != null) 'created': unixTimestampToJson(created),
      if (device != null) 'device': device,
      if (deviceMinutes != null) 'deviceMinutes': deviceMinutes,
      if (instanceArn != null) 'instanceArn': instanceArn,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (result != null) 'result': result.toValue(),
      if (started != null) 'started': unixTimestampToJson(started),
      if (status != null) 'status': status.toValue(),
      if (stopped != null) 'stopped': unixTimestampToJson(stopped),
      if (type != null) 'type': type.toValue(),
      if (videoCapture != null) 'videoCapture': videoCapture,
      if (videoEndpoint != null) 'videoEndpoint': videoEndpoint,
    };
  }
}

/// Represents the result of a list artifacts operation.
class ListArtifactsResult {
  /// Information about the artifacts.
  final List<Artifact>? artifacts;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  ListArtifactsResult({
    this.artifacts,
    this.nextToken,
  });

  factory ListArtifactsResult.fromJson(Map<String, dynamic> json) {
    return ListArtifactsResult(
      artifacts: (json['artifacts'] as List?)
          ?.whereNotNull()
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final nextToken = this.nextToken;
    return {
      if (artifacts != null) 'artifacts': artifacts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeviceInstancesResult {
  /// An object that contains information about your device instances.
  final List<DeviceInstance>? deviceInstances;

  /// An identifier that can be used in the next call to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  ListDeviceInstancesResult({
    this.deviceInstances,
    this.nextToken,
  });

  factory ListDeviceInstancesResult.fromJson(Map<String, dynamic> json) {
    return ListDeviceInstancesResult(
      deviceInstances: (json['deviceInstances'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceInstances = this.deviceInstances;
    final nextToken = this.nextToken;
    return {
      if (deviceInstances != null) 'deviceInstances': deviceInstances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the result of a list device pools request.
class ListDevicePoolsResult {
  /// Information about the device pools.
  final List<DevicePool>? devicePools;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  ListDevicePoolsResult({
    this.devicePools,
    this.nextToken,
  });

  factory ListDevicePoolsResult.fromJson(Map<String, dynamic> json) {
    return ListDevicePoolsResult(
      devicePools: (json['devicePools'] as List?)
          ?.whereNotNull()
          .map((e) => DevicePool.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePools = this.devicePools;
    final nextToken = this.nextToken;
    return {
      if (devicePools != null) 'devicePools': devicePools,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the result of a list devices operation.
class ListDevicesResult {
  /// Information about the devices.
  final List<Device>? devices;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  ListDevicesResult({
    this.devices,
    this.nextToken,
  });

  factory ListDevicesResult.fromJson(Map<String, dynamic> json) {
    return ListDevicesResult(
      devices: (json['devices'] as List?)
          ?.whereNotNull()
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      if (devices != null) 'devices': devices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListInstanceProfilesResult {
  /// An object that contains information about your instance profiles.
  final List<InstanceProfile>? instanceProfiles;

  /// An identifier that can be used in the next call to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  ListInstanceProfilesResult({
    this.instanceProfiles,
    this.nextToken,
  });

  factory ListInstanceProfilesResult.fromJson(Map<String, dynamic> json) {
    return ListInstanceProfilesResult(
      instanceProfiles: (json['instanceProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfiles = this.instanceProfiles;
    final nextToken = this.nextToken;
    return {
      if (instanceProfiles != null) 'instanceProfiles': instanceProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the result of a list jobs request.
class ListJobsResult {
  /// Information about the jobs.
  final List<Job>? jobs;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  ListJobsResult({
    this.jobs,
    this.nextToken,
  });

  factory ListJobsResult.fromJson(Map<String, dynamic> json) {
    return ListJobsResult(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkProfilesResult {
  /// A list of the available network profiles.
  final List<NetworkProfile>? networkProfiles;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  ListNetworkProfilesResult({
    this.networkProfiles,
    this.nextToken,
  });

  factory ListNetworkProfilesResult.fromJson(Map<String, dynamic> json) {
    return ListNetworkProfilesResult(
      networkProfiles: (json['networkProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkProfiles = this.networkProfiles;
    final nextToken = this.nextToken;
    return {
      if (networkProfiles != null) 'networkProfiles': networkProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListOfferingPromotionsResult {
  /// An identifier to be used in the next call to this operation, to return the
  /// next set of items in the list.
  final String? nextToken;

  /// Information about the offering promotions.
  final List<OfferingPromotion>? offeringPromotions;

  ListOfferingPromotionsResult({
    this.nextToken,
    this.offeringPromotions,
  });

  factory ListOfferingPromotionsResult.fromJson(Map<String, dynamic> json) {
    return ListOfferingPromotionsResult(
      nextToken: json['nextToken'] as String?,
      offeringPromotions: (json['offeringPromotions'] as List?)
          ?.whereNotNull()
          .map((e) => OfferingPromotion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final offeringPromotions = this.offeringPromotions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (offeringPromotions != null) 'offeringPromotions': offeringPromotions,
    };
  }
}

/// Returns the transaction log of the specified offerings.
class ListOfferingTransactionsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// The audit log of subscriptions you have purchased and modified through AWS
  /// Device Farm.
  final List<OfferingTransaction>? offeringTransactions;

  ListOfferingTransactionsResult({
    this.nextToken,
    this.offeringTransactions,
  });

  factory ListOfferingTransactionsResult.fromJson(Map<String, dynamic> json) {
    return ListOfferingTransactionsResult(
      nextToken: json['nextToken'] as String?,
      offeringTransactions: (json['offeringTransactions'] as List?)
          ?.whereNotNull()
          .map((e) => OfferingTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final offeringTransactions = this.offeringTransactions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (offeringTransactions != null)
        'offeringTransactions': offeringTransactions,
    };
  }
}

/// Represents the return values of the list of offerings.
class ListOfferingsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// A value that represents the list offering results.
  final List<Offering>? offerings;

  ListOfferingsResult({
    this.nextToken,
    this.offerings,
  });

  factory ListOfferingsResult.fromJson(Map<String, dynamic> json) {
    return ListOfferingsResult(
      nextToken: json['nextToken'] as String?,
      offerings: (json['offerings'] as List?)
          ?.whereNotNull()
          .map((e) => Offering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final offerings = this.offerings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (offerings != null) 'offerings': offerings,
    };
  }
}

/// Represents the result of a list projects request.
class ListProjectsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the projects.
  final List<Project>? projects;

  ListProjectsResult({
    this.nextToken,
    this.projects,
  });

  factory ListProjectsResult.fromJson(Map<String, dynamic> json) {
    return ListProjectsResult(
      nextToken: json['nextToken'] as String?,
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (projects != null) 'projects': projects,
    };
  }
}

/// Represents the response from the server after AWS Device Farm makes a
/// request to return information about the remote access session.
class ListRemoteAccessSessionsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// A container that represents the metadata from the service about each remote
  /// access session you are requesting.
  final List<RemoteAccessSession>? remoteAccessSessions;

  ListRemoteAccessSessionsResult({
    this.nextToken,
    this.remoteAccessSessions,
  });

  factory ListRemoteAccessSessionsResult.fromJson(Map<String, dynamic> json) {
    return ListRemoteAccessSessionsResult(
      nextToken: json['nextToken'] as String?,
      remoteAccessSessions: (json['remoteAccessSessions'] as List?)
          ?.whereNotNull()
          .map((e) => RemoteAccessSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final remoteAccessSessions = this.remoteAccessSessions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (remoteAccessSessions != null)
        'remoteAccessSessions': remoteAccessSessions,
    };
  }
}

/// Represents the result of a list runs request.
class ListRunsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the runs.
  final List<Run>? runs;

  ListRunsResult({
    this.nextToken,
    this.runs,
  });

  factory ListRunsResult.fromJson(Map<String, dynamic> json) {
    return ListRunsResult(
      nextToken: json['nextToken'] as String?,
      runs: (json['runs'] as List?)
          ?.whereNotNull()
          .map((e) => Run.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final runs = this.runs;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (runs != null) 'runs': runs,
    };
  }
}

/// Represents the result of a list samples request.
class ListSamplesResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the samples.
  final List<Sample>? samples;

  ListSamplesResult({
    this.nextToken,
    this.samples,
  });

  factory ListSamplesResult.fromJson(Map<String, dynamic> json) {
    return ListSamplesResult(
      nextToken: json['nextToken'] as String?,
      samples: (json['samples'] as List?)
          ?.whereNotNull()
          .map((e) => Sample.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final samples = this.samples;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (samples != null) 'samples': samples,
    };
  }
}

/// Represents the result of a list suites request.
class ListSuitesResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the suites.
  final List<Suite>? suites;

  ListSuitesResult({
    this.nextToken,
    this.suites,
  });

  factory ListSuitesResult.fromJson(Map<String, dynamic> json) {
    return ListSuitesResult(
      nextToken: json['nextToken'] as String?,
      suites: (json['suites'] as List?)
          ?.whereNotNull()
          .map((e) => Suite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final suites = this.suites;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (suites != null) 'suites': suites,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters. Tag values can
  /// have a maximum length of 256 characters.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTestGridProjectsResult {
  /// Used for pagination. Pass into <a>ListTestGridProjects</a> to get more
  /// results in a paginated request.
  final String? nextToken;

  /// The list of TestGridProjects, based on a <a>ListTestGridProjectsRequest</a>.
  final List<TestGridProject>? testGridProjects;

  ListTestGridProjectsResult({
    this.nextToken,
    this.testGridProjects,
  });

  factory ListTestGridProjectsResult.fromJson(Map<String, dynamic> json) {
    return ListTestGridProjectsResult(
      nextToken: json['nextToken'] as String?,
      testGridProjects: (json['testGridProjects'] as List?)
          ?.whereNotNull()
          .map((e) => TestGridProject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testGridProjects = this.testGridProjects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testGridProjects != null) 'testGridProjects': testGridProjects,
    };
  }
}

class ListTestGridSessionActionsResult {
  /// The action taken by the session.
  final List<TestGridSessionAction>? actions;

  /// Pagination token.
  final String? nextToken;

  ListTestGridSessionActionsResult({
    this.actions,
    this.nextToken,
  });

  factory ListTestGridSessionActionsResult.fromJson(Map<String, dynamic> json) {
    return ListTestGridSessionActionsResult(
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => TestGridSessionAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final nextToken = this.nextToken;
    return {
      if (actions != null) 'actions': actions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestGridSessionArtifactsResult {
  /// A list of test grid session artifacts for a <a>TestGridSession</a>.
  final List<TestGridSessionArtifact>? artifacts;

  /// Pagination token.
  final String? nextToken;

  ListTestGridSessionArtifactsResult({
    this.artifacts,
    this.nextToken,
  });

  factory ListTestGridSessionArtifactsResult.fromJson(
      Map<String, dynamic> json) {
    return ListTestGridSessionArtifactsResult(
      artifacts: (json['artifacts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TestGridSessionArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final nextToken = this.nextToken;
    return {
      if (artifacts != null) 'artifacts': artifacts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestGridSessionsResult {
  /// Pagination token.
  final String? nextToken;

  /// The sessions that match the criteria in a
  /// <a>ListTestGridSessionsRequest</a>.
  final List<TestGridSession>? testGridSessions;

  ListTestGridSessionsResult({
    this.nextToken,
    this.testGridSessions,
  });

  factory ListTestGridSessionsResult.fromJson(Map<String, dynamic> json) {
    return ListTestGridSessionsResult(
      nextToken: json['nextToken'] as String?,
      testGridSessions: (json['testGridSessions'] as List?)
          ?.whereNotNull()
          .map((e) => TestGridSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testGridSessions = this.testGridSessions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testGridSessions != null) 'testGridSessions': testGridSessions,
    };
  }
}

/// Represents the result of a list tests request.
class ListTestsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the tests.
  final List<Test>? tests;

  ListTestsResult({
    this.nextToken,
    this.tests,
  });

  factory ListTestsResult.fromJson(Map<String, dynamic> json) {
    return ListTestsResult(
      nextToken: json['nextToken'] as String?,
      tests: (json['tests'] as List?)
          ?.whereNotNull()
          .map((e) => Test.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tests = this.tests;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tests != null) 'tests': tests,
    };
  }
}

/// Represents the result of a list unique problems request.
class ListUniqueProblemsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the unique problems.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final Map<ExecutionResult, List<UniqueProblem>>? uniqueProblems;

  ListUniqueProblemsResult({
    this.nextToken,
    this.uniqueProblems,
  });

  factory ListUniqueProblemsResult.fromJson(Map<String, dynamic> json) {
    return ListUniqueProblemsResult(
      nextToken: json['nextToken'] as String?,
      uniqueProblems: (json['uniqueProblems'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k.toExecutionResult(),
              (e as List)
                  .whereNotNull()
                  .map((e) => UniqueProblem.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final uniqueProblems = this.uniqueProblems;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (uniqueProblems != null)
        'uniqueProblems':
            uniqueProblems.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Represents the result of a list uploads request.
class ListUploadsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  final String? nextToken;

  /// Information about the uploads.
  final List<Upload>? uploads;

  ListUploadsResult({
    this.nextToken,
    this.uploads,
  });

  factory ListUploadsResult.fromJson(Map<String, dynamic> json) {
    return ListUploadsResult(
      nextToken: json['nextToken'] as String?,
      uploads: (json['uploads'] as List?)
          ?.whereNotNull()
          .map((e) => Upload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final uploads = this.uploads;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (uploads != null) 'uploads': uploads,
    };
  }
}

class ListVPCEConfigurationsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// An array of <code>VPCEConfiguration</code> objects that contain information
  /// about your VPC endpoint configuration.
  final List<VPCEConfiguration>? vpceConfigurations;

  ListVPCEConfigurationsResult({
    this.nextToken,
    this.vpceConfigurations,
  });

  factory ListVPCEConfigurationsResult.fromJson(Map<String, dynamic> json) {
    return ListVPCEConfigurationsResult(
      nextToken: json['nextToken'] as String?,
      vpceConfigurations: (json['vpceConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => VPCEConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vpceConfigurations = this.vpceConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (vpceConfigurations != null) 'vpceConfigurations': vpceConfigurations,
    };
  }
}

/// Represents a latitude and longitude pair, expressed in geographic coordinate
/// system degrees (for example, 47.6204, -122.3491).
///
/// Elevation is currently not supported.
class Location {
  /// The latitude.
  final double latitude;

  /// The longitude.
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final latitude = this.latitude;
    final longitude = this.longitude;
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

/// A number that represents the monetary amount for an offering or transaction.
class MonetaryAmount {
  /// The numerical amount of an offering or transaction.
  final double? amount;

  /// The currency code of a monetary amount. For example, <code>USD</code> means
  /// U.S. dollars.
  final CurrencyCode? currencyCode;

  MonetaryAmount({
    this.amount,
    this.currencyCode,
  });

  factory MonetaryAmount.fromJson(Map<String, dynamic> json) {
    return MonetaryAmount(
      amount: json['amount'] as double?,
      currencyCode: (json['currencyCode'] as String?)?.toCurrencyCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currencyCode = this.currencyCode;
    return {
      if (amount != null) 'amount': amount,
      if (currencyCode != null) 'currencyCode': currencyCode.toValue(),
    };
  }
}

/// An array of settings that describes characteristics of a network profile.
class NetworkProfile {
  /// The Amazon Resource Name (ARN) of the network profile.
  final String? arn;

  /// The description of the network profile.
  final String? description;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  final int? downlinkBandwidthBits;

  /// Delay time for all packets to destination in milliseconds as an integer from
  /// 0 to 2000.
  final int? downlinkDelayMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  final int? downlinkJitterMs;

  /// Proportion of received packets that fail to arrive from 0 to 100 percent.
  final int? downlinkLossPercent;

  /// The name of the network profile.
  final String? name;

  /// The type of network profile. Valid values are listed here.
  final NetworkProfileType? type;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  final int? uplinkBandwidthBits;

  /// Delay time for all packets to destination in milliseconds as an integer from
  /// 0 to 2000.
  final int? uplinkDelayMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  final int? uplinkJitterMs;

  /// Proportion of transmitted packets that fail to arrive from 0 to 100 percent.
  final int? uplinkLossPercent;

  NetworkProfile({
    this.arn,
    this.description,
    this.downlinkBandwidthBits,
    this.downlinkDelayMs,
    this.downlinkJitterMs,
    this.downlinkLossPercent,
    this.name,
    this.type,
    this.uplinkBandwidthBits,
    this.uplinkDelayMs,
    this.uplinkJitterMs,
    this.uplinkLossPercent,
  });

  factory NetworkProfile.fromJson(Map<String, dynamic> json) {
    return NetworkProfile(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      downlinkBandwidthBits: json['downlinkBandwidthBits'] as int?,
      downlinkDelayMs: json['downlinkDelayMs'] as int?,
      downlinkJitterMs: json['downlinkJitterMs'] as int?,
      downlinkLossPercent: json['downlinkLossPercent'] as int?,
      name: json['name'] as String?,
      type: (json['type'] as String?)?.toNetworkProfileType(),
      uplinkBandwidthBits: json['uplinkBandwidthBits'] as int?,
      uplinkDelayMs: json['uplinkDelayMs'] as int?,
      uplinkJitterMs: json['uplinkJitterMs'] as int?,
      uplinkLossPercent: json['uplinkLossPercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final downlinkBandwidthBits = this.downlinkBandwidthBits;
    final downlinkDelayMs = this.downlinkDelayMs;
    final downlinkJitterMs = this.downlinkJitterMs;
    final downlinkLossPercent = this.downlinkLossPercent;
    final name = this.name;
    final type = this.type;
    final uplinkBandwidthBits = this.uplinkBandwidthBits;
    final uplinkDelayMs = this.uplinkDelayMs;
    final uplinkJitterMs = this.uplinkJitterMs;
    final uplinkLossPercent = this.uplinkLossPercent;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (downlinkBandwidthBits != null)
        'downlinkBandwidthBits': downlinkBandwidthBits,
      if (downlinkDelayMs != null) 'downlinkDelayMs': downlinkDelayMs,
      if (downlinkJitterMs != null) 'downlinkJitterMs': downlinkJitterMs,
      if (downlinkLossPercent != null)
        'downlinkLossPercent': downlinkLossPercent,
      if (name != null) 'name': name,
      if (type != null) 'type': type.toValue(),
      if (uplinkBandwidthBits != null)
        'uplinkBandwidthBits': uplinkBandwidthBits,
      if (uplinkDelayMs != null) 'uplinkDelayMs': uplinkDelayMs,
      if (uplinkJitterMs != null) 'uplinkJitterMs': uplinkJitterMs,
      if (uplinkLossPercent != null) 'uplinkLossPercent': uplinkLossPercent,
    };
  }
}

enum NetworkProfileType {
  curated,
  private,
}

extension NetworkProfileTypeValueExtension on NetworkProfileType {
  String toValue() {
    switch (this) {
      case NetworkProfileType.curated:
        return 'CURATED';
      case NetworkProfileType.private:
        return 'PRIVATE';
    }
  }
}

extension NetworkProfileTypeFromString on String {
  NetworkProfileType toNetworkProfileType() {
    switch (this) {
      case 'CURATED':
        return NetworkProfileType.curated;
      case 'PRIVATE':
        return NetworkProfileType.private;
    }
    throw Exception('$this is not known in enum NetworkProfileType');
  }
}

/// Represents the metadata of a device offering.
class Offering {
  /// A string that describes the offering.
  final String? description;

  /// The ID that corresponds to a device offering.
  final String? id;

  /// The platform of the device (for example, <code>ANDROID</code> or
  /// <code>IOS</code>).
  final DevicePlatform? platform;

  /// Specifies whether there are recurring charges for the offering.
  final List<RecurringCharge>? recurringCharges;

  /// The type of offering (for example, <code>RECURRING</code>) for a device.
  final OfferingType? type;

  Offering({
    this.description,
    this.id,
    this.platform,
    this.recurringCharges,
    this.type,
  });

  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      description: json['description'] as String?,
      id: json['id'] as String?,
      platform: (json['platform'] as String?)?.toDevicePlatform(),
      recurringCharges: (json['recurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.toOfferingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final platform = this.platform;
    final recurringCharges = this.recurringCharges;
    final type = this.type;
    return {
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (platform != null) 'platform': platform.toValue(),
      if (recurringCharges != null) 'recurringCharges': recurringCharges,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Represents information about an offering promotion.
class OfferingPromotion {
  /// A string that describes the offering promotion.
  final String? description;

  /// The ID of the offering promotion.
  final String? id;

  OfferingPromotion({
    this.description,
    this.id,
  });

  factory OfferingPromotion.fromJson(Map<String, dynamic> json) {
    return OfferingPromotion(
      description: json['description'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    return {
      if (description != null) 'description': description,
      if (id != null) 'id': id,
    };
  }
}

/// The status of the offering.
class OfferingStatus {
  /// The date on which the offering is effective.
  final DateTime? effectiveOn;

  /// Represents the metadata of an offering status.
  final Offering? offering;

  /// The number of available devices in the offering.
  final int? quantity;

  /// The type specified for the offering status.
  final OfferingTransactionType? type;

  OfferingStatus({
    this.effectiveOn,
    this.offering,
    this.quantity,
    this.type,
  });

  factory OfferingStatus.fromJson(Map<String, dynamic> json) {
    return OfferingStatus(
      effectiveOn: timeStampFromJson(json['effectiveOn']),
      offering: json['offering'] != null
          ? Offering.fromJson(json['offering'] as Map<String, dynamic>)
          : null,
      quantity: json['quantity'] as int?,
      type: (json['type'] as String?)?.toOfferingTransactionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveOn = this.effectiveOn;
    final offering = this.offering;
    final quantity = this.quantity;
    final type = this.type;
    return {
      if (effectiveOn != null) 'effectiveOn': unixTimestampToJson(effectiveOn),
      if (offering != null) 'offering': offering,
      if (quantity != null) 'quantity': quantity,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Represents the metadata of an offering transaction.
class OfferingTransaction {
  /// The cost of an offering transaction.
  final MonetaryAmount? cost;

  /// The date on which an offering transaction was created.
  final DateTime? createdOn;

  /// The ID that corresponds to a device offering promotion.
  final String? offeringPromotionId;

  /// The status of an offering transaction.
  final OfferingStatus? offeringStatus;

  /// The transaction ID of the offering transaction.
  final String? transactionId;

  OfferingTransaction({
    this.cost,
    this.createdOn,
    this.offeringPromotionId,
    this.offeringStatus,
    this.transactionId,
  });

  factory OfferingTransaction.fromJson(Map<String, dynamic> json) {
    return OfferingTransaction(
      cost: json['cost'] != null
          ? MonetaryAmount.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      createdOn: timeStampFromJson(json['createdOn']),
      offeringPromotionId: json['offeringPromotionId'] as String?,
      offeringStatus: json['offeringStatus'] != null
          ? OfferingStatus.fromJson(
              json['offeringStatus'] as Map<String, dynamic>)
          : null,
      transactionId: json['transactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cost = this.cost;
    final createdOn = this.createdOn;
    final offeringPromotionId = this.offeringPromotionId;
    final offeringStatus = this.offeringStatus;
    final transactionId = this.transactionId;
    return {
      if (cost != null) 'cost': cost,
      if (createdOn != null) 'createdOn': unixTimestampToJson(createdOn),
      if (offeringPromotionId != null)
        'offeringPromotionId': offeringPromotionId,
      if (offeringStatus != null) 'offeringStatus': offeringStatus,
      if (transactionId != null) 'transactionId': transactionId,
    };
  }
}

enum OfferingTransactionType {
  purchase,
  renew,
  system,
}

extension OfferingTransactionTypeValueExtension on OfferingTransactionType {
  String toValue() {
    switch (this) {
      case OfferingTransactionType.purchase:
        return 'PURCHASE';
      case OfferingTransactionType.renew:
        return 'RENEW';
      case OfferingTransactionType.system:
        return 'SYSTEM';
    }
  }
}

extension OfferingTransactionTypeFromString on String {
  OfferingTransactionType toOfferingTransactionType() {
    switch (this) {
      case 'PURCHASE':
        return OfferingTransactionType.purchase;
      case 'RENEW':
        return OfferingTransactionType.renew;
      case 'SYSTEM':
        return OfferingTransactionType.system;
    }
    throw Exception('$this is not known in enum OfferingTransactionType');
  }
}

enum OfferingType {
  recurring,
}

extension OfferingTypeValueExtension on OfferingType {
  String toValue() {
    switch (this) {
      case OfferingType.recurring:
        return 'RECURRING';
    }
  }
}

extension OfferingTypeFromString on String {
  OfferingType toOfferingType() {
    switch (this) {
      case 'RECURRING':
        return OfferingType.recurring;
    }
    throw Exception('$this is not known in enum OfferingType');
  }
}

/// Represents a specific warning or failure.
class Problem {
  /// Information about the associated device.
  final Device? device;

  /// Information about the associated job.
  final ProblemDetail? job;

  /// A message about the problem's result.
  final String? message;

  /// The problem's result.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// Information about the associated run.
  final ProblemDetail? run;

  /// Information about the associated suite.
  final ProblemDetail? suite;

  /// Information about the associated test.
  final ProblemDetail? test;

  Problem({
    this.device,
    this.job,
    this.message,
    this.result,
    this.run,
    this.suite,
    this.test,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
      job: json['job'] != null
          ? ProblemDetail.fromJson(json['job'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      result: (json['result'] as String?)?.toExecutionResult(),
      run: json['run'] != null
          ? ProblemDetail.fromJson(json['run'] as Map<String, dynamic>)
          : null,
      suite: json['suite'] != null
          ? ProblemDetail.fromJson(json['suite'] as Map<String, dynamic>)
          : null,
      test: json['test'] != null
          ? ProblemDetail.fromJson(json['test'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    final job = this.job;
    final message = this.message;
    final result = this.result;
    final run = this.run;
    final suite = this.suite;
    final test = this.test;
    return {
      if (device != null) 'device': device,
      if (job != null) 'job': job,
      if (message != null) 'message': message,
      if (result != null) 'result': result.toValue(),
      if (run != null) 'run': run,
      if (suite != null) 'suite': suite,
      if (test != null) 'test': test,
    };
  }
}

/// Information about a problem detail.
class ProblemDetail {
  /// The problem detail's ARN.
  final String? arn;

  /// The problem detail's name.
  final String? name;

  ProblemDetail({
    this.arn,
    this.name,
  });

  factory ProblemDetail.fromJson(Map<String, dynamic> json) {
    return ProblemDetail(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

/// Represents an operating-system neutral workspace for running and managing
/// tests.
class Project {
  /// The project's ARN.
  final String? arn;

  /// When the project was created.
  final DateTime? created;

  /// The default number of minutes (at the project level) a test run executes
  /// before it times out. The default value is 150 minutes.
  final int? defaultJobTimeoutMinutes;

  /// The project's name.
  final String? name;

  /// The VPC security groups and subnets that are attached to a project.
  final VpcConfig? vpcConfig;

  Project({
    this.arn,
    this.created,
    this.defaultJobTimeoutMinutes,
    this.name,
    this.vpcConfig,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      arn: json['arn'] as String?,
      created: timeStampFromJson(json['created']),
      defaultJobTimeoutMinutes: json['defaultJobTimeoutMinutes'] as int?,
      name: json['name'] as String?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final defaultJobTimeoutMinutes = this.defaultJobTimeoutMinutes;
    final name = this.name;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (created != null) 'created': unixTimestampToJson(created),
      if (defaultJobTimeoutMinutes != null)
        'defaultJobTimeoutMinutes': defaultJobTimeoutMinutes,
      if (name != null) 'name': name,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// The result of the purchase offering (for example, success or failure).
class PurchaseOfferingResult {
  /// Represents the offering transaction for the purchase result.
  final OfferingTransaction? offeringTransaction;

  PurchaseOfferingResult({
    this.offeringTransaction,
  });

  factory PurchaseOfferingResult.fromJson(Map<String, dynamic> json) {
    return PurchaseOfferingResult(
      offeringTransaction: json['offeringTransaction'] != null
          ? OfferingTransaction.fromJson(
              json['offeringTransaction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offeringTransaction = this.offeringTransaction;
    return {
      if (offeringTransaction != null)
        'offeringTransaction': offeringTransaction,
    };
  }
}

/// Represents the set of radios and their states on a device. Examples of
/// radios include Wi-Fi, GPS, Bluetooth, and NFC.
class Radios {
  /// True if Bluetooth is enabled at the beginning of the test. Otherwise, false.
  final bool? bluetooth;

  /// True if GPS is enabled at the beginning of the test. Otherwise, false.
  final bool? gps;

  /// True if NFC is enabled at the beginning of the test. Otherwise, false.
  final bool? nfc;

  /// True if Wi-Fi is enabled at the beginning of the test. Otherwise, false.
  final bool? wifi;

  Radios({
    this.bluetooth,
    this.gps,
    this.nfc,
    this.wifi,
  });

  factory Radios.fromJson(Map<String, dynamic> json) {
    return Radios(
      bluetooth: json['bluetooth'] as bool?,
      gps: json['gps'] as bool?,
      nfc: json['nfc'] as bool?,
      wifi: json['wifi'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final bluetooth = this.bluetooth;
    final gps = this.gps;
    final nfc = this.nfc;
    final wifi = this.wifi;
    return {
      if (bluetooth != null) 'bluetooth': bluetooth,
      if (gps != null) 'gps': gps,
      if (nfc != null) 'nfc': nfc,
      if (wifi != null) 'wifi': wifi,
    };
  }
}

/// Specifies whether charges for devices are recurring.
class RecurringCharge {
  /// The cost of the recurring charge.
  final MonetaryAmount? cost;

  /// The frequency in which charges recur.
  final RecurringChargeFrequency? frequency;

  RecurringCharge({
    this.cost,
    this.frequency,
  });

  factory RecurringCharge.fromJson(Map<String, dynamic> json) {
    return RecurringCharge(
      cost: json['cost'] != null
          ? MonetaryAmount.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      frequency: (json['frequency'] as String?)?.toRecurringChargeFrequency(),
    );
  }

  Map<String, dynamic> toJson() {
    final cost = this.cost;
    final frequency = this.frequency;
    return {
      if (cost != null) 'cost': cost,
      if (frequency != null) 'frequency': frequency.toValue(),
    };
  }
}

enum RecurringChargeFrequency {
  monthly,
}

extension RecurringChargeFrequencyValueExtension on RecurringChargeFrequency {
  String toValue() {
    switch (this) {
      case RecurringChargeFrequency.monthly:
        return 'MONTHLY';
    }
  }
}

extension RecurringChargeFrequencyFromString on String {
  RecurringChargeFrequency toRecurringChargeFrequency() {
    switch (this) {
      case 'MONTHLY':
        return RecurringChargeFrequency.monthly;
    }
    throw Exception('$this is not known in enum RecurringChargeFrequency');
  }
}

/// Represents information about the remote access session.
class RemoteAccessSession {
  /// The Amazon Resource Name (ARN) of the remote access session.
  final String? arn;

  /// The billing method of the remote access session. Possible values include
  /// <code>METERED</code> or <code>UNMETERED</code>. For more information about
  /// metered devices, see <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html#welcome-terminology">AWS
  /// Device Farm terminology</a>.
  final BillingMethod? billingMethod;

  /// Unique identifier of your client for the remote access session. Only
  /// returned if remote debugging is enabled for the remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  final String? clientId;

  /// The date and time the remote access session was created.
  final DateTime? created;

  /// The device (phone or tablet) used in the remote access session.
  final Device? device;

  /// The number of minutes a device is used in a remote access session (including
  /// setup and teardown minutes).
  final DeviceMinutes? deviceMinutes;

  /// Unique device identifier for the remote device. Only returned if remote
  /// debugging is enabled for the remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  final String? deviceUdid;

  /// The endpoint for the remote access sesssion.
  final String? endpoint;

  /// IP address of the EC2 host where you need to connect to remotely debug
  /// devices. Only returned if remote debugging is enabled for the remote access
  /// session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  final String? hostAddress;

  /// The ARN of the instance.
  final String? instanceArn;

  /// The interaction mode of the remote access session. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// INTERACTIVE: You can interact with the iOS device by viewing, touching, and
  /// rotating the screen. You cannot run XCUITest framework-based tests in this
  /// mode.
  /// </li>
  /// <li>
  /// NO_VIDEO: You are connected to the device, but cannot interact with it or
  /// view the screen. This mode has the fastest test execution speed. You can run
  /// XCUITest framework-based tests in this mode.
  /// </li>
  /// <li>
  /// VIDEO_ONLY: You can view the screen, but cannot touch or rotate it. You can
  /// run XCUITest framework-based tests and watch the screen in this mode.
  /// </li>
  /// </ul>
  final InteractionMode? interactionMode;

  /// A message about the remote access session.
  final String? message;

  /// The name of the remote access session.
  final String? name;

  /// This flag is set to <code>true</code> if remote debugging is enabled for the
  /// remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  final bool? remoteDebugEnabled;

  /// The ARN for the app to be recorded in the remote access session.
  final String? remoteRecordAppArn;

  /// This flag is set to <code>true</code> if remote recording is enabled for the
  /// remote access session.
  final bool? remoteRecordEnabled;

  /// The result of the remote access session. Can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// PENDING.
  /// </li>
  /// <li>
  /// PASSED.
  /// </li>
  /// <li>
  /// WARNED.
  /// </li>
  /// <li>
  /// FAILED.
  /// </li>
  /// <li>
  /// SKIPPED.
  /// </li>
  /// <li>
  /// ERRORED.
  /// </li>
  /// <li>
  /// STOPPED.
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="http://aws.amazon.com/device-farm/faqs/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  final bool? skipAppResign;

  /// The date and time the remote access session was started.
  final DateTime? started;

  /// The status of the remote access session. Can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// PENDING.
  /// </li>
  /// <li>
  /// PENDING_CONCURRENCY.
  /// </li>
  /// <li>
  /// PENDING_DEVICE.
  /// </li>
  /// <li>
  /// PROCESSING.
  /// </li>
  /// <li>
  /// SCHEDULING.
  /// </li>
  /// <li>
  /// PREPARING.
  /// </li>
  /// <li>
  /// RUNNING.
  /// </li>
  /// <li>
  /// COMPLETED.
  /// </li>
  /// <li>
  /// STOPPING.
  /// </li>
  /// </ul>
  final ExecutionStatus? status;

  /// The date and time the remote access session was stopped.
  final DateTime? stopped;

  /// The VPC security groups and subnets that are attached to a project.
  final VpcConfig? vpcConfig;

  RemoteAccessSession({
    this.arn,
    this.billingMethod,
    this.clientId,
    this.created,
    this.device,
    this.deviceMinutes,
    this.deviceUdid,
    this.endpoint,
    this.hostAddress,
    this.instanceArn,
    this.interactionMode,
    this.message,
    this.name,
    this.remoteDebugEnabled,
    this.remoteRecordAppArn,
    this.remoteRecordEnabled,
    this.result,
    this.skipAppResign,
    this.started,
    this.status,
    this.stopped,
    this.vpcConfig,
  });

  factory RemoteAccessSession.fromJson(Map<String, dynamic> json) {
    return RemoteAccessSession(
      arn: json['arn'] as String?,
      billingMethod: (json['billingMethod'] as String?)?.toBillingMethod(),
      clientId: json['clientId'] as String?,
      created: timeStampFromJson(json['created']),
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
      deviceMinutes: json['deviceMinutes'] != null
          ? DeviceMinutes.fromJson(
              json['deviceMinutes'] as Map<String, dynamic>)
          : null,
      deviceUdid: json['deviceUdid'] as String?,
      endpoint: json['endpoint'] as String?,
      hostAddress: json['hostAddress'] as String?,
      instanceArn: json['instanceArn'] as String?,
      interactionMode:
          (json['interactionMode'] as String?)?.toInteractionMode(),
      message: json['message'] as String?,
      name: json['name'] as String?,
      remoteDebugEnabled: json['remoteDebugEnabled'] as bool?,
      remoteRecordAppArn: json['remoteRecordAppArn'] as String?,
      remoteRecordEnabled: json['remoteRecordEnabled'] as bool?,
      result: (json['result'] as String?)?.toExecutionResult(),
      skipAppResign: json['skipAppResign'] as bool?,
      started: timeStampFromJson(json['started']),
      status: (json['status'] as String?)?.toExecutionStatus(),
      stopped: timeStampFromJson(json['stopped']),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingMethod = this.billingMethod;
    final clientId = this.clientId;
    final created = this.created;
    final device = this.device;
    final deviceMinutes = this.deviceMinutes;
    final deviceUdid = this.deviceUdid;
    final endpoint = this.endpoint;
    final hostAddress = this.hostAddress;
    final instanceArn = this.instanceArn;
    final interactionMode = this.interactionMode;
    final message = this.message;
    final name = this.name;
    final remoteDebugEnabled = this.remoteDebugEnabled;
    final remoteRecordAppArn = this.remoteRecordAppArn;
    final remoteRecordEnabled = this.remoteRecordEnabled;
    final result = this.result;
    final skipAppResign = this.skipAppResign;
    final started = this.started;
    final status = this.status;
    final stopped = this.stopped;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (billingMethod != null) 'billingMethod': billingMethod.toValue(),
      if (clientId != null) 'clientId': clientId,
      if (created != null) 'created': unixTimestampToJson(created),
      if (device != null) 'device': device,
      if (deviceMinutes != null) 'deviceMinutes': deviceMinutes,
      if (deviceUdid != null) 'deviceUdid': deviceUdid,
      if (endpoint != null) 'endpoint': endpoint,
      if (hostAddress != null) 'hostAddress': hostAddress,
      if (instanceArn != null) 'instanceArn': instanceArn,
      if (interactionMode != null) 'interactionMode': interactionMode.toValue(),
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (remoteDebugEnabled != null) 'remoteDebugEnabled': remoteDebugEnabled,
      if (remoteRecordAppArn != null) 'remoteRecordAppArn': remoteRecordAppArn,
      if (remoteRecordEnabled != null)
        'remoteRecordEnabled': remoteRecordEnabled,
      if (result != null) 'result': result.toValue(),
      if (skipAppResign != null) 'skipAppResign': skipAppResign,
      if (started != null) 'started': unixTimestampToJson(started),
      if (status != null) 'status': status.toValue(),
      if (stopped != null) 'stopped': unixTimestampToJson(stopped),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// The result of a renewal offering.
class RenewOfferingResult {
  /// Represents the status of the offering transaction for the renewal.
  final OfferingTransaction? offeringTransaction;

  RenewOfferingResult({
    this.offeringTransaction,
  });

  factory RenewOfferingResult.fromJson(Map<String, dynamic> json) {
    return RenewOfferingResult(
      offeringTransaction: json['offeringTransaction'] != null
          ? OfferingTransaction.fromJson(
              json['offeringTransaction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offeringTransaction = this.offeringTransaction;
    return {
      if (offeringTransaction != null)
        'offeringTransaction': offeringTransaction,
    };
  }
}

/// Represents the screen resolution of a device in height and width, expressed
/// in pixels.
class Resolution {
  /// The screen resolution's height, expressed in pixels.
  final int? height;

  /// The screen resolution's width, expressed in pixels.
  final int? width;

  Resolution({
    this.height,
    this.width,
  });

  factory Resolution.fromJson(Map<String, dynamic> json) {
    return Resolution(
      height: json['height'] as int?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final width = this.width;
    return {
      if (height != null) 'height': height,
      if (width != null) 'width': width,
    };
  }
}

/// Represents a condition for a device pool.
class Rule {
  /// The rule's stringified attribute. For example, specify the value as
  /// <code>"\"abc\""</code>.
  ///
  /// The supported operators for each attribute are provided in the following
  /// list.
  /// <dl> <dt>APPIUM_VERSION</dt> <dd>
  /// The Appium version for the test.
  ///
  /// Supported operators: <code>CONTAINS</code>
  /// </dd> <dt>ARN</dt> <dd>
  /// The Amazon Resource Name (ARN) of the device (for example,
  /// <code>arn:aws:devicefarm:us-west-2::device:12345Example</code>.
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>AVAILABILITY</dt> <dd>
  /// The current availability of the device. Valid values are AVAILABLE,
  /// HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>FLEET_TYPE</dt> <dd>
  /// The fleet type. Valid values are PUBLIC or PRIVATE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>FORM_FACTOR</dt> <dd>
  /// The device form factor. Valid values are PHONE or TABLET.
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>INSTANCE_ARN</dt> <dd>
  /// The Amazon Resource Name (ARN) of the device instance.
  ///
  /// Supported operators: <code>IN</code>, <code>NOT_IN</code>
  /// </dd> <dt>INSTANCE_LABELS</dt> <dd>
  /// The label of the device instance.
  ///
  /// Supported operators: <code>CONTAINS</code>
  /// </dd> <dt>MANUFACTURER</dt> <dd>
  /// The device manufacturer (for example, Apple).
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>MODEL</dt> <dd>
  /// The device model, such as Apple iPad Air 2 or Google Pixel.
  ///
  /// Supported operators: <code>CONTAINS</code>, <code>EQUALS</code>,
  /// <code>IN</code>, <code>NOT_IN</code>
  /// </dd> <dt>OS_VERSION</dt> <dd>
  /// The operating system version (for example, 10.3.2).
  ///
  /// Supported operators: <code>EQUALS</code>, <code>GREATER_THAN</code>,
  /// <code>GREATER_THAN_OR_EQUALS</code>, <code>IN</code>,
  /// <code>LESS_THAN</code>, <code>LESS_THAN_OR_EQUALS</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>PLATFORM</dt> <dd>
  /// The device platform. Valid values are ANDROID or IOS.
  ///
  /// Supported operators: <code>EQUALS</code>, <code>IN</code>,
  /// <code>NOT_IN</code>
  /// </dd> <dt>REMOTE_ACCESS_ENABLED</dt> <dd>
  /// Whether the device is enabled for remote access. Valid values are TRUE or
  /// FALSE.
  ///
  /// Supported operators: <code>EQUALS</code>
  /// </dd> <dt>REMOTE_DEBUG_ENABLED</dt> <dd>
  /// Whether the device is enabled for remote debugging. Valid values are TRUE or
  /// FALSE.
  ///
  /// Supported operators: <code>EQUALS</code>
  ///
  /// Because remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>, this filter is ignored.
  /// </dd> </dl>
  final DeviceAttribute? attribute;

  /// Specifies how Device Farm compares the rule's attribute to the value. For
  /// the operators that are supported by each attribute, see the attribute
  /// descriptions.
  final RuleOperator? operator;

  /// The rule's value.
  final String? value;

  Rule({
    this.attribute,
    this.operator,
    this.value,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      attribute: (json['attribute'] as String?)?.toDeviceAttribute(),
      operator: (json['operator'] as String?)?.toRuleOperator(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final operator = this.operator;
    final value = this.value;
    return {
      if (attribute != null) 'attribute': attribute.toValue(),
      if (operator != null) 'operator': operator.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum RuleOperator {
  equals,
  lessThan,
  lessThanOrEquals,
  greaterThan,
  greaterThanOrEquals,
  $in,
  notIn,
  contains,
}

extension RuleOperatorValueExtension on RuleOperator {
  String toValue() {
    switch (this) {
      case RuleOperator.equals:
        return 'EQUALS';
      case RuleOperator.lessThan:
        return 'LESS_THAN';
      case RuleOperator.lessThanOrEquals:
        return 'LESS_THAN_OR_EQUALS';
      case RuleOperator.greaterThan:
        return 'GREATER_THAN';
      case RuleOperator.greaterThanOrEquals:
        return 'GREATER_THAN_OR_EQUALS';
      case RuleOperator.$in:
        return 'IN';
      case RuleOperator.notIn:
        return 'NOT_IN';
      case RuleOperator.contains:
        return 'CONTAINS';
    }
  }
}

extension RuleOperatorFromString on String {
  RuleOperator toRuleOperator() {
    switch (this) {
      case 'EQUALS':
        return RuleOperator.equals;
      case 'LESS_THAN':
        return RuleOperator.lessThan;
      case 'LESS_THAN_OR_EQUALS':
        return RuleOperator.lessThanOrEquals;
      case 'GREATER_THAN':
        return RuleOperator.greaterThan;
      case 'GREATER_THAN_OR_EQUALS':
        return RuleOperator.greaterThanOrEquals;
      case 'IN':
        return RuleOperator.$in;
      case 'NOT_IN':
        return RuleOperator.notIn;
      case 'CONTAINS':
        return RuleOperator.contains;
    }
    throw Exception('$this is not known in enum RuleOperator');
  }
}

/// Represents a test run on a set of devices with a given app package, test
/// parameters, and so on.
class Run {
  /// An app to upload or that has been uploaded.
  final String? appUpload;

  /// The run's ARN.
  final String? arn;

  /// Specifies the billing method for a test run: <code>metered</code> or
  /// <code>unmetered</code>. If the parameter is not specified, the default value
  /// is <code>metered</code>.
  /// <note>
  /// If you have unmetered device slots, you must set this to
  /// <code>unmetered</code> to use them. Otherwise, the run is counted toward
  /// metered device minutes.
  /// </note>
  final BillingMethod? billingMethod;

  /// The total number of completed jobs.
  final int? completedJobs;

  /// The run's result counters.
  final Counters? counters;

  /// When the run was created.
  final DateTime? created;

  /// Output <code>CustomerArtifactPaths</code> object for the test run.
  final CustomerArtifactPaths? customerArtifactPaths;

  /// Represents the total (metered or unmetered) minutes used by the test run.
  final DeviceMinutes? deviceMinutes;

  /// The ARN of the device pool for the run.
  final String? devicePoolArn;

  /// The results of a device filter used to select the devices for a test run.
  final DeviceSelectionResult? deviceSelectionResult;

  /// For fuzz tests, this is the number of events, between 1 and 10000, that the
  /// UI fuzz test should perform.
  final int? eventCount;

  /// The number of minutes the job executes before it times out.
  final int? jobTimeoutMinutes;

  /// Information about the locale that is used for the run.
  final String? locale;

  /// Information about the location that is used for the run.
  final Location? location;

  /// A message about the run's result.
  final String? message;

  /// The run's name.
  final String? name;

  /// The network profile being used for a test run.
  final NetworkProfile? networkProfile;

  /// Read-only URL for an object in an S3 bucket where you can get the parsing
  /// results of the test package. If the test package doesn't parse, the reason
  /// why it doesn't parse appears in the file that this URL points to.
  final String? parsingResultUrl;

  /// The run's platform.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// ANDROID
  /// </li>
  /// <li>
  /// IOS
  /// </li>
  /// </ul>
  final DevicePlatform? platform;

  /// Information about the radio states for the run.
  final Radios? radios;

  /// The run's result.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// Supporting field for the result field. Set only if <code>result</code> is
  /// <code>SKIPPED</code>. <code>PARSING_FAILED</code> if the result is skipped
  /// because of test package parsing failure.
  final ExecutionResultCode? resultCode;

  /// For fuzz tests, this is a seed to use for randomizing the UI fuzz test.
  /// Using the same seed value between tests ensures identical event sequences.
  final int? seed;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="http://aws.amazon.com/device-farm/faqs/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  final bool? skipAppResign;

  /// The run's start time.
  final DateTime? started;

  /// The run's status.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PENDING_CONCURRENCY
  /// </li>
  /// <li>
  /// PENDING_DEVICE
  /// </li>
  /// <li>
  /// PROCESSING
  /// </li>
  /// <li>
  /// SCHEDULING
  /// </li>
  /// <li>
  /// PREPARING
  /// </li>
  /// <li>
  /// RUNNING
  /// </li>
  /// <li>
  /// COMPLETED
  /// </li>
  /// <li>
  /// STOPPING
  /// </li>
  /// </ul>
  final ExecutionStatus? status;

  /// The run's stop time.
  final DateTime? stopped;

  /// The ARN of the YAML-formatted test specification for the run.
  final String? testSpecArn;

  /// The total number of jobs for the run.
  final int? totalJobs;

  /// The run's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER
  /// <note>
  /// For Android, an app explorer that traverses an Android app, interacting with
  /// it and capturing screenshots at the same time.
  /// </note> </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_NODE
  /// </li>
  /// <li>
  /// APPIUM_RUBY
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY
  /// </li>
  /// <li>
  /// CALABASH
  /// </li>
  /// <li>
  /// INSTRUMENTATION
  /// </li>
  /// <li>
  /// UIAUTOMATION
  /// </li>
  /// <li>
  /// UIAUTOMATOR
  /// </li>
  /// <li>
  /// XCTEST
  /// </li>
  /// <li>
  /// XCTEST_UI
  /// </li>
  /// </ul>
  final TestType? type;

  /// The VPC security groups and subnets that are attached to a project.
  final VpcConfig? vpcConfig;

  /// The Device Farm console URL for the recording of the run.
  final String? webUrl;

  Run({
    this.appUpload,
    this.arn,
    this.billingMethod,
    this.completedJobs,
    this.counters,
    this.created,
    this.customerArtifactPaths,
    this.deviceMinutes,
    this.devicePoolArn,
    this.deviceSelectionResult,
    this.eventCount,
    this.jobTimeoutMinutes,
    this.locale,
    this.location,
    this.message,
    this.name,
    this.networkProfile,
    this.parsingResultUrl,
    this.platform,
    this.radios,
    this.result,
    this.resultCode,
    this.seed,
    this.skipAppResign,
    this.started,
    this.status,
    this.stopped,
    this.testSpecArn,
    this.totalJobs,
    this.type,
    this.vpcConfig,
    this.webUrl,
  });

  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      appUpload: json['appUpload'] as String?,
      arn: json['arn'] as String?,
      billingMethod: (json['billingMethod'] as String?)?.toBillingMethod(),
      completedJobs: json['completedJobs'] as int?,
      counters: json['counters'] != null
          ? Counters.fromJson(json['counters'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      customerArtifactPaths: json['customerArtifactPaths'] != null
          ? CustomerArtifactPaths.fromJson(
              json['customerArtifactPaths'] as Map<String, dynamic>)
          : null,
      deviceMinutes: json['deviceMinutes'] != null
          ? DeviceMinutes.fromJson(
              json['deviceMinutes'] as Map<String, dynamic>)
          : null,
      devicePoolArn: json['devicePoolArn'] as String?,
      deviceSelectionResult: json['deviceSelectionResult'] != null
          ? DeviceSelectionResult.fromJson(
              json['deviceSelectionResult'] as Map<String, dynamic>)
          : null,
      eventCount: json['eventCount'] as int?,
      jobTimeoutMinutes: json['jobTimeoutMinutes'] as int?,
      locale: json['locale'] as String?,
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      name: json['name'] as String?,
      networkProfile: json['networkProfile'] != null
          ? NetworkProfile.fromJson(
              json['networkProfile'] as Map<String, dynamic>)
          : null,
      parsingResultUrl: json['parsingResultUrl'] as String?,
      platform: (json['platform'] as String?)?.toDevicePlatform(),
      radios: json['radios'] != null
          ? Radios.fromJson(json['radios'] as Map<String, dynamic>)
          : null,
      result: (json['result'] as String?)?.toExecutionResult(),
      resultCode: (json['resultCode'] as String?)?.toExecutionResultCode(),
      seed: json['seed'] as int?,
      skipAppResign: json['skipAppResign'] as bool?,
      started: timeStampFromJson(json['started']),
      status: (json['status'] as String?)?.toExecutionStatus(),
      stopped: timeStampFromJson(json['stopped']),
      testSpecArn: json['testSpecArn'] as String?,
      totalJobs: json['totalJobs'] as int?,
      type: (json['type'] as String?)?.toTestType(),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
      webUrl: json['webUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appUpload = this.appUpload;
    final arn = this.arn;
    final billingMethod = this.billingMethod;
    final completedJobs = this.completedJobs;
    final counters = this.counters;
    final created = this.created;
    final customerArtifactPaths = this.customerArtifactPaths;
    final deviceMinutes = this.deviceMinutes;
    final devicePoolArn = this.devicePoolArn;
    final deviceSelectionResult = this.deviceSelectionResult;
    final eventCount = this.eventCount;
    final jobTimeoutMinutes = this.jobTimeoutMinutes;
    final locale = this.locale;
    final location = this.location;
    final message = this.message;
    final name = this.name;
    final networkProfile = this.networkProfile;
    final parsingResultUrl = this.parsingResultUrl;
    final platform = this.platform;
    final radios = this.radios;
    final result = this.result;
    final resultCode = this.resultCode;
    final seed = this.seed;
    final skipAppResign = this.skipAppResign;
    final started = this.started;
    final status = this.status;
    final stopped = this.stopped;
    final testSpecArn = this.testSpecArn;
    final totalJobs = this.totalJobs;
    final type = this.type;
    final vpcConfig = this.vpcConfig;
    final webUrl = this.webUrl;
    return {
      if (appUpload != null) 'appUpload': appUpload,
      if (arn != null) 'arn': arn,
      if (billingMethod != null) 'billingMethod': billingMethod.toValue(),
      if (completedJobs != null) 'completedJobs': completedJobs,
      if (counters != null) 'counters': counters,
      if (created != null) 'created': unixTimestampToJson(created),
      if (customerArtifactPaths != null)
        'customerArtifactPaths': customerArtifactPaths,
      if (deviceMinutes != null) 'deviceMinutes': deviceMinutes,
      if (devicePoolArn != null) 'devicePoolArn': devicePoolArn,
      if (deviceSelectionResult != null)
        'deviceSelectionResult': deviceSelectionResult,
      if (eventCount != null) 'eventCount': eventCount,
      if (jobTimeoutMinutes != null) 'jobTimeoutMinutes': jobTimeoutMinutes,
      if (locale != null) 'locale': locale,
      if (location != null) 'location': location,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (networkProfile != null) 'networkProfile': networkProfile,
      if (parsingResultUrl != null) 'parsingResultUrl': parsingResultUrl,
      if (platform != null) 'platform': platform.toValue(),
      if (radios != null) 'radios': radios,
      if (result != null) 'result': result.toValue(),
      if (resultCode != null) 'resultCode': resultCode.toValue(),
      if (seed != null) 'seed': seed,
      if (skipAppResign != null) 'skipAppResign': skipAppResign,
      if (started != null) 'started': unixTimestampToJson(started),
      if (status != null) 'status': status.toValue(),
      if (stopped != null) 'stopped': unixTimestampToJson(stopped),
      if (testSpecArn != null) 'testSpecArn': testSpecArn,
      if (totalJobs != null) 'totalJobs': totalJobs,
      if (type != null) 'type': type.toValue(),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
      if (webUrl != null) 'webUrl': webUrl,
    };
  }
}

/// Represents a sample of performance data.
class Sample {
  /// The sample's ARN.
  final String? arn;

  /// The sample's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// CPU: A CPU sample type. This is expressed as the app processing CPU time
  /// (including child processes) as reported by process, as a percentage.
  /// </li>
  /// <li>
  /// MEMORY: A memory usage sample type. This is expressed as the total
  /// proportional set size of an app process, in kilobytes.
  /// </li>
  /// <li>
  /// NATIVE_AVG_DRAWTIME
  /// </li>
  /// <li>
  /// NATIVE_FPS
  /// </li>
  /// <li>
  /// NATIVE_FRAMES
  /// </li>
  /// <li>
  /// NATIVE_MAX_DRAWTIME
  /// </li>
  /// <li>
  /// NATIVE_MIN_DRAWTIME
  /// </li>
  /// <li>
  /// OPENGL_AVG_DRAWTIME
  /// </li>
  /// <li>
  /// OPENGL_FPS
  /// </li>
  /// <li>
  /// OPENGL_FRAMES
  /// </li>
  /// <li>
  /// OPENGL_MAX_DRAWTIME
  /// </li>
  /// <li>
  /// OPENGL_MIN_DRAWTIME
  /// </li>
  /// <li>
  /// RX
  /// </li>
  /// <li>
  /// RX_RATE: The total number of bytes per second (TCP and UDP) that are sent,
  /// by app process.
  /// </li>
  /// <li>
  /// THREADS: A threads sample type. This is expressed as the total number of
  /// threads per app process.
  /// </li>
  /// <li>
  /// TX
  /// </li>
  /// <li>
  /// TX_RATE: The total number of bytes per second (TCP and UDP) that are
  /// received, by app process.
  /// </li>
  /// </ul>
  final SampleType? type;

  /// The presigned Amazon S3 URL that can be used with a GET request to download
  /// the sample's file.
  final String? url;

  Sample({
    this.arn,
    this.type,
    this.url,
  });

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      arn: json['arn'] as String?,
      type: (json['type'] as String?)?.toSampleType(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    final url = this.url;
    return {
      if (arn != null) 'arn': arn,
      if (type != null) 'type': type.toValue(),
      if (url != null) 'url': url,
    };
  }
}

enum SampleType {
  cpu,
  memory,
  threads,
  rxRate,
  txRate,
  rx,
  tx,
  nativeFrames,
  nativeFps,
  nativeMinDrawtime,
  nativeAvgDrawtime,
  nativeMaxDrawtime,
  openglFrames,
  openglFps,
  openglMinDrawtime,
  openglAvgDrawtime,
  openglMaxDrawtime,
}

extension SampleTypeValueExtension on SampleType {
  String toValue() {
    switch (this) {
      case SampleType.cpu:
        return 'CPU';
      case SampleType.memory:
        return 'MEMORY';
      case SampleType.threads:
        return 'THREADS';
      case SampleType.rxRate:
        return 'RX_RATE';
      case SampleType.txRate:
        return 'TX_RATE';
      case SampleType.rx:
        return 'RX';
      case SampleType.tx:
        return 'TX';
      case SampleType.nativeFrames:
        return 'NATIVE_FRAMES';
      case SampleType.nativeFps:
        return 'NATIVE_FPS';
      case SampleType.nativeMinDrawtime:
        return 'NATIVE_MIN_DRAWTIME';
      case SampleType.nativeAvgDrawtime:
        return 'NATIVE_AVG_DRAWTIME';
      case SampleType.nativeMaxDrawtime:
        return 'NATIVE_MAX_DRAWTIME';
      case SampleType.openglFrames:
        return 'OPENGL_FRAMES';
      case SampleType.openglFps:
        return 'OPENGL_FPS';
      case SampleType.openglMinDrawtime:
        return 'OPENGL_MIN_DRAWTIME';
      case SampleType.openglAvgDrawtime:
        return 'OPENGL_AVG_DRAWTIME';
      case SampleType.openglMaxDrawtime:
        return 'OPENGL_MAX_DRAWTIME';
    }
  }
}

extension SampleTypeFromString on String {
  SampleType toSampleType() {
    switch (this) {
      case 'CPU':
        return SampleType.cpu;
      case 'MEMORY':
        return SampleType.memory;
      case 'THREADS':
        return SampleType.threads;
      case 'RX_RATE':
        return SampleType.rxRate;
      case 'TX_RATE':
        return SampleType.txRate;
      case 'RX':
        return SampleType.rx;
      case 'TX':
        return SampleType.tx;
      case 'NATIVE_FRAMES':
        return SampleType.nativeFrames;
      case 'NATIVE_FPS':
        return SampleType.nativeFps;
      case 'NATIVE_MIN_DRAWTIME':
        return SampleType.nativeMinDrawtime;
      case 'NATIVE_AVG_DRAWTIME':
        return SampleType.nativeAvgDrawtime;
      case 'NATIVE_MAX_DRAWTIME':
        return SampleType.nativeMaxDrawtime;
      case 'OPENGL_FRAMES':
        return SampleType.openglFrames;
      case 'OPENGL_FPS':
        return SampleType.openglFps;
      case 'OPENGL_MIN_DRAWTIME':
        return SampleType.openglMinDrawtime;
      case 'OPENGL_AVG_DRAWTIME':
        return SampleType.openglAvgDrawtime;
      case 'OPENGL_MAX_DRAWTIME':
        return SampleType.openglMaxDrawtime;
    }
    throw Exception('$this is not known in enum SampleType');
  }
}

/// Represents the settings for a run. Includes things like location, radio
/// states, auxiliary apps, and network profiles.
class ScheduleRunConfiguration {
  /// A list of upload ARNs for app packages to be installed with your app.
  final List<String>? auxiliaryApps;

  /// Specifies the billing method for a test run: <code>metered</code> or
  /// <code>unmetered</code>. If the parameter is not specified, the default value
  /// is <code>metered</code>.
  /// <note>
  /// If you have purchased unmetered device slots, you must set this parameter to
  /// <code>unmetered</code> to make use of them. Otherwise, your run counts
  /// against your metered time.
  /// </note>
  final BillingMethod? billingMethod;

  /// Input <code>CustomerArtifactPaths</code> object for the scheduled run
  /// configuration.
  final CustomerArtifactPaths? customerArtifactPaths;

  /// The ARN of the extra data for the run. The extra data is a .zip file that
  /// AWS Device Farm extracts to external data for Android or the app's sandbox
  /// for iOS.
  final String? extraDataPackageArn;

  /// Information about the locale that is used for the run.
  final String? locale;

  /// Information about the location that is used for the run.
  final Location? location;

  /// Reserved for internal use.
  final String? networkProfileArn;

  /// Information about the radio states for the run.
  final Radios? radios;

  /// An array of ARNs for your VPC endpoint configurations.
  final List<String>? vpceConfigurationArns;

  ScheduleRunConfiguration({
    this.auxiliaryApps,
    this.billingMethod,
    this.customerArtifactPaths,
    this.extraDataPackageArn,
    this.locale,
    this.location,
    this.networkProfileArn,
    this.radios,
    this.vpceConfigurationArns,
  });

  Map<String, dynamic> toJson() {
    final auxiliaryApps = this.auxiliaryApps;
    final billingMethod = this.billingMethod;
    final customerArtifactPaths = this.customerArtifactPaths;
    final extraDataPackageArn = this.extraDataPackageArn;
    final locale = this.locale;
    final location = this.location;
    final networkProfileArn = this.networkProfileArn;
    final radios = this.radios;
    final vpceConfigurationArns = this.vpceConfigurationArns;
    return {
      if (auxiliaryApps != null) 'auxiliaryApps': auxiliaryApps,
      if (billingMethod != null) 'billingMethod': billingMethod.toValue(),
      if (customerArtifactPaths != null)
        'customerArtifactPaths': customerArtifactPaths,
      if (extraDataPackageArn != null)
        'extraDataPackageArn': extraDataPackageArn,
      if (locale != null) 'locale': locale,
      if (location != null) 'location': location,
      if (networkProfileArn != null) 'networkProfileArn': networkProfileArn,
      if (radios != null) 'radios': radios,
      if (vpceConfigurationArns != null)
        'vpceConfigurationArns': vpceConfigurationArns,
    };
  }
}

/// Represents the result of a schedule run request.
class ScheduleRunResult {
  /// Information about the scheduled run.
  final Run? run;

  ScheduleRunResult({
    this.run,
  });

  factory ScheduleRunResult.fromJson(Map<String, dynamic> json) {
    return ScheduleRunResult(
      run: json['run'] != null
          ? Run.fromJson(json['run'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final run = this.run;
    return {
      if (run != null) 'run': run,
    };
  }
}

/// Represents test settings. This data structure is passed in as the test
/// parameter to ScheduleRun. For an example of the JSON request syntax, see
/// <a>ScheduleRun</a>.
class ScheduleRunTest {
  /// The test's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER. For Android, an app explorer that traverses an Android
  /// app, interacting with it and capturing screenshots at the same time.
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_NODE
  /// </li>
  /// <li>
  /// APPIUM_RUBY
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY
  /// </li>
  /// <li>
  /// CALABASH
  /// </li>
  /// <li>
  /// INSTRUMENTATION
  /// </li>
  /// <li>
  /// UIAUTOMATION
  /// </li>
  /// <li>
  /// UIAUTOMATOR
  /// </li>
  /// <li>
  /// XCTEST
  /// </li>
  /// <li>
  /// XCTEST_UI
  /// </li>
  /// </ul>
  final TestType type;

  /// The test's filter.
  final String? filter;

  /// The test's parameters, such as test framework parameters and fixture
  /// settings. Parameters are represented by name-value pairs of strings.
  ///
  /// For all tests:
  ///
  /// <ul>
  /// <li>
  /// <code>app_performance_monitoring</code>: Performance monitoring is enabled
  /// by default. Set this parameter to false to disable it.
  /// </li>
  /// </ul>
  /// For Calabash tests:
  ///
  /// <ul>
  /// <li>
  /// profile: A cucumber profile (for example, <code>my_profile_name</code>).
  /// </li>
  /// <li>
  /// tags: You can limit execution to features or scenarios that have (or don't
  /// have) certain tags (for example, @smoke or @smoke,~@wip).
  /// </li>
  /// </ul>
  /// For Appium tests (all types):
  ///
  /// <ul>
  /// <li>
  /// appium_version: The Appium version. Currently supported values are 1.6.5
  /// (and later), latest, and default.
  ///
  /// <ul>
  /// <li>
  /// latest runs the latest Appium version supported by Device Farm (1.9.1).
  /// </li>
  /// <li>
  /// For default, Device Farm selects a compatible version of Appium for the
  /// device. The current behavior is to run 1.7.2 on Android devices and iOS 9
  /// and earlier and 1.7.2 for iOS 10 and later.
  /// </li>
  /// <li>
  /// This behavior is subject to change.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For fuzz tests (Android only):
  ///
  /// <ul>
  /// <li>
  /// event_count: The number of events, between 1 and 10000, that the UI fuzz
  /// test should perform.
  /// </li>
  /// <li>
  /// throttle: The time, in ms, between 0 and 1000, that the UI fuzz test should
  /// wait between events.
  /// </li>
  /// <li>
  /// seed: A seed to use for randomizing the UI fuzz test. Using the same seed
  /// value between tests ensures identical event sequences.
  /// </li>
  /// </ul>
  /// For Explorer tests:
  ///
  /// <ul>
  /// <li>
  /// username: A user name to use if the Explorer encounters a login form. If not
  /// supplied, no user name is inserted.
  /// </li>
  /// <li>
  /// password: A password to use if the Explorer encounters a login form. If not
  /// supplied, no password is inserted.
  /// </li>
  /// </ul>
  /// For Instrumentation:
  ///
  /// <ul>
  /// <li>
  /// filter: A test filter string. Examples:
  ///
  /// <ul>
  /// <li>
  /// Running a single test case: <code>com.android.abc.Test1</code>
  /// </li>
  /// <li>
  /// Running a single test: <code>com.android.abc.Test1#smoke</code>
  /// </li>
  /// <li>
  /// Running multiple tests:
  /// <code>com.android.abc.Test1,com.android.abc.Test2</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For XCTest and XCTestUI:
  ///
  /// <ul>
  /// <li>
  /// filter: A test filter string. Examples:
  ///
  /// <ul>
  /// <li>
  /// Running a single test class: <code>LoginTests</code>
  /// </li>
  /// <li>
  /// Running a multiple test classes: <code>LoginTests,SmokeTests</code>
  /// </li>
  /// <li>
  /// Running a single test: <code>LoginTests/testValid</code>
  /// </li>
  /// <li>
  /// Running multiple tests:
  /// <code>LoginTests/testValid,LoginTests/testInvalid</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For UIAutomator:
  ///
  /// <ul>
  /// <li>
  /// filter: A test filter string. Examples:
  ///
  /// <ul>
  /// <li>
  /// Running a single test case: <code>com.android.abc.Test1</code>
  /// </li>
  /// <li>
  /// Running a single test: <code>com.android.abc.Test1#smoke</code>
  /// </li>
  /// <li>
  /// Running multiple tests:
  /// <code>com.android.abc.Test1,com.android.abc.Test2</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  final Map<String, String>? parameters;

  /// The ARN of the uploaded test to be run.
  final String? testPackageArn;

  /// The ARN of the YAML-formatted test specification.
  final String? testSpecArn;

  ScheduleRunTest({
    required this.type,
    this.filter,
    this.parameters,
    this.testPackageArn,
    this.testSpecArn,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final filter = this.filter;
    final parameters = this.parameters;
    final testPackageArn = this.testPackageArn;
    final testSpecArn = this.testSpecArn;
    return {
      'type': type.toValue(),
      if (filter != null) 'filter': filter,
      if (parameters != null) 'parameters': parameters,
      if (testPackageArn != null) 'testPackageArn': testPackageArn,
      if (testSpecArn != null) 'testSpecArn': testSpecArn,
    };
  }
}

class StopJobResult {
  /// The job that was stopped.
  final Job? job;

  StopJobResult({
    this.job,
  });

  factory StopJobResult.fromJson(Map<String, dynamic> json) {
    return StopJobResult(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

/// Represents the response from the server that describes the remote access
/// session when AWS Device Farm stops the session.
class StopRemoteAccessSessionResult {
  /// A container that represents the metadata from the service about the remote
  /// access session you are stopping.
  final RemoteAccessSession? remoteAccessSession;

  StopRemoteAccessSessionResult({
    this.remoteAccessSession,
  });

  factory StopRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) {
    return StopRemoteAccessSessionResult(
      remoteAccessSession: json['remoteAccessSession'] != null
          ? RemoteAccessSession.fromJson(
              json['remoteAccessSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final remoteAccessSession = this.remoteAccessSession;
    return {
      if (remoteAccessSession != null)
        'remoteAccessSession': remoteAccessSession,
    };
  }
}

/// Represents the results of your stop run attempt.
class StopRunResult {
  /// The run that was stopped.
  final Run? run;

  StopRunResult({
    this.run,
  });

  factory StopRunResult.fromJson(Map<String, dynamic> json) {
    return StopRunResult(
      run: json['run'] != null
          ? Run.fromJson(json['run'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final run = this.run;
    return {
      if (run != null) 'run': run,
    };
  }
}

/// Represents a collection of one or more tests.
class Suite {
  /// The suite's ARN.
  final String? arn;

  /// The suite's result counters.
  final Counters? counters;

  /// When the suite was created.
  final DateTime? created;

  /// Represents the total (metered or unmetered) minutes used by the test suite.
  final DeviceMinutes? deviceMinutes;

  /// A message about the suite's result.
  final String? message;

  /// The suite's name.
  final String? name;

  /// The suite's result.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// The suite's start time.
  final DateTime? started;

  /// The suite's status.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PENDING_CONCURRENCY
  /// </li>
  /// <li>
  /// PENDING_DEVICE
  /// </li>
  /// <li>
  /// PROCESSING
  /// </li>
  /// <li>
  /// SCHEDULING
  /// </li>
  /// <li>
  /// PREPARING
  /// </li>
  /// <li>
  /// RUNNING
  /// </li>
  /// <li>
  /// COMPLETED
  /// </li>
  /// <li>
  /// STOPPING
  /// </li>
  /// </ul>
  final ExecutionStatus? status;

  /// The suite's stop time.
  final DateTime? stopped;

  /// The suite's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER
  /// <note>
  /// Only available for Android; an app explorer that traverses an Android app,
  /// interacting with it and capturing screenshots at the same time.
  /// </note> </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_NODE
  /// </li>
  /// <li>
  /// APPIUM_RUBY
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY
  /// </li>
  /// <li>
  /// CALABASH
  /// </li>
  /// <li>
  /// INSTRUMENTATION
  /// </li>
  /// <li>
  /// UIAUTOMATION
  /// </li>
  /// <li>
  /// UIAUTOMATOR
  /// </li>
  /// <li>
  /// XCTEST
  /// </li>
  /// <li>
  /// XCTEST_UI
  /// </li>
  /// </ul>
  final TestType? type;

  Suite({
    this.arn,
    this.counters,
    this.created,
    this.deviceMinutes,
    this.message,
    this.name,
    this.result,
    this.started,
    this.status,
    this.stopped,
    this.type,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      arn: json['arn'] as String?,
      counters: json['counters'] != null
          ? Counters.fromJson(json['counters'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      deviceMinutes: json['deviceMinutes'] != null
          ? DeviceMinutes.fromJson(
              json['deviceMinutes'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      name: json['name'] as String?,
      result: (json['result'] as String?)?.toExecutionResult(),
      started: timeStampFromJson(json['started']),
      status: (json['status'] as String?)?.toExecutionStatus(),
      stopped: timeStampFromJson(json['stopped']),
      type: (json['type'] as String?)?.toTestType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final counters = this.counters;
    final created = this.created;
    final deviceMinutes = this.deviceMinutes;
    final message = this.message;
    final name = this.name;
    final result = this.result;
    final started = this.started;
    final status = this.status;
    final stopped = this.stopped;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (counters != null) 'counters': counters,
      if (created != null) 'created': unixTimestampToJson(created),
      if (deviceMinutes != null) 'deviceMinutes': deviceMinutes,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (result != null) 'result': result.toValue(),
      if (started != null) 'started': unixTimestampToJson(started),
      if (status != null) 'status': status.toValue(),
      if (stopped != null) 'stopped': unixTimestampToJson(stopped),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The metadata that you apply to a resource to help you categorize and
/// organize it. Each tag consists of a key and an optional value, both of which
/// you define. Tag keys can have a maximum character length of 128 characters.
/// Tag values can have a maximum length of 256 characters.
class Tag {
  /// One part of a key-value pair that makes up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that makes up a tag. A
  /// <code>value</code> acts as a descriptor in a tag category (key).
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a condition that is evaluated.
class Test {
  /// The test's ARN.
  final String? arn;

  /// The test's result counters.
  final Counters? counters;

  /// When the test was created.
  final DateTime? created;

  /// Represents the total (metered or unmetered) minutes used by the test.
  final DeviceMinutes? deviceMinutes;

  /// A message about the test's result.
  final String? message;

  /// The test's name.
  final String? name;

  /// The test's result.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PASSED
  /// </li>
  /// <li>
  /// WARNED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// SKIPPED
  /// </li>
  /// <li>
  /// ERRORED
  /// </li>
  /// <li>
  /// STOPPED
  /// </li>
  /// </ul>
  final ExecutionResult? result;

  /// The test's start time.
  final DateTime? started;

  /// The test's status.
  ///
  /// Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// PENDING_CONCURRENCY
  /// </li>
  /// <li>
  /// PENDING_DEVICE
  /// </li>
  /// <li>
  /// PROCESSING
  /// </li>
  /// <li>
  /// SCHEDULING
  /// </li>
  /// <li>
  /// PREPARING
  /// </li>
  /// <li>
  /// RUNNING
  /// </li>
  /// <li>
  /// COMPLETED
  /// </li>
  /// <li>
  /// STOPPING
  /// </li>
  /// </ul>
  final ExecutionStatus? status;

  /// The test's stop time.
  final DateTime? stopped;

  /// The test's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// BUILTIN_FUZZ
  /// </li>
  /// <li>
  /// BUILTIN_EXPLORER
  /// <note>
  /// For Android, an app explorer that traverses an Android app, interacting with
  /// it and capturing screenshots at the same time.
  /// </note> </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_NODE
  /// </li>
  /// <li>
  /// APPIUM_RUBY
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY
  /// </li>
  /// <li>
  /// CALABASH
  /// </li>
  /// <li>
  /// INSTRUMENTATION
  /// </li>
  /// <li>
  /// UIAUTOMATION
  /// </li>
  /// <li>
  /// UIAUTOMATOR
  /// </li>
  /// <li>
  /// XCTEST
  /// </li>
  /// <li>
  /// XCTEST_UI
  /// </li>
  /// </ul>
  final TestType? type;

  Test({
    this.arn,
    this.counters,
    this.created,
    this.deviceMinutes,
    this.message,
    this.name,
    this.result,
    this.started,
    this.status,
    this.stopped,
    this.type,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      arn: json['arn'] as String?,
      counters: json['counters'] != null
          ? Counters.fromJson(json['counters'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      deviceMinutes: json['deviceMinutes'] != null
          ? DeviceMinutes.fromJson(
              json['deviceMinutes'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      name: json['name'] as String?,
      result: (json['result'] as String?)?.toExecutionResult(),
      started: timeStampFromJson(json['started']),
      status: (json['status'] as String?)?.toExecutionStatus(),
      stopped: timeStampFromJson(json['stopped']),
      type: (json['type'] as String?)?.toTestType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final counters = this.counters;
    final created = this.created;
    final deviceMinutes = this.deviceMinutes;
    final message = this.message;
    final name = this.name;
    final result = this.result;
    final started = this.started;
    final status = this.status;
    final stopped = this.stopped;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (counters != null) 'counters': counters,
      if (created != null) 'created': unixTimestampToJson(created),
      if (deviceMinutes != null) 'deviceMinutes': deviceMinutes,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (result != null) 'result': result.toValue(),
      if (started != null) 'started': unixTimestampToJson(started),
      if (status != null) 'status': status.toValue(),
      if (stopped != null) 'stopped': unixTimestampToJson(stopped),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// A Selenium testing project. Projects are used to collect and collate
/// sessions.
class TestGridProject {
  /// The ARN for the project.
  final String? arn;

  /// When the project was created.
  final DateTime? created;

  /// A human-readable description for the project.
  final String? description;

  /// A human-readable name for the project.
  final String? name;

  /// The VPC security groups and subnets that are attached to a project.
  final TestGridVpcConfig? vpcConfig;

  TestGridProject({
    this.arn,
    this.created,
    this.description,
    this.name,
    this.vpcConfig,
  });

  factory TestGridProject.fromJson(Map<String, dynamic> json) {
    return TestGridProject(
      arn: json['arn'] as String?,
      created: timeStampFromJson(json['created']),
      description: json['description'] as String?,
      name: json['name'] as String?,
      vpcConfig: json['vpcConfig'] != null
          ? TestGridVpcConfig.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final description = this.description;
    final name = this.name;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (created != null) 'created': unixTimestampToJson(created),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// A <a>TestGridSession</a> is a single instance of a browser launched from the
/// URL provided by a call to <a>CreateTestGridUrl</a>.
class TestGridSession {
  /// The ARN of the session.
  final String? arn;

  /// The number of billed minutes that were used for this session.
  final double? billingMinutes;

  /// The time that the session was started.
  final DateTime? created;

  /// The time the session ended.
  final DateTime? ended;

  /// A JSON object of options and parameters passed to the Selenium WebDriver.
  final String? seleniumProperties;

  /// The state of the session.
  final TestGridSessionStatus? status;

  TestGridSession({
    this.arn,
    this.billingMinutes,
    this.created,
    this.ended,
    this.seleniumProperties,
    this.status,
  });

  factory TestGridSession.fromJson(Map<String, dynamic> json) {
    return TestGridSession(
      arn: json['arn'] as String?,
      billingMinutes: json['billingMinutes'] as double?,
      created: timeStampFromJson(json['created']),
      ended: timeStampFromJson(json['ended']),
      seleniumProperties: json['seleniumProperties'] as String?,
      status: (json['status'] as String?)?.toTestGridSessionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingMinutes = this.billingMinutes;
    final created = this.created;
    final ended = this.ended;
    final seleniumProperties = this.seleniumProperties;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (billingMinutes != null) 'billingMinutes': billingMinutes,
      if (created != null) 'created': unixTimestampToJson(created),
      if (ended != null) 'ended': unixTimestampToJson(ended),
      if (seleniumProperties != null) 'seleniumProperties': seleniumProperties,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An action taken by a <a>TestGridSession</a> browser instance.
class TestGridSessionAction {
  /// The action taken by the session.
  final String? action;

  /// The time, in milliseconds, that the action took to complete in the browser.
  final int? duration;

  /// HTTP method that the browser used to make the request.
  final String? requestMethod;

  /// The time that the session invoked the action.
  final DateTime? started;

  /// HTTP status code returned to the browser when the action was taken.
  final String? statusCode;

  TestGridSessionAction({
    this.action,
    this.duration,
    this.requestMethod,
    this.started,
    this.statusCode,
  });

  factory TestGridSessionAction.fromJson(Map<String, dynamic> json) {
    return TestGridSessionAction(
      action: json['action'] as String?,
      duration: json['duration'] as int?,
      requestMethod: json['requestMethod'] as String?,
      started: timeStampFromJson(json['started']),
      statusCode: json['statusCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final duration = this.duration;
    final requestMethod = this.requestMethod;
    final started = this.started;
    final statusCode = this.statusCode;
    return {
      if (action != null) 'action': action,
      if (duration != null) 'duration': duration,
      if (requestMethod != null) 'requestMethod': requestMethod,
      if (started != null) 'started': unixTimestampToJson(started),
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

/// Artifacts are video and other files that are produced in the process of
/// running a browser in an automated context.
/// <note>
/// Video elements might be broken up into multiple artifacts as they grow in
/// size during creation.
/// </note>
class TestGridSessionArtifact {
  /// The file name of the artifact.
  final String? filename;

  /// The kind of artifact.
  final TestGridSessionArtifactType? type;

  /// A semi-stable URL to the content of the object.
  final String? url;

  TestGridSessionArtifact({
    this.filename,
    this.type,
    this.url,
  });

  factory TestGridSessionArtifact.fromJson(Map<String, dynamic> json) {
    return TestGridSessionArtifact(
      filename: json['filename'] as String?,
      type: (json['type'] as String?)?.toTestGridSessionArtifactType(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filename = this.filename;
    final type = this.type;
    final url = this.url;
    return {
      if (filename != null) 'filename': filename,
      if (type != null) 'type': type.toValue(),
      if (url != null) 'url': url,
    };
  }
}

enum TestGridSessionArtifactCategory {
  video,
  log,
}

extension TestGridSessionArtifactCategoryValueExtension
    on TestGridSessionArtifactCategory {
  String toValue() {
    switch (this) {
      case TestGridSessionArtifactCategory.video:
        return 'VIDEO';
      case TestGridSessionArtifactCategory.log:
        return 'LOG';
    }
  }
}

extension TestGridSessionArtifactCategoryFromString on String {
  TestGridSessionArtifactCategory toTestGridSessionArtifactCategory() {
    switch (this) {
      case 'VIDEO':
        return TestGridSessionArtifactCategory.video;
      case 'LOG':
        return TestGridSessionArtifactCategory.log;
    }
    throw Exception(
        '$this is not known in enum TestGridSessionArtifactCategory');
  }
}

enum TestGridSessionArtifactType {
  unknown,
  video,
  seleniumLog,
}

extension TestGridSessionArtifactTypeValueExtension
    on TestGridSessionArtifactType {
  String toValue() {
    switch (this) {
      case TestGridSessionArtifactType.unknown:
        return 'UNKNOWN';
      case TestGridSessionArtifactType.video:
        return 'VIDEO';
      case TestGridSessionArtifactType.seleniumLog:
        return 'SELENIUM_LOG';
    }
  }
}

extension TestGridSessionArtifactTypeFromString on String {
  TestGridSessionArtifactType toTestGridSessionArtifactType() {
    switch (this) {
      case 'UNKNOWN':
        return TestGridSessionArtifactType.unknown;
      case 'VIDEO':
        return TestGridSessionArtifactType.video;
      case 'SELENIUM_LOG':
        return TestGridSessionArtifactType.seleniumLog;
    }
    throw Exception('$this is not known in enum TestGridSessionArtifactType');
  }
}

enum TestGridSessionStatus {
  active,
  closed,
  errored,
}

extension TestGridSessionStatusValueExtension on TestGridSessionStatus {
  String toValue() {
    switch (this) {
      case TestGridSessionStatus.active:
        return 'ACTIVE';
      case TestGridSessionStatus.closed:
        return 'CLOSED';
      case TestGridSessionStatus.errored:
        return 'ERRORED';
    }
  }
}

extension TestGridSessionStatusFromString on String {
  TestGridSessionStatus toTestGridSessionStatus() {
    switch (this) {
      case 'ACTIVE':
        return TestGridSessionStatus.active;
      case 'CLOSED':
        return TestGridSessionStatus.closed;
      case 'ERRORED':
        return TestGridSessionStatus.errored;
    }
    throw Exception('$this is not known in enum TestGridSessionStatus');
  }
}

/// The VPC security groups and subnets that are attached to a project.
class TestGridVpcConfig {
  /// A list of VPC security group IDs in your Amazon VPC.
  final List<String> securityGroupIds;

  /// A list of VPC subnet IDs in your Amazon VPC.
  final List<String> subnetIds;

  /// The ID of the Amazon VPC.
  final String vpcId;

  TestGridVpcConfig({
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcId,
  });

  factory TestGridVpcConfig.fromJson(Map<String, dynamic> json) {
    return TestGridVpcConfig(
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
    };
  }
}

enum TestType {
  builtinFuzz,
  builtinExplorer,
  webPerformanceProfile,
  appiumJavaJunit,
  appiumJavaTestng,
  appiumPython,
  appiumNode,
  appiumRuby,
  appiumWebJavaJunit,
  appiumWebJavaTestng,
  appiumWebPython,
  appiumWebNode,
  appiumWebRuby,
  calabash,
  instrumentation,
  uiautomation,
  uiautomator,
  xctest,
  xctestUi,
  remoteAccessRecord,
  remoteAccessReplay,
}

extension TestTypeValueExtension on TestType {
  String toValue() {
    switch (this) {
      case TestType.builtinFuzz:
        return 'BUILTIN_FUZZ';
      case TestType.builtinExplorer:
        return 'BUILTIN_EXPLORER';
      case TestType.webPerformanceProfile:
        return 'WEB_PERFORMANCE_PROFILE';
      case TestType.appiumJavaJunit:
        return 'APPIUM_JAVA_JUNIT';
      case TestType.appiumJavaTestng:
        return 'APPIUM_JAVA_TESTNG';
      case TestType.appiumPython:
        return 'APPIUM_PYTHON';
      case TestType.appiumNode:
        return 'APPIUM_NODE';
      case TestType.appiumRuby:
        return 'APPIUM_RUBY';
      case TestType.appiumWebJavaJunit:
        return 'APPIUM_WEB_JAVA_JUNIT';
      case TestType.appiumWebJavaTestng:
        return 'APPIUM_WEB_JAVA_TESTNG';
      case TestType.appiumWebPython:
        return 'APPIUM_WEB_PYTHON';
      case TestType.appiumWebNode:
        return 'APPIUM_WEB_NODE';
      case TestType.appiumWebRuby:
        return 'APPIUM_WEB_RUBY';
      case TestType.calabash:
        return 'CALABASH';
      case TestType.instrumentation:
        return 'INSTRUMENTATION';
      case TestType.uiautomation:
        return 'UIAUTOMATION';
      case TestType.uiautomator:
        return 'UIAUTOMATOR';
      case TestType.xctest:
        return 'XCTEST';
      case TestType.xctestUi:
        return 'XCTEST_UI';
      case TestType.remoteAccessRecord:
        return 'REMOTE_ACCESS_RECORD';
      case TestType.remoteAccessReplay:
        return 'REMOTE_ACCESS_REPLAY';
    }
  }
}

extension TestTypeFromString on String {
  TestType toTestType() {
    switch (this) {
      case 'BUILTIN_FUZZ':
        return TestType.builtinFuzz;
      case 'BUILTIN_EXPLORER':
        return TestType.builtinExplorer;
      case 'WEB_PERFORMANCE_PROFILE':
        return TestType.webPerformanceProfile;
      case 'APPIUM_JAVA_JUNIT':
        return TestType.appiumJavaJunit;
      case 'APPIUM_JAVA_TESTNG':
        return TestType.appiumJavaTestng;
      case 'APPIUM_PYTHON':
        return TestType.appiumPython;
      case 'APPIUM_NODE':
        return TestType.appiumNode;
      case 'APPIUM_RUBY':
        return TestType.appiumRuby;
      case 'APPIUM_WEB_JAVA_JUNIT':
        return TestType.appiumWebJavaJunit;
      case 'APPIUM_WEB_JAVA_TESTNG':
        return TestType.appiumWebJavaTestng;
      case 'APPIUM_WEB_PYTHON':
        return TestType.appiumWebPython;
      case 'APPIUM_WEB_NODE':
        return TestType.appiumWebNode;
      case 'APPIUM_WEB_RUBY':
        return TestType.appiumWebRuby;
      case 'CALABASH':
        return TestType.calabash;
      case 'INSTRUMENTATION':
        return TestType.instrumentation;
      case 'UIAUTOMATION':
        return TestType.uiautomation;
      case 'UIAUTOMATOR':
        return TestType.uiautomator;
      case 'XCTEST':
        return TestType.xctest;
      case 'XCTEST_UI':
        return TestType.xctestUi;
      case 'REMOTE_ACCESS_RECORD':
        return TestType.remoteAccessRecord;
      case 'REMOTE_ACCESS_REPLAY':
        return TestType.remoteAccessReplay;
    }
    throw Exception('$this is not known in enum TestType');
  }
}

/// Represents information about free trial device minutes for an AWS account.
class TrialMinutes {
  /// The number of free trial minutes remaining in the account.
  final double? remaining;

  /// The total number of free trial minutes that the account started with.
  final double? total;

  TrialMinutes({
    this.remaining,
    this.total,
  });

  factory TrialMinutes.fromJson(Map<String, dynamic> json) {
    return TrialMinutes(
      remaining: json['remaining'] as double?,
      total: json['total'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final remaining = this.remaining;
    final total = this.total;
    return {
      if (remaining != null) 'remaining': remaining,
      if (total != null) 'total': total,
    };
  }
}

/// A collection of one or more problems, grouped by their result.
class UniqueProblem {
  /// A message about the unique problems' result.
  final String? message;

  /// Information about the problems.
  final List<Problem>? problems;

  UniqueProblem({
    this.message,
    this.problems,
  });

  factory UniqueProblem.fromJson(Map<String, dynamic> json) {
    return UniqueProblem(
      message: json['message'] as String?,
      problems: (json['problems'] as List?)
          ?.whereNotNull()
          .map((e) => Problem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final problems = this.problems;
    return {
      if (message != null) 'message': message,
      if (problems != null) 'problems': problems,
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

class UpdateDeviceInstanceResult {
  /// An object that contains information about your device instance.
  final DeviceInstance? deviceInstance;

  UpdateDeviceInstanceResult({
    this.deviceInstance,
  });

  factory UpdateDeviceInstanceResult.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceInstanceResult(
      deviceInstance: json['deviceInstance'] != null
          ? DeviceInstance.fromJson(
              json['deviceInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceInstance = this.deviceInstance;
    return {
      if (deviceInstance != null) 'deviceInstance': deviceInstance,
    };
  }
}

/// Represents the result of an update device pool request.
class UpdateDevicePoolResult {
  /// The device pool you just updated.
  final DevicePool? devicePool;

  UpdateDevicePoolResult({
    this.devicePool,
  });

  factory UpdateDevicePoolResult.fromJson(Map<String, dynamic> json) {
    return UpdateDevicePoolResult(
      devicePool: json['devicePool'] != null
          ? DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePool = this.devicePool;
    return {
      if (devicePool != null) 'devicePool': devicePool,
    };
  }
}

class UpdateInstanceProfileResult {
  /// An object that contains information about your instance profile.
  final InstanceProfile? instanceProfile;

  UpdateInstanceProfileResult({
    this.instanceProfile,
  });

  factory UpdateInstanceProfileResult.fromJson(Map<String, dynamic> json) {
    return UpdateInstanceProfileResult(
      instanceProfile: json['instanceProfile'] != null
          ? InstanceProfile.fromJson(
              json['instanceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfile = this.instanceProfile;
    return {
      if (instanceProfile != null) 'instanceProfile': instanceProfile,
    };
  }
}

class UpdateNetworkProfileResult {
  /// A list of the available network profiles.
  final NetworkProfile? networkProfile;

  UpdateNetworkProfileResult({
    this.networkProfile,
  });

  factory UpdateNetworkProfileResult.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkProfileResult(
      networkProfile: json['networkProfile'] != null
          ? NetworkProfile.fromJson(
              json['networkProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkProfile = this.networkProfile;
    return {
      if (networkProfile != null) 'networkProfile': networkProfile,
    };
  }
}

/// Represents the result of an update project request.
class UpdateProjectResult {
  /// The project to update.
  final Project? project;

  UpdateProjectResult({
    this.project,
  });

  factory UpdateProjectResult.fromJson(Map<String, dynamic> json) {
    return UpdateProjectResult(
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

class UpdateTestGridProjectResult {
  /// The project, including updated information.
  final TestGridProject? testGridProject;

  UpdateTestGridProjectResult({
    this.testGridProject,
  });

  factory UpdateTestGridProjectResult.fromJson(Map<String, dynamic> json) {
    return UpdateTestGridProjectResult(
      testGridProject: json['testGridProject'] != null
          ? TestGridProject.fromJson(
              json['testGridProject'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final testGridProject = this.testGridProject;
    return {
      if (testGridProject != null) 'testGridProject': testGridProject,
    };
  }
}

class UpdateUploadResult {
  /// A test spec uploaded to Device Farm.
  final Upload? upload;

  UpdateUploadResult({
    this.upload,
  });

  factory UpdateUploadResult.fromJson(Map<String, dynamic> json) {
    return UpdateUploadResult(
      upload: json['upload'] != null
          ? Upload.fromJson(json['upload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final upload = this.upload;
    return {
      if (upload != null) 'upload': upload,
    };
  }
}

class UpdateVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  final VPCEConfiguration? vpceConfiguration;

  UpdateVPCEConfigurationResult({
    this.vpceConfiguration,
  });

  factory UpdateVPCEConfigurationResult.fromJson(Map<String, dynamic> json) {
    return UpdateVPCEConfigurationResult(
      vpceConfiguration: json['vpceConfiguration'] != null
          ? VPCEConfiguration.fromJson(
              json['vpceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpceConfiguration = this.vpceConfiguration;
    return {
      if (vpceConfiguration != null) 'vpceConfiguration': vpceConfiguration,
    };
  }
}

/// An app or a set of one or more tests to upload or that have been uploaded.
class Upload {
  /// The upload's ARN.
  final String? arn;

  /// The upload's category. Allowed values include:
  ///
  /// <ul>
  /// <li>
  /// CURATED: An upload managed by AWS Device Farm.
  /// </li>
  /// <li>
  /// PRIVATE: An upload managed by the AWS Device Farm customer.
  /// </li>
  /// </ul>
  final UploadCategory? category;

  /// The upload's content type (for example,
  /// <code>application/octet-stream</code>).
  final String? contentType;

  /// When the upload was created.
  final DateTime? created;

  /// A message about the upload's result.
  final String? message;

  /// The upload's metadata. For example, for Android, this contains information
  /// that is parsed from the manifest and is displayed in the AWS Device Farm
  /// console after the associated app is uploaded.
  final String? metadata;

  /// The upload's file name.
  final String? name;

  /// The upload's status.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// FAILED
  /// </li>
  /// <li>
  /// INITIALIZED
  /// </li>
  /// <li>
  /// PROCESSING
  /// </li>
  /// <li>
  /// SUCCEEDED
  /// </li>
  /// </ul>
  final UploadStatus? status;

  /// The upload's type.
  ///
  /// Must be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// ANDROID_APP
  /// </li>
  /// <li>
  /// IOS_APP
  /// </li>
  /// <li>
  /// WEB_APP
  /// </li>
  /// <li>
  /// EXTERNAL_DATA
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_PACKAGE
  /// </li>
  /// <li>
  /// CALABASH_TEST_PACKAGE
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATION_TEST_PACKAGE
  /// </li>
  /// <li>
  /// UIAUTOMATOR_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_TEST_PACKAGE
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_PACKAGE
  /// </li>
  /// <li>
  /// APPIUM_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_JUNIT_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_JAVA_TESTNG_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_PYTHON_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_NODE_TEST_SPEC
  /// </li>
  /// <li>
  /// APPIUM_WEB_RUBY_TEST_SPEC
  /// </li>
  /// <li>
  /// INSTRUMENTATION_TEST_SPEC
  /// </li>
  /// <li>
  /// XCTEST_UI_TEST_SPEC
  /// </li>
  /// </ul>
  final UploadType? type;

  /// The presigned Amazon S3 URL that was used to store a file using a PUT
  /// request.
  final String? url;

  Upload({
    this.arn,
    this.category,
    this.contentType,
    this.created,
    this.message,
    this.metadata,
    this.name,
    this.status,
    this.type,
    this.url,
  });

  factory Upload.fromJson(Map<String, dynamic> json) {
    return Upload(
      arn: json['arn'] as String?,
      category: (json['category'] as String?)?.toUploadCategory(),
      contentType: json['contentType'] as String?,
      created: timeStampFromJson(json['created']),
      message: json['message'] as String?,
      metadata: json['metadata'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toUploadStatus(),
      type: (json['type'] as String?)?.toUploadType(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final category = this.category;
    final contentType = this.contentType;
    final created = this.created;
    final message = this.message;
    final metadata = this.metadata;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final url = this.url;
    return {
      if (arn != null) 'arn': arn,
      if (category != null) 'category': category.toValue(),
      if (contentType != null) 'contentType': contentType,
      if (created != null) 'created': unixTimestampToJson(created),
      if (message != null) 'message': message,
      if (metadata != null) 'metadata': metadata,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (url != null) 'url': url,
    };
  }
}

enum UploadCategory {
  curated,
  private,
}

extension UploadCategoryValueExtension on UploadCategory {
  String toValue() {
    switch (this) {
      case UploadCategory.curated:
        return 'CURATED';
      case UploadCategory.private:
        return 'PRIVATE';
    }
  }
}

extension UploadCategoryFromString on String {
  UploadCategory toUploadCategory() {
    switch (this) {
      case 'CURATED':
        return UploadCategory.curated;
      case 'PRIVATE':
        return UploadCategory.private;
    }
    throw Exception('$this is not known in enum UploadCategory');
  }
}

enum UploadStatus {
  initialized,
  processing,
  succeeded,
  failed,
}

extension UploadStatusValueExtension on UploadStatus {
  String toValue() {
    switch (this) {
      case UploadStatus.initialized:
        return 'INITIALIZED';
      case UploadStatus.processing:
        return 'PROCESSING';
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
      case 'INITIALIZED':
        return UploadStatus.initialized;
      case 'PROCESSING':
        return UploadStatus.processing;
      case 'SUCCEEDED':
        return UploadStatus.succeeded;
      case 'FAILED':
        return UploadStatus.failed;
    }
    throw Exception('$this is not known in enum UploadStatus');
  }
}

enum UploadType {
  androidApp,
  iosApp,
  webApp,
  externalData,
  appiumJavaJunitTestPackage,
  appiumJavaTestngTestPackage,
  appiumPythonTestPackage,
  appiumNodeTestPackage,
  appiumRubyTestPackage,
  appiumWebJavaJunitTestPackage,
  appiumWebJavaTestngTestPackage,
  appiumWebPythonTestPackage,
  appiumWebNodeTestPackage,
  appiumWebRubyTestPackage,
  calabashTestPackage,
  instrumentationTestPackage,
  uiautomationTestPackage,
  uiautomatorTestPackage,
  xctestTestPackage,
  xctestUiTestPackage,
  appiumJavaJunitTestSpec,
  appiumJavaTestngTestSpec,
  appiumPythonTestSpec,
  appiumNodeTestSpec,
  appiumRubyTestSpec,
  appiumWebJavaJunitTestSpec,
  appiumWebJavaTestngTestSpec,
  appiumWebPythonTestSpec,
  appiumWebNodeTestSpec,
  appiumWebRubyTestSpec,
  instrumentationTestSpec,
  xctestUiTestSpec,
}

extension UploadTypeValueExtension on UploadType {
  String toValue() {
    switch (this) {
      case UploadType.androidApp:
        return 'ANDROID_APP';
      case UploadType.iosApp:
        return 'IOS_APP';
      case UploadType.webApp:
        return 'WEB_APP';
      case UploadType.externalData:
        return 'EXTERNAL_DATA';
      case UploadType.appiumJavaJunitTestPackage:
        return 'APPIUM_JAVA_JUNIT_TEST_PACKAGE';
      case UploadType.appiumJavaTestngTestPackage:
        return 'APPIUM_JAVA_TESTNG_TEST_PACKAGE';
      case UploadType.appiumPythonTestPackage:
        return 'APPIUM_PYTHON_TEST_PACKAGE';
      case UploadType.appiumNodeTestPackage:
        return 'APPIUM_NODE_TEST_PACKAGE';
      case UploadType.appiumRubyTestPackage:
        return 'APPIUM_RUBY_TEST_PACKAGE';
      case UploadType.appiumWebJavaJunitTestPackage:
        return 'APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE';
      case UploadType.appiumWebJavaTestngTestPackage:
        return 'APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE';
      case UploadType.appiumWebPythonTestPackage:
        return 'APPIUM_WEB_PYTHON_TEST_PACKAGE';
      case UploadType.appiumWebNodeTestPackage:
        return 'APPIUM_WEB_NODE_TEST_PACKAGE';
      case UploadType.appiumWebRubyTestPackage:
        return 'APPIUM_WEB_RUBY_TEST_PACKAGE';
      case UploadType.calabashTestPackage:
        return 'CALABASH_TEST_PACKAGE';
      case UploadType.instrumentationTestPackage:
        return 'INSTRUMENTATION_TEST_PACKAGE';
      case UploadType.uiautomationTestPackage:
        return 'UIAUTOMATION_TEST_PACKAGE';
      case UploadType.uiautomatorTestPackage:
        return 'UIAUTOMATOR_TEST_PACKAGE';
      case UploadType.xctestTestPackage:
        return 'XCTEST_TEST_PACKAGE';
      case UploadType.xctestUiTestPackage:
        return 'XCTEST_UI_TEST_PACKAGE';
      case UploadType.appiumJavaJunitTestSpec:
        return 'APPIUM_JAVA_JUNIT_TEST_SPEC';
      case UploadType.appiumJavaTestngTestSpec:
        return 'APPIUM_JAVA_TESTNG_TEST_SPEC';
      case UploadType.appiumPythonTestSpec:
        return 'APPIUM_PYTHON_TEST_SPEC';
      case UploadType.appiumNodeTestSpec:
        return 'APPIUM_NODE_TEST_SPEC';
      case UploadType.appiumRubyTestSpec:
        return 'APPIUM_RUBY_TEST_SPEC';
      case UploadType.appiumWebJavaJunitTestSpec:
        return 'APPIUM_WEB_JAVA_JUNIT_TEST_SPEC';
      case UploadType.appiumWebJavaTestngTestSpec:
        return 'APPIUM_WEB_JAVA_TESTNG_TEST_SPEC';
      case UploadType.appiumWebPythonTestSpec:
        return 'APPIUM_WEB_PYTHON_TEST_SPEC';
      case UploadType.appiumWebNodeTestSpec:
        return 'APPIUM_WEB_NODE_TEST_SPEC';
      case UploadType.appiumWebRubyTestSpec:
        return 'APPIUM_WEB_RUBY_TEST_SPEC';
      case UploadType.instrumentationTestSpec:
        return 'INSTRUMENTATION_TEST_SPEC';
      case UploadType.xctestUiTestSpec:
        return 'XCTEST_UI_TEST_SPEC';
    }
  }
}

extension UploadTypeFromString on String {
  UploadType toUploadType() {
    switch (this) {
      case 'ANDROID_APP':
        return UploadType.androidApp;
      case 'IOS_APP':
        return UploadType.iosApp;
      case 'WEB_APP':
        return UploadType.webApp;
      case 'EXTERNAL_DATA':
        return UploadType.externalData;
      case 'APPIUM_JAVA_JUNIT_TEST_PACKAGE':
        return UploadType.appiumJavaJunitTestPackage;
      case 'APPIUM_JAVA_TESTNG_TEST_PACKAGE':
        return UploadType.appiumJavaTestngTestPackage;
      case 'APPIUM_PYTHON_TEST_PACKAGE':
        return UploadType.appiumPythonTestPackage;
      case 'APPIUM_NODE_TEST_PACKAGE':
        return UploadType.appiumNodeTestPackage;
      case 'APPIUM_RUBY_TEST_PACKAGE':
        return UploadType.appiumRubyTestPackage;
      case 'APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE':
        return UploadType.appiumWebJavaJunitTestPackage;
      case 'APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE':
        return UploadType.appiumWebJavaTestngTestPackage;
      case 'APPIUM_WEB_PYTHON_TEST_PACKAGE':
        return UploadType.appiumWebPythonTestPackage;
      case 'APPIUM_WEB_NODE_TEST_PACKAGE':
        return UploadType.appiumWebNodeTestPackage;
      case 'APPIUM_WEB_RUBY_TEST_PACKAGE':
        return UploadType.appiumWebRubyTestPackage;
      case 'CALABASH_TEST_PACKAGE':
        return UploadType.calabashTestPackage;
      case 'INSTRUMENTATION_TEST_PACKAGE':
        return UploadType.instrumentationTestPackage;
      case 'UIAUTOMATION_TEST_PACKAGE':
        return UploadType.uiautomationTestPackage;
      case 'UIAUTOMATOR_TEST_PACKAGE':
        return UploadType.uiautomatorTestPackage;
      case 'XCTEST_TEST_PACKAGE':
        return UploadType.xctestTestPackage;
      case 'XCTEST_UI_TEST_PACKAGE':
        return UploadType.xctestUiTestPackage;
      case 'APPIUM_JAVA_JUNIT_TEST_SPEC':
        return UploadType.appiumJavaJunitTestSpec;
      case 'APPIUM_JAVA_TESTNG_TEST_SPEC':
        return UploadType.appiumJavaTestngTestSpec;
      case 'APPIUM_PYTHON_TEST_SPEC':
        return UploadType.appiumPythonTestSpec;
      case 'APPIUM_NODE_TEST_SPEC':
        return UploadType.appiumNodeTestSpec;
      case 'APPIUM_RUBY_TEST_SPEC':
        return UploadType.appiumRubyTestSpec;
      case 'APPIUM_WEB_JAVA_JUNIT_TEST_SPEC':
        return UploadType.appiumWebJavaJunitTestSpec;
      case 'APPIUM_WEB_JAVA_TESTNG_TEST_SPEC':
        return UploadType.appiumWebJavaTestngTestSpec;
      case 'APPIUM_WEB_PYTHON_TEST_SPEC':
        return UploadType.appiumWebPythonTestSpec;
      case 'APPIUM_WEB_NODE_TEST_SPEC':
        return UploadType.appiumWebNodeTestSpec;
      case 'APPIUM_WEB_RUBY_TEST_SPEC':
        return UploadType.appiumWebRubyTestSpec;
      case 'INSTRUMENTATION_TEST_SPEC':
        return UploadType.instrumentationTestSpec;
      case 'XCTEST_UI_TEST_SPEC':
        return UploadType.xctestUiTestSpec;
    }
    throw Exception('$this is not known in enum UploadType');
  }
}

/// Represents an Amazon Virtual Private Cloud (VPC) endpoint configuration.
class VPCEConfiguration {
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration.
  final String? arn;

  /// The DNS name that maps to the private IP address of the service you want to
  /// access.
  final String? serviceDnsName;

  /// An optional description that provides details about your VPC endpoint
  /// configuration.
  final String? vpceConfigurationDescription;

  /// The friendly name you give to your VPC endpoint configuration to manage your
  /// configurations more easily.
  final String? vpceConfigurationName;

  /// The name of the VPC endpoint service running in your AWS account that you
  /// want Device Farm to test.
  final String? vpceServiceName;

  VPCEConfiguration({
    this.arn,
    this.serviceDnsName,
    this.vpceConfigurationDescription,
    this.vpceConfigurationName,
    this.vpceServiceName,
  });

  factory VPCEConfiguration.fromJson(Map<String, dynamic> json) {
    return VPCEConfiguration(
      arn: json['arn'] as String?,
      serviceDnsName: json['serviceDnsName'] as String?,
      vpceConfigurationDescription:
          json['vpceConfigurationDescription'] as String?,
      vpceConfigurationName: json['vpceConfigurationName'] as String?,
      vpceServiceName: json['vpceServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final serviceDnsName = this.serviceDnsName;
    final vpceConfigurationDescription = this.vpceConfigurationDescription;
    final vpceConfigurationName = this.vpceConfigurationName;
    final vpceServiceName = this.vpceServiceName;
    return {
      if (arn != null) 'arn': arn,
      if (serviceDnsName != null) 'serviceDnsName': serviceDnsName,
      if (vpceConfigurationDescription != null)
        'vpceConfigurationDescription': vpceConfigurationDescription,
      if (vpceConfigurationName != null)
        'vpceConfigurationName': vpceConfigurationName,
      if (vpceServiceName != null) 'vpceServiceName': vpceServiceName,
    };
  }
}

/// Contains the VPC configuration data necessary to interface with AWS Device
/// Farm's services.
class VpcConfig {
  /// An array of one or more security groups IDs in your Amazon VPC.
  final List<String> securityGroupIds;

  /// An array of one or more subnet IDs in your Amazon VPC.
  final List<String> subnetIds;

  /// The ID of the Amazon VPC.
  final String vpcId;

  VpcConfig({
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcId,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
    };
  }
}

class ArgumentException extends _s.GenericAwsException {
  ArgumentException({String? type, String? message})
      : super(type: type, code: 'ArgumentException', message: message);
}

class CannotDeleteException extends _s.GenericAwsException {
  CannotDeleteException({String? type, String? message})
      : super(type: type, code: 'CannotDeleteException', message: message);
}

class IdempotencyException extends _s.GenericAwsException {
  IdempotencyException({String? type, String? message})
      : super(type: type, code: 'IdempotencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotEligibleException extends _s.GenericAwsException {
  NotEligibleException({String? type, String? message})
      : super(type: type, code: 'NotEligibleException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceAccountException extends _s.GenericAwsException {
  ServiceAccountException({String? type, String? message})
      : super(type: type, code: 'ServiceAccountException', message: message);
}

class TagOperationException extends _s.GenericAwsException {
  TagOperationException({String? type, String? message})
      : super(type: type, code: 'TagOperationException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ArgumentException': (type, message) =>
      ArgumentException(type: type, message: message),
  'CannotDeleteException': (type, message) =>
      CannotDeleteException(type: type, message: message),
  'IdempotencyException': (type, message) =>
      IdempotencyException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotEligibleException': (type, message) =>
      NotEligibleException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceAccountException': (type, message) =>
      ServiceAccountException(type: type, message: message),
  'TagOperationException': (type, message) =>
      TagOperationException(type: type, message: message),
  'TagPolicyException': (type, message) =>
      TagPolicyException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
