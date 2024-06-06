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

/// The FinSpace management service provides the APIs for managing FinSpace
/// environments.
class Finspace {
  final _s.RestJsonProtocol _protocol;
  Finspace({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'finspace',
            signingName: 'finspace',
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

  /// Create a new FinSpace environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the FinSpace environment to be created.
  ///
  /// Parameter [dataBundles] :
  /// The list of Amazon Resource Names (ARN) of the data bundles to install.
  /// Currently supported data bundle ARNs:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:finspace:${Region}::data-bundle/capital-markets-sample</code>
  /// - Contains sample Capital Markets datasets, categories and controlled
  /// vocabularies.
  /// </li>
  /// <li>
  /// <code>arn:aws:finspace:${Region}::data-bundle/taq</code> (default) -
  /// Contains trades and quotes data in addition to sample Capital Markets
  /// data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the FinSpace environment to be created.
  ///
  /// Parameter [federationMode] :
  /// Authentication mode for the environment.
  ///
  /// <ul>
  /// <li>
  /// <code>FEDERATED</code> - Users access FinSpace through Single Sign On
  /// (SSO) via your Identity provider.
  /// </li>
  /// <li>
  /// <code>LOCAL</code> - Users access FinSpace via email and password managed
  /// within the FinSpace environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [federationParameters] :
  /// Configuration information when authentication mode is FEDERATED.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key id to encrypt your data in the FinSpace environment.
  ///
  /// Parameter [superuserParameters] :
  /// Configuration information for the superuser.
  ///
  /// Parameter [tags] :
  /// Add tags to your FinSpace environment.
  @Deprecated('This method will be discontinued.')
  Future<CreateEnvironmentResponse> createEnvironment({
    required String name,
    List<String>? dataBundles,
    String? description,
    FederationMode? federationMode,
    FederationParameters? federationParameters,
    String? kmsKeyId,
    SuperuserParameters? superuserParameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (dataBundles != null) 'dataBundles': dataBundles,
      if (description != null) 'description': description,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (superuserParameters != null)
        'superuserParameters': superuserParameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/environment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentResponse.fromJson(response);
  }

  /// Creates a changeset for a kdb database. A changeset allows you to add and
  /// delete existing files by using an ordered list of change requests.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [changeRequests] :
  /// A list of change request objects that are run in order. A change request
  /// object consists of <code>changeType</code> , <code>s3Path</code>, and
  /// <code>dbPath</code>. A changeType can have the following values:
  ///
  /// <ul>
  /// <li>
  /// PUT – Adds or updates files in a database.
  /// </li>
  /// <li>
  /// DELETE – Deletes files in a database.
  /// </li>
  /// </ul>
  /// All the change requests require a mandatory <code>dbPath</code> attribute
  /// that defines the path within the database directory. All database paths
  /// must start with a leading / and end with a trailing /. The
  /// <code>s3Path</code> attribute defines the s3 source file path and is
  /// required for a PUT change type. The <code>s3path</code> must end with a
  /// trailing / if it is a directory and must end without a trailing / if it is
  /// a file.
  ///
  /// Here are few examples of how you can use the change request object:
  /// <ol>
  /// <li>
  /// This request adds a single sym file at database root location.
  ///
  /// <code>{ "changeType": "PUT", "s3Path":"s3://bucket/db/sym",
  /// "dbPath":"/"}</code>
  /// </li>
  /// <li>
  /// This request adds files in the given <code>s3Path</code> under the
  /// 2020.01.02 partition of the database.
  ///
  /// <code>{ "changeType": "PUT", "s3Path":"s3://bucket/db/2020.01.02/",
  /// "dbPath":"/2020.01.02/"}</code>
  /// </li>
  /// <li>
  /// This request adds files in the given <code>s3Path</code> under the
  /// <i>taq</i> table partition of the database.
  ///
  /// <code>[ { "changeType": "PUT", "s3Path":"s3://bucket/db/2020.01.02/taq/",
  /// "dbPath":"/2020.01.02/taq/"}]</code>
  /// </li>
  /// <li>
  /// This request deletes the 2020.01.02 partition of the database.
  ///
  /// <code>[{ "changeType": "DELETE", "dbPath": "/2020.01.02/"} ]</code>
  /// </li>
  /// <li>
  /// The <i>DELETE</i> request allows you to delete the existing files under
  /// the 2020.01.02 partition of the database, and the <i>PUT</i> request adds
  /// a new taq table under it.
  ///
  /// <code>[ {"changeType": "DELETE", "dbPath":"/2020.01.02/"}, {"changeType":
  /// "PUT", "s3Path":"s3://bucket/db/2020.01.02/taq/",
  /// "dbPath":"/2020.01.02/taq/"}]</code>
  /// </li> </ol>
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier of the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<CreateKxChangesetResponse> createKxChangeset({
    required List<ChangeRequest> changeRequests,
    required String databaseName,
    required String environmentId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'changeRequests': changeRequests,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/changesets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxChangesetResponse.fromJson(response);
  }

  /// Creates a new kdb cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [azMode] :
  /// The number of availability zones you want to assign per cluster. This can
  /// be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> – Assigns one availability zone per cluster.
  /// </li>
  /// <li>
  /// <code>MULTI</code> – Assigns all the availability zones per cluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterName] :
  /// A unique name for the cluster that you want to create.
  ///
  /// Parameter [clusterType] :
  /// Specifies the type of KDB database that is being created. The following
  /// types are available:
  ///
  /// <ul>
  /// <li>
  /// HDB – A Historical Database. The data is only accessible with read-only
  /// permissions from one of the FinSpace managed kdb databases mounted to the
  /// cluster.
  /// </li>
  /// <li>
  /// RDB – A Realtime Database. This type of database captures all the data
  /// from a ticker plant and stores it in memory until the end of day, after
  /// which it writes all of its data to a disk and reloads the HDB. This
  /// cluster type requires local storage for temporary storage of data during
  /// the savedown process. If you specify this field in your request, you must
  /// provide the <code>savedownStorageConfiguration</code> parameter.
  /// </li>
  /// <li>
  /// GATEWAY – A gateway cluster allows you to access data across processes in
  /// kdb systems. It allows you to create your own routing logic using the
  /// initialization scripts and custom code. This type of cluster does not
  /// require a writable local storage.
  /// </li>
  /// <li>
  /// GP – A general purpose cluster allows you to quickly iterate on code
  /// during development by granting greater access to system commands and
  /// enabling a fast reload of custom code. This cluster type can optionally
  /// mount databases including cache and savedown storage. For this cluster
  /// type, the node count is fixed at 1. It does not support autoscaling and
  /// supports only <code>SINGLE</code> AZ mode.
  /// </li>
  /// <li>
  /// Tickerplant – A tickerplant cluster allows you to subscribe to feed
  /// handlers based on IAM permissions. It can publish to RDBs, other
  /// Tickerplants, and real-time subscribers (RTS). Tickerplants can persist
  /// messages to log, which is readable by any RDB environment. It supports
  /// only single-node that is only one kdb process.
  /// </li>
  /// </ul>
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [releaseLabel] :
  /// The version of FinSpace managed kdb to run.
  ///
  /// Parameter [vpcConfiguration] :
  /// Configuration details about the network where the Privatelink endpoint of
  /// the cluster resides.
  ///
  /// Parameter [autoScalingConfiguration] :
  /// The configuration based on which FinSpace will scale in or scale out nodes
  /// in your cluster.
  ///
  /// Parameter [availabilityZoneId] :
  /// The availability zone identifiers for the requested regions.
  ///
  /// Parameter [cacheStorageConfigurations] :
  /// The configurations for a read only cache storage associated with a
  /// cluster. This cache will be stored as an FSx Lustre that reads from the S3
  /// store.
  ///
  /// Parameter [capacityConfiguration] :
  /// A structure for the metadata of a cluster. It includes information like
  /// the CPUs needed, memory of instances, and number of instances.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [clusterDescription] :
  /// A description of the cluster.
  ///
  /// Parameter [code] :
  /// The details of the custom code that you want to use inside a cluster when
  /// analyzing a data. It consists of the S3 source bucket, location, S3 object
  /// version, and the relative path from where the custom code is loaded into
  /// the cluster.
  ///
  /// Parameter [commandLineArguments] :
  /// Defines the key-value pairs to make them available inside the cluster.
  ///
  /// Parameter [databases] :
  /// A list of databases that will be available for querying.
  ///
  /// Parameter [executionRole] :
  /// An IAM role that defines a set of permissions associated with a cluster.
  /// These permissions are assumed when a cluster attempts to access another
  /// cluster.
  ///
  /// Parameter [initializationScript] :
  /// Specifies a Q program that will be run at launch of a cluster. It is a
  /// relative path within <i>.zip</i> file that contains the custom code, which
  /// will be loaded on the cluster. It must include the file name itself. For
  /// example, <code>somedir/init.q</code>.
  ///
  /// Parameter [savedownStorageConfiguration] :
  /// The size and type of the temporary storage that is used to hold data
  /// during the savedown process. This parameter is required when you choose
  /// <code>clusterType</code> as RDB. All the data written to this storage
  /// space is lost when the cluster node is restarted.
  ///
  /// Parameter [scalingGroupConfiguration] :
  /// The structure that stores the configuration details of a scaling group.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the cluster. You can add up to 50 tags
  /// to a cluster.
  ///
  /// Parameter [tickerplantLogConfiguration] :
  /// A configuration to store Tickerplant logs. It consists of a list of
  /// volumes that will be mounted to your cluster. For the cluster type
  /// <code>Tickerplant</code>, the location of the TP volume on the cluster
  /// will be available by using the global variable
  /// <code>.aws.tp_log_path</code>.
  Future<CreateKxClusterResponse> createKxCluster({
    required KxAzMode azMode,
    required String clusterName,
    required KxClusterType clusterType,
    required String environmentId,
    required String releaseLabel,
    required VpcConfiguration vpcConfiguration,
    AutoScalingConfiguration? autoScalingConfiguration,
    String? availabilityZoneId,
    List<KxCacheStorageConfiguration>? cacheStorageConfigurations,
    CapacityConfiguration? capacityConfiguration,
    String? clientToken,
    String? clusterDescription,
    CodeConfiguration? code,
    List<KxCommandLineArgument>? commandLineArguments,
    List<KxDatabaseConfiguration>? databases,
    String? executionRole,
    String? initializationScript,
    KxSavedownStorageConfiguration? savedownStorageConfiguration,
    KxScalingGroupConfiguration? scalingGroupConfiguration,
    Map<String, String>? tags,
    TickerplantLogConfiguration? tickerplantLogConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'azMode': azMode.toValue(),
      'clusterName': clusterName,
      'clusterType': clusterType.toValue(),
      'releaseLabel': releaseLabel,
      'vpcConfiguration': vpcConfiguration,
      if (autoScalingConfiguration != null)
        'autoScalingConfiguration': autoScalingConfiguration,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (cacheStorageConfigurations != null)
        'cacheStorageConfigurations': cacheStorageConfigurations,
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (clusterDescription != null) 'clusterDescription': clusterDescription,
      if (code != null) 'code': code,
      if (commandLineArguments != null)
        'commandLineArguments': commandLineArguments,
      if (databases != null) 'databases': databases,
      if (executionRole != null) 'executionRole': executionRole,
      if (initializationScript != null)
        'initializationScript': initializationScript,
      if (savedownStorageConfiguration != null)
        'savedownStorageConfiguration': savedownStorageConfiguration,
      if (scalingGroupConfiguration != null)
        'scalingGroupConfiguration': scalingGroupConfiguration,
      if (tags != null) 'tags': tags,
      if (tickerplantLogConfiguration != null)
        'tickerplantLogConfiguration': tickerplantLogConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxClusterResponse.fromJson(response);
  }

  /// Creates a new kdb database in the environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the database.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the kdb database. You can add up to 50
  /// tags to your kdb database
  Future<CreateKxDatabaseResponse> createKxDatabase({
    required String databaseName,
    required String environmentId,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'databaseName': databaseName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxDatabaseResponse.fromJson(response);
  }

  /// Creates a snapshot of kdb database with tiered storage capabilities and a
  /// pre-warmed cache, ready for mounting on kdb clusters. Dataviews are only
  /// available for clusters running on a scaling group. They are not supported
  /// on dedicated clusters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [azMode] :
  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places
  /// dataview in a single AZ.
  ///
  /// Parameter [databaseName] :
  /// The name of the database where you want to create a dataview.
  ///
  /// Parameter [dataviewName] :
  /// A unique identifier for the dataview.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, where you want to create the
  /// dataview.
  ///
  /// Parameter [autoUpdate] :
  /// The option to specify whether you want to apply all the future additions
  /// and corrections automatically to the dataview, when you ingest new
  /// changesets. The default value is false.
  ///
  /// Parameter [availabilityZoneId] :
  /// The identifier of the availability zones.
  ///
  /// Parameter [changesetId] :
  /// A unique identifier of the changeset that you want to use to ingest data.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the dataview.
  ///
  /// Parameter [readWrite] :
  /// The option to specify whether you want to make the dataview writable to
  /// perform database maintenance. The following are some considerations
  /// related to writable dataviews.&#x2028;&#x2028;
  ///
  /// <ul>
  /// <li>
  /// You cannot create partial writable dataviews. When you create writeable
  /// dataviews you must provide the entire database path.
  /// </li>
  /// <li>
  /// You cannot perform updates on a writeable dataview. Hence,
  /// <code>autoUpdate</code> must be set as <b>False</b> if
  /// <code>readWrite</code> is <b>True</b> for a dataview.
  /// </li>
  /// <li>
  /// You must also use a unique volume for creating a writeable dataview. So,
  /// if you choose a volume that is already in use by another dataview, the
  /// dataview creation fails.
  /// </li>
  /// <li>
  /// Once you create a dataview as writeable, you cannot change it to
  /// read-only. So, you cannot update the <code>readWrite</code> parameter
  /// later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [segmentConfigurations] :
  /// The configuration that contains the database path of the data that you
  /// want to place on each selected volume. Each segment must have a unique
  /// database path for each volume. If you do not explicitly specify any
  /// database path for a volume, they are accessible from the cluster through
  /// the default S3/object store segment.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the dataview. You can add up to 50 tags
  /// to a dataview.
  Future<CreateKxDataviewResponse> createKxDataview({
    required KxAzMode azMode,
    required String databaseName,
    required String dataviewName,
    required String environmentId,
    bool? autoUpdate,
    String? availabilityZoneId,
    String? changesetId,
    String? clientToken,
    String? description,
    bool? readWrite,
    List<KxDataviewSegmentConfiguration>? segmentConfigurations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'azMode': azMode.toValue(),
      'dataviewName': dataviewName,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (changesetId != null) 'changesetId': changesetId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (readWrite != null) 'readWrite': readWrite,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/dataviews',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxDataviewResponse.fromJson(response);
  }

  /// Creates a managed kdb environment for the account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key ID to encrypt your data in the FinSpace environment.
  ///
  /// Parameter [name] :
  /// The name of the kdb environment that you want to create.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description for the kdb environment.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the kdb environment. You can add up to
  /// 50 tags to your kdb environment.
  Future<CreateKxEnvironmentResponse> createKxEnvironment({
    required String kmsKeyId,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'kmsKeyId': kmsKeyId,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/kx/environments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxEnvironmentResponse.fromJson(response);
  }

  /// Creates a new scaling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [availabilityZoneId] :
  /// The identifier of the availability zones.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, where you want to create the
  /// scaling group.
  ///
  /// Parameter [hostType] :
  /// The memory and CPU capabilities of the scaling group host on which
  /// FinSpace Managed kdb clusters will be placed.
  ///
  /// You can add one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>kx.sg.4xlarge</code> – The host type with a configuration of 108 GiB
  /// memory and 16 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.8xlarge</code> – The host type with a configuration of 216 GiB
  /// memory and 32 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.16xlarge</code> – The host type with a configuration of 432
  /// GiB memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.32xlarge</code> – The host type with a configuration of 864
  /// GiB memory and 128 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.16xlarge</code> – The host type with a configuration of 1949
  /// GiB memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.24xlarge</code> – The host type with a configuration of 2948
  /// GiB memory and 96 vCPUs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalingGroupName] :
  /// A unique identifier for the kdb scaling group.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the scaling group. You can add up to 50
  /// tags to a scaling group.
  Future<CreateKxScalingGroupResponse> createKxScalingGroup({
    required String availabilityZoneId,
    required String environmentId,
    required String hostType,
    required String scalingGroupName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'availabilityZoneId': availabilityZoneId,
      'hostType': hostType,
      'scalingGroupName': scalingGroupName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/scalingGroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxScalingGroupResponse.fromJson(response);
  }

  /// Creates a user in FinSpace kdb environment with an associated IAM role.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment where you want to create a
  /// user.
  ///
  /// Parameter [iamRole] :
  /// The IAM role ARN that will be associated with the user.
  ///
  /// Parameter [userName] :
  /// A unique identifier for the user.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the user. You can add up to 50 tags to
  /// a user.
  Future<CreateKxUserResponse> createKxUser({
    required String environmentId,
    required String iamRole,
    required String userName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'iamRole': iamRole,
      'userName': userName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/users',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxUserResponse.fromJson(response);
  }

  /// Creates a new volume with a specific amount of throughput and storage
  /// capacity.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [availabilityZoneIds] :
  /// The identifier of the availability zones.
  ///
  /// Parameter [azMode] :
  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places
  /// dataview in a single AZ.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  ///
  /// Parameter [volumeName] :
  /// A unique identifier for the volume.
  ///
  /// Parameter [volumeType] :
  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type. When you select <code>NAS_1</code> volume
  /// type, you must also provide <code>nas1Configuration</code>.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the volume.
  ///
  /// Parameter [nas1Configuration] :
  /// Specifies the configuration for the Network attached storage (NAS_1) file
  /// system volume. This parameter is required when you choose
  /// <code>volumeType</code> as <i>NAS_1</i>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the volume. You can add up to 50 tags
  /// to a volume.
  Future<CreateKxVolumeResponse> createKxVolume({
    required List<String> availabilityZoneIds,
    required KxAzMode azMode,
    required String environmentId,
    required String volumeName,
    required KxVolumeType volumeType,
    String? clientToken,
    String? description,
    KxNAS1Configuration? nas1Configuration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'availabilityZoneIds': availabilityZoneIds,
      'azMode': azMode.toValue(),
      'volumeName': volumeName,
      'volumeType': volumeType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (nas1Configuration != null) 'nas1Configuration': nas1Configuration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/kxvolumes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKxVolumeResponse.fromJson(response);
  }

  /// Delete an FinSpace environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// The identifier for the FinSpace environment.
  @Deprecated('This method will be discontinued.')
  Future<void> deleteEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a kdb cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that you want to delete.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxCluster({
    required String clusterName,
    required String environmentId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified nodes from a cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster, for which you want to delete the nodes.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [nodeId] :
  /// A unique identifier for the node that you want to delete.
  Future<void> deleteKxClusterNode({
    required String clusterName,
    required String environmentId,
    required String nodeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}/nodes/${Uri.encodeComponent(nodeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified database and all of its associated data. This action
  /// is irreversible. You must copy any data out of the database before
  /// deleting it if the data is to be retained.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database that you want to delete.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxDatabase({
    required String databaseName,
    required String environmentId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified dataview. Before deleting a dataview, make sure that
  /// it is not in use by any cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database whose dataview you want to delete.
  ///
  /// Parameter [dataviewName] :
  /// The name of the dataview that you want to delete.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, from where you want to delete
  /// the dataview.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxDataview({
    required String databaseName,
    required String dataviewName,
    required String environmentId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/dataviews/${Uri.encodeComponent(dataviewName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the kdb environment. This action is irreversible. Deleting a kdb
  /// environment will remove all the associated data and any services running
  /// in it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxEnvironment({
    required String environmentId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/kx/environments/${Uri.encodeComponent(environmentId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified scaling group. This action is irreversible. You
  /// cannot delete a scaling group until all the clusters running on it have
  /// been deleted.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, from where you want to delete
  /// the dataview.
  ///
  /// Parameter [scalingGroupName] :
  /// A unique identifier for the kdb scaling group.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxScalingGroup({
    required String environmentId,
    required String scalingGroupName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/scalingGroups/${Uri.encodeComponent(scalingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a user in the specified kdb environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [userName] :
  /// A unique identifier for the user that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxUser({
    required String environmentId,
    required String userName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/users/${Uri.encodeComponent(userName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a volume. You can only delete a volume if it's not attached to a
  /// cluster or a dataview. When a volume is deleted, any data on the volume is
  /// lost. This action is irreversible.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  ///
  /// Parameter [volumeName] :
  /// The name of the volume that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<void> deleteKxVolume({
    required String environmentId,
    required String volumeName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/kxvolumes/${Uri.encodeComponent(volumeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the FinSpace environment object.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentId] :
  /// The identifier of the FinSpace environment.
  @Deprecated('This method will be discontinued.')
  Future<GetEnvironmentResponse> getEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentResponse.fromJson(response);
  }

  /// Returns information about a kdb changeset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [changesetId] :
  /// A unique identifier of the changeset for which you want to retrieve data.
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  Future<GetKxChangesetResponse> getKxChangeset({
    required String changesetId,
    required String databaseName,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/changesets/${Uri.encodeComponent(changesetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxChangesetResponse.fromJson(response);
  }

  /// Retrieves information about a kdb cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that you want to retrieve.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  Future<GetKxClusterResponse> getKxCluster({
    required String clusterName,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxClusterResponse.fromJson(response);
  }

  /// Retrieves a connection string for a user to connect to a kdb cluster. You
  /// must call this API using the same role that you have defined while
  /// creating a user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clusterName] :
  /// A name of the kdb cluster.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  Future<GetKxConnectionStringResponse> getKxConnectionString({
    required String clusterName,
    required String environmentId,
    required String userArn,
  }) async {
    final $query = <String, List<String>>{
      'clusterName': [clusterName],
      'userArn': [userArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/connectionString',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetKxConnectionStringResponse.fromJson(response);
  }

  /// Returns database information for the specified environment ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  Future<GetKxDatabaseResponse> getKxDatabase({
    required String databaseName,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxDatabaseResponse.fromJson(response);
  }

  /// Retrieves details of the dataview.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database where you created the dataview.
  ///
  /// Parameter [dataviewName] :
  /// A unique identifier for the dataview.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, from where you want to
  /// retrieve the dataview details.
  Future<GetKxDataviewResponse> getKxDataview({
    required String databaseName,
    required String dataviewName,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/dataviews/${Uri.encodeComponent(dataviewName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxDataviewResponse.fromJson(response);
  }

  /// Retrieves all the information for the specified kdb environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  Future<GetKxEnvironmentResponse> getKxEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/kx/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxEnvironmentResponse.fromJson(response);
  }

  /// Retrieves details of a scaling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [scalingGroupName] :
  /// A unique identifier for the kdb scaling group.
  Future<GetKxScalingGroupResponse> getKxScalingGroup({
    required String environmentId,
    required String scalingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/scalingGroups/${Uri.encodeComponent(scalingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxScalingGroupResponse.fromJson(response);
  }

  /// Retrieves information about the specified kdb user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [userName] :
  /// A unique identifier for the user.
  Future<GetKxUserResponse> getKxUser({
    required String environmentId,
    required String userName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/users/${Uri.encodeComponent(userName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxUserResponse.fromJson(response);
  }

  /// Retrieves the information about the volume.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  ///
  /// Parameter [volumeName] :
  /// A unique identifier for the volume.
  Future<GetKxVolumeResponse> getKxVolume({
    required String environmentId,
    required String volumeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/kxvolumes/${Uri.encodeComponent(volumeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKxVolumeResponse.fromJson(response);
  }

  /// A list of all of your FinSpace environments.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by FinSpace that specifies where to continue pagination
  /// if a previous request was truncated. To get the next set of pages, pass in
  /// the <code>nextToken</code>nextToken value from the response object of the
  /// previous page call.
  @Deprecated('This method will be discontinued.')
  Future<ListEnvironmentsResponse> listEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environment',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsResponse.fromJson(response);
  }

  /// Returns a list of all the changesets for a database.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxChangesetsResponse> listKxChangesets({
    required String databaseName,
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/changesets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxChangesetsResponse.fromJson(response);
  }

  /// Lists all the nodes in a kdb cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// A unique name for the cluster.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxClusterNodesResponse> listKxClusterNodes({
    required String clusterName,
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}/nodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxClusterNodesResponse.fromJson(response);
  }

  /// Returns a list of clusters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clusterType] :
  /// Specifies the type of KDB database that is being created. The following
  /// types are available:
  ///
  /// <ul>
  /// <li>
  /// HDB – A Historical Database. The data is only accessible with read-only
  /// permissions from one of the FinSpace managed kdb databases mounted to the
  /// cluster.
  /// </li>
  /// <li>
  /// RDB – A Realtime Database. This type of database captures all the data
  /// from a ticker plant and stores it in memory until the end of day, after
  /// which it writes all of its data to a disk and reloads the HDB. This
  /// cluster type requires local storage for temporary storage of data during
  /// the savedown process. If you specify this field in your request, you must
  /// provide the <code>savedownStorageConfiguration</code> parameter.
  /// </li>
  /// <li>
  /// GATEWAY – A gateway cluster allows you to access data across processes in
  /// kdb systems. It allows you to create your own routing logic using the
  /// initialization scripts and custom code. This type of cluster does not
  /// require a writable local storage.
  /// </li>
  /// <li>
  /// GP – A general purpose cluster allows you to quickly iterate on code
  /// during development by granting greater access to system commands and
  /// enabling a fast reload of custom code. This cluster type can optionally
  /// mount databases including cache and savedown storage. For this cluster
  /// type, the node count is fixed at 1. It does not support autoscaling and
  /// supports only <code>SINGLE</code> AZ mode.
  /// </li>
  /// <li>
  /// Tickerplant – A tickerplant cluster allows you to subscribe to feed
  /// handlers based on IAM permissions. It can publish to RDBs, other
  /// Tickerplants, and real-time subscribers (RTS). Tickerplants can persist
  /// messages to log, which is readable by any RDB environment. It supports
  /// only single-node that is only one kdb process.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxClustersResponse> listKxClusters({
    required String environmentId,
    KxClusterType? clusterType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (clusterType != null) 'clusterType': [clusterType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxClustersResponse.fromJson(response);
  }

  /// Returns a list of all the databases in the kdb environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxDatabasesResponse> listKxDatabases({
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxDatabasesResponse.fromJson(response);
  }

  /// Returns a list of all the dataviews in the database.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database where the dataviews were created.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, for which you want to
  /// retrieve a list of dataviews.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxDataviewsResponse> listKxDataviews({
    required String databaseName,
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/dataviews',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxDataviewsResponse.fromJson(response);
  }

  /// Returns a list of kdb environments created in an account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxEnvironmentsResponse> listKxEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/kx/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxEnvironmentsResponse.fromJson(response);
  }

  /// Returns a list of scaling groups in a kdb environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, for which you want to
  /// retrieve a list of scaling groups.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxScalingGroupsResponse> listKxScalingGroups({
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/scalingGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxScalingGroupsResponse.fromJson(response);
  }

  /// Lists all the users in a kdb environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  Future<ListKxUsersResponse> listKxUsers({
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/kx/environments/${Uri.encodeComponent(environmentId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxUsersResponse.fromJson(response);
  }

  /// Lists all the volumes in a kdb environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  ///
  /// Parameter [volumeType] :
  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  Future<ListKxVolumesResponse> listKxVolumes({
    required String environmentId,
    int? maxResults,
    String? nextToken,
    KxVolumeType? volumeType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (volumeType != null) 'volumeType': [volumeType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/kxvolumes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKxVolumesResponse.fromJson(response);
  }

  /// A list of all tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name of the resource.
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

  /// Adds metadata tags to a FinSpace resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the resource.
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

  /// Removes metadata tags from a FinSpace resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// A FinSpace resource from which you want to remove a tag or tags. The value
  /// for this parameter is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag keys (names) of one or more tags to be removed.
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

  /// Update your FinSpace environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// The identifier of the FinSpace environment.
  ///
  /// Parameter [description] :
  /// The description of the environment.
  ///
  /// Parameter [federationMode] :
  /// Authentication mode for the environment.
  ///
  /// <ul>
  /// <li>
  /// <code>FEDERATED</code> - Users access FinSpace through Single Sign On
  /// (SSO) via your Identity provider.
  /// </li>
  /// <li>
  /// <code>LOCAL</code> - Users access FinSpace via email and password managed
  /// within the FinSpace environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the environment.
  @Deprecated('This method will be discontinued.')
  Future<UpdateEnvironmentResponse> updateEnvironment({
    required String environmentId,
    String? description,
    FederationMode? federationMode,
    FederationParameters? federationParameters,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentResponse.fromJson(response);
  }

  /// Allows you to update code configuration on a running cluster. By using
  /// this API you can update the code, the initialization script path, and the
  /// command line arguments for a specific cluster. The configuration that you
  /// want to update will override any existing configurations on the cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier of the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [commandLineArguments] :
  /// Specifies the key-value pairs to make them available inside the cluster.
  ///
  /// You cannot update this parameter for a <code>NO_RESTART</code> deployment.
  ///
  /// Parameter [deploymentConfiguration] :
  /// The configuration that allows you to choose how you want to update the
  /// code on a cluster.
  ///
  /// Parameter [initializationScript] :
  /// Specifies a Q program that will be run at launch of a cluster. It is a
  /// relative path within <i>.zip</i> file that contains the custom code, which
  /// will be loaded on the cluster. It must include the file name itself. For
  /// example, <code>somedir/init.q</code>.
  ///
  /// You cannot update this parameter for a <code>NO_RESTART</code> deployment.
  Future<void> updateKxClusterCodeConfiguration({
    required String clusterName,
    required CodeConfiguration code,
    required String environmentId,
    String? clientToken,
    List<KxCommandLineArgument>? commandLineArguments,
    KxClusterCodeDeploymentConfiguration? deploymentConfiguration,
    String? initializationScript,
  }) async {
    final $payload = <String, dynamic>{
      'code': code,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (commandLineArguments != null)
        'commandLineArguments': commandLineArguments,
      if (deploymentConfiguration != null)
        'deploymentConfiguration': deploymentConfiguration,
      if (initializationScript != null)
        'initializationScript': initializationScript,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}/configuration/code',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the databases mounted on a kdb cluster, which includes the
  /// <code>changesetId</code> and all the dbPaths to be cached. This API does
  /// not allow you to change a database name or add a database if you created a
  /// cluster without one.
  ///
  /// Using this API you can point a cluster to a different changeset and modify
  /// a list of partitions being cached.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// A unique name for the cluster that you want to modify.
  ///
  /// Parameter [databases] :
  /// The structure of databases mounted on the cluster.
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of a kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [deploymentConfiguration] :
  /// The configuration that allows you to choose how you want to update the
  /// databases on a cluster.
  Future<void> updateKxClusterDatabases({
    required String clusterName,
    required List<KxDatabaseConfiguration> databases,
    required String environmentId,
    String? clientToken,
    KxDeploymentConfiguration? deploymentConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'databases': databases,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deploymentConfiguration != null)
        'deploymentConfiguration': deploymentConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/clusters/${Uri.encodeComponent(clusterName)}/configuration/databases',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates information for the given kdb database.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [databaseName] :
  /// The name of the kdb database.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the database.
  Future<UpdateKxDatabaseResponse> updateKxDatabase({
    required String databaseName,
    required String environmentId,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxDatabaseResponse.fromJson(response);
  }

  /// Updates the specified dataview. The dataviews get automatically updated
  /// when any new changesets are ingested. Each update of the dataview creates
  /// a new version, including changeset details and cache configurations
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database.
  ///
  /// Parameter [dataviewName] :
  /// The name of the dataview that you want to update.
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment, where you want to update the
  /// dataview.
  ///
  /// Parameter [changesetId] :
  /// A unique identifier for the changeset.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// The description for a dataview.
  ///
  /// Parameter [segmentConfigurations] :
  /// The configuration that contains the database path of the data that you
  /// want to place on each selected volume. Each segment must have a unique
  /// database path for each volume. If you do not explicitly specify any
  /// database path for a volume, they are accessible from the cluster through
  /// the default S3/object store segment.
  Future<UpdateKxDataviewResponse> updateKxDataview({
    required String databaseName,
    required String dataviewName,
    required String environmentId,
    String? changesetId,
    String? clientToken,
    String? description,
    List<KxDataviewSegmentConfiguration>? segmentConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (changesetId != null) 'changesetId': changesetId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/databases/${Uri.encodeComponent(databaseName)}/dataviews/${Uri.encodeComponent(dataviewName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxDataviewResponse.fromJson(response);
  }

  /// Updates information for the given kdb environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the kdb environment.
  ///
  /// Parameter [name] :
  /// The name of the kdb environment.
  Future<UpdateKxEnvironmentResponse> updateKxEnvironment({
    required String environmentId,
    String? clientToken,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/kx/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxEnvironmentResponse.fromJson(response);
  }

  /// Updates environment network to connect to your internal network by using a
  /// transit gateway. This API supports request to create a transit gateway
  /// attachment from FinSpace VPC to your transit gateway ID and create a
  /// custom Route-53 outbound resolvers.
  ///
  /// Once you send a request to update a network, you cannot change it again.
  /// Network update might require termination of any clusters that are running
  /// in the existing network.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [customDNSConfiguration] :
  /// A list of DNS server name and server IP. This is used to set up Route-53
  /// outbound resolvers.
  ///
  /// Parameter [transitGatewayConfiguration] :
  /// Specifies the transit gateway and network configuration to connect the kdb
  /// environment to an internal network.
  Future<UpdateKxEnvironmentNetworkResponse> updateKxEnvironmentNetwork({
    required String environmentId,
    String? clientToken,
    List<CustomDNSServer>? customDNSConfiguration,
    TransitGatewayConfiguration? transitGatewayConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customDNSConfiguration != null)
        'customDNSConfiguration': customDNSConfiguration,
      if (transitGatewayConfiguration != null)
        'transitGatewayConfiguration': transitGatewayConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/network',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxEnvironmentNetworkResponse.fromJson(response);
  }

  /// Updates the user details. You can only update the IAM role associated with
  /// a user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment.
  ///
  /// Parameter [iamRole] :
  /// The IAM role ARN that is associated with the user.
  ///
  /// Parameter [userName] :
  /// A unique identifier for the user.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  Future<UpdateKxUserResponse> updateKxUser({
    required String environmentId,
    required String iamRole,
    required String userName,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'iamRole': iamRole,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/users/${Uri.encodeComponent(userName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxUserResponse.fromJson(response);
  }

  /// Updates the throughput or capacity of a volume. During the update process,
  /// the filesystem might be unavailable for a few minutes. You can retry any
  /// operations after the update is complete.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [environmentId] :
  /// A unique identifier for the kdb environment where you created the storage
  /// volume.
  ///
  /// Parameter [volumeName] :
  /// A unique identifier for the volume.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A description of the volume.
  ///
  /// Parameter [nas1Configuration] :
  /// Specifies the configuration for the Network attached storage (NAS_1) file
  /// system volume.
  Future<UpdateKxVolumeResponse> updateKxVolume({
    required String environmentId,
    required String volumeName,
    String? clientToken,
    String? description,
    KxNAS1Configuration? nas1Configuration,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (nas1Configuration != null) 'nas1Configuration': nas1Configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/kx/environments/${Uri.encodeComponent(environmentId)}/kxvolumes/${Uri.encodeComponent(volumeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKxVolumeResponse.fromJson(response);
  }
}

/// The configuration based on which FinSpace will scale in or scale out nodes
/// in your cluster.
class AutoScalingConfiguration {
  /// The metric your cluster will track in order to scale in and out. For
  /// example, <code>CPU_UTILIZATION_PERCENTAGE</code> is the average CPU usage
  /// across all the nodes in a cluster.
  final AutoScalingMetric? autoScalingMetric;

  /// The highest number of nodes to scale. This value cannot be greater than 5.
  final int? maxNodeCount;

  /// The desired value of the chosen <code>autoScalingMetric</code>. When the
  /// metric drops below this value, the cluster will scale in. When the metric
  /// goes above this value, the cluster will scale out. You can set the target
  /// value between 1 and 100 percent.
  final double? metricTarget;

  /// The lowest number of nodes to scale. This value must be at least 1 and less
  /// than the <code>maxNodeCount</code>. If the nodes in a cluster belong to
  /// multiple availability zones, then <code>minNodeCount</code> must be at least
  /// 3.
  final int? minNodeCount;

  /// The duration in seconds that FinSpace will wait after a scale in event
  /// before initiating another scaling event.
  final double? scaleInCooldownSeconds;

  /// The duration in seconds that FinSpace will wait after a scale out event
  /// before initiating another scaling event.
  final double? scaleOutCooldownSeconds;

  AutoScalingConfiguration({
    this.autoScalingMetric,
    this.maxNodeCount,
    this.metricTarget,
    this.minNodeCount,
    this.scaleInCooldownSeconds,
    this.scaleOutCooldownSeconds,
  });

  factory AutoScalingConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoScalingConfiguration(
      autoScalingMetric:
          (json['autoScalingMetric'] as String?)?.toAutoScalingMetric(),
      maxNodeCount: json['maxNodeCount'] as int?,
      metricTarget: json['metricTarget'] as double?,
      minNodeCount: json['minNodeCount'] as int?,
      scaleInCooldownSeconds: json['scaleInCooldownSeconds'] as double?,
      scaleOutCooldownSeconds: json['scaleOutCooldownSeconds'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingMetric = this.autoScalingMetric;
    final maxNodeCount = this.maxNodeCount;
    final metricTarget = this.metricTarget;
    final minNodeCount = this.minNodeCount;
    final scaleInCooldownSeconds = this.scaleInCooldownSeconds;
    final scaleOutCooldownSeconds = this.scaleOutCooldownSeconds;
    return {
      if (autoScalingMetric != null)
        'autoScalingMetric': autoScalingMetric.toValue(),
      if (maxNodeCount != null) 'maxNodeCount': maxNodeCount,
      if (metricTarget != null) 'metricTarget': metricTarget,
      if (minNodeCount != null) 'minNodeCount': minNodeCount,
      if (scaleInCooldownSeconds != null)
        'scaleInCooldownSeconds': scaleInCooldownSeconds,
      if (scaleOutCooldownSeconds != null)
        'scaleOutCooldownSeconds': scaleOutCooldownSeconds,
    };
  }
}

enum AutoScalingMetric {
  cpuUtilizationPercentage,
}

extension AutoScalingMetricValueExtension on AutoScalingMetric {
  String toValue() {
    switch (this) {
      case AutoScalingMetric.cpuUtilizationPercentage:
        return 'CPU_UTILIZATION_PERCENTAGE';
    }
  }
}

extension AutoScalingMetricFromString on String {
  AutoScalingMetric toAutoScalingMetric() {
    switch (this) {
      case 'CPU_UTILIZATION_PERCENTAGE':
        return AutoScalingMetric.cpuUtilizationPercentage;
    }
    throw Exception('$this is not known in enum AutoScalingMetric');
  }
}

/// A structure for the metadata of a cluster. It includes information like the
/// CPUs needed, memory of instances, and number of instances.
class CapacityConfiguration {
  /// The number of instances running in a cluster.
  final int? nodeCount;

  /// The type that determines the hardware of the host computer used for your
  /// cluster instance. Each node type offers different memory and storage
  /// capabilities. Choose a node type based on the requirements of the
  /// application or software that you plan to run on your instance.
  ///
  /// You can only specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>kx.s.large</code> – The node type with a configuration of 12 GiB
  /// memory and 2 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.xlarge</code> – The node type with a configuration of 27 GiB
  /// memory and 4 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.2xlarge</code> – The node type with a configuration of 54 GiB
  /// memory and 8 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.4xlarge</code> – The node type with a configuration of 108 GiB
  /// memory and 16 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.8xlarge</code> – The node type with a configuration of 216 GiB
  /// memory and 32 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.16xlarge</code> – The node type with a configuration of 432 GiB
  /// memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.s.32xlarge</code> – The node type with a configuration of 864 GiB
  /// memory and 128 vCPUs.
  /// </li>
  /// </ul>
  final String? nodeType;

  CapacityConfiguration({
    this.nodeCount,
    this.nodeType,
  });

  factory CapacityConfiguration.fromJson(Map<String, dynamic> json) {
    return CapacityConfiguration(
      nodeCount: json['nodeCount'] as int?,
      nodeType: json['nodeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeCount = this.nodeCount;
    final nodeType = this.nodeType;
    return {
      if (nodeCount != null) 'nodeCount': nodeCount,
      if (nodeType != null) 'nodeType': nodeType,
    };
  }
}

/// A list of change request objects.
class ChangeRequest {
  /// Defines the type of change request. A <code>changeType</code> can have the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// PUT – Adds or updates files in a database.
  /// </li>
  /// <li>
  /// DELETE – Deletes files in a database.
  /// </li>
  /// </ul>
  final ChangeType changeType;

  /// Defines the path within the database directory.
  final String dbPath;

  /// Defines the S3 path of the source file that is required to add or update
  /// files in a database.
  final String? s3Path;

  ChangeRequest({
    required this.changeType,
    required this.dbPath,
    this.s3Path,
  });

  factory ChangeRequest.fromJson(Map<String, dynamic> json) {
    return ChangeRequest(
      changeType: (json['changeType'] as String).toChangeType(),
      dbPath: json['dbPath'] as String,
      s3Path: json['s3Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeType = this.changeType;
    final dbPath = this.dbPath;
    final s3Path = this.s3Path;
    return {
      'changeType': changeType.toValue(),
      'dbPath': dbPath,
      if (s3Path != null) 's3Path': s3Path,
    };
  }
}

enum ChangeType {
  put,
  delete,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.put:
        return 'PUT';
      case ChangeType.delete:
        return 'DELETE';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'PUT':
        return ChangeType.put;
      case 'DELETE':
        return ChangeType.delete;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

enum ChangesetStatus {
  pending,
  processing,
  failed,
  completed,
}

extension ChangesetStatusValueExtension on ChangesetStatus {
  String toValue() {
    switch (this) {
      case ChangesetStatus.pending:
        return 'PENDING';
      case ChangesetStatus.processing:
        return 'PROCESSING';
      case ChangesetStatus.failed:
        return 'FAILED';
      case ChangesetStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension ChangesetStatusFromString on String {
  ChangesetStatus toChangesetStatus() {
    switch (this) {
      case 'PENDING':
        return ChangesetStatus.pending;
      case 'PROCESSING':
        return ChangesetStatus.processing;
      case 'FAILED':
        return ChangesetStatus.failed;
      case 'COMPLETED':
        return ChangesetStatus.completed;
    }
    throw Exception('$this is not known in enum ChangesetStatus');
  }
}

/// The structure of the customer code available within the running cluster.
class CodeConfiguration {
  /// A unique name for the S3 bucket.
  final String? s3Bucket;

  /// The full S3 path (excluding bucket) to the .zip file. This file contains the
  /// code that is loaded onto the cluster when it's started.
  final String? s3Key;

  /// The version of an S3 object.
  final String? s3ObjectVersion;

  CodeConfiguration({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
  });

  factory CodeConfiguration.fromJson(Map<String, dynamic> json) {
    return CodeConfiguration(
      s3Bucket: json['s3Bucket'] as String?,
      s3Key: json['s3Key'] as String?,
      s3ObjectVersion: json['s3ObjectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Key != null) 's3Key': s3Key,
      if (s3ObjectVersion != null) 's3ObjectVersion': s3ObjectVersion,
    };
  }
}

class CreateEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the FinSpace environment that you created.
  final String? environmentArn;

  /// The unique identifier for FinSpace environment that you created.
  final String? environmentId;

  /// The sign-in URL for the web application of the FinSpace environment you
  /// created.
  final String? environmentUrl;

  CreateEnvironmentResponse({
    this.environmentArn,
    this.environmentId,
    this.environmentUrl,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentUrl: json['environmentUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentUrl = this.environmentUrl;
    return {
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentUrl != null) 'environmentUrl': environmentUrl,
    };
  }
}

class CreateKxChangesetResponse {
  /// A list of change requests.
  final List<ChangeRequest>? changeRequests;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the changeset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the kdb database.
  final String? databaseName;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The details of the error that you receive when creating a changeset. It
  /// consists of the type of error and the error message.
  final ErrorInfo? errorInfo;

  /// The timestamp at which the changeset was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Status of the changeset creation process.
  ///
  /// <ul>
  /// <li>
  /// Pending – Changeset creation is pending.
  /// </li>
  /// <li>
  /// Processing – Changeset creation is running.
  /// </li>
  /// <li>
  /// Failed – Changeset creation has failed.
  /// </li>
  /// <li>
  /// Complete – Changeset creation has succeeded.
  /// </li>
  /// </ul>
  final ChangesetStatus? status;

  CreateKxChangesetResponse({
    this.changeRequests,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.environmentId,
    this.errorInfo,
    this.lastModifiedTimestamp,
    this.status,
  });

  factory CreateKxChangesetResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxChangesetResponse(
      changeRequests: (json['changeRequests'] as List?)
          ?.whereNotNull()
          .map((e) => ChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      environmentId: json['environmentId'] as String?,
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      status: (json['status'] as String?)?.toChangesetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeRequests = this.changeRequests;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final environmentId = this.environmentId;
    final errorInfo = this.errorInfo;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final status = this.status;
    return {
      if (changeRequests != null) 'changeRequests': changeRequests,
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateKxClusterResponse {
  /// The configuration based on which FinSpace will scale in or scale out nodes
  /// in your cluster.
  final AutoScalingConfiguration? autoScalingConfiguration;

  /// The availability zone identifiers for the requested regions.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per cluster. This can be
  /// one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> – Assigns one availability zone per cluster.
  /// </li>
  /// <li>
  /// <code>MULTI</code> – Assigns all the availability zones per cluster.
  /// </li>
  /// </ul>
  final KxAzMode? azMode;

  /// The configurations for a read only cache storage associated with a cluster.
  /// This cache will be stored as an FSx Lustre that reads from the S3 store.
  final List<KxCacheStorageConfiguration>? cacheStorageConfigurations;

  /// A structure for the metadata of a cluster. It includes information like the
  /// CPUs needed, memory of instances, and number of instances.
  final CapacityConfiguration? capacityConfiguration;

  /// A description of the cluster.
  final String? clusterDescription;

  /// A unique name for the cluster.
  final String? clusterName;

  /// Specifies the type of KDB database that is being created. The following
  /// types are available:
  ///
  /// <ul>
  /// <li>
  /// HDB – A Historical Database. The data is only accessible with read-only
  /// permissions from one of the FinSpace managed kdb databases mounted to the
  /// cluster.
  /// </li>
  /// <li>
  /// RDB – A Realtime Database. This type of database captures all the data from
  /// a ticker plant and stores it in memory until the end of day, after which it
  /// writes all of its data to a disk and reloads the HDB. This cluster type
  /// requires local storage for temporary storage of data during the savedown
  /// process. If you specify this field in your request, you must provide the
  /// <code>savedownStorageConfiguration</code> parameter.
  /// </li>
  /// <li>
  /// GATEWAY – A gateway cluster allows you to access data across processes in
  /// kdb systems. It allows you to create your own routing logic using the
  /// initialization scripts and custom code. This type of cluster does not
  /// require a writable local storage.
  /// </li>
  /// <li>
  /// GP – A general purpose cluster allows you to quickly iterate on code during
  /// development by granting greater access to system commands and enabling a
  /// fast reload of custom code. This cluster type can optionally mount databases
  /// including cache and savedown storage. For this cluster type, the node count
  /// is fixed at 1. It does not support autoscaling and supports only
  /// <code>SINGLE</code> AZ mode.
  /// </li>
  /// <li>
  /// Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers
  /// based on IAM permissions. It can publish to RDBs, other Tickerplants, and
  /// real-time subscribers (RTS). Tickerplants can persist messages to log, which
  /// is readable by any RDB environment. It supports only single-node that is
  /// only one kdb process.
  /// </li>
  /// </ul>
  final KxClusterType? clusterType;

  /// The details of the custom code that you want to use inside a cluster when
  /// analyzing a data. It consists of the S3 source bucket, location, S3 object
  /// version, and the relative path from where the custom code is loaded into the
  /// cluster.
  final CodeConfiguration? code;

  /// Defines the key-value pairs to make them available inside the cluster.
  final List<KxCommandLineArgument>? commandLineArguments;

  /// The timestamp at which the cluster was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A list of databases that will be available for querying.
  final List<KxDatabaseConfiguration>? databases;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// An IAM role that defines a set of permissions associated with a cluster.
  /// These permissions are assumed when a cluster attempts to access another
  /// cluster.
  final String? executionRole;

  /// Specifies a Q program that will be run at launch of a cluster. It is a
  /// relative path within <i>.zip</i> file that contains the custom code, which
  /// will be loaded on the cluster. It must include the file name itself. For
  /// example, <code>somedir/init.q</code>.
  final String? initializationScript;

  /// The last time that the cluster was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// A version of the FinSpace managed kdb to run.
  final String? releaseLabel;

  /// The size and type of the temporary storage that is used to hold data during
  /// the savedown process. This parameter is required when you choose
  /// <code>clusterType</code> as RDB. All the data written to this storage space
  /// is lost when the cluster node is restarted.
  final KxSavedownStorageConfiguration? savedownStorageConfiguration;

  /// The structure that stores the configuration details of a scaling group.
  final KxScalingGroupConfiguration? scalingGroupConfiguration;

  /// The status of cluster creation.
  ///
  /// <ul>
  /// <li>
  /// PENDING – The cluster is pending creation.
  /// </li>
  /// <li>
  /// CREATING – The cluster creation process is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The cluster creation process has failed.
  /// </li>
  /// <li>
  /// RUNNING – The cluster creation process is running.
  /// </li>
  /// <li>
  /// UPDATING – The cluster is in the process of being updated.
  /// </li>
  /// <li>
  /// DELETING – The cluster is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETED – The cluster has been deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The cluster failed to delete.
  /// </li>
  /// </ul>
  final KxClusterStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;
  final TickerplantLogConfiguration? tickerplantLogConfiguration;

  /// A list of volumes mounted on the cluster.
  final List<Volume>? volumes;

  /// Configuration details about the network where the Privatelink endpoint of
  /// the cluster resides.
  final VpcConfiguration? vpcConfiguration;

  CreateKxClusterResponse({
    this.autoScalingConfiguration,
    this.availabilityZoneId,
    this.azMode,
    this.cacheStorageConfigurations,
    this.capacityConfiguration,
    this.clusterDescription,
    this.clusterName,
    this.clusterType,
    this.code,
    this.commandLineArguments,
    this.createdTimestamp,
    this.databases,
    this.environmentId,
    this.executionRole,
    this.initializationScript,
    this.lastModifiedTimestamp,
    this.releaseLabel,
    this.savedownStorageConfiguration,
    this.scalingGroupConfiguration,
    this.status,
    this.statusReason,
    this.tickerplantLogConfiguration,
    this.volumes,
    this.vpcConfiguration,
  });

  factory CreateKxClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxClusterResponse(
      autoScalingConfiguration: json['autoScalingConfiguration'] != null
          ? AutoScalingConfiguration.fromJson(
              json['autoScalingConfiguration'] as Map<String, dynamic>)
          : null,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      cacheStorageConfigurations: (json['cacheStorageConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxCacheStorageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityConfiguration: json['capacityConfiguration'] != null
          ? CapacityConfiguration.fromJson(
              json['capacityConfiguration'] as Map<String, dynamic>)
          : null,
      clusterDescription: json['clusterDescription'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType: (json['clusterType'] as String?)?.toKxClusterType(),
      code: json['code'] != null
          ? CodeConfiguration.fromJson(json['code'] as Map<String, dynamic>)
          : null,
      commandLineArguments: (json['commandLineArguments'] as List?)
          ?.whereNotNull()
          .map((e) => KxCommandLineArgument.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databases: (json['databases'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDatabaseConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentId: json['environmentId'] as String?,
      executionRole: json['executionRole'] as String?,
      initializationScript: json['initializationScript'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      releaseLabel: json['releaseLabel'] as String?,
      savedownStorageConfiguration: json['savedownStorageConfiguration'] != null
          ? KxSavedownStorageConfiguration.fromJson(
              json['savedownStorageConfiguration'] as Map<String, dynamic>)
          : null,
      scalingGroupConfiguration: json['scalingGroupConfiguration'] != null
          ? KxScalingGroupConfiguration.fromJson(
              json['scalingGroupConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toKxClusterStatus(),
      statusReason: json['statusReason'] as String?,
      tickerplantLogConfiguration: json['tickerplantLogConfiguration'] != null
          ? TickerplantLogConfiguration.fromJson(
              json['tickerplantLogConfiguration'] as Map<String, dynamic>)
          : null,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final cacheStorageConfigurations = this.cacheStorageConfigurations;
    final capacityConfiguration = this.capacityConfiguration;
    final clusterDescription = this.clusterDescription;
    final clusterName = this.clusterName;
    final clusterType = this.clusterType;
    final code = this.code;
    final commandLineArguments = this.commandLineArguments;
    final createdTimestamp = this.createdTimestamp;
    final databases = this.databases;
    final environmentId = this.environmentId;
    final executionRole = this.executionRole;
    final initializationScript = this.initializationScript;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final releaseLabel = this.releaseLabel;
    final savedownStorageConfiguration = this.savedownStorageConfiguration;
    final scalingGroupConfiguration = this.scalingGroupConfiguration;
    final status = this.status;
    final statusReason = this.statusReason;
    final tickerplantLogConfiguration = this.tickerplantLogConfiguration;
    final volumes = this.volumes;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (autoScalingConfiguration != null)
        'autoScalingConfiguration': autoScalingConfiguration,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (cacheStorageConfigurations != null)
        'cacheStorageConfigurations': cacheStorageConfigurations,
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      if (clusterDescription != null) 'clusterDescription': clusterDescription,
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterType != null) 'clusterType': clusterType.toValue(),
      if (code != null) 'code': code,
      if (commandLineArguments != null)
        'commandLineArguments': commandLineArguments,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databases != null) 'databases': databases,
      if (environmentId != null) 'environmentId': environmentId,
      if (executionRole != null) 'executionRole': executionRole,
      if (initializationScript != null)
        'initializationScript': initializationScript,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (savedownStorageConfiguration != null)
        'savedownStorageConfiguration': savedownStorageConfiguration,
      if (scalingGroupConfiguration != null)
        'scalingGroupConfiguration': scalingGroupConfiguration,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (tickerplantLogConfiguration != null)
        'tickerplantLogConfiguration': tickerplantLogConfiguration,
      if (volumes != null) 'volumes': volumes,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

class CreateKxDatabaseResponse {
  /// The timestamp at which the database is created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The ARN identifier of the database.
  final String? databaseArn;

  /// The name of the kdb database.
  final String? databaseName;

  /// A description of the database.
  final String? description;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The last time that the database was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  CreateKxDatabaseResponse({
    this.createdTimestamp,
    this.databaseArn,
    this.databaseName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
  });

  factory CreateKxDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxDatabaseResponse(
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseArn: json['databaseArn'] as String?,
      databaseName: json['databaseName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final databaseArn = this.databaseArn;
    final databaseName = this.databaseName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    return {
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseArn != null) 'databaseArn': databaseArn,
      if (databaseName != null) 'databaseName': databaseName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
    };
  }
}

class CreateKxDataviewResponse {
  /// The option to select whether you want to apply all the future additions and
  /// corrections automatically to the dataview when you ingest new changesets.
  /// The default value is false.
  final bool? autoUpdate;

  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the dataview was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the database where you want to create a dataview.
  final String? databaseName;

  /// A unique identifier for the dataview.
  final String? dataviewName;

  /// A description of the dataview.
  final String? description;

  /// A unique identifier for the kdb environment, where you want to create the
  /// dataview.
  final String? environmentId;

  /// The last time that the dataview was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Returns True if the dataview is created as writeable and False otherwise.
  final bool? readWrite;

  /// The configuration that contains the database path of the data that you want
  /// to place on each selected volume. Each segment must have a unique database
  /// path for each volume. If you do not explicitly specify any database path for
  /// a volume, they are accessible from the cluster through the default S3/object
  /// store segment.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  /// The status of dataview creation.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The dataview creation is in progress.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> – The dataview is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> – The dataview is active.
  /// </li>
  /// </ul>
  final KxDataviewStatus? status;

  CreateKxDataviewResponse({
    this.autoUpdate,
    this.availabilityZoneId,
    this.azMode,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.dataviewName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.readWrite,
    this.segmentConfigurations,
    this.status,
  });

  factory CreateKxDataviewResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxDataviewResponse(
      autoUpdate: json['autoUpdate'] as bool?,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      dataviewName: json['dataviewName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      readWrite: json['readWrite'] as bool?,
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toKxDataviewStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpdate = this.autoUpdate;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final dataviewName = this.dataviewName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final readWrite = this.readWrite;
    final segmentConfigurations = this.segmentConfigurations;
    final status = this.status;
    return {
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (dataviewName != null) 'dataviewName': dataviewName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (readWrite != null) 'readWrite': readWrite,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateKxEnvironmentResponse {
  /// The timestamp at which the kdb environment was created in FinSpace.
  final DateTime? creationTimestamp;

  /// A description for the kdb environment.
  final String? description;

  /// The ARN identifier of the environment.
  final String? environmentArn;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The KMS key ID to encrypt your data in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the kdb environment.
  final String? name;

  /// The status of the kdb environment.
  final EnvironmentStatus? status;

  CreateKxEnvironmentResponse({
    this.creationTimestamp,
    this.description,
    this.environmentArn,
    this.environmentId,
    this.kmsKeyId,
    this.name,
    this.status,
  });

  factory CreateKxEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxEnvironmentResponse(
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      description: json['description'] as String?,
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final status = this.status;
    return {
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (description != null) 'description': description,
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateKxScalingGroupResponse {
  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The timestamp at which the scaling group was created in FinSpace. The value
  /// is determined as epoch time in milliseconds. For example, the value for
  /// Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A unique identifier for the kdb environment, where you create the scaling
  /// group.
  final String? environmentId;

  /// The memory and CPU capabilities of the scaling group host on which FinSpace
  /// Managed kdb clusters will be placed.
  final String? hostType;

  /// The last time that the scaling group was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// A unique identifier for the kdb scaling group.
  final String? scalingGroupName;

  /// The status of scaling group.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The scaling group creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The scaling group creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The scaling group is active.
  /// </li>
  /// <li>
  /// UPDATING – The scaling group is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// DELETING – The scaling group is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the scaling group.
  /// </li>
  /// <li>
  /// DELETED – The scaling group is successfully deleted.
  /// </li>
  /// </ul>
  final KxScalingGroupStatus? status;

  CreateKxScalingGroupResponse({
    this.availabilityZoneId,
    this.createdTimestamp,
    this.environmentId,
    this.hostType,
    this.lastModifiedTimestamp,
    this.scalingGroupName,
    this.status,
  });

  factory CreateKxScalingGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxScalingGroupResponse(
      availabilityZoneId: json['availabilityZoneId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      environmentId: json['environmentId'] as String?,
      hostType: json['hostType'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      scalingGroupName: json['scalingGroupName'] as String?,
      status: (json['status'] as String?)?.toKxScalingGroupStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final createdTimestamp = this.createdTimestamp;
    final environmentId = this.environmentId;
    final hostType = this.hostType;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final scalingGroupName = this.scalingGroupName;
    final status = this.status;
    return {
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (environmentId != null) 'environmentId': environmentId,
      if (hostType != null) 'hostType': hostType,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (scalingGroupName != null) 'scalingGroupName': scalingGroupName,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateKxUserResponse {
  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The IAM role ARN that will be associated with the user.
  final String? iamRole;

  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String? userArn;

  /// A unique identifier for the user.
  final String? userName;

  CreateKxUserResponse({
    this.environmentId,
    this.iamRole,
    this.userArn,
    this.userName,
  });

  factory CreateKxUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxUserResponse(
      environmentId: json['environmentId'] as String?,
      iamRole: json['iamRole'] as String?,
      userArn: json['userArn'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final iamRole = this.iamRole;
    final userArn = this.userArn;
    final userName = this.userName;
    return {
      if (environmentId != null) 'environmentId': environmentId,
      if (iamRole != null) 'iamRole': iamRole,
      if (userArn != null) 'userArn': userArn,
      if (userName != null) 'userName': userName,
    };
  }
}

class CreateKxVolumeResponse {
  /// The identifier of the availability zones.
  final List<String>? availabilityZoneIds;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// The timestamp at which the volume was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A description of the volume.
  final String? description;

  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  final String? environmentId;

  /// Specifies the configuration for the Network attached storage (NAS_1) file
  /// system volume.
  final KxNAS1Configuration? nas1Configuration;

  /// The status of volume creation.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The volume creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The volume creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The volume is active.
  /// </li>
  /// <li>
  /// UPDATING – The volume is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// UPDATED – The volume is successfully updated.
  /// </li>
  /// <li>
  /// DELETING – The volume is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the volume.
  /// </li>
  /// <li>
  /// DELETED – The volume is successfully deleted.
  /// </li>
  /// </ul>
  final KxVolumeStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  /// The ARN identifier of the volume.
  final String? volumeArn;

  /// A unique identifier for the volume.
  final String? volumeName;

  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  final KxVolumeType? volumeType;

  CreateKxVolumeResponse({
    this.availabilityZoneIds,
    this.azMode,
    this.createdTimestamp,
    this.description,
    this.environmentId,
    this.nas1Configuration,
    this.status,
    this.statusReason,
    this.volumeArn,
    this.volumeName,
    this.volumeType,
  });

  factory CreateKxVolumeResponse.fromJson(Map<String, dynamic> json) {
    return CreateKxVolumeResponse(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      nas1Configuration: json['nas1Configuration'] != null
          ? KxNAS1Configuration.fromJson(
              json['nas1Configuration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toKxVolumeStatus(),
      statusReason: json['statusReason'] as String?,
      volumeArn: json['volumeArn'] as String?,
      volumeName: json['volumeName'] as String?,
      volumeType: (json['volumeType'] as String?)?.toKxVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final azMode = this.azMode;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final environmentId = this.environmentId;
    final nas1Configuration = this.nas1Configuration;
    final status = this.status;
    final statusReason = this.statusReason;
    final volumeArn = this.volumeArn;
    final volumeName = this.volumeName;
    final volumeType = this.volumeType;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (nas1Configuration != null) 'nas1Configuration': nas1Configuration,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (volumeArn != null) 'volumeArn': volumeArn,
      if (volumeName != null) 'volumeName': volumeName,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

/// A list of DNS server name and server IP. This is used to set up Route-53
/// outbound resolvers.
class CustomDNSServer {
  /// The IP address of the DNS server.
  final String customDNSServerIP;

  /// The name of the DNS server.
  final String customDNSServerName;

  CustomDNSServer({
    required this.customDNSServerIP,
    required this.customDNSServerName,
  });

  factory CustomDNSServer.fromJson(Map<String, dynamic> json) {
    return CustomDNSServer(
      customDNSServerIP: json['customDNSServerIP'] as String,
      customDNSServerName: json['customDNSServerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final customDNSServerIP = this.customDNSServerIP;
    final customDNSServerName = this.customDNSServerName;
    return {
      'customDNSServerIP': customDNSServerIP,
      'customDNSServerName': customDNSServerName,
    };
  }
}

class DeleteEnvironmentResponse {
  DeleteEnvironmentResponse();

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxClusterNodeResponse {
  DeleteKxClusterNodeResponse();

  factory DeleteKxClusterNodeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxClusterNodeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxClusterResponse {
  DeleteKxClusterResponse();

  factory DeleteKxClusterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxClusterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxDatabaseResponse {
  DeleteKxDatabaseResponse();

  factory DeleteKxDatabaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxDatabaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxDataviewResponse {
  DeleteKxDataviewResponse();

  factory DeleteKxDataviewResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxDataviewResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxEnvironmentResponse {
  DeleteKxEnvironmentResponse();

  factory DeleteKxEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxScalingGroupResponse {
  DeleteKxScalingGroupResponse();

  factory DeleteKxScalingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxScalingGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxUserResponse {
  DeleteKxUserResponse();

  factory DeleteKxUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKxVolumeResponse {
  DeleteKxVolumeResponse();

  factory DeleteKxVolumeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKxVolumeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an FinSpace environment.
class Environment {
  /// The ID of the AWS account in which the FinSpace environment is created.
  final String? awsAccountId;

  /// The AWS account ID of the dedicated service account associated with your
  /// FinSpace environment.
  final String? dedicatedServiceAccountId;

  /// The description of the FinSpace environment.
  final String? description;

  /// The Amazon Resource Name (ARN) of your FinSpace environment.
  final String? environmentArn;

  /// The identifier of the FinSpace environment.
  final String? environmentId;

  /// The sign-in URL for the web application of your FinSpace environment.
  final String? environmentUrl;

  /// The authentication mode for the environment.
  final FederationMode? federationMode;

  /// Configuration information when authentication mode is FEDERATED.
  final FederationParameters? federationParameters;

  /// The KMS key id used to encrypt in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the FinSpace environment.
  final String? name;

  /// The URL of the integrated FinSpace notebook environment in your web
  /// application.
  final String? sageMakerStudioDomainUrl;

  /// The current status of creation of the FinSpace environment.
  final EnvironmentStatus? status;

  Environment({
    this.awsAccountId,
    this.dedicatedServiceAccountId,
    this.description,
    this.environmentArn,
    this.environmentId,
    this.environmentUrl,
    this.federationMode,
    this.federationParameters,
    this.kmsKeyId,
    this.name,
    this.sageMakerStudioDomainUrl,
    this.status,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      awsAccountId: json['awsAccountId'] as String?,
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentUrl: json['environmentUrl'] as String?,
      federationMode: (json['federationMode'] as String?)?.toFederationMode(),
      federationParameters: json['federationParameters'] != null
          ? FederationParameters.fromJson(
              json['federationParameters'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      sageMakerStudioDomainUrl: json['sageMakerStudioDomainUrl'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentUrl = this.environmentUrl;
    final federationMode = this.federationMode;
    final federationParameters = this.federationParameters;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final sageMakerStudioDomainUrl = this.sageMakerStudioDomainUrl;
    final status = this.status;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentUrl != null) 'environmentUrl': environmentUrl,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (sageMakerStudioDomainUrl != null)
        'sageMakerStudioDomainUrl': sageMakerStudioDomainUrl,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum EnvironmentStatus {
  createRequested,
  creating,
  created,
  deleteRequested,
  deleting,
  deleted,
  failedCreation,
  retryDeletion,
  failedDeletion,
  updateNetworkRequested,
  updatingNetwork,
  failedUpdatingNetwork,
  suspended,
}

extension EnvironmentStatusValueExtension on EnvironmentStatus {
  String toValue() {
    switch (this) {
      case EnvironmentStatus.createRequested:
        return 'CREATE_REQUESTED';
      case EnvironmentStatus.creating:
        return 'CREATING';
      case EnvironmentStatus.created:
        return 'CREATED';
      case EnvironmentStatus.deleteRequested:
        return 'DELETE_REQUESTED';
      case EnvironmentStatus.deleting:
        return 'DELETING';
      case EnvironmentStatus.deleted:
        return 'DELETED';
      case EnvironmentStatus.failedCreation:
        return 'FAILED_CREATION';
      case EnvironmentStatus.retryDeletion:
        return 'RETRY_DELETION';
      case EnvironmentStatus.failedDeletion:
        return 'FAILED_DELETION';
      case EnvironmentStatus.updateNetworkRequested:
        return 'UPDATE_NETWORK_REQUESTED';
      case EnvironmentStatus.updatingNetwork:
        return 'UPDATING_NETWORK';
      case EnvironmentStatus.failedUpdatingNetwork:
        return 'FAILED_UPDATING_NETWORK';
      case EnvironmentStatus.suspended:
        return 'SUSPENDED';
    }
  }
}

extension EnvironmentStatusFromString on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'CREATE_REQUESTED':
        return EnvironmentStatus.createRequested;
      case 'CREATING':
        return EnvironmentStatus.creating;
      case 'CREATED':
        return EnvironmentStatus.created;
      case 'DELETE_REQUESTED':
        return EnvironmentStatus.deleteRequested;
      case 'DELETING':
        return EnvironmentStatus.deleting;
      case 'DELETED':
        return EnvironmentStatus.deleted;
      case 'FAILED_CREATION':
        return EnvironmentStatus.failedCreation;
      case 'RETRY_DELETION':
        return EnvironmentStatus.retryDeletion;
      case 'FAILED_DELETION':
        return EnvironmentStatus.failedDeletion;
      case 'UPDATE_NETWORK_REQUESTED':
        return EnvironmentStatus.updateNetworkRequested;
      case 'UPDATING_NETWORK':
        return EnvironmentStatus.updatingNetwork;
      case 'FAILED_UPDATING_NETWORK':
        return EnvironmentStatus.failedUpdatingNetwork;
      case 'SUSPENDED':
        return EnvironmentStatus.suspended;
    }
    throw Exception('$this is not known in enum EnvironmentStatus');
  }
}

enum ErrorDetails {
  theInputsToThisRequestAreInvalid,
  serviceLimitsHaveBeenExceeded,
  missingRequiredPermissionToPerformThisRequest,
  oneOrMoreInputsToThisRequestWereNotFound,
  theSystemTemporarilyLacksSufficientResourcesToProcessTheRequest,
  anInternalErrorHasOccurred,
  cancelled,
  aUserRecoverableErrorHasOccurred,
}

extension ErrorDetailsValueExtension on ErrorDetails {
  String toValue() {
    switch (this) {
      case ErrorDetails.theInputsToThisRequestAreInvalid:
        return 'The inputs to this request are invalid.';
      case ErrorDetails.serviceLimitsHaveBeenExceeded:
        return 'Service limits have been exceeded.';
      case ErrorDetails.missingRequiredPermissionToPerformThisRequest:
        return 'Missing required permission to perform this request.';
      case ErrorDetails.oneOrMoreInputsToThisRequestWereNotFound:
        return 'One or more inputs to this request were not found.';
      case ErrorDetails
            .theSystemTemporarilyLacksSufficientResourcesToProcessTheRequest:
        return 'The system temporarily lacks sufficient resources to process the request.';
      case ErrorDetails.anInternalErrorHasOccurred:
        return 'An internal error has occurred.';
      case ErrorDetails.cancelled:
        return 'Cancelled';
      case ErrorDetails.aUserRecoverableErrorHasOccurred:
        return 'A user recoverable error has occurred';
    }
  }
}

extension ErrorDetailsFromString on String {
  ErrorDetails toErrorDetails() {
    switch (this) {
      case 'The inputs to this request are invalid.':
        return ErrorDetails.theInputsToThisRequestAreInvalid;
      case 'Service limits have been exceeded.':
        return ErrorDetails.serviceLimitsHaveBeenExceeded;
      case 'Missing required permission to perform this request.':
        return ErrorDetails.missingRequiredPermissionToPerformThisRequest;
      case 'One or more inputs to this request were not found.':
        return ErrorDetails.oneOrMoreInputsToThisRequestWereNotFound;
      case 'The system temporarily lacks sufficient resources to process the request.':
        return ErrorDetails
            .theSystemTemporarilyLacksSufficientResourcesToProcessTheRequest;
      case 'An internal error has occurred.':
        return ErrorDetails.anInternalErrorHasOccurred;
      case 'Cancelled':
        return ErrorDetails.cancelled;
      case 'A user recoverable error has occurred':
        return ErrorDetails.aUserRecoverableErrorHasOccurred;
    }
    throw Exception('$this is not known in enum ErrorDetails');
  }
}

/// Provides details in the event of a failed flow, including the error type and
/// the related error message.
class ErrorInfo {
  /// Specifies the error message that appears if a flow fails.
  final String? errorMessage;

  /// Specifies the type of error.
  final ErrorDetails? errorType;

  ErrorInfo({
    this.errorMessage,
    this.errorType,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      errorMessage: json['errorMessage'] as String?,
      errorType: (json['errorType'] as String?)?.toErrorDetails(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorType != null) 'errorType': errorType.toValue(),
    };
  }
}

enum FederationMode {
  federated,
  local,
}

extension FederationModeValueExtension on FederationMode {
  String toValue() {
    switch (this) {
      case FederationMode.federated:
        return 'FEDERATED';
      case FederationMode.local:
        return 'LOCAL';
    }
  }
}

extension FederationModeFromString on String {
  FederationMode toFederationMode() {
    switch (this) {
      case 'FEDERATED':
        return FederationMode.federated;
      case 'LOCAL':
        return FederationMode.local;
    }
    throw Exception('$this is not known in enum FederationMode');
  }
}

/// Configuration information when authentication mode is FEDERATED.
class FederationParameters {
  /// The redirect or sign-in URL that should be entered into the SAML 2.0
  /// compliant identity provider configuration (IdP).
  final String? applicationCallBackURL;

  /// SAML attribute name and value. The name must always be <code>Email</code>
  /// and the value should be set to the attribute definition in which user email
  /// is set. For example, name would be <code>Email</code> and value
  /// <code>http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress</code>.
  /// Please check your SAML 2.0 compliant identity provider (IdP) documentation
  /// for details.
  final Map<String, String>? attributeMap;

  /// Name of the identity provider (IdP).
  final String? federationProviderName;

  /// The Uniform Resource Name (URN). Also referred as Service Provider URN or
  /// Audience URI or Service Provider Entity ID.
  final String? federationURN;

  /// SAML 2.0 Metadata document from identity provider (IdP).
  final String? samlMetadataDocument;

  /// Provide the metadata URL from your SAML 2.0 compliant identity provider
  /// (IdP).
  final String? samlMetadataURL;

  FederationParameters({
    this.applicationCallBackURL,
    this.attributeMap,
    this.federationProviderName,
    this.federationURN,
    this.samlMetadataDocument,
    this.samlMetadataURL,
  });

  factory FederationParameters.fromJson(Map<String, dynamic> json) {
    return FederationParameters(
      applicationCallBackURL: json['applicationCallBackURL'] as String?,
      attributeMap: (json['attributeMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      federationProviderName: json['federationProviderName'] as String?,
      federationURN: json['federationURN'] as String?,
      samlMetadataDocument: json['samlMetadataDocument'] as String?,
      samlMetadataURL: json['samlMetadataURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationCallBackURL = this.applicationCallBackURL;
    final attributeMap = this.attributeMap;
    final federationProviderName = this.federationProviderName;
    final federationURN = this.federationURN;
    final samlMetadataDocument = this.samlMetadataDocument;
    final samlMetadataURL = this.samlMetadataURL;
    return {
      if (applicationCallBackURL != null)
        'applicationCallBackURL': applicationCallBackURL,
      if (attributeMap != null) 'attributeMap': attributeMap,
      if (federationProviderName != null)
        'federationProviderName': federationProviderName,
      if (federationURN != null) 'federationURN': federationURN,
      if (samlMetadataDocument != null)
        'samlMetadataDocument': samlMetadataDocument,
      if (samlMetadataURL != null) 'samlMetadataURL': samlMetadataURL,
    };
  }
}

class GetEnvironmentResponse {
  /// The name of the FinSpace environment.
  final Environment? environment;

  GetEnvironmentResponse({
    this.environment,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
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

class GetKxChangesetResponse {
  /// Beginning time from which the changeset is active. The value is determined
  /// as epoch time in milliseconds. For example, the value for Monday, November
  /// 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? activeFromTimestamp;

  /// A list of change request objects that are run in order.
  final List<ChangeRequest>? changeRequests;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the changeset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the kdb database.
  final String? databaseName;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// Provides details in the event of a failed flow, including the error type and
  /// the related error message.
  final ErrorInfo? errorInfo;

  /// The timestamp at which the changeset was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Status of the changeset creation process.
  ///
  /// <ul>
  /// <li>
  /// Pending – Changeset creation is pending.
  /// </li>
  /// <li>
  /// Processing – Changeset creation is running.
  /// </li>
  /// <li>
  /// Failed – Changeset creation has failed.
  /// </li>
  /// <li>
  /// Complete – Changeset creation has succeeded.
  /// </li>
  /// </ul>
  final ChangesetStatus? status;

  GetKxChangesetResponse({
    this.activeFromTimestamp,
    this.changeRequests,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.environmentId,
    this.errorInfo,
    this.lastModifiedTimestamp,
    this.status,
  });

  factory GetKxChangesetResponse.fromJson(Map<String, dynamic> json) {
    return GetKxChangesetResponse(
      activeFromTimestamp: timeStampFromJson(json['activeFromTimestamp']),
      changeRequests: (json['changeRequests'] as List?)
          ?.whereNotNull()
          .map((e) => ChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      environmentId: json['environmentId'] as String?,
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      status: (json['status'] as String?)?.toChangesetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeFromTimestamp = this.activeFromTimestamp;
    final changeRequests = this.changeRequests;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final environmentId = this.environmentId;
    final errorInfo = this.errorInfo;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final status = this.status;
    return {
      if (activeFromTimestamp != null)
        'activeFromTimestamp': unixTimestampToJson(activeFromTimestamp),
      if (changeRequests != null) 'changeRequests': changeRequests,
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetKxClusterResponse {
  /// The configuration based on which FinSpace will scale in or scale out nodes
  /// in your cluster.
  final AutoScalingConfiguration? autoScalingConfiguration;

  /// The availability zone identifiers for the requested regions.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per cluster. This can be
  /// one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> – Assigns one availability zone per cluster.
  /// </li>
  /// <li>
  /// <code>MULTI</code> – Assigns all the availability zones per cluster.
  /// </li>
  /// </ul>
  final KxAzMode? azMode;

  /// The configurations for a read only cache storage associated with a cluster.
  /// This cache will be stored as an FSx Lustre that reads from the S3 store.
  final List<KxCacheStorageConfiguration>? cacheStorageConfigurations;

  /// A structure for the metadata of a cluster. It includes information like the
  /// CPUs needed, memory of instances, and number of instances.
  final CapacityConfiguration? capacityConfiguration;

  /// A description of the cluster.
  final String? clusterDescription;

  /// A unique name for the cluster.
  final String? clusterName;

  /// Specifies the type of KDB database that is being created. The following
  /// types are available:
  ///
  /// <ul>
  /// <li>
  /// HDB – A Historical Database. The data is only accessible with read-only
  /// permissions from one of the FinSpace managed kdb databases mounted to the
  /// cluster.
  /// </li>
  /// <li>
  /// RDB – A Realtime Database. This type of database captures all the data from
  /// a ticker plant and stores it in memory until the end of day, after which it
  /// writes all of its data to a disk and reloads the HDB. This cluster type
  /// requires local storage for temporary storage of data during the savedown
  /// process. If you specify this field in your request, you must provide the
  /// <code>savedownStorageConfiguration</code> parameter.
  /// </li>
  /// <li>
  /// GATEWAY – A gateway cluster allows you to access data across processes in
  /// kdb systems. It allows you to create your own routing logic using the
  /// initialization scripts and custom code. This type of cluster does not
  /// require a writable local storage.
  /// </li>
  /// <li>
  /// GP – A general purpose cluster allows you to quickly iterate on code during
  /// development by granting greater access to system commands and enabling a
  /// fast reload of custom code. This cluster type can optionally mount databases
  /// including cache and savedown storage. For this cluster type, the node count
  /// is fixed at 1. It does not support autoscaling and supports only
  /// <code>SINGLE</code> AZ mode.
  /// </li>
  /// <li>
  /// Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers
  /// based on IAM permissions. It can publish to RDBs, other Tickerplants, and
  /// real-time subscribers (RTS). Tickerplants can persist messages to log, which
  /// is readable by any RDB environment. It supports only single-node that is
  /// only one kdb process.
  /// </li>
  /// </ul>
  final KxClusterType? clusterType;

  /// The details of the custom code that you want to use inside a cluster when
  /// analyzing a data. It consists of the S3 source bucket, location, S3 object
  /// version, and the relative path from where the custom code is loaded into the
  /// cluster.
  final CodeConfiguration? code;

  /// Defines key-value pairs to make them available inside the cluster.
  final List<KxCommandLineArgument>? commandLineArguments;

  /// The timestamp at which the cluster was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A list of databases mounted on the cluster.
  final List<KxDatabaseConfiguration>? databases;

  /// An IAM role that defines a set of permissions associated with a cluster.
  /// These permissions are assumed when a cluster attempts to access another
  /// cluster.
  final String? executionRole;

  /// Specifies a Q program that will be run at launch of a cluster. It is a
  /// relative path within <i>.zip</i> file that contains the custom code, which
  /// will be loaded on the cluster. It must include the file name itself. For
  /// example, <code>somedir/init.q</code>.
  final String? initializationScript;

  /// The last time that the cluster was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// The version of FinSpace managed kdb to run.
  final String? releaseLabel;

  /// The size and type of the temporary storage that is used to hold data during
  /// the savedown process. This parameter is required when you choose
  /// <code>clusterType</code> as RDB. All the data written to this storage space
  /// is lost when the cluster node is restarted.
  final KxSavedownStorageConfiguration? savedownStorageConfiguration;
  final KxScalingGroupConfiguration? scalingGroupConfiguration;

  /// The status of cluster creation.
  ///
  /// <ul>
  /// <li>
  /// PENDING – The cluster is pending creation.
  /// </li>
  /// <li>
  /// CREATING – The cluster creation process is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The cluster creation process has failed.
  /// </li>
  /// <li>
  /// RUNNING – The cluster creation process is running.
  /// </li>
  /// <li>
  /// UPDATING – The cluster is in the process of being updated.
  /// </li>
  /// <li>
  /// DELETING – The cluster is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETED – The cluster has been deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The cluster failed to delete.
  /// </li>
  /// </ul>
  final KxClusterStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;
  final TickerplantLogConfiguration? tickerplantLogConfiguration;

  /// A list of volumes attached to the cluster.
  final List<Volume>? volumes;

  /// Configuration details about the network where the Privatelink endpoint of
  /// the cluster resides.
  final VpcConfiguration? vpcConfiguration;

  GetKxClusterResponse({
    this.autoScalingConfiguration,
    this.availabilityZoneId,
    this.azMode,
    this.cacheStorageConfigurations,
    this.capacityConfiguration,
    this.clusterDescription,
    this.clusterName,
    this.clusterType,
    this.code,
    this.commandLineArguments,
    this.createdTimestamp,
    this.databases,
    this.executionRole,
    this.initializationScript,
    this.lastModifiedTimestamp,
    this.releaseLabel,
    this.savedownStorageConfiguration,
    this.scalingGroupConfiguration,
    this.status,
    this.statusReason,
    this.tickerplantLogConfiguration,
    this.volumes,
    this.vpcConfiguration,
  });

  factory GetKxClusterResponse.fromJson(Map<String, dynamic> json) {
    return GetKxClusterResponse(
      autoScalingConfiguration: json['autoScalingConfiguration'] != null
          ? AutoScalingConfiguration.fromJson(
              json['autoScalingConfiguration'] as Map<String, dynamic>)
          : null,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      cacheStorageConfigurations: (json['cacheStorageConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxCacheStorageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityConfiguration: json['capacityConfiguration'] != null
          ? CapacityConfiguration.fromJson(
              json['capacityConfiguration'] as Map<String, dynamic>)
          : null,
      clusterDescription: json['clusterDescription'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType: (json['clusterType'] as String?)?.toKxClusterType(),
      code: json['code'] != null
          ? CodeConfiguration.fromJson(json['code'] as Map<String, dynamic>)
          : null,
      commandLineArguments: (json['commandLineArguments'] as List?)
          ?.whereNotNull()
          .map((e) => KxCommandLineArgument.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databases: (json['databases'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDatabaseConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      executionRole: json['executionRole'] as String?,
      initializationScript: json['initializationScript'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      releaseLabel: json['releaseLabel'] as String?,
      savedownStorageConfiguration: json['savedownStorageConfiguration'] != null
          ? KxSavedownStorageConfiguration.fromJson(
              json['savedownStorageConfiguration'] as Map<String, dynamic>)
          : null,
      scalingGroupConfiguration: json['scalingGroupConfiguration'] != null
          ? KxScalingGroupConfiguration.fromJson(
              json['scalingGroupConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toKxClusterStatus(),
      statusReason: json['statusReason'] as String?,
      tickerplantLogConfiguration: json['tickerplantLogConfiguration'] != null
          ? TickerplantLogConfiguration.fromJson(
              json['tickerplantLogConfiguration'] as Map<String, dynamic>)
          : null,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final cacheStorageConfigurations = this.cacheStorageConfigurations;
    final capacityConfiguration = this.capacityConfiguration;
    final clusterDescription = this.clusterDescription;
    final clusterName = this.clusterName;
    final clusterType = this.clusterType;
    final code = this.code;
    final commandLineArguments = this.commandLineArguments;
    final createdTimestamp = this.createdTimestamp;
    final databases = this.databases;
    final executionRole = this.executionRole;
    final initializationScript = this.initializationScript;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final releaseLabel = this.releaseLabel;
    final savedownStorageConfiguration = this.savedownStorageConfiguration;
    final scalingGroupConfiguration = this.scalingGroupConfiguration;
    final status = this.status;
    final statusReason = this.statusReason;
    final tickerplantLogConfiguration = this.tickerplantLogConfiguration;
    final volumes = this.volumes;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (autoScalingConfiguration != null)
        'autoScalingConfiguration': autoScalingConfiguration,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (cacheStorageConfigurations != null)
        'cacheStorageConfigurations': cacheStorageConfigurations,
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      if (clusterDescription != null) 'clusterDescription': clusterDescription,
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterType != null) 'clusterType': clusterType.toValue(),
      if (code != null) 'code': code,
      if (commandLineArguments != null)
        'commandLineArguments': commandLineArguments,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databases != null) 'databases': databases,
      if (executionRole != null) 'executionRole': executionRole,
      if (initializationScript != null)
        'initializationScript': initializationScript,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (savedownStorageConfiguration != null)
        'savedownStorageConfiguration': savedownStorageConfiguration,
      if (scalingGroupConfiguration != null)
        'scalingGroupConfiguration': scalingGroupConfiguration,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (tickerplantLogConfiguration != null)
        'tickerplantLogConfiguration': tickerplantLogConfiguration,
      if (volumes != null) 'volumes': volumes,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

class GetKxConnectionStringResponse {
  /// The signed connection string that you can use to connect to clusters.
  final String? signedConnectionString;

  GetKxConnectionStringResponse({
    this.signedConnectionString,
  });

  factory GetKxConnectionStringResponse.fromJson(Map<String, dynamic> json) {
    return GetKxConnectionStringResponse(
      signedConnectionString: json['signedConnectionString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final signedConnectionString = this.signedConnectionString;
    return {
      if (signedConnectionString != null)
        'signedConnectionString': signedConnectionString,
    };
  }
}

class GetKxDatabaseResponse {
  /// The timestamp at which the database is created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The ARN identifier of the database.
  final String? databaseArn;

  /// The name of the kdb database for which the information is retrieved.
  final String? databaseName;

  /// A description of the database.
  final String? description;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// A unique identifier for the changeset.
  final String? lastCompletedChangesetId;

  /// The last time that the database was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// The total number of bytes in the database.
  final int? numBytes;

  /// The total number of changesets in the database.
  final int? numChangesets;

  /// The total number of files in the database.
  final int? numFiles;

  GetKxDatabaseResponse({
    this.createdTimestamp,
    this.databaseArn,
    this.databaseName,
    this.description,
    this.environmentId,
    this.lastCompletedChangesetId,
    this.lastModifiedTimestamp,
    this.numBytes,
    this.numChangesets,
    this.numFiles,
  });

  factory GetKxDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return GetKxDatabaseResponse(
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseArn: json['databaseArn'] as String?,
      databaseName: json['databaseName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastCompletedChangesetId: json['lastCompletedChangesetId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      numBytes: json['numBytes'] as int?,
      numChangesets: json['numChangesets'] as int?,
      numFiles: json['numFiles'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final databaseArn = this.databaseArn;
    final databaseName = this.databaseName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastCompletedChangesetId = this.lastCompletedChangesetId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final numBytes = this.numBytes;
    final numChangesets = this.numChangesets;
    final numFiles = this.numFiles;
    return {
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseArn != null) 'databaseArn': databaseArn,
      if (databaseName != null) 'databaseName': databaseName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastCompletedChangesetId != null)
        'lastCompletedChangesetId': lastCompletedChangesetId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (numBytes != null) 'numBytes': numBytes,
      if (numChangesets != null) 'numChangesets': numChangesets,
      if (numFiles != null) 'numFiles': numFiles,
    };
  }
}

class GetKxDataviewResponse {
  /// The current active changeset versions of the database on the given dataview.
  final List<KxDataviewActiveVersion>? activeVersions;

  /// The option to specify whether you want to apply all the future additions and
  /// corrections automatically to the dataview when new changesets are ingested.
  /// The default value is false.
  final bool? autoUpdate;

  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// A unique identifier of the changeset that you want to use to ingest data.
  final String? changesetId;

  /// The timestamp at which the dataview was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the database where you created the dataview.
  final String? databaseName;

  /// A unique identifier for the dataview.
  final String? dataviewName;

  /// A description of the dataview.
  final String? description;

  /// A unique identifier for the kdb environment, from where you want to retrieve
  /// the dataview details.
  final String? environmentId;

  /// The last time that the dataview was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Returns True if the dataview is created as writeable and False otherwise.
  final bool? readWrite;

  /// The configuration that contains the database path of the data that you want
  /// to place on each selected volume. Each segment must have a unique database
  /// path for each volume. If you do not explicitly specify any database path for
  /// a volume, they are accessible from the cluster through the default S3/object
  /// store segment.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  /// The status of dataview creation.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The dataview creation is in progress.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> – The dataview is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> – The dataview is active.
  /// </li>
  /// </ul>
  final KxDataviewStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  GetKxDataviewResponse({
    this.activeVersions,
    this.autoUpdate,
    this.availabilityZoneId,
    this.azMode,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.dataviewName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.readWrite,
    this.segmentConfigurations,
    this.status,
    this.statusReason,
  });

  factory GetKxDataviewResponse.fromJson(Map<String, dynamic> json) {
    return GetKxDataviewResponse(
      activeVersions: (json['activeVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDataviewActiveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoUpdate: json['autoUpdate'] as bool?,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      dataviewName: json['dataviewName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      readWrite: json['readWrite'] as bool?,
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toKxDataviewStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeVersions = this.activeVersions;
    final autoUpdate = this.autoUpdate;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final dataviewName = this.dataviewName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final readWrite = this.readWrite;
    final segmentConfigurations = this.segmentConfigurations;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (activeVersions != null) 'activeVersions': activeVersions,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (dataviewName != null) 'dataviewName': dataviewName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (readWrite != null) 'readWrite': readWrite,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetKxEnvironmentResponse {
  /// The identifier of the availability zones where subnets for the environment
  /// are created.
  final List<String>? availabilityZoneIds;

  /// The unique identifier of the AWS account that is used to create the kdb
  /// environment.
  final String? awsAccountId;

  /// The Amazon Resource Name (ARN) of the certificate authority of the kdb
  /// environment.
  final String? certificateAuthorityArn;

  /// The timestamp at which the kdb environment was created in FinSpace.
  final DateTime? creationTimestamp;

  /// A list of DNS server name and server IP. This is used to set up Route-53
  /// outbound resolvers.
  final List<CustomDNSServer>? customDNSConfiguration;

  /// A unique identifier for the AWS environment infrastructure account.
  final String? dedicatedServiceAccountId;

  /// A description for the kdb environment.
  final String? description;

  /// The status of DNS configuration.
  final DnsStatus? dnsStatus;

  /// The ARN identifier of the environment.
  final String? environmentArn;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// Specifies the error message that appears if a flow fails.
  final String? errorMessage;

  /// The KMS key ID to encrypt your data in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the kdb environment.
  final String? name;

  /// The status of the kdb environment.
  final EnvironmentStatus? status;

  /// The status of the network configuration.
  final TgwStatus? tgwStatus;
  final TransitGatewayConfiguration? transitGatewayConfiguration;

  /// The timestamp at which the kdb environment was updated.
  final DateTime? updateTimestamp;

  GetKxEnvironmentResponse({
    this.availabilityZoneIds,
    this.awsAccountId,
    this.certificateAuthorityArn,
    this.creationTimestamp,
    this.customDNSConfiguration,
    this.dedicatedServiceAccountId,
    this.description,
    this.dnsStatus,
    this.environmentArn,
    this.environmentId,
    this.errorMessage,
    this.kmsKeyId,
    this.name,
    this.status,
    this.tgwStatus,
    this.transitGatewayConfiguration,
    this.updateTimestamp,
  });

  factory GetKxEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetKxEnvironmentResponse(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      awsAccountId: json['awsAccountId'] as String?,
      certificateAuthorityArn: json['certificateAuthorityArn'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      customDNSConfiguration: (json['customDNSConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDNSServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      dnsStatus: (json['dnsStatus'] as String?)?.toDnsStatus(),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      tgwStatus: (json['tgwStatus'] as String?)?.toTgwStatus(),
      transitGatewayConfiguration: json['transitGatewayConfiguration'] != null
          ? TransitGatewayConfiguration.fromJson(
              json['transitGatewayConfiguration'] as Map<String, dynamic>)
          : null,
      updateTimestamp: timeStampFromJson(json['updateTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final awsAccountId = this.awsAccountId;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final creationTimestamp = this.creationTimestamp;
    final customDNSConfiguration = this.customDNSConfiguration;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final dnsStatus = this.dnsStatus;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final errorMessage = this.errorMessage;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final status = this.status;
    final tgwStatus = this.tgwStatus;
    final transitGatewayConfiguration = this.transitGatewayConfiguration;
    final updateTimestamp = this.updateTimestamp;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (certificateAuthorityArn != null)
        'certificateAuthorityArn': certificateAuthorityArn,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (customDNSConfiguration != null)
        'customDNSConfiguration': customDNSConfiguration,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (dnsStatus != null) 'dnsStatus': dnsStatus.toValue(),
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tgwStatus != null) 'tgwStatus': tgwStatus.toValue(),
      if (transitGatewayConfiguration != null)
        'transitGatewayConfiguration': transitGatewayConfiguration,
      if (updateTimestamp != null)
        'updateTimestamp': unixTimestampToJson(updateTimestamp),
    };
  }
}

class GetKxScalingGroupResponse {
  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The list of Managed kdb clusters that are currently active in the given
  /// scaling group.
  final List<String>? clusters;

  /// The timestamp at which the scaling group was created in FinSpace. The value
  /// is determined as epoch time in milliseconds. For example, the value for
  /// Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The memory and CPU capabilities of the scaling group host on which FinSpace
  /// Managed kdb clusters will be placed.
  ///
  /// It can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>kx.sg.4xlarge</code> – The host type with a configuration of 108 GiB
  /// memory and 16 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.8xlarge</code> – The host type with a configuration of 216 GiB
  /// memory and 32 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.16xlarge</code> – The host type with a configuration of 432 GiB
  /// memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.32xlarge</code> – The host type with a configuration of 864 GiB
  /// memory and 128 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.16xlarge</code> – The host type with a configuration of 1949
  /// GiB memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.24xlarge</code> – The host type with a configuration of 2948
  /// GiB memory and 96 vCPUs.
  /// </li>
  /// </ul>
  final String? hostType;

  /// The last time that the scaling group was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// The ARN identifier for the scaling group.
  final String? scalingGroupArn;

  /// A unique identifier for the kdb scaling group.
  final String? scalingGroupName;

  /// The status of scaling group.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The scaling group creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The scaling group creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The scaling group is active.
  /// </li>
  /// <li>
  /// UPDATING – The scaling group is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// DELETING – The scaling group is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the scaling group.
  /// </li>
  /// <li>
  /// DELETED – The scaling group is successfully deleted.
  /// </li>
  /// </ul>
  final KxScalingGroupStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  GetKxScalingGroupResponse({
    this.availabilityZoneId,
    this.clusters,
    this.createdTimestamp,
    this.hostType,
    this.lastModifiedTimestamp,
    this.scalingGroupArn,
    this.scalingGroupName,
    this.status,
    this.statusReason,
  });

  factory GetKxScalingGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetKxScalingGroupResponse(
      availabilityZoneId: json['availabilityZoneId'] as String?,
      clusters: (json['clusters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      hostType: json['hostType'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      scalingGroupArn: json['scalingGroupArn'] as String?,
      scalingGroupName: json['scalingGroupName'] as String?,
      status: (json['status'] as String?)?.toKxScalingGroupStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final clusters = this.clusters;
    final createdTimestamp = this.createdTimestamp;
    final hostType = this.hostType;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final scalingGroupArn = this.scalingGroupArn;
    final scalingGroupName = this.scalingGroupName;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (clusters != null) 'clusters': clusters,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (hostType != null) 'hostType': hostType,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (scalingGroupArn != null) 'scalingGroupArn': scalingGroupArn,
      if (scalingGroupName != null) 'scalingGroupName': scalingGroupName,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetKxUserResponse {
  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The IAM role ARN that is associated with the user.
  final String? iamRole;

  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String? userArn;

  /// A unique identifier for the user.
  final String? userName;

  GetKxUserResponse({
    this.environmentId,
    this.iamRole,
    this.userArn,
    this.userName,
  });

  factory GetKxUserResponse.fromJson(Map<String, dynamic> json) {
    return GetKxUserResponse(
      environmentId: json['environmentId'] as String?,
      iamRole: json['iamRole'] as String?,
      userArn: json['userArn'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final iamRole = this.iamRole;
    final userArn = this.userArn;
    final userName = this.userName;
    return {
      if (environmentId != null) 'environmentId': environmentId,
      if (iamRole != null) 'iamRole': iamRole,
      if (userArn != null) 'userArn': userArn,
      if (userName != null) 'userName': userName,
    };
  }
}

class GetKxVolumeResponse {
  /// A list of cluster identifiers that a volume is attached to.
  final List<KxAttachedCluster>? attachedClusters;

  /// The identifier of the availability zones.
  final List<String>? availabilityZoneIds;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// The timestamp at which the volume was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A description of the volume.
  final String? description;

  /// A unique identifier for the kdb environment, whose clusters can attach to
  /// the volume.
  final String? environmentId;

  /// The last time that the volume was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Specifies the configuration for the Network attached storage (NAS_1) file
  /// system volume.
  final KxNAS1Configuration? nas1Configuration;

  /// The status of volume creation.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The volume creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The volume creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The volume is active.
  /// </li>
  /// <li>
  /// UPDATING – The volume is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// UPDATED – The volume is successfully updated.
  /// </li>
  /// <li>
  /// DELETING – The volume is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the volume.
  /// </li>
  /// <li>
  /// DELETED – The volume is successfully deleted.
  /// </li>
  /// </ul>
  final KxVolumeStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  /// The ARN identifier of the volume.
  final String? volumeArn;

  /// A unique identifier for the volume.
  final String? volumeName;

  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  final KxVolumeType? volumeType;

  GetKxVolumeResponse({
    this.attachedClusters,
    this.availabilityZoneIds,
    this.azMode,
    this.createdTimestamp,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.nas1Configuration,
    this.status,
    this.statusReason,
    this.volumeArn,
    this.volumeName,
    this.volumeType,
  });

  factory GetKxVolumeResponse.fromJson(Map<String, dynamic> json) {
    return GetKxVolumeResponse(
      attachedClusters: (json['attachedClusters'] as List?)
          ?.whereNotNull()
          .map((e) => KxAttachedCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      nas1Configuration: json['nas1Configuration'] != null
          ? KxNAS1Configuration.fromJson(
              json['nas1Configuration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toKxVolumeStatus(),
      statusReason: json['statusReason'] as String?,
      volumeArn: json['volumeArn'] as String?,
      volumeName: json['volumeName'] as String?,
      volumeType: (json['volumeType'] as String?)?.toKxVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedClusters = this.attachedClusters;
    final availabilityZoneIds = this.availabilityZoneIds;
    final azMode = this.azMode;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final nas1Configuration = this.nas1Configuration;
    final status = this.status;
    final statusReason = this.statusReason;
    final volumeArn = this.volumeArn;
    final volumeName = this.volumeName;
    final volumeType = this.volumeType;
    return {
      if (attachedClusters != null) 'attachedClusters': attachedClusters,
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (nas1Configuration != null) 'nas1Configuration': nas1Configuration,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (volumeArn != null) 'volumeArn': volumeArn,
      if (volumeName != null) 'volumeName': volumeName,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

enum IPAddressType {
  ipV4,
}

extension IPAddressTypeValueExtension on IPAddressType {
  String toValue() {
    switch (this) {
      case IPAddressType.ipV4:
        return 'IP_V4';
    }
  }
}

extension IPAddressTypeFromString on String {
  IPAddressType toIPAddressType() {
    switch (this) {
      case 'IP_V4':
        return IPAddressType.ipV4;
    }
    throw Exception('$this is not known in enum IPAddressType');
  }
}

/// Defines the ICMP protocol that consists of the ICMP type and code.
class IcmpTypeCode {
  /// The ICMP code. A value of <i>-1</i> means all codes for the specified ICMP
  /// type.
  final int code;

  /// The ICMP type. A value of <i>-1</i> means all types.
  final int type;

  IcmpTypeCode({
    required this.code,
    required this.type,
  });

  factory IcmpTypeCode.fromJson(Map<String, dynamic> json) {
    return IcmpTypeCode(
      code: json['code'] as int,
      type: json['type'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final type = this.type;
    return {
      'code': code,
      'type': type,
    };
  }
}

/// The structure containing the metadata of the attached clusters.
class KxAttachedCluster {
  /// A unique name for the attached cluster.
  final String? clusterName;

  /// The status of the attached cluster.
  ///
  /// <ul>
  /// <li>
  /// PENDING – The cluster is pending creation.
  /// </li>
  /// <li>
  /// CREATING – The cluster creation process is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The cluster creation process has failed.
  /// </li>
  /// <li>
  /// RUNNING – The cluster creation process is running.
  /// </li>
  /// <li>
  /// UPDATING – The cluster is in the process of being updated.
  /// </li>
  /// <li>
  /// DELETING – The cluster is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETED – The cluster has been deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The cluster failed to delete.
  /// </li>
  /// </ul>
  final KxClusterStatus? clusterStatus;

  /// Specifies the type of cluster. The volume for TP and RDB cluster types will
  /// be used for TP logs.
  final KxClusterType? clusterType;

  KxAttachedCluster({
    this.clusterName,
    this.clusterStatus,
    this.clusterType,
  });

  factory KxAttachedCluster.fromJson(Map<String, dynamic> json) {
    return KxAttachedCluster(
      clusterName: json['clusterName'] as String?,
      clusterStatus: (json['clusterStatus'] as String?)?.toKxClusterStatus(),
      clusterType: (json['clusterType'] as String?)?.toKxClusterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final clusterStatus = this.clusterStatus;
    final clusterType = this.clusterType;
    return {
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterStatus != null) 'clusterStatus': clusterStatus.toValue(),
      if (clusterType != null) 'clusterType': clusterType.toValue(),
    };
  }
}

enum KxAzMode {
  single,
  multi,
}

extension KxAzModeValueExtension on KxAzMode {
  String toValue() {
    switch (this) {
      case KxAzMode.single:
        return 'SINGLE';
      case KxAzMode.multi:
        return 'MULTI';
    }
  }
}

extension KxAzModeFromString on String {
  KxAzMode toKxAzMode() {
    switch (this) {
      case 'SINGLE':
        return KxAzMode.single;
      case 'MULTI':
        return KxAzMode.multi;
    }
    throw Exception('$this is not known in enum KxAzMode');
  }
}

/// The configuration for read only disk cache associated with a cluster.
class KxCacheStorageConfiguration {
  /// The size of cache in Gigabytes.
  final int size;

  /// The type of cache storage. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// CACHE_1000 – This type provides at least 1000 MB/s disk access throughput.
  /// </li>
  /// <li>
  /// CACHE_250 – This type provides at least 250 MB/s disk access throughput.
  /// </li>
  /// <li>
  /// CACHE_12 – This type provides at least 12 MB/s disk access throughput.
  /// </li>
  /// </ul>
  /// For cache type <code>CACHE_1000</code> and <code>CACHE_250</code> you can
  /// select cache size as 1200 GB or increments of 2400 GB. For cache type
  /// <code>CACHE_12</code> you can select the cache size in increments of 6000
  /// GB.
  final String type;

  KxCacheStorageConfiguration({
    required this.size,
    required this.type,
  });

  factory KxCacheStorageConfiguration.fromJson(Map<String, dynamic> json) {
    return KxCacheStorageConfiguration(
      size: json['size'] as int,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    final type = this.type;
    return {
      'size': size,
      'type': type,
    };
  }
}

/// Details of changeset.
class KxChangesetListEntry {
  /// Beginning time from which the changeset is active. The value is determined
  /// as epoch time in milliseconds. For example, the value for Monday, November
  /// 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? activeFromTimestamp;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the changeset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The timestamp at which the changeset was modified. The value is determined
  /// as epoch time in milliseconds. For example, the value for Monday, November
  /// 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Status of the changeset.
  ///
  /// <ul>
  /// <li>
  /// Pending – Changeset creation is pending.
  /// </li>
  /// <li>
  /// Processing – Changeset creation is running.
  /// </li>
  /// <li>
  /// Failed – Changeset creation has failed.
  /// </li>
  /// <li>
  /// Complete – Changeset creation has succeeded.
  /// </li>
  /// </ul>
  final ChangesetStatus? status;

  KxChangesetListEntry({
    this.activeFromTimestamp,
    this.changesetId,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
    this.status,
  });

  factory KxChangesetListEntry.fromJson(Map<String, dynamic> json) {
    return KxChangesetListEntry(
      activeFromTimestamp: timeStampFromJson(json['activeFromTimestamp']),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      status: (json['status'] as String?)?.toChangesetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeFromTimestamp = this.activeFromTimestamp;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final status = this.status;
    return {
      if (activeFromTimestamp != null)
        'activeFromTimestamp': unixTimestampToJson(activeFromTimestamp),
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The details of a kdb cluster.
class KxCluster {
  /// The availability zone identifiers for the requested regions.
  final String? availabilityZoneId;

  /// The number of availability zones assigned per cluster. This can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> – Assigns one availability zone per cluster.
  /// </li>
  /// <li>
  /// <code>MULTI</code> – Assigns all the availability zones per cluster.
  /// </li>
  /// </ul>
  final KxAzMode? azMode;

  /// A description of the cluster.
  final String? clusterDescription;

  /// A unique name for the cluster.
  final String? clusterName;

  /// Specifies the type of KDB database that is being created. The following
  /// types are available:
  ///
  /// <ul>
  /// <li>
  /// HDB – A Historical Database. The data is only accessible with read-only
  /// permissions from one of the FinSpace managed kdb databases mounted to the
  /// cluster.
  /// </li>
  /// <li>
  /// RDB – A Realtime Database. This type of database captures all the data from
  /// a ticker plant and stores it in memory until the end of day, after which it
  /// writes all of its data to a disk and reloads the HDB. This cluster type
  /// requires local storage for temporary storage of data during the savedown
  /// process. If you specify this field in your request, you must provide the
  /// <code>savedownStorageConfiguration</code> parameter.
  /// </li>
  /// <li>
  /// GATEWAY – A gateway cluster allows you to access data across processes in
  /// kdb systems. It allows you to create your own routing logic using the
  /// initialization scripts and custom code. This type of cluster does not
  /// require a writable local storage.
  /// </li>
  /// <li>
  /// GP – A general purpose cluster allows you to quickly iterate on code during
  /// development by granting greater access to system commands and enabling a
  /// fast reload of custom code. This cluster type can optionally mount databases
  /// including cache and savedown storage. For this cluster type, the node count
  /// is fixed at 1. It does not support autoscaling and supports only
  /// <code>SINGLE</code> AZ mode.
  /// </li>
  /// <li>
  /// Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers
  /// based on IAM permissions. It can publish to RDBs, other Tickerplants, and
  /// real-time subscribers (RTS). Tickerplants can persist messages to log, which
  /// is readable by any RDB environment. It supports only single-node that is
  /// only one kdb process.
  /// </li>
  /// </ul>
  final KxClusterType? clusterType;

  /// The timestamp at which the cluster was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// An IAM role that defines a set of permissions associated with a cluster.
  /// These permissions are assumed when a cluster attempts to access another
  /// cluster.
  final String? executionRole;

  /// Specifies a Q program that will be run at launch of a cluster. It is a
  /// relative path within <i>.zip</i> file that contains the custom code, which
  /// will be loaded on the cluster. It must include the file name itself. For
  /// example, <code>somedir/init.q</code>.
  final String? initializationScript;

  /// The last time that the cluster was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// A version of the FinSpace managed kdb to run.
  final String? releaseLabel;

  /// The status of a cluster.
  ///
  /// <ul>
  /// <li>
  /// PENDING – The cluster is pending creation.
  /// </li>
  /// <li>
  /// CREATING –The cluster creation process is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED– The cluster creation process has failed.
  /// </li>
  /// <li>
  /// RUNNING – The cluster creation process is running.
  /// </li>
  /// <li>
  /// UPDATING – The cluster is in the process of being updated.
  /// </li>
  /// <li>
  /// DELETING – The cluster is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETED – The cluster has been deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The cluster failed to delete.
  /// </li>
  /// </ul>
  final KxClusterStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  /// A list of volumes attached to the cluster.
  final List<Volume>? volumes;

  KxCluster({
    this.availabilityZoneId,
    this.azMode,
    this.clusterDescription,
    this.clusterName,
    this.clusterType,
    this.createdTimestamp,
    this.executionRole,
    this.initializationScript,
    this.lastModifiedTimestamp,
    this.releaseLabel,
    this.status,
    this.statusReason,
    this.volumes,
  });

  factory KxCluster.fromJson(Map<String, dynamic> json) {
    return KxCluster(
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      clusterDescription: json['clusterDescription'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType: (json['clusterType'] as String?)?.toKxClusterType(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      executionRole: json['executionRole'] as String?,
      initializationScript: json['initializationScript'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      releaseLabel: json['releaseLabel'] as String?,
      status: (json['status'] as String?)?.toKxClusterStatus(),
      statusReason: json['statusReason'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final clusterDescription = this.clusterDescription;
    final clusterName = this.clusterName;
    final clusterType = this.clusterType;
    final createdTimestamp = this.createdTimestamp;
    final executionRole = this.executionRole;
    final initializationScript = this.initializationScript;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final releaseLabel = this.releaseLabel;
    final status = this.status;
    final statusReason = this.statusReason;
    final volumes = this.volumes;
    return {
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (clusterDescription != null) 'clusterDescription': clusterDescription,
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterType != null) 'clusterType': clusterType.toValue(),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (executionRole != null) 'executionRole': executionRole,
      if (initializationScript != null)
        'initializationScript': initializationScript,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// The configuration that allows you to choose how you want to update code on a
/// cluster. Depending on the option you choose, you can reduce the time it
/// takes to update the cluster.
class KxClusterCodeDeploymentConfiguration {
  /// The type of deployment that you want on a cluster.
  ///
  /// <ul>
  /// <li>
  /// ROLLING – This options updates the cluster by stopping the exiting q process
  /// and starting a new q process with updated configuration.
  /// </li>
  /// <li>
  /// NO_RESTART – This option updates the cluster without stopping the running q
  /// process. It is only available for <code>GP</code> type cluster. This option
  /// is quicker as it reduces the turn around time to update configuration on a
  /// cluster.
  ///
  /// With this deployment mode, you cannot update the
  /// <code>initializationScript</code> and <code>commandLineArguments</code>
  /// parameters.
  /// </li>
  /// <li>
  /// FORCE – This option updates the cluster by immediately stopping all the
  /// running processes before starting up new ones with the updated
  /// configuration.
  /// </li>
  /// </ul>
  final KxClusterCodeDeploymentStrategy deploymentStrategy;

  KxClusterCodeDeploymentConfiguration({
    required this.deploymentStrategy,
  });

  Map<String, dynamic> toJson() {
    final deploymentStrategy = this.deploymentStrategy;
    return {
      'deploymentStrategy': deploymentStrategy.toValue(),
    };
  }
}

enum KxClusterCodeDeploymentStrategy {
  noRestart,
  rolling,
  force,
}

extension KxClusterCodeDeploymentStrategyValueExtension
    on KxClusterCodeDeploymentStrategy {
  String toValue() {
    switch (this) {
      case KxClusterCodeDeploymentStrategy.noRestart:
        return 'NO_RESTART';
      case KxClusterCodeDeploymentStrategy.rolling:
        return 'ROLLING';
      case KxClusterCodeDeploymentStrategy.force:
        return 'FORCE';
    }
  }
}

extension KxClusterCodeDeploymentStrategyFromString on String {
  KxClusterCodeDeploymentStrategy toKxClusterCodeDeploymentStrategy() {
    switch (this) {
      case 'NO_RESTART':
        return KxClusterCodeDeploymentStrategy.noRestart;
      case 'ROLLING':
        return KxClusterCodeDeploymentStrategy.rolling;
      case 'FORCE':
        return KxClusterCodeDeploymentStrategy.force;
    }
    throw Exception(
        '$this is not known in enum KxClusterCodeDeploymentStrategy');
  }
}

enum KxClusterStatus {
  pending,
  creating,
  createFailed,
  running,
  updating,
  deleting,
  deleted,
  deleteFailed,
}

extension KxClusterStatusValueExtension on KxClusterStatus {
  String toValue() {
    switch (this) {
      case KxClusterStatus.pending:
        return 'PENDING';
      case KxClusterStatus.creating:
        return 'CREATING';
      case KxClusterStatus.createFailed:
        return 'CREATE_FAILED';
      case KxClusterStatus.running:
        return 'RUNNING';
      case KxClusterStatus.updating:
        return 'UPDATING';
      case KxClusterStatus.deleting:
        return 'DELETING';
      case KxClusterStatus.deleted:
        return 'DELETED';
      case KxClusterStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension KxClusterStatusFromString on String {
  KxClusterStatus toKxClusterStatus() {
    switch (this) {
      case 'PENDING':
        return KxClusterStatus.pending;
      case 'CREATING':
        return KxClusterStatus.creating;
      case 'CREATE_FAILED':
        return KxClusterStatus.createFailed;
      case 'RUNNING':
        return KxClusterStatus.running;
      case 'UPDATING':
        return KxClusterStatus.updating;
      case 'DELETING':
        return KxClusterStatus.deleting;
      case 'DELETED':
        return KxClusterStatus.deleted;
      case 'DELETE_FAILED':
        return KxClusterStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum KxClusterStatus');
  }
}

enum KxClusterType {
  hdb,
  rdb,
  gateway,
  gp,
  tickerplant,
}

extension KxClusterTypeValueExtension on KxClusterType {
  String toValue() {
    switch (this) {
      case KxClusterType.hdb:
        return 'HDB';
      case KxClusterType.rdb:
        return 'RDB';
      case KxClusterType.gateway:
        return 'GATEWAY';
      case KxClusterType.gp:
        return 'GP';
      case KxClusterType.tickerplant:
        return 'TICKERPLANT';
    }
  }
}

extension KxClusterTypeFromString on String {
  KxClusterType toKxClusterType() {
    switch (this) {
      case 'HDB':
        return KxClusterType.hdb;
      case 'RDB':
        return KxClusterType.rdb;
      case 'GATEWAY':
        return KxClusterType.gateway;
      case 'GP':
        return KxClusterType.gp;
      case 'TICKERPLANT':
        return KxClusterType.tickerplant;
    }
    throw Exception('$this is not known in enum KxClusterType');
  }
}

/// Defines the key-value pairs to make them available inside the cluster.
class KxCommandLineArgument {
  /// The name of the key.
  final String? key;

  /// The value of the key.
  final String? value;

  KxCommandLineArgument({
    this.key,
    this.value,
  });

  factory KxCommandLineArgument.fromJson(Map<String, dynamic> json) {
    return KxCommandLineArgument(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// The structure of database cache configuration that is used for mapping
/// database paths to cache types in clusters.
class KxDatabaseCacheConfiguration {
  /// The type of disk cache. This parameter is used to map the database path to
  /// cache storage. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// CACHE_1000 – This type provides at least 1000 MB/s disk access throughput.
  /// </li>
  /// </ul>
  final String cacheType;

  /// Specifies the portions of database that will be loaded into the cache for
  /// access.
  final List<String> dbPaths;

  /// The name of the dataview to be used for caching historical data on disk.
  final String? dataviewName;

  KxDatabaseCacheConfiguration({
    required this.cacheType,
    required this.dbPaths,
    this.dataviewName,
  });

  factory KxDatabaseCacheConfiguration.fromJson(Map<String, dynamic> json) {
    return KxDatabaseCacheConfiguration(
      cacheType: json['cacheType'] as String,
      dbPaths: (json['dbPaths'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      dataviewName: json['dataviewName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheType = this.cacheType;
    final dbPaths = this.dbPaths;
    final dataviewName = this.dataviewName;
    return {
      'cacheType': cacheType,
      'dbPaths': dbPaths,
      if (dataviewName != null) 'dataviewName': dataviewName,
    };
  }
}

/// The configuration of data that is available for querying from this database.
class KxDatabaseConfiguration {
  /// The name of the kdb database. When this parameter is specified in the
  /// structure, S3 with the whole database is included by default.
  final String databaseName;

  /// Configuration details for the disk cache used to increase performance
  /// reading from a kdb database mounted to the cluster.
  final List<KxDatabaseCacheConfiguration>? cacheConfigurations;

  /// A unique identifier of the changeset that is associated with the cluster.
  final String? changesetId;

  /// The configuration of the dataview to be used with specified cluster.
  final KxDataviewConfiguration? dataviewConfiguration;

  /// The name of the dataview to be used for caching historical data on disk.
  final String? dataviewName;

  KxDatabaseConfiguration({
    required this.databaseName,
    this.cacheConfigurations,
    this.changesetId,
    this.dataviewConfiguration,
    this.dataviewName,
  });

  factory KxDatabaseConfiguration.fromJson(Map<String, dynamic> json) {
    return KxDatabaseConfiguration(
      databaseName: json['databaseName'] as String,
      cacheConfigurations: (json['cacheConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDatabaseCacheConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      changesetId: json['changesetId'] as String?,
      dataviewConfiguration: json['dataviewConfiguration'] != null
          ? KxDataviewConfiguration.fromJson(
              json['dataviewConfiguration'] as Map<String, dynamic>)
          : null,
      dataviewName: json['dataviewName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final cacheConfigurations = this.cacheConfigurations;
    final changesetId = this.changesetId;
    final dataviewConfiguration = this.dataviewConfiguration;
    final dataviewName = this.dataviewName;
    return {
      'databaseName': databaseName,
      if (cacheConfigurations != null)
        'cacheConfigurations': cacheConfigurations,
      if (changesetId != null) 'changesetId': changesetId,
      if (dataviewConfiguration != null)
        'dataviewConfiguration': dataviewConfiguration,
      if (dataviewName != null) 'dataviewName': dataviewName,
    };
  }
}

/// Details about a FinSpace managed kdb database
class KxDatabaseListEntry {
  /// The timestamp at which the database was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the kdb database.
  final String? databaseName;

  /// The last time that the database was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  KxDatabaseListEntry({
    this.createdTimestamp,
    this.databaseName,
    this.lastModifiedTimestamp,
  });

  factory KxDatabaseListEntry.fromJson(Map<String, dynamic> json) {
    return KxDatabaseListEntry(
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    return {
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
    };
  }
}

/// The active version of the dataview that is currently in use by this cluster.
class KxDataviewActiveVersion {
  /// The list of clusters that are currently using this dataview.
  final List<String>? attachedClusters;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the dataview version was active. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The configuration that contains the database path of the data that you want
  /// to place on each selected volume. Each segment must have a unique database
  /// path for each volume. If you do not explicitly specify any database path for
  /// a volume, they are accessible from the cluster through the default S3/object
  /// store segment.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  /// A unique identifier of the active version.
  final String? versionId;

  KxDataviewActiveVersion({
    this.attachedClusters,
    this.changesetId,
    this.createdTimestamp,
    this.segmentConfigurations,
    this.versionId,
  });

  factory KxDataviewActiveVersion.fromJson(Map<String, dynamic> json) {
    return KxDataviewActiveVersion(
      attachedClusters: (json['attachedClusters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      versionId: json['versionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedClusters = this.attachedClusters;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final segmentConfigurations = this.segmentConfigurations;
    final versionId = this.versionId;
    return {
      if (attachedClusters != null) 'attachedClusters': attachedClusters,
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (versionId != null) 'versionId': versionId,
    };
  }
}

/// The structure that stores the configuration details of a dataview.
class KxDataviewConfiguration {
  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The unique identifier of the dataview.
  final String? dataviewName;

  /// The version of the dataview corresponding to a given changeset.
  final String? dataviewVersionId;

  /// The db path and volume configuration for the segmented database.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  KxDataviewConfiguration({
    this.changesetId,
    this.dataviewName,
    this.dataviewVersionId,
    this.segmentConfigurations,
  });

  factory KxDataviewConfiguration.fromJson(Map<String, dynamic> json) {
    return KxDataviewConfiguration(
      changesetId: json['changesetId'] as String?,
      dataviewName: json['dataviewName'] as String?,
      dataviewVersionId: json['dataviewVersionId'] as String?,
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changesetId = this.changesetId;
    final dataviewName = this.dataviewName;
    final dataviewVersionId = this.dataviewVersionId;
    final segmentConfigurations = this.segmentConfigurations;
    return {
      if (changesetId != null) 'changesetId': changesetId,
      if (dataviewName != null) 'dataviewName': dataviewName,
      if (dataviewVersionId != null) 'dataviewVersionId': dataviewVersionId,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
    };
  }
}

/// A collection of kdb dataview entries.
class KxDataviewListEntry {
  /// The active changeset versions for the given dataview entry.
  final List<KxDataviewActiveVersion>? activeVersions;

  /// The option to specify whether you want to apply all the future additions and
  /// corrections automatically to the dataview when you ingest new changesets.
  /// The default value is false.
  final bool? autoUpdate;

  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the dataview list entry was created in FinSpace. The
  /// value is determined as epoch time in milliseconds. For example, the value
  /// for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A unique identifier of the database.
  final String? databaseName;

  /// A unique identifier of the dataview.
  final String? dataviewName;

  /// A description for the dataview list entry.
  final String? description;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The last time that the dataview list was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Returns True if the dataview is created as writeable and False otherwise.
  final bool? readWrite;

  /// The configuration that contains the database path of the data that you want
  /// to place on each selected volume. Each segment must have a unique database
  /// path for each volume. If you do not explicitly specify any database path for
  /// a volume, they are accessible from the cluster through the default S3/object
  /// store segment.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  /// The status of a given dataview entry.
  final KxDataviewStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  KxDataviewListEntry({
    this.activeVersions,
    this.autoUpdate,
    this.availabilityZoneId,
    this.azMode,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.dataviewName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.readWrite,
    this.segmentConfigurations,
    this.status,
    this.statusReason,
  });

  factory KxDataviewListEntry.fromJson(Map<String, dynamic> json) {
    return KxDataviewListEntry(
      activeVersions: (json['activeVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDataviewActiveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoUpdate: json['autoUpdate'] as bool?,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      dataviewName: json['dataviewName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      readWrite: json['readWrite'] as bool?,
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toKxDataviewStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeVersions = this.activeVersions;
    final autoUpdate = this.autoUpdate;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final dataviewName = this.dataviewName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final readWrite = this.readWrite;
    final segmentConfigurations = this.segmentConfigurations;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (activeVersions != null) 'activeVersions': activeVersions,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (dataviewName != null) 'dataviewName': dataviewName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (readWrite != null) 'readWrite': readWrite,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// The configuration that contains the database path of the data that you want
/// to place on each selected volume. Each segment must have a unique database
/// path for each volume. If you do not explicitly specify any database path for
/// a volume, they are accessible from the cluster through the default S3/object
/// store segment.
class KxDataviewSegmentConfiguration {
  /// The database path of the data that you want to place on each selected volume
  /// for the segment. Each segment must have a unique database path for each
  /// volume.
  final List<String> dbPaths;

  /// The name of the volume where you want to add data.
  final String volumeName;

  /// Enables on-demand caching on the selected database path when a particular
  /// file or a column of the database is accessed. When on demand caching is
  /// <b>True</b>, dataviews perform minimal loading of files on the filesystem as
  /// needed. When it is set to <b>False</b>, everything is cached. The default
  /// value is <b>False</b>.
  final bool? onDemand;

  KxDataviewSegmentConfiguration({
    required this.dbPaths,
    required this.volumeName,
    this.onDemand,
  });

  factory KxDataviewSegmentConfiguration.fromJson(Map<String, dynamic> json) {
    return KxDataviewSegmentConfiguration(
      dbPaths: (json['dbPaths'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      volumeName: json['volumeName'] as String,
      onDemand: json['onDemand'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbPaths = this.dbPaths;
    final volumeName = this.volumeName;
    final onDemand = this.onDemand;
    return {
      'dbPaths': dbPaths,
      'volumeName': volumeName,
      if (onDemand != null) 'onDemand': onDemand,
    };
  }
}

enum KxDataviewStatus {
  creating,
  active,
  updating,
  failed,
  deleting,
}

extension KxDataviewStatusValueExtension on KxDataviewStatus {
  String toValue() {
    switch (this) {
      case KxDataviewStatus.creating:
        return 'CREATING';
      case KxDataviewStatus.active:
        return 'ACTIVE';
      case KxDataviewStatus.updating:
        return 'UPDATING';
      case KxDataviewStatus.failed:
        return 'FAILED';
      case KxDataviewStatus.deleting:
        return 'DELETING';
    }
  }
}

extension KxDataviewStatusFromString on String {
  KxDataviewStatus toKxDataviewStatus() {
    switch (this) {
      case 'CREATING':
        return KxDataviewStatus.creating;
      case 'ACTIVE':
        return KxDataviewStatus.active;
      case 'UPDATING':
        return KxDataviewStatus.updating;
      case 'FAILED':
        return KxDataviewStatus.failed;
      case 'DELETING':
        return KxDataviewStatus.deleting;
    }
    throw Exception('$this is not known in enum KxDataviewStatus');
  }
}

/// The configuration that allows you to choose how you want to update the
/// databases on a cluster. Depending on the option you choose, you can reduce
/// the time it takes to update the cluster.
class KxDeploymentConfiguration {
  /// The type of deployment that you want on a cluster.
  ///
  /// <ul>
  /// <li>
  /// ROLLING – This options updates the cluster by stopping the exiting q process
  /// and starting a new q process with updated configuration.
  /// </li>
  /// <li>
  /// NO_RESTART – This option updates the cluster without stopping the running q
  /// process. It is only available for <code>HDB</code> type cluster. This option
  /// is quicker as it reduces the turn around time to update configuration on a
  /// cluster.
  ///
  /// With this deployment mode, you cannot update the
  /// <code>initializationScript</code> and <code>commandLineArguments</code>
  /// parameters.
  /// </li>
  /// </ul>
  final KxDeploymentStrategy deploymentStrategy;

  KxDeploymentConfiguration({
    required this.deploymentStrategy,
  });

  Map<String, dynamic> toJson() {
    final deploymentStrategy = this.deploymentStrategy;
    return {
      'deploymentStrategy': deploymentStrategy.toValue(),
    };
  }
}

enum KxDeploymentStrategy {
  noRestart,
  rolling,
}

extension KxDeploymentStrategyValueExtension on KxDeploymentStrategy {
  String toValue() {
    switch (this) {
      case KxDeploymentStrategy.noRestart:
        return 'NO_RESTART';
      case KxDeploymentStrategy.rolling:
        return 'ROLLING';
    }
  }
}

extension KxDeploymentStrategyFromString on String {
  KxDeploymentStrategy toKxDeploymentStrategy() {
    switch (this) {
      case 'NO_RESTART':
        return KxDeploymentStrategy.noRestart;
      case 'ROLLING':
        return KxDeploymentStrategy.rolling;
    }
    throw Exception('$this is not known in enum KxDeploymentStrategy');
  }
}

/// The details of a kdb environment.
class KxEnvironment {
  /// The identifier of the availability zones where subnets for the environment
  /// are created.
  final List<String>? availabilityZoneIds;

  /// The unique identifier of the AWS account in which you create the kdb
  /// environment.
  final String? awsAccountId;

  /// The Amazon Resource Name (ARN) of the certificate authority:
  final String? certificateAuthorityArn;

  /// The timestamp at which the kdb environment was created in FinSpace. The
  /// value is determined as epoch time in milliseconds. For example, the value
  /// for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? creationTimestamp;

  /// A list of DNS server name and server IP. This is used to set up Route-53
  /// outbound resolvers.
  final List<CustomDNSServer>? customDNSConfiguration;

  /// A unique identifier for the AWS environment infrastructure account.
  final String? dedicatedServiceAccountId;

  /// A description of the kdb environment.
  final String? description;

  /// The status of DNS configuration.
  final DnsStatus? dnsStatus;

  /// The Amazon Resource Name (ARN) of your kdb environment.
  final String? environmentArn;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// Specifies the error message that appears if a flow fails.
  final String? errorMessage;

  /// The unique identifier of the KMS key.
  final String? kmsKeyId;

  /// The name of the kdb environment.
  final String? name;

  /// The status of the environment creation.
  ///
  /// <ul>
  /// <li>
  /// CREATE_REQUESTED – Environment creation has been requested.
  /// </li>
  /// <li>
  /// CREATING – Environment is in the process of being created.
  /// </li>
  /// <li>
  /// FAILED_CREATION – Environment creation has failed.
  /// </li>
  /// <li>
  /// CREATED – Environment is successfully created and is currently active.
  /// </li>
  /// <li>
  /// DELETE REQUESTED – Environment deletion has been requested.
  /// </li>
  /// <li>
  /// DELETING – Environment is in the process of being deleted.
  /// </li>
  /// <li>
  /// RETRY_DELETION – Initial environment deletion failed, system is reattempting
  /// delete.
  /// </li>
  /// <li>
  /// DELETED – Environment has been deleted.
  /// </li>
  /// <li>
  /// FAILED_DELETION – Environment deletion has failed.
  /// </li>
  /// </ul>
  final EnvironmentStatus? status;

  /// The status of the network configuration.
  final TgwStatus? tgwStatus;

  /// Specifies the transit gateway and network configuration to connect the kdb
  /// environment to an internal network.
  final TransitGatewayConfiguration? transitGatewayConfiguration;

  /// The timestamp at which the kdb environment was modified in FinSpace. The
  /// value is determined as epoch time in milliseconds. For example, the value
  /// for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? updateTimestamp;

  KxEnvironment({
    this.availabilityZoneIds,
    this.awsAccountId,
    this.certificateAuthorityArn,
    this.creationTimestamp,
    this.customDNSConfiguration,
    this.dedicatedServiceAccountId,
    this.description,
    this.dnsStatus,
    this.environmentArn,
    this.environmentId,
    this.errorMessage,
    this.kmsKeyId,
    this.name,
    this.status,
    this.tgwStatus,
    this.transitGatewayConfiguration,
    this.updateTimestamp,
  });

  factory KxEnvironment.fromJson(Map<String, dynamic> json) {
    return KxEnvironment(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      awsAccountId: json['awsAccountId'] as String?,
      certificateAuthorityArn: json['certificateAuthorityArn'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      customDNSConfiguration: (json['customDNSConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDNSServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      dnsStatus: (json['dnsStatus'] as String?)?.toDnsStatus(),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      tgwStatus: (json['tgwStatus'] as String?)?.toTgwStatus(),
      transitGatewayConfiguration: json['transitGatewayConfiguration'] != null
          ? TransitGatewayConfiguration.fromJson(
              json['transitGatewayConfiguration'] as Map<String, dynamic>)
          : null,
      updateTimestamp: timeStampFromJson(json['updateTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final awsAccountId = this.awsAccountId;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final creationTimestamp = this.creationTimestamp;
    final customDNSConfiguration = this.customDNSConfiguration;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final dnsStatus = this.dnsStatus;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final errorMessage = this.errorMessage;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final status = this.status;
    final tgwStatus = this.tgwStatus;
    final transitGatewayConfiguration = this.transitGatewayConfiguration;
    final updateTimestamp = this.updateTimestamp;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (certificateAuthorityArn != null)
        'certificateAuthorityArn': certificateAuthorityArn,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (customDNSConfiguration != null)
        'customDNSConfiguration': customDNSConfiguration,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (dnsStatus != null) 'dnsStatus': dnsStatus.toValue(),
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tgwStatus != null) 'tgwStatus': tgwStatus.toValue(),
      if (transitGatewayConfiguration != null)
        'transitGatewayConfiguration': transitGatewayConfiguration,
      if (updateTimestamp != null)
        'updateTimestamp': unixTimestampToJson(updateTimestamp),
    };
  }
}

/// The structure containing the size and type of the network attached storage
/// (NAS_1) file system volume.
class KxNAS1Configuration {
  /// The size of the network attached storage. For storage type
  /// <code>SSD_1000</code> and <code>SSD_250</code> you can select the minimum
  /// size as 1200 GB or increments of 2400 GB. For storage type
  /// <code>HDD_12</code> you can select the minimum size as 6000 GB or increments
  /// of 6000 GB.
  final int? size;

  /// The type of the network attached storage.
  final KxNAS1Type? type;

  KxNAS1Configuration({
    this.size,
    this.type,
  });

  factory KxNAS1Configuration.fromJson(Map<String, dynamic> json) {
    return KxNAS1Configuration(
      size: json['size'] as int?,
      type: (json['type'] as String?)?.toKxNAS1Type(),
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    final type = this.type;
    return {
      if (size != null) 'size': size,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum KxNAS1Type {
  ssd_1000,
  ssd_250,
  hdd_12,
}

extension KxNAS1TypeValueExtension on KxNAS1Type {
  String toValue() {
    switch (this) {
      case KxNAS1Type.ssd_1000:
        return 'SSD_1000';
      case KxNAS1Type.ssd_250:
        return 'SSD_250';
      case KxNAS1Type.hdd_12:
        return 'HDD_12';
    }
  }
}

extension KxNAS1TypeFromString on String {
  KxNAS1Type toKxNAS1Type() {
    switch (this) {
      case 'SSD_1000':
        return KxNAS1Type.ssd_1000;
      case 'SSD_250':
        return KxNAS1Type.ssd_250;
      case 'HDD_12':
        return KxNAS1Type.hdd_12;
    }
    throw Exception('$this is not known in enum KxNAS1Type');
  }
}

/// A structure that stores metadata for a kdb node.
class KxNode {
  /// The identifier of the availability zones where subnets for the environment
  /// are created.
  final String? availabilityZoneId;

  /// The time when a particular node is started. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? launchTime;

  /// A unique identifier for the node.
  final String? nodeId;

  /// Specifies the status of the cluster nodes.
  ///
  /// <ul>
  /// <li>
  /// <code>RUNNING</code> – The node is actively serving.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code> – The node is being prepared.
  /// </li>
  /// </ul>
  final KxNodeStatus? status;

  KxNode({
    this.availabilityZoneId,
    this.launchTime,
    this.nodeId,
    this.status,
  });

  factory KxNode.fromJson(Map<String, dynamic> json) {
    return KxNode(
      availabilityZoneId: json['availabilityZoneId'] as String?,
      launchTime: timeStampFromJson(json['launchTime']),
      nodeId: json['nodeId'] as String?,
      status: (json['status'] as String?)?.toKxNodeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final launchTime = this.launchTime;
    final nodeId = this.nodeId;
    final status = this.status;
    return {
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (launchTime != null) 'launchTime': unixTimestampToJson(launchTime),
      if (nodeId != null) 'nodeId': nodeId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum KxNodeStatus {
  running,
  provisioning,
}

extension KxNodeStatusValueExtension on KxNodeStatus {
  String toValue() {
    switch (this) {
      case KxNodeStatus.running:
        return 'RUNNING';
      case KxNodeStatus.provisioning:
        return 'PROVISIONING';
    }
  }
}

extension KxNodeStatusFromString on String {
  KxNodeStatus toKxNodeStatus() {
    switch (this) {
      case 'RUNNING':
        return KxNodeStatus.running;
      case 'PROVISIONING':
        return KxNodeStatus.provisioning;
    }
    throw Exception('$this is not known in enum KxNodeStatus');
  }
}

/// The size and type of temporary storage that is used to hold data during the
/// savedown process. All the data written to this storage space is lost when
/// the cluster node is restarted.
class KxSavedownStorageConfiguration {
  /// The size of temporary storage in gibibytes.
  final int? size;

  /// The type of writeable storage space for temporarily storing your savedown
  /// data. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// SDS01 – This type represents 3000 IOPS and io2 ebs volume type.
  /// </li>
  /// </ul>
  final KxSavedownStorageType? type;

  /// The name of the kdb volume that you want to use as writeable save-down
  /// storage for clusters.
  final String? volumeName;

  KxSavedownStorageConfiguration({
    this.size,
    this.type,
    this.volumeName,
  });

  factory KxSavedownStorageConfiguration.fromJson(Map<String, dynamic> json) {
    return KxSavedownStorageConfiguration(
      size: json['size'] as int?,
      type: (json['type'] as String?)?.toKxSavedownStorageType(),
      volumeName: json['volumeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    final type = this.type;
    final volumeName = this.volumeName;
    return {
      if (size != null) 'size': size,
      if (type != null) 'type': type.toValue(),
      if (volumeName != null) 'volumeName': volumeName,
    };
  }
}

enum KxSavedownStorageType {
  sds01,
}

extension KxSavedownStorageTypeValueExtension on KxSavedownStorageType {
  String toValue() {
    switch (this) {
      case KxSavedownStorageType.sds01:
        return 'SDS01';
    }
  }
}

extension KxSavedownStorageTypeFromString on String {
  KxSavedownStorageType toKxSavedownStorageType() {
    switch (this) {
      case 'SDS01':
        return KxSavedownStorageType.sds01;
    }
    throw Exception('$this is not known in enum KxSavedownStorageType');
  }
}

/// A structure for storing metadata of scaling group.
class KxScalingGroup {
  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The list of clusters currently active in a given scaling group.
  final List<String>? clusters;

  /// The timestamp at which the scaling group was created in FinSpace. The value
  /// is determined as epoch time in milliseconds. For example, the value for
  /// Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The memory and CPU capabilities of the scaling group host on which FinSpace
  /// Managed kdb clusters will be placed.
  ///
  /// You can add one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>kx.sg.4xlarge</code> – The host type with a configuration of 108 GiB
  /// memory and 16 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.8xlarge</code> – The host type with a configuration of 216 GiB
  /// memory and 32 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.16xlarge</code> – The host type with a configuration of 432 GiB
  /// memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg.32xlarge</code> – The host type with a configuration of 864 GiB
  /// memory and 128 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.16xlarge</code> – The host type with a configuration of 1949
  /// GiB memory and 64 vCPUs.
  /// </li>
  /// <li>
  /// <code>kx.sg1.24xlarge</code> – The host type with a configuration of 2948
  /// GiB memory and 96 vCPUs.
  /// </li>
  /// </ul>
  final String? hostType;

  /// The last time that the scaling group was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// A unique identifier for the kdb scaling group.
  final String? scalingGroupName;

  /// The status of scaling groups.
  final KxScalingGroupStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  KxScalingGroup({
    this.availabilityZoneId,
    this.clusters,
    this.createdTimestamp,
    this.hostType,
    this.lastModifiedTimestamp,
    this.scalingGroupName,
    this.status,
    this.statusReason,
  });

  factory KxScalingGroup.fromJson(Map<String, dynamic> json) {
    return KxScalingGroup(
      availabilityZoneId: json['availabilityZoneId'] as String?,
      clusters: (json['clusters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      hostType: json['hostType'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      scalingGroupName: json['scalingGroupName'] as String?,
      status: (json['status'] as String?)?.toKxScalingGroupStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final clusters = this.clusters;
    final createdTimestamp = this.createdTimestamp;
    final hostType = this.hostType;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final scalingGroupName = this.scalingGroupName;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (clusters != null) 'clusters': clusters,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (hostType != null) 'hostType': hostType,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (scalingGroupName != null) 'scalingGroupName': scalingGroupName,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// The structure that stores the capacity configuration details of a scaling
/// group.
class KxScalingGroupConfiguration {
  /// A reservation of the minimum amount of memory that should be available on
  /// the scaling group for a kdb cluster to be successfully placed in a scaling
  /// group.
  final int memoryReservation;

  /// The number of kdb cluster nodes.
  final int nodeCount;

  /// A unique identifier for the kdb scaling group.
  final String scalingGroupName;

  /// The number of vCPUs that you want to reserve for each node of this kdb
  /// cluster on the scaling group host.
  final double? cpu;

  /// An optional hard limit on the amount of memory a kdb cluster can use.
  final int? memoryLimit;

  KxScalingGroupConfiguration({
    required this.memoryReservation,
    required this.nodeCount,
    required this.scalingGroupName,
    this.cpu,
    this.memoryLimit,
  });

  factory KxScalingGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return KxScalingGroupConfiguration(
      memoryReservation: json['memoryReservation'] as int,
      nodeCount: json['nodeCount'] as int,
      scalingGroupName: json['scalingGroupName'] as String,
      cpu: json['cpu'] as double?,
      memoryLimit: json['memoryLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryReservation = this.memoryReservation;
    final nodeCount = this.nodeCount;
    final scalingGroupName = this.scalingGroupName;
    final cpu = this.cpu;
    final memoryLimit = this.memoryLimit;
    return {
      'memoryReservation': memoryReservation,
      'nodeCount': nodeCount,
      'scalingGroupName': scalingGroupName,
      if (cpu != null) 'cpu': cpu,
      if (memoryLimit != null) 'memoryLimit': memoryLimit,
    };
  }
}

enum KxScalingGroupStatus {
  creating,
  createFailed,
  active,
  deleting,
  deleted,
  deleteFailed,
}

extension KxScalingGroupStatusValueExtension on KxScalingGroupStatus {
  String toValue() {
    switch (this) {
      case KxScalingGroupStatus.creating:
        return 'CREATING';
      case KxScalingGroupStatus.createFailed:
        return 'CREATE_FAILED';
      case KxScalingGroupStatus.active:
        return 'ACTIVE';
      case KxScalingGroupStatus.deleting:
        return 'DELETING';
      case KxScalingGroupStatus.deleted:
        return 'DELETED';
      case KxScalingGroupStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension KxScalingGroupStatusFromString on String {
  KxScalingGroupStatus toKxScalingGroupStatus() {
    switch (this) {
      case 'CREATING':
        return KxScalingGroupStatus.creating;
      case 'CREATE_FAILED':
        return KxScalingGroupStatus.createFailed;
      case 'ACTIVE':
        return KxScalingGroupStatus.active;
      case 'DELETING':
        return KxScalingGroupStatus.deleting;
      case 'DELETED':
        return KxScalingGroupStatus.deleted;
      case 'DELETE_FAILED':
        return KxScalingGroupStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum KxScalingGroupStatus');
  }
}

/// A structure that stores metadata for a kdb user.
class KxUser {
  /// The timestamp at which the kdb user was created.
  final DateTime? createTimestamp;

  /// The IAM role ARN that is associated with the user.
  final String? iamRole;

  /// The timestamp at which the kdb user was updated.
  final DateTime? updateTimestamp;

  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String? userArn;

  /// A unique identifier for the user.
  final String? userName;

  KxUser({
    this.createTimestamp,
    this.iamRole,
    this.updateTimestamp,
    this.userArn,
    this.userName,
  });

  factory KxUser.fromJson(Map<String, dynamic> json) {
    return KxUser(
      createTimestamp: timeStampFromJson(json['createTimestamp']),
      iamRole: json['iamRole'] as String?,
      updateTimestamp: timeStampFromJson(json['updateTimestamp']),
      userArn: json['userArn'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTimestamp = this.createTimestamp;
    final iamRole = this.iamRole;
    final updateTimestamp = this.updateTimestamp;
    final userArn = this.userArn;
    final userName = this.userName;
    return {
      if (createTimestamp != null)
        'createTimestamp': unixTimestampToJson(createTimestamp),
      if (iamRole != null) 'iamRole': iamRole,
      if (updateTimestamp != null)
        'updateTimestamp': unixTimestampToJson(updateTimestamp),
      if (userArn != null) 'userArn': userArn,
      if (userName != null) 'userName': userName,
    };
  }
}

/// The structure that contains the metadata of the volume.
class KxVolume {
  /// The identifier of the availability zones.
  final List<String>? availabilityZoneIds;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// The timestamp at which the volume was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// A description of the volume.
  final String? description;

  /// The last time that the volume was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// The status of volume.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The volume creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The volume creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The volume is active.
  /// </li>
  /// <li>
  /// UPDATING – The volume is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// UPDATED – The volume is successfully updated.
  /// </li>
  /// <li>
  /// DELETING – The volume is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the volume.
  /// </li>
  /// <li>
  /// DELETED – The volume is successfully deleted.
  /// </li>
  /// </ul>
  final KxVolumeStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  /// A unique identifier for the volume.
  final String? volumeName;

  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  final KxVolumeType? volumeType;

  KxVolume({
    this.availabilityZoneIds,
    this.azMode,
    this.createdTimestamp,
    this.description,
    this.lastModifiedTimestamp,
    this.status,
    this.statusReason,
    this.volumeName,
    this.volumeType,
  });

  factory KxVolume.fromJson(Map<String, dynamic> json) {
    return KxVolume(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      description: json['description'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      status: (json['status'] as String?)?.toKxVolumeStatus(),
      statusReason: json['statusReason'] as String?,
      volumeName: json['volumeName'] as String?,
      volumeType: (json['volumeType'] as String?)?.toKxVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final azMode = this.azMode;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final status = this.status;
    final statusReason = this.statusReason;
    final volumeName = this.volumeName;
    final volumeType = this.volumeType;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'description': description,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (volumeName != null) 'volumeName': volumeName,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

enum KxVolumeStatus {
  creating,
  createFailed,
  active,
  updating,
  updated,
  updateFailed,
  deleting,
  deleted,
  deleteFailed,
}

extension KxVolumeStatusValueExtension on KxVolumeStatus {
  String toValue() {
    switch (this) {
      case KxVolumeStatus.creating:
        return 'CREATING';
      case KxVolumeStatus.createFailed:
        return 'CREATE_FAILED';
      case KxVolumeStatus.active:
        return 'ACTIVE';
      case KxVolumeStatus.updating:
        return 'UPDATING';
      case KxVolumeStatus.updated:
        return 'UPDATED';
      case KxVolumeStatus.updateFailed:
        return 'UPDATE_FAILED';
      case KxVolumeStatus.deleting:
        return 'DELETING';
      case KxVolumeStatus.deleted:
        return 'DELETED';
      case KxVolumeStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension KxVolumeStatusFromString on String {
  KxVolumeStatus toKxVolumeStatus() {
    switch (this) {
      case 'CREATING':
        return KxVolumeStatus.creating;
      case 'CREATE_FAILED':
        return KxVolumeStatus.createFailed;
      case 'ACTIVE':
        return KxVolumeStatus.active;
      case 'UPDATING':
        return KxVolumeStatus.updating;
      case 'UPDATED':
        return KxVolumeStatus.updated;
      case 'UPDATE_FAILED':
        return KxVolumeStatus.updateFailed;
      case 'DELETING':
        return KxVolumeStatus.deleting;
      case 'DELETED':
        return KxVolumeStatus.deleted;
      case 'DELETE_FAILED':
        return KxVolumeStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum KxVolumeStatus');
  }
}

enum KxVolumeType {
  nas_1,
}

extension KxVolumeTypeValueExtension on KxVolumeType {
  String toValue() {
    switch (this) {
      case KxVolumeType.nas_1:
        return 'NAS_1';
    }
  }
}

extension KxVolumeTypeFromString on String {
  KxVolumeType toKxVolumeType() {
    switch (this) {
      case 'NAS_1':
        return KxVolumeType.nas_1;
    }
    throw Exception('$this is not known in enum KxVolumeType');
  }
}

class ListEnvironmentsResponse {
  /// A list of all of your FinSpace environments.
  final List<Environment>? environments;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListEnvironmentsResponse({
    this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environments: (json['environments'] as List?)
          ?.whereNotNull()
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      if (environments != null) 'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxChangesetsResponse {
  /// A list of changesets for a database.
  final List<KxChangesetListEntry>? kxChangesets;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxChangesetsResponse({
    this.kxChangesets,
    this.nextToken,
  });

  factory ListKxChangesetsResponse.fromJson(Map<String, dynamic> json) {
    return ListKxChangesetsResponse(
      kxChangesets: (json['kxChangesets'] as List?)
          ?.whereNotNull()
          .map((e) => KxChangesetListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kxChangesets = this.kxChangesets;
    final nextToken = this.nextToken;
    return {
      if (kxChangesets != null) 'kxChangesets': kxChangesets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxClusterNodesResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of nodes associated with the cluster.
  final List<KxNode>? nodes;

  ListKxClusterNodesResponse({
    this.nextToken,
    this.nodes,
  });

  factory ListKxClusterNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListKxClusterNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodes: (json['nodes'] as List?)
          ?.whereNotNull()
          .map((e) => KxNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodes = this.nodes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (nodes != null) 'nodes': nodes,
    };
  }
}

class ListKxClustersResponse {
  /// Lists the cluster details.
  final List<KxCluster>? kxClusterSummaries;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxClustersResponse({
    this.kxClusterSummaries,
    this.nextToken,
  });

  factory ListKxClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListKxClustersResponse(
      kxClusterSummaries: (json['kxClusterSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => KxCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kxClusterSummaries = this.kxClusterSummaries;
    final nextToken = this.nextToken;
    return {
      if (kxClusterSummaries != null) 'kxClusterSummaries': kxClusterSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxDatabasesResponse {
  /// A list of databases in the kdb environment.
  final List<KxDatabaseListEntry>? kxDatabases;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxDatabasesResponse({
    this.kxDatabases,
    this.nextToken,
  });

  factory ListKxDatabasesResponse.fromJson(Map<String, dynamic> json) {
    return ListKxDatabasesResponse(
      kxDatabases: (json['kxDatabases'] as List?)
          ?.whereNotNull()
          .map((e) => KxDatabaseListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kxDatabases = this.kxDatabases;
    final nextToken = this.nextToken;
    return {
      if (kxDatabases != null) 'kxDatabases': kxDatabases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxDataviewsResponse {
  /// The list of kdb dataviews that are currently active for the given database.
  final List<KxDataviewListEntry>? kxDataviews;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxDataviewsResponse({
    this.kxDataviews,
    this.nextToken,
  });

  factory ListKxDataviewsResponse.fromJson(Map<String, dynamic> json) {
    return ListKxDataviewsResponse(
      kxDataviews: (json['kxDataviews'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kxDataviews = this.kxDataviews;
    final nextToken = this.nextToken;
    return {
      if (kxDataviews != null) 'kxDataviews': kxDataviews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxEnvironmentsResponse {
  /// A list of environments in an account.
  final List<KxEnvironment>? environments;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxEnvironmentsResponse({
    this.environments,
    this.nextToken,
  });

  factory ListKxEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListKxEnvironmentsResponse(
      environments: (json['environments'] as List?)
          ?.whereNotNull()
          .map((e) => KxEnvironment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      if (environments != null) 'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKxScalingGroupsResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of scaling groups available in a kdb environment.
  final List<KxScalingGroup>? scalingGroups;

  ListKxScalingGroupsResponse({
    this.nextToken,
    this.scalingGroups,
  });

  factory ListKxScalingGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListKxScalingGroupsResponse(
      nextToken: json['nextToken'] as String?,
      scalingGroups: (json['scalingGroups'] as List?)
          ?.whereNotNull()
          .map((e) => KxScalingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingGroups = this.scalingGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scalingGroups != null) 'scalingGroups': scalingGroups,
    };
  }
}

class ListKxUsersResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of users in a kdb environment.
  final List<KxUser>? users;

  ListKxUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListKxUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListKxUsersResponse(
      nextToken: json['nextToken'] as String?,
      users: (json['users'] as List?)
          ?.whereNotNull()
          .map((e) => KxUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (users != null) 'users': users,
    };
  }
}

class ListKxVolumesResponse {
  /// A summary of volumes.
  final List<KxVolume>? kxVolumeSummaries;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListKxVolumesResponse({
    this.kxVolumeSummaries,
    this.nextToken,
  });

  factory ListKxVolumesResponse.fromJson(Map<String, dynamic> json) {
    return ListKxVolumesResponse(
      kxVolumeSummaries: (json['kxVolumeSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => KxVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kxVolumeSummaries = this.kxVolumeSummaries;
    final nextToken = this.nextToken;
    return {
      if (kxVolumeSummaries != null) 'kxVolumeSummaries': kxVolumeSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of all tags for a resource.
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

/// The network access control list (ACL) is an optional layer of security for
/// your VPC that acts as a firewall for controlling traffic in and out of one
/// or more subnets. The entry is a set of numbered ingress and egress rules
/// that determine whether a packet should be allowed in or out of a subnet
/// associated with the ACL. We process the entries in the ACL according to the
/// rule numbers, in ascending order.
class NetworkACLEntry {
  /// The IPv4 network range to allow or deny, in CIDR notation. For example,
  /// <code>172.16.0.0/24</code>. We modify the specified CIDR block to its
  /// canonical form. For example, if you specify <code>100.68.0.18/18</code>, we
  /// modify it to <code>100.68.0.0/18</code>.
  final String cidrBlock;

  /// The protocol number. A value of <i>-1</i> means all the protocols.
  final String protocol;

  /// Indicates whether to allow or deny the traffic that matches the rule.
  final RuleAction ruleAction;

  /// The rule number for the entry. For example <i>100</i>. All the network ACL
  /// entries are processed in ascending order by rule number.
  final int ruleNumber;

  /// Defines the ICMP protocol that consists of the ICMP type and code.
  final IcmpTypeCode? icmpTypeCode;

  /// The range of ports the rule applies to.
  final PortRange? portRange;

  NetworkACLEntry({
    required this.cidrBlock,
    required this.protocol,
    required this.ruleAction,
    required this.ruleNumber,
    this.icmpTypeCode,
    this.portRange,
  });

  factory NetworkACLEntry.fromJson(Map<String, dynamic> json) {
    return NetworkACLEntry(
      cidrBlock: json['cidrBlock'] as String,
      protocol: json['protocol'] as String,
      ruleAction: (json['ruleAction'] as String).toRuleAction(),
      ruleNumber: json['ruleNumber'] as int,
      icmpTypeCode: json['icmpTypeCode'] != null
          ? IcmpTypeCode.fromJson(json['icmpTypeCode'] as Map<String, dynamic>)
          : null,
      portRange: json['portRange'] != null
          ? PortRange.fromJson(json['portRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlock = this.cidrBlock;
    final protocol = this.protocol;
    final ruleAction = this.ruleAction;
    final ruleNumber = this.ruleNumber;
    final icmpTypeCode = this.icmpTypeCode;
    final portRange = this.portRange;
    return {
      'cidrBlock': cidrBlock,
      'protocol': protocol,
      'ruleAction': ruleAction.toValue(),
      'ruleNumber': ruleNumber,
      if (icmpTypeCode != null) 'icmpTypeCode': icmpTypeCode,
      if (portRange != null) 'portRange': portRange,
    };
  }
}

/// The range of ports the rule applies to.
class PortRange {
  /// The first port in the range.
  final int from;

  /// The last port in the range.
  final int to;

  PortRange({
    required this.from,
    required this.to,
  });

  factory PortRange.fromJson(Map<String, dynamic> json) {
    return PortRange(
      from: json['from'] as int,
      to: json['to'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      'from': from,
      'to': to,
    };
  }
}

enum RuleAction {
  allow,
  deny,
}

extension RuleActionValueExtension on RuleAction {
  String toValue() {
    switch (this) {
      case RuleAction.allow:
        return 'allow';
      case RuleAction.deny:
        return 'deny';
    }
  }
}

extension RuleActionFromString on String {
  RuleAction toRuleAction() {
    switch (this) {
      case 'allow':
        return RuleAction.allow;
      case 'deny':
        return RuleAction.deny;
    }
    throw Exception('$this is not known in enum RuleAction');
  }
}

/// Configuration information for the superuser.
class SuperuserParameters {
  /// The email address of the superuser.
  final String emailAddress;

  /// The first name of the superuser.
  final String firstName;

  /// The last name of the superuser.
  final String lastName;

  SuperuserParameters({
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      'emailAddress': emailAddress,
      'firstName': firstName,
      'lastName': lastName,
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

/// A configuration to store the Tickerplant logs. It consists of a list of
/// volumes that will be mounted to your cluster. For the cluster type
/// <code>Tickerplant</code>, the location of the TP volume on the cluster will
/// be available by using the global variable <code>.aws.tp_log_path</code>.
class TickerplantLogConfiguration {
  /// The name of the volumes for tickerplant logs.
  final List<String>? tickerplantLogVolumes;

  TickerplantLogConfiguration({
    this.tickerplantLogVolumes,
  });

  factory TickerplantLogConfiguration.fromJson(Map<String, dynamic> json) {
    return TickerplantLogConfiguration(
      tickerplantLogVolumes: (json['tickerplantLogVolumes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tickerplantLogVolumes = this.tickerplantLogVolumes;
    return {
      if (tickerplantLogVolumes != null)
        'tickerplantLogVolumes': tickerplantLogVolumes,
    };
  }
}

/// The structure of the transit gateway and network configuration that is used
/// to connect the kdb environment to an internal network.
class TransitGatewayConfiguration {
  /// The routing CIDR on behalf of kdb environment. It could be any "/26 range in
  /// the 100.64.0.0 CIDR space. After providing, it will be added to the
  /// customer's transit gateway routing table so that the traffics could be
  /// routed to kdb network.
  final String routableCIDRSpace;

  /// The identifier of the transit gateway created by the customer to connect
  /// outbound traffics from kdb network to your internal network.
  final String transitGatewayID;

  /// The rules that define how you manage the outbound traffic from kdb network
  /// to your internal network.
  final List<NetworkACLEntry>? attachmentNetworkAclConfiguration;

  TransitGatewayConfiguration({
    required this.routableCIDRSpace,
    required this.transitGatewayID,
    this.attachmentNetworkAclConfiguration,
  });

  factory TransitGatewayConfiguration.fromJson(Map<String, dynamic> json) {
    return TransitGatewayConfiguration(
      routableCIDRSpace: json['routableCIDRSpace'] as String,
      transitGatewayID: json['transitGatewayID'] as String,
      attachmentNetworkAclConfiguration:
          (json['attachmentNetworkAclConfiguration'] as List?)
              ?.whereNotNull()
              .map((e) => NetworkACLEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final routableCIDRSpace = this.routableCIDRSpace;
    final transitGatewayID = this.transitGatewayID;
    final attachmentNetworkAclConfiguration =
        this.attachmentNetworkAclConfiguration;
    return {
      'routableCIDRSpace': routableCIDRSpace,
      'transitGatewayID': transitGatewayID,
      if (attachmentNetworkAclConfiguration != null)
        'attachmentNetworkAclConfiguration': attachmentNetworkAclConfiguration,
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

class UpdateEnvironmentResponse {
  /// Returns the FinSpace environment object.
  final Environment? environment;

  UpdateEnvironmentResponse({
    this.environment,
  });

  factory UpdateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentResponse(
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

class UpdateKxClusterCodeConfigurationResponse {
  UpdateKxClusterCodeConfigurationResponse();

  factory UpdateKxClusterCodeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateKxClusterCodeConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateKxClusterDatabasesResponse {
  UpdateKxClusterDatabasesResponse();

  factory UpdateKxClusterDatabasesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateKxClusterDatabasesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateKxDatabaseResponse {
  /// The name of the kdb database.
  final String? databaseName;

  /// A description of the database.
  final String? description;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The last time that the database was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  UpdateKxDatabaseResponse({
    this.databaseName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
  });

  factory UpdateKxDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKxDatabaseResponse(
      databaseName: json['databaseName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    return {
      if (databaseName != null) 'databaseName': databaseName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
    };
  }
}

class UpdateKxDataviewResponse {
  /// The current active changeset versions of the database on the given dataview.
  final List<KxDataviewActiveVersion>? activeVersions;

  /// The option to specify whether you want to apply all the future additions and
  /// corrections automatically to the dataview when new changesets are ingested.
  /// The default value is false.
  final bool? autoUpdate;

  /// The identifier of the availability zones.
  final String? availabilityZoneId;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// A unique identifier for the changeset.
  final String? changesetId;

  /// The timestamp at which the dataview was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The name of the database.
  final String? databaseName;

  /// The name of the database under which the dataview was created.
  final String? dataviewName;

  /// A description of the dataview.
  final String? description;

  /// A unique identifier for the kdb environment, where you want to update the
  /// dataview.
  final String? environmentId;

  /// The last time that the dataview was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Returns True if the dataview is created as writeable and False otherwise.
  final bool? readWrite;

  /// The configuration that contains the database path of the data that you want
  /// to place on each selected volume. Each segment must have a unique database
  /// path for each volume. If you do not explicitly specify any database path for
  /// a volume, they are accessible from the cluster through the default S3/object
  /// store segment.
  final List<KxDataviewSegmentConfiguration>? segmentConfigurations;

  /// The status of dataview creation.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The dataview creation is in progress.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> – The dataview is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> – The dataview is active.
  /// </li>
  /// </ul>
  final KxDataviewStatus? status;

  UpdateKxDataviewResponse({
    this.activeVersions,
    this.autoUpdate,
    this.availabilityZoneId,
    this.azMode,
    this.changesetId,
    this.createdTimestamp,
    this.databaseName,
    this.dataviewName,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.readWrite,
    this.segmentConfigurations,
    this.status,
  });

  factory UpdateKxDataviewResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKxDataviewResponse(
      activeVersions: (json['activeVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KxDataviewActiveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoUpdate: json['autoUpdate'] as bool?,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      changesetId: json['changesetId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      databaseName: json['databaseName'] as String?,
      dataviewName: json['dataviewName'] as String?,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      readWrite: json['readWrite'] as bool?,
      segmentConfigurations: (json['segmentConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => KxDataviewSegmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toKxDataviewStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeVersions = this.activeVersions;
    final autoUpdate = this.autoUpdate;
    final availabilityZoneId = this.availabilityZoneId;
    final azMode = this.azMode;
    final changesetId = this.changesetId;
    final createdTimestamp = this.createdTimestamp;
    final databaseName = this.databaseName;
    final dataviewName = this.dataviewName;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final readWrite = this.readWrite;
    final segmentConfigurations = this.segmentConfigurations;
    final status = this.status;
    return {
      if (activeVersions != null) 'activeVersions': activeVersions,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (changesetId != null) 'changesetId': changesetId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (databaseName != null) 'databaseName': databaseName,
      if (dataviewName != null) 'dataviewName': dataviewName,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (readWrite != null) 'readWrite': readWrite,
      if (segmentConfigurations != null)
        'segmentConfigurations': segmentConfigurations,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateKxEnvironmentNetworkResponse {
  /// The identifier of the availability zones where subnets for the environment
  /// are created.
  final List<String>? availabilityZoneIds;

  /// The unique identifier of the AWS account that is used to create the kdb
  /// environment.
  final String? awsAccountId;

  /// The timestamp at which the kdb environment was created in FinSpace.
  final DateTime? creationTimestamp;

  /// A list of DNS server name and server IP. This is used to set up Route-53
  /// outbound resolvers.
  final List<CustomDNSServer>? customDNSConfiguration;

  /// A unique identifier for the AWS environment infrastructure account.
  final String? dedicatedServiceAccountId;

  /// The description of the environment.
  final String? description;

  /// The status of DNS configuration.
  final DnsStatus? dnsStatus;

  /// The ARN identifier of the environment.
  final String? environmentArn;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// Specifies the error message that appears if a flow fails.
  final String? errorMessage;

  /// The KMS key ID to encrypt your data in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the kdb environment.
  final String? name;

  /// The status of the kdb environment.
  final EnvironmentStatus? status;

  /// The status of the network configuration.
  final TgwStatus? tgwStatus;
  final TransitGatewayConfiguration? transitGatewayConfiguration;

  /// The timestamp at which the kdb environment was updated.
  final DateTime? updateTimestamp;

  UpdateKxEnvironmentNetworkResponse({
    this.availabilityZoneIds,
    this.awsAccountId,
    this.creationTimestamp,
    this.customDNSConfiguration,
    this.dedicatedServiceAccountId,
    this.description,
    this.dnsStatus,
    this.environmentArn,
    this.environmentId,
    this.errorMessage,
    this.kmsKeyId,
    this.name,
    this.status,
    this.tgwStatus,
    this.transitGatewayConfiguration,
    this.updateTimestamp,
  });

  factory UpdateKxEnvironmentNetworkResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateKxEnvironmentNetworkResponse(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      awsAccountId: json['awsAccountId'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      customDNSConfiguration: (json['customDNSConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDNSServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      dnsStatus: (json['dnsStatus'] as String?)?.toDnsStatus(),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      tgwStatus: (json['tgwStatus'] as String?)?.toTgwStatus(),
      transitGatewayConfiguration: json['transitGatewayConfiguration'] != null
          ? TransitGatewayConfiguration.fromJson(
              json['transitGatewayConfiguration'] as Map<String, dynamic>)
          : null,
      updateTimestamp: timeStampFromJson(json['updateTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final awsAccountId = this.awsAccountId;
    final creationTimestamp = this.creationTimestamp;
    final customDNSConfiguration = this.customDNSConfiguration;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final dnsStatus = this.dnsStatus;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final errorMessage = this.errorMessage;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final status = this.status;
    final tgwStatus = this.tgwStatus;
    final transitGatewayConfiguration = this.transitGatewayConfiguration;
    final updateTimestamp = this.updateTimestamp;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (customDNSConfiguration != null)
        'customDNSConfiguration': customDNSConfiguration,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (dnsStatus != null) 'dnsStatus': dnsStatus.toValue(),
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tgwStatus != null) 'tgwStatus': tgwStatus.toValue(),
      if (transitGatewayConfiguration != null)
        'transitGatewayConfiguration': transitGatewayConfiguration,
      if (updateTimestamp != null)
        'updateTimestamp': unixTimestampToJson(updateTimestamp),
    };
  }
}

class UpdateKxEnvironmentResponse {
  /// The identifier of the availability zones where subnets for the environment
  /// are created.
  final List<String>? availabilityZoneIds;

  /// The unique identifier of the AWS account that is used to create the kdb
  /// environment.
  final String? awsAccountId;

  /// The timestamp at which the kdb environment was created in FinSpace.
  final DateTime? creationTimestamp;

  /// A list of DNS server name and server IP. This is used to set up Route-53
  /// outbound resolvers.
  final List<CustomDNSServer>? customDNSConfiguration;

  /// A unique identifier for the AWS environment infrastructure account.
  final String? dedicatedServiceAccountId;

  /// The description of the environment.
  final String? description;

  /// The status of DNS configuration.
  final DnsStatus? dnsStatus;

  /// The ARN identifier of the environment.
  final String? environmentArn;

  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// Specifies the error message that appears if a flow fails.
  final String? errorMessage;

  /// The KMS key ID to encrypt your data in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the kdb environment.
  final String? name;

  /// The status of the kdb environment.
  final EnvironmentStatus? status;

  /// The status of the network configuration.
  final TgwStatus? tgwStatus;
  final TransitGatewayConfiguration? transitGatewayConfiguration;

  /// The timestamp at which the kdb environment was updated.
  final DateTime? updateTimestamp;

  UpdateKxEnvironmentResponse({
    this.availabilityZoneIds,
    this.awsAccountId,
    this.creationTimestamp,
    this.customDNSConfiguration,
    this.dedicatedServiceAccountId,
    this.description,
    this.dnsStatus,
    this.environmentArn,
    this.environmentId,
    this.errorMessage,
    this.kmsKeyId,
    this.name,
    this.status,
    this.tgwStatus,
    this.transitGatewayConfiguration,
    this.updateTimestamp,
  });

  factory UpdateKxEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKxEnvironmentResponse(
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      awsAccountId: json['awsAccountId'] as String?,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      customDNSConfiguration: (json['customDNSConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDNSServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      dnsStatus: (json['dnsStatus'] as String?)?.toDnsStatus(),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      tgwStatus: (json['tgwStatus'] as String?)?.toTgwStatus(),
      transitGatewayConfiguration: json['transitGatewayConfiguration'] != null
          ? TransitGatewayConfiguration.fromJson(
              json['transitGatewayConfiguration'] as Map<String, dynamic>)
          : null,
      updateTimestamp: timeStampFromJson(json['updateTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneIds = this.availabilityZoneIds;
    final awsAccountId = this.awsAccountId;
    final creationTimestamp = this.creationTimestamp;
    final customDNSConfiguration = this.customDNSConfiguration;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final dnsStatus = this.dnsStatus;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final errorMessage = this.errorMessage;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final status = this.status;
    final tgwStatus = this.tgwStatus;
    final transitGatewayConfiguration = this.transitGatewayConfiguration;
    final updateTimestamp = this.updateTimestamp;
    return {
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (customDNSConfiguration != null)
        'customDNSConfiguration': customDNSConfiguration,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (dnsStatus != null) 'dnsStatus': dnsStatus.toValue(),
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tgwStatus != null) 'tgwStatus': tgwStatus.toValue(),
      if (transitGatewayConfiguration != null)
        'transitGatewayConfiguration': transitGatewayConfiguration,
      if (updateTimestamp != null)
        'updateTimestamp': unixTimestampToJson(updateTimestamp),
    };
  }
}

class UpdateKxUserResponse {
  /// A unique identifier for the kdb environment.
  final String? environmentId;

  /// The IAM role ARN that is associated with the user.
  final String? iamRole;

  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String? userArn;

  /// A unique identifier for the user.
  final String? userName;

  UpdateKxUserResponse({
    this.environmentId,
    this.iamRole,
    this.userArn,
    this.userName,
  });

  factory UpdateKxUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKxUserResponse(
      environmentId: json['environmentId'] as String?,
      iamRole: json['iamRole'] as String?,
      userArn: json['userArn'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final iamRole = this.iamRole;
    final userArn = this.userArn;
    final userName = this.userName;
    return {
      if (environmentId != null) 'environmentId': environmentId,
      if (iamRole != null) 'iamRole': iamRole,
      if (userArn != null) 'userArn': userArn,
      if (userName != null) 'userName': userName,
    };
  }
}

class UpdateKxVolumeResponse {
  /// Specifies the clusters that a volume is attached to.
  final List<KxAttachedCluster>? attachedClusters;

  /// The identifier of the availability zones.
  final List<String>? availabilityZoneIds;

  /// The number of availability zones you want to assign per volume. Currently,
  /// FinSpace only supports <code>SINGLE</code> for volumes. This places dataview
  /// in a single AZ.
  final KxAzMode? azMode;

  /// The timestamp at which the volume was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? createdTimestamp;

  /// The description for the volume.
  final String? description;

  /// A unique identifier for the kdb environment where you want to update the
  /// volume.
  final String? environmentId;

  /// The last time that the volume was updated in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final DateTime? lastModifiedTimestamp;

  /// Specifies the configuration for the Network attached storage (NAS_1) file
  /// system volume.
  final KxNAS1Configuration? nas1Configuration;

  /// The status of the volume.
  ///
  /// <ul>
  /// <li>
  /// CREATING – The volume creation is in progress.
  /// </li>
  /// <li>
  /// CREATE_FAILED – The volume creation has failed.
  /// </li>
  /// <li>
  /// ACTIVE – The volume is active.
  /// </li>
  /// <li>
  /// UPDATING – The volume is in the process of being updated.
  /// </li>
  /// <li>
  /// UPDATE_FAILED – The update action failed.
  /// </li>
  /// <li>
  /// UPDATED – The volume is successfully updated.
  /// </li>
  /// <li>
  /// DELETING – The volume is in the process of being deleted.
  /// </li>
  /// <li>
  /// DELETE_FAILED – The system failed to delete the volume.
  /// </li>
  /// <li>
  /// DELETED – The volume is successfully deleted.
  /// </li>
  /// </ul>
  final KxVolumeStatus? status;

  /// The error message when a failed state occurs.
  final String? statusReason;

  /// The ARN identifier of the volume.
  final String? volumeArn;

  /// A unique identifier for the volume that you want to update.
  final String? volumeName;

  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  final KxVolumeType? volumeType;

  UpdateKxVolumeResponse({
    this.attachedClusters,
    this.availabilityZoneIds,
    this.azMode,
    this.createdTimestamp,
    this.description,
    this.environmentId,
    this.lastModifiedTimestamp,
    this.nas1Configuration,
    this.status,
    this.statusReason,
    this.volumeArn,
    this.volumeName,
    this.volumeType,
  });

  factory UpdateKxVolumeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKxVolumeResponse(
      attachedClusters: (json['attachedClusters'] as List?)
          ?.whereNotNull()
          .map((e) => KxAttachedCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityZoneIds: (json['availabilityZoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      azMode: (json['azMode'] as String?)?.toKxAzMode(),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      nas1Configuration: json['nas1Configuration'] != null
          ? KxNAS1Configuration.fromJson(
              json['nas1Configuration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toKxVolumeStatus(),
      statusReason: json['statusReason'] as String?,
      volumeArn: json['volumeArn'] as String?,
      volumeName: json['volumeName'] as String?,
      volumeType: (json['volumeType'] as String?)?.toKxVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedClusters = this.attachedClusters;
    final availabilityZoneIds = this.availabilityZoneIds;
    final azMode = this.azMode;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final nas1Configuration = this.nas1Configuration;
    final status = this.status;
    final statusReason = this.statusReason;
    final volumeArn = this.volumeArn;
    final volumeName = this.volumeName;
    final volumeType = this.volumeType;
    return {
      if (attachedClusters != null) 'attachedClusters': attachedClusters,
      if (availabilityZoneIds != null)
        'availabilityZoneIds': availabilityZoneIds,
      if (azMode != null) 'azMode': azMode.toValue(),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (nas1Configuration != null) 'nas1Configuration': nas1Configuration,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (volumeArn != null) 'volumeArn': volumeArn,
      if (volumeName != null) 'volumeName': volumeName,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

/// The structure that consists of name and type of volume.
class Volume {
  /// A unique identifier for the volume.
  final String? volumeName;

  /// The type of file system volume. Currently, FinSpace only supports
  /// <code>NAS_1</code> volume type.
  final VolumeType? volumeType;

  Volume({
    this.volumeName,
    this.volumeType,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      volumeName: json['volumeName'] as String?,
      volumeType: (json['volumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final volumeName = this.volumeName;
    final volumeType = this.volumeType;
    return {
      if (volumeName != null) 'volumeName': volumeName,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

enum VolumeType {
  nas_1,
}

extension VolumeTypeValueExtension on VolumeType {
  String toValue() {
    switch (this) {
      case VolumeType.nas_1:
        return 'NAS_1';
    }
  }
}

extension VolumeTypeFromString on String {
  VolumeType toVolumeType() {
    switch (this) {
      case 'NAS_1':
        return VolumeType.nas_1;
    }
    throw Exception('$this is not known in enum VolumeType');
  }
}

/// Configuration details about the network where the Privatelink endpoint of
/// the cluster resides.
class VpcConfiguration {
  /// The IP address type for cluster network configuration parameters. The
  /// following type is available:
  ///
  /// <ul>
  /// <li>
  /// IP_V4 – IP address version 4
  /// </li>
  /// </ul>
  final IPAddressType? ipAddressType;

  /// The unique identifier of the VPC security group applied to the VPC endpoint
  /// ENI for the cluster.
  final List<String>? securityGroupIds;

  /// The identifier of the subnet that the Privatelink VPC endpoint uses to
  /// connect to the cluster.
  final List<String>? subnetIds;

  /// The identifier of the VPC endpoint.
  final String? vpcId;

  VpcConfiguration({
    this.ipAddressType,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      ipAddressType: (json['ipAddressType'] as String?)?.toIPAddressType(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressType = this.ipAddressType;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

enum DnsStatus {
  none,
  updateRequested,
  updating,
  failedUpdate,
  successfullyUpdated,
}

extension DnsStatusValueExtension on DnsStatus {
  String toValue() {
    switch (this) {
      case DnsStatus.none:
        return 'NONE';
      case DnsStatus.updateRequested:
        return 'UPDATE_REQUESTED';
      case DnsStatus.updating:
        return 'UPDATING';
      case DnsStatus.failedUpdate:
        return 'FAILED_UPDATE';
      case DnsStatus.successfullyUpdated:
        return 'SUCCESSFULLY_UPDATED';
    }
  }
}

extension DnsStatusFromString on String {
  DnsStatus toDnsStatus() {
    switch (this) {
      case 'NONE':
        return DnsStatus.none;
      case 'UPDATE_REQUESTED':
        return DnsStatus.updateRequested;
      case 'UPDATING':
        return DnsStatus.updating;
      case 'FAILED_UPDATE':
        return DnsStatus.failedUpdate;
      case 'SUCCESSFULLY_UPDATED':
        return DnsStatus.successfullyUpdated;
    }
    throw Exception('$this is not known in enum DnsStatus');
  }
}

enum TgwStatus {
  none,
  updateRequested,
  updating,
  failedUpdate,
  successfullyUpdated,
}

extension TgwStatusValueExtension on TgwStatus {
  String toValue() {
    switch (this) {
      case TgwStatus.none:
        return 'NONE';
      case TgwStatus.updateRequested:
        return 'UPDATE_REQUESTED';
      case TgwStatus.updating:
        return 'UPDATING';
      case TgwStatus.failedUpdate:
        return 'FAILED_UPDATE';
      case TgwStatus.successfullyUpdated:
        return 'SUCCESSFULLY_UPDATED';
    }
  }
}

extension TgwStatusFromString on String {
  TgwStatus toTgwStatus() {
    switch (this) {
      case 'NONE':
        return TgwStatus.none;
      case 'UPDATE_REQUESTED':
        return TgwStatus.updateRequested;
      case 'UPDATING':
        return TgwStatus.updating;
      case 'FAILED_UPDATE':
        return TgwStatus.failedUpdate;
      case 'SUCCESSFULLY_UPDATED':
        return TgwStatus.successfullyUpdated;
    }
    throw Exception('$this is not known in enum TgwStatus');
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

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
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
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
