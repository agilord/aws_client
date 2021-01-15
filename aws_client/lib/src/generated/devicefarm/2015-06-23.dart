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

part '2015-06-23.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'devicefarm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String name,
    @_s.required String projectArn,
    @_s.required List<Rule> rules,
    String description,
    int maxDevices,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(rules, 'rules');
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
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
    @_s.required String name,
    String description,
    List<String> excludeAppPackagesFromCleanup,
    bool packageCleanup,
    bool rebootAfterUse,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
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
    @_s.required String name,
    @_s.required String projectArn,
    String description,
    int downlinkBandwidthBits,
    int downlinkDelayMs,
    int downlinkJitterMs,
    int downlinkLossPercent,
    NetworkProfileType type,
    int uplinkBandwidthBits,
    int uplinkDelayMs,
    int uplinkJitterMs,
    int uplinkLossPercent,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
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
  Future<CreateProjectResult> createProject({
    @_s.required String name,
    int defaultJobTimeoutMinutes,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
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
  /// tests, see <a href="https://aws.amazon.com/device-farm/faq/">Do you modify
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
    @_s.required String deviceArn,
    @_s.required String projectArn,
    String clientId,
    CreateRemoteAccessSessionConfiguration configuration,
    String instanceArn,
    InteractionMode interactionMode,
    String name,
    bool remoteDebugEnabled,
    String remoteRecordAppArn,
    bool remoteRecordEnabled,
    bool skipAppResign,
    String sshPublicKey,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringLength(
      'deviceArn',
      deviceArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      0,
      64,
    );
    _s.validateStringLength(
      'instanceArn',
      instanceArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'instanceArn',
      instanceArn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    _s.validateStringLength(
      'remoteRecordAppArn',
      remoteRecordAppArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'remoteRecordAppArn',
      remoteRecordAppArn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'sshPublicKey',
      sshPublicKey,
      0,
      8192,
    );
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
  /// May throw [InternalServiceException].
  ///
  /// Parameter [name] :
  /// Human-readable name of the Selenium testing project.
  ///
  /// Parameter [description] :
  /// Human-readable description of the project.
  Future<CreateTestGridProjectResult> createTestGridProject({
    @_s.required String name,
    String description,
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
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.*\S.*''',
    );
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
    @_s.required int expiresInSeconds,
    @_s.required String projectArn,
  }) async {
    ArgumentError.checkNotNull(expiresInSeconds, 'expiresInSeconds');
    _s.validateNumRange(
      'expiresInSeconds',
      expiresInSeconds,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
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
    @_s.required String name,
    @_s.required String projectArn,
    @_s.required UploadType type,
    String contentType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'contentType',
      contentType,
      0,
      64,
    );
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
        'type': type?.toValue() ?? '',
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
    @_s.required String serviceDnsName,
    @_s.required String vpceConfigurationName,
    @_s.required String vpceServiceName,
    String vpceConfigurationDescription,
  }) async {
    ArgumentError.checkNotNull(serviceDnsName, 'serviceDnsName');
    _s.validateStringLength(
      'serviceDnsName',
      serviceDnsName,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpceConfigurationName, 'vpceConfigurationName');
    _s.validateStringLength(
      'vpceConfigurationName',
      vpceConfigurationName,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpceServiceName, 'vpceServiceName');
    _s.validateStringLength(
      'vpceServiceName',
      vpceServiceName,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'vpceConfigurationDescription',
      vpceConfigurationDescription,
      0,
      2048,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteDevicePool'
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

    return DeleteDevicePoolResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteInstanceProfile'
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

    return DeleteInstanceProfileResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteNetworkProfile'
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

    return DeleteNetworkProfileResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteProject'
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

    return DeleteProjectResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteRemoteAccessSession'
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

    return DeleteRemoteAccessSessionResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteRun'
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

    return DeleteRunResult.fromJson(jsonResponse.body);
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
    @_s.required String projectArn,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteTestGridProject'
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

    return DeleteTestGridProjectResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteUpload'
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

    return DeleteUploadResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.DeleteVPCEConfiguration'
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

    return DeleteVPCEConfigurationResult.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String devicePoolArn,
    String appArn,
    ScheduleRunConfiguration configuration,
    ScheduleRunTest test,
    TestType testType,
  }) async {
    ArgumentError.checkNotNull(devicePoolArn, 'devicePoolArn');
    _s.validateStringLength(
      'devicePoolArn',
      devicePoolArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'devicePoolArn',
      devicePoolArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'appArn',
      appArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'appArn',
      appArn,
      r'''^arn:.+''',
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String projectArn,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
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
    String projectArn,
    String sessionArn,
    String sessionId,
  }) async {
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
    );
    _s.validateStringLength(
      'sessionArn',
      sessionArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'sessionArn',
      sessionArn,
      r'''^arn:aws:devicefarm:.+''',
    );
    _s.validateStringLength(
      'sessionId',
      sessionId,
      1,
      128,
    );
    _s.validateStringPattern(
      'sessionId',
      sessionId,
      r'''.*\S.*''',
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String appArn,
    @_s.required String remoteAccessSessionArn,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    _s.validateStringLength(
      'appArn',
      appArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appArn',
      appArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        remoteAccessSessionArn, 'remoteAccessSessionArn');
    _s.validateStringLength(
      'remoteAccessSessionArn',
      remoteAccessSessionArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'remoteAccessSessionArn',
      remoteAccessSessionArn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
    @_s.required ArtifactCategory type,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
        'type': type?.toValue() ?? '',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
    DevicePoolType type,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    String arn,
    List<DeviceFilter> filters,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
    NetworkProfileType type,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    String arn,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
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
    int maxResult,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
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
    @_s.required String sessionArn,
    int maxResult,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(sessionArn, 'sessionArn');
    _s.validateStringLength(
      'sessionArn',
      sessionArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sessionArn',
      sessionArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
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
    @_s.required String sessionArn,
    int maxResult,
    String nextToken,
    TestGridSessionArtifactCategory type,
  }) async {
    ArgumentError.checkNotNull(sessionArn, 'sessionArn');
    _s.validateStringLength(
      'sessionArn',
      sessionArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sessionArn',
      sessionArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
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
    @_s.required String projectArn,
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime endTimeAfter,
    DateTime endTimeBefore,
    int maxResult,
    String nextToken,
    TestGridSessionStatus status,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResult',
      maxResult,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    @_s.required String arn,
    String nextToken,
    UploadType type,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
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
  /// Parameter [offeringPromotionId] :
  /// The ID of the offering promotion to be applied to the purchase.
  ///
  /// Parameter [quantity] :
  /// The number of device slots to purchase in an offering request.
  Future<PurchaseOfferingResult> purchaseOffering({
    String offeringId,
    String offeringPromotionId,
    int quantity,
  }) async {
    _s.validateStringLength(
      'offeringId',
      offeringId,
      32,
      1152921504606846976,
    );
    _s.validateStringLength(
      'offeringPromotionId',
      offeringPromotionId,
      4,
      1152921504606846976,
    );
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
        if (offeringId != null) 'offeringId': offeringId,
        if (offeringPromotionId != null)
          'offeringPromotionId': offeringPromotionId,
        if (quantity != null) 'quantity': quantity,
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
    String offeringId,
    int quantity,
  }) async {
    _s.validateStringLength(
      'offeringId',
      offeringId,
      32,
      1152921504606846976,
    );
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
        if (offeringId != null) 'offeringId': offeringId,
        if (quantity != null) 'quantity': quantity,
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
    @_s.required String projectArn,
    @_s.required ScheduleRunTest test,
    String appArn,
    ScheduleRunConfiguration configuration,
    String devicePoolArn,
    DeviceSelectionConfiguration deviceSelectionConfiguration,
    ExecutionConfiguration executionConfiguration,
    String name,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(test, 'test');
    _s.validateStringLength(
      'appArn',
      appArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'appArn',
      appArn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'devicePoolArn',
      devicePoolArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'devicePoolArn',
      devicePoolArn,
      r'''^arn:.+''',
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DeviceFarm_20150623.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String arn,
    List<String> labels,
    String profileArn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'profileArn',
      profileArn,
      32,
      1011,
    );
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''^arn:.+''',
    );
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
    @_s.required String arn,
    bool clearMaxDevices,
    String description,
    int maxDevices,
    String name,
    List<Rule> rules,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
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
    @_s.required String arn,
    String description,
    List<String> excludeAppPackagesFromCleanup,
    String name,
    bool packageCleanup,
    bool rebootAfterUse,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
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
    @_s.required String arn,
    String description,
    int downlinkBandwidthBits,
    int downlinkDelayMs,
    int downlinkJitterMs,
    int downlinkLossPercent,
    String name,
    NetworkProfileType type,
    int uplinkBandwidthBits,
    int uplinkDelayMs,
    int uplinkJitterMs,
    int uplinkLossPercent,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      16384,
    );
    _s.validateNumRange(
      'downlinkLossPercent',
      downlinkLossPercent,
      0,
      100,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
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
  Future<UpdateProjectResult> updateProject({
    @_s.required String arn,
    int defaultJobTimeoutMinutes,
    String name,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
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
      },
    );

    return UpdateProjectResult.fromJson(jsonResponse.body);
  }

  /// Change details of a project.
  ///
  /// May throw [NotFoundException].
  /// May throw [ArgumentException].
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
  Future<UpdateTestGridProjectResult> updateTestGridProject({
    @_s.required String projectArn,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''^arn:aws:devicefarm:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.*\S.*''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
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
    @_s.required String arn,
    String contentType,
    bool editContent,
    String name,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'contentType',
      contentType,
      0,
      64,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
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
    @_s.required String arn,
    String serviceDnsName,
    String vpceConfigurationDescription,
    String vpceConfigurationName,
    String vpceServiceName,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      32,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'serviceDnsName',
      serviceDnsName,
      0,
      2048,
    );
    _s.validateStringLength(
      'vpceConfigurationDescription',
      vpceConfigurationDescription,
      0,
      2048,
    );
    _s.validateStringLength(
      'vpceConfigurationName',
      vpceConfigurationName,
      0,
      1024,
    );
    _s.validateStringLength(
      'vpceServiceName',
      vpceServiceName,
      0,
      2048,
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountSettings {
  /// The AWS account number specified in the <code>AccountSettings</code>
  /// container.
  @_s.JsonKey(name: 'awsAccountNumber')
  final String awsAccountNumber;

  /// The default number of minutes (at the account level) a test run executes
  /// before it times out. The default value is 150 minutes.
  @_s.JsonKey(name: 'defaultJobTimeoutMinutes')
  final int defaultJobTimeoutMinutes;

  /// The maximum number of minutes a test run executes before it times out.
  @_s.JsonKey(name: 'maxJobTimeoutMinutes')
  final int maxJobTimeoutMinutes;

  /// The maximum number of device slots that the AWS account can purchase. Each
  /// maximum is expressed as an <code>offering-id:number</code> pair, where the
  /// <code>offering-id</code> represents one of the IDs returned by the
  /// <code>ListOfferings</code> command.
  @_s.JsonKey(name: 'maxSlots')
  final Map<String, int> maxSlots;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="https://aws.amazon.com/device-farm/faq/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  @_s.JsonKey(name: 'skipAppResign')
  final bool skipAppResign;

  /// Information about an AWS account's usage of free trial device minutes.
  @_s.JsonKey(name: 'trialMinutes')
  final TrialMinutes trialMinutes;

  /// Returns the unmetered devices you have purchased or want to purchase.
  @_s.JsonKey(name: 'unmeteredDevices')
  final Map<DevicePlatform, int> unmeteredDevices;

  /// Returns the unmetered remote access devices you have purchased or want to
  /// purchase.
  @_s.JsonKey(name: 'unmeteredRemoteAccessDevices')
  final Map<DevicePlatform, int> unmeteredRemoteAccessDevices;

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
  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsFromJson(json);
}

/// Represents the output of a test. Examples of artifacts include logs and
/// screenshots.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Artifact {
  /// The artifact's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The artifact's file extension.
  @_s.JsonKey(name: 'extension')
  final String extension;

  /// The artifact's name.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'type')
  final ArtifactType type;

  /// The presigned Amazon S3 URL that can be used with a GET request to download
  /// the artifact's file.
  @_s.JsonKey(name: 'url')
  final String url;

  Artifact({
    this.arn,
    this.extension,
    this.name,
    this.type,
    this.url,
  });
  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);
}

enum ArtifactCategory {
  @_s.JsonValue('SCREENSHOT')
  screenshot,
  @_s.JsonValue('FILE')
  file,
  @_s.JsonValue('LOG')
  log,
}

extension on ArtifactCategory {
  String toValue() {
    switch (this) {
      case ArtifactCategory.screenshot:
        return 'SCREENSHOT';
      case ArtifactCategory.file:
        return 'FILE';
      case ArtifactCategory.log:
        return 'LOG';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ArtifactType {
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('SCREENSHOT')
  screenshot,
  @_s.JsonValue('DEVICE_LOG')
  deviceLog,
  @_s.JsonValue('MESSAGE_LOG')
  messageLog,
  @_s.JsonValue('VIDEO_LOG')
  videoLog,
  @_s.JsonValue('RESULT_LOG')
  resultLog,
  @_s.JsonValue('SERVICE_LOG')
  serviceLog,
  @_s.JsonValue('WEBKIT_LOG')
  webkitLog,
  @_s.JsonValue('INSTRUMENTATION_OUTPUT')
  instrumentationOutput,
  @_s.JsonValue('EXERCISER_MONKEY_OUTPUT')
  exerciserMonkeyOutput,
  @_s.JsonValue('CALABASH_JSON_OUTPUT')
  calabashJsonOutput,
  @_s.JsonValue('CALABASH_PRETTY_OUTPUT')
  calabashPrettyOutput,
  @_s.JsonValue('CALABASH_STANDARD_OUTPUT')
  calabashStandardOutput,
  @_s.JsonValue('CALABASH_JAVA_XML_OUTPUT')
  calabashJavaXmlOutput,
  @_s.JsonValue('AUTOMATION_OUTPUT')
  automationOutput,
  @_s.JsonValue('APPIUM_SERVER_OUTPUT')
  appiumServerOutput,
  @_s.JsonValue('APPIUM_JAVA_OUTPUT')
  appiumJavaOutput,
  @_s.JsonValue('APPIUM_JAVA_XML_OUTPUT')
  appiumJavaXmlOutput,
  @_s.JsonValue('APPIUM_PYTHON_OUTPUT')
  appiumPythonOutput,
  @_s.JsonValue('APPIUM_PYTHON_XML_OUTPUT')
  appiumPythonXmlOutput,
  @_s.JsonValue('EXPLORER_EVENT_LOG')
  explorerEventLog,
  @_s.JsonValue('EXPLORER_SUMMARY_LOG')
  explorerSummaryLog,
  @_s.JsonValue('APPLICATION_CRASH_REPORT')
  applicationCrashReport,
  @_s.JsonValue('XCTEST_LOG')
  xctestLog,
  @_s.JsonValue('VIDEO')
  video,
  @_s.JsonValue('CUSTOMER_ARTIFACT')
  customerArtifact,
  @_s.JsonValue('CUSTOMER_ARTIFACT_LOG')
  customerArtifactLog,
  @_s.JsonValue('TESTSPEC_OUTPUT')
  testspecOutput,
}

enum BillingMethod {
  @_s.JsonValue('METERED')
  metered,
  @_s.JsonValue('UNMETERED')
  unmetered,
}

/// Represents the amount of CPU that an app is using on a physical device. Does
/// not represent system-wide CPU usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CPU {
  /// The CPU's architecture (for example, x86 or ARM).
  @_s.JsonKey(name: 'architecture')
  final String architecture;

  /// The clock speed of the device's CPU, expressed in hertz (Hz). For example, a
  /// 1.2 GHz CPU is expressed as 1200000000.
  @_s.JsonKey(name: 'clock')
  final double clock;

  /// The CPU's frequency.
  @_s.JsonKey(name: 'frequency')
  final String frequency;

  CPU({
    this.architecture,
    this.clock,
    this.frequency,
  });
  factory CPU.fromJson(Map<String, dynamic> json) => _$CPUFromJson(json);
}

/// Represents entity counters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Counters {
  /// The number of errored entities.
  @_s.JsonKey(name: 'errored')
  final int errored;

  /// The number of failed entities.
  @_s.JsonKey(name: 'failed')
  final int failed;

  /// The number of passed entities.
  @_s.JsonKey(name: 'passed')
  final int passed;

  /// The number of skipped entities.
  @_s.JsonKey(name: 'skipped')
  final int skipped;

  /// The number of stopped entities.
  @_s.JsonKey(name: 'stopped')
  final int stopped;

  /// The total number of entities.
  @_s.JsonKey(name: 'total')
  final int total;

  /// The number of warned entities.
  @_s.JsonKey(name: 'warned')
  final int warned;

  Counters({
    this.errored,
    this.failed,
    this.passed,
    this.skipped,
    this.stopped,
    this.total,
    this.warned,
  });
  factory Counters.fromJson(Map<String, dynamic> json) =>
      _$CountersFromJson(json);
}

/// Represents the result of a create device pool request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDevicePoolResult {
  /// The newly created device pool.
  @_s.JsonKey(name: 'devicePool')
  final DevicePool devicePool;

  CreateDevicePoolResult({
    this.devicePool,
  });
  factory CreateDevicePoolResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDevicePoolResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstanceProfileResult {
  /// An object that contains information about your instance profile.
  @_s.JsonKey(name: 'instanceProfile')
  final InstanceProfile instanceProfile;

  CreateInstanceProfileResult({
    this.instanceProfile,
  });
  factory CreateInstanceProfileResult.fromJson(Map<String, dynamic> json) =>
      _$CreateInstanceProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNetworkProfileResult {
  /// The network profile that is returned by the create network profile request.
  @_s.JsonKey(name: 'networkProfile')
  final NetworkProfile networkProfile;

  CreateNetworkProfileResult({
    this.networkProfile,
  });
  factory CreateNetworkProfileResult.fromJson(Map<String, dynamic> json) =>
      _$CreateNetworkProfileResultFromJson(json);
}

/// Represents the result of a create project request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResult {
  /// The newly created project.
  @_s.JsonKey(name: 'project')
  final Project project;

  CreateProjectResult({
    this.project,
  });
  factory CreateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResultFromJson(json);
}

/// Configuration settings for a remote access session, including billing
/// method.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRemoteAccessSessionConfiguration {
  /// The billing method for the remote access session.
  @_s.JsonKey(name: 'billingMethod')
  final BillingMethod billingMethod;

  /// An array of ARNs included in the VPC endpoint configuration.
  @_s.JsonKey(name: 'vpceConfigurationArns')
  final List<String> vpceConfigurationArns;

  CreateRemoteAccessSessionConfiguration({
    this.billingMethod,
    this.vpceConfigurationArns,
  });
  Map<String, dynamic> toJson() =>
      _$CreateRemoteAccessSessionConfigurationToJson(this);
}

/// Represents the server response from a request to create a remote access
/// session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRemoteAccessSessionResult {
  /// A container that describes the remote access session when the request to
  /// create a remote access session is sent.
  @_s.JsonKey(name: 'remoteAccessSession')
  final RemoteAccessSession remoteAccessSession;

  CreateRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  factory CreateRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) =>
      _$CreateRemoteAccessSessionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTestGridProjectResult {
  /// ARN of the Selenium testing project that was created.
  @_s.JsonKey(name: 'testGridProject')
  final TestGridProject testGridProject;

  CreateTestGridProjectResult({
    this.testGridProject,
  });
  factory CreateTestGridProjectResult.fromJson(Map<String, dynamic> json) =>
      _$CreateTestGridProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTestGridUrlResult {
  /// The number of seconds the URL from <a>CreateTestGridUrlResult$url</a> stays
  /// active.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expires')
  final DateTime expires;

  /// A signed URL, expiring in <a>CreateTestGridUrlRequest$expiresInSeconds</a>
  /// seconds, to be passed to a <code>RemoteWebDriver</code>.
  @_s.JsonKey(name: 'url')
  final String url;

  CreateTestGridUrlResult({
    this.expires,
    this.url,
  });
  factory CreateTestGridUrlResult.fromJson(Map<String, dynamic> json) =>
      _$CreateTestGridUrlResultFromJson(json);
}

/// Represents the result of a create upload request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUploadResult {
  /// The newly created upload.
  @_s.JsonKey(name: 'upload')
  final Upload upload;

  CreateUploadResult({
    this.upload,
  });
  factory CreateUploadResult.fromJson(Map<String, dynamic> json) =>
      _$CreateUploadResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  @_s.JsonKey(name: 'vpceConfiguration')
  final VPCEConfiguration vpceConfiguration;

  CreateVPCEConfigurationResult({
    this.vpceConfiguration,
  });
  factory CreateVPCEConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateVPCEConfigurationResultFromJson(json);
}

enum CurrencyCode {
  @_s.JsonValue('USD')
  usd,
}

/// A JSON object that specifies the paths where the artifacts generated by the
/// customer's tests, on the device or in the test environment, are pulled from.
///
/// Specify <code>deviceHostPaths</code> and optionally specify either
/// <code>iosPaths</code> or <code>androidPaths</code>.
///
/// For web app tests, you can specify both <code>iosPaths</code> and
/// <code>androidPaths</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomerArtifactPaths {
  /// Comma-separated list of paths on the Android device where the artifacts
  /// generated by the customer's tests are pulled from.
  @_s.JsonKey(name: 'androidPaths')
  final List<String> androidPaths;

  /// Comma-separated list of paths in the test execution environment where the
  /// artifacts generated by the customer's tests are pulled from.
  @_s.JsonKey(name: 'deviceHostPaths')
  final List<String> deviceHostPaths;

  /// Comma-separated list of paths on the iOS device where the artifacts
  /// generated by the customer's tests are pulled from.
  @_s.JsonKey(name: 'iosPaths')
  final List<String> iosPaths;

  CustomerArtifactPaths({
    this.androidPaths,
    this.deviceHostPaths,
    this.iosPaths,
  });
  factory CustomerArtifactPaths.fromJson(Map<String, dynamic> json) =>
      _$CustomerArtifactPathsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerArtifactPathsToJson(this);
}

/// Represents the result of a delete device pool request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDevicePoolResult {
  DeleteDevicePoolResult();
  factory DeleteDevicePoolResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDevicePoolResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInstanceProfileResult {
  DeleteInstanceProfileResult();
  factory DeleteInstanceProfileResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteInstanceProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNetworkProfileResult {
  DeleteNetworkProfileResult();
  factory DeleteNetworkProfileResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteNetworkProfileResultFromJson(json);
}

/// Represents the result of a delete project request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResult {
  DeleteProjectResult();
  factory DeleteProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResultFromJson(json);
}

/// The response from the server when a request is made to delete the remote
/// access session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRemoteAccessSessionResult {
  DeleteRemoteAccessSessionResult();
  factory DeleteRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteRemoteAccessSessionResultFromJson(json);
}

/// Represents the result of a delete run request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRunResult {
  DeleteRunResult();
  factory DeleteRunResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteRunResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTestGridProjectResult {
  DeleteTestGridProjectResult();
  factory DeleteTestGridProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteTestGridProjectResultFromJson(json);
}

/// Represents the result of a delete upload request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUploadResult {
  DeleteUploadResult();
  factory DeleteUploadResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteUploadResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVPCEConfigurationResult {
  DeleteVPCEConfigurationResult();
  factory DeleteVPCEConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteVPCEConfigurationResultFromJson(json);
}

/// Represents a device type that an app is tested against.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Device {
  /// The device's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Indicates how likely a device is available for a test run. Currently
  /// available in the <a>ListDevices</a> and GetDevice API methods.
  @_s.JsonKey(name: 'availability')
  final DeviceAvailability availability;

  /// The device's carrier.
  @_s.JsonKey(name: 'carrier')
  final String carrier;

  /// Information about the device's CPU.
  @_s.JsonKey(name: 'cpu')
  final CPU cpu;

  /// The name of the fleet to which this device belongs.
  @_s.JsonKey(name: 'fleetName')
  final String fleetName;

  /// The type of fleet to which this device belongs. Possible values are PRIVATE
  /// and PUBLIC.
  @_s.JsonKey(name: 'fleetType')
  final String fleetType;

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
  @_s.JsonKey(name: 'formFactor')
  final DeviceFormFactor formFactor;

  /// The device's heap size, expressed in bytes.
  @_s.JsonKey(name: 'heapSize')
  final int heapSize;

  /// The device's image name.
  @_s.JsonKey(name: 'image')
  final String image;

  /// The instances that belong to this device.
  @_s.JsonKey(name: 'instances')
  final List<DeviceInstance> instances;

  /// The device's manufacturer name.
  @_s.JsonKey(name: 'manufacturer')
  final String manufacturer;

  /// The device's total memory size, expressed in bytes.
  @_s.JsonKey(name: 'memory')
  final int memory;

  /// The device's model name.
  @_s.JsonKey(name: 'model')
  final String model;

  /// The device's model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The device's display name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The device's operating system type.
  @_s.JsonKey(name: 'os')
  final String os;

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
  @_s.JsonKey(name: 'platform')
  final DevicePlatform platform;

  /// The device's radio.
  @_s.JsonKey(name: 'radio')
  final String radio;

  /// Specifies whether remote access has been enabled for the specified device.
  @_s.JsonKey(name: 'remoteAccessEnabled')
  final bool remoteAccessEnabled;

  /// This flag is set to <code>true</code> if remote debugging is enabled for the
  /// device.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  @_s.JsonKey(name: 'remoteDebugEnabled')
  final bool remoteDebugEnabled;

  /// The resolution of the device.
  @_s.JsonKey(name: 'resolution')
  final Resolution resolution;

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
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

enum DeviceAttribute {
  @_s.JsonValue('ARN')
  arn,
  @_s.JsonValue('PLATFORM')
  platform,
  @_s.JsonValue('FORM_FACTOR')
  formFactor,
  @_s.JsonValue('MANUFACTURER')
  manufacturer,
  @_s.JsonValue('REMOTE_ACCESS_ENABLED')
  remoteAccessEnabled,
  @_s.JsonValue('REMOTE_DEBUG_ENABLED')
  remoteDebugEnabled,
  @_s.JsonValue('APPIUM_VERSION')
  appiumVersion,
  @_s.JsonValue('INSTANCE_ARN')
  instanceArn,
  @_s.JsonValue('INSTANCE_LABELS')
  instanceLabels,
  @_s.JsonValue('FLEET_TYPE')
  fleetType,
  @_s.JsonValue('OS_VERSION')
  osVersion,
  @_s.JsonValue('MODEL')
  model,
  @_s.JsonValue('AVAILABILITY')
  availability,
}

enum DeviceAvailability {
  @_s.JsonValue('TEMPORARY_NOT_AVAILABLE')
  temporaryNotAvailable,
  @_s.JsonValue('BUSY')
  busy,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('HIGHLY_AVAILABLE')
  highlyAvailable,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'attribute')
  final DeviceFilterAttribute attribute;

  /// Specifies how Device Farm compares the filter's attribute to the value. See
  /// the attribute descriptions.
  @_s.JsonKey(name: 'operator')
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
  @_s.JsonKey(name: 'values')
  final List<String> values;

  DeviceFilter({
    this.attribute,
    this.operator,
    this.values,
  });
  factory DeviceFilter.fromJson(Map<String, dynamic> json) =>
      _$DeviceFilterFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceFilterToJson(this);
}

enum DeviceFilterAttribute {
  @_s.JsonValue('ARN')
  arn,
  @_s.JsonValue('PLATFORM')
  platform,
  @_s.JsonValue('OS_VERSION')
  osVersion,
  @_s.JsonValue('MODEL')
  model,
  @_s.JsonValue('AVAILABILITY')
  availability,
  @_s.JsonValue('FORM_FACTOR')
  formFactor,
  @_s.JsonValue('MANUFACTURER')
  manufacturer,
  @_s.JsonValue('REMOTE_ACCESS_ENABLED')
  remoteAccessEnabled,
  @_s.JsonValue('REMOTE_DEBUG_ENABLED')
  remoteDebugEnabled,
  @_s.JsonValue('INSTANCE_ARN')
  instanceArn,
  @_s.JsonValue('INSTANCE_LABELS')
  instanceLabels,
  @_s.JsonValue('FLEET_TYPE')
  fleetType,
}

enum DeviceFormFactor {
  @_s.JsonValue('PHONE')
  phone,
  @_s.JsonValue('TABLET')
  tablet,
}

/// Represents the device instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceInstance {
  /// The Amazon Resource Name (ARN) of the device instance.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ARN of the device.
  @_s.JsonKey(name: 'deviceArn')
  final String deviceArn;

  /// A object that contains information about the instance profile.
  @_s.JsonKey(name: 'instanceProfile')
  final InstanceProfile instanceProfile;

  /// An array of strings that describe the device instance.
  @_s.JsonKey(name: 'labels')
  final List<String> labels;

  /// The status of the device instance. Valid values are listed here.
  @_s.JsonKey(name: 'status')
  final InstanceStatus status;

  /// Unique device identifier for the device instance.
  @_s.JsonKey(name: 'udid')
  final String udid;

  DeviceInstance({
    this.arn,
    this.deviceArn,
    this.instanceProfile,
    this.labels,
    this.status,
    this.udid,
  });
  factory DeviceInstance.fromJson(Map<String, dynamic> json) =>
      _$DeviceInstanceFromJson(json);
}

/// Represents the total (metered or unmetered) minutes used by the resource to
/// run tests. Contains the sum of minutes consumed by all children.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceMinutes {
  /// When specified, represents only the sum of metered minutes used by the
  /// resource to run tests.
  @_s.JsonKey(name: 'metered')
  final double metered;

  /// When specified, represents the total minutes used by the resource to run
  /// tests.
  @_s.JsonKey(name: 'total')
  final double total;

  /// When specified, represents only the sum of unmetered minutes used by the
  /// resource to run tests.
  @_s.JsonKey(name: 'unmetered')
  final double unmetered;

  DeviceMinutes({
    this.metered,
    this.total,
    this.unmetered,
  });
  factory DeviceMinutes.fromJson(Map<String, dynamic> json) =>
      _$DeviceMinutesFromJson(json);
}

enum DevicePlatform {
  @_s.JsonValue('ANDROID')
  android,
  @_s.JsonValue('IOS')
  ios,
}

/// Represents a collection of device types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DevicePool {
  /// The device pool's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The device pool's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The number of devices that Device Farm can add to your device pool. Device
  /// Farm adds devices that are available and meet the criteria that you assign
  /// for the <code>rules</code> parameter. Depending on how many devices meet
  /// these constraints, your device pool might contain fewer devices than the
  /// value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs that
  /// you incur by running tests.
  @_s.JsonKey(name: 'maxDevices')
  final int maxDevices;

  /// The device pool's name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Information about the device pool's rules.
  @_s.JsonKey(name: 'rules')
  final List<Rule> rules;

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
  @_s.JsonKey(name: 'type')
  final DevicePoolType type;

  DevicePool({
    this.arn,
    this.description,
    this.maxDevices,
    this.name,
    this.rules,
    this.type,
  });
  factory DevicePool.fromJson(Map<String, dynamic> json) =>
      _$DevicePoolFromJson(json);
}

/// Represents a device pool compatibility result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DevicePoolCompatibilityResult {
  /// Whether the result was compatible with the device pool.
  @_s.JsonKey(name: 'compatible')
  final bool compatible;

  /// The device (phone or tablet) to return information about.
  @_s.JsonKey(name: 'device')
  final Device device;

  /// Information about the compatibility.
  @_s.JsonKey(name: 'incompatibilityMessages')
  final List<IncompatibilityMessage> incompatibilityMessages;

  DevicePoolCompatibilityResult({
    this.compatible,
    this.device,
    this.incompatibilityMessages,
  });
  factory DevicePoolCompatibilityResult.fromJson(Map<String, dynamic> json) =>
      _$DevicePoolCompatibilityResultFromJson(json);
}

enum DevicePoolType {
  @_s.JsonValue('CURATED')
  curated,
  @_s.JsonValue('PRIVATE')
  private,
}

extension on DevicePoolType {
  String toValue() {
    switch (this) {
      case DevicePoolType.curated:
        return 'CURATED';
      case DevicePoolType.private:
        return 'PRIVATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the device filters used in a test run and the maximum number of
/// devices to be included in the run. It is passed in as the
/// <code>deviceSelectionConfiguration</code> request parameter in
/// <a>ScheduleRun</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'filters')
  final List<DeviceFilter> filters;

  /// The maximum number of devices to be included in a test run.
  @_s.JsonKey(name: 'maxDevices')
  final int maxDevices;

  DeviceSelectionConfiguration({
    @_s.required this.filters,
    @_s.required this.maxDevices,
  });
  Map<String, dynamic> toJson() => _$DeviceSelectionConfigurationToJson(this);
}

/// Contains the run results requested by the device selection configuration and
/// how many devices were returned. For an example of the JSON response syntax,
/// see <a>ScheduleRun</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceSelectionResult {
  /// The filters in a device selection result.
  @_s.JsonKey(name: 'filters')
  final List<DeviceFilter> filters;

  /// The number of devices that matched the device filter selection criteria.
  @_s.JsonKey(name: 'matchedDevicesCount')
  final int matchedDevicesCount;

  /// The maximum number of devices to be selected by a device filter and included
  /// in a test run.
  @_s.JsonKey(name: 'maxDevices')
  final int maxDevices;

  DeviceSelectionResult({
    this.filters,
    this.matchedDevicesCount,
    this.maxDevices,
  });
  factory DeviceSelectionResult.fromJson(Map<String, dynamic> json) =>
      _$DeviceSelectionResultFromJson(json);
}

/// Represents configuration information about a test run, such as the execution
/// timeout (in minutes).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExecutionConfiguration {
  /// True if account cleanup is enabled at the beginning of the test. Otherwise,
  /// false.
  @_s.JsonKey(name: 'accountsCleanup')
  final bool accountsCleanup;

  /// True if app package cleanup is enabled at the beginning of the test.
  /// Otherwise, false.
  @_s.JsonKey(name: 'appPackagesCleanup')
  final bool appPackagesCleanup;

  /// The number of minutes a test run executes before it times out.
  @_s.JsonKey(name: 'jobTimeoutMinutes')
  final int jobTimeoutMinutes;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="https://aws.amazon.com/device-farm/faq/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  @_s.JsonKey(name: 'skipAppResign')
  final bool skipAppResign;

  /// Set to true to enable video capture. Otherwise, set to false. The default is
  /// true.
  @_s.JsonKey(name: 'videoCapture')
  final bool videoCapture;

  ExecutionConfiguration({
    this.accountsCleanup,
    this.appPackagesCleanup,
    this.jobTimeoutMinutes,
    this.skipAppResign,
    this.videoCapture,
  });
  Map<String, dynamic> toJson() => _$ExecutionConfigurationToJson(this);
}

enum ExecutionResult {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('PASSED')
  passed,
  @_s.JsonValue('WARNED')
  warned,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SKIPPED')
  skipped,
  @_s.JsonValue('ERRORED')
  errored,
  @_s.JsonValue('STOPPED')
  stopped,
}

enum ExecutionResultCode {
  @_s.JsonValue('PARSING_FAILED')
  parsingFailed,
  @_s.JsonValue('VPC_ENDPOINT_SETUP_FAILED')
  vpcEndpointSetupFailed,
}

enum ExecutionStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('PENDING_CONCURRENCY')
  pendingConcurrency,
  @_s.JsonValue('PENDING_DEVICE')
  pendingDevice,
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('SCHEDULING')
  scheduling,
  @_s.JsonValue('PREPARING')
  preparing,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('STOPPING')
  stopping,
}

/// Represents the account settings return values from the
/// <code>GetAccountSettings</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountSettingsResult {
  /// The account settings.
  @_s.JsonKey(name: 'accountSettings')
  final AccountSettings accountSettings;

  GetAccountSettingsResult({
    this.accountSettings,
  });
  factory GetAccountSettingsResult.fromJson(Map<String, dynamic> json) =>
      _$GetAccountSettingsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceInstanceResult {
  /// An object that contains information about your device instance.
  @_s.JsonKey(name: 'deviceInstance')
  final DeviceInstance deviceInstance;

  GetDeviceInstanceResult({
    this.deviceInstance,
  });
  factory GetDeviceInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceInstanceResultFromJson(json);
}

/// Represents the result of describe device pool compatibility request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicePoolCompatibilityResult {
  /// Information about compatible devices.
  @_s.JsonKey(name: 'compatibleDevices')
  final List<DevicePoolCompatibilityResult> compatibleDevices;

  /// Information about incompatible devices.
  @_s.JsonKey(name: 'incompatibleDevices')
  final List<DevicePoolCompatibilityResult> incompatibleDevices;

  GetDevicePoolCompatibilityResult({
    this.compatibleDevices,
    this.incompatibleDevices,
  });
  factory GetDevicePoolCompatibilityResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetDevicePoolCompatibilityResultFromJson(json);
}

/// Represents the result of a get device pool request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicePoolResult {
  /// An object that contains information about the requested device pool.
  @_s.JsonKey(name: 'devicePool')
  final DevicePool devicePool;

  GetDevicePoolResult({
    this.devicePool,
  });
  factory GetDevicePoolResult.fromJson(Map<String, dynamic> json) =>
      _$GetDevicePoolResultFromJson(json);
}

/// Represents the result of a get device request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceResult {
  /// An object that contains information about the requested device.
  @_s.JsonKey(name: 'device')
  final Device device;

  GetDeviceResult({
    this.device,
  });
  factory GetDeviceResult.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceProfileResult {
  /// An object that contains information about an instance profile.
  @_s.JsonKey(name: 'instanceProfile')
  final InstanceProfile instanceProfile;

  GetInstanceProfileResult({
    this.instanceProfile,
  });
  factory GetInstanceProfileResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceProfileResultFromJson(json);
}

/// Represents the result of a get job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobResult {
  /// An object that contains information about the requested job.
  @_s.JsonKey(name: 'job')
  final Job job;

  GetJobResult({
    this.job,
  });
  factory GetJobResult.fromJson(Map<String, dynamic> json) =>
      _$GetJobResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNetworkProfileResult {
  /// The network profile.
  @_s.JsonKey(name: 'networkProfile')
  final NetworkProfile networkProfile;

  GetNetworkProfileResult({
    this.networkProfile,
  });
  factory GetNetworkProfileResult.fromJson(Map<String, dynamic> json) =>
      _$GetNetworkProfileResultFromJson(json);
}

/// Returns the status result for a device offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOfferingStatusResult {
  /// When specified, gets the offering status for the current period.
  @_s.JsonKey(name: 'current')
  final Map<String, OfferingStatus> current;

  /// When specified, gets the offering status for the next period.
  @_s.JsonKey(name: 'nextPeriod')
  final Map<String, OfferingStatus> nextPeriod;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetOfferingStatusResult({
    this.current,
    this.nextPeriod,
    this.nextToken,
  });
  factory GetOfferingStatusResult.fromJson(Map<String, dynamic> json) =>
      _$GetOfferingStatusResultFromJson(json);
}

/// Represents the result of a get project request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProjectResult {
  /// The project to get information about.
  @_s.JsonKey(name: 'project')
  final Project project;

  GetProjectResult({
    this.project,
  });
  factory GetProjectResult.fromJson(Map<String, dynamic> json) =>
      _$GetProjectResultFromJson(json);
}

/// Represents the response from the server that lists detailed information
/// about the remote access session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRemoteAccessSessionResult {
  /// A container that lists detailed information about the remote access session.
  @_s.JsonKey(name: 'remoteAccessSession')
  final RemoteAccessSession remoteAccessSession;

  GetRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  factory GetRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) =>
      _$GetRemoteAccessSessionResultFromJson(json);
}

/// Represents the result of a get run request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRunResult {
  /// The run to get results from.
  @_s.JsonKey(name: 'run')
  final Run run;

  GetRunResult({
    this.run,
  });
  factory GetRunResult.fromJson(Map<String, dynamic> json) =>
      _$GetRunResultFromJson(json);
}

/// Represents the result of a get suite request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSuiteResult {
  /// A collection of one or more tests.
  @_s.JsonKey(name: 'suite')
  final Suite suite;

  GetSuiteResult({
    this.suite,
  });
  factory GetSuiteResult.fromJson(Map<String, dynamic> json) =>
      _$GetSuiteResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTestGridProjectResult {
  /// A <a>TestGridProject</a>.
  @_s.JsonKey(name: 'testGridProject')
  final TestGridProject testGridProject;

  GetTestGridProjectResult({
    this.testGridProject,
  });
  factory GetTestGridProjectResult.fromJson(Map<String, dynamic> json) =>
      _$GetTestGridProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTestGridSessionResult {
  /// The <a>TestGridSession</a> that was requested.
  @_s.JsonKey(name: 'testGridSession')
  final TestGridSession testGridSession;

  GetTestGridSessionResult({
    this.testGridSession,
  });
  factory GetTestGridSessionResult.fromJson(Map<String, dynamic> json) =>
      _$GetTestGridSessionResultFromJson(json);
}

/// Represents the result of a get test request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTestResult {
  /// A test condition that is evaluated.
  @_s.JsonKey(name: 'test')
  final Test test;

  GetTestResult({
    this.test,
  });
  factory GetTestResult.fromJson(Map<String, dynamic> json) =>
      _$GetTestResultFromJson(json);
}

/// Represents the result of a get upload request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUploadResult {
  /// An app or a set of one or more tests to upload or that have been uploaded.
  @_s.JsonKey(name: 'upload')
  final Upload upload;

  GetUploadResult({
    this.upload,
  });
  factory GetUploadResult.fromJson(Map<String, dynamic> json) =>
      _$GetUploadResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  @_s.JsonKey(name: 'vpceConfiguration')
  final VPCEConfiguration vpceConfiguration;

  GetVPCEConfigurationResult({
    this.vpceConfiguration,
  });
  factory GetVPCEConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$GetVPCEConfigurationResultFromJson(json);
}

/// Represents information about incompatibility.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IncompatibilityMessage {
  /// A message about the incompatibility.
  @_s.JsonKey(name: 'message')
  final String message;

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
  @_s.JsonKey(name: 'type')
  final DeviceAttribute type;

  IncompatibilityMessage({
    this.message,
    this.type,
  });
  factory IncompatibilityMessage.fromJson(Map<String, dynamic> json) =>
      _$IncompatibilityMessageFromJson(json);
}

/// Represents the response from the server after AWS Device Farm makes a
/// request to install to a remote access session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstallToRemoteAccessSessionResult {
  /// An app to upload or that has been uploaded.
  @_s.JsonKey(name: 'appUpload')
  final Upload appUpload;

  InstallToRemoteAccessSessionResult({
    this.appUpload,
  });
  factory InstallToRemoteAccessSessionResult.fromJson(
          Map<String, dynamic> json) =>
      _$InstallToRemoteAccessSessionResultFromJson(json);
}

/// Represents the instance profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceProfile {
  /// The Amazon Resource Name (ARN) of the instance profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The description of the instance profile.
  @_s.JsonKey(name: 'description')
  final String description;

  /// An array of strings containing the list of app packages that should not be
  /// cleaned up from the device after a test run completes.
  ///
  /// The list of packages is considered only if you set
  /// <code>packageCleanup</code> to <code>true</code>.
  @_s.JsonKey(name: 'excludeAppPackagesFromCleanup')
  final List<String> excludeAppPackagesFromCleanup;

  /// The name of the instance profile.
  @_s.JsonKey(name: 'name')
  final String name;

  /// When set to <code>true</code>, Device Farm removes app packages after a test
  /// run. The default value is <code>false</code> for private devices.
  @_s.JsonKey(name: 'packageCleanup')
  final bool packageCleanup;

  /// When set to <code>true</code>, Device Farm reboots the instance after a test
  /// run. The default value is <code>true</code>.
  @_s.JsonKey(name: 'rebootAfterUse')
  final bool rebootAfterUse;

  InstanceProfile({
    this.arn,
    this.description,
    this.excludeAppPackagesFromCleanup,
    this.name,
    this.packageCleanup,
    this.rebootAfterUse,
  });
  factory InstanceProfile.fromJson(Map<String, dynamic> json) =>
      _$InstanceProfileFromJson(json);
}

enum InstanceStatus {
  @_s.JsonValue('IN_USE')
  inUse,
  @_s.JsonValue('PREPARING')
  preparing,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('NOT_AVAILABLE')
  notAvailable,
}

enum InteractionMode {
  @_s.JsonValue('INTERACTIVE')
  interactive,
  @_s.JsonValue('NO_VIDEO')
  noVideo,
  @_s.JsonValue('VIDEO_ONLY')
  videoOnly,
}

extension on InteractionMode {
  String toValue() {
    switch (this) {
      case InteractionMode.interactive:
        return 'INTERACTIVE';
      case InteractionMode.noVideo:
        return 'NO_VIDEO';
      case InteractionMode.videoOnly:
        return 'VIDEO_ONLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// The job's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The job's result counters.
  @_s.JsonKey(name: 'counters')
  final Counters counters;

  /// When the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// The device (phone or tablet).
  @_s.JsonKey(name: 'device')
  final Device device;

  /// Represents the total (metered or unmetered) minutes used by the job.
  @_s.JsonKey(name: 'deviceMinutes')
  final DeviceMinutes deviceMinutes;

  /// The ARN of the instance.
  @_s.JsonKey(name: 'instanceArn')
  final String instanceArn;

  /// A message about the job's result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The job's name.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// The job's start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

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
  @_s.JsonKey(name: 'status')
  final ExecutionStatus status;

  /// The job's stop time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopped')
  final DateTime stopped;

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
  @_s.JsonKey(name: 'type')
  final TestType type;

  /// This value is set to true if video capture is enabled. Otherwise, it is set
  /// to false.
  @_s.JsonKey(name: 'videoCapture')
  final bool videoCapture;

  /// The endpoint for streaming device video.
  @_s.JsonKey(name: 'videoEndpoint')
  final String videoEndpoint;

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
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// Represents the result of a list artifacts operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListArtifactsResult {
  /// Information about the artifacts.
  @_s.JsonKey(name: 'artifacts')
  final List<Artifact> artifacts;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListArtifactsResult({
    this.artifacts,
    this.nextToken,
  });
  factory ListArtifactsResult.fromJson(Map<String, dynamic> json) =>
      _$ListArtifactsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeviceInstancesResult {
  /// An object that contains information about your device instances.
  @_s.JsonKey(name: 'deviceInstances')
  final List<DeviceInstance> deviceInstances;

  /// An identifier that can be used in the next call to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeviceInstancesResult({
    this.deviceInstances,
    this.nextToken,
  });
  factory ListDeviceInstancesResult.fromJson(Map<String, dynamic> json) =>
      _$ListDeviceInstancesResultFromJson(json);
}

/// Represents the result of a list device pools request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevicePoolsResult {
  /// Information about the device pools.
  @_s.JsonKey(name: 'devicePools')
  final List<DevicePool> devicePools;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDevicePoolsResult({
    this.devicePools,
    this.nextToken,
  });
  factory ListDevicePoolsResult.fromJson(Map<String, dynamic> json) =>
      _$ListDevicePoolsResultFromJson(json);
}

/// Represents the result of a list devices operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevicesResult {
  /// Information about the devices.
  @_s.JsonKey(name: 'devices')
  final List<Device> devices;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDevicesResult({
    this.devices,
    this.nextToken,
  });
  factory ListDevicesResult.fromJson(Map<String, dynamic> json) =>
      _$ListDevicesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstanceProfilesResult {
  /// An object that contains information about your instance profiles.
  @_s.JsonKey(name: 'instanceProfiles')
  final List<InstanceProfile> instanceProfiles;

  /// An identifier that can be used in the next call to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInstanceProfilesResult({
    this.instanceProfiles,
    this.nextToken,
  });
  factory ListInstanceProfilesResult.fromJson(Map<String, dynamic> json) =>
      _$ListInstanceProfilesResultFromJson(json);
}

/// Represents the result of a list jobs request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResult {
  /// Information about the jobs.
  @_s.JsonKey(name: 'jobs')
  final List<Job> jobs;

  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResult({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResult.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNetworkProfilesResult {
  /// A list of the available network profiles.
  @_s.JsonKey(name: 'networkProfiles')
  final List<NetworkProfile> networkProfiles;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListNetworkProfilesResult({
    this.networkProfiles,
    this.nextToken,
  });
  factory ListNetworkProfilesResult.fromJson(Map<String, dynamic> json) =>
      _$ListNetworkProfilesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOfferingPromotionsResult {
  /// An identifier to be used in the next call to this operation, to return the
  /// next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the offering promotions.
  @_s.JsonKey(name: 'offeringPromotions')
  final List<OfferingPromotion> offeringPromotions;

  ListOfferingPromotionsResult({
    this.nextToken,
    this.offeringPromotions,
  });
  factory ListOfferingPromotionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListOfferingPromotionsResultFromJson(json);
}

/// Returns the transaction log of the specified offerings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOfferingTransactionsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The audit log of subscriptions you have purchased and modified through AWS
  /// Device Farm.
  @_s.JsonKey(name: 'offeringTransactions')
  final List<OfferingTransaction> offeringTransactions;

  ListOfferingTransactionsResult({
    this.nextToken,
    this.offeringTransactions,
  });
  factory ListOfferingTransactionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListOfferingTransactionsResultFromJson(json);
}

/// Represents the return values of the list of offerings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOfferingsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A value that represents the list offering results.
  @_s.JsonKey(name: 'offerings')
  final List<Offering> offerings;

  ListOfferingsResult({
    this.nextToken,
    this.offerings,
  });
  factory ListOfferingsResult.fromJson(Map<String, dynamic> json) =>
      _$ListOfferingsResultFromJson(json);
}

/// Represents the result of a list projects request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the projects.
  @_s.JsonKey(name: 'projects')
  final List<Project> projects;

  ListProjectsResult({
    this.nextToken,
    this.projects,
  });
  factory ListProjectsResult.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResultFromJson(json);
}

/// Represents the response from the server after AWS Device Farm makes a
/// request to return information about the remote access session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRemoteAccessSessionsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A container that represents the metadata from the service about each remote
  /// access session you are requesting.
  @_s.JsonKey(name: 'remoteAccessSessions')
  final List<RemoteAccessSession> remoteAccessSessions;

  ListRemoteAccessSessionsResult({
    this.nextToken,
    this.remoteAccessSessions,
  });
  factory ListRemoteAccessSessionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListRemoteAccessSessionsResultFromJson(json);
}

/// Represents the result of a list runs request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRunsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the runs.
  @_s.JsonKey(name: 'runs')
  final List<Run> runs;

  ListRunsResult({
    this.nextToken,
    this.runs,
  });
  factory ListRunsResult.fromJson(Map<String, dynamic> json) =>
      _$ListRunsResultFromJson(json);
}

/// Represents the result of a list samples request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSamplesResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the samples.
  @_s.JsonKey(name: 'samples')
  final List<Sample> samples;

  ListSamplesResult({
    this.nextToken,
    this.samples,
  });
  factory ListSamplesResult.fromJson(Map<String, dynamic> json) =>
      _$ListSamplesResultFromJson(json);
}

/// Represents the result of a list suites request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSuitesResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the suites.
  @_s.JsonKey(name: 'suites')
  final List<Suite> suites;

  ListSuitesResult({
    this.nextToken,
    this.suites,
  });
  factory ListSuitesResult.fromJson(Map<String, dynamic> json) =>
      _$ListSuitesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters. Tag values can
  /// have a maximum length of 256 characters.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
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
class ListTestGridProjectsResult {
  /// Used for pagination. Pass into <a>ListTestGridProjects</a> to get more
  /// results in a paginated request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of TestGridProjects, based on a <a>ListTestGridProjectsRequest</a>.
  @_s.JsonKey(name: 'testGridProjects')
  final List<TestGridProject> testGridProjects;

  ListTestGridProjectsResult({
    this.nextToken,
    this.testGridProjects,
  });
  factory ListTestGridProjectsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTestGridProjectsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTestGridSessionActionsResult {
  /// The action taken by the session.
  @_s.JsonKey(name: 'actions')
  final List<TestGridSessionAction> actions;

  /// Pagination token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTestGridSessionActionsResult({
    this.actions,
    this.nextToken,
  });
  factory ListTestGridSessionActionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$ListTestGridSessionActionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTestGridSessionArtifactsResult {
  /// A list of test grid session artifacts for a <a>TestGridSession</a>.
  @_s.JsonKey(name: 'artifacts')
  final List<TestGridSessionArtifact> artifacts;

  /// Pagination token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTestGridSessionArtifactsResult({
    this.artifacts,
    this.nextToken,
  });
  factory ListTestGridSessionArtifactsResult.fromJson(
          Map<String, dynamic> json) =>
      _$ListTestGridSessionArtifactsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTestGridSessionsResult {
  /// Pagination token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The sessions that match the criteria in a
  /// <a>ListTestGridSessionsRequest</a>.
  @_s.JsonKey(name: 'testGridSessions')
  final List<TestGridSession> testGridSessions;

  ListTestGridSessionsResult({
    this.nextToken,
    this.testGridSessions,
  });
  factory ListTestGridSessionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTestGridSessionsResultFromJson(json);
}

/// Represents the result of a list tests request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTestsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the tests.
  @_s.JsonKey(name: 'tests')
  final List<Test> tests;

  ListTestsResult({
    this.nextToken,
    this.tests,
  });
  factory ListTestsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTestsResultFromJson(json);
}

/// Represents the result of a list unique problems request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUniqueProblemsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

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
  @_s.JsonKey(name: 'uniqueProblems')
  final Map<ExecutionResult, List<UniqueProblem>> uniqueProblems;

  ListUniqueProblemsResult({
    this.nextToken,
    this.uniqueProblems,
  });
  factory ListUniqueProblemsResult.fromJson(Map<String, dynamic> json) =>
      _$ListUniqueProblemsResultFromJson(json);
}

/// Represents the result of a list uploads request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUploadsResult {
  /// If the number of items that are returned is significantly large, this is an
  /// identifier that is also returned. It can be used in a subsequent call to
  /// this operation to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the uploads.
  @_s.JsonKey(name: 'uploads')
  final List<Upload> uploads;

  ListUploadsResult({
    this.nextToken,
    this.uploads,
  });
  factory ListUploadsResult.fromJson(Map<String, dynamic> json) =>
      _$ListUploadsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVPCEConfigurationsResult {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of <code>VPCEConfiguration</code> objects that contain information
  /// about your VPC endpoint configuration.
  @_s.JsonKey(name: 'vpceConfigurations')
  final List<VPCEConfiguration> vpceConfigurations;

  ListVPCEConfigurationsResult({
    this.nextToken,
    this.vpceConfigurations,
  });
  factory ListVPCEConfigurationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListVPCEConfigurationsResultFromJson(json);
}

/// Represents a latitude and longitude pair, expressed in geographic coordinate
/// system degrees (for example, 47.6204, -122.3491).
///
/// Elevation is currently not supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Location {
  /// The latitude.
  @_s.JsonKey(name: 'latitude')
  final double latitude;

  /// The longitude.
  @_s.JsonKey(name: 'longitude')
  final double longitude;

  Location({
    @_s.required this.latitude,
    @_s.required this.longitude,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// A number that represents the monetary amount for an offering or transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonetaryAmount {
  /// The numerical amount of an offering or transaction.
  @_s.JsonKey(name: 'amount')
  final double amount;

  /// The currency code of a monetary amount. For example, <code>USD</code> means
  /// U.S. dollars.
  @_s.JsonKey(name: 'currencyCode')
  final CurrencyCode currencyCode;

  MonetaryAmount({
    this.amount,
    this.currencyCode,
  });
  factory MonetaryAmount.fromJson(Map<String, dynamic> json) =>
      _$MonetaryAmountFromJson(json);
}

/// An array of settings that describes characteristics of a network profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkProfile {
  /// The Amazon Resource Name (ARN) of the network profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The description of the network profile.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  @_s.JsonKey(name: 'downlinkBandwidthBits')
  final int downlinkBandwidthBits;

  /// Delay time for all packets to destination in milliseconds as an integer from
  /// 0 to 2000.
  @_s.JsonKey(name: 'downlinkDelayMs')
  final int downlinkDelayMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  @_s.JsonKey(name: 'downlinkJitterMs')
  final int downlinkJitterMs;

  /// Proportion of received packets that fail to arrive from 0 to 100 percent.
  @_s.JsonKey(name: 'downlinkLossPercent')
  final int downlinkLossPercent;

  /// The name of the network profile.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of network profile. Valid values are listed here.
  @_s.JsonKey(name: 'type')
  final NetworkProfileType type;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  @_s.JsonKey(name: 'uplinkBandwidthBits')
  final int uplinkBandwidthBits;

  /// Delay time for all packets to destination in milliseconds as an integer from
  /// 0 to 2000.
  @_s.JsonKey(name: 'uplinkDelayMs')
  final int uplinkDelayMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  @_s.JsonKey(name: 'uplinkJitterMs')
  final int uplinkJitterMs;

  /// Proportion of transmitted packets that fail to arrive from 0 to 100 percent.
  @_s.JsonKey(name: 'uplinkLossPercent')
  final int uplinkLossPercent;

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
  factory NetworkProfile.fromJson(Map<String, dynamic> json) =>
      _$NetworkProfileFromJson(json);
}

enum NetworkProfileType {
  @_s.JsonValue('CURATED')
  curated,
  @_s.JsonValue('PRIVATE')
  private,
}

extension on NetworkProfileType {
  String toValue() {
    switch (this) {
      case NetworkProfileType.curated:
        return 'CURATED';
      case NetworkProfileType.private:
        return 'PRIVATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the metadata of a device offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Offering {
  /// A string that describes the offering.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ID that corresponds to a device offering.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The platform of the device (for example, <code>ANDROID</code> or
  /// <code>IOS</code>).
  @_s.JsonKey(name: 'platform')
  final DevicePlatform platform;

  /// Specifies whether there are recurring charges for the offering.
  @_s.JsonKey(name: 'recurringCharges')
  final List<RecurringCharge> recurringCharges;

  /// The type of offering (for example, <code>RECURRING</code>) for a device.
  @_s.JsonKey(name: 'type')
  final OfferingType type;

  Offering({
    this.description,
    this.id,
    this.platform,
    this.recurringCharges,
    this.type,
  });
  factory Offering.fromJson(Map<String, dynamic> json) =>
      _$OfferingFromJson(json);
}

/// Represents information about an offering promotion.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OfferingPromotion {
  /// A string that describes the offering promotion.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ID of the offering promotion.
  @_s.JsonKey(name: 'id')
  final String id;

  OfferingPromotion({
    this.description,
    this.id,
  });
  factory OfferingPromotion.fromJson(Map<String, dynamic> json) =>
      _$OfferingPromotionFromJson(json);
}

/// The status of the offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OfferingStatus {
  /// The date on which the offering is effective.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'effectiveOn')
  final DateTime effectiveOn;

  /// Represents the metadata of an offering status.
  @_s.JsonKey(name: 'offering')
  final Offering offering;

  /// The number of available devices in the offering.
  @_s.JsonKey(name: 'quantity')
  final int quantity;

  /// The type specified for the offering status.
  @_s.JsonKey(name: 'type')
  final OfferingTransactionType type;

  OfferingStatus({
    this.effectiveOn,
    this.offering,
    this.quantity,
    this.type,
  });
  factory OfferingStatus.fromJson(Map<String, dynamic> json) =>
      _$OfferingStatusFromJson(json);
}

/// Represents the metadata of an offering transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OfferingTransaction {
  /// The cost of an offering transaction.
  @_s.JsonKey(name: 'cost')
  final MonetaryAmount cost;

  /// The date on which an offering transaction was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdOn')
  final DateTime createdOn;

  /// The ID that corresponds to a device offering promotion.
  @_s.JsonKey(name: 'offeringPromotionId')
  final String offeringPromotionId;

  /// The status of an offering transaction.
  @_s.JsonKey(name: 'offeringStatus')
  final OfferingStatus offeringStatus;

  /// The transaction ID of the offering transaction.
  @_s.JsonKey(name: 'transactionId')
  final String transactionId;

  OfferingTransaction({
    this.cost,
    this.createdOn,
    this.offeringPromotionId,
    this.offeringStatus,
    this.transactionId,
  });
  factory OfferingTransaction.fromJson(Map<String, dynamic> json) =>
      _$OfferingTransactionFromJson(json);
}

enum OfferingTransactionType {
  @_s.JsonValue('PURCHASE')
  purchase,
  @_s.JsonValue('RENEW')
  renew,
  @_s.JsonValue('SYSTEM')
  system,
}

enum OfferingType {
  @_s.JsonValue('RECURRING')
  recurring,
}

/// Represents a specific warning or failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Problem {
  /// Information about the associated device.
  @_s.JsonKey(name: 'device')
  final Device device;

  /// Information about the associated job.
  @_s.JsonKey(name: 'job')
  final ProblemDetail job;

  /// A message about the problem's result.
  @_s.JsonKey(name: 'message')
  final String message;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// Information about the associated run.
  @_s.JsonKey(name: 'run')
  final ProblemDetail run;

  /// Information about the associated suite.
  @_s.JsonKey(name: 'suite')
  final ProblemDetail suite;

  /// Information about the associated test.
  @_s.JsonKey(name: 'test')
  final ProblemDetail test;

  Problem({
    this.device,
    this.job,
    this.message,
    this.result,
    this.run,
    this.suite,
    this.test,
  });
  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}

/// Information about a problem detail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProblemDetail {
  /// The problem detail's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The problem detail's name.
  @_s.JsonKey(name: 'name')
  final String name;

  ProblemDetail({
    this.arn,
    this.name,
  });
  factory ProblemDetail.fromJson(Map<String, dynamic> json) =>
      _$ProblemDetailFromJson(json);
}

/// Represents an operating-system neutral workspace for running and managing
/// tests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Project {
  /// The project's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// The default number of minutes (at the project level) a test run executes
  /// before it times out. The default value is 150 minutes.
  @_s.JsonKey(name: 'defaultJobTimeoutMinutes')
  final int defaultJobTimeoutMinutes;

  /// The project's name.
  @_s.JsonKey(name: 'name')
  final String name;

  Project({
    this.arn,
    this.created,
    this.defaultJobTimeoutMinutes,
    this.name,
  });
  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

/// The result of the purchase offering (for example, success or failure).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PurchaseOfferingResult {
  /// Represents the offering transaction for the purchase result.
  @_s.JsonKey(name: 'offeringTransaction')
  final OfferingTransaction offeringTransaction;

  PurchaseOfferingResult({
    this.offeringTransaction,
  });
  factory PurchaseOfferingResult.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOfferingResultFromJson(json);
}

/// Represents the set of radios and their states on a device. Examples of
/// radios include Wi-Fi, GPS, Bluetooth, and NFC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Radios {
  /// True if Bluetooth is enabled at the beginning of the test. Otherwise, false.
  @_s.JsonKey(name: 'bluetooth')
  final bool bluetooth;

  /// True if GPS is enabled at the beginning of the test. Otherwise, false.
  @_s.JsonKey(name: 'gps')
  final bool gps;

  /// True if NFC is enabled at the beginning of the test. Otherwise, false.
  @_s.JsonKey(name: 'nfc')
  final bool nfc;

  /// True if Wi-Fi is enabled at the beginning of the test. Otherwise, false.
  @_s.JsonKey(name: 'wifi')
  final bool wifi;

  Radios({
    this.bluetooth,
    this.gps,
    this.nfc,
    this.wifi,
  });
  factory Radios.fromJson(Map<String, dynamic> json) => _$RadiosFromJson(json);

  Map<String, dynamic> toJson() => _$RadiosToJson(this);
}

/// Specifies whether charges for devices are recurring.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecurringCharge {
  /// The cost of the recurring charge.
  @_s.JsonKey(name: 'cost')
  final MonetaryAmount cost;

  /// The frequency in which charges recur.
  @_s.JsonKey(name: 'frequency')
  final RecurringChargeFrequency frequency;

  RecurringCharge({
    this.cost,
    this.frequency,
  });
  factory RecurringCharge.fromJson(Map<String, dynamic> json) =>
      _$RecurringChargeFromJson(json);
}

enum RecurringChargeFrequency {
  @_s.JsonValue('MONTHLY')
  monthly,
}

/// Represents information about the remote access session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoteAccessSession {
  /// The Amazon Resource Name (ARN) of the remote access session.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The billing method of the remote access session. Possible values include
  /// <code>METERED</code> or <code>UNMETERED</code>. For more information about
  /// metered devices, see <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html#welcome-terminology">AWS
  /// Device Farm terminology</a>.
  @_s.JsonKey(name: 'billingMethod')
  final BillingMethod billingMethod;

  /// Unique identifier of your client for the remote access session. Only
  /// returned if remote debugging is enabled for the remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The date and time the remote access session was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// The device (phone or tablet) used in the remote access session.
  @_s.JsonKey(name: 'device')
  final Device device;

  /// The number of minutes a device is used in a remote access session (including
  /// setup and teardown minutes).
  @_s.JsonKey(name: 'deviceMinutes')
  final DeviceMinutes deviceMinutes;

  /// Unique device identifier for the remote device. Only returned if remote
  /// debugging is enabled for the remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  @_s.JsonKey(name: 'deviceUdid')
  final String deviceUdid;

  /// The endpoint for the remote access sesssion.
  @_s.JsonKey(name: 'endpoint')
  final String endpoint;

  /// IP address of the EC2 host where you need to connect to remotely debug
  /// devices. Only returned if remote debugging is enabled for the remote access
  /// session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  @_s.JsonKey(name: 'hostAddress')
  final String hostAddress;

  /// The ARN of the instance.
  @_s.JsonKey(name: 'instanceArn')
  final String instanceArn;

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
  @_s.JsonKey(name: 'interactionMode')
  final InteractionMode interactionMode;

  /// A message about the remote access session.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The name of the remote access session.
  @_s.JsonKey(name: 'name')
  final String name;

  /// This flag is set to <code>true</code> if remote debugging is enabled for the
  /// remote access session.
  ///
  /// Remote debugging is <a
  /// href="https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html">no
  /// longer supported</a>.
  @_s.JsonKey(name: 'remoteDebugEnabled')
  final bool remoteDebugEnabled;

  /// The ARN for the app to be recorded in the remote access session.
  @_s.JsonKey(name: 'remoteRecordAppArn')
  final String remoteRecordAppArn;

  /// This flag is set to <code>true</code> if remote recording is enabled for the
  /// remote access session.
  @_s.JsonKey(name: 'remoteRecordEnabled')
  final bool remoteRecordEnabled;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="https://aws.amazon.com/device-farm/faq/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  @_s.JsonKey(name: 'skipAppResign')
  final bool skipAppResign;

  /// The date and time the remote access session was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

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
  @_s.JsonKey(name: 'status')
  final ExecutionStatus status;

  /// The date and time the remote access session was stopped.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopped')
  final DateTime stopped;

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
  });
  factory RemoteAccessSession.fromJson(Map<String, dynamic> json) =>
      _$RemoteAccessSessionFromJson(json);
}

/// The result of a renewal offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenewOfferingResult {
  /// Represents the status of the offering transaction for the renewal.
  @_s.JsonKey(name: 'offeringTransaction')
  final OfferingTransaction offeringTransaction;

  RenewOfferingResult({
    this.offeringTransaction,
  });
  factory RenewOfferingResult.fromJson(Map<String, dynamic> json) =>
      _$RenewOfferingResultFromJson(json);
}

/// Represents the screen resolution of a device in height and width, expressed
/// in pixels.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resolution {
  /// The screen resolution's height, expressed in pixels.
  @_s.JsonKey(name: 'height')
  final int height;

  /// The screen resolution's width, expressed in pixels.
  @_s.JsonKey(name: 'width')
  final int width;

  Resolution({
    this.height,
    this.width,
  });
  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}

/// Represents a condition for a device pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'attribute')
  final DeviceAttribute attribute;

  /// Specifies how Device Farm compares the rule's attribute to the value. For
  /// the operators that are supported by each attribute, see the attribute
  /// descriptions.
  @_s.JsonKey(name: 'operator')
  final RuleOperator operator;

  /// The rule's value.
  @_s.JsonKey(name: 'value')
  final String value;

  Rule({
    this.attribute,
    this.operator,
    this.value,
  });
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

enum RuleOperator {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('LESS_THAN_OR_EQUALS')
  lessThanOrEquals,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('GREATER_THAN_OR_EQUALS')
  greaterThanOrEquals,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('NOT_IN')
  notIn,
  @_s.JsonValue('CONTAINS')
  contains,
}

/// Represents a test run on a set of devices with a given app package, test
/// parameters, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Run {
  /// An app to upload or that has been uploaded.
  @_s.JsonKey(name: 'appUpload')
  final String appUpload;

  /// The run's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specifies the billing method for a test run: <code>metered</code> or
  /// <code>unmetered</code>. If the parameter is not specified, the default value
  /// is <code>metered</code>.
  /// <note>
  /// If you have unmetered device slots, you must set this to
  /// <code>unmetered</code> to use them. Otherwise, the run is counted toward
  /// metered device minutes.
  /// </note>
  @_s.JsonKey(name: 'billingMethod')
  final BillingMethod billingMethod;

  /// The total number of completed jobs.
  @_s.JsonKey(name: 'completedJobs')
  final int completedJobs;

  /// The run's result counters.
  @_s.JsonKey(name: 'counters')
  final Counters counters;

  /// When the run was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// Output <code>CustomerArtifactPaths</code> object for the test run.
  @_s.JsonKey(name: 'customerArtifactPaths')
  final CustomerArtifactPaths customerArtifactPaths;

  /// Represents the total (metered or unmetered) minutes used by the test run.
  @_s.JsonKey(name: 'deviceMinutes')
  final DeviceMinutes deviceMinutes;

  /// The ARN of the device pool for the run.
  @_s.JsonKey(name: 'devicePoolArn')
  final String devicePoolArn;

  /// The results of a device filter used to select the devices for a test run.
  @_s.JsonKey(name: 'deviceSelectionResult')
  final DeviceSelectionResult deviceSelectionResult;

  /// For fuzz tests, this is the number of events, between 1 and 10000, that the
  /// UI fuzz test should perform.
  @_s.JsonKey(name: 'eventCount')
  final int eventCount;

  /// The number of minutes the job executes before it times out.
  @_s.JsonKey(name: 'jobTimeoutMinutes')
  final int jobTimeoutMinutes;

  /// Information about the locale that is used for the run.
  @_s.JsonKey(name: 'locale')
  final String locale;

  /// Information about the location that is used for the run.
  @_s.JsonKey(name: 'location')
  final Location location;

  /// A message about the run's result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The run's name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The network profile being used for a test run.
  @_s.JsonKey(name: 'networkProfile')
  final NetworkProfile networkProfile;

  /// Read-only URL for an object in an S3 bucket where you can get the parsing
  /// results of the test package. If the test package doesn't parse, the reason
  /// why it doesn't parse appears in the file that this URL points to.
  @_s.JsonKey(name: 'parsingResultUrl')
  final String parsingResultUrl;

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
  @_s.JsonKey(name: 'platform')
  final DevicePlatform platform;

  /// Information about the radio states for the run.
  @_s.JsonKey(name: 'radios')
  final Radios radios;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// Supporting field for the result field. Set only if <code>result</code> is
  /// <code>SKIPPED</code>. <code>PARSING_FAILED</code> if the result is skipped
  /// because of test package parsing failure.
  @_s.JsonKey(name: 'resultCode')
  final ExecutionResultCode resultCode;

  /// For fuzz tests, this is a seed to use for randomizing the UI fuzz test.
  /// Using the same seed value between tests ensures identical event sequences.
  @_s.JsonKey(name: 'seed')
  final int seed;

  /// When set to <code>true</code>, for private devices, Device Farm does not
  /// sign your app again. For public devices, Device Farm always signs your apps
  /// again.
  ///
  /// For more information about how Device Farm re-signs your apps, see <a
  /// href="https://aws.amazon.com/device-farm/faq/">Do you modify my app?</a> in
  /// the <i>AWS Device Farm FAQs</i>.
  @_s.JsonKey(name: 'skipAppResign')
  final bool skipAppResign;

  /// The run's start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

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
  @_s.JsonKey(name: 'status')
  final ExecutionStatus status;

  /// The run's stop time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopped')
  final DateTime stopped;

  /// The ARN of the YAML-formatted test specification for the run.
  @_s.JsonKey(name: 'testSpecArn')
  final String testSpecArn;

  /// The total number of jobs for the run.
  @_s.JsonKey(name: 'totalJobs')
  final int totalJobs;

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
  @_s.JsonKey(name: 'type')
  final TestType type;

  /// The Device Farm console URL for the recording of the run.
  @_s.JsonKey(name: 'webUrl')
  final String webUrl;

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
    this.webUrl,
  });
  factory Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);
}

/// Represents a sample of performance data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Sample {
  /// The sample's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

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
  @_s.JsonKey(name: 'type')
  final SampleType type;

  /// The presigned Amazon S3 URL that can be used with a GET request to download
  /// the sample's file.
  @_s.JsonKey(name: 'url')
  final String url;

  Sample({
    this.arn,
    this.type,
    this.url,
  });
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}

enum SampleType {
  @_s.JsonValue('CPU')
  cpu,
  @_s.JsonValue('MEMORY')
  memory,
  @_s.JsonValue('THREADS')
  threads,
  @_s.JsonValue('RX_RATE')
  rxRate,
  @_s.JsonValue('TX_RATE')
  txRate,
  @_s.JsonValue('RX')
  rx,
  @_s.JsonValue('TX')
  tx,
  @_s.JsonValue('NATIVE_FRAMES')
  nativeFrames,
  @_s.JsonValue('NATIVE_FPS')
  nativeFps,
  @_s.JsonValue('NATIVE_MIN_DRAWTIME')
  nativeMinDrawtime,
  @_s.JsonValue('NATIVE_AVG_DRAWTIME')
  nativeAvgDrawtime,
  @_s.JsonValue('NATIVE_MAX_DRAWTIME')
  nativeMaxDrawtime,
  @_s.JsonValue('OPENGL_FRAMES')
  openglFrames,
  @_s.JsonValue('OPENGL_FPS')
  openglFps,
  @_s.JsonValue('OPENGL_MIN_DRAWTIME')
  openglMinDrawtime,
  @_s.JsonValue('OPENGL_AVG_DRAWTIME')
  openglAvgDrawtime,
  @_s.JsonValue('OPENGL_MAX_DRAWTIME')
  openglMaxDrawtime,
}

/// Represents the settings for a run. Includes things like location, radio
/// states, auxiliary apps, and network profiles.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ScheduleRunConfiguration {
  /// A list of upload ARNs for app packages to be installed with your app.
  @_s.JsonKey(name: 'auxiliaryApps')
  final List<String> auxiliaryApps;

  /// Specifies the billing method for a test run: <code>metered</code> or
  /// <code>unmetered</code>. If the parameter is not specified, the default value
  /// is <code>metered</code>.
  /// <note>
  /// If you have purchased unmetered device slots, you must set this parameter to
  /// <code>unmetered</code> to make use of them. Otherwise, your run counts
  /// against your metered time.
  /// </note>
  @_s.JsonKey(name: 'billingMethod')
  final BillingMethod billingMethod;

  /// Input <code>CustomerArtifactPaths</code> object for the scheduled run
  /// configuration.
  @_s.JsonKey(name: 'customerArtifactPaths')
  final CustomerArtifactPaths customerArtifactPaths;

  /// The ARN of the extra data for the run. The extra data is a .zip file that
  /// AWS Device Farm extracts to external data for Android or the app's sandbox
  /// for iOS.
  @_s.JsonKey(name: 'extraDataPackageArn')
  final String extraDataPackageArn;

  /// Information about the locale that is used for the run.
  @_s.JsonKey(name: 'locale')
  final String locale;

  /// Information about the location that is used for the run.
  @_s.JsonKey(name: 'location')
  final Location location;

  /// Reserved for internal use.
  @_s.JsonKey(name: 'networkProfileArn')
  final String networkProfileArn;

  /// Information about the radio states for the run.
  @_s.JsonKey(name: 'radios')
  final Radios radios;

  /// An array of ARNs for your VPC endpoint configurations.
  @_s.JsonKey(name: 'vpceConfigurationArns')
  final List<String> vpceConfigurationArns;

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
  Map<String, dynamic> toJson() => _$ScheduleRunConfigurationToJson(this);
}

/// Represents the result of a schedule run request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduleRunResult {
  /// Information about the scheduled run.
  @_s.JsonKey(name: 'run')
  final Run run;

  ScheduleRunResult({
    this.run,
  });
  factory ScheduleRunResult.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRunResultFromJson(json);
}

/// Represents test settings. This data structure is passed in as the test
/// parameter to ScheduleRun. For an example of the JSON request syntax, see
/// <a>ScheduleRun</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'type')
  final TestType type;

  /// The test's filter.
  @_s.JsonKey(name: 'filter')
  final String filter;

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
  @_s.JsonKey(name: 'parameters')
  final Map<String, String> parameters;

  /// The ARN of the uploaded test to be run.
  @_s.JsonKey(name: 'testPackageArn')
  final String testPackageArn;

  /// The ARN of the YAML-formatted test specification.
  @_s.JsonKey(name: 'testSpecArn')
  final String testSpecArn;

  ScheduleRunTest({
    @_s.required this.type,
    this.filter,
    this.parameters,
    this.testPackageArn,
    this.testSpecArn,
  });
  Map<String, dynamic> toJson() => _$ScheduleRunTestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopJobResult {
  /// The job that was stopped.
  @_s.JsonKey(name: 'job')
  final Job job;

  StopJobResult({
    this.job,
  });
  factory StopJobResult.fromJson(Map<String, dynamic> json) =>
      _$StopJobResultFromJson(json);
}

/// Represents the response from the server that describes the remote access
/// session when AWS Device Farm stops the session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopRemoteAccessSessionResult {
  /// A container that represents the metadata from the service about the remote
  /// access session you are stopping.
  @_s.JsonKey(name: 'remoteAccessSession')
  final RemoteAccessSession remoteAccessSession;

  StopRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  factory StopRemoteAccessSessionResult.fromJson(Map<String, dynamic> json) =>
      _$StopRemoteAccessSessionResultFromJson(json);
}

/// Represents the results of your stop run attempt.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopRunResult {
  /// The run that was stopped.
  @_s.JsonKey(name: 'run')
  final Run run;

  StopRunResult({
    this.run,
  });
  factory StopRunResult.fromJson(Map<String, dynamic> json) =>
      _$StopRunResultFromJson(json);
}

/// Represents a collection of one or more tests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Suite {
  /// The suite's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The suite's result counters.
  @_s.JsonKey(name: 'counters')
  final Counters counters;

  /// When the suite was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// Represents the total (metered or unmetered) minutes used by the test suite.
  @_s.JsonKey(name: 'deviceMinutes')
  final DeviceMinutes deviceMinutes;

  /// A message about the suite's result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The suite's name.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// The suite's start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

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
  @_s.JsonKey(name: 'status')
  final ExecutionStatus status;

  /// The suite's stop time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopped')
  final DateTime stopped;

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
  @_s.JsonKey(name: 'type')
  final TestType type;

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
  factory Suite.fromJson(Map<String, dynamic> json) => _$SuiteFromJson(json);
}

/// The metadata that you apply to a resource to help you categorize and
/// organize it. Each tag consists of a key and an optional value, both of which
/// you define. Tag keys can have a maximum character length of 128 characters.
/// Tag values can have a maximum length of 256 characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// One part of a key-value pair that makes up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional part of a key-value pair that makes up a tag. A
  /// <code>value</code> acts as a descriptor in a tag category (key).
  @_s.JsonKey(name: 'Value')
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

/// Represents a condition that is evaluated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Test {
  /// The test's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The test's result counters.
  @_s.JsonKey(name: 'counters')
  final Counters counters;

  /// When the test was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// Represents the total (metered or unmetered) minutes used by the test.
  @_s.JsonKey(name: 'deviceMinutes')
  final DeviceMinutes deviceMinutes;

  /// A message about the test's result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The test's name.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'result')
  final ExecutionResult result;

  /// The test's start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

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
  @_s.JsonKey(name: 'status')
  final ExecutionStatus status;

  /// The test's stop time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopped')
  final DateTime stopped;

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
  @_s.JsonKey(name: 'type')
  final TestType type;

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
  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}

/// A Selenium testing project. Projects are used to collect and collate
/// sessions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestGridProject {
  /// The ARN for the project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// A human-readable description for the project.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A human-readable name for the project.
  @_s.JsonKey(name: 'name')
  final String name;

  TestGridProject({
    this.arn,
    this.created,
    this.description,
    this.name,
  });
  factory TestGridProject.fromJson(Map<String, dynamic> json) =>
      _$TestGridProjectFromJson(json);
}

/// A <a>TestGridSession</a> is a single instance of a browser launched from the
/// URL provided by a call to <a>CreateTestGridUrl</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestGridSession {
  /// The ARN of the session.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The number of billed minutes that were used for this session.
  @_s.JsonKey(name: 'billingMinutes')
  final double billingMinutes;

  /// The time that the session was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// The time the session ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ended')
  final DateTime ended;

  /// A JSON object of options and parameters passed to the Selenium WebDriver.
  @_s.JsonKey(name: 'seleniumProperties')
  final String seleniumProperties;

  /// The state of the session.
  @_s.JsonKey(name: 'status')
  final TestGridSessionStatus status;

  TestGridSession({
    this.arn,
    this.billingMinutes,
    this.created,
    this.ended,
    this.seleniumProperties,
    this.status,
  });
  factory TestGridSession.fromJson(Map<String, dynamic> json) =>
      _$TestGridSessionFromJson(json);
}

/// An action taken by a <a>TestGridSession</a> browser instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestGridSessionAction {
  /// The action taken by the session.
  @_s.JsonKey(name: 'action')
  final String action;

  /// The time, in milliseconds, that the action took to complete in the browser.
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// HTTP method that the browser used to make the request.
  @_s.JsonKey(name: 'requestMethod')
  final String requestMethod;

  /// The time that the session invoked the action.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'started')
  final DateTime started;

  /// HTTP status code returned to the browser when the action was taken.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  TestGridSessionAction({
    this.action,
    this.duration,
    this.requestMethod,
    this.started,
    this.statusCode,
  });
  factory TestGridSessionAction.fromJson(Map<String, dynamic> json) =>
      _$TestGridSessionActionFromJson(json);
}

/// Artifacts are video and other files that are produced in the process of
/// running a browser in an automated context.
/// <note>
/// Video elements might be broken up into multiple artifacts as they grow in
/// size during creation.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestGridSessionArtifact {
  /// The file name of the artifact.
  @_s.JsonKey(name: 'filename')
  final String filename;

  /// The kind of artifact.
  @_s.JsonKey(name: 'type')
  final TestGridSessionArtifactType type;

  /// A semi-stable URL to the content of the object.
  @_s.JsonKey(name: 'url')
  final String url;

  TestGridSessionArtifact({
    this.filename,
    this.type,
    this.url,
  });
  factory TestGridSessionArtifact.fromJson(Map<String, dynamic> json) =>
      _$TestGridSessionArtifactFromJson(json);
}

enum TestGridSessionArtifactCategory {
  @_s.JsonValue('VIDEO')
  video,
  @_s.JsonValue('LOG')
  log,
}

extension on TestGridSessionArtifactCategory {
  String toValue() {
    switch (this) {
      case TestGridSessionArtifactCategory.video:
        return 'VIDEO';
      case TestGridSessionArtifactCategory.log:
        return 'LOG';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TestGridSessionArtifactType {
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('VIDEO')
  video,
  @_s.JsonValue('SELENIUM_LOG')
  seleniumLog,
}

enum TestGridSessionStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CLOSED')
  closed,
  @_s.JsonValue('ERRORED')
  errored,
}

extension on TestGridSessionStatus {
  String toValue() {
    switch (this) {
      case TestGridSessionStatus.active:
        return 'ACTIVE';
      case TestGridSessionStatus.closed:
        return 'CLOSED';
      case TestGridSessionStatus.errored:
        return 'ERRORED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TestType {
  @_s.JsonValue('BUILTIN_FUZZ')
  builtinFuzz,
  @_s.JsonValue('BUILTIN_EXPLORER')
  builtinExplorer,
  @_s.JsonValue('WEB_PERFORMANCE_PROFILE')
  webPerformanceProfile,
  @_s.JsonValue('APPIUM_JAVA_JUNIT')
  appiumJavaJunit,
  @_s.JsonValue('APPIUM_JAVA_TESTNG')
  appiumJavaTestng,
  @_s.JsonValue('APPIUM_PYTHON')
  appiumPython,
  @_s.JsonValue('APPIUM_NODE')
  appiumNode,
  @_s.JsonValue('APPIUM_RUBY')
  appiumRuby,
  @_s.JsonValue('APPIUM_WEB_JAVA_JUNIT')
  appiumWebJavaJunit,
  @_s.JsonValue('APPIUM_WEB_JAVA_TESTNG')
  appiumWebJavaTestng,
  @_s.JsonValue('APPIUM_WEB_PYTHON')
  appiumWebPython,
  @_s.JsonValue('APPIUM_WEB_NODE')
  appiumWebNode,
  @_s.JsonValue('APPIUM_WEB_RUBY')
  appiumWebRuby,
  @_s.JsonValue('CALABASH')
  calabash,
  @_s.JsonValue('INSTRUMENTATION')
  instrumentation,
  @_s.JsonValue('UIAUTOMATION')
  uiautomation,
  @_s.JsonValue('UIAUTOMATOR')
  uiautomator,
  @_s.JsonValue('XCTEST')
  xctest,
  @_s.JsonValue('XCTEST_UI')
  xctestUi,
  @_s.JsonValue('REMOTE_ACCESS_RECORD')
  remoteAccessRecord,
  @_s.JsonValue('REMOTE_ACCESS_REPLAY')
  remoteAccessReplay,
}

extension on TestType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents information about free trial device minutes for an AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialMinutes {
  /// The number of free trial minutes remaining in the account.
  @_s.JsonKey(name: 'remaining')
  final double remaining;

  /// The total number of free trial minutes that the account started with.
  @_s.JsonKey(name: 'total')
  final double total;

  TrialMinutes({
    this.remaining,
    this.total,
  });
  factory TrialMinutes.fromJson(Map<String, dynamic> json) =>
      _$TrialMinutesFromJson(json);
}

/// A collection of one or more problems, grouped by their result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UniqueProblem {
  /// A message about the unique problems' result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// Information about the problems.
  @_s.JsonKey(name: 'problems')
  final List<Problem> problems;

  UniqueProblem({
    this.message,
    this.problems,
  });
  factory UniqueProblem.fromJson(Map<String, dynamic> json) =>
      _$UniqueProblemFromJson(json);
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
class UpdateDeviceInstanceResult {
  /// An object that contains information about your device instance.
  @_s.JsonKey(name: 'deviceInstance')
  final DeviceInstance deviceInstance;

  UpdateDeviceInstanceResult({
    this.deviceInstance,
  });
  factory UpdateDeviceInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceInstanceResultFromJson(json);
}

/// Represents the result of an update device pool request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDevicePoolResult {
  /// The device pool you just updated.
  @_s.JsonKey(name: 'devicePool')
  final DevicePool devicePool;

  UpdateDevicePoolResult({
    this.devicePool,
  });
  factory UpdateDevicePoolResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDevicePoolResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInstanceProfileResult {
  /// An object that contains information about your instance profile.
  @_s.JsonKey(name: 'instanceProfile')
  final InstanceProfile instanceProfile;

  UpdateInstanceProfileResult({
    this.instanceProfile,
  });
  factory UpdateInstanceProfileResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateInstanceProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNetworkProfileResult {
  /// A list of the available network profiles.
  @_s.JsonKey(name: 'networkProfile')
  final NetworkProfile networkProfile;

  UpdateNetworkProfileResult({
    this.networkProfile,
  });
  factory UpdateNetworkProfileResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateNetworkProfileResultFromJson(json);
}

/// Represents the result of an update project request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResult {
  /// The project to update.
  @_s.JsonKey(name: 'project')
  final Project project;

  UpdateProjectResult({
    this.project,
  });
  factory UpdateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTestGridProjectResult {
  /// The project, including updated information.
  @_s.JsonKey(name: 'testGridProject')
  final TestGridProject testGridProject;

  UpdateTestGridProjectResult({
    this.testGridProject,
  });
  factory UpdateTestGridProjectResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateTestGridProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUploadResult {
  /// A test spec uploaded to Device Farm.
  @_s.JsonKey(name: 'upload')
  final Upload upload;

  UpdateUploadResult({
    this.upload,
  });
  factory UpdateUploadResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateUploadResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVPCEConfigurationResult {
  /// An object that contains information about your VPC endpoint configuration.
  @_s.JsonKey(name: 'vpceConfiguration')
  final VPCEConfiguration vpceConfiguration;

  UpdateVPCEConfigurationResult({
    this.vpceConfiguration,
  });
  factory UpdateVPCEConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateVPCEConfigurationResultFromJson(json);
}

/// An app or a set of one or more tests to upload or that have been uploaded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Upload {
  /// The upload's ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

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
  @_s.JsonKey(name: 'category')
  final UploadCategory category;

  /// The upload's content type (for example,
  /// <code>application/octet-stream</code>).
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// When the upload was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// A message about the upload's result.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The upload's metadata. For example, for Android, this contains information
  /// that is parsed from the manifest and is displayed in the AWS Device Farm
  /// console after the associated app is uploaded.
  @_s.JsonKey(name: 'metadata')
  final String metadata;

  /// The upload's file name.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final UploadStatus status;

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
  @_s.JsonKey(name: 'type')
  final UploadType type;

  /// The presigned Amazon S3 URL that was used to store a file using a PUT
  /// request.
  @_s.JsonKey(name: 'url')
  final String url;

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
  factory Upload.fromJson(Map<String, dynamic> json) => _$UploadFromJson(json);
}

enum UploadCategory {
  @_s.JsonValue('CURATED')
  curated,
  @_s.JsonValue('PRIVATE')
  private,
}

enum UploadStatus {
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

enum UploadType {
  @_s.JsonValue('ANDROID_APP')
  androidApp,
  @_s.JsonValue('IOS_APP')
  iosApp,
  @_s.JsonValue('WEB_APP')
  webApp,
  @_s.JsonValue('EXTERNAL_DATA')
  externalData,
  @_s.JsonValue('APPIUM_JAVA_JUNIT_TEST_PACKAGE')
  appiumJavaJunitTestPackage,
  @_s.JsonValue('APPIUM_JAVA_TESTNG_TEST_PACKAGE')
  appiumJavaTestngTestPackage,
  @_s.JsonValue('APPIUM_PYTHON_TEST_PACKAGE')
  appiumPythonTestPackage,
  @_s.JsonValue('APPIUM_NODE_TEST_PACKAGE')
  appiumNodeTestPackage,
  @_s.JsonValue('APPIUM_RUBY_TEST_PACKAGE')
  appiumRubyTestPackage,
  @_s.JsonValue('APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE')
  appiumWebJavaJunitTestPackage,
  @_s.JsonValue('APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE')
  appiumWebJavaTestngTestPackage,
  @_s.JsonValue('APPIUM_WEB_PYTHON_TEST_PACKAGE')
  appiumWebPythonTestPackage,
  @_s.JsonValue('APPIUM_WEB_NODE_TEST_PACKAGE')
  appiumWebNodeTestPackage,
  @_s.JsonValue('APPIUM_WEB_RUBY_TEST_PACKAGE')
  appiumWebRubyTestPackage,
  @_s.JsonValue('CALABASH_TEST_PACKAGE')
  calabashTestPackage,
  @_s.JsonValue('INSTRUMENTATION_TEST_PACKAGE')
  instrumentationTestPackage,
  @_s.JsonValue('UIAUTOMATION_TEST_PACKAGE')
  uiautomationTestPackage,
  @_s.JsonValue('UIAUTOMATOR_TEST_PACKAGE')
  uiautomatorTestPackage,
  @_s.JsonValue('XCTEST_TEST_PACKAGE')
  xctestTestPackage,
  @_s.JsonValue('XCTEST_UI_TEST_PACKAGE')
  xctestUiTestPackage,
  @_s.JsonValue('APPIUM_JAVA_JUNIT_TEST_SPEC')
  appiumJavaJunitTestSpec,
  @_s.JsonValue('APPIUM_JAVA_TESTNG_TEST_SPEC')
  appiumJavaTestngTestSpec,
  @_s.JsonValue('APPIUM_PYTHON_TEST_SPEC')
  appiumPythonTestSpec,
  @_s.JsonValue('APPIUM_NODE_TEST_SPEC')
  appiumNodeTestSpec,
  @_s.JsonValue('APPIUM_RUBY_TEST_SPEC')
  appiumRubyTestSpec,
  @_s.JsonValue('APPIUM_WEB_JAVA_JUNIT_TEST_SPEC')
  appiumWebJavaJunitTestSpec,
  @_s.JsonValue('APPIUM_WEB_JAVA_TESTNG_TEST_SPEC')
  appiumWebJavaTestngTestSpec,
  @_s.JsonValue('APPIUM_WEB_PYTHON_TEST_SPEC')
  appiumWebPythonTestSpec,
  @_s.JsonValue('APPIUM_WEB_NODE_TEST_SPEC')
  appiumWebNodeTestSpec,
  @_s.JsonValue('APPIUM_WEB_RUBY_TEST_SPEC')
  appiumWebRubyTestSpec,
  @_s.JsonValue('INSTRUMENTATION_TEST_SPEC')
  instrumentationTestSpec,
  @_s.JsonValue('XCTEST_UI_TEST_SPEC')
  xctestUiTestSpec,
}

extension on UploadType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents an Amazon Virtual Private Cloud (VPC) endpoint configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VPCEConfiguration {
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The DNS name that maps to the private IP address of the service you want to
  /// access.
  @_s.JsonKey(name: 'serviceDnsName')
  final String serviceDnsName;

  /// An optional description that provides details about your VPC endpoint
  /// configuration.
  @_s.JsonKey(name: 'vpceConfigurationDescription')
  final String vpceConfigurationDescription;

  /// The friendly name you give to your VPC endpoint configuration to manage your
  /// configurations more easily.
  @_s.JsonKey(name: 'vpceConfigurationName')
  final String vpceConfigurationName;

  /// The name of the VPC endpoint service running in your AWS account that you
  /// want Device Farm to test.
  @_s.JsonKey(name: 'vpceServiceName')
  final String vpceServiceName;

  VPCEConfiguration({
    this.arn,
    this.serviceDnsName,
    this.vpceConfigurationDescription,
    this.vpceConfigurationName,
    this.vpceServiceName,
  });
  factory VPCEConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VPCEConfigurationFromJson(json);
}

class ArgumentException extends _s.GenericAwsException {
  ArgumentException({String type, String message})
      : super(type: type, code: 'ArgumentException', message: message);
}

class CannotDeleteException extends _s.GenericAwsException {
  CannotDeleteException({String type, String message})
      : super(type: type, code: 'CannotDeleteException', message: message);
}

class IdempotencyException extends _s.GenericAwsException {
  IdempotencyException({String type, String message})
      : super(type: type, code: 'IdempotencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotEligibleException extends _s.GenericAwsException {
  NotEligibleException({String type, String message})
      : super(type: type, code: 'NotEligibleException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceAccountException extends _s.GenericAwsException {
  ServiceAccountException({String type, String message})
      : super(type: type, code: 'ServiceAccountException', message: message);
}

class TagOperationException extends _s.GenericAwsException {
  TagOperationException({String type, String message})
      : super(type: type, code: 'TagOperationException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String type, String message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
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
