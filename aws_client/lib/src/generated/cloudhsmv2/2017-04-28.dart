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

part '2017-04-28.g.dart';

/// For more information about AWS CloudHSM, see <a
/// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a> and the <a
/// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
/// User Guide</a>.
class CloudHsmV2 {
  final _s.JsonProtocol _protocol;
  CloudHsmV2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudhsmv2',
            signingName: 'cloudhsm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Copy an AWS CloudHSM cluster backup to a different region.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup that will be copied to the destination region.
  ///
  /// Parameter [destinationRegion] :
  /// The AWS region that will contain your copied CloudHSM cluster backup.
  ///
  /// Parameter [tagList] :
  /// Tags to apply to the destination backup during creation. If you specify
  /// tags, only these tags will be applied to the destination backup. If you do
  /// not specify tags, the service copies tags from the source backup to the
  /// destination backup.
  Future<CopyBackupToRegionResponse> copyBackupToRegion({
    @_s.required String backupId,
    @_s.required String destinationRegion,
    List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''backup-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationRegion, 'destinationRegion');
    _s.validateStringPattern(
      'destinationRegion',
      destinationRegion,
      r'''[a-z]{2}(-(gov))?-(east|west|north|south|central){1,2}-\d''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.CopyBackupToRegion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'DestinationRegion': destinationRegion,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return CopyBackupToRegionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new AWS CloudHSM cluster.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [hsmType] :
  /// The type of HSM to use in the cluster. Currently the only allowed value is
  /// <code>hsm1.medium</code>.
  ///
  /// Parameter [subnetIds] :
  /// The identifiers (IDs) of the subnets where you are creating the cluster.
  /// You must specify at least one subnet. If you specify multiple subnets,
  /// they must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// All subnets must be in the same virtual private cloud (VPC).
  /// </li>
  /// <li>
  /// You can specify only one subnet per Availability Zone.
  /// </li>
  /// </ul>
  ///
  /// Parameter [backupRetentionPolicy] :
  /// A policy that defines how the service retains backups.
  ///
  /// Parameter [sourceBackupId] :
  /// The identifier (ID) of the cluster backup to restore. Use this value to
  /// restore the cluster from a backup instead of creating a new cluster. To
  /// find the backup ID, use <a>DescribeBackups</a>.
  ///
  /// Parameter [tagList] :
  /// Tags to apply to the CloudHSM cluster during creation.
  Future<CreateClusterResponse> createCluster({
    @_s.required String hsmType,
    @_s.required List<String> subnetIds,
    BackupRetentionPolicy backupRetentionPolicy,
    String sourceBackupId,
    List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(hsmType, 'hsmType');
    _s.validateStringPattern(
      'hsmType',
      hsmType,
      r'''(hsm1\.medium)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    _s.validateStringPattern(
      'sourceBackupId',
      sourceBackupId,
      r'''backup-[2-7a-zA-Z]{11,16}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HsmType': hsmType,
        'SubnetIds': subnetIds,
        if (backupRetentionPolicy != null)
          'BackupRetentionPolicy': backupRetentionPolicy,
        if (sourceBackupId != null) 'SourceBackupId': sourceBackupId,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new hardware security module (HSM) in the specified AWS CloudHSM
  /// cluster.
  ///
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmAccessDeniedException].
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you are creating the HSM. To find the
  /// cluster's Availability Zones, use <a>DescribeClusters</a>.
  ///
  /// Parameter [clusterId] :
  /// The identifier (ID) of the HSM's cluster. To find the cluster ID, use
  /// <a>DescribeClusters</a>.
  ///
  /// Parameter [ipAddress] :
  /// The HSM's IP address. If you specify an IP address, use an available
  /// address from the subnet that maps to the Availability Zone where you are
  /// creating the HSM. If you don't specify an IP address, one is chosen for
  /// you from that subnet.
  Future<CreateHsmResponse> createHsm({
    @_s.required String availabilityZone,
    @_s.required String clusterId,
    String ipAddress,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    _s.validateStringPattern(
      'availabilityZone',
      availabilityZone,
      r'''[a-z]{2}(-(gov))?-(east|west|north|south|central){1,2}-\d[a-z]''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''cluster-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'ipAddress',
      ipAddress,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.CreateHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AvailabilityZone': availabilityZone,
        'ClusterId': clusterId,
        if (ipAddress != null) 'IpAddress': ipAddress,
      },
    );

    return CreateHsmResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7
  /// days after the DeleteBackup request is made. For more information on
  /// restoring a backup, see <a>RestoreBackup</a>.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup to be deleted. To find the ID of a backup, use the
  /// <a>DescribeBackups</a> operation.
  Future<DeleteBackupResponse> deleteBackup({
    @_s.required String backupId,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''backup-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DeleteBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
      },
    );

    return DeleteBackupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified AWS CloudHSM cluster. Before you can delete a
  /// cluster, you must delete all HSMs in the cluster. To see if the cluster
  /// contains any HSMs, use <a>DescribeClusters</a>. To delete an HSM, use
  /// <a>DeleteHsm</a>.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [clusterId] :
  /// The identifier (ID) of the cluster that you are deleting. To find the
  /// cluster ID, use <a>DescribeClusters</a>.
  Future<DeleteClusterResponse> deleteCluster({
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''cluster-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DeleteCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return DeleteClusterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified HSM. To specify an HSM, you can use its identifier
  /// (ID), the IP address of the HSM's elastic network interface (ENI), or the
  /// ID of the HSM's ENI. You need to specify only one of these values. To find
  /// these values, use <a>DescribeClusters</a>.
  ///
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmAccessDeniedException].
  ///
  /// Parameter [clusterId] :
  /// The identifier (ID) of the cluster that contains the HSM that you are
  /// deleting.
  ///
  /// Parameter [eniId] :
  /// The identifier (ID) of the elastic network interface (ENI) of the HSM that
  /// you are deleting.
  ///
  /// Parameter [eniIp] :
  /// The IP address of the elastic network interface (ENI) of the HSM that you
  /// are deleting.
  ///
  /// Parameter [hsmId] :
  /// The identifier (ID) of the HSM that you are deleting.
  Future<DeleteHsmResponse> deleteHsm({
    @_s.required String clusterId,
    String eniId,
    String eniIp,
    String hsmId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''cluster-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'eniId',
      eniId,
      r'''eni-[0-9a-fA-F]{8,17}''',
    );
    _s.validateStringPattern(
      'eniIp',
      eniIp,
      r'''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}''',
    );
    _s.validateStringPattern(
      'hsmId',
      hsmId,
      r'''hsm-[2-7a-zA-Z]{11,16}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DeleteHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (eniId != null) 'EniId': eniId,
        if (eniIp != null) 'EniIp': eniIp,
        if (hsmId != null) 'HsmId': hsmId,
      },
    );

    return DeleteHsmResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about backups of AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the backups. When the response contains only
  /// a subset of backups, it includes a <code>NextToken</code> value. Use this
  /// value in a subsequent <code>DescribeBackups</code> request to get more
  /// backups. When you receive a response with no <code>NextToken</code> (or an
  /// empty or null value), that means there are no more backups to get.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [filters] :
  /// One or more filters to limit the items returned in the response.
  ///
  /// Use the <code>backupIds</code> filter to return only the specified
  /// backups. Specify backups by their backup identifier (ID).
  ///
  /// Use the <code>sourceBackupIds</code> filter to return only the backups
  /// created from a source backup. The <code>sourceBackupID</code> of a source
  /// backup is returned by the <a>CopyBackupToRegion</a> operation.
  ///
  /// Use the <code>clusterIds</code> filter to return only the backups for the
  /// specified clusters. Specify clusters by their cluster identifier (ID).
  ///
  /// Use the <code>states</code> filter to return only backups that match the
  /// specified state.
  ///
  /// Use the <code>neverExpires</code> filter to return backups filtered by the
  /// value in the <code>neverExpires</code> parameter. <code>True</code>
  /// returns all backups exempt from the backup retention policy.
  /// <code>False</code> returns all backups with a backup retention policy
  /// defined at the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of backups to return in the response. When there are
  /// more backups than the number you specify, the response contains a
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value that you received in the previous
  /// response. Use this value to get more backups.
  ///
  /// Parameter [sortAscending] :
  /// Designates whether or not to sort the return backups by ascending
  /// chronological order of generation.
  Future<DescribeBackupsResponse> describeBackups({
    Map<String, List<String>> filters,
    int maxResults,
    String nextToken,
    bool sortAscending,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DescribeBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortAscending != null) 'SortAscending': sortAscending,
      },
    );

    return DescribeBackupsResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the clusters. When the response contains only
  /// a subset of clusters, it includes a <code>NextToken</code> value. Use this
  /// value in a subsequent <code>DescribeClusters</code> request to get more
  /// clusters. When you receive a response with no <code>NextToken</code> (or
  /// an empty or null value), that means there are no more clusters to get.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [filters] :
  /// One or more filters to limit the items returned in the response.
  ///
  /// Use the <code>clusterIds</code> filter to return only the specified
  /// clusters. Specify clusters by their cluster identifier (ID).
  ///
  /// Use the <code>vpcIds</code> filter to return only the clusters in the
  /// specified virtual private clouds (VPCs). Specify VPCs by their VPC
  /// identifier (ID).
  ///
  /// Use the <code>states</code> filter to return only clusters that match the
  /// specified state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of clusters to return in the response. When there are
  /// more clusters than the number you specify, the response contains a
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value that you received in the previous
  /// response. Use this value to get more clusters.
  Future<DescribeClustersResponse> describeClusters({
    Map<String, List<String>> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DescribeClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeClustersResponse.fromJson(jsonResponse.body);
  }

  /// Claims an AWS CloudHSM cluster by submitting the cluster certificate
  /// issued by your issuing certificate authority (CA) and the CA's root
  /// certificate. Before you can claim a cluster, you must sign the cluster's
  /// certificate signing request (CSR) with your issuing CA. To get the
  /// cluster's CSR, use <a>DescribeClusters</a>.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [clusterId] :
  /// The identifier (ID) of the cluster that you are claiming. To find the
  /// cluster ID, use <a>DescribeClusters</a>.
  ///
  /// Parameter [signedCert] :
  /// The cluster certificate issued (signed) by your issuing certificate
  /// authority (CA). The certificate must be in PEM format and can contain a
  /// maximum of 5000 characters.
  ///
  /// Parameter [trustAnchor] :
  /// The issuing certificate of the issuing certificate authority (CA) that
  /// issued (signed) the cluster certificate. You must use a self-signed
  /// certificate. The certificate used to sign the HSM CSR must be directly
  /// available, and thus must be the root certificate. The certificate must be
  /// in PEM format and can contain a maximum of 5000 characters.
  Future<InitializeClusterResponse> initializeCluster({
    @_s.required String clusterId,
    @_s.required String signedCert,
    @_s.required String trustAnchor,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''cluster-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(signedCert, 'signedCert');
    _s.validateStringLength(
      'signedCert',
      signedCert,
      0,
      5000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'signedCert',
      signedCert,
      r'''[a-zA-Z0-9+-/=\s]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trustAnchor, 'trustAnchor');
    _s.validateStringLength(
      'trustAnchor',
      trustAnchor,
      0,
      5000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trustAnchor',
      trustAnchor,
      r'''[a-zA-Z0-9+-/=\s]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.InitializeCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'SignedCert': signedCert,
        'TrustAnchor': trustAnchor,
      },
    );

    return InitializeClusterResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of tags for the specified AWS CloudHSM cluster.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the tags. When the response contains only a
  /// subset of tags, it includes a <code>NextToken</code> value. Use this value
  /// in a subsequent <code>ListTags</code> request to get more tags. When you
  /// receive a response with no <code>NextToken</code> (or an empty or null
  /// value), that means there are no more tags to get.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [resourceId] :
  /// The cluster identifier (ID) for the cluster whose tags you are getting. To
  /// find the cluster ID, use <a>DescribeClusters</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags to return in the response. When there are more
  /// tags than the number you specify, the response contains a
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value that you received in the previous
  /// response. Use this value to get more tags.
  Future<ListTagsResponse> listTags({
    @_s.required String resourceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''(?:cluster|backup)-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Modifies attributes for AWS CloudHSM backup.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [backupId] :
  /// The identifier (ID) of the backup to modify. To find the ID of a backup,
  /// use the <a>DescribeBackups</a> operation.
  ///
  /// Parameter [neverExpires] :
  /// Specifies whether the service should exempt a backup from the retention
  /// policy for the cluster. <code>True</code> exempts a backup from the
  /// retention policy. <code>False</code> means the service applies the backup
  /// retention policy defined at the cluster.
  Future<ModifyBackupAttributesResponse> modifyBackupAttributes({
    @_s.required String backupId,
    @_s.required bool neverExpires,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''backup-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(neverExpires, 'neverExpires');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.ModifyBackupAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'NeverExpires': neverExpires,
      },
    );

    return ModifyBackupAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Modifies AWS CloudHSM cluster.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [backupRetentionPolicy] :
  /// A policy that defines how the service retains backups.
  ///
  /// Parameter [clusterId] :
  /// The identifier (ID) of the cluster that you want to modify. To find the
  /// cluster ID, use <a>DescribeClusters</a>.
  Future<ModifyClusterResponse> modifyCluster({
    @_s.required BackupRetentionPolicy backupRetentionPolicy,
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(backupRetentionPolicy, 'backupRetentionPolicy');
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''cluster-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.ModifyCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupRetentionPolicy': backupRetentionPolicy,
        'ClusterId': clusterId,
      },
    );

    return ModifyClusterResponse.fromJson(jsonResponse.body);
  }

  /// Restores a specified AWS CloudHSM backup that is in the
  /// <code>PENDING_DELETION</code> state. For mor information on deleting a
  /// backup, see <a>DeleteBackup</a>.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup to be restored. To find the ID of a backup, use the
  /// <a>DescribeBackups</a> operation.
  Future<RestoreBackupResponse> restoreBackup({
    @_s.required String backupId,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''backup-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.RestoreBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
      },
    );

    return RestoreBackupResponse.fromJson(jsonResponse.body);
  }

  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// cluster.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [resourceId] :
  /// The cluster identifier (ID) for the cluster that you are tagging. To find
  /// the cluster ID, use <a>DescribeClusters</a>.
  ///
  /// Parameter [tagList] :
  /// A list of one or more tags.
  Future<void> tagResource({
    @_s.required String resourceId,
    @_s.required List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''(?:cluster|backup)-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagList, 'tagList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagList': tagList,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified tag or tags from the specified AWS CloudHSM cluster.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [resourceId] :
  /// The cluster identifier (ID) for the cluster whose tags you are removing.
  /// To find the cluster ID, use <a>DescribeClusters</a>.
  ///
  /// Parameter [tagKeyList] :
  /// A list of one or more tag keys for the tags that you are removing. Specify
  /// only the tag keys, not the tag values.
  Future<void> untagResource({
    @_s.required String resourceId,
    @_s.required List<String> tagKeyList,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''(?:cluster|backup)-[2-7a-zA-Z]{11,16}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagKeyList': tagKeyList,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }
}

/// Contains information about a backup of an AWS CloudHSM cluster. All backup
/// objects contain the <code>BackupId</code>, <code>BackupState</code>,
/// <code>ClusterId</code>, and <code>CreateTimestamp</code> parameters. Backups
/// that were copied into a destination region additionally contain the
/// <code>CopyTimestamp</code>, <code>SourceBackup</code>,
/// <code>SourceCluster</code>, and <code>SourceRegion</code> parameters. A
/// backup that is pending deletion will include the
/// <code>DeleteTimestamp</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Backup {
  /// The identifier (ID) of the backup.
  @_s.JsonKey(name: 'BackupId')
  final String backupId;

  /// The state of the backup.
  @_s.JsonKey(name: 'BackupState')
  final BackupState backupState;

  /// The identifier (ID) of the cluster that was backed up.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The date and time when the backup was copied from a source backup.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CopyTimestamp')
  final DateTime copyTimestamp;

  /// The date and time when the backup was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// The date and time when the backup will be permanently deleted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeleteTimestamp')
  final DateTime deleteTimestamp;

  /// Specifies whether the service should exempt a backup from the retention
  /// policy for the cluster. <code>True</code> exempts a backup from the
  /// retention policy. <code>False</code> means the service applies the backup
  /// retention policy defined at the cluster.
  @_s.JsonKey(name: 'NeverExpires')
  final bool neverExpires;

  /// The identifier (ID) of the source backup from which the new backup was
  /// copied.
  @_s.JsonKey(name: 'SourceBackup')
  final String sourceBackup;

  /// The identifier (ID) of the cluster containing the source backup from which
  /// the new backup was copied.
  @_s.JsonKey(name: 'SourceCluster')
  final String sourceCluster;

  /// The AWS Region that contains the source backup from which the new backup was
  /// copied.
  @_s.JsonKey(name: 'SourceRegion')
  final String sourceRegion;

  /// The list of tags for the backup.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  Backup({
    @_s.required this.backupId,
    this.backupState,
    this.clusterId,
    this.copyTimestamp,
    this.createTimestamp,
    this.deleteTimestamp,
    this.neverExpires,
    this.sourceBackup,
    this.sourceCluster,
    this.sourceRegion,
    this.tagList,
  });
  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);
}

enum BackupPolicy {
  @_s.JsonValue('DEFAULT')
  $default,
}

/// A policy that defines the number of days to retain backups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackupRetentionPolicy {
  /// The type of backup retention policy. For the <code>DAYS</code> type, the
  /// value is the number of days to retain backups.
  @_s.JsonKey(name: 'Type')
  final BackupRetentionType type;

  /// Use a value between 7 - 379.
  @_s.JsonKey(name: 'Value')
  final String value;

  BackupRetentionPolicy({
    this.type,
    this.value,
  });
  factory BackupRetentionPolicy.fromJson(Map<String, dynamic> json) =>
      _$BackupRetentionPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$BackupRetentionPolicyToJson(this);
}

enum BackupRetentionType {
  @_s.JsonValue('DAYS')
  days,
}

enum BackupState {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('PENDING_DELETION')
  pendingDeletion,
}

/// Contains one or more certificates or a certificate signing request (CSR).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificates {
  /// The HSM hardware certificate issued (signed) by AWS CloudHSM.
  @_s.JsonKey(name: 'AwsHardwareCertificate')
  final String awsHardwareCertificate;

  /// The cluster certificate issued (signed) by the issuing certificate authority
  /// (CA) of the cluster's owner.
  @_s.JsonKey(name: 'ClusterCertificate')
  final String clusterCertificate;

  /// The cluster's certificate signing request (CSR). The CSR exists only when
  /// the cluster's state is <code>UNINITIALIZED</code>.
  @_s.JsonKey(name: 'ClusterCsr')
  final String clusterCsr;

  /// The HSM certificate issued (signed) by the HSM hardware.
  @_s.JsonKey(name: 'HsmCertificate')
  final String hsmCertificate;

  /// The HSM hardware certificate issued (signed) by the hardware manufacturer.
  @_s.JsonKey(name: 'ManufacturerHardwareCertificate')
  final String manufacturerHardwareCertificate;

  Certificates({
    this.awsHardwareCertificate,
    this.clusterCertificate,
    this.clusterCsr,
    this.hsmCertificate,
    this.manufacturerHardwareCertificate,
  });
  factory Certificates.fromJson(Map<String, dynamic> json) =>
      _$CertificatesFromJson(json);
}

/// Contains information about an AWS CloudHSM cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cluster {
  /// The cluster's backup policy.
  @_s.JsonKey(name: 'BackupPolicy')
  final BackupPolicy backupPolicy;

  /// A policy that defines how the service retains backups.
  @_s.JsonKey(name: 'BackupRetentionPolicy')
  final BackupRetentionPolicy backupRetentionPolicy;

  /// Contains one or more certificates or a certificate signing request (CSR).
  @_s.JsonKey(name: 'Certificates')
  final Certificates certificates;

  /// The cluster's identifier (ID).
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The date and time when the cluster was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// The type of HSM that the cluster contains.
  @_s.JsonKey(name: 'HsmType')
  final String hsmType;

  /// Contains information about the HSMs in the cluster.
  @_s.JsonKey(name: 'Hsms')
  final List<Hsm> hsms;

  /// The default password for the cluster's Pre-Crypto Officer (PRECO) user.
  @_s.JsonKey(name: 'PreCoPassword')
  final String preCoPassword;

  /// The identifier (ID) of the cluster's security group.
  @_s.JsonKey(name: 'SecurityGroup')
  final String securityGroup;

  /// The identifier (ID) of the backup used to create the cluster. This value
  /// exists only when the cluster was created from a backup.
  @_s.JsonKey(name: 'SourceBackupId')
  final String sourceBackupId;

  /// The cluster's state.
  @_s.JsonKey(name: 'State')
  final ClusterState state;

  /// A description of the cluster's state.
  @_s.JsonKey(name: 'StateMessage')
  final String stateMessage;

  /// A map from availability zone to the cluster’s subnet in that availability
  /// zone.
  @_s.JsonKey(name: 'SubnetMapping')
  final Map<String, String> subnetMapping;

  /// The list of tags for the cluster.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  /// The identifier (ID) of the virtual private cloud (VPC) that contains the
  /// cluster.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  Cluster({
    this.backupPolicy,
    this.backupRetentionPolicy,
    this.certificates,
    this.clusterId,
    this.createTimestamp,
    this.hsmType,
    this.hsms,
    this.preCoPassword,
    this.securityGroup,
    this.sourceBackupId,
    this.state,
    this.stateMessage,
    this.subnetMapping,
    this.tagList,
    this.vpcId,
  });
  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);
}

enum ClusterState {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('UNINITIALIZED')
  uninitialized,
  @_s.JsonValue('INITIALIZE_IN_PROGRESS')
  initializeInProgress,
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('DEGRADED')
  degraded,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopyBackupToRegionResponse {
  /// Information on the backup that will be copied to the destination region,
  /// including CreateTimestamp, SourceBackup, SourceCluster, and Source Region.
  /// CreateTimestamp of the destination backup will be the same as that of the
  /// source backup.
  ///
  /// You will need to use the <code>sourceBackupID</code> returned in this
  /// operation to use the <a>DescribeBackups</a> operation on the backup that
  /// will be copied to the destination region.
  @_s.JsonKey(name: 'DestinationBackup')
  final DestinationBackup destinationBackup;

  CopyBackupToRegionResponse({
    this.destinationBackup,
  });
  factory CopyBackupToRegionResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyBackupToRegionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClusterResponse {
  /// Information about the cluster that was created.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  CreateClusterResponse({
    this.cluster,
  });
  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHsmResponse {
  /// Information about the HSM that was created.
  @_s.JsonKey(name: 'Hsm')
  final Hsm hsm;

  CreateHsmResponse({
    this.hsm,
  });
  factory CreateHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHsmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackupResponse {
  /// Information on the <code>Backup</code> object deleted.
  @_s.JsonKey(name: 'Backup')
  final Backup backup;

  DeleteBackupResponse({
    this.backup,
  });
  factory DeleteBackupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteClusterResponse {
  /// Information about the cluster that was deleted.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  DeleteClusterResponse({
    this.cluster,
  });
  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteHsmResponse {
  /// The identifier (ID) of the HSM that was deleted.
  @_s.JsonKey(name: 'HsmId')
  final String hsmId;

  DeleteHsmResponse({
    this.hsmId,
  });
  factory DeleteHsmResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHsmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBackupsResponse {
  /// A list of backups.
  @_s.JsonKey(name: 'Backups')
  final List<Backup> backups;

  /// An opaque string that indicates that the response contains only a subset of
  /// backups. Use this value in a subsequent <code>DescribeBackups</code> request
  /// to get more backups.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });
  factory DescribeBackupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClustersResponse {
  /// A list of clusters.
  @_s.JsonKey(name: 'Clusters')
  final List<Cluster> clusters;

  /// An opaque string that indicates that the response contains only a subset of
  /// clusters. Use this value in a subsequent <code>DescribeClusters</code>
  /// request to get more clusters.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });
  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeClustersResponseFromJson(json);
}

/// Contains information about the backup that will be copied and created by the
/// <a>CopyBackupToRegion</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DestinationBackup {
  /// The date and time when both the source backup was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// The identifier (ID) of the source backup from which the new backup was
  /// copied.
  @_s.JsonKey(name: 'SourceBackup')
  final String sourceBackup;

  /// The identifier (ID) of the cluster containing the source backup from which
  /// the new backup was copied.
  @_s.JsonKey(name: 'SourceCluster')
  final String sourceCluster;

  /// The AWS region that contains the source backup from which the new backup was
  /// copied.
  @_s.JsonKey(name: 'SourceRegion')
  final String sourceRegion;

  DestinationBackup({
    this.createTimestamp,
    this.sourceBackup,
    this.sourceCluster,
    this.sourceRegion,
  });
  factory DestinationBackup.fromJson(Map<String, dynamic> json) =>
      _$DestinationBackupFromJson(json);
}

/// Contains information about a hardware security module (HSM) in an AWS
/// CloudHSM cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Hsm {
  /// The HSM's identifier (ID).
  @_s.JsonKey(name: 'HsmId')
  final String hsmId;

  /// The Availability Zone that contains the HSM.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The identifier (ID) of the cluster that contains the HSM.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The identifier (ID) of the HSM's elastic network interface (ENI).
  @_s.JsonKey(name: 'EniId')
  final String eniId;

  /// The IP address of the HSM's elastic network interface (ENI).
  @_s.JsonKey(name: 'EniIp')
  final String eniIp;

  /// The HSM's state.
  @_s.JsonKey(name: 'State')
  final HsmState state;

  /// A description of the HSM's state.
  @_s.JsonKey(name: 'StateMessage')
  final String stateMessage;

  /// The subnet that contains the HSM's elastic network interface (ENI).
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  Hsm({
    @_s.required this.hsmId,
    this.availabilityZone,
    this.clusterId,
    this.eniId,
    this.eniIp,
    this.state,
    this.stateMessage,
    this.subnetId,
  });
  factory Hsm.fromJson(Map<String, dynamic> json) => _$HsmFromJson(json);
}

enum HsmState {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DEGRADED')
  degraded,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitializeClusterResponse {
  /// The cluster's state.
  @_s.JsonKey(name: 'State')
  final ClusterState state;

  /// A description of the cluster's state.
  @_s.JsonKey(name: 'StateMessage')
  final String stateMessage;

  InitializeClusterResponse({
    this.state,
    this.stateMessage,
  });
  factory InitializeClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$InitializeClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// A list of tags.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  /// An opaque string that indicates that the response contains only a subset of
  /// tags. Use this value in a subsequent <code>ListTags</code> request to get
  /// more tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTagsResponse({
    @_s.required this.tagList,
    this.nextToken,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyBackupAttributesResponse {
  @_s.JsonKey(name: 'Backup')
  final Backup backup;

  ModifyBackupAttributesResponse({
    this.backup,
  });
  factory ModifyBackupAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyBackupAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyClusterResponse {
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  ModifyClusterResponse({
    this.cluster,
  });
  factory ModifyClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreBackupResponse {
  /// Information on the <code>Backup</code> object created.
  @_s.JsonKey(name: 'Backup')
  final Backup backup;

  RestoreBackupResponse({
    this.backup,
  });
  factory RestoreBackupResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreBackupResponseFromJson(json);
}

/// Contains a tag. A tag is a key-value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
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

class CloudHsmAccessDeniedException extends _s.GenericAwsException {
  CloudHsmAccessDeniedException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmAccessDeniedException',
            message: message);
}

class CloudHsmInternalFailureException extends _s.GenericAwsException {
  CloudHsmInternalFailureException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmInternalFailureException',
            message: message);
}

class CloudHsmInvalidRequestException extends _s.GenericAwsException {
  CloudHsmInvalidRequestException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmInvalidRequestException',
            message: message);
}

class CloudHsmResourceNotFoundException extends _s.GenericAwsException {
  CloudHsmResourceNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmResourceNotFoundException',
            message: message);
}

class CloudHsmServiceException extends _s.GenericAwsException {
  CloudHsmServiceException({String type, String message})
      : super(type: type, code: 'CloudHsmServiceException', message: message);
}

class CloudHsmTagException extends _s.GenericAwsException {
  CloudHsmTagException({String type, String message})
      : super(type: type, code: 'CloudHsmTagException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CloudHsmAccessDeniedException': (type, message) =>
      CloudHsmAccessDeniedException(type: type, message: message),
  'CloudHsmInternalFailureException': (type, message) =>
      CloudHsmInternalFailureException(type: type, message: message),
  'CloudHsmInvalidRequestException': (type, message) =>
      CloudHsmInvalidRequestException(type: type, message: message),
  'CloudHsmResourceNotFoundException': (type, message) =>
      CloudHsmResourceNotFoundException(type: type, message: message),
  'CloudHsmServiceException': (type, message) =>
      CloudHsmServiceException(type: type, message: message),
  'CloudHsmTagException': (type, message) =>
      CloudHsmTagException(type: type, message: message),
};
