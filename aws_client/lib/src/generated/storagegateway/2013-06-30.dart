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

part '2013-06-30.g.dart';

/// AWS Storage Gateway is the service that connects an on-premises software
/// appliance with cloud-based storage to provide seamless and secure
/// integration between an organization's on-premises IT environment and the AWS
/// storage infrastructure. The service enables you to securely upload data to
/// the AWS Cloud for cost effective backup and rapid disaster recovery.
class StorageGateway {
  final _s.JsonProtocol _protocol;
  StorageGateway({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'storagegateway',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Activates the gateway you previously deployed on your host. In the
  /// activation process, you specify information such as the AWS Region that
  /// you want to use for storing snapshots or tapes, the time zone for
  /// scheduled snapshots the gateway snapshot schedule window, an activation
  /// key, and a name for your gateway. The activation process also associates
  /// your gateway with your account. For more information, see
  /// <a>UpdateGatewayInformation</a>.
  /// <note>
  /// You must turn on the gateway VM before you can activate your gateway.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [activationKey] :
  /// Your gateway activation key. You can obtain the activation key by sending
  /// an HTTP GET request with redirects enabled to the gateway IP address (port
  /// 80). The redirect URL returned in the response provides you the activation
  /// key for your gateway in the query string parameter
  /// <code>activationKey</code>. It may also include other activation-related
  /// parameters, however, these are merely defaults -- the arguments you pass
  /// to the <code>ActivateGateway</code> API call determine the actual
  /// configuration of your gateway.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/get-activation-key.html">Getting
  /// activation key</a> in the <i>AWS Storage Gateway User Guide</i>.
  ///
  /// Parameter [gatewayName] :
  /// The name you configured for your gateway.
  ///
  /// Parameter [gatewayRegion] :
  /// A value that indicates the AWS Region where you want to store your data.
  /// The gateway AWS Region specified must be the same AWS Region as the AWS
  /// Region in your <code>Host</code> header in the request. For more
  /// information about available AWS Regions and endpoints for AWS Storage
  /// Gateway, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/sg.html">AWS Storage
  /// Gateway endpoints and quotas</a> in the <i>AWS General Reference</i>.
  ///
  /// Valid Values: See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/sg.html">AWS Storage
  /// Gateway endpoints and quotas</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [gatewayTimezone] :
  /// A value that indicates the time zone you want to set for the gateway. The
  /// time zone is of the format "GMT-hr:mm" or "GMT+hr:mm". For example,
  /// GMT-4:00 indicates the time is 4 hours behind GMT. GMT+2:00 indicates the
  /// time is 2 hours ahead of GMT. The time zone is used, for example, for
  /// scheduling snapshots and your gateway's maintenance schedule.
  ///
  /// Parameter [gatewayType] :
  /// A value that defines the type of gateway to activate. The type specified
  /// is critical to all later functions of the gateway and cannot be changed
  /// after activation. The default value is <code>CACHED</code>.
  ///
  /// Valid Values: <code>STORED</code> | <code>CACHED</code> | <code>VTL</code>
  /// | <code>FILE_S3</code>
  ///
  /// Parameter [mediumChangerType] :
  /// The value that indicates the type of medium changer to use for tape
  /// gateway. This field is optional.
  ///
  /// Valid Values: <code>STK-L700</code> | <code>AWS-Gateway-VTL</code> |
  /// <code>IBM-03584L32-0402</code>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that you can assign to the gateway. Each tag is a
  /// key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers that
  /// can be represented in UTF-8 format, and the following special characters:
  /// + - = . _ : / @. The maximum length of a tag's key is 128 characters, and
  /// the maximum length for a tag's value is 256 characters.
  /// </note>
  ///
  /// Parameter [tapeDriveType] :
  /// The value that indicates the type of tape drive to use for tape gateway.
  /// This field is optional.
  ///
  /// Valid Values: <code>IBM-ULT3580-TD5</code>
  Future<ActivateGatewayOutput> activateGateway({
    @_s.required String activationKey,
    @_s.required String gatewayName,
    @_s.required String gatewayRegion,
    @_s.required String gatewayTimezone,
    String gatewayType,
    String mediumChangerType,
    List<Tag> tags,
    String tapeDriveType,
  }) async {
    ArgumentError.checkNotNull(activationKey, 'activationKey');
    _s.validateStringLength(
      'activationKey',
      activationKey,
      1,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayName, 'gatewayName');
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      2,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayName',
      gatewayName,
      r'''^[ -\.0-\[\]-~]*[!-\.0-\[\]-~][ -\.0-\[\]-~]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayRegion, 'gatewayRegion');
    _s.validateStringLength(
      'gatewayRegion',
      gatewayRegion,
      1,
      25,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayTimezone, 'gatewayTimezone');
    _s.validateStringLength(
      'gatewayTimezone',
      gatewayTimezone,
      3,
      10,
      isRequired: true,
    );
    _s.validateStringLength(
      'gatewayType',
      gatewayType,
      2,
      20,
    );
    _s.validateStringLength(
      'mediumChangerType',
      mediumChangerType,
      2,
      50,
    );
    _s.validateStringLength(
      'tapeDriveType',
      tapeDriveType,
      2,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ActivateGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ActivationKey': activationKey,
        'GatewayName': gatewayName,
        'GatewayRegion': gatewayRegion,
        'GatewayTimezone': gatewayTimezone,
        if (gatewayType != null) 'GatewayType': gatewayType,
        if (mediumChangerType != null) 'MediumChangerType': mediumChangerType,
        if (tags != null) 'Tags': tags,
        if (tapeDriveType != null) 'TapeDriveType': tapeDriveType,
      },
    );

    return ActivateGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Configures one or more gateway local disks as cache for a gateway. This
  /// operation is only supported in the cached volume, tape, and file gateway
  /// type (see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html">How
  /// AWS Storage Gateway works (architecture)</a>.
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add cache, and one or more disk IDs that you want to
  /// configure as cache.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [diskIds] :
  /// An array of strings that identify disks that are to be configured as
  /// working storage. Each string has a minimum length of 1 and maximum length
  /// of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.
  Future<AddCacheOutput> addCache({
    @_s.required List<String> diskIds,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(diskIds, 'diskIds');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AddCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiskIds': diskIds,
        'GatewayARN': gatewayARN,
      },
    );

    return AddCacheOutput.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to the specified resource. You use tags to add
  /// metadata to resources, which you can use to categorize these resources.
  /// For example, you can categorize resources by purpose, owner, environment,
  /// or team. Each tag consists of a key and a value, which you define. You can
  /// add tags to the following AWS Storage Gateway resources:
  ///
  /// <ul>
  /// <li>
  /// Storage gateways of all types
  /// </li>
  /// <li>
  /// Storage volumes
  /// </li>
  /// <li>
  /// Virtual tapes
  /// </li>
  /// <li>
  /// NFS and SMB file shares
  /// </li>
  /// </ul>
  /// You can create a maximum of 50 tags for each resource. Virtual tapes and
  /// storage volumes that are recovered to a new gateway maintain their tags.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag you want to add to the
  /// resource. The value can be an empty string.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<AddTagsToResourceOutput> addTagsToResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AddTagsToResource'
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

    return AddTagsToResourceOutput.fromJson(jsonResponse.body);
  }

  /// Configures one or more gateway local disks as upload buffer for a
  /// specified gateway. This operation is supported for the stored volume,
  /// cached volume and tape gateway types.
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add upload buffer, and one or more disk IDs that you
  /// want to configure as upload buffer.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [diskIds] :
  /// An array of strings that identify disks that are to be configured as
  /// working storage. Each string has a minimum length of 1 and maximum length
  /// of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.
  Future<AddUploadBufferOutput> addUploadBuffer({
    @_s.required List<String> diskIds,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(diskIds, 'diskIds');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AddUploadBuffer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiskIds': diskIds,
        'GatewayARN': gatewayARN,
      },
    );

    return AddUploadBufferOutput.fromJson(jsonResponse.body);
  }

  /// Configures one or more gateway local disks as working storage for a
  /// gateway. This operation is only supported in the stored volume gateway
  /// type. This operation is deprecated in cached volume API version 20120630.
  /// Use <a>AddUploadBuffer</a> instead.
  /// <note>
  /// Working storage is also referred to as upload buffer. You can also use the
  /// <a>AddUploadBuffer</a> operation to add upload buffer to a stored volume
  /// gateway.
  /// </note>
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add working storage, and one or more disk IDs that you
  /// want to configure as working storage.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [diskIds] :
  /// An array of strings that identify disks that are to be configured as
  /// working storage. Each string has a minimum length of 1 and maximum length
  /// of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.
  Future<AddWorkingStorageOutput> addWorkingStorage({
    @_s.required List<String> diskIds,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(diskIds, 'diskIds');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AddWorkingStorage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiskIds': diskIds,
        'GatewayARN': gatewayARN,
      },
    );

    return AddWorkingStorageOutput.fromJson(jsonResponse.body);
  }

  /// Assigns a tape to a tape pool for archiving. The tape assigned to a pool
  /// is archived in the S3 storage class that is associated with the pool. When
  /// you use your backup application to eject the tape, the tape is archived
  /// directly into the S3 storage class (S3 Glacier or S3 Glacier Deep Archive)
  /// that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [poolId] :
  /// The ID of the pool that you want to add your tape to for archiving. The
  /// tape in this pool is archived in the S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (S3 Glacier or S3 Glacier
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  ///
  /// Parameter [tapeARN] :
  /// The unique Amazon Resource Name (ARN) of the virtual tape that you want to
  /// add to the tape pool.
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Set permissions to bypass governance retention. If the lock type of the
  /// archived tape is <code>Governance</code>, the tape's archived age is not
  /// older than <code>RetentionLockInDays</code>, and the user does not already
  /// have <code>BypassGovernanceRetention</code>, setting this to TRUE enables
  /// the user to bypass the retention lock. This parameter is set to true by
  /// default for calls from the console.
  ///
  /// Valid values: <code>TRUE</code> | <code>FALSE</code>
  Future<AssignTapePoolOutput> assignTapePool({
    @_s.required String poolId,
    @_s.required String tapeARN,
    bool bypassGovernanceRetention,
  }) async {
    ArgumentError.checkNotNull(poolId, 'poolId');
    _s.validateStringLength(
      'poolId',
      poolId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AssignTapePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolId': poolId,
        'TapeARN': tapeARN,
        if (bypassGovernanceRetention != null)
          'BypassGovernanceRetention': bypassGovernanceRetention,
      },
    );

    return AssignTapePoolOutput.fromJson(jsonResponse.body);
  }

  /// Connects a volume to an iSCSI connection and then attaches the volume to
  /// the specified gateway. Detaching and attaching a volume enables you to
  /// recover your data from one gateway to a different gateway without creating
  /// a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the gateway that you want to attach the
  /// volume to.
  ///
  /// Parameter [networkInterfaceId] :
  /// The network interface of the gateway on which to expose the iSCSI target.
  /// Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to
  /// get a list of the network interfaces available on a gateway.
  ///
  /// Valid Values: A valid IP address.
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume to attach to the specified
  /// gateway.
  ///
  /// Parameter [diskId] :
  /// The unique device ID or other distinguishing data that identifies the
  /// local disk used to create the volume. This value is only required when you
  /// are attaching a stored volume.
  ///
  /// Parameter [targetName] :
  /// The name of the iSCSI target used by an initiator to connect to a volume
  /// and used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  Future<AttachVolumeOutput> attachVolume({
    @_s.required String gatewayARN,
    @_s.required String networkInterfaceId,
    @_s.required String volumeARN,
    String diskId,
    String targetName,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkInterfaceId, 'networkInterfaceId');
    _s.validateStringPattern(
      'networkInterfaceId',
      networkInterfaceId,
      r'''\A(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}\z''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'diskId',
      diskId,
      1,
      300,
    );
    _s.validateStringLength(
      'targetName',
      targetName,
      1,
      200,
    );
    _s.validateStringPattern(
      'targetName',
      targetName,
      r'''^[-\.;a-z0-9]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AttachVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'NetworkInterfaceId': networkInterfaceId,
        'VolumeARN': volumeARN,
        if (diskId != null) 'DiskId': diskId,
        if (targetName != null) 'TargetName': targetName,
      },
    );

    return AttachVolumeOutput.fromJson(jsonResponse.body);
  }

  /// Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after
  /// the archiving process is initiated. This operation is only supported in
  /// the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape you want to cancel
  /// archiving for.
  Future<CancelArchivalOutput> cancelArchival({
    @_s.required String gatewayARN,
    @_s.required String tapeARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CancelArchival'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeARN': tapeARN,
      },
    );

    return CancelArchivalOutput.fromJson(jsonResponse.body);
  }

  /// Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a
  /// gateway after the retrieval process is initiated. The virtual tape is
  /// returned to the VTS. This operation is only supported in the tape gateway
  /// type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape you want to cancel
  /// retrieval for.
  Future<CancelRetrievalOutput> cancelRetrieval({
    @_s.required String gatewayARN,
    @_s.required String tapeARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CancelRetrieval'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeARN': tapeARN,
      },
    );

    return CancelRetrievalOutput.fromJson(jsonResponse.body);
  }

  /// Creates a cached volume on a specified cached volume gateway. This
  /// operation is only supported in the cached volume gateway type.
  /// <note>
  /// Cache storage must be allocated to the gateway before you can create a
  /// cached volume. Use the <a>AddCache</a> operation to add cache storage to a
  /// gateway.
  /// </note>
  /// In the request, you must specify the gateway, size of the volume in bytes,
  /// the iSCSI target name, an IP address on which to expose the target, and a
  /// unique client token. In response, the gateway creates the volume and
  /// returns information about it. This information includes the volume Amazon
  /// Resource Name (ARN), its size, and the iSCSI target ARN that initiators
  /// can use to connect to the volume target.
  ///
  /// Optionally, you can provide the ARN for an existing volume as the
  /// <code>SourceVolumeARN</code> for this cached volume, which creates an
  /// exact copy of the existing volume’s latest recovery point. The
  /// <code>VolumeSizeInBytes</code> value must be equal to or larger than the
  /// size of the copied volume, in bytes.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you use to retry a request. If you retry a
  /// request, use the same <code>ClientToken</code> you specified in the
  /// initial request.
  ///
  /// Parameter [networkInterfaceId] :
  /// The network interface of the gateway on which to expose the iSCSI target.
  /// Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to
  /// get a list of the network interfaces available on a gateway.
  ///
  /// Valid Values: A valid IP address.
  ///
  /// Parameter [targetName] :
  /// The name of the iSCSI target used by an initiator to connect to a volume
  /// and used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  ///
  /// Parameter [volumeSizeInBytes] :
  /// The size of the volume in bytes.
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [snapshotId] :
  /// The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the
  /// new cached volume. Specify this field if you want to create the iSCSI
  /// storage volume from a snapshot; otherwise, do not include this field. To
  /// list snapshots for your account use <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  ///
  /// Parameter [sourceVolumeARN] :
  /// The ARN for an existing volume. Specifying this ARN makes the new volume
  /// into an exact copy of the specified existing volume's latest recovery
  /// point. The <code>VolumeSizeInBytes</code> value for this new volume must
  /// be equal to or larger than the size of the existing volume, in bytes.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that you can assign to a cached volume. Each tag
  /// is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers that
  /// you can represent in UTF-8 format, and the following special characters: +
  /// - = . _ : / @. The maximum length of a tag's key is 128 characters, and
  /// the maximum length for a tag's value is 256 characters.
  /// </note>
  Future<CreateCachediSCSIVolumeOutput> createCachediSCSIVolume({
    @_s.required String clientToken,
    @_s.required String gatewayARN,
    @_s.required String networkInterfaceId,
    @_s.required String targetName,
    @_s.required int volumeSizeInBytes,
    bool kMSEncrypted,
    String kMSKey,
    String snapshotId,
    String sourceVolumeARN,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      5,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkInterfaceId, 'networkInterfaceId');
    _s.validateStringPattern(
      'networkInterfaceId',
      networkInterfaceId,
      r'''\A(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}\z''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetName, 'targetName');
    _s.validateStringLength(
      'targetName',
      targetName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetName',
      targetName,
      r'''^[-\.;a-z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(volumeSizeInBytes, 'volumeSizeInBytes');
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''\Asnap-([0-9A-Fa-f]{8}|[0-9A-Fa-f]{17})\z''',
    );
    _s.validateStringLength(
      'sourceVolumeARN',
      sourceVolumeARN,
      50,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateCachediSCSIVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'GatewayARN': gatewayARN,
        'NetworkInterfaceId': networkInterfaceId,
        'TargetName': targetName,
        'VolumeSizeInBytes': volumeSizeInBytes,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (snapshotId != null) 'SnapshotId': snapshotId,
        if (sourceVolumeARN != null) 'SourceVolumeARN': sourceVolumeARN,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateCachediSCSIVolumeOutput.fromJson(jsonResponse.body);
  }

  /// Creates a Network File System (NFS) file share on an existing file
  /// gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway exposes file shares
  /// using an NFS interface. This operation is only supported for file
  /// gateways.
  /// <important>
  /// File gateway requires AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure AWS STS is activated in
  /// the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in the AWS Region, activate it. For information about how to
  /// activate AWS STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  ///
  /// File gateway does not support creating hard or symbolic links on a file
  /// share.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique string value that you supply that is used by file gateway to
  /// ensure idempotent file share creation.
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the file gateway on which you want to
  /// create a file share.
  ///
  /// Parameter [locationARN] :
  /// The ARN of the backend storage used for storing file data. A prefix name
  /// can be added to the S3 bucket name. It must end with a "/".
  ///
  /// Parameter [role] :
  /// The ARN of the AWS Identity and Access Management (IAM) role that a file
  /// gateway assumes when it accesses the underlying storage.
  ///
  /// Parameter [cacheAttributes] :
  /// Refresh cache information.
  ///
  /// Parameter [clientList] :
  /// The list of clients that are allowed to access the file gateway. The list
  /// must contain either valid IP addresses or valid CIDR blocks.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  ///
  /// Parameter [guessMIMETypeEnabled] :
  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to <code>true</code> to enable MIME
  /// type guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [nFSFileShareDefaults] :
  /// File share default values. Optional.
  ///
  /// Parameter [notificationPolicy] :
  /// The notification policy of the file share.
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a file gateway puts objects into. The default value is
  /// <code>private</code>.
  ///
  /// Parameter [readOnly] :
  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [requesterPays] :
  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is
  /// the same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [squash] :
  /// A value that maps a user to anonymous user.
  ///
  /// Valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>RootSquash</code>: Only root is mapped to anonymous user.
  /// </li>
  /// <li>
  /// <code>NoSquash</code>: No one is mapped to anonymous user.
  /// </li>
  /// <li>
  /// <code>AllSquash</code>: Everyone is mapped to anonymous user.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to the NFS file share. Each
  /// tag is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<CreateNFSFileShareOutput> createNFSFileShare({
    @_s.required String clientToken,
    @_s.required String gatewayARN,
    @_s.required String locationARN,
    @_s.required String role,
    CacheAttributes cacheAttributes,
    List<String> clientList,
    String defaultStorageClass,
    String fileShareName,
    bool guessMIMETypeEnabled,
    bool kMSEncrypted,
    String kMSKey,
    NFSFileShareDefaults nFSFileShareDefaults,
    String notificationPolicy,
    ObjectACL objectACL,
    bool readOnly,
    bool requesterPays,
    String squash,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      5,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(locationARN, 'locationARN');
    _s.validateStringLength(
      'locationARN',
      locationARN,
      16,
      1400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''^arn:(aws|aws-cn|aws-us-gov):iam::([0-9]+):role/(\S+)$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultStorageClass',
      defaultStorageClass,
      5,
      50,
    );
    _s.validateStringLength(
      'fileShareName',
      fileShareName,
      1,
      255,
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'notificationPolicy',
      notificationPolicy,
      2,
      100,
    );
    _s.validateStringPattern(
      'notificationPolicy',
      notificationPolicy,
      r'''^\{[\w\s:\{\}\[\]"]*}$''',
    );
    _s.validateStringLength(
      'squash',
      squash,
      5,
      15,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateNFSFileShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'GatewayARN': gatewayARN,
        'LocationARN': locationARN,
        'Role': role,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (clientList != null) 'ClientList': clientList,
        if (defaultStorageClass != null)
          'DefaultStorageClass': defaultStorageClass,
        if (fileShareName != null) 'FileShareName': fileShareName,
        if (guessMIMETypeEnabled != null)
          'GuessMIMETypeEnabled': guessMIMETypeEnabled,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (nFSFileShareDefaults != null)
          'NFSFileShareDefaults': nFSFileShareDefaults,
        if (notificationPolicy != null)
          'NotificationPolicy': notificationPolicy,
        if (objectACL != null) 'ObjectACL': objectACL.toValue(),
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (squash != null) 'Squash': squash,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateNFSFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Creates a Server Message Block (SMB) file share on an existing file
  /// gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway exposes file shares
  /// using an SMB interface. This operation is only supported for file
  /// gateways.
  /// <important>
  /// File gateways require AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure that AWS STS is activated
  /// in the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in this AWS Region, activate it. For information about how to
  /// activate AWS STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique string value that you supply that is used by file gateway to
  /// ensure idempotent file share creation.
  ///
  /// Parameter [gatewayARN] :
  /// The ARN of the file gateway on which you want to create a file share.
  ///
  /// Parameter [locationARN] :
  /// The ARN of the backend storage used for storing file data. A prefix name
  /// can be added to the S3 bucket name. It must end with a "/".
  ///
  /// Parameter [role] :
  /// The ARN of the AWS Identity and Access Management (IAM) role that a file
  /// gateway assumes when it accesses the underlying storage.
  ///
  /// Parameter [accessBasedEnumeration] :
  /// The files and folders on this share will only be visible to users with
  /// read access.
  ///
  /// Parameter [adminUserList] :
  /// A list of users or groups in the Active Directory that will be granted
  /// administrator privileges on the file share. These users can do all file
  /// operations as the super-user. Acceptable formats include:
  /// <code>DOMAIN\User1</code>, <code>user1</code>, <code>@group1</code>, and
  /// <code>@DOMAIN\group1</code>.
  /// <important>
  /// Use this option very carefully, because any user in this list can do
  /// anything they like on the file share, regardless of file permissions.
  /// </important>
  ///
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  ///
  /// Parameter [authentication] :
  /// The authentication method that users use to access the file share. The
  /// default is <code>ActiveDirectory</code>.
  ///
  /// Valid Values: <code>ActiveDirectory</code> | <code>GuestAccess</code>
  ///
  /// Parameter [cacheAttributes] :
  /// Refresh cache information.
  ///
  /// Parameter [caseSensitivity] :
  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case
  /// sensitivity. The default value is <code>ClientSpecified</code>.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  ///
  /// Parameter [guessMIMETypeEnabled] :
  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to <code>true</code> to enable MIME
  /// type guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [invalidUserList] :
  /// A list of users or groups in the Active Directory that are not allowed to
  /// access the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [notificationPolicy] :
  /// The notification policy of the file share.
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a file gateway puts objects into. The default value is
  /// <code>private</code>.
  ///
  /// Parameter [readOnly] :
  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [requesterPays] :
  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is
  /// the same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [sMBACLEnabled] :
  /// Set this value to <code>true</code> to enable access control list (ACL) on
  /// the SMB file share. Set it to <code>false</code> to map file and directory
  /// permissions to the POSIX permissions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using
  /// Microsoft Windows ACLs to control access to an SMB file share</a> in the
  /// <i>AWS Storage Gateway User Guide</i>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to the NFS file share. Each
  /// tag is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  ///
  /// Parameter [validUserList] :
  /// A list of users or groups in the Active Directory that are allowed to
  /// access the file <a href=""/> share. A group must be prefixed with the @
  /// character. Acceptable formats include: <code>DOMAIN\User1</code>,
  /// <code>user1</code>, <code>@group1</code>, and <code>@DOMAIN\group1</code>.
  /// Can only be set if Authentication is set to <code>ActiveDirectory</code>.
  Future<CreateSMBFileShareOutput> createSMBFileShare({
    @_s.required String clientToken,
    @_s.required String gatewayARN,
    @_s.required String locationARN,
    @_s.required String role,
    bool accessBasedEnumeration,
    List<String> adminUserList,
    String auditDestinationARN,
    String authentication,
    CacheAttributes cacheAttributes,
    CaseSensitivity caseSensitivity,
    String defaultStorageClass,
    String fileShareName,
    bool guessMIMETypeEnabled,
    List<String> invalidUserList,
    bool kMSEncrypted,
    String kMSKey,
    String notificationPolicy,
    ObjectACL objectACL,
    bool readOnly,
    bool requesterPays,
    bool sMBACLEnabled,
    List<Tag> tags,
    List<String> validUserList,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      5,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(locationARN, 'locationARN');
    _s.validateStringLength(
      'locationARN',
      locationARN,
      16,
      1400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''^arn:(aws|aws-cn|aws-us-gov):iam::([0-9]+):role/(\S+)$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'auditDestinationARN',
      auditDestinationARN,
      0,
      1024,
    );
    _s.validateStringLength(
      'authentication',
      authentication,
      5,
      15,
    );
    _s.validateStringLength(
      'defaultStorageClass',
      defaultStorageClass,
      5,
      50,
    );
    _s.validateStringLength(
      'fileShareName',
      fileShareName,
      1,
      255,
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'notificationPolicy',
      notificationPolicy,
      2,
      100,
    );
    _s.validateStringPattern(
      'notificationPolicy',
      notificationPolicy,
      r'''^\{[\w\s:\{\}\[\]"]*}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateSMBFileShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'GatewayARN': gatewayARN,
        'LocationARN': locationARN,
        'Role': role,
        if (accessBasedEnumeration != null)
          'AccessBasedEnumeration': accessBasedEnumeration,
        if (adminUserList != null) 'AdminUserList': adminUserList,
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
        if (authentication != null) 'Authentication': authentication,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (caseSensitivity != null)
          'CaseSensitivity': caseSensitivity.toValue(),
        if (defaultStorageClass != null)
          'DefaultStorageClass': defaultStorageClass,
        if (fileShareName != null) 'FileShareName': fileShareName,
        if (guessMIMETypeEnabled != null)
          'GuessMIMETypeEnabled': guessMIMETypeEnabled,
        if (invalidUserList != null) 'InvalidUserList': invalidUserList,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (notificationPolicy != null)
          'NotificationPolicy': notificationPolicy,
        if (objectACL != null) 'ObjectACL': objectACL.toValue(),
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (sMBACLEnabled != null) 'SMBACLEnabled': sMBACLEnabled,
        if (tags != null) 'Tags': tags,
        if (validUserList != null) 'ValidUserList': validUserList,
      },
    );

    return CreateSMBFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Initiates a snapshot of a volume.
  ///
  /// AWS Storage Gateway provides the ability to back up point-in-time
  /// snapshots of your data to Amazon Simple Storage (Amazon S3) for durable
  /// off-site recovery, as well as import the data to an Amazon Elastic Block
  /// Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take
  /// snapshots of your gateway volume on a scheduled or ad hoc basis. This API
  /// enables you to take an ad hoc snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing
  /// a snapshot schedule</a>.
  ///
  /// In the <code>CreateSnapshot</code> request, you identify the volume by
  /// providing its Amazon Resource Name (ARN). You must also provide
  /// description for the snapshot. When AWS Storage Gateway takes the snapshot
  /// of specified volume, the snapshot and description appears in the AWS
  /// Storage Gateway console. In response, AWS Storage Gateway returns you a
  /// snapshot ID. You can use this snapshot ID to check the snapshot progress
  /// or later use it when you want to create a volume from a snapshot. This
  /// operation is only supported in stored and cached volume gateway type.
  /// <note>
  /// To list or delete a snapshot, you must use the Amazon EC2 API. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  /// </note> <important>
  /// Volume and snapshot IDs are changing to a longer length ID format. For
  /// more information, see the important note on the <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html">Welcome</a>
  /// page.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [snapshotDescription] :
  /// Textual description of the snapshot that appears in the Amazon EC2
  /// console, Elastic Block Store snapshots panel in the <b>Description</b>
  /// field, and in the AWS Storage Gateway snapshot <b>Details</b> pane,
  /// <b>Description</b> field.
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a snapshot. Each tag is a
  /// key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<CreateSnapshotOutput> createSnapshot({
    @_s.required String snapshotDescription,
    @_s.required String volumeARN,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(snapshotDescription, 'snapshotDescription');
    _s.validateStringLength(
      'snapshotDescription',
      snapshotDescription,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotDescription': snapshotDescription,
        'VolumeARN': volumeARN,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSnapshotOutput.fromJson(jsonResponse.body);
  }

  /// Initiates a snapshot of a gateway from a volume recovery point. This
  /// operation is only supported in the cached volume gateway type.
  ///
  /// A volume recovery point is a point in time at which all data of the volume
  /// is consistent and from which you can create a snapshot. To get a list of
  /// volume recovery point for cached volume gateway, use
  /// <a>ListVolumeRecoveryPoints</a>.
  ///
  /// In the <code>CreateSnapshotFromVolumeRecoveryPoint</code> request, you
  /// identify the volume by providing its Amazon Resource Name (ARN). You must
  /// also provide a description for the snapshot. When the gateway takes a
  /// snapshot of the specified volume, the snapshot and its description appear
  /// in the AWS Storage Gateway console. In response, the gateway returns you a
  /// snapshot ID. You can use this snapshot ID to check the snapshot progress
  /// or later use it when you want to create a volume from a snapshot.
  /// <note>
  /// To list or delete a snapshot, you must use the Amazon EC2 API. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [snapshotDescription] :
  /// Textual description of the snapshot that appears in the Amazon EC2
  /// console, Elastic Block Store snapshots panel in the <b>Description</b>
  /// field, and in the AWS Storage Gateway snapshot <b>Details</b> pane,
  /// <b>Description</b> field.
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a snapshot. Each tag is a
  /// key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<CreateSnapshotFromVolumeRecoveryPointOutput>
      createSnapshotFromVolumeRecoveryPoint({
    @_s.required String snapshotDescription,
    @_s.required String volumeARN,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(snapshotDescription, 'snapshotDescription');
    _s.validateStringLength(
      'snapshotDescription',
      snapshotDescription,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StorageGateway_20130630.CreateSnapshotFromVolumeRecoveryPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotDescription': snapshotDescription,
        'VolumeARN': volumeARN,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSnapshotFromVolumeRecoveryPointOutput.fromJson(
        jsonResponse.body);
  }

  /// Creates a volume on a specified gateway. This operation is only supported
  /// in the stored volume gateway type.
  ///
  /// The size of the volume to create is inferred from the disk size. You can
  /// choose to preserve existing data on the disk, create volume from an
  /// existing snapshot, or create an empty volume. If you choose to create an
  /// empty gateway volume, then any existing data on the disk is erased.
  ///
  /// In the request, you must specify the gateway and the disk information on
  /// which you are creating the volume. In response, the gateway creates the
  /// volume and returns volume information such as the volume Amazon Resource
  /// Name (ARN), its size, and the iSCSI target ARN that initiators can use to
  /// connect to the volume target.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [diskId] :
  /// The unique identifier for the gateway local disk that is configured as a
  /// stored volume. Use <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/API_ListLocalDisks.html">ListLocalDisks</a>
  /// to list disk IDs for a gateway.
  ///
  /// Parameter [networkInterfaceId] :
  /// The network interface of the gateway on which to expose the iSCSI target.
  /// Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to
  /// get a list of the network interfaces available on a gateway.
  ///
  /// Valid Values: A valid IP address.
  ///
  /// Parameter [preserveExistingData] :
  /// Set to true <code>true</code> if you want to preserve the data on the
  /// local disk. Otherwise, set to <code>false</code> to create an empty
  /// volume.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [targetName] :
  /// The name of the iSCSI target used by an initiator to connect to a volume
  /// and used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [snapshotId] :
  /// The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the
  /// new stored volume. Specify this field if you want to create the iSCSI
  /// storage volume from a snapshot; otherwise, do not include this field. To
  /// list snapshots for your account use <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a stored volume. Each tag
  /// is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<CreateStorediSCSIVolumeOutput> createStorediSCSIVolume({
    @_s.required String diskId,
    @_s.required String gatewayARN,
    @_s.required String networkInterfaceId,
    @_s.required bool preserveExistingData,
    @_s.required String targetName,
    bool kMSEncrypted,
    String kMSKey,
    String snapshotId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(diskId, 'diskId');
    _s.validateStringLength(
      'diskId',
      diskId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkInterfaceId, 'networkInterfaceId');
    _s.validateStringPattern(
      'networkInterfaceId',
      networkInterfaceId,
      r'''\A(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}\z''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(preserveExistingData, 'preserveExistingData');
    ArgumentError.checkNotNull(targetName, 'targetName');
    _s.validateStringLength(
      'targetName',
      targetName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetName',
      targetName,
      r'''^[-\.;a-z0-9]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''\Asnap-([0-9A-Fa-f]{8}|[0-9A-Fa-f]{17})\z''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateStorediSCSIVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiskId': diskId,
        'GatewayARN': gatewayARN,
        'NetworkInterfaceId': networkInterfaceId,
        'PreserveExistingData': preserveExistingData,
        'TargetName': targetName,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (snapshotId != null) 'SnapshotId': snapshotId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateStorediSCSIVolumeOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new custom tape pool. You can use custom tape pool to enable
  /// tape retention lock on tapes that are archived in the custom pool.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [poolName] :
  /// The name of the new custom tape pool.
  ///
  /// Parameter [storageClass] :
  /// The storage class that is associated with the new custom pool. When you
  /// use your backup application to eject the tape, the tape is archived
  /// directly into the storage class (S3 Glacier or S3 Glacier Deep Archive)
  /// that corresponds to the pool.
  ///
  /// Parameter [retentionLockTimeInDays] :
  /// Tape retention lock time is set in days. Tape retention lock can be
  /// enabled for up to 100 years (36,500 days).
  ///
  /// Parameter [retentionLockType] :
  /// Tape retention lock can be configured in two modes. When configured in
  /// governance mode, AWS accounts with specific IAM permissions are authorized
  /// to remove the tape retention lock from archived virtual tapes. When
  /// configured in compliance mode, the tape retention lock cannot be removed
  /// by any user, including the root AWS account.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to tape pool. Each tag is a
  /// key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<CreateTapePoolOutput> createTapePool({
    @_s.required String poolName,
    @_s.required TapeStorageClass storageClass,
    int retentionLockTimeInDays,
    RetentionLockType retentionLockType,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(poolName, 'poolName');
    _s.validateStringLength(
      'poolName',
      poolName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'poolName',
      poolName,
      r'''^[ -\.0-\[\]-~]*[!-\.0-\[\]-~][ -\.0-\[\]-~]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(storageClass, 'storageClass');
    _s.validateNumRange(
      'retentionLockTimeInDays',
      retentionLockTimeInDays,
      0,
      36500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateTapePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolName': poolName,
        'StorageClass': storageClass?.toValue() ?? '',
        if (retentionLockTimeInDays != null)
          'RetentionLockTimeInDays': retentionLockTimeInDays,
        if (retentionLockType != null)
          'RetentionLockType': retentionLockType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTapePoolOutput.fromJson(jsonResponse.body);
  }

  /// Creates a virtual tape by using your own barcode. You write data to the
  /// virtual tape and then archive the tape. A barcode is unique and cannot be
  /// reused if it has already been used on a tape. This applies to barcodes
  /// used on deleted tapes. This operation is only supported in the tape
  /// gateway type.
  /// <note>
  /// Cache storage must be allocated to the gateway before you can create a
  /// virtual tape. Use the <a>AddCache</a> operation to add cache storage to a
  /// gateway.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The unique Amazon Resource Name (ARN) that represents the gateway to
  /// associate the virtual tape with. Use the <a>ListGateways</a> operation to
  /// return a list of gateways for your account and AWS Region.
  ///
  /// Parameter [tapeBarcode] :
  /// The barcode that you want to assign to the tape.
  /// <note>
  /// Barcodes cannot be reused. This includes barcodes used for tapes that have
  /// been deleted.
  /// </note>
  ///
  /// Parameter [tapeSizeInBytes] :
  /// The size, in bytes, of the virtual tape that you want to create.
  /// <note>
  /// The size must be aligned by gigabyte (1024*1024*1024 bytes).
  /// </note>
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [poolId] :
  /// The ID of the pool that you want to add your tape to for archiving. The
  /// tape in this pool is archived in the S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (S3 Glacier or S3 Deep
  /// Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a virtual tape that has a
  /// barcode. Each tag is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  ///
  /// Parameter [worm] :
  /// Set to <code>TRUE</code> if the tape you are creating is to be configured
  /// as a write-once-read-many (WORM) tape.
  Future<CreateTapeWithBarcodeOutput> createTapeWithBarcode({
    @_s.required String gatewayARN,
    @_s.required String tapeBarcode,
    @_s.required int tapeSizeInBytes,
    bool kMSEncrypted,
    String kMSKey,
    String poolId,
    List<Tag> tags,
    bool worm,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeBarcode, 'tapeBarcode');
    _s.validateStringLength(
      'tapeBarcode',
      tapeBarcode,
      7,
      16,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeBarcode',
      tapeBarcode,
      r'''^[A-Z0-9]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeSizeInBytes, 'tapeSizeInBytes');
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'poolId',
      poolId,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateTapeWithBarcode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeBarcode': tapeBarcode,
        'TapeSizeInBytes': tapeSizeInBytes,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (poolId != null) 'PoolId': poolId,
        if (tags != null) 'Tags': tags,
        if (worm != null) 'Worm': worm,
      },
    );

    return CreateTapeWithBarcodeOutput.fromJson(jsonResponse.body);
  }

  /// Creates one or more virtual tapes. You write data to the virtual tapes and
  /// then archive the tapes. This operation is only supported in the tape
  /// gateway type.
  /// <note>
  /// Cache storage must be allocated to the gateway before you can create
  /// virtual tapes. Use the <a>AddCache</a> operation to add cache storage to a
  /// gateway.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you use to retry a request. If you retry a
  /// request, use the same <code>ClientToken</code> you specified in the
  /// initial request.
  /// <note>
  /// Using the same <code>ClientToken</code> prevents creating the tape
  /// multiple times.
  /// </note>
  ///
  /// Parameter [gatewayARN] :
  /// The unique Amazon Resource Name (ARN) that represents the gateway to
  /// associate the virtual tapes with. Use the <a>ListGateways</a> operation to
  /// return a list of gateways for your account and AWS Region.
  ///
  /// Parameter [numTapesToCreate] :
  /// The number of virtual tapes that you want to create.
  ///
  /// Parameter [tapeBarcodePrefix] :
  /// A prefix that you append to the barcode of the virtual tape you are
  /// creating. This prefix makes the barcode unique.
  /// <note>
  /// The prefix must be 1 to 4 characters in length and must be one of the
  /// uppercase letters from A to Z.
  /// </note>
  ///
  /// Parameter [tapeSizeInBytes] :
  /// The size, in bytes, of the virtual tapes that you want to create.
  /// <note>
  /// The size must be aligned by gigabyte (1024*1024*1024 bytes).
  /// </note>
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [poolId] :
  /// The ID of the pool that you want to add your tape to for archiving. The
  /// tape in this pool is archived in the S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (S3 Glacier or S3 Glacier
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a virtual tape. Each tag
  /// is a key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  ///
  /// Parameter [worm] :
  /// Set to <code>TRUE</code> if the tape you are creating is to be configured
  /// as a write-once-read-many (WORM) tape.
  Future<CreateTapesOutput> createTapes({
    @_s.required String clientToken,
    @_s.required String gatewayARN,
    @_s.required int numTapesToCreate,
    @_s.required String tapeBarcodePrefix,
    @_s.required int tapeSizeInBytes,
    bool kMSEncrypted,
    String kMSKey,
    String poolId,
    List<Tag> tags,
    bool worm,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      5,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(numTapesToCreate, 'numTapesToCreate');
    _s.validateNumRange(
      'numTapesToCreate',
      numTapesToCreate,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeBarcodePrefix, 'tapeBarcodePrefix');
    _s.validateStringLength(
      'tapeBarcodePrefix',
      tapeBarcodePrefix,
      1,
      4,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeBarcodePrefix',
      tapeBarcodePrefix,
      r'''^[A-Z]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeSizeInBytes, 'tapeSizeInBytes');
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'poolId',
      poolId,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.CreateTapes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'GatewayARN': gatewayARN,
        'NumTapesToCreate': numTapesToCreate,
        'TapeBarcodePrefix': tapeBarcodePrefix,
        'TapeSizeInBytes': tapeSizeInBytes,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (poolId != null) 'PoolId': poolId,
        if (tags != null) 'Tags': tags,
        if (worm != null) 'Worm': worm,
      },
    );

    return CreateTapesOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the automatic tape creation policy of a gateway. If you delete
  /// this policy, new virtual tapes must be created manually. Use the Amazon
  /// Resource Name (ARN) of the gateway in your request to remove the policy.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DeleteAutomaticTapeCreationPolicyOutput>
      deleteAutomaticTapeCreationPolicy({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StorageGateway_20130630.DeleteAutomaticTapeCreationPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DeleteAutomaticTapeCreationPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the bandwidth rate limits of a gateway. You can delete either the
  /// upload and download bandwidth rate limit, or you can delete both. If you
  /// delete only one of the limits, the other limit remains unchanged. To
  /// specify which gateway to work with, use the Amazon Resource Name (ARN) of
  /// the gateway in your request. This operation is supported for the stored
  /// volume, cached volume and tape gateway types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [bandwidthType] :
  /// One of the BandwidthType values that indicates the gateway bandwidth rate
  /// limit to delete.
  ///
  /// Valid Values: <code>UPLOAD</code> | <code>DOWNLOAD</code> |
  /// <code>ALL</code>
  Future<DeleteBandwidthRateLimitOutput> deleteBandwidthRateLimit({
    @_s.required String bandwidthType,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(bandwidthType, 'bandwidthType');
    _s.validateStringLength(
      'bandwidthType',
      bandwidthType,
      3,
      25,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteBandwidthRateLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BandwidthType': bandwidthType,
        'GatewayARN': gatewayARN,
      },
    );

    return DeleteBandwidthRateLimitOutput.fromJson(jsonResponse.body);
  }

  /// Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for
  /// a specified iSCSI target and initiator pair. This operation is supported
  /// in volume and tape gateway types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [initiatorName] :
  /// The iSCSI initiator that connects to the target.
  ///
  /// Parameter [targetARN] :
  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  Future<DeleteChapCredentialsOutput> deleteChapCredentials({
    @_s.required String initiatorName,
    @_s.required String targetARN,
  }) async {
    ArgumentError.checkNotNull(initiatorName, 'initiatorName');
    _s.validateStringLength(
      'initiatorName',
      initiatorName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'initiatorName',
      initiatorName,
      r'''[0-9a-z:.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetARN, 'targetARN');
    _s.validateStringLength(
      'targetARN',
      targetARN,
      50,
      800,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteChapCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InitiatorName': initiatorName,
        'TargetARN': targetARN,
      },
    );

    return DeleteChapCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a file share from a file gateway. This operation is only supported
  /// for file gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARN] :
  /// The Amazon Resource Name (ARN) of the file share to be deleted.
  ///
  /// Parameter [forceDelete] :
  /// If this value is set to <code>true</code>, the operation deletes a file
  /// share immediately and aborts all data uploads to AWS. Otherwise, the file
  /// share is not deleted until all data is uploaded to AWS. This process
  /// aborts the data upload process, and the file share enters the
  /// <code>FORCE_DELETING</code> status.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<DeleteFileShareOutput> deleteFileShare({
    @_s.required String fileShareARN,
    bool forceDelete,
  }) async {
    ArgumentError.checkNotNull(fileShareARN, 'fileShareARN');
    _s.validateStringLength(
      'fileShareARN',
      fileShareARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteFileShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARN': fileShareARN,
        if (forceDelete != null) 'ForceDelete': forceDelete,
      },
    );

    return DeleteFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a gateway. To specify which gateway to delete, use the Amazon
  /// Resource Name (ARN) of the gateway in your request. The operation deletes
  /// the gateway; however, it does not delete the gateway virtual machine (VM)
  /// from your host computer.
  ///
  /// After you delete a gateway, you cannot reactivate it. Completed snapshots
  /// of the gateway volumes are not deleted upon deleting the gateway, however,
  /// pending snapshots will not complete. After you delete a gateway, your next
  /// step is to remove it from your environment.
  /// <important>
  /// You no longer pay software charges after the gateway is deleted; however,
  /// your existing Amazon EBS snapshots persist and you will continue to be
  /// billed for these snapshots. You can choose to remove all remaining Amazon
  /// EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer
  /// not to cancel your Amazon EC2 subscription, you can delete your snapshots
  /// using the Amazon EC2 console. For more information, see the <a
  /// href="http://aws.amazon.com/storagegateway">AWS Storage Gateway detail
  /// page</a>.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DeleteGatewayOutput> deleteGateway({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DeleteGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a snapshot of a volume.
  ///
  /// You can take snapshots of your gateway volumes on a scheduled or ad hoc
  /// basis. This API action enables you to delete a snapshot schedule for a
  /// volume. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/backing-up-volumes.html">Backing
  /// up your volumes</a>. In the <code>DeleteSnapshotSchedule</code> request,
  /// you identify the volume by providing its Amazon Resource Name (ARN). This
  /// operation is only supported in stored and cached volume gateway types.
  /// <note>
  /// To list or delete a snapshot, you must use the Amazon EC2 API. For more
  /// information, go to <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARN] :
  /// The volume which snapshot schedule to delete.
  Future<DeleteSnapshotScheduleOutput> deleteSnapshotSchedule({
    @_s.required String volumeARN,
  }) async {
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteSnapshotSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARN': volumeARN,
      },
    );

    return DeleteSnapshotScheduleOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified virtual tape. This operation is only supported in
  /// the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The unique Amazon Resource Name (ARN) of the gateway that the virtual tape
  /// to delete is associated with. Use the <a>ListGateways</a> operation to
  /// return a list of gateways for your account and AWS Region.
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape to delete.
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Set to <code>TRUE</code> to delete an archived tape that belongs to a
  /// custom pool with tape retention lock. Only archived tapes with tape
  /// retention lock set to <code>governance</code> can be deleted. Archived
  /// tapes with tape retention lock set to <code>compliance</code> can't be
  /// deleted.
  Future<DeleteTapeOutput> deleteTape({
    @_s.required String gatewayARN,
    @_s.required String tapeARN,
    bool bypassGovernanceRetention,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteTape'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeARN': tapeARN,
        if (bypassGovernanceRetention != null)
          'BypassGovernanceRetention': bypassGovernanceRetention,
      },
    );

    return DeleteTapeOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified virtual tape from the virtual tape shelf (VTS). This
  /// operation is only supported in the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape to delete from the
  /// virtual tape shelf (VTS).
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Set to <code>TRUE</code> to delete an archived tape that belongs to a
  /// custom pool with tape retention lock. Only archived tapes with tape
  /// retention lock set to <code>governance</code> can be deleted. Archived
  /// tapes with tape retention lock set to <code>compliance</code> can't be
  /// deleted.
  Future<DeleteTapeArchiveOutput> deleteTapeArchive({
    @_s.required String tapeARN,
    bool bypassGovernanceRetention,
  }) async {
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteTapeArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TapeARN': tapeARN,
        if (bypassGovernanceRetention != null)
          'BypassGovernanceRetention': bypassGovernanceRetention,
      },
    );

    return DeleteTapeArchiveOutput.fromJson(jsonResponse.body);
  }

  /// Delete a custom tape pool. A custom tape pool can only be deleted if there
  /// are no tapes in the pool and if there are no automatic tape creation
  /// policies that reference the custom tape pool.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [poolARN] :
  /// The Amazon Resource Name (ARN) of the custom tape pool to delete.
  Future<DeleteTapePoolOutput> deleteTapePool({
    @_s.required String poolARN,
  }) async {
    ArgumentError.checkNotNull(poolARN, 'poolARN');
    _s.validateStringLength(
      'poolARN',
      poolARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteTapePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolARN': poolARN,
      },
    );

    return DeleteTapePoolOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified storage volume that you previously created using the
  /// <a>CreateCachediSCSIVolume</a> or <a>CreateStorediSCSIVolume</a> API. This
  /// operation is only supported in the cached volume and stored volume types.
  /// For stored volume gateways, the local disk that was configured as the
  /// storage volume is not deleted. You can reuse the local disk to create
  /// another storage volume.
  ///
  /// Before you delete a volume, make sure there are no iSCSI connections to
  /// the volume you are deleting. You should also make sure there is no
  /// snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon
  /// EC2) API to query snapshots on the volume you are deleting and check the
  /// snapshot status. For more information, go to <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a>
  /// in the <i>Amazon Elastic Compute Cloud API Reference</i>.
  ///
  /// In the request, you must provide the Amazon Resource Name (ARN) of the
  /// storage volume you want to delete.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  Future<DeleteVolumeOutput> deleteVolume({
    @_s.required String volumeARN,
  }) async {
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DeleteVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARN': volumeARN,
      },
    );

    return DeleteVolumeOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the most recent High Availability monitoring
  /// test that was performed on the host in a cluster. If a test isn't
  /// performed, the status and start time in the response would be null.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeAvailabilityMonitorTestOutput>
      describeAvailabilityMonitorTest({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeAvailabilityMonitorTest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeAvailabilityMonitorTestOutput.fromJson(jsonResponse.body);
  }

  /// Returns the bandwidth rate limits of a gateway. By default, these limits
  /// are not set, which means no bandwidth rate limiting is in effect. This
  /// operation is supported for the stored volume, cached volume, and tape
  /// gateway types.
  ///
  /// This operation only returns a value for a bandwidth rate limit only if the
  /// limit is set. If no limits are set for the gateway, then this operation
  /// returns only the gateway ARN in the response body. To specify which
  /// gateway to describe, use the Amazon Resource Name (ARN) of the gateway in
  /// your request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeBandwidthRateLimitOutput> describeBandwidthRateLimit({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeBandwidthRateLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeBandwidthRateLimitOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the bandwidth rate limit schedule of a gateway.
  /// By default, gateways do not have bandwidth rate limit schedules, which
  /// means no bandwidth rate limiting is in effect. This operation is supported
  /// only in the volume and tape gateway types.
  ///
  /// This operation returns information about a gateway's bandwidth rate limit
  /// schedule. A bandwidth rate limit schedule consists of one or more
  /// bandwidth rate limit intervals. A bandwidth rate limit interval defines a
  /// period of time on one or more days of the week, during which bandwidth
  /// rate limits are specified for uploading, downloading, or both.
  ///
  /// A bandwidth rate limit interval consists of one or more days of the week,
  /// a start hour and minute, an ending hour and minute, and bandwidth rate
  /// limits for uploading and downloading
  ///
  /// If no bandwidth rate limit schedule intervals are set for the gateway,
  /// this operation returns an empty response. To specify which gateway to
  /// describe, use the Amazon Resource Name (ARN) of the gateway in your
  /// request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeBandwidthRateLimitScheduleOutput>
      describeBandwidthRateLimitSchedule({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StorageGateway_20130630.DescribeBandwidthRateLimitSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeBandwidthRateLimitScheduleOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the cache of a gateway. This operation is only
  /// supported in the cached volume, tape, and file gateway types.
  ///
  /// The response includes disk IDs that are configured as cache, and it
  /// includes the amount of cache allocated and used.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeCacheOutput> describeCache({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeCacheOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of the gateway volumes specified in the request.
  /// This operation is only supported in the cached volume gateway types.
  ///
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response, AWS Storage Gateway returns volume information sorted by
  /// volume Amazon Resource Name (ARN).
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARNs] :
  /// An array of strings where each string represents the Amazon Resource Name
  /// (ARN) of a cached volume. All of the specified cached volumes must be from
  /// the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.
  Future<DescribeCachediSCSIVolumesOutput> describeCachediSCSIVolumes({
    @_s.required List<String> volumeARNs,
  }) async {
    ArgumentError.checkNotNull(volumeARNs, 'volumeARNs');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeCachediSCSIVolumes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARNs': volumeARNs,
      },
    );

    return DescribeCachediSCSIVolumesOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of Challenge-Handshake Authentication Protocol (CHAP)
  /// credentials information for a specified iSCSI target, one for each
  /// target-initiator pair. This operation is supported in the volume and tape
  /// gateway types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [targetARN] :
  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  Future<DescribeChapCredentialsOutput> describeChapCredentials({
    @_s.required String targetARN,
  }) async {
    ArgumentError.checkNotNull(targetARN, 'targetARN');
    _s.validateStringLength(
      'targetARN',
      targetARN,
      50,
      800,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeChapCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetARN': targetARN,
      },
    );

    return DescribeChapCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Returns metadata about a gateway such as its name, network interfaces,
  /// configured time zone, and the state (whether the gateway is running or
  /// not). To specify which gateway to describe, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeGatewayInformationOutput> describeGatewayInformation({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeGatewayInformation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeGatewayInformationOutput.fromJson(jsonResponse.body);
  }

  /// Returns your gateway's weekly maintenance start time including the day and
  /// time of the week. Note that values are in terms of the gateway's time
  /// zone.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeMaintenanceStartTimeOutput> describeMaintenanceStartTime({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeMaintenanceStartTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeMaintenanceStartTimeOutput.fromJson(jsonResponse.body);
  }

  /// Gets a description for one or more Network File System (NFS) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARNList] :
  /// An array containing the Amazon Resource Name (ARN) of each file share to
  /// be described.
  Future<DescribeNFSFileSharesOutput> describeNFSFileShares({
    @_s.required List<String> fileShareARNList,
  }) async {
    ArgumentError.checkNotNull(fileShareARNList, 'fileShareARNList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeNFSFileShares'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARNList': fileShareARNList,
      },
    );

    return DescribeNFSFileSharesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a description for one or more Server Message Block (SMB) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARNList] :
  /// An array containing the Amazon Resource Name (ARN) of each file share to
  /// be described.
  Future<DescribeSMBFileSharesOutput> describeSMBFileShares({
    @_s.required List<String> fileShareARNList,
  }) async {
    ArgumentError.checkNotNull(fileShareARNList, 'fileShareARNList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeSMBFileShares'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARNList': fileShareARNList,
      },
    );

    return DescribeSMBFileSharesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a description of a Server Message Block (SMB) file share settings
  /// from a file gateway. This operation is only supported for file gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeSMBSettingsOutput> describeSMBSettings({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeSMBSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeSMBSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Describes the snapshot schedule for the specified gateway volume. The
  /// snapshot schedule information includes intervals at which snapshots are
  /// automatically initiated on the volume. This operation is only supported in
  /// the cached volume and stored volume types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  Future<DescribeSnapshotScheduleOutput> describeSnapshotSchedule({
    @_s.required String volumeARN,
  }) async {
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeSnapshotSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARN': volumeARN,
      },
    );

    return DescribeSnapshotScheduleOutput.fromJson(jsonResponse.body);
  }

  /// Returns the description of the gateway volumes specified in the request.
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response, AWS Storage Gateway returns volume information sorted by
  /// volume ARNs. This operation is only supported in stored volume gateway
  /// type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARNs] :
  /// An array of strings where each string represents the Amazon Resource Name
  /// (ARN) of a stored volume. All of the specified stored volumes must be from
  /// the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.
  Future<DescribeStorediSCSIVolumesOutput> describeStorediSCSIVolumes({
    @_s.required List<String> volumeARNs,
  }) async {
    ArgumentError.checkNotNull(volumeARNs, 'volumeARNs');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeStorediSCSIVolumes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARNs': volumeARNs,
      },
    );

    return DescribeStorediSCSIVolumesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of specified virtual tapes in the virtual tape shelf
  /// (VTS). This operation is only supported in the tape gateway type.
  ///
  /// If a specific <code>TapeARN</code> is not specified, AWS Storage Gateway
  /// returns a description of all virtual tapes found in the VTS associated
  /// with your account.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the number of virtual tapes described be limited to the
  /// specified number.
  ///
  /// Parameter [marker] :
  /// An opaque string that indicates the position at which to begin describing
  /// virtual tapes.
  ///
  /// Parameter [tapeARNs] :
  /// Specifies one or more unique Amazon Resource Names (ARNs) that represent
  /// the virtual tapes you want to describe.
  Future<DescribeTapeArchivesOutput> describeTapeArchives({
    int limit,
    String marker,
    List<String> tapeARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeTapeArchives'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
        if (tapeARNs != null) 'TapeARNs': tapeARNs,
      },
    );

    return DescribeTapeArchivesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of virtual tape recovery points that are available for the
  /// specified tape gateway.
  ///
  /// A recovery point is a point-in-time view of a virtual tape at which all
  /// the data on the virtual tape is consistent. If your gateway crashes,
  /// virtual tapes that have recovery points can be recovered to a new gateway.
  /// This operation is only supported in the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the number of virtual tape recovery points that are
  /// described be limited to the specified number.
  ///
  /// Parameter [marker] :
  /// An opaque string that indicates the position at which to begin describing
  /// the virtual tape recovery points.
  Future<DescribeTapeRecoveryPointsOutput> describeTapeRecoveryPoints({
    @_s.required String gatewayARN,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeTapeRecoveryPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return DescribeTapeRecoveryPointsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of the specified Amazon Resource Name (ARN) of
  /// virtual tapes. If a <code>TapeARN</code> is not specified, returns a
  /// description of all virtual tapes associated with the specified gateway.
  /// This operation is only supported in the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the number of virtual tapes described be limited to the
  /// specified number.
  /// <note>
  /// Amazon Web Services may impose its own limit, if this field is not set.
  /// </note>
  ///
  /// Parameter [marker] :
  /// A marker value, obtained in a previous call to <code>DescribeTapes</code>.
  /// This marker indicates which page of results to retrieve.
  ///
  /// If not specified, the first page of results is retrieved.
  ///
  /// Parameter [tapeARNs] :
  /// Specifies one or more unique Amazon Resource Names (ARNs) that represent
  /// the virtual tapes you want to describe. If this parameter is not
  /// specified, Tape gateway returns a description of all virtual tapes
  /// associated with the specified gateway.
  Future<DescribeTapesOutput> describeTapes({
    @_s.required String gatewayARN,
    int limit,
    String marker,
    List<String> tapeARNs,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeTapes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
        if (tapeARNs != null) 'TapeARNs': tapeARNs,
      },
    );

    return DescribeTapesOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the upload buffer of a gateway. This operation
  /// is supported for the stored volume, cached volume, and tape gateway types.
  ///
  /// The response includes disk IDs that are configured as upload buffer space,
  /// and it includes the amount of upload buffer space allocated and used.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeUploadBufferOutput> describeUploadBuffer({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeUploadBuffer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeUploadBufferOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of virtual tape library (VTL) devices for the
  /// specified tape gateway. In the response, AWS Storage Gateway returns VTL
  /// device information.
  ///
  /// This operation is only supported in the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the number of VTL devices described be limited to the
  /// specified number.
  ///
  /// Parameter [marker] :
  /// An opaque string that indicates the position at which to begin describing
  /// the VTL devices.
  ///
  /// Parameter [vTLDeviceARNs] :
  /// An array of strings, where each string represents the Amazon Resource Name
  /// (ARN) of a VTL device.
  /// <note>
  /// All of the specified VTL devices must be from the same gateway. If no VTL
  /// devices are specified, the result will contain all devices on the
  /// specified gateway.
  /// </note>
  Future<DescribeVTLDevicesOutput> describeVTLDevices({
    @_s.required String gatewayARN,
    int limit,
    String marker,
    List<String> vTLDeviceARNs,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeVTLDevices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
        if (vTLDeviceARNs != null) 'VTLDeviceARNs': vTLDeviceARNs,
      },
    );

    return DescribeVTLDevicesOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the working storage of a gateway. This operation
  /// is only supported in the stored volumes gateway type. This operation is
  /// deprecated in cached volumes API version (20120630). Use
  /// DescribeUploadBuffer instead.
  /// <note>
  /// Working storage is also referred to as upload buffer. You can also use the
  /// DescribeUploadBuffer operation to add upload buffer to a stored volume
  /// gateway.
  /// </note>
  /// The response includes disk IDs that are configured as working storage, and
  /// it includes the amount of working storage allocated and used.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeWorkingStorageOutput> describeWorkingStorage({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeWorkingStorage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DescribeWorkingStorageOutput.fromJson(jsonResponse.body);
  }

  /// Disconnects a volume from an iSCSI connection and then detaches the volume
  /// from the specified gateway. Detaching and attaching a volume enables you
  /// to recover your data from one gateway to a different gateway without
  /// creating a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance. This
  /// operation is only supported in the volume gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume to detach from the gateway.
  ///
  /// Parameter [forceDetach] :
  /// Set to <code>true</code> to forcibly remove the iSCSI connection of the
  /// target volume and detach the volume. The default is <code>false</code>. If
  /// this value is set to <code>false</code>, you must manually disconnect the
  /// iSCSI connection from the target volume.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<DetachVolumeOutput> detachVolume({
    @_s.required String volumeARN,
    bool forceDetach,
  }) async {
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DetachVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARN': volumeARN,
        if (forceDetach != null) 'ForceDetach': forceDetach,
      },
    );

    return DetachVolumeOutput.fromJson(jsonResponse.body);
  }

  /// Disables a tape gateway when the gateway is no longer functioning. For
  /// example, if your gateway VM is damaged, you can disable the gateway so you
  /// can recover virtual tapes.
  ///
  /// Use this operation for a tape gateway that is not reachable or not
  /// functioning. This operation is only supported in the tape gateway type.
  /// <important>
  /// After a gateway is disabled, it cannot be enabled.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DisableGatewayOutput> disableGateway({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DisableGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return DisableGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Adds a file gateway to an Active Directory domain. This operation is only
  /// supported for file gateways that support the SMB file protocol.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want the gateway to join.
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the gateway. Use the
  /// <code>ListGateways</code> operation to return a list of gateways for your
  /// account and AWS Region.
  ///
  /// Parameter [password] :
  /// Sets the password of the user who has permission to add the gateway to the
  /// Active Directory domain.
  ///
  /// Parameter [userName] :
  /// Sets the user name of user who has permission to add the gateway to the
  /// Active Directory domain. The domain user account should be enabled to join
  /// computers to the domain. For example, you can use the domain administrator
  /// account or an account with delegated permissions to join computers to the
  /// domain.
  ///
  /// Parameter [domainControllers] :
  /// List of IPv4 addresses, NetBIOS names, or host names of your domain
  /// server. If you need to specify the port number include it after the colon
  /// (“:”). For example, <code>mydc.mydomain.com:389</code>.
  ///
  /// Parameter [organizationalUnit] :
  /// The organizational unit (OU) is a container in an Active Directory that
  /// can hold users, groups, computers, and other OUs and this parameter
  /// specifies the OU that the gateway will join within the AD domain.
  ///
  /// Parameter [timeoutInSeconds] :
  /// Specifies the time in seconds, in which the <code>JoinDomain</code>
  /// operation must complete. The default is 20 seconds.
  Future<JoinDomainOutput> joinDomain({
    @_s.required String domainName,
    @_s.required String gatewayARN,
    @_s.required String password,
    @_s.required String userName,
    List<String> domainControllers,
    String organizationalUnit,
    int timeoutInSeconds,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''^[ -~]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^\w[\w\.\- ]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'organizationalUnit',
      organizationalUnit,
      1,
      1024,
    );
    _s.validateNumRange(
      'timeoutInSeconds',
      timeoutInSeconds,
      0,
      3600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.JoinDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'GatewayARN': gatewayARN,
        'Password': password,
        'UserName': userName,
        if (domainControllers != null) 'DomainControllers': domainControllers,
        if (organizationalUnit != null)
          'OrganizationalUnit': organizationalUnit,
        if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
      },
    );

    return JoinDomainOutput.fromJson(jsonResponse.body);
  }

  /// Lists the automatic tape creation policies for a gateway. If there are no
  /// automatic tape creation policies for the gateway, it returns an empty
  /// list.
  ///
  /// This operation is only supported for tape gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<ListAutomaticTapeCreationPoliciesOutput>
      listAutomaticTapeCreationPolicies({
    String gatewayARN,
  }) async {
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StorageGateway_20130630.ListAutomaticTapeCreationPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (gatewayARN != null) 'GatewayARN': gatewayARN,
      },
    );

    return ListAutomaticTapeCreationPoliciesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of the file shares for a specific file gateway, or the list of
  /// file shares that belong to the calling user account. This operation is
  /// only supported for file gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the gateway whose file shares you want
  /// to list. If this field is not present, all file shares under your account
  /// are listed.
  ///
  /// Parameter [limit] :
  /// The maximum number of file shares to return in the response. The value
  /// must be an integer with a value greater than zero. Optional.
  ///
  /// Parameter [marker] :
  /// Opaque pagination token returned from a previous ListFileShares operation.
  /// If present, <code>Marker</code> specifies where to continue the list from
  /// after a previous call to ListFileShares. Optional.
  Future<ListFileSharesOutput> listFileShares({
    String gatewayARN,
    int limit,
    String marker,
  }) async {
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListFileShares'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (gatewayARN != null) 'GatewayARN': gatewayARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListFileSharesOutput.fromJson(jsonResponse.body);
  }

  /// Lists gateways owned by an AWS account in an AWS Region specified in the
  /// request. The returned list is ordered by gateway Amazon Resource Name
  /// (ARN).
  ///
  /// By default, the operation returns a maximum of 100 gateways. This
  /// operation supports pagination that allows you to optionally reduce the
  /// number of gateways returned in a response.
  ///
  /// If you have more gateways than are returned in a response (that is, the
  /// response returns only a truncated list of your gateways), the response
  /// contains a marker that you can specify in your next request to fetch the
  /// next page of gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the list of gateways returned be limited to the specified
  /// number of items.
  ///
  /// Parameter [marker] :
  /// An opaque string that indicates the position at which to begin the
  /// returned list of gateways.
  Future<ListGatewaysOutput> listGateways({
    int limit,
    String marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListGateways'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListGatewaysOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of the gateway's local disks. To specify which gateway to
  /// describe, you use the Amazon Resource Name (ARN) of the gateway in the
  /// body of the request.
  ///
  /// The request returns a list of all disks, specifying which are configured
  /// as working storage, cache storage, or stored volume or not configured at
  /// all. The response includes a <code>DiskStatus</code> field. This field can
  /// have a value of present (the disk is available to use), missing (the disk
  /// is no longer connected to the gateway), or mismatch (the disk node is
  /// occupied by a disk that has incorrect metadata or the disk content is
  /// corrupted).
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<ListLocalDisksOutput> listLocalDisks({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListLocalDisks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return ListLocalDisksOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags that have been added to the specified resource. This
  /// operation is supported in storage gateways of all types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to list
  /// tags.
  ///
  /// Parameter [limit] :
  /// Specifies that the list of tags returned be limited to the specified
  /// number of items.
  ///
  /// Parameter [marker] :
  /// An opaque string that indicates the position at which to begin returning
  /// the list of tags.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceARN,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Lists custom tape pools. You specify custom tape pools to list by
  /// specifying one or more custom tape pool Amazon Resource Names (ARNs). If
  /// you don't specify a custom tape pool ARN, the operation lists all custom
  /// tape pools.
  ///
  /// This operation supports pagination. You can optionally specify the
  /// <code>Limit</code> parameter in the body to limit the number of tape pools
  /// in the response. If the number of tape pools returned in the response is
  /// truncated, the response includes a <code>Marker</code> element that you
  /// can use in your subsequent request to retrieve the next set of tape pools.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// An optional number limit for the tape pools in the list returned by this
  /// call.
  ///
  /// Parameter [marker] :
  /// A string that indicates the position at which to begin the returned list
  /// of tape pools.
  ///
  /// Parameter [poolARNs] :
  /// The Amazon Resource Name (ARN) of each of the custom tape pools you want
  /// to list. If you don't specify a custom tape pool ARN, the response lists
  /// all custom tape pools.
  Future<ListTapePoolsOutput> listTapePools({
    int limit,
    String marker,
    List<String> poolARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListTapePools'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
        if (poolARNs != null) 'PoolARNs': poolARNs,
      },
    );

    return ListTapePoolsOutput.fromJson(jsonResponse.body);
  }

  /// Lists virtual tapes in your virtual tape library (VTL) and your virtual
  /// tape shelf (VTS). You specify the tapes to list by specifying one or more
  /// tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the
  /// operation lists all virtual tapes in both your VTL and VTS.
  ///
  /// This operation supports pagination. By default, the operation returns a
  /// maximum of up to 100 tapes. You can optionally specify the
  /// <code>Limit</code> parameter in the body to limit the number of tapes in
  /// the response. If the number of tapes returned in the response is
  /// truncated, the response includes a <code>Marker</code> element that you
  /// can use in your subsequent request to retrieve the next set of tapes. This
  /// operation is only supported in the tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// An optional number limit for the tapes in the list returned by this call.
  ///
  /// Parameter [marker] :
  /// A string that indicates the position at which to begin the returned list
  /// of tapes.
  Future<ListTapesOutput> listTapes({
    int limit,
    String marker,
    List<String> tapeARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListTapes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
        if (tapeARNs != null) 'TapeARNs': tapeARNs,
      },
    );

    return ListTapesOutput.fromJson(jsonResponse.body);
  }

  /// Lists iSCSI initiators that are connected to a volume. You can use this
  /// operation to determine whether a volume is being used or not. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes for the gateway.
  Future<ListVolumeInitiatorsOutput> listVolumeInitiators({
    @_s.required String volumeARN,
  }) async {
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListVolumeInitiators'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeARN': volumeARN,
      },
    );

    return ListVolumeInitiatorsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the recovery points for a specified gateway. This operation is only
  /// supported in the cached volume gateway type.
  ///
  /// Each cache volume has one recovery point. A volume recovery point is a
  /// point in time at which all data of the volume is consistent and from which
  /// you can create a snapshot or clone a new cached volume from a source
  /// volume. To create a snapshot from a volume recovery point use the
  /// <a>CreateSnapshotFromVolumeRecoveryPoint</a> operation.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<ListVolumeRecoveryPointsOutput> listVolumeRecoveryPoints({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListVolumeRecoveryPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return ListVolumeRecoveryPointsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the iSCSI stored volumes of a gateway. Results are sorted by volume
  /// ARN. The response includes only the volume ARNs. If you want additional
  /// volume information, use the <a>DescribeStorediSCSIVolumes</a> or the
  /// <a>DescribeCachediSCSIVolumes</a> API.
  ///
  /// The operation supports pagination. By default, the operation returns a
  /// maximum of up to 100 volumes. You can optionally specify the
  /// <code>Limit</code> field in the body to limit the number of volumes in the
  /// response. If the number of volumes returned in the response is truncated,
  /// the response includes a Marker field. You can use this Marker value in
  /// your subsequent request to retrieve the next set of volumes. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// Specifies that the list of volumes returned be limited to the specified
  /// number of items.
  ///
  /// Parameter [marker] :
  /// A string that indicates the position at which to begin the returned list
  /// of volumes. Obtain the marker from the response of a previous List iSCSI
  /// Volumes request.
  Future<ListVolumesOutput> listVolumes({
    String gatewayARN,
    int limit,
    String marker,
  }) async {
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListVolumes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (gatewayARN != null) 'GatewayARN': gatewayARN,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListVolumesOutput.fromJson(jsonResponse.body);
  }

  /// Sends you notification through CloudWatch Events when all files written to
  /// your file share have been uploaded to Amazon S3.
  ///
  /// AWS Storage Gateway can send a notification through Amazon CloudWatch
  /// Events when all files written to your file share up to that point in time
  /// have been uploaded to Amazon S3. These files include files written to the
  /// file share up to the time that you make a request for notification. When
  /// the upload is done, Storage Gateway sends you notification through an
  /// Amazon CloudWatch Event. You can configure CloudWatch Events to send the
  /// notification through event targets such as Amazon SNS or AWS Lambda
  /// function. This operation is only supported for file gateways.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification">Getting
  /// file upload notification</a> in the <i>AWS Storage Gateway User Guide</i>.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<NotifyWhenUploadedOutput> notifyWhenUploaded({
    @_s.required String fileShareARN,
  }) async {
    ArgumentError.checkNotNull(fileShareARN, 'fileShareARN');
    _s.validateStringLength(
      'fileShareARN',
      fileShareARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.NotifyWhenUploaded'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARN': fileShareARN,
      },
    );

    return NotifyWhenUploadedOutput.fromJson(jsonResponse.body);
  }

  /// Refreshes the cache for the specified file share. This operation finds
  /// objects in the Amazon S3 bucket that were added, removed, or replaced
  /// since the gateway last listed the bucket's contents and cached the
  /// results. This operation is only supported in the file gateway type. You
  /// can subscribe to be notified through an Amazon CloudWatch event when your
  /// RefreshCache operation completes. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>AWS Storage Gateway User
  /// Guide</i>.
  ///
  /// When this API is called, it only initiates the refresh operation. When the
  /// API call completes and returns a success code, it doesn't necessarily mean
  /// that the file refresh has completed. You should use the refresh-complete
  /// notification to determine that the operation has completed before you
  /// check for new files on the gateway file share. You can subscribe to be
  /// notified through an CloudWatch event when your <code>RefreshCache</code>
  /// operation completes.
  ///
  /// Throttle limit: This API is asynchronous so the gateway will accept no
  /// more than two refreshes at any time. We recommend using the
  /// refresh-complete CloudWatch event notification before issuing additional
  /// requests. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>AWS Storage Gateway User
  /// Guide</i>.
  ///
  /// If you invoke the RefreshCache API when two requests are already being
  /// processed, any new request will cause an
  /// <code>InvalidGatewayRequestException</code> error because too many
  /// requests were sent to the server.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>AWS Storage Gateway User
  /// Guide</i>.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARN] :
  /// The Amazon Resource Name (ARN) of the file share you want to refresh.
  ///
  /// Parameter [folderList] :
  /// A comma-separated list of the paths of folders to refresh in the cache.
  /// The default is [<code>"/"</code>]. The default refreshes objects and
  /// folders at the root of the Amazon S3 bucket. If <code>Recursive</code> is
  /// set to <code>true</code>, the entire S3 bucket that the file share has
  /// access to is refreshed.
  ///
  /// Parameter [recursive] :
  /// A value that specifies whether to recursively refresh folders in the
  /// cache. The refresh includes folders that were in the cache the last time
  /// the gateway listed the folder's contents. If this value set to
  /// <code>true</code>, each folder that is listed in <code>FolderList</code>
  /// is recursively updated. Otherwise, subfolders listed in
  /// <code>FolderList</code> are not refreshed. Only objects that are in
  /// folders listed directly under <code>FolderList</code> are found and used
  /// for the update. The default is <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<RefreshCacheOutput> refreshCache({
    @_s.required String fileShareARN,
    List<String> folderList,
    bool recursive,
  }) async {
    ArgumentError.checkNotNull(fileShareARN, 'fileShareARN');
    _s.validateStringLength(
      'fileShareARN',
      fileShareARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.RefreshCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARN': fileShareARN,
        if (folderList != null) 'FolderList': folderList,
        if (recursive != null) 'Recursive': recursive,
      },
    );

    return RefreshCacheOutput.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from the specified resource. This operation is
  /// supported in storage gateways of all types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource you want to remove the tags
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags you want to remove from the specified resource. A tag
  /// is composed of a key-value pair.
  Future<RemoveTagsFromResourceOutput> removeTagsFromResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.RemoveTagsFromResource'
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

    return RemoveTagsFromResourceOutput.fromJson(jsonResponse.body);
  }

  /// Resets all cache disks that have encountered an error and makes the disks
  /// available for reconfiguration as cache storage. If your cache disk
  /// encounters an error, the gateway prevents read and write operations on
  /// virtual tapes in the gateway. For example, an error can occur when a disk
  /// is corrupted or removed from the gateway. When a cache is reset, the
  /// gateway loses its cache storage. At this point, you can reconfigure the
  /// disks as cache disks. This operation is only supported in the cached
  /// volume and tape types.
  /// <important>
  /// If the cache disk you are resetting contains data that has not been
  /// uploaded to Amazon S3 yet, that data can be lost. After you reset cache
  /// disks, there will be no configured cache disks left in the gateway, so you
  /// must configure at least one new cache disk for your gateway to function
  /// properly.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<ResetCacheOutput> resetCache({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ResetCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return ResetCacheOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a
  /// tape gateway. Virtual tapes archived in the VTS are not associated with
  /// any gateway. However after a tape is retrieved, it is associated with a
  /// gateway, even though it is also listed in the VTS, that is, archive. This
  /// operation is only supported in the tape gateway type.
  ///
  /// Once a tape is successfully retrieved to a gateway, it cannot be retrieved
  /// again to another gateway. You must archive the tape again before you can
  /// retrieve it to another gateway. This operation is only supported in the
  /// tape gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the gateway you want to retrieve the
  /// virtual tape to. Use the <a>ListGateways</a> operation to return a list of
  /// gateways for your account and AWS Region.
  ///
  /// You retrieve archived virtual tapes to only one gateway and the gateway
  /// must be a tape gateway.
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape you want to retrieve
  /// from the virtual tape shelf (VTS).
  Future<RetrieveTapeArchiveOutput> retrieveTapeArchive({
    @_s.required String gatewayARN,
    @_s.required String tapeARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.RetrieveTapeArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeARN': tapeARN,
      },
    );

    return RetrieveTapeArchiveOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the recovery point for the specified virtual tape. This
  /// operation is only supported in the tape gateway type.
  ///
  /// A recovery point is a point in time view of a virtual tape at which all
  /// the data on the tape is consistent. If your gateway crashes, virtual tapes
  /// that have recovery points can be recovered to a new gateway.
  /// <note>
  /// The virtual tape can be retrieved to only one gateway. The retrieved tape
  /// is read-only. The virtual tape can be retrieved to only a tape gateway.
  /// There is no charge for retrieving recovery points.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape for which you want to
  /// retrieve the recovery point.
  Future<RetrieveTapeRecoveryPointOutput> retrieveTapeRecoveryPoint({
    @_s.required String gatewayARN,
    @_s.required String tapeARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tapeARN, 'tapeARN');
    _s.validateStringLength(
      'tapeARN',
      tapeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tapeARN',
      tapeARN,
      r'''^arn:(aws|aws-cn|aws-us-gov):storagegateway:[a-z\-0-9]+:[0-9]+:tape\/[0-9A-Z]{7,16}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.RetrieveTapeRecoveryPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'TapeARN': tapeARN,
      },
    );

    return RetrieveTapeRecoveryPointOutput.fromJson(jsonResponse.body);
  }

  /// Sets the password for your VM local console. When you log in to the local
  /// console for the first time, you log in to the VM with the default
  /// credentials. We recommend that you set a new password. You don't need to
  /// know the default password to set a new password.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [localConsolePassword] :
  /// The password you want to set for your VM local console.
  Future<SetLocalConsolePasswordOutput> setLocalConsolePassword({
    @_s.required String gatewayARN,
    @_s.required String localConsolePassword,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(localConsolePassword, 'localConsolePassword');
    _s.validateStringLength(
      'localConsolePassword',
      localConsolePassword,
      6,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'localConsolePassword',
      localConsolePassword,
      r'''^[ -~]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.SetLocalConsolePassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'LocalConsolePassword': localConsolePassword,
      },
    );

    return SetLocalConsolePasswordOutput.fromJson(jsonResponse.body);
  }

  /// Sets the password for the guest user <code>smbguest</code>. The
  /// <code>smbguest</code> user is the user when the authentication method for
  /// the file share is set to <code>GuestAccess</code>.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the file gateway the SMB file share is
  /// associated with.
  ///
  /// Parameter [password] :
  /// The password that you want to set for your SMB server.
  Future<SetSMBGuestPasswordOutput> setSMBGuestPassword({
    @_s.required String gatewayARN,
    @_s.required String password,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      6,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''^[ -~]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.SetSMBGuestPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'Password': password,
      },
    );

    return SetSMBGuestPasswordOutput.fromJson(jsonResponse.body);
  }

  /// Shuts down a gateway. To specify which gateway to shut down, use the
  /// Amazon Resource Name (ARN) of the gateway in the body of your request.
  ///
  /// The operation shuts down the gateway service component running in the
  /// gateway's virtual machine (VM) and not the host VM.
  /// <note>
  /// If you want to shut down the VM, it is recommended that you first shut
  /// down the gateway component in the VM to avoid unpredictable conditions.
  /// </note>
  /// After the gateway is shutdown, you cannot call any other API except
  /// <a>StartGateway</a>, <a>DescribeGatewayInformation</a>, and
  /// <a>ListGateways</a>. For more information, see <a>ActivateGateway</a>.
  /// Your applications cannot read from or write to the gateway's storage
  /// volumes, and there are no snapshots taken.
  /// <note>
  /// When you make a shutdown request, you will get a <code>200 OK</code>
  /// success response immediately. However, it might take some time for the
  /// gateway to shut down. You can call the <a>DescribeGatewayInformation</a>
  /// API to check the status. For more information, see <a>ActivateGateway</a>.
  /// </note>
  /// If do not intend to use the gateway again, you must delete the gateway
  /// (using <a>DeleteGateway</a>) to no longer pay software charges associated
  /// with the gateway.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<ShutdownGatewayOutput> shutdownGateway({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ShutdownGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return ShutdownGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Start a test that verifies that the specified gateway is configured for
  /// High Availability monitoring in your host environment. This request only
  /// initiates the test and that a successful response only indicates that the
  /// test was started. It doesn't indicate that the test passed. For the status
  /// of the test, invoke the <code>DescribeAvailabilityMonitorTest</code> API.
  /// <note>
  /// Starting this test will cause your gateway to go offline for a brief
  /// period.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<StartAvailabilityMonitorTestOutput> startAvailabilityMonitorTest({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.StartAvailabilityMonitorTest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return StartAvailabilityMonitorTestOutput.fromJson(jsonResponse.body);
  }

  /// Starts a gateway that you previously shut down (see
  /// <a>ShutdownGateway</a>). After the gateway starts, you can then make other
  /// API calls, your applications can read from or write to the gateway's
  /// storage volumes and you will be able to take snapshot backups.
  /// <note>
  /// When you make a request, you will get a 200 OK success response
  /// immediately. However, it might take some time for the gateway to be ready.
  /// You should call <a>DescribeGatewayInformation</a> and check the status
  /// before making any additional API calls. For more information, see
  /// <a>ActivateGateway</a>.
  /// </note>
  /// To specify which gateway to start, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<StartGatewayOutput> startGateway({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.StartGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return StartGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Updates the automatic tape creation policy of a gateway. Use this to
  /// update the policy with a new set of automatic tape creation rules. This is
  /// only supported for tape gateways.
  ///
  /// By default, there is no automatic tape creation policy.
  /// <note>
  /// A gateway can have only one automatic tape creation policy.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [automaticTapeCreationRules] :
  /// An automatic tape creation policy consists of a list of automatic tape
  /// creation rules. The rules determine when and how to automatically create
  /// new tapes.
  Future<UpdateAutomaticTapeCreationPolicyOutput>
      updateAutomaticTapeCreationPolicy({
    @_s.required List<AutomaticTapeCreationRule> automaticTapeCreationRules,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(
        automaticTapeCreationRules, 'automaticTapeCreationRules');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StorageGateway_20130630.UpdateAutomaticTapeCreationPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutomaticTapeCreationRules': automaticTapeCreationRules,
        'GatewayARN': gatewayARN,
      },
    );

    return UpdateAutomaticTapeCreationPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Updates the bandwidth rate limits of a gateway. You can update both the
  /// upload and download bandwidth rate limit or specify only one of the two.
  /// If you don't set a bandwidth rate limit, the existing rate limit remains.
  /// This operation is supported for the stored volume, cached volume, and tape
  /// gateway types.
  ///
  /// By default, a gateway's bandwidth rate limits are not set. If you don't
  /// set any limit, the gateway does not have any limitations on its bandwidth
  /// usage and could potentially use the maximum available bandwidth.
  ///
  /// To specify which gateway to update, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [averageDownloadRateLimitInBitsPerSec] :
  /// The average download bandwidth rate limit in bits per second.
  ///
  /// Parameter [averageUploadRateLimitInBitsPerSec] :
  /// The average upload bandwidth rate limit in bits per second.
  Future<UpdateBandwidthRateLimitOutput> updateBandwidthRateLimit({
    @_s.required String gatewayARN,
    int averageDownloadRateLimitInBitsPerSec,
    int averageUploadRateLimitInBitsPerSec,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateNumRange(
      'averageDownloadRateLimitInBitsPerSec',
      averageDownloadRateLimitInBitsPerSec,
      102400,
      1152921504606846976,
    );
    _s.validateNumRange(
      'averageUploadRateLimitInBitsPerSec',
      averageUploadRateLimitInBitsPerSec,
      51200,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateBandwidthRateLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        if (averageDownloadRateLimitInBitsPerSec != null)
          'AverageDownloadRateLimitInBitsPerSec':
              averageDownloadRateLimitInBitsPerSec,
        if (averageUploadRateLimitInBitsPerSec != null)
          'AverageUploadRateLimitInBitsPerSec':
              averageUploadRateLimitInBitsPerSec,
      },
    );

    return UpdateBandwidthRateLimitOutput.fromJson(jsonResponse.body);
  }

  /// Updates the bandwidth rate limit schedule for a specified gateway. By
  /// default, gateways do not have bandwidth rate limit schedules, which means
  /// no bandwidth rate limiting is in effect. Use this to initiate or update a
  /// gateway's bandwidth rate limit schedule. This operation is supported in
  /// the volume and tape gateway types.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [bandwidthRateLimitIntervals] :
  /// An array containing bandwidth rate limit schedule intervals for a gateway.
  /// When no bandwidth rate limit intervals have been scheduled, the array is
  /// empty.
  Future<UpdateBandwidthRateLimitScheduleOutput>
      updateBandwidthRateLimitSchedule({
    @_s.required List<BandwidthRateLimitInterval> bandwidthRateLimitIntervals,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(
        bandwidthRateLimitIntervals, 'bandwidthRateLimitIntervals');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateBandwidthRateLimitSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BandwidthRateLimitIntervals': bandwidthRateLimitIntervals,
        'GatewayARN': gatewayARN,
      },
    );

    return UpdateBandwidthRateLimitScheduleOutput.fromJson(jsonResponse.body);
  }

  /// Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials
  /// for a specified iSCSI target. By default, a gateway does not have CHAP
  /// enabled; however, for added security, you might use it. This operation is
  /// supported in the volume and tape gateway types.
  /// <important>
  /// When you update CHAP credentials, all existing connections on the target
  /// are closed and initiators must reconnect with the new credentials.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [initiatorName] :
  /// The iSCSI initiator that connects to the target.
  ///
  /// Parameter [secretToAuthenticateInitiator] :
  /// The secret key that the initiator (for example, the Windows client) must
  /// provide to participate in mutual CHAP with the target.
  /// <note>
  /// The secret key must be between 12 and 16 bytes when encoded in UTF-8.
  /// </note>
  ///
  /// Parameter [targetARN] :
  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return the TargetARN for
  /// specified VolumeARN.
  ///
  /// Parameter [secretToAuthenticateTarget] :
  /// The secret key that the target must provide to participate in mutual CHAP
  /// with the initiator (e.g. Windows client).
  ///
  /// Byte constraints: Minimum bytes of 12. Maximum bytes of 16.
  /// <note>
  /// The secret key must be between 12 and 16 bytes when encoded in UTF-8.
  /// </note>
  Future<UpdateChapCredentialsOutput> updateChapCredentials({
    @_s.required String initiatorName,
    @_s.required String secretToAuthenticateInitiator,
    @_s.required String targetARN,
    String secretToAuthenticateTarget,
  }) async {
    ArgumentError.checkNotNull(initiatorName, 'initiatorName');
    _s.validateStringLength(
      'initiatorName',
      initiatorName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'initiatorName',
      initiatorName,
      r'''[0-9a-z:.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        secretToAuthenticateInitiator, 'secretToAuthenticateInitiator');
    _s.validateStringLength(
      'secretToAuthenticateInitiator',
      secretToAuthenticateInitiator,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetARN, 'targetARN');
    _s.validateStringLength(
      'targetARN',
      targetARN,
      50,
      800,
      isRequired: true,
    );
    _s.validateStringLength(
      'secretToAuthenticateTarget',
      secretToAuthenticateTarget,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateChapCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InitiatorName': initiatorName,
        'SecretToAuthenticateInitiator': secretToAuthenticateInitiator,
        'TargetARN': targetARN,
        if (secretToAuthenticateTarget != null)
          'SecretToAuthenticateTarget': secretToAuthenticateTarget,
      },
    );

    return UpdateChapCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Updates a gateway's metadata, which includes the gateway's name and time
  /// zone. To specify which gateway to update, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  /// <note>
  /// For gateways activated after September 2, 2015, the gateway's ARN contains
  /// the gateway ID rather than the gateway name. However, changing the name of
  /// the gateway has no effect on the gateway's ARN.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [cloudWatchLogGroupARN] :
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that you
  /// want to use to monitor and log events in the gateway.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What
  /// is Amazon CloudWatch Logs?</a>
  ///
  /// Parameter [gatewayTimezone] :
  /// A value that indicates the time zone of the gateway.
  Future<UpdateGatewayInformationOutput> updateGatewayInformation({
    @_s.required String gatewayARN,
    String cloudWatchLogGroupARN,
    String gatewayName,
    String gatewayTimezone,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudWatchLogGroupARN',
      cloudWatchLogGroupARN,
      0,
      562,
    );
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      2,
      255,
    );
    _s.validateStringPattern(
      'gatewayName',
      gatewayName,
      r'''^[ -\.0-\[\]-~]*[!-\.0-\[\]-~][ -\.0-\[\]-~]*$''',
    );
    _s.validateStringLength(
      'gatewayTimezone',
      gatewayTimezone,
      3,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateGatewayInformation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        if (cloudWatchLogGroupARN != null)
          'CloudWatchLogGroupARN': cloudWatchLogGroupARN,
        if (gatewayName != null) 'GatewayName': gatewayName,
        if (gatewayTimezone != null) 'GatewayTimezone': gatewayTimezone,
      },
    );

    return UpdateGatewayInformationOutput.fromJson(jsonResponse.body);
  }

  /// Updates the gateway virtual machine (VM) software. The request immediately
  /// triggers the software update.
  /// <note>
  /// When you make this request, you get a <code>200 OK</code> success response
  /// immediately. However, it might take some time for the update to complete.
  /// You can call <a>DescribeGatewayInformation</a> to verify the gateway is in
  /// the <code>STATE_RUNNING</code> state.
  /// </note> <important>
  /// A software update forces a system restart of your gateway. You can
  /// minimize the chance of any disruption to your applications by increasing
  /// your iSCSI Initiators' timeouts. For more information about increasing
  /// iSCSI Initiator timeouts for Windows and Linux, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings">Customizing
  /// your Windows iSCSI settings</a> and <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings">Customizing
  /// your Linux iSCSI settings</a>, respectively.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<UpdateGatewaySoftwareNowOutput> updateGatewaySoftwareNow({
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateGatewaySoftwareNow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
      },
    );

    return UpdateGatewaySoftwareNowOutput.fromJson(jsonResponse.body);
  }

  /// Updates a gateway's weekly maintenance start time information, including
  /// day and time of the week. The maintenance time is the time in your
  /// gateway's time zone.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [hourOfDay] :
  /// The hour component of the maintenance start time represented as <i>hh</i>,
  /// where <i>hh</i> is the hour (00 to 23). The hour of the day is in the time
  /// zone of the gateway.
  ///
  /// Parameter [minuteOfHour] :
  /// The minute component of the maintenance start time represented as
  /// <i>mm</i>, where <i>mm</i> is the minute (00 to 59). The minute of the
  /// hour is in the time zone of the gateway.
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month component of the maintenance start time represented
  /// as an ordinal number from 1 to 28, where 1 represents the first day of the
  /// month and 28 represents the last day of the month.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week component of the maintenance start time week
  /// represented as an ordinal number from 0 to 6, where 0 represents Sunday
  /// and 6 Saturday.
  Future<UpdateMaintenanceStartTimeOutput> updateMaintenanceStartTime({
    @_s.required String gatewayARN,
    @_s.required int hourOfDay,
    @_s.required int minuteOfHour,
    int dayOfMonth,
    int dayOfWeek,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(hourOfDay, 'hourOfDay');
    _s.validateNumRange(
      'hourOfDay',
      hourOfDay,
      0,
      23,
      isRequired: true,
    );
    ArgumentError.checkNotNull(minuteOfHour, 'minuteOfHour');
    _s.validateNumRange(
      'minuteOfHour',
      minuteOfHour,
      0,
      59,
      isRequired: true,
    );
    _s.validateNumRange(
      'dayOfMonth',
      dayOfMonth,
      1,
      28,
    );
    _s.validateNumRange(
      'dayOfWeek',
      dayOfWeek,
      0,
      6,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateMaintenanceStartTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'HourOfDay': hourOfDay,
        'MinuteOfHour': minuteOfHour,
        if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
        if (dayOfWeek != null) 'DayOfWeek': dayOfWeek,
      },
    );

    return UpdateMaintenanceStartTimeOutput.fromJson(jsonResponse.body);
  }

  /// Updates a Network File System (NFS) file share. This operation is only
  /// supported in the file gateway type.
  /// <note>
  /// To leave a file share field unchanged, set the corresponding input field
  /// to null.
  /// </note>
  /// Updates the following file share settings:
  ///
  /// <ul>
  /// <li>
  /// Default storage class for your S3 bucket
  /// </li>
  /// <li>
  /// Metadata defaults for your S3 bucket
  /// </li>
  /// <li>
  /// Allowed NFS clients for your file share
  /// </li>
  /// <li>
  /// Squash settings
  /// </li>
  /// <li>
  /// Write status of your file share
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARN] :
  /// The Amazon Resource Name (ARN) of the file share to be updated.
  ///
  /// Parameter [cacheAttributes] :
  /// Refresh cache information.
  ///
  /// Parameter [clientList] :
  /// The list of clients that are allowed to access the file gateway. The list
  /// must contain either valid IP addresses or valid CIDR blocks.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  ///
  /// Parameter [guessMIMETypeEnabled] :
  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to <code>true</code> to enable MIME
  /// type guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [nFSFileShareDefaults] :
  /// The default values for the file share. Optional.
  ///
  /// Parameter [notificationPolicy] :
  /// The notification policy of the file share.
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a file gateway puts objects into. The default value is
  /// <code>private</code>.
  ///
  /// Parameter [readOnly] :
  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [requesterPays] :
  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is
  /// the same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [squash] :
  /// The user mapped to anonymous user.
  ///
  /// Valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>RootSquash</code>: Only root is mapped to anonymous user.
  /// </li>
  /// <li>
  /// <code>NoSquash</code>: No one is mapped to anonymous user.
  /// </li>
  /// <li>
  /// <code>AllSquash</code>: Everyone is mapped to anonymous user.
  /// </li>
  /// </ul>
  Future<UpdateNFSFileShareOutput> updateNFSFileShare({
    @_s.required String fileShareARN,
    CacheAttributes cacheAttributes,
    List<String> clientList,
    String defaultStorageClass,
    String fileShareName,
    bool guessMIMETypeEnabled,
    bool kMSEncrypted,
    String kMSKey,
    NFSFileShareDefaults nFSFileShareDefaults,
    String notificationPolicy,
    ObjectACL objectACL,
    bool readOnly,
    bool requesterPays,
    String squash,
  }) async {
    ArgumentError.checkNotNull(fileShareARN, 'fileShareARN');
    _s.validateStringLength(
      'fileShareARN',
      fileShareARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultStorageClass',
      defaultStorageClass,
      5,
      50,
    );
    _s.validateStringLength(
      'fileShareName',
      fileShareName,
      1,
      255,
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'notificationPolicy',
      notificationPolicy,
      2,
      100,
    );
    _s.validateStringPattern(
      'notificationPolicy',
      notificationPolicy,
      r'''^\{[\w\s:\{\}\[\]"]*}$''',
    );
    _s.validateStringLength(
      'squash',
      squash,
      5,
      15,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateNFSFileShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARN': fileShareARN,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (clientList != null) 'ClientList': clientList,
        if (defaultStorageClass != null)
          'DefaultStorageClass': defaultStorageClass,
        if (fileShareName != null) 'FileShareName': fileShareName,
        if (guessMIMETypeEnabled != null)
          'GuessMIMETypeEnabled': guessMIMETypeEnabled,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (nFSFileShareDefaults != null)
          'NFSFileShareDefaults': nFSFileShareDefaults,
        if (notificationPolicy != null)
          'NotificationPolicy': notificationPolicy,
        if (objectACL != null) 'ObjectACL': objectACL.toValue(),
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (squash != null) 'Squash': squash,
      },
    );

    return UpdateNFSFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Updates a Server Message Block (SMB) file share. This operation is only
  /// supported for file gateways.
  /// <note>
  /// To leave a file share field unchanged, set the corresponding input field
  /// to null.
  /// </note> <important>
  /// File gateways require AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure that AWS STS is activated
  /// in the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in this AWS Region, activate it. For information about how to
  /// activate AWS STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARN] :
  /// The Amazon Resource Name (ARN) of the SMB file share that you want to
  /// update.
  ///
  /// Parameter [accessBasedEnumeration] :
  /// The files and folders on this share will only be visible to users with
  /// read access.
  ///
  /// Parameter [adminUserList] :
  /// A list of users or groups in the Active Directory that have administrator
  /// rights to the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  ///
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  ///
  /// Parameter [cacheAttributes] :
  /// Refresh cache information.
  ///
  /// Parameter [caseSensitivity] :
  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case
  /// sensitivity. The default value is <code>ClientSpecified</code>.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  ///
  /// Parameter [guessMIMETypeEnabled] :
  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to <code>true</code> to enable MIME
  /// type guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [invalidUserList] :
  /// A list of users or groups in the Active Directory that are not allowed to
  /// access the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  ///
  /// Parameter [kMSEncrypted] :
  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [kMSKey] :
  /// The Amazon Resource Name (ARN) of a symmetric customer master key (CMK)
  /// used for Amazon S3 server-side encryption. Storage Gateway does not
  /// support asymmetric CMKs. This value can only be set when
  /// <code>KMSEncrypted</code> is <code>true</code>. Optional.
  ///
  /// Parameter [notificationPolicy] :
  /// The notification policy of the file share.
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a file gateway puts objects into. The default value is
  /// <code>private</code>.
  ///
  /// Parameter [readOnly] :
  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [requesterPays] :
  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is
  /// the same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [sMBACLEnabled] :
  /// Set this value to <code>true</code> to enable access control list (ACL) on
  /// the SMB file share. Set it to <code>false</code> to map file and directory
  /// permissions to the POSIX permissions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using
  /// Microsoft Windows ACLs to control access to an SMB file share</a> in the
  /// <i>AWS Storage Gateway User Guide</i>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [validUserList] :
  /// A list of users or groups in the Active Directory that are allowed to
  /// access the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  Future<UpdateSMBFileShareOutput> updateSMBFileShare({
    @_s.required String fileShareARN,
    bool accessBasedEnumeration,
    List<String> adminUserList,
    String auditDestinationARN,
    CacheAttributes cacheAttributes,
    CaseSensitivity caseSensitivity,
    String defaultStorageClass,
    String fileShareName,
    bool guessMIMETypeEnabled,
    List<String> invalidUserList,
    bool kMSEncrypted,
    String kMSKey,
    String notificationPolicy,
    ObjectACL objectACL,
    bool readOnly,
    bool requesterPays,
    bool sMBACLEnabled,
    List<String> validUserList,
  }) async {
    ArgumentError.checkNotNull(fileShareARN, 'fileShareARN');
    _s.validateStringLength(
      'fileShareARN',
      fileShareARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'auditDestinationARN',
      auditDestinationARN,
      0,
      1024,
    );
    _s.validateStringLength(
      'defaultStorageClass',
      defaultStorageClass,
      5,
      50,
    );
    _s.validateStringLength(
      'fileShareName',
      fileShareName,
      1,
      255,
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''(^arn:(aws|aws-cn|aws-us-gov):kms:([a-zA-Z0-9-]+):([0-9]+):(key|alias)/(\S+)$)|(^alias/(\S+)$)''',
    );
    _s.validateStringLength(
      'notificationPolicy',
      notificationPolicy,
      2,
      100,
    );
    _s.validateStringPattern(
      'notificationPolicy',
      notificationPolicy,
      r'''^\{[\w\s:\{\}\[\]"]*}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateSMBFileShare'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileShareARN': fileShareARN,
        if (accessBasedEnumeration != null)
          'AccessBasedEnumeration': accessBasedEnumeration,
        if (adminUserList != null) 'AdminUserList': adminUserList,
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (caseSensitivity != null)
          'CaseSensitivity': caseSensitivity.toValue(),
        if (defaultStorageClass != null)
          'DefaultStorageClass': defaultStorageClass,
        if (fileShareName != null) 'FileShareName': fileShareName,
        if (guessMIMETypeEnabled != null)
          'GuessMIMETypeEnabled': guessMIMETypeEnabled,
        if (invalidUserList != null) 'InvalidUserList': invalidUserList,
        if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
        if (kMSKey != null) 'KMSKey': kMSKey,
        if (notificationPolicy != null)
          'NotificationPolicy': notificationPolicy,
        if (objectACL != null) 'ObjectACL': objectACL.toValue(),
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (sMBACLEnabled != null) 'SMBACLEnabled': sMBACLEnabled,
        if (validUserList != null) 'ValidUserList': validUserList,
      },
    );

    return UpdateSMBFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Controls whether the shares on a gateway are visible in a net view or
  /// browse list.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSharesVisible] :
  /// The shares on this gateway appear when listing shares.
  Future<UpdateSMBFileShareVisibilityOutput> updateSMBFileShareVisibility({
    @_s.required bool fileSharesVisible,
    @_s.required String gatewayARN,
  }) async {
    ArgumentError.checkNotNull(fileSharesVisible, 'fileSharesVisible');
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateSMBFileShareVisibility'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSharesVisible': fileSharesVisible,
        'GatewayARN': gatewayARN,
      },
    );

    return UpdateSMBFileShareVisibilityOutput.fromJson(jsonResponse.body);
  }

  /// Updates the SMB security strategy on a file gateway. This action is only
  /// supported in file gateways.
  /// <note>
  /// This API is called Security level in the User Guide.
  ///
  /// A higher security level can affect performance of the gateway.
  /// </note>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [sMBSecurityStrategy] :
  /// Specifies the type of security strategy.
  ///
  /// ClientSpecified: if you use this option, requests are established based on
  /// what is negotiated by the client. This option is recommended when you want
  /// to maximize compatibility across different clients in your environment.
  ///
  /// MandatorySigning: if you use this option, file gateway only allows
  /// connections from SMBv2 or SMBv3 clients that have signing enabled. This
  /// option works with SMB clients on Microsoft Windows Vista, Windows Server
  /// 2008 or newer.
  ///
  /// MandatoryEncryption: if you use this option, file gateway only allows
  /// connections from SMBv3 clients that have encryption enabled. This option
  /// is highly recommended for environments that handle sensitive data. This
  /// option works with SMB clients on Microsoft Windows 8, Windows Server 2012
  /// or newer.
  Future<UpdateSMBSecurityStrategyOutput> updateSMBSecurityStrategy({
    @_s.required String gatewayARN,
    @_s.required SMBSecurityStrategy sMBSecurityStrategy,
  }) async {
    ArgumentError.checkNotNull(gatewayARN, 'gatewayARN');
    _s.validateStringLength(
      'gatewayARN',
      gatewayARN,
      50,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sMBSecurityStrategy, 'sMBSecurityStrategy');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateSMBSecurityStrategy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'SMBSecurityStrategy': sMBSecurityStrategy?.toValue() ?? '',
      },
    );

    return UpdateSMBSecurityStrategyOutput.fromJson(jsonResponse.body);
  }

  /// Updates a snapshot schedule configured for a gateway volume. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  ///
  /// The default snapshot schedule for volume is once every 24 hours, starting
  /// at the creation time of the volume. You can use this API to change the
  /// snapshot schedule configured for the volume.
  ///
  /// In the request you must identify the gateway volume whose snapshot
  /// schedule you want to update, and the schedule information, including when
  /// you want the snapshot to begin on a day and the frequency (in hours) of
  /// snapshots.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [recurrenceInHours] :
  /// Frequency of snapshots. Specify the number of hours between snapshots.
  ///
  /// Parameter [startAt] :
  /// The hour of the day at which the snapshot schedule begins represented as
  /// <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is
  /// in the time zone of the gateway.
  ///
  /// Parameter [volumeARN] :
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  ///
  /// Parameter [description] :
  /// Optional description of the snapshot that overwrites the existing
  /// description.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to a snapshot. Each tag is a
  /// key-value pair.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  /// </note>
  Future<UpdateSnapshotScheduleOutput> updateSnapshotSchedule({
    @_s.required int recurrenceInHours,
    @_s.required int startAt,
    @_s.required String volumeARN,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(recurrenceInHours, 'recurrenceInHours');
    _s.validateNumRange(
      'recurrenceInHours',
      recurrenceInHours,
      1,
      24,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startAt, 'startAt');
    _s.validateNumRange(
      'startAt',
      startAt,
      0,
      23,
      isRequired: true,
    );
    ArgumentError.checkNotNull(volumeARN, 'volumeARN');
    _s.validateStringLength(
      'volumeARN',
      volumeARN,
      50,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateSnapshotSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RecurrenceInHours': recurrenceInHours,
        'StartAt': startAt,
        'VolumeARN': volumeARN,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return UpdateSnapshotScheduleOutput.fromJson(jsonResponse.body);
  }

  /// Updates the type of medium changer in a tape gateway. When you activate a
  /// tape gateway, you select a medium changer type for the tape gateway. This
  /// operation enables you to select a different type of medium changer after a
  /// tape gateway is activated. This operation is only supported in the tape
  /// gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [deviceType] :
  /// The type of medium changer you want to select.
  ///
  /// Valid Values: <code>STK-L700</code> | <code>AWS-Gateway-VTL</code> |
  /// <code>IBM-03584L32-0402</code>
  ///
  /// Parameter [vTLDeviceARN] :
  /// The Amazon Resource Name (ARN) of the medium changer you want to select.
  Future<UpdateVTLDeviceTypeOutput> updateVTLDeviceType({
    @_s.required String deviceType,
    @_s.required String vTLDeviceARN,
  }) async {
    ArgumentError.checkNotNull(deviceType, 'deviceType');
    _s.validateStringLength(
      'deviceType',
      deviceType,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vTLDeviceARN, 'vTLDeviceARN');
    _s.validateStringLength(
      'vTLDeviceARN',
      vTLDeviceARN,
      50,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateVTLDeviceType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceType': deviceType,
        'VTLDeviceARN': vTLDeviceARN,
      },
    );

    return UpdateVTLDeviceTypeOutput.fromJson(jsonResponse.body);
  }
}

/// AWS Storage Gateway returns the Amazon Resource Name (ARN) of the activated
/// gateway. It is a string made of information such as your account, gateway
/// name, and AWS Region. This ARN is used to reference the gateway in other API
/// operations as well as resource-based authorization.
/// <note>
/// For gateways activated prior to September 02, 2015, the gateway ARN contains
/// the gateway name rather than the gateway ID. Changing the name of the
/// gateway has no effect on the gateway ARN.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivateGatewayOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  ActivateGatewayOutput({
    this.gatewayARN,
  });
  factory ActivateGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$ActivateGatewayOutputFromJson(json);
}

enum ActiveDirectoryStatus {
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('DETACHED')
  detached,
  @_s.JsonValue('JOINED')
  joined,
  @_s.JsonValue('JOINING')
  joining,
  @_s.JsonValue('NETWORK_ERROR')
  networkError,
  @_s.JsonValue('TIMEOUT')
  timeout,
  @_s.JsonValue('UNKNOWN_ERROR')
  unknownError,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddCacheOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  AddCacheOutput({
    this.gatewayARN,
  });
  factory AddCacheOutput.fromJson(Map<String, dynamic> json) =>
      _$AddCacheOutputFromJson(json);
}

/// AddTagsToResourceOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsToResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  AddTagsToResourceOutput({
    this.resourceARN,
  });
  factory AddTagsToResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$AddTagsToResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddUploadBufferOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  AddUploadBufferOutput({
    this.gatewayARN,
  });
  factory AddUploadBufferOutput.fromJson(Map<String, dynamic> json) =>
      _$AddUploadBufferOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway for
/// which working storage was configured.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddWorkingStorageOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  AddWorkingStorageOutput({
    this.gatewayARN,
  });
  factory AddWorkingStorageOutput.fromJson(Map<String, dynamic> json) =>
      _$AddWorkingStorageOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssignTapePoolOutput {
  /// The unique Amazon Resource Names (ARN) of the virtual tape that was added to
  /// the tape pool.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  AssignTapePoolOutput({
    this.tapeARN,
  });
  factory AssignTapePoolOutput.fromJson(Map<String, dynamic> json) =>
      _$AssignTapePoolOutputFromJson(json);
}

/// AttachVolumeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name for the initiator that was used to connect to the target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  /// The Amazon Resource Name (ARN) of the volume that was attached to the
  /// gateway.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  AttachVolumeOutput({
    this.targetARN,
    this.volumeARN,
  });
  factory AttachVolumeOutput.fromJson(Map<String, dynamic> json) =>
      _$AttachVolumeOutputFromJson(json);
}

/// Information about the gateway's automatic tape creation policies, including
/// the automatic tape creation rules and the gateway that is using the
/// policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutomaticTapeCreationPolicyInfo {
  /// An automatic tape creation policy consists of a list of automatic tape
  /// creation rules. This returns the rules that determine when and how to
  /// automatically create new tapes.
  @_s.JsonKey(name: 'AutomaticTapeCreationRules')
  final List<AutomaticTapeCreationRule> automaticTapeCreationRules;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  AutomaticTapeCreationPolicyInfo({
    this.automaticTapeCreationRules,
    this.gatewayARN,
  });
  factory AutomaticTapeCreationPolicyInfo.fromJson(Map<String, dynamic> json) =>
      _$AutomaticTapeCreationPolicyInfoFromJson(json);
}

/// An automatic tape creation policy consists of automatic tape creation rules
/// where each rule defines when and how to create new tapes. For more
/// information about automatic tape creation, see <a
/// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically">Creating
/// Tapes Automatically</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutomaticTapeCreationRule {
  /// The minimum number of available virtual tapes that the gateway maintains at
  /// all times. If the number of tapes on the gateway goes below this value, the
  /// gateway creates as many new tapes as are needed to have
  /// <code>MinimumNumTapes</code> on the gateway. For more information about
  /// automatic tape creation, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically">Creating
  /// Tapes Automatically</a>.
  @_s.JsonKey(name: 'MinimumNumTapes')
  final int minimumNumTapes;

  /// The ID of the pool that you want to add your tape to for archiving. The tape
  /// in this pool is archived in the Amazon S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (S3 Glacier or S3 Glacier
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  @_s.JsonKey(name: 'PoolId')
  final String poolId;

  /// A prefix that you append to the barcode of the virtual tape that you are
  /// creating. This prefix makes the barcode unique.
  /// <note>
  /// The prefix must be 1-4 characters in length and must be one of the uppercase
  /// letters from A to Z.
  /// </note>
  @_s.JsonKey(name: 'TapeBarcodePrefix')
  final String tapeBarcodePrefix;

  /// The size, in bytes, of the virtual tape capacity.
  @_s.JsonKey(name: 'TapeSizeInBytes')
  final int tapeSizeInBytes;

  /// Set to <code>true</code> to indicate that tapes are to be archived as
  /// write-once-read-many (WORM). Set to <code>false</code> when WORM is not
  /// enabled for tapes.
  @_s.JsonKey(name: 'Worm')
  final bool worm;

  AutomaticTapeCreationRule({
    @_s.required this.minimumNumTapes,
    @_s.required this.poolId,
    @_s.required this.tapeBarcodePrefix,
    @_s.required this.tapeSizeInBytes,
    this.worm,
  });
  factory AutomaticTapeCreationRule.fromJson(Map<String, dynamic> json) =>
      _$AutomaticTapeCreationRuleFromJson(json);

  Map<String, dynamic> toJson() => _$AutomaticTapeCreationRuleToJson(this);
}

enum AvailabilityMonitorTestStatus {
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('PENDING')
  pending,
}

/// Describes a bandwidth rate limit interval for a gateway. A bandwidth rate
/// limit schedule consists of one or more bandwidth rate limit intervals. A
/// bandwidth rate limit interval defines a period of time on one or more days
/// of the week, during which bandwidth rate limits are specified for uploading,
/// downloading, or both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BandwidthRateLimitInterval {
  /// The days of the week component of the bandwidth rate limit interval,
  /// represented as ordinal numbers from 0 to 6, where 0 represents Sunday and 6
  /// Saturday.
  @_s.JsonKey(name: 'DaysOfWeek')
  final List<int> daysOfWeek;

  /// The hour of the day to end the bandwidth rate limit interval.
  @_s.JsonKey(name: 'EndHourOfDay')
  final int endHourOfDay;

  /// The minute of the hour to end the bandwidth rate limit interval.
  /// <important>
  /// The bandwidth rate limit interval ends at the end of the minute. To end an
  /// interval at the end of an hour, use the value <code>59</code>.
  /// </important>
  @_s.JsonKey(name: 'EndMinuteOfHour')
  final int endMinuteOfHour;

  /// The hour of the day to start the bandwidth rate limit interval.
  @_s.JsonKey(name: 'StartHourOfDay')
  final int startHourOfDay;

  /// The minute of the hour to start the bandwidth rate limit interval. The
  /// interval begins at the start of that minute. To begin an interval exactly at
  /// the start of the hour, use the value <code>0</code>.
  @_s.JsonKey(name: 'StartMinuteOfHour')
  final int startMinuteOfHour;

  /// The average download rate limit component of the bandwidth rate limit
  /// interval, in bits per second. This field does not appear in the response if
  /// the download rate limit is not set.
  @_s.JsonKey(name: 'AverageDownloadRateLimitInBitsPerSec')
  final int averageDownloadRateLimitInBitsPerSec;

  /// The average upload rate limit component of the bandwidth rate limit
  /// interval, in bits per second. This field does not appear in the response if
  /// the upload rate limit is not set.
  @_s.JsonKey(name: 'AverageUploadRateLimitInBitsPerSec')
  final int averageUploadRateLimitInBitsPerSec;

  BandwidthRateLimitInterval({
    @_s.required this.daysOfWeek,
    @_s.required this.endHourOfDay,
    @_s.required this.endMinuteOfHour,
    @_s.required this.startHourOfDay,
    @_s.required this.startMinuteOfHour,
    this.averageDownloadRateLimitInBitsPerSec,
    this.averageUploadRateLimitInBitsPerSec,
  });
  factory BandwidthRateLimitInterval.fromJson(Map<String, dynamic> json) =>
      _$BandwidthRateLimitIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$BandwidthRateLimitIntervalToJson(this);
}

/// Lists refresh cache information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CacheAttributes {
  /// Refreshes a file share's cache by using Time To Live (TTL). TTL is the
  /// length of time since the last refresh after which access to the directory
  /// would cause the file gateway to first refresh that directory's contents from
  /// the Amazon S3 bucket. The TTL duration is in seconds.
  ///
  /// Valid Values: 300 to 2,592,000 seconds (5 minutes to 30 days)
  @_s.JsonKey(name: 'CacheStaleTimeoutInSeconds')
  final int cacheStaleTimeoutInSeconds;

  CacheAttributes({
    this.cacheStaleTimeoutInSeconds,
  });
  factory CacheAttributes.fromJson(Map<String, dynamic> json) =>
      _$CacheAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$CacheAttributesToJson(this);
}

/// Describes an iSCSI cached volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CachediSCSIVolume {
  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this timestamp.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;

  /// If the cached volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g., snap-78e22663. Otherwise, this field is not
  /// included.
  @_s.JsonKey(name: 'SourceSnapshotId')
  final String sourceSnapshotId;

  /// The name of the iSCSI target used by an initiator to connect to a volume and
  /// used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  @_s.JsonKey(name: 'TargetName')
  final String targetName;

  /// The Amazon Resource Name (ARN) of the storage volume.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// A value that indicates whether a storage volume is attached to or detached
  /// from a gateway. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving
  /// your volumes to a different gateway</a>.
  @_s.JsonKey(name: 'VolumeAttachmentStatus')
  final String volumeAttachmentStatus;

  /// The unique identifier of the volume, e.g., vol-AE4B946D.
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the cached volume is not restoring or
  /// bootstrapping.
  @_s.JsonKey(name: 'VolumeProgress')
  final double volumeProgress;

  /// The size, in bytes, of the volume capacity.
  @_s.JsonKey(name: 'VolumeSizeInBytes')
  final int volumeSizeInBytes;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  @_s.JsonKey(name: 'VolumeStatus')
  final String volumeStatus;

  /// One of the VolumeType enumeration values that describes the type of the
  /// volume.
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  /// The size of the data stored on the volume in bytes. This value is calculated
  /// based on the number of blocks that are touched, instead of the actual amount
  /// of data written. This value can be useful for sequential write patterns but
  /// less accurate for random write patterns. <code>VolumeUsedInBytes</code> is
  /// different from the compressed size of the volume, which is the value that is
  /// used to calculate your bill.
  /// <note>
  /// This value is not available for volumes created prior to May 13, 2015, until
  /// you store data on the volume.
  /// </note>
  @_s.JsonKey(name: 'VolumeUsedInBytes')
  final int volumeUsedInBytes;

  /// An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI
  /// attributes for one stored volume.
  @_s.JsonKey(name: 'VolumeiSCSIAttributes')
  final VolumeiSCSIAttributes volumeiSCSIAttributes;

  CachediSCSIVolume({
    this.createdDate,
    this.kMSKey,
    this.sourceSnapshotId,
    this.targetName,
    this.volumeARN,
    this.volumeAttachmentStatus,
    this.volumeId,
    this.volumeProgress,
    this.volumeSizeInBytes,
    this.volumeStatus,
    this.volumeType,
    this.volumeUsedInBytes,
    this.volumeiSCSIAttributes,
  });
  factory CachediSCSIVolume.fromJson(Map<String, dynamic> json) =>
      _$CachediSCSIVolumeFromJson(json);
}

/// CancelArchivalOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelArchivalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which archiving was
  /// canceled.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  CancelArchivalOutput({
    this.tapeARN,
  });
  factory CancelArchivalOutput.fromJson(Map<String, dynamic> json) =>
      _$CancelArchivalOutputFromJson(json);
}

/// CancelRetrievalOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelRetrievalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which retrieval was
  /// canceled.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  CancelRetrievalOutput({
    this.tapeARN,
  });
  factory CancelRetrievalOutput.fromJson(Map<String, dynamic> json) =>
      _$CancelRetrievalOutputFromJson(json);
}

enum CaseSensitivity {
  @_s.JsonValue('ClientSpecified')
  clientSpecified,
  @_s.JsonValue('CaseSensitive')
  caseSensitive,
}

extension on CaseSensitivity {
  String toValue() {
    switch (this) {
      case CaseSensitivity.clientSpecified:
        return 'ClientSpecified';
      case CaseSensitivity.caseSensitive:
        return 'CaseSensitive';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes Challenge-Handshake Authentication Protocol (CHAP) information
/// that supports authentication between your gateway and iSCSI initiators.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChapInfo {
  /// The iSCSI initiator that connects to the target.
  @_s.JsonKey(name: 'InitiatorName')
  final String initiatorName;

  /// The secret key that the initiator (for example, the Windows client) must
  /// provide to participate in mutual CHAP with the target.
  @_s.JsonKey(name: 'SecretToAuthenticateInitiator')
  final String secretToAuthenticateInitiator;

  /// The secret key that the target must provide to participate in mutual CHAP
  /// with the initiator (e.g., Windows client).
  @_s.JsonKey(name: 'SecretToAuthenticateTarget')
  final String secretToAuthenticateTarget;

  /// The Amazon Resource Name (ARN) of the volume.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  ChapInfo({
    this.initiatorName,
    this.secretToAuthenticateInitiator,
    this.secretToAuthenticateTarget,
    this.targetARN,
  });
  factory ChapInfo.fromJson(Map<String, dynamic> json) =>
      _$ChapInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCachediSCSIVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  /// The Amazon Resource Name (ARN) of the configured volume.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  CreateCachediSCSIVolumeOutput({
    this.targetARN,
    this.volumeARN,
  });
  factory CreateCachediSCSIVolumeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateCachediSCSIVolumeOutputFromJson(json);
}

/// CreateNFSFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNFSFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;

  CreateNFSFileShareOutput({
    this.fileShareARN,
  });
  factory CreateNFSFileShareOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateNFSFileShareOutputFromJson(json);
}

/// CreateSMBFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSMBFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;

  CreateSMBFileShareOutput({
    this.fileShareARN,
  });
  factory CreateSMBFileShareOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateSMBFileShareOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSnapshotFromVolumeRecoveryPointOutput {
  /// The ID of the snapshot.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// The time the volume was created from the recovery point.
  @_s.JsonKey(name: 'VolumeRecoveryPointTime')
  final String volumeRecoveryPointTime;

  CreateSnapshotFromVolumeRecoveryPointOutput({
    this.snapshotId,
    this.volumeARN,
    this.volumeRecoveryPointTime,
  });
  factory CreateSnapshotFromVolumeRecoveryPointOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSnapshotFromVolumeRecoveryPointOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSnapshotOutput {
  /// The snapshot ID that is used to refer to the snapshot in future operations
  /// such as describing snapshots (Amazon Elastic Compute Cloud API
  /// <code>DescribeSnapshots</code>) or creating a volume from a snapshot
  /// (<a>CreateStorediSCSIVolume</a>).
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The Amazon Resource Name (ARN) of the volume of which the snapshot was
  /// taken.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  CreateSnapshotOutput({
    this.snapshotId,
    this.volumeARN,
  });
  factory CreateSnapshotOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateSnapshotOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStorediSCSIVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  /// The Amazon Resource Name (ARN) of the configured volume.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// The size of the volume in bytes.
  @_s.JsonKey(name: 'VolumeSizeInBytes')
  final int volumeSizeInBytes;

  CreateStorediSCSIVolumeOutput({
    this.targetARN,
    this.volumeARN,
    this.volumeSizeInBytes,
  });
  factory CreateStorediSCSIVolumeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateStorediSCSIVolumeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTapePoolOutput {
  /// The unique Amazon Resource Name (ARN) that represents the custom tape pool.
  /// Use the <a>ListTapePools</a> operation to return a list of tape pools for
  /// your account and AWS Region.
  @_s.JsonKey(name: 'PoolARN')
  final String poolARN;

  CreateTapePoolOutput({
    this.poolARN,
  });
  factory CreateTapePoolOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTapePoolOutputFromJson(json);
}

/// CreateTapeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTapeWithBarcodeOutput {
  /// A unique Amazon Resource Name (ARN) that represents the virtual tape that
  /// was created.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  CreateTapeWithBarcodeOutput({
    this.tapeARN,
  });
  factory CreateTapeWithBarcodeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTapeWithBarcodeOutputFromJson(json);
}

/// CreateTapeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTapesOutput {
  /// A list of unique Amazon Resource Names (ARNs) that represents the virtual
  /// tapes that were created.
  @_s.JsonKey(name: 'TapeARNs')
  final List<String> tapeARNs;

  CreateTapesOutput({
    this.tapeARNs,
  });
  factory CreateTapesOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTapesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAutomaticTapeCreationPolicyOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DeleteAutomaticTapeCreationPolicyOutput({
    this.gatewayARN,
  });
  factory DeleteAutomaticTapeCreationPolicyOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAutomaticTapeCreationPolicyOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// bandwidth rate information was deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBandwidthRateLimitOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DeleteBandwidthRateLimitOutput({
    this.gatewayARN,
  });
  factory DeleteBandwidthRateLimitOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBandwidthRateLimitOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteChapCredentialsOutput {
  /// The iSCSI initiator that connects to the target.
  @_s.JsonKey(name: 'InitiatorName')
  final String initiatorName;

  /// The Amazon Resource Name (ARN) of the target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  DeleteChapCredentialsOutput({
    this.initiatorName,
    this.targetARN,
  });
  factory DeleteChapCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteChapCredentialsOutputFromJson(json);
}

/// DeleteFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFileShareOutput {
  /// The Amazon Resource Name (ARN) of the deleted file share.
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;

  DeleteFileShareOutput({
    this.fileShareARN,
  });
  factory DeleteFileShareOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileShareOutputFromJson(json);
}

/// A JSON object containing the ID of the deleted gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGatewayOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DeleteGatewayOutput({
    this.gatewayARN,
  });
  factory DeleteGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGatewayOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSnapshotScheduleOutput {
  /// The volume which snapshot schedule was deleted.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  DeleteSnapshotScheduleOutput({
    this.volumeARN,
  });
  factory DeleteSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteSnapshotScheduleOutputFromJson(json);
}

/// DeleteTapeArchiveOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape that was deleted from the
  /// virtual tape shelf (VTS).
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  DeleteTapeArchiveOutput({
    this.tapeARN,
  });
  factory DeleteTapeArchiveOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTapeArchiveOutputFromJson(json);
}

/// DeleteTapeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTapeOutput {
  /// The Amazon Resource Name (ARN) of the deleted virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  DeleteTapeOutput({
    this.tapeARN,
  });
  factory DeleteTapeOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTapeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTapePoolOutput {
  /// The Amazon Resource Name (ARN) of the custom tape pool being deleted.
  @_s.JsonKey(name: 'PoolARN')
  final String poolARN;

  DeleteTapePoolOutput({
    this.poolARN,
  });
  factory DeleteTapePoolOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTapePoolOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the storage
/// volume that was deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVolumeOutput {
  /// The Amazon Resource Name (ARN) of the storage volume that was deleted. It is
  /// the same ARN you provided in the request.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  DeleteVolumeOutput({
    this.volumeARN,
  });
  factory DeleteVolumeOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVolumeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAvailabilityMonitorTestOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The time the High Availability monitoring test was started. If a test hasn't
  /// been performed, the value of this field is null.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the High Availability monitoring test. If a test hasn't been
  /// performed, the value of this field is null.
  @_s.JsonKey(name: 'Status')
  final AvailabilityMonitorTestStatus status;

  DescribeAvailabilityMonitorTestOutput({
    this.gatewayARN,
    this.startTime,
    this.status,
  });
  factory DescribeAvailabilityMonitorTestOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAvailabilityMonitorTestOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBandwidthRateLimitOutput {
  /// The average download bandwidth rate limit in bits per second. This field
  /// does not appear in the response if the download rate limit is not set.
  @_s.JsonKey(name: 'AverageDownloadRateLimitInBitsPerSec')
  final int averageDownloadRateLimitInBitsPerSec;

  /// The average upload bandwidth rate limit in bits per second. This field does
  /// not appear in the response if the upload rate limit is not set.
  @_s.JsonKey(name: 'AverageUploadRateLimitInBitsPerSec')
  final int averageUploadRateLimitInBitsPerSec;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DescribeBandwidthRateLimitOutput({
    this.averageDownloadRateLimitInBitsPerSec,
    this.averageUploadRateLimitInBitsPerSec,
    this.gatewayARN,
  });
  factory DescribeBandwidthRateLimitOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBandwidthRateLimitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBandwidthRateLimitScheduleOutput {
  /// An array that contains the bandwidth rate limit intervals for a tape or
  /// volume gateway.
  @_s.JsonKey(name: 'BandwidthRateLimitIntervals')
  final List<BandwidthRateLimitInterval> bandwidthRateLimitIntervals;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DescribeBandwidthRateLimitScheduleOutput({
    this.bandwidthRateLimitIntervals,
    this.gatewayARN,
  });
  factory DescribeBandwidthRateLimitScheduleOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBandwidthRateLimitScheduleOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCacheOutput {
  /// The amount of cache in bytes allocated to a gateway.
  @_s.JsonKey(name: 'CacheAllocatedInBytes')
  final int cacheAllocatedInBytes;

  /// The file share's contribution to the overall percentage of the gateway's
  /// cache that has not been persisted to AWS. The sample is taken at the end of
  /// the reporting period.
  @_s.JsonKey(name: 'CacheDirtyPercentage')
  final double cacheDirtyPercentage;

  /// Percent of application read operations from the file shares that are served
  /// from cache. The sample is taken at the end of the reporting period.
  @_s.JsonKey(name: 'CacheHitPercentage')
  final double cacheHitPercentage;

  /// Percent of application read operations from the file shares that are not
  /// served from cache. The sample is taken at the end of the reporting period.
  @_s.JsonKey(name: 'CacheMissPercentage')
  final double cacheMissPercentage;

  /// Percent use of the gateway's cache storage. This metric applies only to the
  /// gateway-cached volume setup. The sample is taken at the end of the reporting
  /// period.
  @_s.JsonKey(name: 'CacheUsedPercentage')
  final double cacheUsedPercentage;

  /// An array of strings that identify disks that are to be configured as working
  /// storage. Each string has a minimum length of 1 and maximum length of 300.
  /// You can get the disk IDs from the <a>ListLocalDisks</a> API.
  @_s.JsonKey(name: 'DiskIds')
  final List<String> diskIds;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DescribeCacheOutput({
    this.cacheAllocatedInBytes,
    this.cacheDirtyPercentage,
    this.cacheHitPercentage,
    this.cacheMissPercentage,
    this.cacheUsedPercentage,
    this.diskIds,
    this.gatewayARN,
  });
  factory DescribeCacheOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeCacheOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCachediSCSIVolumesOutput {
  /// An array of objects where each object contains metadata about one cached
  /// volume.
  @_s.JsonKey(name: 'CachediSCSIVolumes')
  final List<CachediSCSIVolume> cachediSCSIVolumes;

  DescribeCachediSCSIVolumesOutput({
    this.cachediSCSIVolumes,
  });
  factory DescribeCachediSCSIVolumesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCachediSCSIVolumesOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChapCredentialsOutput {
  /// An array of <a>ChapInfo</a> objects that represent CHAP credentials. Each
  /// object in the array contains CHAP credential information for one
  /// target-initiator pair. If no CHAP credentials are set, an empty array is
  /// returned. CHAP credential information is provided in a JSON object with the
  /// following fields:
  ///
  /// <ul>
  /// <li>
  /// <b>InitiatorName</b>: The iSCSI initiator that connects to the target.
  /// </li>
  /// <li>
  /// <b>SecretToAuthenticateInitiator</b>: The secret key that the initiator (for
  /// example, the Windows client) must provide to participate in mutual CHAP with
  /// the target.
  /// </li>
  /// <li>
  /// <b>SecretToAuthenticateTarget</b>: The secret key that the target must
  /// provide to participate in mutual CHAP with the initiator (e.g. Windows
  /// client).
  /// </li>
  /// <li>
  /// <b>TargetARN</b>: The Amazon Resource Name (ARN) of the storage volume.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ChapCredentials')
  final List<ChapInfo> chapCredentials;

  DescribeChapCredentialsOutput({
    this.chapCredentials,
  });
  factory DescribeChapCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeChapCredentialsOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGatewayInformationOutput {
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is
  /// used to monitor events in the gateway.
  @_s.JsonKey(name: 'CloudWatchLogGroupARN')
  final String cloudWatchLogGroupARN;

  /// Date after which this gateway will not receive software updates for new
  /// features and bug fixes.
  @_s.JsonKey(name: 'DeprecationDate')
  final String deprecationDate;

  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  @_s.JsonKey(name: 'Ec2InstanceId')
  final String ec2InstanceId;

  /// The AWS Region where the Amazon EC2 instance is located.
  @_s.JsonKey(name: 'Ec2InstanceRegion')
  final String ec2InstanceRegion;

  /// The type of endpoint for your gateway.
  ///
  /// Valid Values: <code>STANDARD</code> | <code>FIPS</code>
  @_s.JsonKey(name: 'EndpointType')
  final String endpointType;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  @_s.JsonKey(name: 'GatewayId')
  final String gatewayId;

  /// The name you configured for your gateway.
  @_s.JsonKey(name: 'GatewayName')
  final String gatewayName;

  /// A <a>NetworkInterface</a> array that contains descriptions of the gateway
  /// network interfaces.
  @_s.JsonKey(name: 'GatewayNetworkInterfaces')
  final List<NetworkInterface> gatewayNetworkInterfaces;

  /// A value that indicates the operating state of the gateway.
  @_s.JsonKey(name: 'GatewayState')
  final String gatewayState;

  /// A value that indicates the time zone configured for the gateway.
  @_s.JsonKey(name: 'GatewayTimezone')
  final String gatewayTimezone;

  /// The type of the gateway.
  @_s.JsonKey(name: 'GatewayType')
  final String gatewayType;

  /// The type of hypervisor environment used by the host.
  @_s.JsonKey(name: 'HostEnvironment')
  final HostEnvironment hostEnvironment;

  /// The date on which the last software update was applied to the gateway. If
  /// the gateway has never been updated, this field does not return a value in
  /// the response.
  @_s.JsonKey(name: 'LastSoftwareUpdate')
  final String lastSoftwareUpdate;

  /// The date on which an update to the gateway is available. This date is in the
  /// time zone of the gateway. If the gateway is not available for an update this
  /// field is not returned in the response.
  @_s.JsonKey(name: 'NextUpdateAvailabilityDate')
  final String nextUpdateAvailabilityDate;

  /// Date after which this gateway will not receive software updates for new
  /// features.
  @_s.JsonKey(name: 'SoftwareUpdatesEndDate')
  final String softwareUpdatesEndDate;

  /// A list of up to 50 tags assigned to the gateway, sorted alphabetically by
  /// key name. Each tag is a key-value pair. For a gateway with more than 10 tags
  /// assigned, you can view all tags using the <code>ListTagsForResource</code>
  /// API operation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The configuration settings for the virtual private cloud (VPC) endpoint for
  /// your gateway.
  @_s.JsonKey(name: 'VPCEndpoint')
  final String vPCEndpoint;

  DescribeGatewayInformationOutput({
    this.cloudWatchLogGroupARN,
    this.deprecationDate,
    this.ec2InstanceId,
    this.ec2InstanceRegion,
    this.endpointType,
    this.gatewayARN,
    this.gatewayId,
    this.gatewayName,
    this.gatewayNetworkInterfaces,
    this.gatewayState,
    this.gatewayTimezone,
    this.gatewayType,
    this.hostEnvironment,
    this.lastSoftwareUpdate,
    this.nextUpdateAvailabilityDate,
    this.softwareUpdatesEndDate,
    this.tags,
    this.vPCEndpoint,
  });
  factory DescribeGatewayInformationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGatewayInformationOutputFromJson(json);
}

/// A JSON object containing the following fields:
///
/// <ul>
/// <li>
/// <a>DescribeMaintenanceStartTimeOutput$DayOfMonth</a>
/// </li>
/// <li>
/// <a>DescribeMaintenanceStartTimeOutput$DayOfWeek</a>
/// </li>
/// <li>
/// <a>DescribeMaintenanceStartTimeOutput$HourOfDay</a>
/// </li>
/// <li>
/// <a>DescribeMaintenanceStartTimeOutput$MinuteOfHour</a>
/// </li>
/// <li>
/// <a>DescribeMaintenanceStartTimeOutput$Timezone</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMaintenanceStartTimeOutput {
  /// The day of the month component of the maintenance start time represented as
  /// an ordinal number from 1 to 28, where 1 represents the first day of the
  /// month and 28 represents the last day of the month.
  @_s.JsonKey(name: 'DayOfMonth')
  final int dayOfMonth;

  /// An ordinal number between 0 and 6 that represents the day of the week, where
  /// 0 represents Sunday and 6 represents Saturday. The day of week is in the
  /// time zone of the gateway.
  @_s.JsonKey(name: 'DayOfWeek')
  final int dayOfWeek;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The hour component of the maintenance start time represented as <i>hh</i>,
  /// where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time
  /// zone of the gateway.
  @_s.JsonKey(name: 'HourOfDay')
  final int hourOfDay;

  /// The minute component of the maintenance start time represented as <i>mm</i>,
  /// where <i>mm</i> is the minute (0 to 59). The minute of the hour is in the
  /// time zone of the gateway.
  @_s.JsonKey(name: 'MinuteOfHour')
  final int minuteOfHour;

  /// A value that indicates the time zone that is set for the gateway. The start
  /// time and day of week specified should be in the time zone of the gateway.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  DescribeMaintenanceStartTimeOutput({
    this.dayOfMonth,
    this.dayOfWeek,
    this.gatewayARN,
    this.hourOfDay,
    this.minuteOfHour,
    this.timezone,
  });
  factory DescribeMaintenanceStartTimeOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMaintenanceStartTimeOutputFromJson(json);
}

/// DescribeNFSFileSharesOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNFSFileSharesOutput {
  /// An array containing a description for each requested file share.
  @_s.JsonKey(name: 'NFSFileShareInfoList')
  final List<NFSFileShareInfo> nFSFileShareInfoList;

  DescribeNFSFileSharesOutput({
    this.nFSFileShareInfoList,
  });
  factory DescribeNFSFileSharesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeNFSFileSharesOutputFromJson(json);
}

/// DescribeSMBFileSharesOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSMBFileSharesOutput {
  /// An array containing a description for each requested file share.
  @_s.JsonKey(name: 'SMBFileShareInfoList')
  final List<SMBFileShareInfo> sMBFileShareInfoList;

  DescribeSMBFileSharesOutput({
    this.sMBFileShareInfoList,
  });
  factory DescribeSMBFileSharesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeSMBFileSharesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSMBSettingsOutput {
  /// Indicates the status of a gateway that is a member of the Active Directory
  /// domain.
  ///
  /// <ul>
  /// <li>
  /// <code>ACCESS_DENIED</code>: Indicates that the <code>JoinDomain</code>
  /// operation failed due to an authentication error.
  /// </li>
  /// <li>
  /// <code>DETACHED</code>: Indicates that gateway is not joined to a domain.
  /// </li>
  /// <li>
  /// <code>JOINED</code>: Indicates that the gateway has successfully joined a
  /// domain.
  /// </li>
  /// <li>
  /// <code>JOINING</code>: Indicates that a <code>JoinDomain</code> operation is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>NETWORK_ERROR</code>: Indicates that <code>JoinDomain</code> operation
  /// failed due to a network or connectivity error.
  /// </li>
  /// <li>
  /// <code>TIMEOUT</code>: Indicates that the <code>JoinDomain</code> operation
  /// failed because the operation didn't complete within the allotted time.
  /// </li>
  /// <li>
  /// <code>UNKNOWN_ERROR</code>: Indicates that the <code>JoinDomain</code>
  /// operation failed due to another type of error.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ActiveDirectoryStatus')
  final ActiveDirectoryStatus activeDirectoryStatus;

  /// The name of the domain that the gateway is joined to.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The shares on this gateway appear when listing shares.
  @_s.JsonKey(name: 'FileSharesVisible')
  final bool fileSharesVisible;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// This value is <code>true</code> if a password for the guest user
  /// <code>smbguest</code> is set, otherwise <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'SMBGuestPasswordSet')
  final bool sMBGuestPasswordSet;

  /// The type of security strategy that was specified for file gateway.
  ///
  /// <ul>
  /// <li>
  /// <code>ClientSpecified</code>: If you use this option, requests are
  /// established based on what is negotiated by the client. This option is
  /// recommended when you want to maximize compatibility across different clients
  /// in your environment.
  /// </li>
  /// <li>
  /// <code>MandatorySigning</code>: If you use this option, file gateway only
  /// allows connections from SMBv2 or SMBv3 clients that have signing enabled.
  /// This option works with SMB clients on Microsoft Windows Vista, Windows
  /// Server 2008 or newer.
  /// </li>
  /// <li>
  /// <code>MandatoryEncryption</code>: If you use this option, file gateway only
  /// allows connections from SMBv3 clients that have encryption enabled. This
  /// option is highly recommended for environments that handle sensitive data.
  /// This option works with SMB clients on Microsoft Windows 8, Windows Server
  /// 2012 or newer.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SMBSecurityStrategy')
  final SMBSecurityStrategy sMBSecurityStrategy;

  DescribeSMBSettingsOutput({
    this.activeDirectoryStatus,
    this.domainName,
    this.fileSharesVisible,
    this.gatewayARN,
    this.sMBGuestPasswordSet,
    this.sMBSecurityStrategy,
  });
  factory DescribeSMBSettingsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeSMBSettingsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSnapshotScheduleOutput {
  /// The snapshot description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The number of hours between snapshots.
  @_s.JsonKey(name: 'RecurrenceInHours')
  final int recurrenceInHours;

  /// The hour of the day at which the snapshot schedule begins represented as
  /// <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is in
  /// the time zone of the gateway.
  @_s.JsonKey(name: 'StartAt')
  final int startAt;

  /// A list of up to 50 tags assigned to the snapshot schedule, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A value that indicates the time zone of the gateway.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// The Amazon Resource Name (ARN) of the volume that was specified in the
  /// request.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  DescribeSnapshotScheduleOutput({
    this.description,
    this.recurrenceInHours,
    this.startAt,
    this.tags,
    this.timezone,
    this.volumeARN,
  });
  factory DescribeSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeSnapshotScheduleOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStorediSCSIVolumesOutput {
  /// Describes a single unit of output from <a>DescribeStorediSCSIVolumes</a>.
  /// The following fields are returned:
  ///
  /// <ul>
  /// <li>
  /// <code>ChapEnabled</code>: Indicates whether mutual CHAP is enabled for the
  /// iSCSI target.
  /// </li>
  /// <li>
  /// <code>LunNumber</code>: The logical disk number.
  /// </li>
  /// <li>
  /// <code>NetworkInterfaceId</code>: The network interface ID of the stored
  /// volume that initiator use to map the stored volume as an iSCSI target.
  /// </li>
  /// <li>
  /// <code>NetworkInterfacePort</code>: The port used to communicate with iSCSI
  /// targets.
  /// </li>
  /// <li>
  /// <code>PreservedExistingData</code>: Indicates when the stored volume was
  /// created, existing data on the underlying local disk was preserved.
  /// </li>
  /// <li>
  /// <code>SourceSnapshotId</code>: If the stored volume was created from a
  /// snapshot, this field contains the snapshot ID used, e.g.
  /// <code>snap-1122aabb</code>. Otherwise, this field is not included.
  /// </li>
  /// <li>
  /// <code>StorediSCSIVolumes</code>: An array of StorediSCSIVolume objects where
  /// each object contains metadata about one stored volume.
  /// </li>
  /// <li>
  /// <code>TargetARN</code>: The Amazon Resource Name (ARN) of the volume target.
  /// </li>
  /// <li>
  /// <code>VolumeARN</code>: The Amazon Resource Name (ARN) of the stored volume.
  /// </li>
  /// <li>
  /// <code>VolumeDiskId</code>: The disk ID of the local disk that was specified
  /// in the <a>CreateStorediSCSIVolume</a> operation.
  /// </li>
  /// <li>
  /// <code>VolumeId</code>: The unique identifier of the storage volume, e.g.
  /// <code>vol-1122AABB</code>.
  /// </li>
  /// <li>
  /// <code>VolumeiSCSIAttributes</code>: An <a>VolumeiSCSIAttributes</a> object
  /// that represents a collection of iSCSI attributes for one stored volume.
  /// </li>
  /// <li>
  /// <code>VolumeProgress</code>: Represents the percentage complete if the
  /// volume is restoring or bootstrapping that represents the percent of data
  /// transferred. This field does not appear in the response if the stored volume
  /// is not restoring or bootstrapping.
  /// </li>
  /// <li>
  /// <code>VolumeSizeInBytes</code>: The size of the volume in bytes.
  /// </li>
  /// <li>
  /// <code>VolumeStatus</code>: One of the <code>VolumeStatus</code> values that
  /// indicates the state of the volume.
  /// </li>
  /// <li>
  /// <code>VolumeType</code>: One of the enumeration values describing the type
  /// of the volume. Currently, only <code>STORED</code> volumes are supported.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StorediSCSIVolumes')
  final List<StorediSCSIVolume> storediSCSIVolumes;

  DescribeStorediSCSIVolumesOutput({
    this.storediSCSIVolumes,
  });
  factory DescribeStorediSCSIVolumesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeStorediSCSIVolumesOutputFromJson(json);
}

/// DescribeTapeArchivesOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTapeArchivesOutput {
  /// An opaque string that indicates the position at which the virtual tapes that
  /// were fetched for description ended. Use this marker in your next request to
  /// fetch the next set of virtual tapes in the virtual tape shelf (VTS). If
  /// there are no more virtual tapes to describe, this field does not appear in
  /// the response.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of virtual tape objects in the virtual tape shelf (VTS). The
  /// description includes of the Amazon Resource Name (ARN) of the virtual tapes.
  /// The information returned includes the Amazon Resource Names (ARNs) of the
  /// tapes, size of the tapes, status of the tapes, progress of the description,
  /// and tape barcode.
  @_s.JsonKey(name: 'TapeArchives')
  final List<TapeArchive> tapeArchives;

  DescribeTapeArchivesOutput({
    this.marker,
    this.tapeArchives,
  });
  factory DescribeTapeArchivesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTapeArchivesOutputFromJson(json);
}

/// DescribeTapeRecoveryPointsOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTapeRecoveryPointsOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// An opaque string that indicates the position at which the virtual tape
  /// recovery points that were listed for description ended.
  ///
  /// Use this marker in your next request to list the next set of virtual tape
  /// recovery points in the list. If there are no more recovery points to
  /// describe, this field does not appear in the response.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of TapeRecoveryPointInfos that are available for the specified
  /// gateway.
  @_s.JsonKey(name: 'TapeRecoveryPointInfos')
  final List<TapeRecoveryPointInfo> tapeRecoveryPointInfos;

  DescribeTapeRecoveryPointsOutput({
    this.gatewayARN,
    this.marker,
    this.tapeRecoveryPointInfos,
  });
  factory DescribeTapeRecoveryPointsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTapeRecoveryPointsOutputFromJson(json);
}

/// DescribeTapesOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTapesOutput {
  /// An opaque string which can be used as part of a subsequent DescribeTapes
  /// call to retrieve the next page of results.
  ///
  /// If a response does not contain a marker, then there are no more results to
  /// be retrieved.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of virtual tape descriptions.
  @_s.JsonKey(name: 'Tapes')
  final List<Tape> tapes;

  DescribeTapesOutput({
    this.marker,
    this.tapes,
  });
  factory DescribeTapesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTapesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUploadBufferOutput {
  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  @_s.JsonKey(name: 'DiskIds')
  final List<String> diskIds;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The total number of bytes allocated in the gateway's as upload buffer.
  @_s.JsonKey(name: 'UploadBufferAllocatedInBytes')
  final int uploadBufferAllocatedInBytes;

  /// The total number of bytes being used in the gateway's upload buffer.
  @_s.JsonKey(name: 'UploadBufferUsedInBytes')
  final int uploadBufferUsedInBytes;

  DescribeUploadBufferOutput({
    this.diskIds,
    this.gatewayARN,
    this.uploadBufferAllocatedInBytes,
    this.uploadBufferUsedInBytes,
  });
  factory DescribeUploadBufferOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeUploadBufferOutputFromJson(json);
}

/// DescribeVTLDevicesOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVTLDevicesOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// An opaque string that indicates the position at which the VTL devices that
  /// were fetched for description ended. Use the marker in your next request to
  /// fetch the next set of VTL devices in the list. If there are no more VTL
  /// devices to describe, this field does not appear in the response.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of VTL device objects composed of the Amazon Resource Name (ARN) of
  /// the VTL devices.
  @_s.JsonKey(name: 'VTLDevices')
  final List<VTLDevice> vTLDevices;

  DescribeVTLDevicesOutput({
    this.gatewayARN,
    this.marker,
    this.vTLDevices,
  });
  factory DescribeVTLDevicesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVTLDevicesOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkingStorageOutput {
  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  @_s.JsonKey(name: 'DiskIds')
  final List<String> diskIds;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The total working storage in bytes allocated for the gateway. If no working
  /// storage is configured for the gateway, this field returns 0.
  @_s.JsonKey(name: 'WorkingStorageAllocatedInBytes')
  final int workingStorageAllocatedInBytes;

  /// The total working storage in bytes in use by the gateway. If no working
  /// storage is configured for the gateway, this field returns 0.
  @_s.JsonKey(name: 'WorkingStorageUsedInBytes')
  final int workingStorageUsedInBytes;

  DescribeWorkingStorageOutput({
    this.diskIds,
    this.gatewayARN,
    this.workingStorageAllocatedInBytes,
    this.workingStorageUsedInBytes,
  });
  factory DescribeWorkingStorageOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkingStorageOutputFromJson(json);
}

/// AttachVolumeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume that was detached.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  DetachVolumeOutput({
    this.volumeARN,
  });
  factory DetachVolumeOutput.fromJson(Map<String, dynamic> json) =>
      _$DetachVolumeOutputFromJson(json);
}

/// Lists iSCSI information about a VTL device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceiSCSIAttributes {
  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  @_s.JsonKey(name: 'ChapEnabled')
  final bool chapEnabled;

  /// The network interface identifier of the VTL device.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// The port used to communicate with iSCSI VTL device targets.
  @_s.JsonKey(name: 'NetworkInterfacePort')
  final int networkInterfacePort;

  /// Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI
  /// qualified name(iqn) of a tape drive or media changer target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  DeviceiSCSIAttributes({
    this.chapEnabled,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.targetARN,
  });
  factory DeviceiSCSIAttributes.fromJson(Map<String, dynamic> json) =>
      _$DeviceiSCSIAttributesFromJson(json);
}

/// DisableGatewayOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableGatewayOutput {
  /// The unique Amazon Resource Name (ARN) of the disabled gateway.
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  DisableGatewayOutput({
    this.gatewayARN,
  });
  factory DisableGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$DisableGatewayOutputFromJson(json);
}

/// Represents a gateway's local disk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Disk {
  /// The iSCSI qualified name (IQN) that is defined for a disk. This field is not
  /// included in the response if the local disk is not defined as an iSCSI
  /// target. The format of this field is
  /// <i>targetIqn::LUNNumber::region-volumeId</i>.
  @_s.JsonKey(name: 'DiskAllocationResource')
  final String diskAllocationResource;
  @_s.JsonKey(name: 'DiskAllocationType')
  final String diskAllocationType;
  @_s.JsonKey(name: 'DiskAttributeList')
  final List<String> diskAttributeList;

  /// The unique device ID or other distinguishing data that identifies a local
  /// disk.
  @_s.JsonKey(name: 'DiskId')
  final String diskId;

  /// The device node of a local disk as assigned by the virtualization
  /// environment.
  @_s.JsonKey(name: 'DiskNode')
  final String diskNode;

  /// The path of a local disk in the gateway virtual machine (VM).
  @_s.JsonKey(name: 'DiskPath')
  final String diskPath;

  /// The local disk size in bytes.
  @_s.JsonKey(name: 'DiskSizeInBytes')
  final int diskSizeInBytes;

  /// A value that represents the status of a local disk.
  @_s.JsonKey(name: 'DiskStatus')
  final String diskStatus;

  Disk({
    this.diskAllocationResource,
    this.diskAllocationType,
    this.diskAttributeList,
    this.diskId,
    this.diskNode,
    this.diskPath,
    this.diskSizeInBytes,
    this.diskStatus,
  });
  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}

/// Describes a file share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileShareInfo {
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;
  @_s.JsonKey(name: 'FileShareId')
  final String fileShareId;
  @_s.JsonKey(name: 'FileShareStatus')
  final String fileShareStatus;
  @_s.JsonKey(name: 'FileShareType')
  final FileShareType fileShareType;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  FileShareInfo({
    this.fileShareARN,
    this.fileShareId,
    this.fileShareStatus,
    this.fileShareType,
    this.gatewayARN,
  });
  factory FileShareInfo.fromJson(Map<String, dynamic> json) =>
      _$FileShareInfoFromJson(json);
}

/// The type of the file share.
enum FileShareType {
  @_s.JsonValue('NFS')
  nfs,
  @_s.JsonValue('SMB')
  smb,
}

/// Describes a gateway object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayInfo {
  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  @_s.JsonKey(name: 'Ec2InstanceId')
  final String ec2InstanceId;

  /// The AWS Region where the Amazon EC2 instance is located.
  @_s.JsonKey(name: 'Ec2InstanceRegion')
  final String ec2InstanceRegion;

  /// The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a>
  /// operation to return a list of gateways for your account and AWS Region.
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  @_s.JsonKey(name: 'GatewayId')
  final String gatewayId;

  /// The name of the gateway.
  @_s.JsonKey(name: 'GatewayName')
  final String gatewayName;

  /// The state of the gateway.
  ///
  /// Valid Values: <code>DISABLED</code> | <code>ACTIVE</code>
  @_s.JsonKey(name: 'GatewayOperationalState')
  final String gatewayOperationalState;

  /// The type of the gateway.
  @_s.JsonKey(name: 'GatewayType')
  final String gatewayType;

  GatewayInfo({
    this.ec2InstanceId,
    this.ec2InstanceRegion,
    this.gatewayARN,
    this.gatewayId,
    this.gatewayName,
    this.gatewayOperationalState,
    this.gatewayType,
  });
  factory GatewayInfo.fromJson(Map<String, dynamic> json) =>
      _$GatewayInfoFromJson(json);
}

enum HostEnvironment {
  @_s.JsonValue('VMWARE')
  vmware,
  @_s.JsonValue('HYPER-V')
  hyperV,
  @_s.JsonValue('EC2')
  ec2,
  @_s.JsonValue('KVM')
  kvm,
  @_s.JsonValue('OTHER')
  other,
}

/// JoinDomainOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JoinDomainOutput {
  /// Indicates the status of the gateway as a member of the Active Directory
  /// domain.
  ///
  /// <ul>
  /// <li>
  /// <code>ACCESS_DENIED</code>: Indicates that the <code>JoinDomain</code>
  /// operation failed due to an authentication error.
  /// </li>
  /// <li>
  /// <code>DETACHED</code>: Indicates that gateway is not joined to a domain.
  /// </li>
  /// <li>
  /// <code>JOINED</code>: Indicates that the gateway has successfully joined a
  /// domain.
  /// </li>
  /// <li>
  /// <code>JOINING</code>: Indicates that a <code>JoinDomain</code> operation is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>NETWORK_ERROR</code>: Indicates that <code>JoinDomain</code> operation
  /// failed due to a network or connectivity error.
  /// </li>
  /// <li>
  /// <code>TIMEOUT</code>: Indicates that the <code>JoinDomain</code> operation
  /// failed because the operation didn't complete within the allotted time.
  /// </li>
  /// <li>
  /// <code>UNKNOWN_ERROR</code>: Indicates that the <code>JoinDomain</code>
  /// operation failed due to another type of error.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ActiveDirectoryStatus')
  final ActiveDirectoryStatus activeDirectoryStatus;

  /// The unique Amazon Resource Name (ARN) of the gateway that joined the domain.
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  JoinDomainOutput({
    this.activeDirectoryStatus,
    this.gatewayARN,
  });
  factory JoinDomainOutput.fromJson(Map<String, dynamic> json) =>
      _$JoinDomainOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAutomaticTapeCreationPoliciesOutput {
  /// Gets a listing of information about the gateway's automatic tape creation
  /// policies, including the automatic tape creation rules and the gateway that
  /// is using the policies.
  @_s.JsonKey(name: 'AutomaticTapeCreationPolicyInfos')
  final List<AutomaticTapeCreationPolicyInfo> automaticTapeCreationPolicyInfos;

  ListAutomaticTapeCreationPoliciesOutput({
    this.automaticTapeCreationPolicyInfos,
  });
  factory ListAutomaticTapeCreationPoliciesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListAutomaticTapeCreationPoliciesOutputFromJson(json);
}

/// ListFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFileSharesOutput {
  /// An array of information about the file gateway's file shares.
  @_s.JsonKey(name: 'FileShareInfoList')
  final List<FileShareInfo> fileShareInfoList;

  /// If the request includes <code>Marker</code>, the response returns that value
  /// in this field.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// If a value is present, there are more file shares to return. In a subsequent
  /// request, use <code>NextMarker</code> as the value for <code>Marker</code> to
  /// retrieve the next set of file shares.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListFileSharesOutput({
    this.fileShareInfoList,
    this.marker,
    this.nextMarker,
  });
  factory ListFileSharesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListFileSharesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGatewaysOutput {
  /// An array of <a>GatewayInfo</a> objects.
  @_s.JsonKey(name: 'Gateways')
  final List<GatewayInfo> gateways;

  /// Use the marker in your next request to fetch the next set of gateways in the
  /// list. If there are no more gateways to list, this field does not appear in
  /// the response.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListGatewaysOutput({
    this.gateways,
    this.marker,
  });
  factory ListGatewaysOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGatewaysOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLocalDisksOutput {
  /// A JSON object containing the following fields:
  ///
  /// <ul>
  /// <li>
  /// <a>ListLocalDisksOutput$Disks</a>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Disks')
  final List<Disk> disks;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  ListLocalDisksOutput({
    this.disks,
    this.gatewayARN,
  });
  factory ListLocalDisksOutput.fromJson(Map<String, dynamic> json) =>
      _$ListLocalDisksOutputFromJson(json);
}

/// ListTagsForResourceOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// An opaque string that indicates the position at which to stop returning the
  /// list of tags.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The Amazon Resource Name (ARN) of the resource for which you want to list
  /// tags.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// An array that contains the tags for the specified resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.marker,
    this.resourceARN,
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTapePoolsOutput {
  /// A string that indicates the position at which to begin the returned list of
  /// tape pools. Use the marker in your next request to continue pagination of
  /// tape pools. If there are no more tape pools to list, this element does not
  /// appear in the response body.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of <code>PoolInfo</code> objects, where each object describes a
  /// single custom tape pool. If there are no custom tape pools, the
  /// <code>PoolInfos</code> is an empty array.
  @_s.JsonKey(name: 'PoolInfos')
  final List<PoolInfo> poolInfos;

  ListTapePoolsOutput({
    this.marker,
    this.poolInfos,
  });
  factory ListTapePoolsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTapePoolsOutputFromJson(json);
}

/// A JSON object containing the following fields:
///
/// <ul>
/// <li>
/// <a>ListTapesOutput$Marker</a>
/// </li>
/// <li>
/// <a>ListTapesOutput$VolumeInfos</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTapesOutput {
  /// A string that indicates the position at which to begin returning the next
  /// list of tapes. Use the marker in your next request to continue pagination of
  /// tapes. If there are no more tapes to list, this element does not appear in
  /// the response body.
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'TapeInfos')
  final List<TapeInfo> tapeInfos;

  ListTapesOutput({
    this.marker,
    this.tapeInfos,
  });
  factory ListTapesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTapesOutputFromJson(json);
}

/// ListVolumeInitiatorsOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVolumeInitiatorsOutput {
  /// The host names and port numbers of all iSCSI initiators that are connected
  /// to the gateway.
  @_s.JsonKey(name: 'Initiators')
  final List<String> initiators;

  ListVolumeInitiatorsOutput({
    this.initiators,
  });
  factory ListVolumeInitiatorsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVolumeInitiatorsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVolumeRecoveryPointsOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// An array of <a>VolumeRecoveryPointInfo</a> objects.
  @_s.JsonKey(name: 'VolumeRecoveryPointInfos')
  final List<VolumeRecoveryPointInfo> volumeRecoveryPointInfos;

  ListVolumeRecoveryPointsOutput({
    this.gatewayARN,
    this.volumeRecoveryPointInfos,
  });
  factory ListVolumeRecoveryPointsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVolumeRecoveryPointsOutputFromJson(json);
}

/// A JSON object containing the following fields:
///
/// <ul>
/// <li>
/// <a>ListVolumesOutput$Marker</a>
/// </li>
/// <li>
/// <a>ListVolumesOutput$VolumeInfos</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVolumesOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// Use the marker in your next request to continue pagination of iSCSI volumes.
  /// If there are no more volumes to list, this field does not appear in the
  /// response body.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// An array of <a>VolumeInfo</a> objects, where each object describes an iSCSI
  /// volume. If no volumes are defined for the gateway, then
  /// <code>VolumeInfos</code> is an empty array "[]".
  @_s.JsonKey(name: 'VolumeInfos')
  final List<VolumeInfo> volumeInfos;

  ListVolumesOutput({
    this.gatewayARN,
    this.marker,
    this.volumeInfos,
  });
  factory ListVolumesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVolumesOutputFromJson(json);
}

/// Describes Network File System (NFS) file share default values. Files and
/// folders stored as Amazon S3 objects in S3 buckets don't, by default, have
/// Unix file permissions assigned to them. Upon discovery in an S3 bucket by
/// Storage Gateway, the S3 objects that represent files and folders are
/// assigned these default Unix permissions. This operation is only supported
/// for file gateways.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NFSFileShareDefaults {
  /// The Unix directory mode in the form "nnnn". For example, <code>0666</code>
  /// represents the default access mode for all directories inside the file
  /// share. The default value is <code>0777</code>.
  @_s.JsonKey(name: 'DirectoryMode')
  final String directoryMode;

  /// The Unix file mode in the form "nnnn". For example, <code>0666</code>
  /// represents the default file mode inside the file share. The default value is
  /// <code>0666</code>.
  @_s.JsonKey(name: 'FileMode')
  final String fileMode;

  /// The default group ID for the file share (unless the files have another group
  /// ID specified). The default value is <code>nfsnobody</code>.
  @_s.JsonKey(name: 'GroupId')
  final int groupId;

  /// The default owner ID for files in the file share (unless the files have
  /// another owner ID specified). The default value is <code>nfsnobody</code>.
  @_s.JsonKey(name: 'OwnerId')
  final int ownerId;

  NFSFileShareDefaults({
    this.directoryMode,
    this.fileMode,
    this.groupId,
    this.ownerId,
  });
  factory NFSFileShareDefaults.fromJson(Map<String, dynamic> json) =>
      _$NFSFileShareDefaultsFromJson(json);

  Map<String, dynamic> toJson() => _$NFSFileShareDefaultsToJson(this);
}

/// The Unix file permissions and ownership information assigned, by default, to
/// native S3 objects when file gateway discovers them in S3 buckets. This
/// operation is only supported in file gateways.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NFSFileShareInfo {
  /// Refresh cache information.
  @_s.JsonKey(name: 'CacheAttributes')
  final CacheAttributes cacheAttributes;
  @_s.JsonKey(name: 'ClientList')
  final List<String> clientList;

  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code>
  /// | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code>
  @_s.JsonKey(name: 'DefaultStorageClass')
  final String defaultStorageClass;
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;
  @_s.JsonKey(name: 'FileShareId')
  final String fileShareId;

  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  @_s.JsonKey(name: 'FileShareName')
  final String fileShareName;
  @_s.JsonKey(name: 'FileShareStatus')
  final String fileShareStatus;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// A value that enables guessing of the MIME type for uploaded objects based on
  /// file extensions. Set this value to <code>true</code> to enable MIME type
  /// guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'GuessMIMETypeEnabled')
  final bool guessMIMETypeEnabled;

  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'KMSEncrypted')
  final bool kMSEncrypted;
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;
  @_s.JsonKey(name: 'LocationARN')
  final String locationARN;
  @_s.JsonKey(name: 'NFSFileShareDefaults')
  final NFSFileShareDefaults nFSFileShareDefaults;

  /// The notification policy of the file share.
  @_s.JsonKey(name: 'NotificationPolicy')
  final String notificationPolicy;
  @_s.JsonKey(name: 'ObjectACL')
  final ObjectACL objectACL;
  @_s.JsonKey(name: 'Path')
  final String path;

  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'ReadOnly')
  final bool readOnly;

  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is the
  /// same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'RequesterPays')
  final bool requesterPays;
  @_s.JsonKey(name: 'Role')
  final String role;
  @_s.JsonKey(name: 'Squash')
  final String squash;

  /// A list of up to 50 tags assigned to the NFS file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  NFSFileShareInfo({
    this.cacheAttributes,
    this.clientList,
    this.defaultStorageClass,
    this.fileShareARN,
    this.fileShareId,
    this.fileShareName,
    this.fileShareStatus,
    this.gatewayARN,
    this.guessMIMETypeEnabled,
    this.kMSEncrypted,
    this.kMSKey,
    this.locationARN,
    this.nFSFileShareDefaults,
    this.notificationPolicy,
    this.objectACL,
    this.path,
    this.readOnly,
    this.requesterPays,
    this.role,
    this.squash,
    this.tags,
  });
  factory NFSFileShareInfo.fromJson(Map<String, dynamic> json) =>
      _$NFSFileShareInfoFromJson(json);
}

/// Describes a gateway's network interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// The Internet Protocol version 4 (IPv4) address of the interface.
  @_s.JsonKey(name: 'Ipv4Address')
  final String ipv4Address;

  /// The Internet Protocol version 6 (IPv6) address of the interface.
  /// <i>Currently not supported</i>.
  @_s.JsonKey(name: 'Ipv6Address')
  final String ipv6Address;

  /// The Media Access Control (MAC) address of the interface.
  /// <note>
  /// This is currently unsupported and will not be returned in output.
  /// </note>
  @_s.JsonKey(name: 'MacAddress')
  final String macAddress;

  NetworkInterface({
    this.ipv4Address,
    this.ipv6Address,
    this.macAddress,
  });
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotifyWhenUploadedOutput {
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;
  @_s.JsonKey(name: 'NotificationId')
  final String notificationId;

  NotifyWhenUploadedOutput({
    this.fileShareARN,
    this.notificationId,
  });
  factory NotifyWhenUploadedOutput.fromJson(Map<String, dynamic> json) =>
      _$NotifyWhenUploadedOutputFromJson(json);
}

/// A value that sets the access control list (ACL) permission for objects in
/// the S3 bucket that a file gateway puts objects into. The default value is
/// <code>private</code>.
enum ObjectACL {
  @_s.JsonValue('private')
  private,
  @_s.JsonValue('public-read')
  publicRead,
  @_s.JsonValue('public-read-write')
  publicReadWrite,
  @_s.JsonValue('authenticated-read')
  authenticatedRead,
  @_s.JsonValue('bucket-owner-read')
  bucketOwnerRead,
  @_s.JsonValue('bucket-owner-full-control')
  bucketOwnerFullControl,
  @_s.JsonValue('aws-exec-read')
  awsExecRead,
}

extension on ObjectACL {
  String toValue() {
    switch (this) {
      case ObjectACL.private:
        return 'private';
      case ObjectACL.publicRead:
        return 'public-read';
      case ObjectACL.publicReadWrite:
        return 'public-read-write';
      case ObjectACL.authenticatedRead:
        return 'authenticated-read';
      case ObjectACL.bucketOwnerRead:
        return 'bucket-owner-read';
      case ObjectACL.bucketOwnerFullControl:
        return 'bucket-owner-full-control';
      case ObjectACL.awsExecRead:
        return 'aws-exec-read';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a custom tape pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PoolInfo {
  /// The Amazon Resource Name (ARN) of the custom tape pool. Use the
  /// <a>ListTapePools</a> operation to return a list of custom tape pools for
  /// your account and AWS Region.
  @_s.JsonKey(name: 'PoolARN')
  final String poolARN;

  /// The name of the custom tape pool. <code>PoolName</code> can use all ASCII
  /// characters, except '/' and '\'.
  @_s.JsonKey(name: 'PoolName')
  final String poolName;

  /// Status of the custom tape pool. Pool can be <code>ACTIVE</code> or
  /// <code>DELETED</code>.
  @_s.JsonKey(name: 'PoolStatus')
  final PoolStatus poolStatus;

  /// Tape retention lock time is set in days. Tape retention lock can be enabled
  /// for up to 100 years (36,500 days).
  @_s.JsonKey(name: 'RetentionLockTimeInDays')
  final int retentionLockTimeInDays;

  /// Tape retention lock type, which can be configured in two modes. When
  /// configured in governance mode, AWS accounts with specific IAM permissions
  /// are authorized to remove the tape retention lock from archived virtual
  /// tapes. When configured in compliance mode, the tape retention lock cannot be
  /// removed by any user, including the root AWS account.
  @_s.JsonKey(name: 'RetentionLockType')
  final RetentionLockType retentionLockType;

  /// The storage class that is associated with the custom pool. When you use your
  /// backup application to eject the tape, the tape is archived directly into the
  /// storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to
  /// the pool.
  @_s.JsonKey(name: 'StorageClass')
  final TapeStorageClass storageClass;

  PoolInfo({
    this.poolARN,
    this.poolName,
    this.poolStatus,
    this.retentionLockTimeInDays,
    this.retentionLockType,
    this.storageClass,
  });
  factory PoolInfo.fromJson(Map<String, dynamic> json) =>
      _$PoolInfoFromJson(json);
}

enum PoolStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
}

/// RefreshCacheOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RefreshCacheOutput {
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;
  @_s.JsonKey(name: 'NotificationId')
  final String notificationId;

  RefreshCacheOutput({
    this.fileShareARN,
    this.notificationId,
  });
  factory RefreshCacheOutput.fromJson(Map<String, dynamic> json) =>
      _$RefreshCacheOutputFromJson(json);
}

/// RemoveTagsFromResourceOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsFromResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource that the tags were removed
  /// from.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  RemoveTagsFromResourceOutput({
    this.resourceARN,
  });
  factory RemoveTagsFromResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsFromResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetCacheOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  ResetCacheOutput({
    this.gatewayARN,
  });
  factory ResetCacheOutput.fromJson(Map<String, dynamic> json) =>
      _$ResetCacheOutputFromJson(json);
}

enum RetentionLockType {
  @_s.JsonValue('COMPLIANCE')
  compliance,
  @_s.JsonValue('GOVERNANCE')
  governance,
  @_s.JsonValue('NONE')
  none,
}

extension on RetentionLockType {
  String toValue() {
    switch (this) {
      case RetentionLockType.compliance:
        return 'COMPLIANCE';
      case RetentionLockType.governance:
        return 'GOVERNANCE';
      case RetentionLockType.none:
        return 'NONE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// RetrieveTapeArchiveOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetrieveTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the retrieved virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  RetrieveTapeArchiveOutput({
    this.tapeARN,
  });
  factory RetrieveTapeArchiveOutput.fromJson(Map<String, dynamic> json) =>
      _$RetrieveTapeArchiveOutputFromJson(json);
}

/// RetrieveTapeRecoveryPointOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetrieveTapeRecoveryPointOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which the recovery
  /// point was retrieved.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  RetrieveTapeRecoveryPointOutput({
    this.tapeARN,
  });
  factory RetrieveTapeRecoveryPointOutput.fromJson(Map<String, dynamic> json) =>
      _$RetrieveTapeRecoveryPointOutputFromJson(json);
}

/// The Windows file permissions and ownership information assigned, by default,
/// to native S3 objects when file gateway discovers them in S3 buckets. This
/// operation is only supported for file gateways.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SMBFileShareInfo {
  /// Indicates whether <code>AccessBasedEnumeration</code> is enabled.
  @_s.JsonKey(name: 'AccessBasedEnumeration')
  final bool accessBasedEnumeration;

  /// A list of users or groups in the Active Directory that have administrator
  /// rights to the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  @_s.JsonKey(name: 'AdminUserList')
  final List<String> adminUserList;

  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  @_s.JsonKey(name: 'AuditDestinationARN')
  final String auditDestinationARN;
  @_s.JsonKey(name: 'Authentication')
  final String authentication;

  /// Refresh cache information.
  @_s.JsonKey(name: 'CacheAttributes')
  final CacheAttributes cacheAttributes;

  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case sensitivity.
  /// The default value is <code>ClientSpecified</code>.
  @_s.JsonKey(name: 'CaseSensitivity')
  final CaseSensitivity caseSensitivity;

  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>.
  /// Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code>
  /// | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code>
  @_s.JsonKey(name: 'DefaultStorageClass')
  final String defaultStorageClass;
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;
  @_s.JsonKey(name: 'FileShareId')
  final String fileShareId;

  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>.
  /// </note>
  @_s.JsonKey(name: 'FileShareName')
  final String fileShareName;
  @_s.JsonKey(name: 'FileShareStatus')
  final String fileShareStatus;
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// A value that enables guessing of the MIME type for uploaded objects based on
  /// file extensions. Set this value to <code>true</code> to enable MIME type
  /// guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'GuessMIMETypeEnabled')
  final bool guessMIMETypeEnabled;

  /// A list of users or groups in the Active Directory that are not allowed to
  /// access the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  @_s.JsonKey(name: 'InvalidUserList')
  final List<String> invalidUserList;

  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'KMSEncrypted')
  final bool kMSEncrypted;
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;
  @_s.JsonKey(name: 'LocationARN')
  final String locationARN;

  /// The notification policy of the file share.
  @_s.JsonKey(name: 'NotificationPolicy')
  final String notificationPolicy;
  @_s.JsonKey(name: 'ObjectACL')
  final ObjectACL objectACL;

  /// The file share path used by the SMB client to identify the mount point.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'ReadOnly')
  final bool readOnly;

  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to
  /// <code>true</code>, the requester pays the costs; otherwise, the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  /// <note>
  /// <code>RequesterPays</code> is a configuration for the S3 bucket that backs
  /// the file share, so make sure that the configuration on the file share is the
  /// same as the S3 bucket configuration.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'RequesterPays')
  final bool requesterPays;
  @_s.JsonKey(name: 'Role')
  final String role;

  /// If this value is set to <code>true</code>, it indicates that access control
  /// list (ACL) is enabled on the SMB file share. If it is set to
  /// <code>false</code>, it indicates that file and directory permissions are
  /// mapped to the POSIX permission.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using
  /// Microsoft Windows ACLs to control access to an SMB file share</a> in the
  /// <i>AWS Storage Gateway User Guide</i>.
  @_s.JsonKey(name: 'SMBACLEnabled')
  final bool sMBACLEnabled;

  /// A list of up to 50 tags assigned to the SMB file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A list of users or groups in the Active Directory that are allowed to access
  /// the file share. A group must be prefixed with the @ character. Acceptable
  /// formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  @_s.JsonKey(name: 'ValidUserList')
  final List<String> validUserList;

  SMBFileShareInfo({
    this.accessBasedEnumeration,
    this.adminUserList,
    this.auditDestinationARN,
    this.authentication,
    this.cacheAttributes,
    this.caseSensitivity,
    this.defaultStorageClass,
    this.fileShareARN,
    this.fileShareId,
    this.fileShareName,
    this.fileShareStatus,
    this.gatewayARN,
    this.guessMIMETypeEnabled,
    this.invalidUserList,
    this.kMSEncrypted,
    this.kMSKey,
    this.locationARN,
    this.notificationPolicy,
    this.objectACL,
    this.path,
    this.readOnly,
    this.requesterPays,
    this.role,
    this.sMBACLEnabled,
    this.tags,
    this.validUserList,
  });
  factory SMBFileShareInfo.fromJson(Map<String, dynamic> json) =>
      _$SMBFileShareInfoFromJson(json);
}

enum SMBSecurityStrategy {
  @_s.JsonValue('ClientSpecified')
  clientSpecified,
  @_s.JsonValue('MandatorySigning')
  mandatorySigning,
  @_s.JsonValue('MandatoryEncryption')
  mandatoryEncryption,
}

extension on SMBSecurityStrategy {
  String toValue() {
    switch (this) {
      case SMBSecurityStrategy.clientSpecified:
        return 'ClientSpecified';
      case SMBSecurityStrategy.mandatorySigning:
        return 'MandatorySigning';
      case SMBSecurityStrategy.mandatoryEncryption:
        return 'MandatoryEncryption';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetLocalConsolePasswordOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  SetLocalConsolePasswordOutput({
    this.gatewayARN,
  });
  factory SetLocalConsolePasswordOutput.fromJson(Map<String, dynamic> json) =>
      _$SetLocalConsolePasswordOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetSMBGuestPasswordOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  SetSMBGuestPasswordOutput({
    this.gatewayARN,
  });
  factory SetSMBGuestPasswordOutput.fromJson(Map<String, dynamic> json) =>
      _$SetSMBGuestPasswordOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was shut down.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShutdownGatewayOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  ShutdownGatewayOutput({
    this.gatewayARN,
  });
  factory ShutdownGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$ShutdownGatewayOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAvailabilityMonitorTestOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  StartAvailabilityMonitorTestOutput({
    this.gatewayARN,
  });
  factory StartAvailabilityMonitorTestOutput.fromJson(
          Map<String, dynamic> json) =>
      _$StartAvailabilityMonitorTestOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was restarted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartGatewayOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  StartGatewayOutput({
    this.gatewayARN,
  });
  factory StartGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$StartGatewayOutputFromJson(json);
}

/// Describes an iSCSI stored volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StorediSCSIVolume {
  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this timestamp.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;

  /// Indicates if when the stored volume was created, existing data on the
  /// underlying local disk was preserved.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  @_s.JsonKey(name: 'PreservedExistingData')
  final bool preservedExistingData;

  /// If the stored volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not included.
  @_s.JsonKey(name: 'SourceSnapshotId')
  final String sourceSnapshotId;

  /// The name of the iSCSI target used by an initiator to connect to a volume and
  /// used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  @_s.JsonKey(name: 'TargetName')
  final String targetName;

  /// The Amazon Resource Name (ARN) of the storage volume.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// A value that indicates whether a storage volume is attached to, detached
  /// from, or is in the process of detaching from a gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving
  /// your volumes to a different gateway</a>.
  @_s.JsonKey(name: 'VolumeAttachmentStatus')
  final String volumeAttachmentStatus;

  /// The ID of the local disk that was specified in the
  /// <a>CreateStorediSCSIVolume</a> operation.
  @_s.JsonKey(name: 'VolumeDiskId')
  final String volumeDiskId;

  /// The unique identifier of the volume, e.g., vol-AE4B946D.
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the stored volume is not restoring or
  /// bootstrapping.
  @_s.JsonKey(name: 'VolumeProgress')
  final double volumeProgress;

  /// The size of the volume in bytes.
  @_s.JsonKey(name: 'VolumeSizeInBytes')
  final int volumeSizeInBytes;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  @_s.JsonKey(name: 'VolumeStatus')
  final String volumeStatus;

  /// One of the VolumeType enumeration values describing the type of the volume.
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  /// The size of the data stored on the volume in bytes. This value is calculated
  /// based on the number of blocks that are touched, instead of the actual amount
  /// of data written. This value can be useful for sequential write patterns but
  /// less accurate for random write patterns. <code>VolumeUsedInBytes</code> is
  /// different from the compressed size of the volume, which is the value that is
  /// used to calculate your bill.
  /// <note>
  /// This value is not available for volumes created prior to May 13, 2015, until
  /// you store data on the volume.
  /// </note>
  @_s.JsonKey(name: 'VolumeUsedInBytes')
  final int volumeUsedInBytes;

  /// An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI
  /// attributes for one stored volume.
  @_s.JsonKey(name: 'VolumeiSCSIAttributes')
  final VolumeiSCSIAttributes volumeiSCSIAttributes;

  StorediSCSIVolume({
    this.createdDate,
    this.kMSKey,
    this.preservedExistingData,
    this.sourceSnapshotId,
    this.targetName,
    this.volumeARN,
    this.volumeAttachmentStatus,
    this.volumeDiskId,
    this.volumeId,
    this.volumeProgress,
    this.volumeSizeInBytes,
    this.volumeStatus,
    this.volumeType,
    this.volumeUsedInBytes,
    this.volumeiSCSIAttributes,
  });
  factory StorediSCSIVolume.fromJson(Map<String, dynamic> json) =>
      _$StorediSCSIVolumeFromJson(json);
}

/// A key-value pair that helps you manage, filter, and search for your
/// resource. Allowed characters: letters, white space, and numbers,
/// representable in UTF-8, and the following characters: + - = . _ : /.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Tag key. The key can't start with aws:.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Value of the tag key.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Describes a virtual tape object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Tape {
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;

  /// The date that the tape enters a custom tape pool.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PoolEntryDate')
  final DateTime poolEntryDate;

  /// The ID of the pool that contains tapes that will be archived. The tapes in
  /// this pool are archived in the S3 storage class that is associated with the
  /// pool. When you use your backup application to eject the tape, the tape is
  /// archived directly into the storage class (S3 Glacier or S3 Glacier Deep
  /// Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  @_s.JsonKey(name: 'PoolId')
  final String poolId;

  /// For archiving virtual tapes, indicates how much data remains to be uploaded
  /// before archiving is complete.
  ///
  /// Range: 0 (not started) to 100 (complete).
  @_s.JsonKey(name: 'Progress')
  final double progress;

  /// The date that the tape is first archived with tape retention lock enabled.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RetentionStartDate')
  final DateTime retentionStartDate;

  /// The Amazon Resource Name (ARN) of the virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  /// The barcode that identifies a specific virtual tape.
  @_s.JsonKey(name: 'TapeBarcode')
  final String tapeBarcode;

  /// The date the virtual tape was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TapeCreatedDate')
  final DateTime tapeCreatedDate;

  /// The size, in bytes, of the virtual tape capacity.
  @_s.JsonKey(name: 'TapeSizeInBytes')
  final int tapeSizeInBytes;

  /// The current state of the virtual tape.
  @_s.JsonKey(name: 'TapeStatus')
  final String tapeStatus;

  /// The size, in bytes, of data stored on the virtual tape.
  /// <note>
  /// This value is not available for tapes created prior to May 13, 2015.
  /// </note>
  @_s.JsonKey(name: 'TapeUsedInBytes')
  final int tapeUsedInBytes;

  /// The virtual tape library (VTL) device that the virtual tape is associated
  /// with.
  @_s.JsonKey(name: 'VTLDevice')
  final String vTLDevice;

  /// If the tape is archived as write-once-read-many (WORM), this value is
  /// <code>true</code>.
  @_s.JsonKey(name: 'Worm')
  final bool worm;

  Tape({
    this.kMSKey,
    this.poolEntryDate,
    this.poolId,
    this.progress,
    this.retentionStartDate,
    this.tapeARN,
    this.tapeBarcode,
    this.tapeCreatedDate,
    this.tapeSizeInBytes,
    this.tapeStatus,
    this.tapeUsedInBytes,
    this.vTLDevice,
    this.worm,
  });
  factory Tape.fromJson(Map<String, dynamic> json) => _$TapeFromJson(json);
}

/// Represents a virtual tape that is archived in the virtual tape shelf (VTS).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TapeArchive {
  /// The time that the archiving of the virtual tape was completed.
  ///
  /// The default timestamp format is in the ISO8601 extended
  /// YYYY-MM-DD'T'HH:MM:SS'Z' format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionTime')
  final DateTime completionTime;
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;

  /// The time that the tape entered the custom tape pool.
  ///
  /// The default timestamp format is in the ISO8601 extended
  /// YYYY-MM-DD'T'HH:MM:SS'Z' format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PoolEntryDate')
  final DateTime poolEntryDate;

  /// The ID of the pool that was used to archive the tape. The tapes in this pool
  /// are archived in the S3 storage class that is associated with the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  @_s.JsonKey(name: 'PoolId')
  final String poolId;

  /// If the archived tape is subject to tape retention lock, the date that the
  /// archived tape started being retained.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RetentionStartDate')
  final DateTime retentionStartDate;

  /// The Amazon Resource Name (ARN) of the tape gateway that the virtual tape is
  /// being retrieved to.
  ///
  /// The virtual tape is retrieved from the virtual tape shelf (VTS).
  @_s.JsonKey(name: 'RetrievedTo')
  final String retrievedTo;

  /// The Amazon Resource Name (ARN) of an archived virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  /// The barcode that identifies the archived virtual tape.
  @_s.JsonKey(name: 'TapeBarcode')
  final String tapeBarcode;

  /// The date the virtual tape was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TapeCreatedDate')
  final DateTime tapeCreatedDate;

  /// The size, in bytes, of the archived virtual tape.
  @_s.JsonKey(name: 'TapeSizeInBytes')
  final int tapeSizeInBytes;

  /// The current state of the archived virtual tape.
  @_s.JsonKey(name: 'TapeStatus')
  final String tapeStatus;

  /// The size, in bytes, of data stored on the virtual tape.
  /// <note>
  /// This value is not available for tapes created prior to May 13, 2015.
  /// </note>
  @_s.JsonKey(name: 'TapeUsedInBytes')
  final int tapeUsedInBytes;

  /// Set to <code>true</code> if the archived tape is stored as
  /// write-once-read-many (WORM).
  @_s.JsonKey(name: 'Worm')
  final bool worm;

  TapeArchive({
    this.completionTime,
    this.kMSKey,
    this.poolEntryDate,
    this.poolId,
    this.retentionStartDate,
    this.retrievedTo,
    this.tapeARN,
    this.tapeBarcode,
    this.tapeCreatedDate,
    this.tapeSizeInBytes,
    this.tapeStatus,
    this.tapeUsedInBytes,
    this.worm,
  });
  factory TapeArchive.fromJson(Map<String, dynamic> json) =>
      _$TapeArchiveFromJson(json);
}

/// Describes a virtual tape.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TapeInfo {
  /// The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a>
  /// operation to return a list of gateways for your account and AWS Region.
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The date that the tape entered the custom tape pool with tape retention lock
  /// enabled.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PoolEntryDate')
  final DateTime poolEntryDate;

  /// The ID of the pool that you want to add your tape to for archiving. The tape
  /// in this pool is archived in the S3 storage class that is associated with the
  /// pool. When you use your backup application to eject the tape, the tape is
  /// archived directly into the storage class (S3 Glacier or S3 Glacier Deep
  /// Archive) that corresponds to the pool.
  ///
  /// Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code>
  @_s.JsonKey(name: 'PoolId')
  final String poolId;

  /// The date that the tape became subject to tape retention lock.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RetentionStartDate')
  final DateTime retentionStartDate;

  /// The Amazon Resource Name (ARN) of a virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  /// The barcode that identifies a specific virtual tape.
  @_s.JsonKey(name: 'TapeBarcode')
  final String tapeBarcode;

  /// The size, in bytes, of a virtual tape.
  @_s.JsonKey(name: 'TapeSizeInBytes')
  final int tapeSizeInBytes;

  /// The status of the tape.
  @_s.JsonKey(name: 'TapeStatus')
  final String tapeStatus;

  TapeInfo({
    this.gatewayARN,
    this.poolEntryDate,
    this.poolId,
    this.retentionStartDate,
    this.tapeARN,
    this.tapeBarcode,
    this.tapeSizeInBytes,
    this.tapeStatus,
  });
  factory TapeInfo.fromJson(Map<String, dynamic> json) =>
      _$TapeInfoFromJson(json);
}

/// Describes a recovery point.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TapeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the virtual tape.
  @_s.JsonKey(name: 'TapeARN')
  final String tapeARN;

  /// The time when the point-in-time view of the virtual tape was replicated for
  /// later recovery.
  ///
  /// The default timestamp format of the tape recovery point time is in the
  /// ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TapeRecoveryPointTime')
  final DateTime tapeRecoveryPointTime;

  /// The size, in bytes, of the virtual tapes to recover.
  @_s.JsonKey(name: 'TapeSizeInBytes')
  final int tapeSizeInBytes;

  /// The status of the virtual tapes.
  @_s.JsonKey(name: 'TapeStatus')
  final String tapeStatus;

  TapeRecoveryPointInfo({
    this.tapeARN,
    this.tapeRecoveryPointTime,
    this.tapeSizeInBytes,
    this.tapeStatus,
  });
  factory TapeRecoveryPointInfo.fromJson(Map<String, dynamic> json) =>
      _$TapeRecoveryPointInfoFromJson(json);
}

enum TapeStorageClass {
  @_s.JsonValue('DEEP_ARCHIVE')
  deepArchive,
  @_s.JsonValue('GLACIER')
  glacier,
}

extension on TapeStorageClass {
  String toValue() {
    switch (this) {
      case TapeStorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case TapeStorageClass.glacier:
        return 'GLACIER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAutomaticTapeCreationPolicyOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateAutomaticTapeCreationPolicyOutput({
    this.gatewayARN,
  });
  factory UpdateAutomaticTapeCreationPolicyOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAutomaticTapeCreationPolicyOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// throttle information was updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBandwidthRateLimitOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateBandwidthRateLimitOutput({
    this.gatewayARN,
  });
  factory UpdateBandwidthRateLimitOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateBandwidthRateLimitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBandwidthRateLimitScheduleOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateBandwidthRateLimitScheduleOutput({
    this.gatewayARN,
  });
  factory UpdateBandwidthRateLimitScheduleOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateBandwidthRateLimitScheduleOutputFromJson(json);
}

/// A JSON object containing the following fields:
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChapCredentialsOutput {
  /// The iSCSI initiator that connects to the target. This is the same initiator
  /// name specified in the request.
  @_s.JsonKey(name: 'InitiatorName')
  final String initiatorName;

  /// The Amazon Resource Name (ARN) of the target. This is the same target
  /// specified in the request.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  UpdateChapCredentialsOutput({
    this.initiatorName,
    this.targetARN,
  });
  factory UpdateChapCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateChapCredentialsOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewayInformationOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The name you configured for your gateway.
  @_s.JsonKey(name: 'GatewayName')
  final String gatewayName;

  UpdateGatewayInformationOutput({
    this.gatewayARN,
    this.gatewayName,
  });
  factory UpdateGatewayInformationOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGatewayInformationOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewaySoftwareNowOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateGatewaySoftwareNowOutput({
    this.gatewayARN,
  });
  factory UpdateGatewaySoftwareNowOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGatewaySoftwareNowOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// maintenance start time is updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMaintenanceStartTimeOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateMaintenanceStartTimeOutput({
    this.gatewayARN,
  });
  factory UpdateMaintenanceStartTimeOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMaintenanceStartTimeOutputFromJson(json);
}

/// UpdateNFSFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNFSFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated file share.
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;

  UpdateNFSFileShareOutput({
    this.fileShareARN,
  });
  factory UpdateNFSFileShareOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateNFSFileShareOutputFromJson(json);
}

/// UpdateSMBFileShareOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSMBFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated SMB file share.
  @_s.JsonKey(name: 'FileShareARN')
  final String fileShareARN;

  UpdateSMBFileShareOutput({
    this.fileShareARN,
  });
  factory UpdateSMBFileShareOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateSMBFileShareOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSMBFileShareVisibilityOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateSMBFileShareVisibilityOutput({
    this.gatewayARN,
  });
  factory UpdateSMBFileShareVisibilityOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSMBFileShareVisibilityOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSMBSecurityStrategyOutput {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  UpdateSMBSecurityStrategyOutput({
    this.gatewayARN,
  });
  factory UpdateSMBSecurityStrategyOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateSMBSecurityStrategyOutputFromJson(json);
}

/// A JSON object containing the Amazon Resource Name (ARN) of the updated
/// storage volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSnapshotScheduleOutput {
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  UpdateSnapshotScheduleOutput({
    this.volumeARN,
  });
  factory UpdateSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateSnapshotScheduleOutputFromJson(json);
}

/// UpdateVTLDeviceTypeOutput
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVTLDeviceTypeOutput {
  /// The Amazon Resource Name (ARN) of the medium changer you have selected.
  @_s.JsonKey(name: 'VTLDeviceARN')
  final String vTLDeviceARN;

  UpdateVTLDeviceTypeOutput({
    this.vTLDeviceARN,
  });
  factory UpdateVTLDeviceTypeOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVTLDeviceTypeOutputFromJson(json);
}

/// Represents a device object associated with a tape gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VTLDevice {
  /// A list of iSCSI information about a VTL device.
  @_s.JsonKey(name: 'DeviceiSCSIAttributes')
  final DeviceiSCSIAttributes deviceiSCSIAttributes;

  /// Specifies the unique Amazon Resource Name (ARN) of the device (tape drive or
  /// media changer).
  @_s.JsonKey(name: 'VTLDeviceARN')
  final String vTLDeviceARN;

  /// Specifies the model number of device that the VTL device emulates.
  @_s.JsonKey(name: 'VTLDeviceProductIdentifier')
  final String vTLDeviceProductIdentifier;

  /// Specifies the type of device that the VTL device emulates.
  @_s.JsonKey(name: 'VTLDeviceType')
  final String vTLDeviceType;

  /// Specifies the vendor of the device that the VTL device object emulates.
  @_s.JsonKey(name: 'VTLDeviceVendor')
  final String vTLDeviceVendor;

  VTLDevice({
    this.deviceiSCSIAttributes,
    this.vTLDeviceARN,
    this.vTLDeviceProductIdentifier,
    this.vTLDeviceType,
    this.vTLDeviceVendor,
  });
  factory VTLDevice.fromJson(Map<String, dynamic> json) =>
      _$VTLDeviceFromJson(json);
}

/// Describes a storage volume object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VolumeInfo {
  @_s.JsonKey(name: 'GatewayARN')
  final String gatewayARN;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  @_s.JsonKey(name: 'GatewayId')
  final String gatewayId;

  /// The Amazon Resource Name (ARN) for the storage volume. For example, the
  /// following is a valid ARN:
  ///
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB</code>
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  @_s.JsonKey(name: 'VolumeAttachmentStatus')
  final String volumeAttachmentStatus;

  /// The unique identifier assigned to the volume. This ID becomes part of the
  /// volume Amazon Resource Name (ARN), which you use as input for other
  /// operations.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  /// The size of the volume in bytes.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  @_s.JsonKey(name: 'VolumeSizeInBytes')
  final int volumeSizeInBytes;

  /// One of the VolumeType enumeration values describing the type of the volume.
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  VolumeInfo({
    this.gatewayARN,
    this.gatewayId,
    this.volumeARN,
    this.volumeAttachmentStatus,
    this.volumeId,
    this.volumeSizeInBytes,
    this.volumeType,
  });
  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

/// Describes a storage volume recovery point object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VolumeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the volume target.
  @_s.JsonKey(name: 'VolumeARN')
  final String volumeARN;

  /// The time the recovery point was taken.
  @_s.JsonKey(name: 'VolumeRecoveryPointTime')
  final String volumeRecoveryPointTime;

  /// The size of the volume in bytes.
  @_s.JsonKey(name: 'VolumeSizeInBytes')
  final int volumeSizeInBytes;

  /// The size of the data stored on the volume in bytes.
  /// <note>
  /// This value is not available for volumes created prior to May 13, 2015, until
  /// you store data on the volume.
  /// </note>
  @_s.JsonKey(name: 'VolumeUsageInBytes')
  final int volumeUsageInBytes;

  VolumeRecoveryPointInfo({
    this.volumeARN,
    this.volumeRecoveryPointTime,
    this.volumeSizeInBytes,
    this.volumeUsageInBytes,
  });
  factory VolumeRecoveryPointInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeRecoveryPointInfoFromJson(json);
}

/// Lists iSCSI information about a volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VolumeiSCSIAttributes {
  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  @_s.JsonKey(name: 'ChapEnabled')
  final bool chapEnabled;

  /// The logical disk number.
  @_s.JsonKey(name: 'LunNumber')
  final int lunNumber;

  /// The network interface identifier.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// The port used to communicate with iSCSI targets.
  @_s.JsonKey(name: 'NetworkInterfacePort')
  final int networkInterfacePort;

  /// The Amazon Resource Name (ARN) of the volume target.
  @_s.JsonKey(name: 'TargetARN')
  final String targetARN;

  VolumeiSCSIAttributes({
    this.chapEnabled,
    this.lunNumber,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.targetARN,
  });
  factory VolumeiSCSIAttributes.fromJson(Map<String, dynamic> json) =>
      _$VolumeiSCSIAttributesFromJson(json);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidGatewayRequestException extends _s.GenericAwsException {
  InvalidGatewayRequestException({String type, String message})
      : super(
            type: type,
            code: 'InvalidGatewayRequestException',
            message: message);
}

class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String type, String message})
      : super(type: type, code: 'ServiceUnavailableError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidGatewayRequestException': (type, message) =>
      InvalidGatewayRequestException(type: type, message: message),
  'ServiceUnavailableError': (type, message) =>
      ServiceUnavailableError(type: type, message: message),
};
