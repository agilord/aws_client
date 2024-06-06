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

/// Storage Gateway is the service that connects an on-premises software
/// appliance with cloud-based storage to provide seamless and secure
/// integration between an organization's on-premises IT environment and the
/// Amazon Web Services storage infrastructure. The service enables you to
/// securely upload data to the Amazon Web Services Cloud for cost effective
/// backup and rapid disaster recovery.
class StorageGateway {
  final _s.JsonProtocol _protocol;
  StorageGateway({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'storagegateway',
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

  /// Activates the gateway you previously deployed on your host. In the
  /// activation process, you specify information such as the Amazon Web
  /// Services Region that you want to use for storing snapshots or tapes, the
  /// time zone for scheduled snapshots the gateway snapshot schedule window, an
  /// activation key, and a name for your gateway. The activation process also
  /// associates your gateway with your account. For more information, see
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
  /// activation key</a> in the <i>Storage Gateway User Guide</i>.
  ///
  /// Parameter [gatewayName] :
  /// The name you configured for your gateway.
  ///
  /// Parameter [gatewayRegion] :
  /// A value that indicates the Amazon Web Services Region where you want to
  /// store your data. The gateway Amazon Web Services Region specified must be
  /// the same Amazon Web Services Region as the Amazon Web Services Region in
  /// your <code>Host</code> header in the request. For more information about
  /// available Amazon Web Services Regions and endpoints for Storage Gateway,
  /// see <a href="https://docs.aws.amazon.com/general/latest/gr/sg.html">
  /// Storage Gateway endpoints and quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>.
  ///
  /// Valid Values: See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/sg.html"> Storage
  /// Gateway endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [gatewayTimezone] :
  /// A value that indicates the time zone you want to set for the gateway. The
  /// time zone is of the format "GMT", "GMT-hr:mm", or "GMT+hr:mm". For
  /// example, GMT indicates Greenwich Mean Time without any offset. GMT-4:00
  /// indicates the time is 4 hours behind GMT. GMT+2:00 indicates the time is 2
  /// hours ahead of GMT. The time zone is used, for example, for scheduling
  /// snapshots and your gateway's maintenance schedule.
  ///
  /// Parameter [gatewayType] :
  /// A value that defines the type of gateway to activate. The type specified
  /// is critical to all later functions of the gateway and cannot be changed
  /// after activation. The default value is <code>CACHED</code>.
  ///
  /// Valid Values: <code>STORED</code> | <code>CACHED</code> | <code>VTL</code>
  /// | <code>FILE_S3</code> | <code>FILE_FSX_SMB</code>
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
    required String activationKey,
    required String gatewayName,
    required String gatewayRegion,
    required String gatewayTimezone,
    String? gatewayType,
    String? mediumChangerType,
    List<Tag>? tags,
    String? tapeDriveType,
  }) async {
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
  /// Storage Gateway works (architecture)</a>.
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
    required List<String> diskIds,
    required String gatewayARN,
  }) async {
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
  /// add tags to the following Storage Gateway resources:
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
  /// <li>
  /// File System associations
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
    required String resourceARN,
    required List<Tag> tags,
  }) async {
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
  /// cached volume, and tape gateway types.
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
    required List<String> diskIds,
    required String gatewayARN,
  }) async {
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
    required List<String> diskIds,
    required String gatewayARN,
  }) async {
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
    required String poolId,
    required String tapeARN,
    bool? bypassGovernanceRetention,
  }) async {
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

  /// Associate an Amazon FSx file system with the FSx File Gateway. After the
  /// association process is complete, the file shares on the Amazon FSx file
  /// system are available for access through the gateway. This operation only
  /// supports the FSx File Gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique string value that you supply that is used by the FSx File Gateway
  /// to ensure idempotent file system association creation.
  ///
  /// Parameter [locationARN] :
  /// The Amazon Resource Name (ARN) of the Amazon FSx file system to associate
  /// with the FSx File Gateway.
  ///
  /// Parameter [password] :
  /// The password of the user credential.
  ///
  /// Parameter [userName] :
  /// The user name of the user credential that has permission to access the
  /// root share D$ of the Amazon FSx file system. The user account must belong
  /// to the Amazon FSx delegated admin user group.
  ///
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  ///
  /// Parameter [endpointNetworkConfiguration] :
  /// Specifies the network configuration information for the gateway associated
  /// with the Amazon FSx file system.
  /// <note>
  /// If multiple file systems are associated with this gateway, this
  /// parameter's <code>IpAddresses</code> field is required.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags that can be assigned to the file system
  /// association. Each tag is a key-value pair.
  Future<AssociateFileSystemOutput> associateFileSystem({
    required String clientToken,
    required String gatewayARN,
    required String locationARN,
    required String password,
    required String userName,
    String? auditDestinationARN,
    CacheAttributes? cacheAttributes,
    EndpointNetworkConfiguration? endpointNetworkConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.AssociateFileSystem'
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
        'Password': password,
        'UserName': userName,
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (endpointNetworkConfiguration != null)
          'EndpointNetworkConfiguration': endpointNetworkConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return AssociateFileSystemOutput.fromJson(jsonResponse.body);
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
    required String gatewayARN,
    required String networkInterfaceId,
    required String volumeARN,
    String? diskId,
    String? targetName,
  }) async {
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
    required String gatewayARN,
    required String tapeARN,
  }) async {
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
    required String gatewayARN,
    required String tapeARN,
  }) async {
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
    required String clientToken,
    required String gatewayARN,
    required String networkInterfaceId,
    required String targetName,
    required int volumeSizeInBytes,
    bool? kMSEncrypted,
    String? kMSKey,
    String? snapshotId,
    String? sourceVolumeARN,
    List<Tag>? tags,
  }) async {
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

  /// Creates a Network File System (NFS) file share on an existing S3 File
  /// Gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway exposes file shares
  /// using an NFS interface. This operation is only supported for S3 File
  /// Gateways.
  /// <important>
  /// S3 File gateway requires Security Token Service (Amazon Web Services STS)
  /// to be activated to enable you to create a file share. Make sure Amazon Web
  /// Services STS is activated in the Amazon Web Services Region you are
  /// creating your S3 File Gateway in. If Amazon Web Services STS is not
  /// activated in the Amazon Web Services Region, activate it. For information
  /// about how to activate Amazon Web Services STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating Amazon Web Services STS in an Amazon Web Services
  /// Region</a> in the <i>Identity and Access Management User Guide</i>.
  ///
  /// S3 File Gateways do not support creating hard or symbolic links on a file
  /// share.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique string value that you supply that is used by S3 File Gateway to
  /// ensure idempotent file share creation.
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the S3 File Gateway on which you want to
  /// create a file share.
  ///
  /// Parameter [locationARN] :
  /// A custom ARN for the backend storage used for storing data for file
  /// shares. It includes a resource ARN with an optional prefix concatenation.
  /// The prefix must end with a forward slash (/).
  /// <note>
  /// You can specify LocationARN as a bucket ARN, access point ARN or access
  /// point alias, as shown in the following examples.
  ///
  /// Bucket ARN:
  ///
  /// <code>arn:aws:s3:::my-bucket/prefix/</code>
  ///
  /// Access point ARN:
  ///
  /// <code>arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/</code>
  ///
  /// If you specify an access point, the bucket policy must be configured to
  /// delegate access control to the access point. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html#access-points-delegating-control">Delegating
  /// access control to access points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Access point alias:
  ///
  /// <code>test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias</code>
  /// </note>
  ///
  /// Parameter [role] :
  /// The ARN of the Identity and Access Management (IAM) role that an S3 File
  /// Gateway assumes when it accesses the underlying storage.
  ///
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  ///
  /// Parameter [bucketRegion] :
  /// Specifies the Region of the S3 bucket where the NFS file share stores
  /// files.
  /// <note>
  /// This parameter is required for NFS file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  ///
  /// Parameter [cacheAttributes] :
  /// Specifies refresh cache information for the file share.
  ///
  /// Parameter [clientList] :
  /// The list of clients that are allowed to access the S3 File Gateway. The
  /// list must contain either valid IP addresses or valid CIDR blocks.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// S3 File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the
  /// object uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a S3 File Gateway puts objects into. The default value
  /// is <code>private</code>.
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
  ///
  /// Parameter [vPCEndpointDNSName] :
  /// Specifies the DNS name for the VPC endpoint that the NFS file share uses
  /// to connect to Amazon S3.
  /// <note>
  /// This parameter is required for NFS file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  Future<CreateNFSFileShareOutput> createNFSFileShare({
    required String clientToken,
    required String gatewayARN,
    required String locationARN,
    required String role,
    String? auditDestinationARN,
    String? bucketRegion,
    CacheAttributes? cacheAttributes,
    List<String>? clientList,
    String? defaultStorageClass,
    String? fileShareName,
    bool? guessMIMETypeEnabled,
    bool? kMSEncrypted,
    String? kMSKey,
    NFSFileShareDefaults? nFSFileShareDefaults,
    String? notificationPolicy,
    ObjectACL? objectACL,
    bool? readOnly,
    bool? requesterPays,
    String? squash,
    List<Tag>? tags,
    String? vPCEndpointDNSName,
  }) async {
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
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
        if (bucketRegion != null) 'BucketRegion': bucketRegion,
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
        if (vPCEndpointDNSName != null)
          'VPCEndpointDNSName': vPCEndpointDNSName,
      },
    );

    return CreateNFSFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Creates a Server Message Block (SMB) file share on an existing S3 File
  /// Gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway exposes file shares
  /// using an SMB interface. This operation is only supported for S3 File
  /// Gateways.
  /// <important>
  /// S3 File Gateways require Security Token Service (Amazon Web Services STS)
  /// to be activated to enable you to create a file share. Make sure that
  /// Amazon Web Services STS is activated in the Amazon Web Services Region you
  /// are creating your S3 File Gateway in. If Amazon Web Services STS is not
  /// activated in this Amazon Web Services Region, activate it. For information
  /// about how to activate Amazon Web Services STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating Amazon Web Services STS in an Amazon Web Services
  /// Region</a> in the <i>Identity and Access Management User Guide</i>.
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientToken] :
  /// A unique string value that you supply that is used by S3 File Gateway to
  /// ensure idempotent file share creation.
  ///
  /// Parameter [gatewayARN] :
  /// The ARN of the S3 File Gateway on which you want to create a file share.
  ///
  /// Parameter [locationARN] :
  /// A custom ARN for the backend storage used for storing data for file
  /// shares. It includes a resource ARN with an optional prefix concatenation.
  /// The prefix must end with a forward slash (/).
  /// <note>
  /// You can specify LocationARN as a bucket ARN, access point ARN or access
  /// point alias, as shown in the following examples.
  ///
  /// Bucket ARN:
  ///
  /// <code>arn:aws:s3:::my-bucket/prefix/</code>
  ///
  /// Access point ARN:
  ///
  /// <code>arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/</code>
  ///
  /// If you specify an access point, the bucket policy must be configured to
  /// delegate access control to the access point. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html#access-points-delegating-control">Delegating
  /// access control to access points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Access point alias:
  ///
  /// <code>test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias</code>
  /// </note>
  ///
  /// Parameter [role] :
  /// The ARN of the Identity and Access Management (IAM) role that an S3 File
  /// Gateway assumes when it accesses the underlying storage.
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
  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  ///
  /// Parameter [authentication] :
  /// The authentication method that users use to access the file share. The
  /// default is <code>ActiveDirectory</code>.
  ///
  /// Valid Values: <code>ActiveDirectory</code> | <code>GuestAccess</code>
  ///
  /// Parameter [bucketRegion] :
  /// Specifies the Region of the S3 bucket where the SMB file share stores
  /// files.
  /// <note>
  /// This parameter is required for SMB file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  ///
  /// Parameter [cacheAttributes] :
  /// Specifies refresh cache information for the file share.
  ///
  /// Parameter [caseSensitivity] :
  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case
  /// sensitivity. The default value is <code>ClientSpecified</code>.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// S3 File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the
  /// object uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a S3 File Gateway puts objects into. The default value
  /// is <code>private</code>.
  ///
  /// Parameter [oplocksEnabled] :
  /// Specifies whether opportunistic locking is enabled for the SMB file share.
  /// <note>
  /// Enabling opportunistic locking on case-sensitive shares is not recommended
  /// for workloads that involve access to files with the same name in different
  /// case.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
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
  /// <i>Storage Gateway User Guide</i>.
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
  /// Parameter [vPCEndpointDNSName] :
  /// Specifies the DNS name for the VPC endpoint that the SMB file share uses
  /// to connect to Amazon S3.
  /// <note>
  /// This parameter is required for SMB file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  ///
  /// Parameter [validUserList] :
  /// A list of users or groups in the Active Directory that are allowed to
  /// access the file <a href=""/> share. A group must be prefixed with the @
  /// character. Acceptable formats include: <code>DOMAIN\User1</code>,
  /// <code>user1</code>, <code>@group1</code>, and <code>@DOMAIN\group1</code>.
  /// Can only be set if Authentication is set to <code>ActiveDirectory</code>.
  Future<CreateSMBFileShareOutput> createSMBFileShare({
    required String clientToken,
    required String gatewayARN,
    required String locationARN,
    required String role,
    bool? accessBasedEnumeration,
    List<String>? adminUserList,
    String? auditDestinationARN,
    String? authentication,
    String? bucketRegion,
    CacheAttributes? cacheAttributes,
    CaseSensitivity? caseSensitivity,
    String? defaultStorageClass,
    String? fileShareName,
    bool? guessMIMETypeEnabled,
    List<String>? invalidUserList,
    bool? kMSEncrypted,
    String? kMSKey,
    String? notificationPolicy,
    ObjectACL? objectACL,
    bool? oplocksEnabled,
    bool? readOnly,
    bool? requesterPays,
    bool? sMBACLEnabled,
    List<Tag>? tags,
    String? vPCEndpointDNSName,
    List<String>? validUserList,
  }) async {
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
        if (bucketRegion != null) 'BucketRegion': bucketRegion,
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
        if (oplocksEnabled != null) 'OplocksEnabled': oplocksEnabled,
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (sMBACLEnabled != null) 'SMBACLEnabled': sMBACLEnabled,
        if (tags != null) 'Tags': tags,
        if (vPCEndpointDNSName != null)
          'VPCEndpointDNSName': vPCEndpointDNSName,
        if (validUserList != null) 'ValidUserList': validUserList,
      },
    );

    return CreateSMBFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Initiates a snapshot of a volume.
  ///
  /// Storage Gateway provides the ability to back up point-in-time snapshots of
  /// your data to Amazon Simple Storage (Amazon S3) for durable off-site
  /// recovery, and also import the data to an Amazon Elastic Block Store (EBS)
  /// volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of
  /// your gateway volume on a scheduled or ad hoc basis. This API enables you
  /// to take an ad hoc snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing
  /// a snapshot schedule</a>.
  ///
  /// In the <code>CreateSnapshot</code> request, you identify the volume by
  /// providing its Amazon Resource Name (ARN). You must also provide
  /// description for the snapshot. When Storage Gateway takes the snapshot of
  /// specified volume, the snapshot and description appears in the Storage
  /// Gateway console. In response, Storage Gateway returns you a snapshot ID.
  /// You can use this snapshot ID to check the snapshot progress or later use
  /// it when you want to create a volume from a snapshot. This operation is
  /// only supported in stored and cached volume gateway type.
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
  /// field, and in the Storage Gateway snapshot <b>Details</b> pane,
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
    required String snapshotDescription,
    required String volumeARN,
    List<Tag>? tags,
  }) async {
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
  /// in the Storage Gateway console. In response, the gateway returns you a
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
  /// field, and in the Storage Gateway snapshot <b>Details</b> pane,
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
    required String snapshotDescription,
    required String volumeARN,
    List<Tag>? tags,
  }) async {
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
  /// Set to <code>true</code> if you want to preserve the data on the local
  /// disk. Otherwise, set to <code>false</code> to create an empty volume.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
  /// The snapshot ID (e.g., "snap-1122aabb") of the snapshot to restore as the
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
    required String diskId,
    required String gatewayARN,
    required String networkInterfaceId,
    required bool preserveExistingData,
    required String targetName,
    bool? kMSEncrypted,
    String? kMSKey,
    String? snapshotId,
    List<Tag>? tags,
  }) async {
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
  /// governance mode, Amazon Web Services accounts with specific IAM
  /// permissions are authorized to remove the tape retention lock from archived
  /// virtual tapes. When configured in compliance mode, the tape retention lock
  /// cannot be removed by any user, including the root Amazon Web Services
  /// account.
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
    required String poolName,
    required TapeStorageClass storageClass,
    int? retentionLockTimeInDays,
    RetentionLockType? retentionLockType,
    List<Tag>? tags,
  }) async {
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
        'StorageClass': storageClass.toValue(),
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
  /// return a list of gateways for your account and Amazon Web Services Region.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
    required String gatewayARN,
    required String tapeBarcode,
    required int tapeSizeInBytes,
    bool? kMSEncrypted,
    String? kMSKey,
    String? poolId,
    List<Tag>? tags,
    bool? worm,
  }) async {
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
  /// return a list of gateways for your account and Amazon Web Services Region.
  ///
  /// Parameter [numTapesToCreate] :
  /// The number of virtual tapes that you want to create.
  ///
  /// Parameter [tapeBarcodePrefix] :
  /// A prefix that you append to the barcode of the virtual tape you are
  /// creating. This prefix makes the barcode unique.
  /// <note>
  /// The prefix must be 1-4 characters in length and must be one of the
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
    required String clientToken,
    required String gatewayARN,
    required int numTapesToCreate,
    required String tapeBarcodePrefix,
    required int tapeSizeInBytes,
    bool? kMSEncrypted,
    String? kMSKey,
    String? poolId,
    List<Tag>? tags,
    bool? worm,
  }) async {
    _s.validateNumRange(
      'numTapesToCreate',
      numTapesToCreate,
      1,
      10,
      isRequired: true,
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
    required String gatewayARN,
  }) async {
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
  /// the gateway in your request. This operation is supported only for the
  /// stored volume, cached volume, and tape gateway types.
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
    required String bandwidthType,
    required String gatewayARN,
  }) async {
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
    required String initiatorName,
    required String targetARN,
  }) async {
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

  /// Deletes a file share from an S3 File Gateway. This operation is only
  /// supported for S3 File Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARN] :
  /// The Amazon Resource Name (ARN) of the file share to be deleted.
  ///
  /// Parameter [forceDelete] :
  /// If this value is set to <code>true</code>, the operation deletes a file
  /// share immediately and aborts all data uploads to Amazon Web Services.
  /// Otherwise, the file share is not deleted until all data is uploaded to
  /// Amazon Web Services. This process aborts the data upload process, and the
  /// file share enters the <code>FORCE_DELETING</code> status.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<DeleteFileShareOutput> deleteFileShare({
    required String fileShareARN,
    bool? forceDelete,
  }) async {
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
  /// href="http://aws.amazon.com/storagegateway">Storage Gateway detail
  /// page</a>.
  /// </important>
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DeleteGatewayOutput> deleteGateway({
    required String gatewayARN,
  }) async {
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
  /// operation is only supported for cached volume gateway types.
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
    required String volumeARN,
  }) async {
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
  /// return a list of gateways for your account and Amazon Web Services Region.
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
    required String gatewayARN,
    required String tapeARN,
    bool? bypassGovernanceRetention,
  }) async {
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
    required String tapeARN,
    bool? bypassGovernanceRetention,
  }) async {
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
    required String poolARN,
  }) async {
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
    required String volumeARN,
  }) async {
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

  /// Returns information about the most recent high availability monitoring
  /// test that was performed on the host in a cluster. If a test isn't
  /// performed, the status and start time in the response would be null.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeAvailabilityMonitorTestOutput>
      describeAvailabilityMonitorTest({
    required String gatewayARN,
  }) async {
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
  /// operation is supported only for the stored volume, cached volume, and tape
  /// gateway types. To describe bandwidth rate limits for S3 file gateways, use
  /// <a>DescribeBandwidthRateLimitSchedule</a>.
  ///
  /// This operation returns a value for a bandwidth rate limit only if the
  /// limit is set. If no limits are set for the gateway, then this operation
  /// returns only the gateway ARN in the response body. To specify which
  /// gateway to describe, use the Amazon Resource Name (ARN) of the gateway in
  /// your request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeBandwidthRateLimitOutput> describeBandwidthRateLimit({
    required String gatewayARN,
  }) async {
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
  /// only for volume, tape and S3 file gateways. FSx file gateways do not
  /// support bandwidth rate limits.
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
    required String gatewayARN,
  }) async {
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
    required String gatewayARN,
  }) async {
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
  /// the response, Storage Gateway returns volume information sorted by volume
  /// Amazon Resource Name (ARN).
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARNs] :
  /// An array of strings where each string represents the Amazon Resource Name
  /// (ARN) of a cached volume. All of the specified cached volumes must be from
  /// the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.
  Future<DescribeCachediSCSIVolumesOutput> describeCachediSCSIVolumes({
    required List<String> volumeARNs,
  }) async {
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
    required String targetARN,
  }) async {
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

  /// Gets the file system association information. This operation is only
  /// supported for FSx File Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemAssociationARNList] :
  /// An array containing the Amazon Resource Name (ARN) of each file system
  /// association to be described.
  Future<DescribeFileSystemAssociationsOutput> describeFileSystemAssociations({
    required List<String> fileSystemAssociationARNList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DescribeFileSystemAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemAssociationARNList': fileSystemAssociationARNList,
      },
    );

    return DescribeFileSystemAssociationsOutput.fromJson(jsonResponse.body);
  }

  /// Returns metadata about a gateway such as its name, network interfaces,
  /// time zone, status, and software version. To specify which gateway to
  /// describe, use the Amazon Resource Name (ARN) of the gateway in your
  /// request.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<DescribeGatewayInformationOutput> describeGatewayInformation({
    required String gatewayARN,
  }) async {
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
    required String gatewayARN,
  }) async {
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
  /// from an S3 File Gateway. This operation is only supported for S3 File
  /// Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARNList] :
  /// An array containing the Amazon Resource Name (ARN) of each file share to
  /// be described.
  Future<DescribeNFSFileSharesOutput> describeNFSFileShares({
    required List<String> fileShareARNList,
  }) async {
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
  /// from a S3 File Gateway. This operation is only supported for S3 File
  /// Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileShareARNList] :
  /// An array containing the Amazon Resource Name (ARN) of each file share to
  /// be described.
  Future<DescribeSMBFileSharesOutput> describeSMBFileShares({
    required List<String> fileShareARNList,
  }) async {
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
    required String gatewayARN,
  }) async {
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
    required String volumeARN,
  }) async {
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
  /// the response, Storage Gateway returns volume information sorted by volume
  /// ARNs. This operation is only supported in stored volume gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [volumeARNs] :
  /// An array of strings where each string represents the Amazon Resource Name
  /// (ARN) of a stored volume. All of the specified stored volumes must be from
  /// the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.
  Future<DescribeStorediSCSIVolumesOutput> describeStorediSCSIVolumes({
    required List<String> volumeARNs,
  }) async {
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
  /// If a specific <code>TapeARN</code> is not specified, Storage Gateway
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
    int? limit,
    String? marker,
    List<String>? tapeARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    required String gatewayARN,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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

  /// Returns a description of virtual tapes that correspond to the specified
  /// Amazon Resource Names (ARNs). If <code>TapeARN</code> is not specified,
  /// returns a description of the virtual tapes associated with the specified
  /// gateway. This operation is only supported for the tape gateway type.
  ///
  /// The operation supports pagination. By default, the operation returns a
  /// maximum of up to 100 tapes. You can optionally specify the
  /// <code>Limit</code> field in the body to limit the number of tapes in the
  /// response. If the number of tapes returned in the response is truncated,
  /// the response includes a <code>Marker</code> field. You can use this
  /// <code>Marker</code> value in your subsequent request to retrieve the next
  /// set of tapes.
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
    required String gatewayARN,
    int? limit,
    String? marker,
    List<String>? tapeARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    required String gatewayARN,
  }) async {
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
  /// specified tape gateway. In the response, Storage Gateway returns VTL
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
    required String gatewayARN,
    int? limit,
    String? marker,
    List<String>? vTLDeviceARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    required String gatewayARN,
  }) async {
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
    required String volumeARN,
    bool? forceDetach,
  }) async {
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
    required String gatewayARN,
  }) async {
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

  /// Disassociates an Amazon FSx file system from the specified gateway. After
  /// the disassociation process finishes, the gateway can no longer access the
  /// Amazon FSx file system. This operation is only supported in the FSx File
  /// Gateway type.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemAssociationARN] :
  /// The Amazon Resource Name (ARN) of the file system association to be
  /// deleted.
  ///
  /// Parameter [forceDelete] :
  /// If this value is set to true, the operation disassociates an Amazon FSx
  /// file system immediately. It ends all data uploads to the file system, and
  /// the file system association enters the <code>FORCE_DELETING</code> status.
  /// If this value is set to false, the Amazon FSx file system does not
  /// disassociate until all data is uploaded.
  Future<DisassociateFileSystemOutput> disassociateFileSystem({
    required String fileSystemAssociationARN,
    bool? forceDelete,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.DisassociateFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemAssociationARN': fileSystemAssociationARN,
        if (forceDelete != null) 'ForceDelete': forceDelete,
      },
    );

    return DisassociateFileSystemOutput.fromJson(jsonResponse.body);
  }

  /// Adds a file gateway to an Active Directory domain. This operation is only
  /// supported for file gateways that support the SMB file protocol.
  /// <note>
  /// Joining a domain creates an Active Directory computer account in the
  /// default organizational unit, using the gateway's <b>Gateway ID</b> as the
  /// account name (for example, SGW-1234ADE). If your Active Directory
  /// environment requires that you pre-stage accounts to facilitate the join
  /// domain process, you will need to create this account ahead of time.
  ///
  /// To create the gateway's computer account in an organizational unit other
  /// than the default, you must specify the organizational unit when joining
  /// the domain.
  /// </note>
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
  /// account and Amazon Web Services Region.
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
    required String domainName,
    required String gatewayARN,
    required String password,
    required String userName,
    List<String>? domainControllers,
    String? organizationalUnit,
    int? timeoutInSeconds,
  }) async {
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
    String? gatewayARN,
  }) async {
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

  /// Gets a list of the file shares for a specific S3 File Gateway, or the list
  /// of file shares that belong to the calling Amazon Web Services account.
  /// This operation is only supported for S3 File Gateways.
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
    String? gatewayARN,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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

  /// Gets a list of <code>FileSystemAssociationSummary</code> objects. Each
  /// object contains a summary of a file system association. This operation is
  /// only supported for FSx File Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [limit] :
  /// The maximum number of file system associations to return in the response.
  /// If present, <code>Limit</code> must be an integer with a value greater
  /// than zero. Optional.
  ///
  /// Parameter [marker] :
  /// Opaque pagination token returned from a previous
  /// <code>ListFileSystemAssociations</code> operation. If present,
  /// <code>Marker</code> specifies where to continue the list from after a
  /// previous call to <code>ListFileSystemAssociations</code>. Optional.
  Future<ListFileSystemAssociationsOutput> listFileSystemAssociations({
    String? gatewayARN,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.ListFileSystemAssociations'
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

    return ListFileSystemAssociationsOutput.fromJson(jsonResponse.body);
  }

  /// Lists gateways owned by an Amazon Web Services account in an Amazon Web
  /// Services Region specified in the request. The returned list is ordered by
  /// gateway Amazon Resource Name (ARN).
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
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    required String gatewayARN,
  }) async {
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
    required String resourceARN,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    int? limit,
    String? marker,
    List<String>? poolARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    int? limit,
    String? marker,
    List<String>? tapeARNs,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
    required String volumeARN,
  }) async {
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
    required String gatewayARN,
  }) async {
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
    String? gatewayARN,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
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
  /// Storage Gateway can send a notification through Amazon CloudWatch Events
  /// when all files written to your file share up to that point in time have
  /// been uploaded to Amazon S3. These files include files written to the file
  /// share up to the time that you make a request for notification. When the
  /// upload is done, Storage Gateway sends you notification through an Amazon
  /// CloudWatch Event. You can configure CloudWatch Events to send the
  /// notification through event targets such as Amazon SNS or Lambda function.
  /// This operation is only supported for S3 File Gateways.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification">Getting
  /// file upload notification</a> in the <i>Amazon S3 File Gateway User
  /// Guide</i>.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  Future<NotifyWhenUploadedOutput> notifyWhenUploaded({
    required String fileShareARN,
  }) async {
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

  /// Refreshes the cached inventory of objects for the specified file share.
  /// This operation finds objects in the Amazon S3 bucket that were added,
  /// removed, or replaced since the gateway last listed the bucket's contents
  /// and cached the results. This operation does not import files into the S3
  /// File Gateway cache storage. It only updates the cached inventory to
  /// reflect changes in the inventory of the objects in the S3 bucket. This
  /// operation is only supported in the S3 File Gateway types.
  ///
  /// You can subscribe to be notified through an Amazon CloudWatch event when
  /// your <code>RefreshCache</code> operation completes. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>Amazon S3 File Gateway User
  /// Guide</i>. This operation is Only supported for S3 File Gateways.
  ///
  /// When this API is called, it only initiates the refresh operation. When the
  /// API call completes and returns a success code, it doesn't necessarily mean
  /// that the file refresh has completed. You should use the refresh-complete
  /// notification to determine that the operation has completed before you
  /// check for new files on the gateway file share. You can subscribe to be
  /// notified through a CloudWatch event when your <code>RefreshCache</code>
  /// operation completes.
  ///
  /// Throttle limit: This API is asynchronous, so the gateway will accept no
  /// more than two refreshes at any time. We recommend using the
  /// refresh-complete CloudWatch event notification before issuing additional
  /// requests. For more information, see <a
  /// href="https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>Amazon S3 File Gateway User
  /// Guide</i>.
  /// <important>
  /// <ul>
  /// <li>
  /// Wait at least 60 seconds between consecutive RefreshCache API requests.
  /// </li>
  /// <li>
  /// If you invoke the RefreshCache API when two requests are already being
  /// processed, any new request will cause an
  /// <code>InvalidGatewayRequestException</code> error because too many
  /// requests were sent to the server.
  /// </li>
  /// </ul> </important> <note>
  /// The S3 bucket name does not need to be included when entering the list of
  /// folders in the FolderList parameter.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/filegateway/latest/files3/monitoring-file-gateway.html#get-notification">Getting
  /// notified about file operations</a> in the <i>Amazon S3 File Gateway User
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
  /// Do not include <code>/</code> when specifying folder names. For example,
  /// you would specify <code>samplefolder</code> rather than
  /// <code>samplefolder/</code>.
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
    required String fileShareARN,
    List<String>? folderList,
    bool? recursive,
  }) async {
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
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
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
    required String gatewayARN,
  }) async {
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
  /// gateways for your account and Amazon Web Services Region.
  ///
  /// You retrieve archived virtual tapes to only one gateway and the gateway
  /// must be a tape gateway.
  ///
  /// Parameter [tapeARN] :
  /// The Amazon Resource Name (ARN) of the virtual tape you want to retrieve
  /// from the virtual tape shelf (VTS).
  Future<RetrieveTapeArchiveOutput> retrieveTapeArchive({
    required String gatewayARN,
    required String tapeARN,
  }) async {
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
    required String gatewayARN,
    required String tapeARN,
  }) async {
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
    required String gatewayARN,
    required String localConsolePassword,
  }) async {
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
  /// the file share is set to <code>GuestAccess</code>. This operation only
  /// supported for S3 File Gateways
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [gatewayARN] :
  /// The Amazon Resource Name (ARN) of the S3 File Gateway the SMB file share
  /// is associated with.
  ///
  /// Parameter [password] :
  /// The password that you want to set for your SMB server.
  Future<SetSMBGuestPasswordOutput> setSMBGuestPassword({
    required String gatewayARN,
    required String password,
  }) async {
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

  /// Shuts down a Tape Gateway or Volume Gateway. To specify which gateway to
  /// shut down, use the Amazon Resource Name (ARN) of the gateway in the body
  /// of your request.
  /// <note>
  /// This API action cannot be used to shut down S3 File Gateway or FSx File
  /// Gateway.
  /// </note>
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
    required String gatewayARN,
  }) async {
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
    required String gatewayARN,
  }) async {
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
    required String gatewayARN,
  }) async {
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
    required List<AutomaticTapeCreationRule> automaticTapeCreationRules,
    required String gatewayARN,
  }) async {
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
  /// This operation is supported only for the stored volume, cached volume, and
  /// tape gateway types. To update bandwidth rate limits for S3 file gateways,
  /// use <a>UpdateBandwidthRateLimitSchedule</a>.
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
    required String gatewayARN,
    int? averageDownloadRateLimitInBitsPerSec,
    int? averageUploadRateLimitInBitsPerSec,
  }) async {
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
  /// gateway's bandwidth rate limit schedule. This operation is supported for
  /// volume, tape, and S3 file gateways. S3 file gateways support bandwidth
  /// rate limits for upload only. FSx file gateways do not support bandwidth
  /// rate limits.
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
    required List<BandwidthRateLimitInterval> bandwidthRateLimitIntervals,
    required String gatewayARN,
  }) async {
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
    required String initiatorName,
    required String secretToAuthenticateInitiator,
    required String targetARN,
    String? secretToAuthenticateTarget,
  }) async {
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

  /// Updates a file system association. This operation is only supported in the
  /// FSx File Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemAssociationARN] :
  /// The Amazon Resource Name (ARN) of the file system association that you
  /// want to update.
  ///
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  ///
  /// Parameter [password] :
  /// The password of the user credential.
  ///
  /// Parameter [userName] :
  /// The user name of the user credential that has permission to access the
  /// root share D$ of the Amazon FSx file system. The user account must belong
  /// to the Amazon FSx delegated admin user group.
  Future<UpdateFileSystemAssociationOutput> updateFileSystemAssociation({
    required String fileSystemAssociationARN,
    String? auditDestinationARN,
    CacheAttributes? cacheAttributes,
    String? password,
    String? userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateFileSystemAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemAssociationARN': fileSystemAssociationARN,
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
        if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
        if (password != null) 'Password': password,
        if (userName != null) 'UserName': userName,
      },
    );

    return UpdateFileSystemAssociationOutput.fromJson(jsonResponse.body);
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
  /// Parameter [gatewayCapacity] :
  /// Specifies the size of the gateway's metadata cache.
  ///
  /// Parameter [gatewayTimezone] :
  /// A value that indicates the time zone of the gateway.
  Future<UpdateGatewayInformationOutput> updateGatewayInformation({
    required String gatewayARN,
    String? cloudWatchLogGroupARN,
    GatewayCapacity? gatewayCapacity,
    String? gatewayName,
    String? gatewayTimezone,
  }) async {
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
        if (gatewayCapacity != null)
          'GatewayCapacity': gatewayCapacity.toValue(),
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
    required String gatewayARN,
  }) async {
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
    required String gatewayARN,
    required int hourOfDay,
    required int minuteOfHour,
    int? dayOfMonth,
    int? dayOfWeek,
  }) async {
    _s.validateNumRange(
      'hourOfDay',
      hourOfDay,
      0,
      23,
      isRequired: true,
    );
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
  /// supported in S3 File Gateways.
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
  /// Parameter [auditDestinationARN] :
  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  ///
  /// Parameter [cacheAttributes] :
  /// Specifies refresh cache information for the file share.
  ///
  /// Parameter [clientList] :
  /// The list of clients that are allowed to access the S3 File Gateway. The
  /// list must contain either valid IP addresses or valid CIDR blocks.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// S3 File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the
  /// object uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a S3 File Gateway puts objects into. The default value
  /// is <code>private</code>.
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
    required String fileShareARN,
    String? auditDestinationARN,
    CacheAttributes? cacheAttributes,
    List<String>? clientList,
    String? defaultStorageClass,
    String? fileShareName,
    bool? guessMIMETypeEnabled,
    bool? kMSEncrypted,
    String? kMSKey,
    NFSFileShareDefaults? nFSFileShareDefaults,
    String? notificationPolicy,
    ObjectACL? objectACL,
    bool? readOnly,
    bool? requesterPays,
    String? squash,
  }) async {
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
        if (auditDestinationARN != null)
          'AuditDestinationARN': auditDestinationARN,
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
  /// supported for S3 File Gateways.
  /// <note>
  /// To leave a file share field unchanged, set the corresponding input field
  /// to null.
  /// </note> <important>
  /// File gateways require Security Token Service (Amazon Web Services STS) to
  /// be activated to enable you to create a file share. Make sure that Amazon
  /// Web Services STS is activated in the Amazon Web Services Region you are
  /// creating your file gateway in. If Amazon Web Services STS is not activated
  /// in this Amazon Web Services Region, activate it. For information about how
  /// to activate Amazon Web Services STS, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating Amazon Web Services STS in an Amazon Web Services
  /// Region</a> in the <i>Identity and Access Management User Guide</i>.
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
  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  ///
  /// Parameter [cacheAttributes] :
  /// Specifies refresh cache information for the file share.
  ///
  /// Parameter [caseSensitivity] :
  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case
  /// sensitivity. The default value is <code>ClientSpecified</code>.
  ///
  /// Parameter [defaultStorageClass] :
  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// S3 File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> |
  /// <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> |
  /// <code>S3_ONEZONE_IA</code>
  ///
  /// Parameter [fileShareName] :
  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
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
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
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
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the
  /// object uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  ///
  /// Parameter [objectACL] :
  /// A value that sets the access control list (ACL) permission for objects in
  /// the S3 bucket that a S3 File Gateway puts objects into. The default value
  /// is <code>private</code>.
  ///
  /// Parameter [oplocksEnabled] :
  /// Specifies whether opportunistic locking is enabled for the SMB file share.
  /// <note>
  /// Enabling opportunistic locking on case-sensitive shares is not recommended
  /// for workloads that involve access to files with the same name in different
  /// case.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
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
  /// <i>Storage Gateway User Guide</i>.
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
    required String fileShareARN,
    bool? accessBasedEnumeration,
    List<String>? adminUserList,
    String? auditDestinationARN,
    CacheAttributes? cacheAttributes,
    CaseSensitivity? caseSensitivity,
    String? defaultStorageClass,
    String? fileShareName,
    bool? guessMIMETypeEnabled,
    List<String>? invalidUserList,
    bool? kMSEncrypted,
    String? kMSKey,
    String? notificationPolicy,
    ObjectACL? objectACL,
    bool? oplocksEnabled,
    bool? readOnly,
    bool? requesterPays,
    bool? sMBACLEnabled,
    List<String>? validUserList,
  }) async {
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
        if (oplocksEnabled != null) 'OplocksEnabled': oplocksEnabled,
        if (readOnly != null) 'ReadOnly': readOnly,
        if (requesterPays != null) 'RequesterPays': requesterPays,
        if (sMBACLEnabled != null) 'SMBACLEnabled': sMBACLEnabled,
        if (validUserList != null) 'ValidUserList': validUserList,
      },
    );

    return UpdateSMBFileShareOutput.fromJson(jsonResponse.body);
  }

  /// Controls whether the shares on an S3 File Gateway are visible in a net
  /// view or browse list. The operation is only supported for S3 File Gateways.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSharesVisible] :
  /// The shares on this gateway appear when listing shares.
  Future<UpdateSMBFileShareVisibilityOutput> updateSMBFileShareVisibility({
    required bool fileSharesVisible,
    required String gatewayARN,
  }) async {
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

  /// Updates the list of Active Directory users and groups that have special
  /// permissions for SMB file shares on the gateway.
  ///
  /// May throw [InvalidGatewayRequestException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [sMBLocalGroups] :
  /// A list of Active Directory users and groups that you want to grant special
  /// permissions for SMB file shares on the gateway.
  Future<UpdateSMBLocalGroupsOutput> updateSMBLocalGroups({
    required String gatewayARN,
    required SMBLocalGroups sMBLocalGroups,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StorageGateway_20130630.UpdateSMBLocalGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayARN': gatewayARN,
        'SMBLocalGroups': sMBLocalGroups,
      },
    );

    return UpdateSMBLocalGroupsOutput.fromJson(jsonResponse.body);
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
  /// Supported only in S3 File Gateway.
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
    required String gatewayARN,
    required SMBSecurityStrategy sMBSecurityStrategy,
  }) async {
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
        'SMBSecurityStrategy': sMBSecurityStrategy.toValue(),
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
    required int recurrenceInHours,
    required int startAt,
    required String volumeARN,
    String? description,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'recurrenceInHours',
      recurrenceInHours,
      1,
      24,
      isRequired: true,
    );
    _s.validateNumRange(
      'startAt',
      startAt,
      0,
      23,
      isRequired: true,
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
    required String deviceType,
    required String vTLDeviceARN,
  }) async {
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

/// Storage Gateway returns the Amazon Resource Name (ARN) of the activated
/// gateway. It is a string made of information such as your account, gateway
/// name, and Amazon Web Services Region. This ARN is used to reference the
/// gateway in other API operations as well as resource-based authorization.
/// <note>
/// For gateways activated prior to September 02, 2015, the gateway ARN contains
/// the gateway name rather than the gateway ID. Changing the name of the
/// gateway has no effect on the gateway ARN.
/// </note>
class ActivateGatewayOutput {
  final String? gatewayARN;

  ActivateGatewayOutput({
    this.gatewayARN,
  });

  factory ActivateGatewayOutput.fromJson(Map<String, dynamic> json) {
    return ActivateGatewayOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

enum ActiveDirectoryStatus {
  accessDenied,
  detached,
  joined,
  joining,
  networkError,
  timeout,
  unknownError,
}

extension ActiveDirectoryStatusValueExtension on ActiveDirectoryStatus {
  String toValue() {
    switch (this) {
      case ActiveDirectoryStatus.accessDenied:
        return 'ACCESS_DENIED';
      case ActiveDirectoryStatus.detached:
        return 'DETACHED';
      case ActiveDirectoryStatus.joined:
        return 'JOINED';
      case ActiveDirectoryStatus.joining:
        return 'JOINING';
      case ActiveDirectoryStatus.networkError:
        return 'NETWORK_ERROR';
      case ActiveDirectoryStatus.timeout:
        return 'TIMEOUT';
      case ActiveDirectoryStatus.unknownError:
        return 'UNKNOWN_ERROR';
    }
  }
}

extension ActiveDirectoryStatusFromString on String {
  ActiveDirectoryStatus toActiveDirectoryStatus() {
    switch (this) {
      case 'ACCESS_DENIED':
        return ActiveDirectoryStatus.accessDenied;
      case 'DETACHED':
        return ActiveDirectoryStatus.detached;
      case 'JOINED':
        return ActiveDirectoryStatus.joined;
      case 'JOINING':
        return ActiveDirectoryStatus.joining;
      case 'NETWORK_ERROR':
        return ActiveDirectoryStatus.networkError;
      case 'TIMEOUT':
        return ActiveDirectoryStatus.timeout;
      case 'UNKNOWN_ERROR':
        return ActiveDirectoryStatus.unknownError;
    }
    throw Exception('$this is not known in enum ActiveDirectoryStatus');
  }
}

class AddCacheOutput {
  final String? gatewayARN;

  AddCacheOutput({
    this.gatewayARN,
  });

  factory AddCacheOutput.fromJson(Map<String, dynamic> json) {
    return AddCacheOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// AddTagsToResourceOutput
class AddTagsToResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  final String? resourceARN;

  AddTagsToResourceOutput({
    this.resourceARN,
  });

  factory AddTagsToResourceOutput.fromJson(Map<String, dynamic> json) {
    return AddTagsToResourceOutput(
      resourceARN: json['ResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
  }
}

class AddUploadBufferOutput {
  final String? gatewayARN;

  AddUploadBufferOutput({
    this.gatewayARN,
  });

  factory AddUploadBufferOutput.fromJson(Map<String, dynamic> json) {
    return AddUploadBufferOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway for
/// which working storage was configured.
class AddWorkingStorageOutput {
  final String? gatewayARN;

  AddWorkingStorageOutput({
    this.gatewayARN,
  });

  factory AddWorkingStorageOutput.fromJson(Map<String, dynamic> json) {
    return AddWorkingStorageOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class AssignTapePoolOutput {
  /// The unique Amazon Resource Names (ARN) of the virtual tape that was added to
  /// the tape pool.
  final String? tapeARN;

  AssignTapePoolOutput({
    this.tapeARN,
  });

  factory AssignTapePoolOutput.fromJson(Map<String, dynamic> json) {
    return AssignTapePoolOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

class AssociateFileSystemOutput {
  /// The ARN of the newly created file system association.
  final String? fileSystemAssociationARN;

  AssociateFileSystemOutput({
    this.fileSystemAssociationARN,
  });

  factory AssociateFileSystemOutput.fromJson(Map<String, dynamic> json) {
    return AssociateFileSystemOutput(
      fileSystemAssociationARN: json['FileSystemAssociationARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationARN = this.fileSystemAssociationARN;
    return {
      if (fileSystemAssociationARN != null)
        'FileSystemAssociationARN': fileSystemAssociationARN,
    };
  }
}

/// AttachVolumeOutput
class AttachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name for the initiator that was used to connect to the target.
  final String? targetARN;

  /// The Amazon Resource Name (ARN) of the volume that was attached to the
  /// gateway.
  final String? volumeARN;

  AttachVolumeOutput({
    this.targetARN,
    this.volumeARN,
  });

  factory AttachVolumeOutput.fromJson(Map<String, dynamic> json) {
    return AttachVolumeOutput(
      targetARN: json['TargetARN'] as String?,
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetARN = this.targetARN;
    final volumeARN = this.volumeARN;
    return {
      if (targetARN != null) 'TargetARN': targetARN,
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// Information about the gateway's automatic tape creation policies, including
/// the automatic tape creation rules and the gateway that is using the
/// policies.
class AutomaticTapeCreationPolicyInfo {
  /// An automatic tape creation policy consists of a list of automatic tape
  /// creation rules. This returns the rules that determine when and how to
  /// automatically create new tapes.
  final List<AutomaticTapeCreationRule>? automaticTapeCreationRules;
  final String? gatewayARN;

  AutomaticTapeCreationPolicyInfo({
    this.automaticTapeCreationRules,
    this.gatewayARN,
  });

  factory AutomaticTapeCreationPolicyInfo.fromJson(Map<String, dynamic> json) {
    return AutomaticTapeCreationPolicyInfo(
      automaticTapeCreationRules: (json['AutomaticTapeCreationRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AutomaticTapeCreationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticTapeCreationRules = this.automaticTapeCreationRules;
    final gatewayARN = this.gatewayARN;
    return {
      if (automaticTapeCreationRules != null)
        'AutomaticTapeCreationRules': automaticTapeCreationRules,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// An automatic tape creation policy consists of automatic tape creation rules
/// where each rule defines when and how to create new tapes. For more
/// information about automatic tape creation, see <a
/// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically">Creating
/// Tapes Automatically</a>.
class AutomaticTapeCreationRule {
  /// The minimum number of available virtual tapes that the gateway maintains at
  /// all times. If the number of tapes on the gateway goes below this value, the
  /// gateway creates as many new tapes as are needed to have
  /// <code>MinimumNumTapes</code> on the gateway. For more information about
  /// automatic tape creation, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically">Creating
  /// Tapes Automatically</a>.
  final int minimumNumTapes;

  /// The ID of the pool that you want to add your tape to for archiving. The tape
  /// in this pool is archived in the Amazon S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (S3 Glacier or S3 Glacier
  /// Deep Archive) that corresponds to the pool.
  final String poolId;

  /// A prefix that you append to the barcode of the virtual tape that you are
  /// creating. This prefix makes the barcode unique.
  /// <note>
  /// The prefix must be 1-4 characters in length and must be one of the uppercase
  /// letters from A to Z.
  /// </note>
  final String tapeBarcodePrefix;

  /// The size, in bytes, of the virtual tape capacity.
  final int tapeSizeInBytes;

  /// Set to <code>true</code> to indicate that tapes are to be archived as
  /// write-once-read-many (WORM). Set to <code>false</code> when WORM is not
  /// enabled for tapes.
  final bool? worm;

  AutomaticTapeCreationRule({
    required this.minimumNumTapes,
    required this.poolId,
    required this.tapeBarcodePrefix,
    required this.tapeSizeInBytes,
    this.worm,
  });

  factory AutomaticTapeCreationRule.fromJson(Map<String, dynamic> json) {
    return AutomaticTapeCreationRule(
      minimumNumTapes: json['MinimumNumTapes'] as int,
      poolId: json['PoolId'] as String,
      tapeBarcodePrefix: json['TapeBarcodePrefix'] as String,
      tapeSizeInBytes: json['TapeSizeInBytes'] as int,
      worm: json['Worm'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumNumTapes = this.minimumNumTapes;
    final poolId = this.poolId;
    final tapeBarcodePrefix = this.tapeBarcodePrefix;
    final tapeSizeInBytes = this.tapeSizeInBytes;
    final worm = this.worm;
    return {
      'MinimumNumTapes': minimumNumTapes,
      'PoolId': poolId,
      'TapeBarcodePrefix': tapeBarcodePrefix,
      'TapeSizeInBytes': tapeSizeInBytes,
      if (worm != null) 'Worm': worm,
    };
  }
}

enum AvailabilityMonitorTestStatus {
  complete,
  failed,
  pending,
}

extension AvailabilityMonitorTestStatusValueExtension
    on AvailabilityMonitorTestStatus {
  String toValue() {
    switch (this) {
      case AvailabilityMonitorTestStatus.complete:
        return 'COMPLETE';
      case AvailabilityMonitorTestStatus.failed:
        return 'FAILED';
      case AvailabilityMonitorTestStatus.pending:
        return 'PENDING';
    }
  }
}

extension AvailabilityMonitorTestStatusFromString on String {
  AvailabilityMonitorTestStatus toAvailabilityMonitorTestStatus() {
    switch (this) {
      case 'COMPLETE':
        return AvailabilityMonitorTestStatus.complete;
      case 'FAILED':
        return AvailabilityMonitorTestStatus.failed;
      case 'PENDING':
        return AvailabilityMonitorTestStatus.pending;
    }
    throw Exception('$this is not known in enum AvailabilityMonitorTestStatus');
  }
}

/// Describes a bandwidth rate limit interval for a gateway. A bandwidth rate
/// limit schedule consists of one or more bandwidth rate limit intervals. A
/// bandwidth rate limit interval defines a period of time on one or more days
/// of the week, during which bandwidth rate limits are specified for uploading,
/// downloading, or both.
class BandwidthRateLimitInterval {
  /// The days of the week component of the bandwidth rate limit interval,
  /// represented as ordinal numbers from 0 to 6, where 0 represents Sunday and 6
  /// represents Saturday.
  final List<int> daysOfWeek;

  /// The hour of the day to end the bandwidth rate limit interval.
  final int endHourOfDay;

  /// The minute of the hour to end the bandwidth rate limit interval.
  /// <important>
  /// The bandwidth rate limit interval ends at the end of the minute. To end an
  /// interval at the end of an hour, use the value <code>59</code>.
  /// </important>
  final int endMinuteOfHour;

  /// The hour of the day to start the bandwidth rate limit interval.
  final int startHourOfDay;

  /// The minute of the hour to start the bandwidth rate limit interval. The
  /// interval begins at the start of that minute. To begin an interval exactly at
  /// the start of the hour, use the value <code>0</code>.
  final int startMinuteOfHour;

  /// The average download rate limit component of the bandwidth rate limit
  /// interval, in bits per second. This field does not appear in the response if
  /// the download rate limit is not set.
  final int? averageDownloadRateLimitInBitsPerSec;

  /// The average upload rate limit component of the bandwidth rate limit
  /// interval, in bits per second. This field does not appear in the response if
  /// the upload rate limit is not set.
  /// <note>
  /// For Tape Gateway and Volume Gateway, the minimum value is
  /// <code>51200</code>.
  ///
  /// For S3 File Gateway and FSx File Gateway, the minimum value is
  /// <code>104857600</code>.
  /// </note>
  final int? averageUploadRateLimitInBitsPerSec;

  BandwidthRateLimitInterval({
    required this.daysOfWeek,
    required this.endHourOfDay,
    required this.endMinuteOfHour,
    required this.startHourOfDay,
    required this.startMinuteOfHour,
    this.averageDownloadRateLimitInBitsPerSec,
    this.averageUploadRateLimitInBitsPerSec,
  });

  factory BandwidthRateLimitInterval.fromJson(Map<String, dynamic> json) {
    return BandwidthRateLimitInterval(
      daysOfWeek: (json['DaysOfWeek'] as List)
          .whereNotNull()
          .map((e) => e as int)
          .toList(),
      endHourOfDay: json['EndHourOfDay'] as int,
      endMinuteOfHour: json['EndMinuteOfHour'] as int,
      startHourOfDay: json['StartHourOfDay'] as int,
      startMinuteOfHour: json['StartMinuteOfHour'] as int,
      averageDownloadRateLimitInBitsPerSec:
          json['AverageDownloadRateLimitInBitsPerSec'] as int?,
      averageUploadRateLimitInBitsPerSec:
          json['AverageUploadRateLimitInBitsPerSec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final daysOfWeek = this.daysOfWeek;
    final endHourOfDay = this.endHourOfDay;
    final endMinuteOfHour = this.endMinuteOfHour;
    final startHourOfDay = this.startHourOfDay;
    final startMinuteOfHour = this.startMinuteOfHour;
    final averageDownloadRateLimitInBitsPerSec =
        this.averageDownloadRateLimitInBitsPerSec;
    final averageUploadRateLimitInBitsPerSec =
        this.averageUploadRateLimitInBitsPerSec;
    return {
      'DaysOfWeek': daysOfWeek,
      'EndHourOfDay': endHourOfDay,
      'EndMinuteOfHour': endMinuteOfHour,
      'StartHourOfDay': startHourOfDay,
      'StartMinuteOfHour': startMinuteOfHour,
      if (averageDownloadRateLimitInBitsPerSec != null)
        'AverageDownloadRateLimitInBitsPerSec':
            averageDownloadRateLimitInBitsPerSec,
      if (averageUploadRateLimitInBitsPerSec != null)
        'AverageUploadRateLimitInBitsPerSec':
            averageUploadRateLimitInBitsPerSec,
    };
  }
}

/// The refresh cache information for the file share or FSx file systems.
class CacheAttributes {
  /// Refreshes a file share's cache by using Time To Live (TTL). TTL is the
  /// length of time since the last refresh after which access to the directory
  /// would cause the file gateway to first refresh that directory's contents from
  /// the Amazon S3 bucket or Amazon FSx file system. The TTL duration is in
  /// seconds.
  ///
  /// Valid Values:0, 300 to 2,592,000 seconds (5 minutes to 30 days)
  final int? cacheStaleTimeoutInSeconds;

  CacheAttributes({
    this.cacheStaleTimeoutInSeconds,
  });

  factory CacheAttributes.fromJson(Map<String, dynamic> json) {
    return CacheAttributes(
      cacheStaleTimeoutInSeconds: json['CacheStaleTimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheStaleTimeoutInSeconds = this.cacheStaleTimeoutInSeconds;
    return {
      if (cacheStaleTimeoutInSeconds != null)
        'CacheStaleTimeoutInSeconds': cacheStaleTimeoutInSeconds,
    };
  }
}

/// Describes an iSCSI cached volume.
class CachediSCSIVolume {
  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this timestamp.
  final DateTime? createdDate;
  final String? kMSKey;

  /// If the cached volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g., snap-78e22663. Otherwise, this field is not
  /// included.
  final String? sourceSnapshotId;

  /// The name of the iSCSI target used by an initiator to connect to a volume and
  /// used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  final String? targetName;

  /// The Amazon Resource Name (ARN) of the storage volume.
  final String? volumeARN;

  /// A value that indicates whether a storage volume is attached to or detached
  /// from a gateway. For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving
  /// your volumes to a different gateway</a>.
  final String? volumeAttachmentStatus;

  /// The unique identifier of the volume, e.g., vol-AE4B946D.
  final String? volumeId;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the cached volume is not restoring or
  /// bootstrapping.
  final double? volumeProgress;

  /// The size, in bytes, of the volume capacity.
  final int? volumeSizeInBytes;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String? volumeStatus;

  /// One of the VolumeType enumeration values that describes the type of the
  /// volume.
  final String? volumeType;

  /// The size of the data stored on the volume in bytes. This value is calculated
  /// based on the number of blocks that are touched, instead of the actual amount
  /// of data written. This value can be useful for sequential write patterns but
  /// less accurate for random write patterns. <code>VolumeUsedInBytes</code> is
  /// different from the compressed size of the volume, which is the value that is
  /// used to calculate your bill.
  /// <note>
  /// This value is not available for volumes created prior to May 13, 2015, until
  /// you store data on the volume.
  ///
  /// If you use a delete tool that overwrites the data on your volume with random
  /// data, your usage will not be reduced. This is because the random data is not
  /// compressible. If you want to reduce the amount of billed storage on your
  /// volume, we recommend overwriting your files with zeros to compress the data
  /// to a negligible amount of actual storage.
  /// </note>
  final int? volumeUsedInBytes;

  /// An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI
  /// attributes for one stored volume.
  final VolumeiSCSIAttributes? volumeiSCSIAttributes;

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

  factory CachediSCSIVolume.fromJson(Map<String, dynamic> json) {
    return CachediSCSIVolume(
      createdDate: timeStampFromJson(json['CreatedDate']),
      kMSKey: json['KMSKey'] as String?,
      sourceSnapshotId: json['SourceSnapshotId'] as String?,
      targetName: json['TargetName'] as String?,
      volumeARN: json['VolumeARN'] as String?,
      volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String?,
      volumeId: json['VolumeId'] as String?,
      volumeProgress: json['VolumeProgress'] as double?,
      volumeSizeInBytes: json['VolumeSizeInBytes'] as int?,
      volumeStatus: json['VolumeStatus'] as String?,
      volumeType: json['VolumeType'] as String?,
      volumeUsedInBytes: json['VolumeUsedInBytes'] as int?,
      volumeiSCSIAttributes: json['VolumeiSCSIAttributes'] != null
          ? VolumeiSCSIAttributes.fromJson(
              json['VolumeiSCSIAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final kMSKey = this.kMSKey;
    final sourceSnapshotId = this.sourceSnapshotId;
    final targetName = this.targetName;
    final volumeARN = this.volumeARN;
    final volumeAttachmentStatus = this.volumeAttachmentStatus;
    final volumeId = this.volumeId;
    final volumeProgress = this.volumeProgress;
    final volumeSizeInBytes = this.volumeSizeInBytes;
    final volumeStatus = this.volumeStatus;
    final volumeType = this.volumeType;
    final volumeUsedInBytes = this.volumeUsedInBytes;
    final volumeiSCSIAttributes = this.volumeiSCSIAttributes;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (sourceSnapshotId != null) 'SourceSnapshotId': sourceSnapshotId,
      if (targetName != null) 'TargetName': targetName,
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeAttachmentStatus != null)
        'VolumeAttachmentStatus': volumeAttachmentStatus,
      if (volumeId != null) 'VolumeId': volumeId,
      if (volumeProgress != null) 'VolumeProgress': volumeProgress,
      if (volumeSizeInBytes != null) 'VolumeSizeInBytes': volumeSizeInBytes,
      if (volumeStatus != null) 'VolumeStatus': volumeStatus,
      if (volumeType != null) 'VolumeType': volumeType,
      if (volumeUsedInBytes != null) 'VolumeUsedInBytes': volumeUsedInBytes,
      if (volumeiSCSIAttributes != null)
        'VolumeiSCSIAttributes': volumeiSCSIAttributes,
    };
  }
}

/// CancelArchivalOutput
class CancelArchivalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which archiving was
  /// canceled.
  final String? tapeARN;

  CancelArchivalOutput({
    this.tapeARN,
  });

  factory CancelArchivalOutput.fromJson(Map<String, dynamic> json) {
    return CancelArchivalOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

/// CancelRetrievalOutput
class CancelRetrievalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which retrieval was
  /// canceled.
  final String? tapeARN;

  CancelRetrievalOutput({
    this.tapeARN,
  });

  factory CancelRetrievalOutput.fromJson(Map<String, dynamic> json) {
    return CancelRetrievalOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

enum CaseSensitivity {
  clientSpecified,
  caseSensitive,
}

extension CaseSensitivityValueExtension on CaseSensitivity {
  String toValue() {
    switch (this) {
      case CaseSensitivity.clientSpecified:
        return 'ClientSpecified';
      case CaseSensitivity.caseSensitive:
        return 'CaseSensitive';
    }
  }
}

extension CaseSensitivityFromString on String {
  CaseSensitivity toCaseSensitivity() {
    switch (this) {
      case 'ClientSpecified':
        return CaseSensitivity.clientSpecified;
      case 'CaseSensitive':
        return CaseSensitivity.caseSensitive;
    }
    throw Exception('$this is not known in enum CaseSensitivity');
  }
}

/// Describes Challenge-Handshake Authentication Protocol (CHAP) information
/// that supports authentication between your gateway and iSCSI initiators.
class ChapInfo {
  /// The iSCSI initiator that connects to the target.
  final String? initiatorName;

  /// The secret key that the initiator (for example, the Windows client) must
  /// provide to participate in mutual CHAP with the target.
  final String? secretToAuthenticateInitiator;

  /// The secret key that the target must provide to participate in mutual CHAP
  /// with the initiator (e.g., Windows client).
  final String? secretToAuthenticateTarget;

  /// The Amazon Resource Name (ARN) of the volume.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  final String? targetARN;

  ChapInfo({
    this.initiatorName,
    this.secretToAuthenticateInitiator,
    this.secretToAuthenticateTarget,
    this.targetARN,
  });

  factory ChapInfo.fromJson(Map<String, dynamic> json) {
    return ChapInfo(
      initiatorName: json['InitiatorName'] as String?,
      secretToAuthenticateInitiator:
          json['SecretToAuthenticateInitiator'] as String?,
      secretToAuthenticateTarget: json['SecretToAuthenticateTarget'] as String?,
      targetARN: json['TargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatorName = this.initiatorName;
    final secretToAuthenticateInitiator = this.secretToAuthenticateInitiator;
    final secretToAuthenticateTarget = this.secretToAuthenticateTarget;
    final targetARN = this.targetARN;
    return {
      if (initiatorName != null) 'InitiatorName': initiatorName,
      if (secretToAuthenticateInitiator != null)
        'SecretToAuthenticateInitiator': secretToAuthenticateInitiator,
      if (secretToAuthenticateTarget != null)
        'SecretToAuthenticateTarget': secretToAuthenticateTarget,
      if (targetARN != null) 'TargetARN': targetARN,
    };
  }
}

class CreateCachediSCSIVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  final String? targetARN;

  /// The Amazon Resource Name (ARN) of the configured volume.
  final String? volumeARN;

  CreateCachediSCSIVolumeOutput({
    this.targetARN,
    this.volumeARN,
  });

  factory CreateCachediSCSIVolumeOutput.fromJson(Map<String, dynamic> json) {
    return CreateCachediSCSIVolumeOutput(
      targetARN: json['TargetARN'] as String?,
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetARN = this.targetARN;
    final volumeARN = this.volumeARN;
    return {
      if (targetARN != null) 'TargetARN': targetARN,
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// CreateNFSFileShareOutput
class CreateNFSFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  final String? fileShareARN;

  CreateNFSFileShareOutput({
    this.fileShareARN,
  });

  factory CreateNFSFileShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateNFSFileShareOutput(
      fileShareARN: json['FileShareARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
    };
  }
}

/// CreateSMBFileShareOutput
class CreateSMBFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  final String? fileShareARN;

  CreateSMBFileShareOutput({
    this.fileShareARN,
  });

  factory CreateSMBFileShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateSMBFileShareOutput(
      fileShareARN: json['FileShareARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
    };
  }
}

class CreateSnapshotFromVolumeRecoveryPointOutput {
  /// The ID of the snapshot.
  final String? snapshotId;

  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  final String? volumeARN;

  /// The time the volume was created from the recovery point.
  final String? volumeRecoveryPointTime;

  CreateSnapshotFromVolumeRecoveryPointOutput({
    this.snapshotId,
    this.volumeARN,
    this.volumeRecoveryPointTime,
  });

  factory CreateSnapshotFromVolumeRecoveryPointOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateSnapshotFromVolumeRecoveryPointOutput(
      snapshotId: json['SnapshotId'] as String?,
      volumeARN: json['VolumeARN'] as String?,
      volumeRecoveryPointTime: json['VolumeRecoveryPointTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    final volumeARN = this.volumeARN;
    final volumeRecoveryPointTime = this.volumeRecoveryPointTime;
    return {
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeRecoveryPointTime != null)
        'VolumeRecoveryPointTime': volumeRecoveryPointTime,
    };
  }
}

/// A JSON object containing the following fields:
class CreateSnapshotOutput {
  /// The snapshot ID that is used to refer to the snapshot in future operations
  /// such as describing snapshots (Amazon Elastic Compute Cloud API
  /// <code>DescribeSnapshots</code>) or creating a volume from a snapshot
  /// (<a>CreateStorediSCSIVolume</a>).
  final String? snapshotId;

  /// The Amazon Resource Name (ARN) of the volume of which the snapshot was
  /// taken.
  final String? volumeARN;

  CreateSnapshotOutput({
    this.snapshotId,
    this.volumeARN,
  });

  factory CreateSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotOutput(
      snapshotId: json['SnapshotId'] as String?,
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    final volumeARN = this.volumeARN;
    return {
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// A JSON object containing the following fields:
class CreateStorediSCSIVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  final String? targetARN;

  /// The Amazon Resource Name (ARN) of the configured volume.
  final String? volumeARN;

  /// The size of the volume in bytes.
  final int? volumeSizeInBytes;

  CreateStorediSCSIVolumeOutput({
    this.targetARN,
    this.volumeARN,
    this.volumeSizeInBytes,
  });

  factory CreateStorediSCSIVolumeOutput.fromJson(Map<String, dynamic> json) {
    return CreateStorediSCSIVolumeOutput(
      targetARN: json['TargetARN'] as String?,
      volumeARN: json['VolumeARN'] as String?,
      volumeSizeInBytes: json['VolumeSizeInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetARN = this.targetARN;
    final volumeARN = this.volumeARN;
    final volumeSizeInBytes = this.volumeSizeInBytes;
    return {
      if (targetARN != null) 'TargetARN': targetARN,
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeSizeInBytes != null) 'VolumeSizeInBytes': volumeSizeInBytes,
    };
  }
}

class CreateTapePoolOutput {
  /// The unique Amazon Resource Name (ARN) that represents the custom tape pool.
  /// Use the <a>ListTapePools</a> operation to return a list of tape pools for
  /// your account and Amazon Web Services Region.
  final String? poolARN;

  CreateTapePoolOutput({
    this.poolARN,
  });

  factory CreateTapePoolOutput.fromJson(Map<String, dynamic> json) {
    return CreateTapePoolOutput(
      poolARN: json['PoolARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final poolARN = this.poolARN;
    return {
      if (poolARN != null) 'PoolARN': poolARN,
    };
  }
}

/// CreateTapeOutput
class CreateTapeWithBarcodeOutput {
  /// A unique Amazon Resource Name (ARN) that represents the virtual tape that
  /// was created.
  final String? tapeARN;

  CreateTapeWithBarcodeOutput({
    this.tapeARN,
  });

  factory CreateTapeWithBarcodeOutput.fromJson(Map<String, dynamic> json) {
    return CreateTapeWithBarcodeOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

/// CreateTapeOutput
class CreateTapesOutput {
  /// A list of unique Amazon Resource Names (ARNs) that represents the virtual
  /// tapes that were created.
  final List<String>? tapeARNs;

  CreateTapesOutput({
    this.tapeARNs,
  });

  factory CreateTapesOutput.fromJson(Map<String, dynamic> json) {
    return CreateTapesOutput(
      tapeARNs: (json['TapeARNs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARNs = this.tapeARNs;
    return {
      if (tapeARNs != null) 'TapeARNs': tapeARNs,
    };
  }
}

class DeleteAutomaticTapeCreationPolicyOutput {
  final String? gatewayARN;

  DeleteAutomaticTapeCreationPolicyOutput({
    this.gatewayARN,
  });

  factory DeleteAutomaticTapeCreationPolicyOutput.fromJson(
      Map<String, dynamic> json) {
    return DeleteAutomaticTapeCreationPolicyOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// bandwidth rate information was deleted.
class DeleteBandwidthRateLimitOutput {
  final String? gatewayARN;

  DeleteBandwidthRateLimitOutput({
    this.gatewayARN,
  });

  factory DeleteBandwidthRateLimitOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBandwidthRateLimitOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the following fields:
class DeleteChapCredentialsOutput {
  /// The iSCSI initiator that connects to the target.
  final String? initiatorName;

  /// The Amazon Resource Name (ARN) of the target.
  final String? targetARN;

  DeleteChapCredentialsOutput({
    this.initiatorName,
    this.targetARN,
  });

  factory DeleteChapCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return DeleteChapCredentialsOutput(
      initiatorName: json['InitiatorName'] as String?,
      targetARN: json['TargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatorName = this.initiatorName;
    final targetARN = this.targetARN;
    return {
      if (initiatorName != null) 'InitiatorName': initiatorName,
      if (targetARN != null) 'TargetARN': targetARN,
    };
  }
}

/// DeleteFileShareOutput
class DeleteFileShareOutput {
  /// The Amazon Resource Name (ARN) of the deleted file share.
  final String? fileShareARN;

  DeleteFileShareOutput({
    this.fileShareARN,
  });

  factory DeleteFileShareOutput.fromJson(Map<String, dynamic> json) {
    return DeleteFileShareOutput(
      fileShareARN: json['FileShareARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
    };
  }
}

/// A JSON object containing the ID of the deleted gateway.
class DeleteGatewayOutput {
  final String? gatewayARN;

  DeleteGatewayOutput({
    this.gatewayARN,
  });

  factory DeleteGatewayOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGatewayOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class DeleteSnapshotScheduleOutput {
  /// The volume which snapshot schedule was deleted.
  final String? volumeARN;

  DeleteSnapshotScheduleOutput({
    this.volumeARN,
  });

  factory DeleteSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSnapshotScheduleOutput(
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeARN = this.volumeARN;
    return {
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// DeleteTapeArchiveOutput
class DeleteTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape that was deleted from the
  /// virtual tape shelf (VTS).
  final String? tapeARN;

  DeleteTapeArchiveOutput({
    this.tapeARN,
  });

  factory DeleteTapeArchiveOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTapeArchiveOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

/// DeleteTapeOutput
class DeleteTapeOutput {
  /// The Amazon Resource Name (ARN) of the deleted virtual tape.
  final String? tapeARN;

  DeleteTapeOutput({
    this.tapeARN,
  });

  factory DeleteTapeOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTapeOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

class DeleteTapePoolOutput {
  /// The Amazon Resource Name (ARN) of the custom tape pool being deleted.
  final String? poolARN;

  DeleteTapePoolOutput({
    this.poolARN,
  });

  factory DeleteTapePoolOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTapePoolOutput(
      poolARN: json['PoolARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final poolARN = this.poolARN;
    return {
      if (poolARN != null) 'PoolARN': poolARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the storage
/// volume that was deleted.
class DeleteVolumeOutput {
  /// The Amazon Resource Name (ARN) of the storage volume that was deleted. It is
  /// the same ARN you provided in the request.
  final String? volumeARN;

  DeleteVolumeOutput({
    this.volumeARN,
  });

  factory DeleteVolumeOutput.fromJson(Map<String, dynamic> json) {
    return DeleteVolumeOutput(
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeARN = this.volumeARN;
    return {
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

class DescribeAvailabilityMonitorTestOutput {
  final String? gatewayARN;

  /// The time the high availability monitoring test was started. If a test hasn't
  /// been performed, the value of this field is null.
  final DateTime? startTime;

  /// The status of the high availability monitoring test. If a test hasn't been
  /// performed, the value of this field is null.
  final AvailabilityMonitorTestStatus? status;

  DescribeAvailabilityMonitorTestOutput({
    this.gatewayARN,
    this.startTime,
    this.status,
  });

  factory DescribeAvailabilityMonitorTestOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeAvailabilityMonitorTestOutput(
      gatewayARN: json['GatewayARN'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toAvailabilityMonitorTestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A JSON object containing the following fields:
class DescribeBandwidthRateLimitOutput {
  /// The average download bandwidth rate limit in bits per second. This field
  /// does not appear in the response if the download rate limit is not set.
  final int? averageDownloadRateLimitInBitsPerSec;

  /// The average upload bandwidth rate limit in bits per second. This field does
  /// not appear in the response if the upload rate limit is not set.
  final int? averageUploadRateLimitInBitsPerSec;
  final String? gatewayARN;

  DescribeBandwidthRateLimitOutput({
    this.averageDownloadRateLimitInBitsPerSec,
    this.averageUploadRateLimitInBitsPerSec,
    this.gatewayARN,
  });

  factory DescribeBandwidthRateLimitOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBandwidthRateLimitOutput(
      averageDownloadRateLimitInBitsPerSec:
          json['AverageDownloadRateLimitInBitsPerSec'] as int?,
      averageUploadRateLimitInBitsPerSec:
          json['AverageUploadRateLimitInBitsPerSec'] as int?,
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final averageDownloadRateLimitInBitsPerSec =
        this.averageDownloadRateLimitInBitsPerSec;
    final averageUploadRateLimitInBitsPerSec =
        this.averageUploadRateLimitInBitsPerSec;
    final gatewayARN = this.gatewayARN;
    return {
      if (averageDownloadRateLimitInBitsPerSec != null)
        'AverageDownloadRateLimitInBitsPerSec':
            averageDownloadRateLimitInBitsPerSec,
      if (averageUploadRateLimitInBitsPerSec != null)
        'AverageUploadRateLimitInBitsPerSec':
            averageUploadRateLimitInBitsPerSec,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class DescribeBandwidthRateLimitScheduleOutput {
  /// An array that contains the bandwidth rate limit intervals for a tape or
  /// volume gateway.
  final List<BandwidthRateLimitInterval>? bandwidthRateLimitIntervals;
  final String? gatewayARN;

  DescribeBandwidthRateLimitScheduleOutput({
    this.bandwidthRateLimitIntervals,
    this.gatewayARN,
  });

  factory DescribeBandwidthRateLimitScheduleOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeBandwidthRateLimitScheduleOutput(
      bandwidthRateLimitIntervals: (json['BandwidthRateLimitIntervals']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              BandwidthRateLimitInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthRateLimitIntervals = this.bandwidthRateLimitIntervals;
    final gatewayARN = this.gatewayARN;
    return {
      if (bandwidthRateLimitIntervals != null)
        'BandwidthRateLimitIntervals': bandwidthRateLimitIntervals,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class DescribeCacheOutput {
  /// The amount of cache in bytes allocated to a gateway.
  final int? cacheAllocatedInBytes;

  /// The file share's contribution to the overall percentage of the gateway's
  /// cache that has not been persisted to Amazon Web Services. The sample is
  /// taken at the end of the reporting period.
  final double? cacheDirtyPercentage;

  /// Percent of application read operations from the file shares that are served
  /// from cache. The sample is taken at the end of the reporting period.
  final double? cacheHitPercentage;

  /// Percent of application read operations from the file shares that are not
  /// served from cache. The sample is taken at the end of the reporting period.
  final double? cacheMissPercentage;

  /// Percent use of the gateway's cache storage. This metric applies only to the
  /// gateway-cached volume setup. The sample is taken at the end of the reporting
  /// period.
  final double? cacheUsedPercentage;

  /// An array of strings that identify disks that are to be configured as working
  /// storage. Each string has a minimum length of 1 and maximum length of 300.
  /// You can get the disk IDs from the <a>ListLocalDisks</a> API.
  final List<String>? diskIds;
  final String? gatewayARN;

  DescribeCacheOutput({
    this.cacheAllocatedInBytes,
    this.cacheDirtyPercentage,
    this.cacheHitPercentage,
    this.cacheMissPercentage,
    this.cacheUsedPercentage,
    this.diskIds,
    this.gatewayARN,
  });

  factory DescribeCacheOutput.fromJson(Map<String, dynamic> json) {
    return DescribeCacheOutput(
      cacheAllocatedInBytes: json['CacheAllocatedInBytes'] as int?,
      cacheDirtyPercentage: json['CacheDirtyPercentage'] as double?,
      cacheHitPercentage: json['CacheHitPercentage'] as double?,
      cacheMissPercentage: json['CacheMissPercentage'] as double?,
      cacheUsedPercentage: json['CacheUsedPercentage'] as double?,
      diskIds: (json['DiskIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheAllocatedInBytes = this.cacheAllocatedInBytes;
    final cacheDirtyPercentage = this.cacheDirtyPercentage;
    final cacheHitPercentage = this.cacheHitPercentage;
    final cacheMissPercentage = this.cacheMissPercentage;
    final cacheUsedPercentage = this.cacheUsedPercentage;
    final diskIds = this.diskIds;
    final gatewayARN = this.gatewayARN;
    return {
      if (cacheAllocatedInBytes != null)
        'CacheAllocatedInBytes': cacheAllocatedInBytes,
      if (cacheDirtyPercentage != null)
        'CacheDirtyPercentage': cacheDirtyPercentage,
      if (cacheHitPercentage != null) 'CacheHitPercentage': cacheHitPercentage,
      if (cacheMissPercentage != null)
        'CacheMissPercentage': cacheMissPercentage,
      if (cacheUsedPercentage != null)
        'CacheUsedPercentage': cacheUsedPercentage,
      if (diskIds != null) 'DiskIds': diskIds,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the following fields:
class DescribeCachediSCSIVolumesOutput {
  /// An array of objects where each object contains metadata about one cached
  /// volume.
  final List<CachediSCSIVolume>? cachediSCSIVolumes;

  DescribeCachediSCSIVolumesOutput({
    this.cachediSCSIVolumes,
  });

  factory DescribeCachediSCSIVolumesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeCachediSCSIVolumesOutput(
      cachediSCSIVolumes: (json['CachediSCSIVolumes'] as List?)
          ?.whereNotNull()
          .map((e) => CachediSCSIVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cachediSCSIVolumes = this.cachediSCSIVolumes;
    return {
      if (cachediSCSIVolumes != null) 'CachediSCSIVolumes': cachediSCSIVolumes,
    };
  }
}

/// A JSON object containing the following fields:
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
  final List<ChapInfo>? chapCredentials;

  DescribeChapCredentialsOutput({
    this.chapCredentials,
  });

  factory DescribeChapCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeChapCredentialsOutput(
      chapCredentials: (json['ChapCredentials'] as List?)
          ?.whereNotNull()
          .map((e) => ChapInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final chapCredentials = this.chapCredentials;
    return {
      if (chapCredentials != null) 'ChapCredentials': chapCredentials,
    };
  }
}

class DescribeFileSystemAssociationsOutput {
  /// An array containing the <code>FileSystemAssociationInfo</code> data type of
  /// each file system association to be described.
  final List<FileSystemAssociationInfo>? fileSystemAssociationInfoList;

  DescribeFileSystemAssociationsOutput({
    this.fileSystemAssociationInfoList,
  });

  factory DescribeFileSystemAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeFileSystemAssociationsOutput(
      fileSystemAssociationInfoList:
          (json['FileSystemAssociationInfoList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FileSystemAssociationInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationInfoList = this.fileSystemAssociationInfoList;
    return {
      if (fileSystemAssociationInfoList != null)
        'FileSystemAssociationInfoList': fileSystemAssociationInfoList,
    };
  }
}

/// A JSON object containing the following fields:
class DescribeGatewayInformationOutput {
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is
  /// used to monitor events in the gateway. This field only only exist and
  /// returns once it have been chosen and set by the SGW service, based on the OS
  /// version of the gateway VM
  final String? cloudWatchLogGroupARN;

  /// Date after which this gateway will not receive software updates for new
  /// features and bug fixes.
  final String? deprecationDate;

  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  final String? ec2InstanceId;

  /// The Amazon Web Services Region where the Amazon EC2 instance is located.
  final String? ec2InstanceRegion;

  /// The type of endpoint for your gateway.
  ///
  /// Valid Values: <code>STANDARD</code> | <code>FIPS</code>
  final String? endpointType;
  final String? gatewayARN;

  /// Specifies the size of the gateway's metadata cache.
  final GatewayCapacity? gatewayCapacity;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  final String? gatewayId;

  /// The name you configured for your gateway.
  final String? gatewayName;

  /// A <a>NetworkInterface</a> array that contains descriptions of the gateway
  /// network interfaces.
  final List<NetworkInterface>? gatewayNetworkInterfaces;

  /// A value that indicates the operating state of the gateway.
  final String? gatewayState;

  /// A value that indicates the time zone configured for the gateway.
  final String? gatewayTimezone;

  /// The type of the gateway.
  final String? gatewayType;

  /// The type of hardware or software platform on which the gateway is running.
  /// <note>
  /// Tape Gateway is no longer available on Snow Family devices.
  /// </note>
  final HostEnvironment? hostEnvironment;

  /// A unique identifier for the specific instance of the host platform running
  /// the gateway. This value is only available for certain host environments, and
  /// its format depends on the host environment type.
  final String? hostEnvironmentId;

  /// The date on which the last software update was applied to the gateway. If
  /// the gateway has never been updated, this field does not return a value in
  /// the response. This only only exist and returns once it have been chosen and
  /// set by the SGW service, based on the OS version of the gateway VM
  final String? lastSoftwareUpdate;

  /// The date on which an update to the gateway is available. This date is in the
  /// time zone of the gateway. If the gateway is not available for an update this
  /// field is not returned in the response.
  final String? nextUpdateAvailabilityDate;

  /// Date after which this gateway will not receive software updates for new
  /// features.
  final String? softwareUpdatesEndDate;

  /// The version number of the software running on the gateway appliance.
  final String? softwareVersion;

  /// A list of the metadata cache sizes that the gateway can support based on its
  /// current hardware specifications.
  final List<GatewayCapacity>? supportedGatewayCapacities;

  /// A list of up to 50 tags assigned to the gateway, sorted alphabetically by
  /// key name. Each tag is a key-value pair. For a gateway with more than 10 tags
  /// assigned, you can view all tags using the <code>ListTagsForResource</code>
  /// API operation.
  final List<Tag>? tags;

  /// The configuration settings for the virtual private cloud (VPC) endpoint for
  /// your gateway.
  final String? vPCEndpoint;

  DescribeGatewayInformationOutput({
    this.cloudWatchLogGroupARN,
    this.deprecationDate,
    this.ec2InstanceId,
    this.ec2InstanceRegion,
    this.endpointType,
    this.gatewayARN,
    this.gatewayCapacity,
    this.gatewayId,
    this.gatewayName,
    this.gatewayNetworkInterfaces,
    this.gatewayState,
    this.gatewayTimezone,
    this.gatewayType,
    this.hostEnvironment,
    this.hostEnvironmentId,
    this.lastSoftwareUpdate,
    this.nextUpdateAvailabilityDate,
    this.softwareUpdatesEndDate,
    this.softwareVersion,
    this.supportedGatewayCapacities,
    this.tags,
    this.vPCEndpoint,
  });

  factory DescribeGatewayInformationOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGatewayInformationOutput(
      cloudWatchLogGroupARN: json['CloudWatchLogGroupARN'] as String?,
      deprecationDate: json['DeprecationDate'] as String?,
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      ec2InstanceRegion: json['Ec2InstanceRegion'] as String?,
      endpointType: json['EndpointType'] as String?,
      gatewayARN: json['GatewayARN'] as String?,
      gatewayCapacity:
          (json['GatewayCapacity'] as String?)?.toGatewayCapacity(),
      gatewayId: json['GatewayId'] as String?,
      gatewayName: json['GatewayName'] as String?,
      gatewayNetworkInterfaces: (json['GatewayNetworkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayState: json['GatewayState'] as String?,
      gatewayTimezone: json['GatewayTimezone'] as String?,
      gatewayType: json['GatewayType'] as String?,
      hostEnvironment:
          (json['HostEnvironment'] as String?)?.toHostEnvironment(),
      hostEnvironmentId: json['HostEnvironmentId'] as String?,
      lastSoftwareUpdate: json['LastSoftwareUpdate'] as String?,
      nextUpdateAvailabilityDate: json['NextUpdateAvailabilityDate'] as String?,
      softwareUpdatesEndDate: json['SoftwareUpdatesEndDate'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
      supportedGatewayCapacities: (json['SupportedGatewayCapacities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toGatewayCapacity())
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vPCEndpoint: json['VPCEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupARN = this.cloudWatchLogGroupARN;
    final deprecationDate = this.deprecationDate;
    final ec2InstanceId = this.ec2InstanceId;
    final ec2InstanceRegion = this.ec2InstanceRegion;
    final endpointType = this.endpointType;
    final gatewayARN = this.gatewayARN;
    final gatewayCapacity = this.gatewayCapacity;
    final gatewayId = this.gatewayId;
    final gatewayName = this.gatewayName;
    final gatewayNetworkInterfaces = this.gatewayNetworkInterfaces;
    final gatewayState = this.gatewayState;
    final gatewayTimezone = this.gatewayTimezone;
    final gatewayType = this.gatewayType;
    final hostEnvironment = this.hostEnvironment;
    final hostEnvironmentId = this.hostEnvironmentId;
    final lastSoftwareUpdate = this.lastSoftwareUpdate;
    final nextUpdateAvailabilityDate = this.nextUpdateAvailabilityDate;
    final softwareUpdatesEndDate = this.softwareUpdatesEndDate;
    final softwareVersion = this.softwareVersion;
    final supportedGatewayCapacities = this.supportedGatewayCapacities;
    final tags = this.tags;
    final vPCEndpoint = this.vPCEndpoint;
    return {
      if (cloudWatchLogGroupARN != null)
        'CloudWatchLogGroupARN': cloudWatchLogGroupARN,
      if (deprecationDate != null) 'DeprecationDate': deprecationDate,
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (ec2InstanceRegion != null) 'Ec2InstanceRegion': ec2InstanceRegion,
      if (endpointType != null) 'EndpointType': endpointType,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (gatewayCapacity != null) 'GatewayCapacity': gatewayCapacity.toValue(),
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (gatewayName != null) 'GatewayName': gatewayName,
      if (gatewayNetworkInterfaces != null)
        'GatewayNetworkInterfaces': gatewayNetworkInterfaces,
      if (gatewayState != null) 'GatewayState': gatewayState,
      if (gatewayTimezone != null) 'GatewayTimezone': gatewayTimezone,
      if (gatewayType != null) 'GatewayType': gatewayType,
      if (hostEnvironment != null) 'HostEnvironment': hostEnvironment.toValue(),
      if (hostEnvironmentId != null) 'HostEnvironmentId': hostEnvironmentId,
      if (lastSoftwareUpdate != null) 'LastSoftwareUpdate': lastSoftwareUpdate,
      if (nextUpdateAvailabilityDate != null)
        'NextUpdateAvailabilityDate': nextUpdateAvailabilityDate,
      if (softwareUpdatesEndDate != null)
        'SoftwareUpdatesEndDate': softwareUpdatesEndDate,
      if (softwareVersion != null) 'SoftwareVersion': softwareVersion,
      if (supportedGatewayCapacities != null)
        'SupportedGatewayCapacities':
            supportedGatewayCapacities.map((e) => e.toValue()).toList(),
      if (tags != null) 'Tags': tags,
      if (vPCEndpoint != null) 'VPCEndpoint': vPCEndpoint,
    };
  }
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
class DescribeMaintenanceStartTimeOutput {
  /// The day of the month component of the maintenance start time represented as
  /// an ordinal number from 1 to 28, where 1 represents the first day of the
  /// month and 28 represents the last day of the month.
  final int? dayOfMonth;

  /// An ordinal number between 0 and 6 that represents the day of the week, where
  /// 0 represents Sunday and 6 represents Saturday. The day of week is in the
  /// time zone of the gateway.
  final int? dayOfWeek;
  final String? gatewayARN;

  /// The hour component of the maintenance start time represented as <i>hh</i>,
  /// where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time
  /// zone of the gateway.
  final int? hourOfDay;

  /// The minute component of the maintenance start time represented as <i>mm</i>,
  /// where <i>mm</i> is the minute (0 to 59). The minute of the hour is in the
  /// time zone of the gateway.
  final int? minuteOfHour;

  /// A value that indicates the time zone that is set for the gateway. The start
  /// time and day of week specified should be in the time zone of the gateway.
  final String? timezone;

  DescribeMaintenanceStartTimeOutput({
    this.dayOfMonth,
    this.dayOfWeek,
    this.gatewayARN,
    this.hourOfDay,
    this.minuteOfHour,
    this.timezone,
  });

  factory DescribeMaintenanceStartTimeOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeMaintenanceStartTimeOutput(
      dayOfMonth: json['DayOfMonth'] as int?,
      dayOfWeek: json['DayOfWeek'] as int?,
      gatewayARN: json['GatewayARN'] as String?,
      hourOfDay: json['HourOfDay'] as int?,
      minuteOfHour: json['MinuteOfHour'] as int?,
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfMonth = this.dayOfMonth;
    final dayOfWeek = this.dayOfWeek;
    final gatewayARN = this.gatewayARN;
    final hourOfDay = this.hourOfDay;
    final minuteOfHour = this.minuteOfHour;
    final timezone = this.timezone;
    return {
      if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'DayOfWeek': dayOfWeek,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (hourOfDay != null) 'HourOfDay': hourOfDay,
      if (minuteOfHour != null) 'MinuteOfHour': minuteOfHour,
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

/// DescribeNFSFileSharesOutput
class DescribeNFSFileSharesOutput {
  /// An array containing a description for each requested file share.
  final List<NFSFileShareInfo>? nFSFileShareInfoList;

  DescribeNFSFileSharesOutput({
    this.nFSFileShareInfoList,
  });

  factory DescribeNFSFileSharesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeNFSFileSharesOutput(
      nFSFileShareInfoList: (json['NFSFileShareInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => NFSFileShareInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nFSFileShareInfoList = this.nFSFileShareInfoList;
    return {
      if (nFSFileShareInfoList != null)
        'NFSFileShareInfoList': nFSFileShareInfoList,
    };
  }
}

/// DescribeSMBFileSharesOutput
class DescribeSMBFileSharesOutput {
  /// An array containing a description for each requested file share.
  final List<SMBFileShareInfo>? sMBFileShareInfoList;

  DescribeSMBFileSharesOutput({
    this.sMBFileShareInfoList,
  });

  factory DescribeSMBFileSharesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeSMBFileSharesOutput(
      sMBFileShareInfoList: (json['SMBFileShareInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => SMBFileShareInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sMBFileShareInfoList = this.sMBFileShareInfoList;
    return {
      if (sMBFileShareInfoList != null)
        'SMBFileShareInfoList': sMBFileShareInfoList,
    };
  }
}

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
  final ActiveDirectoryStatus? activeDirectoryStatus;

  /// The name of the domain that the gateway is joined to.
  final String? domainName;

  /// The shares on this gateway appear when listing shares. Only supported for S3
  /// File Gateways.
  final bool? fileSharesVisible;
  final String? gatewayARN;

  /// This value is <code>true</code> if a password for the guest user
  /// <code>smbguest</code> is set, otherwise <code>false</code>. Only supported
  /// for S3 File Gateways.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? sMBGuestPasswordSet;

  /// A list of Active Directory users and groups that have special permissions
  /// for SMB file shares on the gateway.
  final SMBLocalGroups? sMBLocalGroups;

  /// The type of security strategy that was specified for file gateway.
  ///
  /// <ul>
  /// <li>
  /// <code>ClientSpecified</code>: If you choose this option, requests are
  /// established based on what is negotiated by the client. This option is
  /// recommended when you want to maximize compatibility across different clients
  /// in your environment. Supported only for S3 File Gateway.
  /// </li>
  /// <li>
  /// <code>MandatorySigning</code>: If you use this option, File Gateway only
  /// allows connections from SMBv2 or SMBv3 clients that have signing turned on.
  /// This option works with SMB clients on Microsoft Windows Vista, Windows
  /// Server 2008, or later.
  /// </li>
  /// <li>
  /// <code>MandatoryEncryption</code>: If you use this option, File Gateway only
  /// allows connections from SMBv3 clients that have encryption turned on. Both
  /// 256-bit and 128-bit algorithms are allowed. This option is recommended for
  /// environments that handle sensitive data. It works with SMB clients on
  /// Microsoft Windows 8, Windows Server 2012, or later.
  /// </li>
  /// <li>
  /// <code>EnforceEncryption</code>: If you use this option, File Gateway only
  /// allows connections from SMBv3 clients that use 256-bit AES encryption
  /// algorithms. 128-bit algorithms are not allowed. This option is recommended
  /// for environments that handle sensitive data. It works with SMB clients on
  /// Microsoft Windows 8, Windows Server 2012, or later.
  /// </li>
  /// </ul>
  final SMBSecurityStrategy? sMBSecurityStrategy;

  DescribeSMBSettingsOutput({
    this.activeDirectoryStatus,
    this.domainName,
    this.fileSharesVisible,
    this.gatewayARN,
    this.sMBGuestPasswordSet,
    this.sMBLocalGroups,
    this.sMBSecurityStrategy,
  });

  factory DescribeSMBSettingsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeSMBSettingsOutput(
      activeDirectoryStatus:
          (json['ActiveDirectoryStatus'] as String?)?.toActiveDirectoryStatus(),
      domainName: json['DomainName'] as String?,
      fileSharesVisible: json['FileSharesVisible'] as bool?,
      gatewayARN: json['GatewayARN'] as String?,
      sMBGuestPasswordSet: json['SMBGuestPasswordSet'] as bool?,
      sMBLocalGroups: json['SMBLocalGroups'] != null
          ? SMBLocalGroups.fromJson(
              json['SMBLocalGroups'] as Map<String, dynamic>)
          : null,
      sMBSecurityStrategy:
          (json['SMBSecurityStrategy'] as String?)?.toSMBSecurityStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryStatus = this.activeDirectoryStatus;
    final domainName = this.domainName;
    final fileSharesVisible = this.fileSharesVisible;
    final gatewayARN = this.gatewayARN;
    final sMBGuestPasswordSet = this.sMBGuestPasswordSet;
    final sMBLocalGroups = this.sMBLocalGroups;
    final sMBSecurityStrategy = this.sMBSecurityStrategy;
    return {
      if (activeDirectoryStatus != null)
        'ActiveDirectoryStatus': activeDirectoryStatus.toValue(),
      if (domainName != null) 'DomainName': domainName,
      if (fileSharesVisible != null) 'FileSharesVisible': fileSharesVisible,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (sMBGuestPasswordSet != null)
        'SMBGuestPasswordSet': sMBGuestPasswordSet,
      if (sMBLocalGroups != null) 'SMBLocalGroups': sMBLocalGroups,
      if (sMBSecurityStrategy != null)
        'SMBSecurityStrategy': sMBSecurityStrategy.toValue(),
    };
  }
}

class DescribeSnapshotScheduleOutput {
  /// The snapshot description.
  final String? description;

  /// The number of hours between snapshots.
  final int? recurrenceInHours;

  /// The hour of the day at which the snapshot schedule begins represented as
  /// <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is in
  /// the time zone of the gateway.
  final int? startAt;

  /// A list of up to 50 tags assigned to the snapshot schedule, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  final List<Tag>? tags;

  /// A value that indicates the time zone of the gateway.
  final String? timezone;

  /// The Amazon Resource Name (ARN) of the volume that was specified in the
  /// request.
  final String? volumeARN;

  DescribeSnapshotScheduleOutput({
    this.description,
    this.recurrenceInHours,
    this.startAt,
    this.tags,
    this.timezone,
    this.volumeARN,
  });

  factory DescribeSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) {
    return DescribeSnapshotScheduleOutput(
      description: json['Description'] as String?,
      recurrenceInHours: json['RecurrenceInHours'] as int?,
      startAt: json['StartAt'] as int?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      timezone: json['Timezone'] as String?,
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final recurrenceInHours = this.recurrenceInHours;
    final startAt = this.startAt;
    final tags = this.tags;
    final timezone = this.timezone;
    final volumeARN = this.volumeARN;
    return {
      if (description != null) 'Description': description,
      if (recurrenceInHours != null) 'RecurrenceInHours': recurrenceInHours,
      if (startAt != null) 'StartAt': startAt,
      if (tags != null) 'Tags': tags,
      if (timezone != null) 'Timezone': timezone,
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

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
  final List<StorediSCSIVolume>? storediSCSIVolumes;

  DescribeStorediSCSIVolumesOutput({
    this.storediSCSIVolumes,
  });

  factory DescribeStorediSCSIVolumesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStorediSCSIVolumesOutput(
      storediSCSIVolumes: (json['StorediSCSIVolumes'] as List?)
          ?.whereNotNull()
          .map((e) => StorediSCSIVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final storediSCSIVolumes = this.storediSCSIVolumes;
    return {
      if (storediSCSIVolumes != null) 'StorediSCSIVolumes': storediSCSIVolumes,
    };
  }
}

/// DescribeTapeArchivesOutput
class DescribeTapeArchivesOutput {
  /// An opaque string that indicates the position at which the virtual tapes that
  /// were fetched for description ended. Use this marker in your next request to
  /// fetch the next set of virtual tapes in the virtual tape shelf (VTS). If
  /// there are no more virtual tapes to describe, this field does not appear in
  /// the response.
  final String? marker;

  /// An array of virtual tape objects in the virtual tape shelf (VTS). The
  /// description includes of the Amazon Resource Name (ARN) of the virtual tapes.
  /// The information returned includes the Amazon Resource Names (ARNs) of the
  /// tapes, size of the tapes, status of the tapes, progress of the description,
  /// and tape barcode.
  final List<TapeArchive>? tapeArchives;

  DescribeTapeArchivesOutput({
    this.marker,
    this.tapeArchives,
  });

  factory DescribeTapeArchivesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTapeArchivesOutput(
      marker: json['Marker'] as String?,
      tapeArchives: (json['TapeArchives'] as List?)
          ?.whereNotNull()
          .map((e) => TapeArchive.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final tapeArchives = this.tapeArchives;
    return {
      if (marker != null) 'Marker': marker,
      if (tapeArchives != null) 'TapeArchives': tapeArchives,
    };
  }
}

/// DescribeTapeRecoveryPointsOutput
class DescribeTapeRecoveryPointsOutput {
  final String? gatewayARN;

  /// An opaque string that indicates the position at which the virtual tape
  /// recovery points that were listed for description ended.
  ///
  /// Use this marker in your next request to list the next set of virtual tape
  /// recovery points in the list. If there are no more recovery points to
  /// describe, this field does not appear in the response.
  final String? marker;

  /// An array of TapeRecoveryPointInfos that are available for the specified
  /// gateway.
  final List<TapeRecoveryPointInfo>? tapeRecoveryPointInfos;

  DescribeTapeRecoveryPointsOutput({
    this.gatewayARN,
    this.marker,
    this.tapeRecoveryPointInfos,
  });

  factory DescribeTapeRecoveryPointsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTapeRecoveryPointsOutput(
      gatewayARN: json['GatewayARN'] as String?,
      marker: json['Marker'] as String?,
      tapeRecoveryPointInfos: (json['TapeRecoveryPointInfos'] as List?)
          ?.whereNotNull()
          .map((e) => TapeRecoveryPointInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final marker = this.marker;
    final tapeRecoveryPointInfos = this.tapeRecoveryPointInfos;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (marker != null) 'Marker': marker,
      if (tapeRecoveryPointInfos != null)
        'TapeRecoveryPointInfos': tapeRecoveryPointInfos,
    };
  }
}

/// DescribeTapesOutput
class DescribeTapesOutput {
  /// An opaque string that can be used as part of a subsequent
  /// <code>DescribeTapes</code> call to retrieve the next page of results.
  ///
  /// If a response does not contain a marker, then there are no more results to
  /// be retrieved.
  final String? marker;

  /// An array of virtual tape descriptions.
  final List<Tape>? tapes;

  DescribeTapesOutput({
    this.marker,
    this.tapes,
  });

  factory DescribeTapesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTapesOutput(
      marker: json['Marker'] as String?,
      tapes: (json['Tapes'] as List?)
          ?.whereNotNull()
          .map((e) => Tape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final tapes = this.tapes;
    return {
      if (marker != null) 'Marker': marker,
      if (tapes != null) 'Tapes': tapes,
    };
  }
}

class DescribeUploadBufferOutput {
  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  final List<String>? diskIds;
  final String? gatewayARN;

  /// The total number of bytes allocated in the gateway's as upload buffer.
  final int? uploadBufferAllocatedInBytes;

  /// The total number of bytes being used in the gateway's upload buffer.
  final int? uploadBufferUsedInBytes;

  DescribeUploadBufferOutput({
    this.diskIds,
    this.gatewayARN,
    this.uploadBufferAllocatedInBytes,
    this.uploadBufferUsedInBytes,
  });

  factory DescribeUploadBufferOutput.fromJson(Map<String, dynamic> json) {
    return DescribeUploadBufferOutput(
      diskIds: (json['DiskIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
      uploadBufferAllocatedInBytes:
          json['UploadBufferAllocatedInBytes'] as int?,
      uploadBufferUsedInBytes: json['UploadBufferUsedInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskIds = this.diskIds;
    final gatewayARN = this.gatewayARN;
    final uploadBufferAllocatedInBytes = this.uploadBufferAllocatedInBytes;
    final uploadBufferUsedInBytes = this.uploadBufferUsedInBytes;
    return {
      if (diskIds != null) 'DiskIds': diskIds,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (uploadBufferAllocatedInBytes != null)
        'UploadBufferAllocatedInBytes': uploadBufferAllocatedInBytes,
      if (uploadBufferUsedInBytes != null)
        'UploadBufferUsedInBytes': uploadBufferUsedInBytes,
    };
  }
}

/// DescribeVTLDevicesOutput
class DescribeVTLDevicesOutput {
  final String? gatewayARN;

  /// An opaque string that indicates the position at which the VTL devices that
  /// were fetched for description ended. Use the marker in your next request to
  /// fetch the next set of VTL devices in the list. If there are no more VTL
  /// devices to describe, this field does not appear in the response.
  final String? marker;

  /// An array of VTL device objects composed of the Amazon Resource Name (ARN) of
  /// the VTL devices.
  final List<VTLDevice>? vTLDevices;

  DescribeVTLDevicesOutput({
    this.gatewayARN,
    this.marker,
    this.vTLDevices,
  });

  factory DescribeVTLDevicesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeVTLDevicesOutput(
      gatewayARN: json['GatewayARN'] as String?,
      marker: json['Marker'] as String?,
      vTLDevices: (json['VTLDevices'] as List?)
          ?.whereNotNull()
          .map((e) => VTLDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final marker = this.marker;
    final vTLDevices = this.vTLDevices;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (marker != null) 'Marker': marker,
      if (vTLDevices != null) 'VTLDevices': vTLDevices,
    };
  }
}

/// A JSON object containing the following fields:
class DescribeWorkingStorageOutput {
  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  final List<String>? diskIds;
  final String? gatewayARN;

  /// The total working storage in bytes allocated for the gateway. If no working
  /// storage is configured for the gateway, this field returns 0.
  final int? workingStorageAllocatedInBytes;

  /// The total working storage in bytes in use by the gateway. If no working
  /// storage is configured for the gateway, this field returns 0.
  final int? workingStorageUsedInBytes;

  DescribeWorkingStorageOutput({
    this.diskIds,
    this.gatewayARN,
    this.workingStorageAllocatedInBytes,
    this.workingStorageUsedInBytes,
  });

  factory DescribeWorkingStorageOutput.fromJson(Map<String, dynamic> json) {
    return DescribeWorkingStorageOutput(
      diskIds: (json['DiskIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
      workingStorageAllocatedInBytes:
          json['WorkingStorageAllocatedInBytes'] as int?,
      workingStorageUsedInBytes: json['WorkingStorageUsedInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskIds = this.diskIds;
    final gatewayARN = this.gatewayARN;
    final workingStorageAllocatedInBytes = this.workingStorageAllocatedInBytes;
    final workingStorageUsedInBytes = this.workingStorageUsedInBytes;
    return {
      if (diskIds != null) 'DiskIds': diskIds,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (workingStorageAllocatedInBytes != null)
        'WorkingStorageAllocatedInBytes': workingStorageAllocatedInBytes,
      if (workingStorageUsedInBytes != null)
        'WorkingStorageUsedInBytes': workingStorageUsedInBytes,
    };
  }
}

/// AttachVolumeOutput
class DetachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume that was detached.
  final String? volumeARN;

  DetachVolumeOutput({
    this.volumeARN,
  });

  factory DetachVolumeOutput.fromJson(Map<String, dynamic> json) {
    return DetachVolumeOutput(
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeARN = this.volumeARN;
    return {
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// Lists iSCSI information about a VTL device.
class DeviceiSCSIAttributes {
  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  final bool? chapEnabled;

  /// The network interface identifier of the VTL device.
  final String? networkInterfaceId;

  /// The port used to communicate with iSCSI VTL device targets.
  final int? networkInterfacePort;

  /// Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI
  /// qualified name(iqn) of a tape drive or media changer target.
  final String? targetARN;

  DeviceiSCSIAttributes({
    this.chapEnabled,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.targetARN,
  });

  factory DeviceiSCSIAttributes.fromJson(Map<String, dynamic> json) {
    return DeviceiSCSIAttributes(
      chapEnabled: json['ChapEnabled'] as bool?,
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
      networkInterfacePort: json['NetworkInterfacePort'] as int?,
      targetARN: json['TargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chapEnabled = this.chapEnabled;
    final networkInterfaceId = this.networkInterfaceId;
    final networkInterfacePort = this.networkInterfacePort;
    final targetARN = this.targetARN;
    return {
      if (chapEnabled != null) 'ChapEnabled': chapEnabled,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (networkInterfacePort != null)
        'NetworkInterfacePort': networkInterfacePort,
      if (targetARN != null) 'TargetARN': targetARN,
    };
  }
}

/// DisableGatewayOutput
class DisableGatewayOutput {
  /// The unique Amazon Resource Name (ARN) of the disabled gateway.
  final String? gatewayARN;

  DisableGatewayOutput({
    this.gatewayARN,
  });

  factory DisableGatewayOutput.fromJson(Map<String, dynamic> json) {
    return DisableGatewayOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class DisassociateFileSystemOutput {
  /// The Amazon Resource Name (ARN) of the deleted file system association.
  final String? fileSystemAssociationARN;

  DisassociateFileSystemOutput({
    this.fileSystemAssociationARN,
  });

  factory DisassociateFileSystemOutput.fromJson(Map<String, dynamic> json) {
    return DisassociateFileSystemOutput(
      fileSystemAssociationARN: json['FileSystemAssociationARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationARN = this.fileSystemAssociationARN;
    return {
      if (fileSystemAssociationARN != null)
        'FileSystemAssociationARN': fileSystemAssociationARN,
    };
  }
}

/// Represents a gateway's local disk.
class Disk {
  /// The iSCSI qualified name (IQN) that is defined for a disk. This field is not
  /// included in the response if the local disk is not defined as an iSCSI
  /// target. The format of this field is
  /// <i>targetIqn::LUNNumber::region-volumeId</i>.
  final String? diskAllocationResource;
  final String? diskAllocationType;
  final List<String>? diskAttributeList;

  /// The unique device ID or other distinguishing data that identifies a local
  /// disk.
  final String? diskId;

  /// The device node of a local disk as assigned by the virtualization
  /// environment.
  final String? diskNode;

  /// The path of a local disk in the gateway virtual machine (VM).
  final String? diskPath;

  /// The local disk size in bytes.
  final int? diskSizeInBytes;

  /// A value that represents the status of a local disk.
  final String? diskStatus;

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

  factory Disk.fromJson(Map<String, dynamic> json) {
    return Disk(
      diskAllocationResource: json['DiskAllocationResource'] as String?,
      diskAllocationType: json['DiskAllocationType'] as String?,
      diskAttributeList: (json['DiskAttributeList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      diskId: json['DiskId'] as String?,
      diskNode: json['DiskNode'] as String?,
      diskPath: json['DiskPath'] as String?,
      diskSizeInBytes: json['DiskSizeInBytes'] as int?,
      diskStatus: json['DiskStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskAllocationResource = this.diskAllocationResource;
    final diskAllocationType = this.diskAllocationType;
    final diskAttributeList = this.diskAttributeList;
    final diskId = this.diskId;
    final diskNode = this.diskNode;
    final diskPath = this.diskPath;
    final diskSizeInBytes = this.diskSizeInBytes;
    final diskStatus = this.diskStatus;
    return {
      if (diskAllocationResource != null)
        'DiskAllocationResource': diskAllocationResource,
      if (diskAllocationType != null) 'DiskAllocationType': diskAllocationType,
      if (diskAttributeList != null) 'DiskAttributeList': diskAttributeList,
      if (diskId != null) 'DiskId': diskId,
      if (diskNode != null) 'DiskNode': diskNode,
      if (diskPath != null) 'DiskPath': diskPath,
      if (diskSizeInBytes != null) 'DiskSizeInBytes': diskSizeInBytes,
      if (diskStatus != null) 'DiskStatus': diskStatus,
    };
  }
}

/// Specifies network configuration information for the gateway associated with
/// the Amazon FSx file system.
class EndpointNetworkConfiguration {
  /// A list of gateway IP addresses on which the associated Amazon FSx file
  /// system is available.
  /// <note>
  /// If multiple file systems are associated with this gateway, this field is
  /// required.
  /// </note>
  final List<String>? ipAddresses;

  EndpointNetworkConfiguration({
    this.ipAddresses,
  });

  factory EndpointNetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return EndpointNetworkConfiguration(
      ipAddresses: (json['IpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddresses = this.ipAddresses;
    return {
      if (ipAddresses != null) 'IpAddresses': ipAddresses,
    };
  }
}

/// Describes a file share. Only supported S3 File Gateway.
class FileShareInfo {
  final String? fileShareARN;
  final String? fileShareId;
  final String? fileShareStatus;
  final FileShareType? fileShareType;
  final String? gatewayARN;

  FileShareInfo({
    this.fileShareARN,
    this.fileShareId,
    this.fileShareStatus,
    this.fileShareType,
    this.gatewayARN,
  });

  factory FileShareInfo.fromJson(Map<String, dynamic> json) {
    return FileShareInfo(
      fileShareARN: json['FileShareARN'] as String?,
      fileShareId: json['FileShareId'] as String?,
      fileShareStatus: json['FileShareStatus'] as String?,
      fileShareType: (json['FileShareType'] as String?)?.toFileShareType(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    final fileShareId = this.fileShareId;
    final fileShareStatus = this.fileShareStatus;
    final fileShareType = this.fileShareType;
    final gatewayARN = this.gatewayARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
      if (fileShareId != null) 'FileShareId': fileShareId,
      if (fileShareStatus != null) 'FileShareStatus': fileShareStatus,
      if (fileShareType != null) 'FileShareType': fileShareType.toValue(),
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// The type of the file share.
enum FileShareType {
  nfs,
  smb,
}

extension FileShareTypeValueExtension on FileShareType {
  String toValue() {
    switch (this) {
      case FileShareType.nfs:
        return 'NFS';
      case FileShareType.smb:
        return 'SMB';
    }
  }
}

extension FileShareTypeFromString on String {
  FileShareType toFileShareType() {
    switch (this) {
      case 'NFS':
        return FileShareType.nfs;
      case 'SMB':
        return FileShareType.smb;
    }
    throw Exception('$this is not known in enum FileShareType');
  }
}

/// Describes the object returned by <code>DescribeFileSystemAssociations</code>
/// that describes a created file system association.
class FileSystemAssociationInfo {
  /// The Amazon Resource Name (ARN) of the storage used for the audit logs.
  final String? auditDestinationARN;
  final CacheAttributes? cacheAttributes;

  /// Specifies network configuration information for the gateway associated with
  /// the Amazon FSx file system.
  /// <note>
  /// If multiple file systems are associated with this gateway, this parameter's
  /// <code>IpAddresses</code> field is required.
  /// </note>
  final EndpointNetworkConfiguration? endpointNetworkConfiguration;

  /// The Amazon Resource Name (ARN) of the file system association.
  final String? fileSystemAssociationARN;

  /// The status of the file system association. Valid Values:
  /// <code>AVAILABLE</code> | <code>CREATING</code> | <code>DELETING</code> |
  /// <code>FORCE_DELETING</code> | <code>UPDATING</code> | <code>ERROR</code>
  final String? fileSystemAssociationStatus;

  /// An array containing the FileSystemAssociationStatusDetail data type, which
  /// provides detailed information on file system association status.
  final List<FileSystemAssociationStatusDetail>?
      fileSystemAssociationStatusDetails;
  final String? gatewayARN;

  /// The ARN of the backend Amazon FSx file system used for storing file data.
  /// For information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_FileSystem.html">FileSystem</a>
  /// in the <i>Amazon FSx API Reference</i>.
  final String? locationARN;

  /// A list of up to 50 tags assigned to the SMB file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair.
  final List<Tag>? tags;

  FileSystemAssociationInfo({
    this.auditDestinationARN,
    this.cacheAttributes,
    this.endpointNetworkConfiguration,
    this.fileSystemAssociationARN,
    this.fileSystemAssociationStatus,
    this.fileSystemAssociationStatusDetails,
    this.gatewayARN,
    this.locationARN,
    this.tags,
  });

  factory FileSystemAssociationInfo.fromJson(Map<String, dynamic> json) {
    return FileSystemAssociationInfo(
      auditDestinationARN: json['AuditDestinationARN'] as String?,
      cacheAttributes: json['CacheAttributes'] != null
          ? CacheAttributes.fromJson(
              json['CacheAttributes'] as Map<String, dynamic>)
          : null,
      endpointNetworkConfiguration: json['EndpointNetworkConfiguration'] != null
          ? EndpointNetworkConfiguration.fromJson(
              json['EndpointNetworkConfiguration'] as Map<String, dynamic>)
          : null,
      fileSystemAssociationARN: json['FileSystemAssociationARN'] as String?,
      fileSystemAssociationStatus:
          json['FileSystemAssociationStatus'] as String?,
      fileSystemAssociationStatusDetails:
          (json['FileSystemAssociationStatusDetails'] as List?)
              ?.whereNotNull()
              .map((e) => FileSystemAssociationStatusDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gatewayARN: json['GatewayARN'] as String?,
      locationARN: json['LocationARN'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final auditDestinationARN = this.auditDestinationARN;
    final cacheAttributes = this.cacheAttributes;
    final endpointNetworkConfiguration = this.endpointNetworkConfiguration;
    final fileSystemAssociationARN = this.fileSystemAssociationARN;
    final fileSystemAssociationStatus = this.fileSystemAssociationStatus;
    final fileSystemAssociationStatusDetails =
        this.fileSystemAssociationStatusDetails;
    final gatewayARN = this.gatewayARN;
    final locationARN = this.locationARN;
    final tags = this.tags;
    return {
      if (auditDestinationARN != null)
        'AuditDestinationARN': auditDestinationARN,
      if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
      if (endpointNetworkConfiguration != null)
        'EndpointNetworkConfiguration': endpointNetworkConfiguration,
      if (fileSystemAssociationARN != null)
        'FileSystemAssociationARN': fileSystemAssociationARN,
      if (fileSystemAssociationStatus != null)
        'FileSystemAssociationStatus': fileSystemAssociationStatus,
      if (fileSystemAssociationStatusDetails != null)
        'FileSystemAssociationStatusDetails':
            fileSystemAssociationStatusDetails,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (locationARN != null) 'LocationARN': locationARN,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Detailed information on file system association status.
class FileSystemAssociationStatusDetail {
  /// The error code for a given file system association status.
  final String? errorCode;

  FileSystemAssociationStatusDetail({
    this.errorCode,
  });

  factory FileSystemAssociationStatusDetail.fromJson(
      Map<String, dynamic> json) {
    return FileSystemAssociationStatusDetail(
      errorCode: json['ErrorCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
    };
  }
}

/// Gets the summary returned by <code>ListFileSystemAssociation</code>, which
/// is a summary of a created file system association.
class FileSystemAssociationSummary {
  /// The Amazon Resource Name (ARN) of the file system association.
  final String? fileSystemAssociationARN;

  /// The ID of the file system association.
  final String? fileSystemAssociationId;

  /// The status of the file share. Valid Values: <code>AVAILABLE</code> |
  /// <code>CREATING</code> | <code>DELETING</code> | <code>FORCE_DELETING</code>
  /// | <code>UPDATING</code> | <code>ERROR</code>
  final String? fileSystemAssociationStatus;
  final String? gatewayARN;

  FileSystemAssociationSummary({
    this.fileSystemAssociationARN,
    this.fileSystemAssociationId,
    this.fileSystemAssociationStatus,
    this.gatewayARN,
  });

  factory FileSystemAssociationSummary.fromJson(Map<String, dynamic> json) {
    return FileSystemAssociationSummary(
      fileSystemAssociationARN: json['FileSystemAssociationARN'] as String?,
      fileSystemAssociationId: json['FileSystemAssociationId'] as String?,
      fileSystemAssociationStatus:
          json['FileSystemAssociationStatus'] as String?,
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationARN = this.fileSystemAssociationARN;
    final fileSystemAssociationId = this.fileSystemAssociationId;
    final fileSystemAssociationStatus = this.fileSystemAssociationStatus;
    final gatewayARN = this.gatewayARN;
    return {
      if (fileSystemAssociationARN != null)
        'FileSystemAssociationARN': fileSystemAssociationARN,
      if (fileSystemAssociationId != null)
        'FileSystemAssociationId': fileSystemAssociationId,
      if (fileSystemAssociationStatus != null)
        'FileSystemAssociationStatus': fileSystemAssociationStatus,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

enum GatewayCapacity {
  small,
  medium,
  large,
}

extension GatewayCapacityValueExtension on GatewayCapacity {
  String toValue() {
    switch (this) {
      case GatewayCapacity.small:
        return 'Small';
      case GatewayCapacity.medium:
        return 'Medium';
      case GatewayCapacity.large:
        return 'Large';
    }
  }
}

extension GatewayCapacityFromString on String {
  GatewayCapacity toGatewayCapacity() {
    switch (this) {
      case 'Small':
        return GatewayCapacity.small;
      case 'Medium':
        return GatewayCapacity.medium;
      case 'Large':
        return GatewayCapacity.large;
    }
    throw Exception('$this is not known in enum GatewayCapacity');
  }
}

/// Describes a gateway object.
class GatewayInfo {
  /// Date after which this gateway will not receive software updates for new
  /// features and bug fixes.
  final String? deprecationDate;

  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  final String? ec2InstanceId;

  /// The Amazon Web Services Region where the Amazon EC2 instance is located.
  final String? ec2InstanceRegion;

  /// The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a>
  /// operation to return a list of gateways for your account and Amazon Web
  /// Services Region.
  final String? gatewayARN;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  final String? gatewayId;

  /// The name of the gateway.
  final String? gatewayName;

  /// The state of the gateway.
  ///
  /// Valid Values: <code>DISABLED</code> | <code>ACTIVE</code>
  final String? gatewayOperationalState;

  /// The type of the gateway.
  final String? gatewayType;

  /// The type of hardware or software platform on which the gateway is running.
  /// <note>
  /// Tape Gateway is no longer available on Snow Family devices.
  /// </note>
  final HostEnvironment? hostEnvironment;

  /// A unique identifier for the specific instance of the host platform running
  /// the gateway. This value is only available for certain host environments, and
  /// its format depends on the host environment type.
  final String? hostEnvironmentId;

  /// The version number of the software running on the gateway appliance.
  final String? softwareVersion;

  GatewayInfo({
    this.deprecationDate,
    this.ec2InstanceId,
    this.ec2InstanceRegion,
    this.gatewayARN,
    this.gatewayId,
    this.gatewayName,
    this.gatewayOperationalState,
    this.gatewayType,
    this.hostEnvironment,
    this.hostEnvironmentId,
    this.softwareVersion,
  });

  factory GatewayInfo.fromJson(Map<String, dynamic> json) {
    return GatewayInfo(
      deprecationDate: json['DeprecationDate'] as String?,
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      ec2InstanceRegion: json['Ec2InstanceRegion'] as String?,
      gatewayARN: json['GatewayARN'] as String?,
      gatewayId: json['GatewayId'] as String?,
      gatewayName: json['GatewayName'] as String?,
      gatewayOperationalState: json['GatewayOperationalState'] as String?,
      gatewayType: json['GatewayType'] as String?,
      hostEnvironment:
          (json['HostEnvironment'] as String?)?.toHostEnvironment(),
      hostEnvironmentId: json['HostEnvironmentId'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deprecationDate = this.deprecationDate;
    final ec2InstanceId = this.ec2InstanceId;
    final ec2InstanceRegion = this.ec2InstanceRegion;
    final gatewayARN = this.gatewayARN;
    final gatewayId = this.gatewayId;
    final gatewayName = this.gatewayName;
    final gatewayOperationalState = this.gatewayOperationalState;
    final gatewayType = this.gatewayType;
    final hostEnvironment = this.hostEnvironment;
    final hostEnvironmentId = this.hostEnvironmentId;
    final softwareVersion = this.softwareVersion;
    return {
      if (deprecationDate != null) 'DeprecationDate': deprecationDate,
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (ec2InstanceRegion != null) 'Ec2InstanceRegion': ec2InstanceRegion,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (gatewayName != null) 'GatewayName': gatewayName,
      if (gatewayOperationalState != null)
        'GatewayOperationalState': gatewayOperationalState,
      if (gatewayType != null) 'GatewayType': gatewayType,
      if (hostEnvironment != null) 'HostEnvironment': hostEnvironment.toValue(),
      if (hostEnvironmentId != null) 'HostEnvironmentId': hostEnvironmentId,
      if (softwareVersion != null) 'SoftwareVersion': softwareVersion,
    };
  }
}

enum HostEnvironment {
  vmware,
  hyperV,
  ec2,
  kvm,
  other,
  snowball,
}

extension HostEnvironmentValueExtension on HostEnvironment {
  String toValue() {
    switch (this) {
      case HostEnvironment.vmware:
        return 'VMWARE';
      case HostEnvironment.hyperV:
        return 'HYPER-V';
      case HostEnvironment.ec2:
        return 'EC2';
      case HostEnvironment.kvm:
        return 'KVM';
      case HostEnvironment.other:
        return 'OTHER';
      case HostEnvironment.snowball:
        return 'SNOWBALL';
    }
  }
}

extension HostEnvironmentFromString on String {
  HostEnvironment toHostEnvironment() {
    switch (this) {
      case 'VMWARE':
        return HostEnvironment.vmware;
      case 'HYPER-V':
        return HostEnvironment.hyperV;
      case 'EC2':
        return HostEnvironment.ec2;
      case 'KVM':
        return HostEnvironment.kvm;
      case 'OTHER':
        return HostEnvironment.other;
      case 'SNOWBALL':
        return HostEnvironment.snowball;
    }
    throw Exception('$this is not known in enum HostEnvironment');
  }
}

/// JoinDomainOutput
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
  final ActiveDirectoryStatus? activeDirectoryStatus;

  /// The unique Amazon Resource Name (ARN) of the gateway that joined the domain.
  final String? gatewayARN;

  JoinDomainOutput({
    this.activeDirectoryStatus,
    this.gatewayARN,
  });

  factory JoinDomainOutput.fromJson(Map<String, dynamic> json) {
    return JoinDomainOutput(
      activeDirectoryStatus:
          (json['ActiveDirectoryStatus'] as String?)?.toActiveDirectoryStatus(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryStatus = this.activeDirectoryStatus;
    final gatewayARN = this.gatewayARN;
    return {
      if (activeDirectoryStatus != null)
        'ActiveDirectoryStatus': activeDirectoryStatus.toValue(),
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class ListAutomaticTapeCreationPoliciesOutput {
  /// Gets a listing of information about the gateway's automatic tape creation
  /// policies, including the automatic tape creation rules and the gateway that
  /// is using the policies.
  final List<AutomaticTapeCreationPolicyInfo>? automaticTapeCreationPolicyInfos;

  ListAutomaticTapeCreationPoliciesOutput({
    this.automaticTapeCreationPolicyInfos,
  });

  factory ListAutomaticTapeCreationPoliciesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAutomaticTapeCreationPoliciesOutput(
      automaticTapeCreationPolicyInfos:
          (json['AutomaticTapeCreationPolicyInfos'] as List?)
              ?.whereNotNull()
              .map((e) => AutomaticTapeCreationPolicyInfo.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final automaticTapeCreationPolicyInfos =
        this.automaticTapeCreationPolicyInfos;
    return {
      if (automaticTapeCreationPolicyInfos != null)
        'AutomaticTapeCreationPolicyInfos': automaticTapeCreationPolicyInfos,
    };
  }
}

/// ListFileShareOutput
class ListFileSharesOutput {
  /// An array of information about the S3 File Gateway's file shares.
  final List<FileShareInfo>? fileShareInfoList;

  /// If the request includes <code>Marker</code>, the response returns that value
  /// in this field.
  final String? marker;

  /// If a value is present, there are more file shares to return. In a subsequent
  /// request, use <code>NextMarker</code> as the value for <code>Marker</code> to
  /// retrieve the next set of file shares.
  final String? nextMarker;

  ListFileSharesOutput({
    this.fileShareInfoList,
    this.marker,
    this.nextMarker,
  });

  factory ListFileSharesOutput.fromJson(Map<String, dynamic> json) {
    return ListFileSharesOutput(
      fileShareInfoList: (json['FileShareInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => FileShareInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareInfoList = this.fileShareInfoList;
    final marker = this.marker;
    final nextMarker = this.nextMarker;
    return {
      if (fileShareInfoList != null) 'FileShareInfoList': fileShareInfoList,
      if (marker != null) 'Marker': marker,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListFileSystemAssociationsOutput {
  /// An array of information about the Amazon FSx gateway's file system
  /// associations.
  final List<FileSystemAssociationSummary>? fileSystemAssociationSummaryList;

  /// If the request includes <code>Marker</code>, the response returns that value
  /// in this field.
  final String? marker;

  /// If a value is present, there are more file system associations to return. In
  /// a subsequent request, use <code>NextMarker</code> as the value for
  /// <code>Marker</code> to retrieve the next set of file system associations.
  final String? nextMarker;

  ListFileSystemAssociationsOutput({
    this.fileSystemAssociationSummaryList,
    this.marker,
    this.nextMarker,
  });

  factory ListFileSystemAssociationsOutput.fromJson(Map<String, dynamic> json) {
    return ListFileSystemAssociationsOutput(
      fileSystemAssociationSummaryList:
          (json['FileSystemAssociationSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) => FileSystemAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      marker: json['Marker'] as String?,
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationSummaryList =
        this.fileSystemAssociationSummaryList;
    final marker = this.marker;
    final nextMarker = this.nextMarker;
    return {
      if (fileSystemAssociationSummaryList != null)
        'FileSystemAssociationSummaryList': fileSystemAssociationSummaryList,
      if (marker != null) 'Marker': marker,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListGatewaysOutput {
  /// An array of <a>GatewayInfo</a> objects.
  final List<GatewayInfo>? gateways;

  /// Use the marker in your next request to fetch the next set of gateways in the
  /// list. If there are no more gateways to list, this field does not appear in
  /// the response.
  final String? marker;

  ListGatewaysOutput({
    this.gateways,
    this.marker,
  });

  factory ListGatewaysOutput.fromJson(Map<String, dynamic> json) {
    return ListGatewaysOutput(
      gateways: (json['Gateways'] as List?)
          ?.whereNotNull()
          .map((e) => GatewayInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gateways = this.gateways;
    final marker = this.marker;
    return {
      if (gateways != null) 'Gateways': gateways,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListLocalDisksOutput {
  /// A JSON object containing the following fields:
  ///
  /// <ul>
  /// <li>
  /// <a>ListLocalDisksOutput$Disks</a>
  /// </li>
  /// </ul>
  final List<Disk>? disks;
  final String? gatewayARN;

  ListLocalDisksOutput({
    this.disks,
    this.gatewayARN,
  });

  factory ListLocalDisksOutput.fromJson(Map<String, dynamic> json) {
    return ListLocalDisksOutput(
      disks: (json['Disks'] as List?)
          ?.whereNotNull()
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disks = this.disks;
    final gatewayARN = this.gatewayARN;
    return {
      if (disks != null) 'Disks': disks,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// ListTagsForResourceOutput
class ListTagsForResourceOutput {
  /// An opaque string that indicates the position at which to stop returning the
  /// list of tags.
  final String? marker;

  /// The Amazon Resource Name (ARN) of the resource for which you want to list
  /// tags.
  final String? resourceARN;

  /// An array that contains the tags for the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.marker,
    this.resourceARN,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      marker: json['Marker'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final resourceARN = this.resourceARN;
    final tags = this.tags;
    return {
      if (marker != null) 'Marker': marker,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTapePoolsOutput {
  /// A string that indicates the position at which to begin the returned list of
  /// tape pools. Use the marker in your next request to continue pagination of
  /// tape pools. If there are no more tape pools to list, this element does not
  /// appear in the response body.
  final String? marker;

  /// An array of <code>PoolInfo</code> objects, where each object describes a
  /// single custom tape pool. If there are no custom tape pools, the
  /// <code>PoolInfos</code> is an empty array.
  final List<PoolInfo>? poolInfos;

  ListTapePoolsOutput({
    this.marker,
    this.poolInfos,
  });

  factory ListTapePoolsOutput.fromJson(Map<String, dynamic> json) {
    return ListTapePoolsOutput(
      marker: json['Marker'] as String?,
      poolInfos: (json['PoolInfos'] as List?)
          ?.whereNotNull()
          .map((e) => PoolInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final poolInfos = this.poolInfos;
    return {
      if (marker != null) 'Marker': marker,
      if (poolInfos != null) 'PoolInfos': poolInfos,
    };
  }
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
class ListTapesOutput {
  /// A string that indicates the position at which to begin returning the next
  /// list of tapes. Use the marker in your next request to continue pagination of
  /// tapes. If there are no more tapes to list, this element does not appear in
  /// the response body.
  final String? marker;
  final List<TapeInfo>? tapeInfos;

  ListTapesOutput({
    this.marker,
    this.tapeInfos,
  });

  factory ListTapesOutput.fromJson(Map<String, dynamic> json) {
    return ListTapesOutput(
      marker: json['Marker'] as String?,
      tapeInfos: (json['TapeInfos'] as List?)
          ?.whereNotNull()
          .map((e) => TapeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final tapeInfos = this.tapeInfos;
    return {
      if (marker != null) 'Marker': marker,
      if (tapeInfos != null) 'TapeInfos': tapeInfos,
    };
  }
}

/// ListVolumeInitiatorsOutput
class ListVolumeInitiatorsOutput {
  /// The host names and port numbers of all iSCSI initiators that are connected
  /// to the gateway.
  final List<String>? initiators;

  ListVolumeInitiatorsOutput({
    this.initiators,
  });

  factory ListVolumeInitiatorsOutput.fromJson(Map<String, dynamic> json) {
    return ListVolumeInitiatorsOutput(
      initiators: (json['Initiators'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final initiators = this.initiators;
    return {
      if (initiators != null) 'Initiators': initiators,
    };
  }
}

class ListVolumeRecoveryPointsOutput {
  final String? gatewayARN;

  /// An array of <a>VolumeRecoveryPointInfo</a> objects.
  final List<VolumeRecoveryPointInfo>? volumeRecoveryPointInfos;

  ListVolumeRecoveryPointsOutput({
    this.gatewayARN,
    this.volumeRecoveryPointInfos,
  });

  factory ListVolumeRecoveryPointsOutput.fromJson(Map<String, dynamic> json) {
    return ListVolumeRecoveryPointsOutput(
      gatewayARN: json['GatewayARN'] as String?,
      volumeRecoveryPointInfos: (json['VolumeRecoveryPointInfos'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VolumeRecoveryPointInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final volumeRecoveryPointInfos = this.volumeRecoveryPointInfos;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (volumeRecoveryPointInfos != null)
        'VolumeRecoveryPointInfos': volumeRecoveryPointInfos,
    };
  }
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
class ListVolumesOutput {
  final String? gatewayARN;

  /// Use the marker in your next request to continue pagination of iSCSI volumes.
  /// If there are no more volumes to list, this field does not appear in the
  /// response body.
  final String? marker;

  /// An array of <a>VolumeInfo</a> objects, where each object describes an iSCSI
  /// volume. If no volumes are defined for the gateway, then
  /// <code>VolumeInfos</code> is an empty array "[]".
  final List<VolumeInfo>? volumeInfos;

  ListVolumesOutput({
    this.gatewayARN,
    this.marker,
    this.volumeInfos,
  });

  factory ListVolumesOutput.fromJson(Map<String, dynamic> json) {
    return ListVolumesOutput(
      gatewayARN: json['GatewayARN'] as String?,
      marker: json['Marker'] as String?,
      volumeInfos: (json['VolumeInfos'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final marker = this.marker;
    final volumeInfos = this.volumeInfos;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (marker != null) 'Marker': marker,
      if (volumeInfos != null) 'VolumeInfos': volumeInfos,
    };
  }
}

/// Describes Network File System (NFS) file share default values. Files and
/// folders stored as Amazon S3 objects in S3 buckets don't, by default, have
/// Unix file permissions assigned to them. Upon discovery in an S3 bucket by
/// Storage Gateway, the S3 objects that represent files and folders are
/// assigned these default Unix permissions. This operation is only supported
/// for S3 File Gateways.
class NFSFileShareDefaults {
  /// The Unix directory mode in the form "nnnn". For example, <code>0666</code>
  /// represents the default access mode for all directories inside the file
  /// share. The default value is <code>0777</code>.
  final String? directoryMode;

  /// The Unix file mode in the form "nnnn". For example, <code>0666</code>
  /// represents the default file mode inside the file share. The default value is
  /// <code>0666</code>.
  final String? fileMode;

  /// The default group ID for the file share (unless the files have another group
  /// ID specified). The default value is <code>nfsnobody</code>.
  final int? groupId;

  /// The default owner ID for files in the file share (unless the files have
  /// another owner ID specified). The default value is <code>nfsnobody</code>.
  final int? ownerId;

  NFSFileShareDefaults({
    this.directoryMode,
    this.fileMode,
    this.groupId,
    this.ownerId,
  });

  factory NFSFileShareDefaults.fromJson(Map<String, dynamic> json) {
    return NFSFileShareDefaults(
      directoryMode: json['DirectoryMode'] as String?,
      fileMode: json['FileMode'] as String?,
      groupId: json['GroupId'] as int?,
      ownerId: json['OwnerId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryMode = this.directoryMode;
    final fileMode = this.fileMode;
    final groupId = this.groupId;
    final ownerId = this.ownerId;
    return {
      if (directoryMode != null) 'DirectoryMode': directoryMode,
      if (fileMode != null) 'FileMode': fileMode,
      if (groupId != null) 'GroupId': groupId,
      if (ownerId != null) 'OwnerId': ownerId,
    };
  }
}

/// The Unix file permissions and ownership information assigned, by default, to
/// native S3 objects when an S3 File Gateway discovers them in S3 buckets. This
/// operation is only supported in S3 File Gateways.
class NFSFileShareInfo {
  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  final String? auditDestinationARN;

  /// Specifies the Region of the S3 bucket where the NFS file share stores files.
  /// <note>
  /// This parameter is required for NFS file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  final String? bucketRegion;

  /// Refresh cache information for the file share.
  final CacheAttributes? cacheAttributes;
  final List<String>? clientList;

  /// The default storage class for objects put into an Amazon S3 bucket by the S3
  /// File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code>
  /// | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code>
  final String? defaultStorageClass;
  final String? fileShareARN;
  final String? fileShareId;

  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
  /// </note>
  final String? fileShareName;
  final String? fileShareStatus;
  final String? gatewayARN;

  /// A value that enables guessing of the MIME type for uploaded objects based on
  /// file extensions. Set this value to <code>true</code> to enable MIME type
  /// guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? guessMIMETypeEnabled;

  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? kMSEncrypted;
  final String? kMSKey;
  final String? locationARN;
  final NFSFileShareDefaults? nFSFileShareDefaults;

  /// The notification policy of the file share.
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the object
  /// uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  final String? notificationPolicy;
  final ObjectACL? objectACL;
  final String? path;

  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? readOnly;

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
  final bool? requesterPays;
  final String? role;
  final String? squash;

  /// A list of up to 50 tags assigned to the NFS file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  final List<Tag>? tags;

  /// Specifies the DNS name for the VPC endpoint that the NFS file share uses to
  /// connect to Amazon S3.
  /// <note>
  /// This parameter is required for NFS file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  final String? vPCEndpointDNSName;

  NFSFileShareInfo({
    this.auditDestinationARN,
    this.bucketRegion,
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
    this.vPCEndpointDNSName,
  });

  factory NFSFileShareInfo.fromJson(Map<String, dynamic> json) {
    return NFSFileShareInfo(
      auditDestinationARN: json['AuditDestinationARN'] as String?,
      bucketRegion: json['BucketRegion'] as String?,
      cacheAttributes: json['CacheAttributes'] != null
          ? CacheAttributes.fromJson(
              json['CacheAttributes'] as Map<String, dynamic>)
          : null,
      clientList: (json['ClientList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      defaultStorageClass: json['DefaultStorageClass'] as String?,
      fileShareARN: json['FileShareARN'] as String?,
      fileShareId: json['FileShareId'] as String?,
      fileShareName: json['FileShareName'] as String?,
      fileShareStatus: json['FileShareStatus'] as String?,
      gatewayARN: json['GatewayARN'] as String?,
      guessMIMETypeEnabled: json['GuessMIMETypeEnabled'] as bool?,
      kMSEncrypted: json['KMSEncrypted'] as bool?,
      kMSKey: json['KMSKey'] as String?,
      locationARN: json['LocationARN'] as String?,
      nFSFileShareDefaults: json['NFSFileShareDefaults'] != null
          ? NFSFileShareDefaults.fromJson(
              json['NFSFileShareDefaults'] as Map<String, dynamic>)
          : null,
      notificationPolicy: json['NotificationPolicy'] as String?,
      objectACL: (json['ObjectACL'] as String?)?.toObjectACL(),
      path: json['Path'] as String?,
      readOnly: json['ReadOnly'] as bool?,
      requesterPays: json['RequesterPays'] as bool?,
      role: json['Role'] as String?,
      squash: json['Squash'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vPCEndpointDNSName: json['VPCEndpointDNSName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final auditDestinationARN = this.auditDestinationARN;
    final bucketRegion = this.bucketRegion;
    final cacheAttributes = this.cacheAttributes;
    final clientList = this.clientList;
    final defaultStorageClass = this.defaultStorageClass;
    final fileShareARN = this.fileShareARN;
    final fileShareId = this.fileShareId;
    final fileShareName = this.fileShareName;
    final fileShareStatus = this.fileShareStatus;
    final gatewayARN = this.gatewayARN;
    final guessMIMETypeEnabled = this.guessMIMETypeEnabled;
    final kMSEncrypted = this.kMSEncrypted;
    final kMSKey = this.kMSKey;
    final locationARN = this.locationARN;
    final nFSFileShareDefaults = this.nFSFileShareDefaults;
    final notificationPolicy = this.notificationPolicy;
    final objectACL = this.objectACL;
    final path = this.path;
    final readOnly = this.readOnly;
    final requesterPays = this.requesterPays;
    final role = this.role;
    final squash = this.squash;
    final tags = this.tags;
    final vPCEndpointDNSName = this.vPCEndpointDNSName;
    return {
      if (auditDestinationARN != null)
        'AuditDestinationARN': auditDestinationARN,
      if (bucketRegion != null) 'BucketRegion': bucketRegion,
      if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
      if (clientList != null) 'ClientList': clientList,
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
      if (fileShareId != null) 'FileShareId': fileShareId,
      if (fileShareName != null) 'FileShareName': fileShareName,
      if (fileShareStatus != null) 'FileShareStatus': fileShareStatus,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (guessMIMETypeEnabled != null)
        'GuessMIMETypeEnabled': guessMIMETypeEnabled,
      if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (locationARN != null) 'LocationARN': locationARN,
      if (nFSFileShareDefaults != null)
        'NFSFileShareDefaults': nFSFileShareDefaults,
      if (notificationPolicy != null) 'NotificationPolicy': notificationPolicy,
      if (objectACL != null) 'ObjectACL': objectACL.toValue(),
      if (path != null) 'Path': path,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (role != null) 'Role': role,
      if (squash != null) 'Squash': squash,
      if (tags != null) 'Tags': tags,
      if (vPCEndpointDNSName != null) 'VPCEndpointDNSName': vPCEndpointDNSName,
    };
  }
}

/// Describes a gateway's network interface.
class NetworkInterface {
  /// The Internet Protocol version 4 (IPv4) address of the interface.
  final String? ipv4Address;

  /// The Internet Protocol version 6 (IPv6) address of the interface.
  /// <i>Currently not supported</i>.
  final String? ipv6Address;

  /// The Media Access Control (MAC) address of the interface.
  /// <note>
  /// This is currently unsupported and will not be returned in output.
  /// </note>
  final String? macAddress;

  NetworkInterface({
    this.ipv4Address,
    this.ipv6Address,
    this.macAddress,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      ipv4Address: json['Ipv4Address'] as String?,
      ipv6Address: json['Ipv6Address'] as String?,
      macAddress: json['MacAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final macAddress = this.macAddress;
    return {
      if (ipv4Address != null) 'Ipv4Address': ipv4Address,
      if (ipv6Address != null) 'Ipv6Address': ipv6Address,
      if (macAddress != null) 'MacAddress': macAddress,
    };
  }
}

class NotifyWhenUploadedOutput {
  final String? fileShareARN;
  final String? notificationId;

  NotifyWhenUploadedOutput({
    this.fileShareARN,
    this.notificationId,
  });

  factory NotifyWhenUploadedOutput.fromJson(Map<String, dynamic> json) {
    return NotifyWhenUploadedOutput(
      fileShareARN: json['FileShareARN'] as String?,
      notificationId: json['NotificationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    final notificationId = this.notificationId;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
      if (notificationId != null) 'NotificationId': notificationId,
    };
  }
}

/// A value that sets the access control list (ACL) permission for objects in
/// the S3 bucket that an S3 File Gateway puts objects into. The default value
/// is <code>private</code>.
enum ObjectACL {
  private,
  publicRead,
  publicReadWrite,
  authenticatedRead,
  bucketOwnerRead,
  bucketOwnerFullControl,
  awsExecRead,
}

extension ObjectACLValueExtension on ObjectACL {
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
  }
}

extension ObjectACLFromString on String {
  ObjectACL toObjectACL() {
    switch (this) {
      case 'private':
        return ObjectACL.private;
      case 'public-read':
        return ObjectACL.publicRead;
      case 'public-read-write':
        return ObjectACL.publicReadWrite;
      case 'authenticated-read':
        return ObjectACL.authenticatedRead;
      case 'bucket-owner-read':
        return ObjectACL.bucketOwnerRead;
      case 'bucket-owner-full-control':
        return ObjectACL.bucketOwnerFullControl;
      case 'aws-exec-read':
        return ObjectACL.awsExecRead;
    }
    throw Exception('$this is not known in enum ObjectACL');
  }
}

/// Describes a custom tape pool.
class PoolInfo {
  /// The Amazon Resource Name (ARN) of the custom tape pool. Use the
  /// <a>ListTapePools</a> operation to return a list of custom tape pools for
  /// your account and Amazon Web Services Region.
  final String? poolARN;

  /// The name of the custom tape pool. <code>PoolName</code> can use all ASCII
  /// characters, except '/' and '\'.
  final String? poolName;

  /// Status of the custom tape pool. Pool can be <code>ACTIVE</code> or
  /// <code>DELETED</code>.
  final PoolStatus? poolStatus;

  /// Tape retention lock time is set in days. Tape retention lock can be enabled
  /// for up to 100 years (36,500 days).
  final int? retentionLockTimeInDays;

  /// Tape retention lock type, which can be configured in two modes. When
  /// configured in governance mode, Amazon Web Services accounts with specific
  /// IAM permissions are authorized to remove the tape retention lock from
  /// archived virtual tapes. When configured in compliance mode, the tape
  /// retention lock cannot be removed by any user, including the root Amazon Web
  /// Services account.
  final RetentionLockType? retentionLockType;

  /// The storage class that is associated with the custom pool. When you use your
  /// backup application to eject the tape, the tape is archived directly into the
  /// storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to
  /// the pool.
  final TapeStorageClass? storageClass;

  PoolInfo({
    this.poolARN,
    this.poolName,
    this.poolStatus,
    this.retentionLockTimeInDays,
    this.retentionLockType,
    this.storageClass,
  });

  factory PoolInfo.fromJson(Map<String, dynamic> json) {
    return PoolInfo(
      poolARN: json['PoolARN'] as String?,
      poolName: json['PoolName'] as String?,
      poolStatus: (json['PoolStatus'] as String?)?.toPoolStatus(),
      retentionLockTimeInDays: json['RetentionLockTimeInDays'] as int?,
      retentionLockType:
          (json['RetentionLockType'] as String?)?.toRetentionLockType(),
      storageClass: (json['StorageClass'] as String?)?.toTapeStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final poolARN = this.poolARN;
    final poolName = this.poolName;
    final poolStatus = this.poolStatus;
    final retentionLockTimeInDays = this.retentionLockTimeInDays;
    final retentionLockType = this.retentionLockType;
    final storageClass = this.storageClass;
    return {
      if (poolARN != null) 'PoolARN': poolARN,
      if (poolName != null) 'PoolName': poolName,
      if (poolStatus != null) 'PoolStatus': poolStatus.toValue(),
      if (retentionLockTimeInDays != null)
        'RetentionLockTimeInDays': retentionLockTimeInDays,
      if (retentionLockType != null)
        'RetentionLockType': retentionLockType.toValue(),
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }
}

enum PoolStatus {
  active,
  deleted,
}

extension PoolStatusValueExtension on PoolStatus {
  String toValue() {
    switch (this) {
      case PoolStatus.active:
        return 'ACTIVE';
      case PoolStatus.deleted:
        return 'DELETED';
    }
  }
}

extension PoolStatusFromString on String {
  PoolStatus toPoolStatus() {
    switch (this) {
      case 'ACTIVE':
        return PoolStatus.active;
      case 'DELETED':
        return PoolStatus.deleted;
    }
    throw Exception('$this is not known in enum PoolStatus');
  }
}

/// RefreshCacheOutput
class RefreshCacheOutput {
  final String? fileShareARN;
  final String? notificationId;

  RefreshCacheOutput({
    this.fileShareARN,
    this.notificationId,
  });

  factory RefreshCacheOutput.fromJson(Map<String, dynamic> json) {
    return RefreshCacheOutput(
      fileShareARN: json['FileShareARN'] as String?,
      notificationId: json['NotificationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    final notificationId = this.notificationId;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
      if (notificationId != null) 'NotificationId': notificationId,
    };
  }
}

/// RemoveTagsFromResourceOutput
class RemoveTagsFromResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource that the tags were removed
  /// from.
  final String? resourceARN;

  RemoveTagsFromResourceOutput({
    this.resourceARN,
  });

  factory RemoveTagsFromResourceOutput.fromJson(Map<String, dynamic> json) {
    return RemoveTagsFromResourceOutput(
      resourceARN: json['ResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
  }
}

class ResetCacheOutput {
  final String? gatewayARN;

  ResetCacheOutput({
    this.gatewayARN,
  });

  factory ResetCacheOutput.fromJson(Map<String, dynamic> json) {
    return ResetCacheOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

enum RetentionLockType {
  compliance,
  governance,
  none,
}

extension RetentionLockTypeValueExtension on RetentionLockType {
  String toValue() {
    switch (this) {
      case RetentionLockType.compliance:
        return 'COMPLIANCE';
      case RetentionLockType.governance:
        return 'GOVERNANCE';
      case RetentionLockType.none:
        return 'NONE';
    }
  }
}

extension RetentionLockTypeFromString on String {
  RetentionLockType toRetentionLockType() {
    switch (this) {
      case 'COMPLIANCE':
        return RetentionLockType.compliance;
      case 'GOVERNANCE':
        return RetentionLockType.governance;
      case 'NONE':
        return RetentionLockType.none;
    }
    throw Exception('$this is not known in enum RetentionLockType');
  }
}

/// RetrieveTapeArchiveOutput
class RetrieveTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the retrieved virtual tape.
  final String? tapeARN;

  RetrieveTapeArchiveOutput({
    this.tapeARN,
  });

  factory RetrieveTapeArchiveOutput.fromJson(Map<String, dynamic> json) {
    return RetrieveTapeArchiveOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

/// RetrieveTapeRecoveryPointOutput
class RetrieveTapeRecoveryPointOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which the recovery
  /// point was retrieved.
  final String? tapeARN;

  RetrieveTapeRecoveryPointOutput({
    this.tapeARN,
  });

  factory RetrieveTapeRecoveryPointOutput.fromJson(Map<String, dynamic> json) {
    return RetrieveTapeRecoveryPointOutput(
      tapeARN: json['TapeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
    };
  }
}

/// The Windows file permissions and ownership information assigned, by default,
/// to native S3 objects when S3 File Gateway discovers them in S3 buckets. This
/// operation is only supported for S3 File Gateways.
class SMBFileShareInfo {
  /// Indicates whether <code>AccessBasedEnumeration</code> is enabled.
  final bool? accessBasedEnumeration;

  /// A list of users or groups in the Active Directory that have administrator
  /// rights to the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  final List<String>? adminUserList;

  /// The Amazon Resource Name (ARN) of the storage used for audit logs.
  final String? auditDestinationARN;
  final String? authentication;

  /// Specifies the Region of the S3 bucket where the SMB file share stores files.
  /// <note>
  /// This parameter is required for SMB file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  final String? bucketRegion;

  /// Refresh cache information for the file share.
  final CacheAttributes? cacheAttributes;

  /// The case of an object name in an Amazon S3 bucket. For
  /// <code>ClientSpecified</code>, the client determines the case sensitivity.
  /// For <code>CaseSensitive</code>, the gateway determines the case sensitivity.
  /// The default value is <code>ClientSpecified</code>.
  final CaseSensitivity? caseSensitivity;

  /// The default storage class for objects put into an Amazon S3 bucket by the S3
  /// File Gateway. The default value is <code>S3_STANDARD</code>. Optional.
  ///
  /// Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code>
  /// | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code>
  final String? defaultStorageClass;
  final String? fileShareARN;
  final String? fileShareId;

  /// The name of the file share. Optional.
  /// <note>
  /// <code>FileShareName</code> must be set if an S3 prefix name is set in
  /// <code>LocationARN</code>, or if an access point or access point alias is
  /// used.
  /// </note>
  final String? fileShareName;
  final String? fileShareStatus;
  final String? gatewayARN;

  /// A value that enables guessing of the MIME type for uploaded objects based on
  /// file extensions. Set this value to <code>true</code> to enable MIME type
  /// guessing, otherwise set to <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? guessMIMETypeEnabled;

  /// A list of users or groups in the Active Directory that are not allowed to
  /// access the file share. A group must be prefixed with the @ character.
  /// Acceptable formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  final List<String>? invalidUserList;

  /// Set to <code>true</code> to use Amazon S3 server-side encryption with your
  /// own KMS key, or <code>false</code> to use a key managed by Amazon S3.
  /// Optional.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? kMSEncrypted;
  final String? kMSKey;
  final String? locationARN;

  /// The notification policy of the file share.
  /// <code>SettlingTimeInSeconds</code> controls the number of seconds to wait
  /// after the last point in time a client wrote to a file before generating an
  /// <code>ObjectUploaded</code> notification. Because clients can make many
  /// small writes to files, it's best to set this parameter for as long as
  /// possible to avoid generating multiple notifications for the same file in a
  /// small time period.
  /// <note>
  /// <code>SettlingTimeInSeconds</code> has no effect on the timing of the object
  /// uploading to Amazon S3, only the timing of the notification.
  /// </note>
  /// The following example sets <code>NotificationPolicy</code> on with
  /// <code>SettlingTimeInSeconds</code> set to 60.
  ///
  /// <code>{\"Upload\": {\"SettlingTimeInSeconds\": 60}}</code>
  ///
  /// The following example sets <code>NotificationPolicy</code> off.
  ///
  /// <code>{}</code>
  final String? notificationPolicy;
  final ObjectACL? objectACL;

  /// Specifies whether opportunistic locking is enabled for the SMB file share.
  /// <note>
  /// Enabling opportunistic locking on case-sensitive shares is not recommended
  /// for workloads that involve access to files with the same name in different
  /// case.
  /// </note>
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? oplocksEnabled;

  /// The file share path used by the SMB client to identify the mount point.
  final String? path;

  /// A value that sets the write status of a file share. Set this value to
  /// <code>true</code> to set the write status to read-only, otherwise set to
  /// <code>false</code>.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? readOnly;

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
  final bool? requesterPays;
  final String? role;

  /// If this value is set to <code>true</code>, it indicates that access control
  /// list (ACL) is enabled on the SMB file share. If it is set to
  /// <code>false</code>, it indicates that file and directory permissions are
  /// mapped to the POSIX permission.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using
  /// Microsoft Windows ACLs to control access to an SMB file share</a> in the
  /// <i>Storage Gateway User Guide</i>.
  final bool? sMBACLEnabled;

  /// A list of up to 50 tags assigned to the SMB file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway with
  /// more than 10 tags assigned, you can view all tags using the
  /// <code>ListTagsForResource</code> API operation.
  final List<Tag>? tags;

  /// Specifies the DNS name for the VPC endpoint that the SMB file share uses to
  /// connect to Amazon S3.
  /// <note>
  /// This parameter is required for SMB file shares that connect to Amazon S3
  /// through a VPC endpoint, a VPC access point, or an access point alias that
  /// points to a VPC access point.
  /// </note>
  final String? vPCEndpointDNSName;

  /// A list of users or groups in the Active Directory that are allowed to access
  /// the file share. A group must be prefixed with the @ character. Acceptable
  /// formats include: <code>DOMAIN\User1</code>, <code>user1</code>,
  /// <code>@group1</code>, and <code>@DOMAIN\group1</code>. Can only be set if
  /// Authentication is set to <code>ActiveDirectory</code>.
  final List<String>? validUserList;

  SMBFileShareInfo({
    this.accessBasedEnumeration,
    this.adminUserList,
    this.auditDestinationARN,
    this.authentication,
    this.bucketRegion,
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
    this.oplocksEnabled,
    this.path,
    this.readOnly,
    this.requesterPays,
    this.role,
    this.sMBACLEnabled,
    this.tags,
    this.vPCEndpointDNSName,
    this.validUserList,
  });

  factory SMBFileShareInfo.fromJson(Map<String, dynamic> json) {
    return SMBFileShareInfo(
      accessBasedEnumeration: json['AccessBasedEnumeration'] as bool?,
      adminUserList: (json['AdminUserList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      auditDestinationARN: json['AuditDestinationARN'] as String?,
      authentication: json['Authentication'] as String?,
      bucketRegion: json['BucketRegion'] as String?,
      cacheAttributes: json['CacheAttributes'] != null
          ? CacheAttributes.fromJson(
              json['CacheAttributes'] as Map<String, dynamic>)
          : null,
      caseSensitivity:
          (json['CaseSensitivity'] as String?)?.toCaseSensitivity(),
      defaultStorageClass: json['DefaultStorageClass'] as String?,
      fileShareARN: json['FileShareARN'] as String?,
      fileShareId: json['FileShareId'] as String?,
      fileShareName: json['FileShareName'] as String?,
      fileShareStatus: json['FileShareStatus'] as String?,
      gatewayARN: json['GatewayARN'] as String?,
      guessMIMETypeEnabled: json['GuessMIMETypeEnabled'] as bool?,
      invalidUserList: (json['InvalidUserList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kMSEncrypted: json['KMSEncrypted'] as bool?,
      kMSKey: json['KMSKey'] as String?,
      locationARN: json['LocationARN'] as String?,
      notificationPolicy: json['NotificationPolicy'] as String?,
      objectACL: (json['ObjectACL'] as String?)?.toObjectACL(),
      oplocksEnabled: json['OplocksEnabled'] as bool?,
      path: json['Path'] as String?,
      readOnly: json['ReadOnly'] as bool?,
      requesterPays: json['RequesterPays'] as bool?,
      role: json['Role'] as String?,
      sMBACLEnabled: json['SMBACLEnabled'] as bool?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vPCEndpointDNSName: json['VPCEndpointDNSName'] as String?,
      validUserList: (json['ValidUserList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessBasedEnumeration = this.accessBasedEnumeration;
    final adminUserList = this.adminUserList;
    final auditDestinationARN = this.auditDestinationARN;
    final authentication = this.authentication;
    final bucketRegion = this.bucketRegion;
    final cacheAttributes = this.cacheAttributes;
    final caseSensitivity = this.caseSensitivity;
    final defaultStorageClass = this.defaultStorageClass;
    final fileShareARN = this.fileShareARN;
    final fileShareId = this.fileShareId;
    final fileShareName = this.fileShareName;
    final fileShareStatus = this.fileShareStatus;
    final gatewayARN = this.gatewayARN;
    final guessMIMETypeEnabled = this.guessMIMETypeEnabled;
    final invalidUserList = this.invalidUserList;
    final kMSEncrypted = this.kMSEncrypted;
    final kMSKey = this.kMSKey;
    final locationARN = this.locationARN;
    final notificationPolicy = this.notificationPolicy;
    final objectACL = this.objectACL;
    final oplocksEnabled = this.oplocksEnabled;
    final path = this.path;
    final readOnly = this.readOnly;
    final requesterPays = this.requesterPays;
    final role = this.role;
    final sMBACLEnabled = this.sMBACLEnabled;
    final tags = this.tags;
    final vPCEndpointDNSName = this.vPCEndpointDNSName;
    final validUserList = this.validUserList;
    return {
      if (accessBasedEnumeration != null)
        'AccessBasedEnumeration': accessBasedEnumeration,
      if (adminUserList != null) 'AdminUserList': adminUserList,
      if (auditDestinationARN != null)
        'AuditDestinationARN': auditDestinationARN,
      if (authentication != null) 'Authentication': authentication,
      if (bucketRegion != null) 'BucketRegion': bucketRegion,
      if (cacheAttributes != null) 'CacheAttributes': cacheAttributes,
      if (caseSensitivity != null) 'CaseSensitivity': caseSensitivity.toValue(),
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
      if (fileShareId != null) 'FileShareId': fileShareId,
      if (fileShareName != null) 'FileShareName': fileShareName,
      if (fileShareStatus != null) 'FileShareStatus': fileShareStatus,
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (guessMIMETypeEnabled != null)
        'GuessMIMETypeEnabled': guessMIMETypeEnabled,
      if (invalidUserList != null) 'InvalidUserList': invalidUserList,
      if (kMSEncrypted != null) 'KMSEncrypted': kMSEncrypted,
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (locationARN != null) 'LocationARN': locationARN,
      if (notificationPolicy != null) 'NotificationPolicy': notificationPolicy,
      if (objectACL != null) 'ObjectACL': objectACL.toValue(),
      if (oplocksEnabled != null) 'OplocksEnabled': oplocksEnabled,
      if (path != null) 'Path': path,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (role != null) 'Role': role,
      if (sMBACLEnabled != null) 'SMBACLEnabled': sMBACLEnabled,
      if (tags != null) 'Tags': tags,
      if (vPCEndpointDNSName != null) 'VPCEndpointDNSName': vPCEndpointDNSName,
      if (validUserList != null) 'ValidUserList': validUserList,
    };
  }
}

/// A list of Active Directory users and groups that have special permissions
/// for SMB file shares on the gateway.
class SMBLocalGroups {
  /// A list of Active Directory users and groups that have local Gateway Admin
  /// permissions. Acceptable formats include: <code>DOMAIN\User1</code>,
  /// <code>user1</code>, <code>DOMAIN\group1</code>, and <code>group1</code>.
  ///
  /// Gateway Admins can use the Shared Folders Microsoft Management Console
  /// snap-in to force-close files that are open and locked.
  final List<String>? gatewayAdmins;

  SMBLocalGroups({
    this.gatewayAdmins,
  });

  factory SMBLocalGroups.fromJson(Map<String, dynamic> json) {
    return SMBLocalGroups(
      gatewayAdmins: (json['GatewayAdmins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayAdmins = this.gatewayAdmins;
    return {
      if (gatewayAdmins != null) 'GatewayAdmins': gatewayAdmins,
    };
  }
}

enum SMBSecurityStrategy {
  clientSpecified,
  mandatorySigning,
  mandatoryEncryption,
  mandatoryEncryptionNoAes128,
}

extension SMBSecurityStrategyValueExtension on SMBSecurityStrategy {
  String toValue() {
    switch (this) {
      case SMBSecurityStrategy.clientSpecified:
        return 'ClientSpecified';
      case SMBSecurityStrategy.mandatorySigning:
        return 'MandatorySigning';
      case SMBSecurityStrategy.mandatoryEncryption:
        return 'MandatoryEncryption';
      case SMBSecurityStrategy.mandatoryEncryptionNoAes128:
        return 'MandatoryEncryptionNoAes128';
    }
  }
}

extension SMBSecurityStrategyFromString on String {
  SMBSecurityStrategy toSMBSecurityStrategy() {
    switch (this) {
      case 'ClientSpecified':
        return SMBSecurityStrategy.clientSpecified;
      case 'MandatorySigning':
        return SMBSecurityStrategy.mandatorySigning;
      case 'MandatoryEncryption':
        return SMBSecurityStrategy.mandatoryEncryption;
      case 'MandatoryEncryptionNoAes128':
        return SMBSecurityStrategy.mandatoryEncryptionNoAes128;
    }
    throw Exception('$this is not known in enum SMBSecurityStrategy');
  }
}

class SetLocalConsolePasswordOutput {
  final String? gatewayARN;

  SetLocalConsolePasswordOutput({
    this.gatewayARN,
  });

  factory SetLocalConsolePasswordOutput.fromJson(Map<String, dynamic> json) {
    return SetLocalConsolePasswordOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class SetSMBGuestPasswordOutput {
  final String? gatewayARN;

  SetSMBGuestPasswordOutput({
    this.gatewayARN,
  });

  factory SetSMBGuestPasswordOutput.fromJson(Map<String, dynamic> json) {
    return SetSMBGuestPasswordOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was shut down.
class ShutdownGatewayOutput {
  final String? gatewayARN;

  ShutdownGatewayOutput({
    this.gatewayARN,
  });

  factory ShutdownGatewayOutput.fromJson(Map<String, dynamic> json) {
    return ShutdownGatewayOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class StartAvailabilityMonitorTestOutput {
  final String? gatewayARN;

  StartAvailabilityMonitorTestOutput({
    this.gatewayARN,
  });

  factory StartAvailabilityMonitorTestOutput.fromJson(
      Map<String, dynamic> json) {
    return StartAvailabilityMonitorTestOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was restarted.
class StartGatewayOutput {
  final String? gatewayARN;

  StartGatewayOutput({
    this.gatewayARN,
  });

  factory StartGatewayOutput.fromJson(Map<String, dynamic> json) {
    return StartGatewayOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// Describes an iSCSI stored volume.
class StorediSCSIVolume {
  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this timestamp.
  final DateTime? createdDate;
  final String? kMSKey;

  /// Indicates if when the stored volume was created, existing data on the
  /// underlying local disk was preserved.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? preservedExistingData;

  /// If the stored volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not included.
  final String? sourceSnapshotId;

  /// The name of the iSCSI target used by an initiator to connect to a volume and
  /// used as a suffix for the target ARN. For example, specifying
  /// <code>TargetName</code> as <i>myvolume</i> results in the target ARN of
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  final String? targetName;

  /// The Amazon Resource Name (ARN) of the storage volume.
  final String? volumeARN;

  /// A value that indicates whether a storage volume is attached to, detached
  /// from, or is in the process of detaching from a gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving
  /// your volumes to a different gateway</a>.
  final String? volumeAttachmentStatus;

  /// The ID of the local disk that was specified in the
  /// <a>CreateStorediSCSIVolume</a> operation.
  final String? volumeDiskId;

  /// The unique identifier of the volume, e.g., vol-AE4B946D.
  final String? volumeId;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the stored volume is not restoring or
  /// bootstrapping.
  final double? volumeProgress;

  /// The size of the volume in bytes.
  final int? volumeSizeInBytes;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String? volumeStatus;

  /// One of the VolumeType enumeration values describing the type of the volume.
  final String? volumeType;

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
  final int? volumeUsedInBytes;

  /// An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI
  /// attributes for one stored volume.
  final VolumeiSCSIAttributes? volumeiSCSIAttributes;

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

  factory StorediSCSIVolume.fromJson(Map<String, dynamic> json) {
    return StorediSCSIVolume(
      createdDate: timeStampFromJson(json['CreatedDate']),
      kMSKey: json['KMSKey'] as String?,
      preservedExistingData: json['PreservedExistingData'] as bool?,
      sourceSnapshotId: json['SourceSnapshotId'] as String?,
      targetName: json['TargetName'] as String?,
      volumeARN: json['VolumeARN'] as String?,
      volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String?,
      volumeDiskId: json['VolumeDiskId'] as String?,
      volumeId: json['VolumeId'] as String?,
      volumeProgress: json['VolumeProgress'] as double?,
      volumeSizeInBytes: json['VolumeSizeInBytes'] as int?,
      volumeStatus: json['VolumeStatus'] as String?,
      volumeType: json['VolumeType'] as String?,
      volumeUsedInBytes: json['VolumeUsedInBytes'] as int?,
      volumeiSCSIAttributes: json['VolumeiSCSIAttributes'] != null
          ? VolumeiSCSIAttributes.fromJson(
              json['VolumeiSCSIAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final kMSKey = this.kMSKey;
    final preservedExistingData = this.preservedExistingData;
    final sourceSnapshotId = this.sourceSnapshotId;
    final targetName = this.targetName;
    final volumeARN = this.volumeARN;
    final volumeAttachmentStatus = this.volumeAttachmentStatus;
    final volumeDiskId = this.volumeDiskId;
    final volumeId = this.volumeId;
    final volumeProgress = this.volumeProgress;
    final volumeSizeInBytes = this.volumeSizeInBytes;
    final volumeStatus = this.volumeStatus;
    final volumeType = this.volumeType;
    final volumeUsedInBytes = this.volumeUsedInBytes;
    final volumeiSCSIAttributes = this.volumeiSCSIAttributes;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (preservedExistingData != null)
        'PreservedExistingData': preservedExistingData,
      if (sourceSnapshotId != null) 'SourceSnapshotId': sourceSnapshotId,
      if (targetName != null) 'TargetName': targetName,
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeAttachmentStatus != null)
        'VolumeAttachmentStatus': volumeAttachmentStatus,
      if (volumeDiskId != null) 'VolumeDiskId': volumeDiskId,
      if (volumeId != null) 'VolumeId': volumeId,
      if (volumeProgress != null) 'VolumeProgress': volumeProgress,
      if (volumeSizeInBytes != null) 'VolumeSizeInBytes': volumeSizeInBytes,
      if (volumeStatus != null) 'VolumeStatus': volumeStatus,
      if (volumeType != null) 'VolumeType': volumeType,
      if (volumeUsedInBytes != null) 'VolumeUsedInBytes': volumeUsedInBytes,
      if (volumeiSCSIAttributes != null)
        'VolumeiSCSIAttributes': volumeiSCSIAttributes,
    };
  }
}

/// A key-value pair that helps you manage, filter, and search for your
/// resource. Allowed characters: letters, white space, and numbers,
/// representable in UTF-8, and the following characters: + - = . _ : /.
class Tag {
  /// Tag key. The key can't start with aws:.
  final String key;

  /// Value of the tag key.
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

/// Describes a virtual tape object.
class Tape {
  final String? kMSKey;

  /// The date that the tape enters a custom tape pool.
  final DateTime? poolEntryDate;

  /// The ID of the pool that contains tapes that will be archived. The tapes in
  /// this pool are archived in the S3 storage class that is associated with the
  /// pool. When you use your backup application to eject the tape, the tape is
  /// archived directly into the storage class (S3 Glacier or S3 Glacier Deep
  /// Archive) that corresponds to the pool.
  final String? poolId;

  /// For archiving virtual tapes, indicates how much data remains to be uploaded
  /// before archiving is complete.
  ///
  /// Range: 0 (not started) to 100 (complete).
  final double? progress;

  /// The date that the tape is first archived with tape retention lock enabled.
  final DateTime? retentionStartDate;

  /// The Amazon Resource Name (ARN) of the virtual tape.
  final String? tapeARN;

  /// The barcode that identifies a specific virtual tape.
  final String? tapeBarcode;

  /// The date the virtual tape was created.
  final DateTime? tapeCreatedDate;

  /// The size, in bytes, of the virtual tape capacity.
  final int? tapeSizeInBytes;

  /// The current state of the virtual tape.
  final String? tapeStatus;

  /// The size, in bytes, of data stored on the virtual tape.
  /// <note>
  /// This value is not available for tapes created prior to May 13, 2015.
  /// </note>
  final int? tapeUsedInBytes;

  /// The virtual tape library (VTL) device that the virtual tape is associated
  /// with.
  final String? vTLDevice;

  /// If the tape is archived as write-once-read-many (WORM), this value is
  /// <code>true</code>.
  final bool? worm;

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

  factory Tape.fromJson(Map<String, dynamic> json) {
    return Tape(
      kMSKey: json['KMSKey'] as String?,
      poolEntryDate: timeStampFromJson(json['PoolEntryDate']),
      poolId: json['PoolId'] as String?,
      progress: json['Progress'] as double?,
      retentionStartDate: timeStampFromJson(json['RetentionStartDate']),
      tapeARN: json['TapeARN'] as String?,
      tapeBarcode: json['TapeBarcode'] as String?,
      tapeCreatedDate: timeStampFromJson(json['TapeCreatedDate']),
      tapeSizeInBytes: json['TapeSizeInBytes'] as int?,
      tapeStatus: json['TapeStatus'] as String?,
      tapeUsedInBytes: json['TapeUsedInBytes'] as int?,
      vTLDevice: json['VTLDevice'] as String?,
      worm: json['Worm'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final kMSKey = this.kMSKey;
    final poolEntryDate = this.poolEntryDate;
    final poolId = this.poolId;
    final progress = this.progress;
    final retentionStartDate = this.retentionStartDate;
    final tapeARN = this.tapeARN;
    final tapeBarcode = this.tapeBarcode;
    final tapeCreatedDate = this.tapeCreatedDate;
    final tapeSizeInBytes = this.tapeSizeInBytes;
    final tapeStatus = this.tapeStatus;
    final tapeUsedInBytes = this.tapeUsedInBytes;
    final vTLDevice = this.vTLDevice;
    final worm = this.worm;
    return {
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (poolEntryDate != null)
        'PoolEntryDate': unixTimestampToJson(poolEntryDate),
      if (poolId != null) 'PoolId': poolId,
      if (progress != null) 'Progress': progress,
      if (retentionStartDate != null)
        'RetentionStartDate': unixTimestampToJson(retentionStartDate),
      if (tapeARN != null) 'TapeARN': tapeARN,
      if (tapeBarcode != null) 'TapeBarcode': tapeBarcode,
      if (tapeCreatedDate != null)
        'TapeCreatedDate': unixTimestampToJson(tapeCreatedDate),
      if (tapeSizeInBytes != null) 'TapeSizeInBytes': tapeSizeInBytes,
      if (tapeStatus != null) 'TapeStatus': tapeStatus,
      if (tapeUsedInBytes != null) 'TapeUsedInBytes': tapeUsedInBytes,
      if (vTLDevice != null) 'VTLDevice': vTLDevice,
      if (worm != null) 'Worm': worm,
    };
  }
}

/// Represents a virtual tape that is archived in the virtual tape shelf (VTS).
class TapeArchive {
  /// The time that the archiving of the virtual tape was completed.
  ///
  /// The default timestamp format is in the ISO8601 extended
  /// YYYY-MM-DD'T'HH:MM:SS'Z' format.
  final DateTime? completionTime;
  final String? kMSKey;

  /// The time that the tape entered the custom tape pool.
  ///
  /// The default timestamp format is in the ISO8601 extended
  /// YYYY-MM-DD'T'HH:MM:SS'Z' format.
  final DateTime? poolEntryDate;

  /// The ID of the pool that was used to archive the tape. The tapes in this pool
  /// are archived in the S3 storage class that is associated with the pool.
  final String? poolId;

  /// If the archived tape is subject to tape retention lock, the date that the
  /// archived tape started being retained.
  final DateTime? retentionStartDate;

  /// The Amazon Resource Name (ARN) of the tape gateway that the virtual tape is
  /// being retrieved to.
  ///
  /// The virtual tape is retrieved from the virtual tape shelf (VTS).
  final String? retrievedTo;

  /// The Amazon Resource Name (ARN) of an archived virtual tape.
  final String? tapeARN;

  /// The barcode that identifies the archived virtual tape.
  final String? tapeBarcode;

  /// The date the virtual tape was created.
  final DateTime? tapeCreatedDate;

  /// The size, in bytes, of the archived virtual tape.
  final int? tapeSizeInBytes;

  /// The current state of the archived virtual tape.
  final String? tapeStatus;

  /// The size, in bytes, of data stored on the virtual tape.
  /// <note>
  /// This value is not available for tapes created prior to May 13, 2015.
  /// </note>
  final int? tapeUsedInBytes;

  /// Set to <code>true</code> if the archived tape is stored as
  /// write-once-read-many (WORM).
  final bool? worm;

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

  factory TapeArchive.fromJson(Map<String, dynamic> json) {
    return TapeArchive(
      completionTime: timeStampFromJson(json['CompletionTime']),
      kMSKey: json['KMSKey'] as String?,
      poolEntryDate: timeStampFromJson(json['PoolEntryDate']),
      poolId: json['PoolId'] as String?,
      retentionStartDate: timeStampFromJson(json['RetentionStartDate']),
      retrievedTo: json['RetrievedTo'] as String?,
      tapeARN: json['TapeARN'] as String?,
      tapeBarcode: json['TapeBarcode'] as String?,
      tapeCreatedDate: timeStampFromJson(json['TapeCreatedDate']),
      tapeSizeInBytes: json['TapeSizeInBytes'] as int?,
      tapeStatus: json['TapeStatus'] as String?,
      tapeUsedInBytes: json['TapeUsedInBytes'] as int?,
      worm: json['Worm'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final kMSKey = this.kMSKey;
    final poolEntryDate = this.poolEntryDate;
    final poolId = this.poolId;
    final retentionStartDate = this.retentionStartDate;
    final retrievedTo = this.retrievedTo;
    final tapeARN = this.tapeARN;
    final tapeBarcode = this.tapeBarcode;
    final tapeCreatedDate = this.tapeCreatedDate;
    final tapeSizeInBytes = this.tapeSizeInBytes;
    final tapeStatus = this.tapeStatus;
    final tapeUsedInBytes = this.tapeUsedInBytes;
    final worm = this.worm;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (poolEntryDate != null)
        'PoolEntryDate': unixTimestampToJson(poolEntryDate),
      if (poolId != null) 'PoolId': poolId,
      if (retentionStartDate != null)
        'RetentionStartDate': unixTimestampToJson(retentionStartDate),
      if (retrievedTo != null) 'RetrievedTo': retrievedTo,
      if (tapeARN != null) 'TapeARN': tapeARN,
      if (tapeBarcode != null) 'TapeBarcode': tapeBarcode,
      if (tapeCreatedDate != null)
        'TapeCreatedDate': unixTimestampToJson(tapeCreatedDate),
      if (tapeSizeInBytes != null) 'TapeSizeInBytes': tapeSizeInBytes,
      if (tapeStatus != null) 'TapeStatus': tapeStatus,
      if (tapeUsedInBytes != null) 'TapeUsedInBytes': tapeUsedInBytes,
      if (worm != null) 'Worm': worm,
    };
  }
}

/// Describes a virtual tape.
class TapeInfo {
  /// The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a>
  /// operation to return a list of gateways for your account and Amazon Web
  /// Services Region.
  final String? gatewayARN;

  /// The date that the tape entered the custom tape pool with tape retention lock
  /// enabled.
  final DateTime? poolEntryDate;

  /// The ID of the pool that you want to add your tape to for archiving. The tape
  /// in this pool is archived in the S3 storage class that is associated with the
  /// pool. When you use your backup application to eject the tape, the tape is
  /// archived directly into the storage class (S3 Glacier or S3 Glacier Deep
  /// Archive) that corresponds to the pool.
  final String? poolId;

  /// The date that the tape became subject to tape retention lock.
  final DateTime? retentionStartDate;

  /// The Amazon Resource Name (ARN) of a virtual tape.
  final String? tapeARN;

  /// The barcode that identifies a specific virtual tape.
  final String? tapeBarcode;

  /// The size, in bytes, of a virtual tape.
  final int? tapeSizeInBytes;

  /// The status of the tape.
  final String? tapeStatus;

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

  factory TapeInfo.fromJson(Map<String, dynamic> json) {
    return TapeInfo(
      gatewayARN: json['GatewayARN'] as String?,
      poolEntryDate: timeStampFromJson(json['PoolEntryDate']),
      poolId: json['PoolId'] as String?,
      retentionStartDate: timeStampFromJson(json['RetentionStartDate']),
      tapeARN: json['TapeARN'] as String?,
      tapeBarcode: json['TapeBarcode'] as String?,
      tapeSizeInBytes: json['TapeSizeInBytes'] as int?,
      tapeStatus: json['TapeStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final poolEntryDate = this.poolEntryDate;
    final poolId = this.poolId;
    final retentionStartDate = this.retentionStartDate;
    final tapeARN = this.tapeARN;
    final tapeBarcode = this.tapeBarcode;
    final tapeSizeInBytes = this.tapeSizeInBytes;
    final tapeStatus = this.tapeStatus;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (poolEntryDate != null)
        'PoolEntryDate': unixTimestampToJson(poolEntryDate),
      if (poolId != null) 'PoolId': poolId,
      if (retentionStartDate != null)
        'RetentionStartDate': unixTimestampToJson(retentionStartDate),
      if (tapeARN != null) 'TapeARN': tapeARN,
      if (tapeBarcode != null) 'TapeBarcode': tapeBarcode,
      if (tapeSizeInBytes != null) 'TapeSizeInBytes': tapeSizeInBytes,
      if (tapeStatus != null) 'TapeStatus': tapeStatus,
    };
  }
}

/// Describes a recovery point.
class TapeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the virtual tape.
  final String? tapeARN;

  /// The time when the point-in-time view of the virtual tape was replicated for
  /// later recovery.
  ///
  /// The default timestamp format of the tape recovery point time is in the
  /// ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.
  final DateTime? tapeRecoveryPointTime;

  /// The size, in bytes, of the virtual tapes to recover.
  final int? tapeSizeInBytes;

  /// The status of the virtual tapes.
  final String? tapeStatus;

  TapeRecoveryPointInfo({
    this.tapeARN,
    this.tapeRecoveryPointTime,
    this.tapeSizeInBytes,
    this.tapeStatus,
  });

  factory TapeRecoveryPointInfo.fromJson(Map<String, dynamic> json) {
    return TapeRecoveryPointInfo(
      tapeARN: json['TapeARN'] as String?,
      tapeRecoveryPointTime: timeStampFromJson(json['TapeRecoveryPointTime']),
      tapeSizeInBytes: json['TapeSizeInBytes'] as int?,
      tapeStatus: json['TapeStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tapeARN = this.tapeARN;
    final tapeRecoveryPointTime = this.tapeRecoveryPointTime;
    final tapeSizeInBytes = this.tapeSizeInBytes;
    final tapeStatus = this.tapeStatus;
    return {
      if (tapeARN != null) 'TapeARN': tapeARN,
      if (tapeRecoveryPointTime != null)
        'TapeRecoveryPointTime': unixTimestampToJson(tapeRecoveryPointTime),
      if (tapeSizeInBytes != null) 'TapeSizeInBytes': tapeSizeInBytes,
      if (tapeStatus != null) 'TapeStatus': tapeStatus,
    };
  }
}

enum TapeStorageClass {
  deepArchive,
  glacier,
}

extension TapeStorageClassValueExtension on TapeStorageClass {
  String toValue() {
    switch (this) {
      case TapeStorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case TapeStorageClass.glacier:
        return 'GLACIER';
    }
  }
}

extension TapeStorageClassFromString on String {
  TapeStorageClass toTapeStorageClass() {
    switch (this) {
      case 'DEEP_ARCHIVE':
        return TapeStorageClass.deepArchive;
      case 'GLACIER':
        return TapeStorageClass.glacier;
    }
    throw Exception('$this is not known in enum TapeStorageClass');
  }
}

class UpdateAutomaticTapeCreationPolicyOutput {
  final String? gatewayARN;

  UpdateAutomaticTapeCreationPolicyOutput({
    this.gatewayARN,
  });

  factory UpdateAutomaticTapeCreationPolicyOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateAutomaticTapeCreationPolicyOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// throttle information was updated.
class UpdateBandwidthRateLimitOutput {
  final String? gatewayARN;

  UpdateBandwidthRateLimitOutput({
    this.gatewayARN,
  });

  factory UpdateBandwidthRateLimitOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBandwidthRateLimitOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class UpdateBandwidthRateLimitScheduleOutput {
  final String? gatewayARN;

  UpdateBandwidthRateLimitScheduleOutput({
    this.gatewayARN,
  });

  factory UpdateBandwidthRateLimitScheduleOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateBandwidthRateLimitScheduleOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the following fields:
class UpdateChapCredentialsOutput {
  /// The iSCSI initiator that connects to the target. This is the same initiator
  /// name specified in the request.
  final String? initiatorName;

  /// The Amazon Resource Name (ARN) of the target. This is the same target
  /// specified in the request.
  final String? targetARN;

  UpdateChapCredentialsOutput({
    this.initiatorName,
    this.targetARN,
  });

  factory UpdateChapCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateChapCredentialsOutput(
      initiatorName: json['InitiatorName'] as String?,
      targetARN: json['TargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatorName = this.initiatorName;
    final targetARN = this.targetARN;
    return {
      if (initiatorName != null) 'InitiatorName': initiatorName,
      if (targetARN != null) 'TargetARN': targetARN,
    };
  }
}

class UpdateFileSystemAssociationOutput {
  /// The ARN of the updated file system association.
  final String? fileSystemAssociationARN;

  UpdateFileSystemAssociationOutput({
    this.fileSystemAssociationARN,
  });

  factory UpdateFileSystemAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateFileSystemAssociationOutput(
      fileSystemAssociationARN: json['FileSystemAssociationARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemAssociationARN = this.fileSystemAssociationARN;
    return {
      if (fileSystemAssociationARN != null)
        'FileSystemAssociationARN': fileSystemAssociationARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was updated.
class UpdateGatewayInformationOutput {
  final String? gatewayARN;

  /// The name you configured for your gateway.
  final String? gatewayName;

  UpdateGatewayInformationOutput({
    this.gatewayARN,
    this.gatewayName,
  });

  factory UpdateGatewayInformationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGatewayInformationOutput(
      gatewayARN: json['GatewayARN'] as String?,
      gatewayName: json['GatewayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final gatewayName = this.gatewayName;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (gatewayName != null) 'GatewayName': gatewayName,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway that
/// was updated.
class UpdateGatewaySoftwareNowOutput {
  final String? gatewayARN;

  UpdateGatewaySoftwareNowOutput({
    this.gatewayARN,
  });

  factory UpdateGatewaySoftwareNowOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGatewaySoftwareNowOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the gateway whose
/// maintenance start time is updated.
class UpdateMaintenanceStartTimeOutput {
  final String? gatewayARN;

  UpdateMaintenanceStartTimeOutput({
    this.gatewayARN,
  });

  factory UpdateMaintenanceStartTimeOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMaintenanceStartTimeOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// UpdateNFSFileShareOutput
class UpdateNFSFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated file share.
  final String? fileShareARN;

  UpdateNFSFileShareOutput({
    this.fileShareARN,
  });

  factory UpdateNFSFileShareOutput.fromJson(Map<String, dynamic> json) {
    return UpdateNFSFileShareOutput(
      fileShareARN: json['FileShareARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
    };
  }
}

/// UpdateSMBFileShareOutput
class UpdateSMBFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated SMB file share.
  final String? fileShareARN;

  UpdateSMBFileShareOutput({
    this.fileShareARN,
  });

  factory UpdateSMBFileShareOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSMBFileShareOutput(
      fileShareARN: json['FileShareARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileShareARN = this.fileShareARN;
    return {
      if (fileShareARN != null) 'FileShareARN': fileShareARN,
    };
  }
}

class UpdateSMBFileShareVisibilityOutput {
  final String? gatewayARN;

  UpdateSMBFileShareVisibilityOutput({
    this.gatewayARN,
  });

  factory UpdateSMBFileShareVisibilityOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateSMBFileShareVisibilityOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class UpdateSMBLocalGroupsOutput {
  final String? gatewayARN;

  UpdateSMBLocalGroupsOutput({
    this.gatewayARN,
  });

  factory UpdateSMBLocalGroupsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSMBLocalGroupsOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

class UpdateSMBSecurityStrategyOutput {
  final String? gatewayARN;

  UpdateSMBSecurityStrategyOutput({
    this.gatewayARN,
  });

  factory UpdateSMBSecurityStrategyOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSMBSecurityStrategyOutput(
      gatewayARN: json['GatewayARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
    };
  }
}

/// A JSON object containing the Amazon Resource Name (ARN) of the updated
/// storage volume.
class UpdateSnapshotScheduleOutput {
  /// The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a>
  /// operation to return a list of gateway volumes.
  final String? volumeARN;

  UpdateSnapshotScheduleOutput({
    this.volumeARN,
  });

  factory UpdateSnapshotScheduleOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSnapshotScheduleOutput(
      volumeARN: json['VolumeARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeARN = this.volumeARN;
    return {
      if (volumeARN != null) 'VolumeARN': volumeARN,
    };
  }
}

/// UpdateVTLDeviceTypeOutput
class UpdateVTLDeviceTypeOutput {
  /// The Amazon Resource Name (ARN) of the medium changer you have selected.
  final String? vTLDeviceARN;

  UpdateVTLDeviceTypeOutput({
    this.vTLDeviceARN,
  });

  factory UpdateVTLDeviceTypeOutput.fromJson(Map<String, dynamic> json) {
    return UpdateVTLDeviceTypeOutput(
      vTLDeviceARN: json['VTLDeviceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vTLDeviceARN = this.vTLDeviceARN;
    return {
      if (vTLDeviceARN != null) 'VTLDeviceARN': vTLDeviceARN,
    };
  }
}

/// Represents a device object associated with a tape gateway.
class VTLDevice {
  /// A list of iSCSI information about a VTL device.
  final DeviceiSCSIAttributes? deviceiSCSIAttributes;

  /// Specifies the unique Amazon Resource Name (ARN) of the device (tape drive or
  /// media changer).
  final String? vTLDeviceARN;

  /// Specifies the model number of device that the VTL device emulates.
  final String? vTLDeviceProductIdentifier;

  /// Specifies the type of device that the VTL device emulates.
  final String? vTLDeviceType;

  /// Specifies the vendor of the device that the VTL device object emulates.
  final String? vTLDeviceVendor;

  VTLDevice({
    this.deviceiSCSIAttributes,
    this.vTLDeviceARN,
    this.vTLDeviceProductIdentifier,
    this.vTLDeviceType,
    this.vTLDeviceVendor,
  });

  factory VTLDevice.fromJson(Map<String, dynamic> json) {
    return VTLDevice(
      deviceiSCSIAttributes: json['DeviceiSCSIAttributes'] != null
          ? DeviceiSCSIAttributes.fromJson(
              json['DeviceiSCSIAttributes'] as Map<String, dynamic>)
          : null,
      vTLDeviceARN: json['VTLDeviceARN'] as String?,
      vTLDeviceProductIdentifier: json['VTLDeviceProductIdentifier'] as String?,
      vTLDeviceType: json['VTLDeviceType'] as String?,
      vTLDeviceVendor: json['VTLDeviceVendor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceiSCSIAttributes = this.deviceiSCSIAttributes;
    final vTLDeviceARN = this.vTLDeviceARN;
    final vTLDeviceProductIdentifier = this.vTLDeviceProductIdentifier;
    final vTLDeviceType = this.vTLDeviceType;
    final vTLDeviceVendor = this.vTLDeviceVendor;
    return {
      if (deviceiSCSIAttributes != null)
        'DeviceiSCSIAttributes': deviceiSCSIAttributes,
      if (vTLDeviceARN != null) 'VTLDeviceARN': vTLDeviceARN,
      if (vTLDeviceProductIdentifier != null)
        'VTLDeviceProductIdentifier': vTLDeviceProductIdentifier,
      if (vTLDeviceType != null) 'VTLDeviceType': vTLDeviceType,
      if (vTLDeviceVendor != null) 'VTLDeviceVendor': vTLDeviceVendor,
    };
  }
}

/// Describes a storage volume object.
class VolumeInfo {
  final String? gatewayARN;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  final String? gatewayId;

  /// The Amazon Resource Name (ARN) for the storage volume. For example, the
  /// following is a valid ARN:
  ///
  /// <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB</code>
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  final String? volumeARN;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String? volumeAttachmentStatus;

  /// The unique identifier assigned to the volume. This ID becomes part of the
  /// volume Amazon Resource Name (ARN), which you use as input for other
  /// operations.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  final String? volumeId;

  /// The size of the volume in bytes.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens
  /// (-).
  final int? volumeSizeInBytes;

  /// One of the VolumeType enumeration values describing the type of the volume.
  final String? volumeType;

  VolumeInfo({
    this.gatewayARN,
    this.gatewayId,
    this.volumeARN,
    this.volumeAttachmentStatus,
    this.volumeId,
    this.volumeSizeInBytes,
    this.volumeType,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      gatewayARN: json['GatewayARN'] as String?,
      gatewayId: json['GatewayId'] as String?,
      volumeARN: json['VolumeARN'] as String?,
      volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String?,
      volumeId: json['VolumeId'] as String?,
      volumeSizeInBytes: json['VolumeSizeInBytes'] as int?,
      volumeType: json['VolumeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayARN = this.gatewayARN;
    final gatewayId = this.gatewayId;
    final volumeARN = this.volumeARN;
    final volumeAttachmentStatus = this.volumeAttachmentStatus;
    final volumeId = this.volumeId;
    final volumeSizeInBytes = this.volumeSizeInBytes;
    final volumeType = this.volumeType;
    return {
      if (gatewayARN != null) 'GatewayARN': gatewayARN,
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeAttachmentStatus != null)
        'VolumeAttachmentStatus': volumeAttachmentStatus,
      if (volumeId != null) 'VolumeId': volumeId,
      if (volumeSizeInBytes != null) 'VolumeSizeInBytes': volumeSizeInBytes,
      if (volumeType != null) 'VolumeType': volumeType,
    };
  }
}

/// Describes a storage volume recovery point object.
class VolumeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the volume target.
  final String? volumeARN;

  /// The time the recovery point was taken.
  final String? volumeRecoveryPointTime;

  /// The size of the volume in bytes.
  final int? volumeSizeInBytes;

  /// The size of the data stored on the volume in bytes.
  /// <note>
  /// This value is not available for volumes created prior to May 13, 2015, until
  /// you store data on the volume.
  /// </note>
  final int? volumeUsageInBytes;

  VolumeRecoveryPointInfo({
    this.volumeARN,
    this.volumeRecoveryPointTime,
    this.volumeSizeInBytes,
    this.volumeUsageInBytes,
  });

  factory VolumeRecoveryPointInfo.fromJson(Map<String, dynamic> json) {
    return VolumeRecoveryPointInfo(
      volumeARN: json['VolumeARN'] as String?,
      volumeRecoveryPointTime: json['VolumeRecoveryPointTime'] as String?,
      volumeSizeInBytes: json['VolumeSizeInBytes'] as int?,
      volumeUsageInBytes: json['VolumeUsageInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeARN = this.volumeARN;
    final volumeRecoveryPointTime = this.volumeRecoveryPointTime;
    final volumeSizeInBytes = this.volumeSizeInBytes;
    final volumeUsageInBytes = this.volumeUsageInBytes;
    return {
      if (volumeARN != null) 'VolumeARN': volumeARN,
      if (volumeRecoveryPointTime != null)
        'VolumeRecoveryPointTime': volumeRecoveryPointTime,
      if (volumeSizeInBytes != null) 'VolumeSizeInBytes': volumeSizeInBytes,
      if (volumeUsageInBytes != null) 'VolumeUsageInBytes': volumeUsageInBytes,
    };
  }
}

/// Lists iSCSI information about a volume.
class VolumeiSCSIAttributes {
  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  final bool? chapEnabled;

  /// The logical disk number.
  final int? lunNumber;

  /// The network interface identifier.
  final String? networkInterfaceId;

  /// The port used to communicate with iSCSI targets.
  final int? networkInterfacePort;

  /// The Amazon Resource Name (ARN) of the volume target.
  final String? targetARN;

  VolumeiSCSIAttributes({
    this.chapEnabled,
    this.lunNumber,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.targetARN,
  });

  factory VolumeiSCSIAttributes.fromJson(Map<String, dynamic> json) {
    return VolumeiSCSIAttributes(
      chapEnabled: json['ChapEnabled'] as bool?,
      lunNumber: json['LunNumber'] as int?,
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
      networkInterfacePort: json['NetworkInterfacePort'] as int?,
      targetARN: json['TargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chapEnabled = this.chapEnabled;
    final lunNumber = this.lunNumber;
    final networkInterfaceId = this.networkInterfaceId;
    final networkInterfacePort = this.networkInterfacePort;
    final targetARN = this.targetARN;
    return {
      if (chapEnabled != null) 'ChapEnabled': chapEnabled,
      if (lunNumber != null) 'LunNumber': lunNumber,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (networkInterfacePort != null)
        'NetworkInterfacePort': networkInterfacePort,
      if (targetARN != null) 'TargetARN': targetARN,
    };
  }
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidGatewayRequestException extends _s.GenericAwsException {
  InvalidGatewayRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGatewayRequestException',
            message: message);
}

class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String? type, String? message})
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
