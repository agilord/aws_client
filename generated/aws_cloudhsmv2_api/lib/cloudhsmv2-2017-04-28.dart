// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// For more information about CloudHSM, see <a
/// href="http://aws.amazon.com/cloudhsm/">CloudHSM</a> and the <a
/// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/"> CloudHSM User
/// Guide</a>.
class CloudHSMV2 {
  final _s.JsonProtocol _protocol;
  CloudHSMV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudhsmv2',
            signingName: 'cloudhsm',
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

  /// Copy an CloudHSM cluster backup to a different region.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM backup in a different Amazon Web Services account.
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
    required String backupId,
    required String destinationRegion,
    List<Tag>? tagList,
  }) async {
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

  /// Creates a new CloudHSM cluster.
  ///
  /// <b>Cross-account use:</b> Yes. To perform this operation with an CloudHSM
  /// backup in a different AWS account, specify the full backup ARN in the
  /// value of the SourceBackupId parameter.
  ///
  /// May throw [CloudHsmAccessDeniedException].
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmTagException].
  ///
  /// Parameter [hsmType] :
  /// The type of HSM to use in the cluster. The allowed values are
  /// <code>hsm1.medium</code> and <code>hsm2m.medium</code>.
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
  /// Parameter [mode] :
  /// The mode to use in the cluster. The allowed values are <code>FIPS</code>
  /// and <code>NON_FIPS</code>.
  ///
  /// Parameter [sourceBackupId] :
  /// The identifier (ID) or the Amazon Resource Name (ARN) of the cluster
  /// backup to restore. Use this value to restore the cluster from a backup
  /// instead of creating a new cluster. To find the backup ID or ARN, use
  /// <a>DescribeBackups</a>. <i>If using a backup in another account, the full
  /// ARN must be supplied.</i>
  ///
  /// Parameter [tagList] :
  /// Tags to apply to the CloudHSM cluster during creation.
  Future<CreateClusterResponse> createCluster({
    required String hsmType,
    required List<String> subnetIds,
    BackupRetentionPolicy? backupRetentionPolicy,
    ClusterMode? mode,
    String? sourceBackupId,
    List<Tag>? tagList,
  }) async {
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
        if (mode != null) 'Mode': mode.value,
        if (sourceBackupId != null) 'SourceBackupId': sourceBackupId,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new hardware security module (HSM) in the specified CloudHSM
  /// cluster.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM cluster in a different Amazon Web Service account.
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
    required String availabilityZone,
    required String clusterId,
    String? ipAddress,
  }) async {
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

  /// Deletes a specified CloudHSM backup. A backup can be restored up to 7 days
  /// after the DeleteBackup request is made. For more information on restoring
  /// a backup, see <a>RestoreBackup</a>.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM backup in a different Amazon Web Services account.
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
    required String backupId,
  }) async {
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

  /// Deletes the specified CloudHSM cluster. Before you can delete a cluster,
  /// you must delete all HSMs in the cluster. To see if the cluster contains
  /// any HSMs, use <a>DescribeClusters</a>. To delete an HSM, use
  /// <a>DeleteHsm</a>.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM cluster in a different Amazon Web Services account.
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
    required String clusterId,
  }) async {
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
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM hsm in a different Amazon Web Services account.
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
    required String clusterId,
    String? eniId,
    String? eniIp,
    String? hsmId,
  }) async {
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

  /// Deletes an CloudHSM resource policy. Deleting a resource policy will
  /// result in the resource being unshared and removed from any RAM resource
  /// shares. Deleting the resource policy attached to a backup will not impact
  /// any clusters created from that backup.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
  ///
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmAccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource from which the policy will be
  /// removed.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy({
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return DeleteResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about backups of CloudHSM clusters. Lists either the
  /// backups you own or the backups shared with you when the Shared parameter
  /// is true.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the backups. When the response contains only
  /// a subset of backups, it includes a <code>NextToken</code> value. Use this
  /// value in a subsequent <code>DescribeBackups</code> request to get more
  /// backups. When you receive a response with no <code>NextToken</code> (or an
  /// empty or null value), that means there are no more backups to get.
  ///
  /// <b>Cross-account use:</b> Yes. Customers can describe backups in other
  /// Amazon Web Services accounts that are shared with them.
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
  /// Parameter [shared] :
  /// Describe backups that are shared with you.
  /// <note>
  /// By default when using this option, the command returns backups that have
  /// been shared using a standard Resource Access Manager resource share. In
  /// order for a backup that was shared using the PutResourcePolicy command to
  /// be returned, the share must be promoted to a standard resource share using
  /// the RAM <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/ram/promote-resource-share-created-from-policy.html">PromoteResourceShareCreatedFromPolicy</a>
  /// API operation. For more information about sharing backups, see <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html">
  /// Working with shared backups</a> in the CloudHSM User Guide.
  /// </note>
  ///
  /// Parameter [sortAscending] :
  /// Designates whether or not to sort the return backups by ascending
  /// chronological order of generation.
  Future<DescribeBackupsResponse> describeBackups({
    Map<String, List<String>>? filters,
    int? maxResults,
    String? nextToken,
    bool? shared,
    bool? sortAscending,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
        if (shared != null) 'Shared': shared,
        if (sortAscending != null) 'SortAscending': sortAscending,
      },
    );

    return DescribeBackupsResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the clusters. When the response contains only
  /// a subset of clusters, it includes a <code>NextToken</code> value. Use this
  /// value in a subsequent <code>DescribeClusters</code> request to get more
  /// clusters. When you receive a response with no <code>NextToken</code> (or
  /// an empty or null value), that means there are no more clusters to get.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on
  /// CloudHSM clusters in a different Amazon Web Services account.
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
    Map<String, List<String>>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
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

  /// Retrieves the resource policy document attached to a given resource.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
  ///
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmAccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource to which a policy is attached.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Claims an CloudHSM cluster by submitting the cluster certificate issued by
  /// your issuing certificate authority (CA) and the CA's root certificate.
  /// Before you can claim a cluster, you must sign the cluster's certificate
  /// signing request (CSR) with your issuing CA. To get the cluster's CSR, use
  /// <a>DescribeClusters</a>.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM cluster in a different Amazon Web Services account.
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
    required String clusterId,
    required String signedCert,
    required String trustAnchor,
  }) async {
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

  /// Gets a list of tags for the specified CloudHSM cluster.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the tags. When the response contains only a
  /// subset of tags, it includes a <code>NextToken</code> value. Use this value
  /// in a subsequent <code>ListTags</code> request to get more tags. When you
  /// receive a response with no <code>NextToken</code> (or an empty or null
  /// value), that means there are no more tags to get.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
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
    required String resourceId,
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

  /// Modifies attributes for CloudHSM backup.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM backup in a different Amazon Web Services account.
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
    required String backupId,
    required bool neverExpires,
  }) async {
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

  /// Modifies CloudHSM cluster.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM cluster in a different Amazon Web Services account.
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
    required BackupRetentionPolicy backupRetentionPolicy,
    required String clusterId,
  }) async {
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

  /// Creates or updates an CloudHSM resource policy. A resource policy helps
  /// you to define the IAM entity (for example, an Amazon Web Services account)
  /// that can manage your CloudHSM resources. The following resources support
  /// CloudHSM resource policies:
  ///
  /// <ul>
  /// <li>
  /// Backup - The resource policy allows you to describe the backup and restore
  /// a cluster from the backup in another Amazon Web Services account.
  /// </li>
  /// </ul>
  /// In order to share a backup, it must be in a 'READY' state and you must own
  /// it.
  /// <important>
  /// While you can share a backup using the CloudHSM PutResourcePolicy
  /// operation, we recommend using Resource Access Manager (RAM) instead. Using
  /// RAM provides multiple benefits as it creates the policy for you, allows
  /// multiple resources to be shared at one time, and increases the
  /// discoverability of shared resources. If you use PutResourcePolicy and want
  /// consumers to be able to describe the backups you share with them, you must
  /// promote the backup to a standard RAM Resource Share using the RAM
  /// PromoteResourceShareCreatedFromPolicy API operation. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html">
  /// Working with shared backups</a> in the CloudHSM User Guide
  /// </important>
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
  ///
  /// May throw [CloudHsmInternalFailureException].
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInvalidRequestException].
  /// May throw [CloudHsmResourceNotFoundException].
  /// May throw [CloudHsmAccessDeniedException].
  ///
  /// Parameter [policy] :
  /// The policy you want to associate with a resource.
  ///
  /// For an example policy, see <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/sharing.html">
  /// Working with shared backups</a> in the CloudHSM User Guide
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource to which you want to attach a
  /// policy.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    String? policy,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (policy != null) 'Policy': policy,
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Restores a specified CloudHSM backup that is in the
  /// <code>PENDING_DELETION</code> state. For more information on deleting a
  /// backup, see <a>DeleteBackup</a>.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM backup in a different Amazon Web Services account.
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
    required String backupId,
  }) async {
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

  /// Adds or overwrites one or more tags for the specified CloudHSM cluster.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
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
    required String resourceId,
    required List<Tag> tagList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.TagResource'
    };
    await _protocol.send(
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
  }

  /// Removes the specified tag or tags from the specified CloudHSM cluster.
  ///
  /// <b>Cross-account use:</b> No. You cannot perform this operation on an
  /// CloudHSM resource in a different Amazon Web Services account.
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
    required String resourceId,
    required List<String> tagKeyList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'BaldrApiService.UntagResource'
    };
    await _protocol.send(
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
  }
}

/// Contains information about a backup of an CloudHSM cluster. All backup
/// objects contain the <code>BackupId</code>, <code>BackupState</code>,
/// <code>ClusterId</code>, and <code>CreateTimestamp</code> parameters. Backups
/// that were copied into a destination region additionally contain the
/// <code>CopyTimestamp</code>, <code>SourceBackup</code>,
/// <code>SourceCluster</code>, and <code>SourceRegion</code> parameters. A
/// backup that is pending deletion will include the
/// <code>DeleteTimestamp</code> parameter.
class Backup {
  /// The identifier (ID) of the backup.
  final String backupId;

  /// The Amazon Resource Name (ARN) of the backup.
  final String? backupArn;

  /// The state of the backup.
  final BackupState? backupState;

  /// The identifier (ID) of the cluster that was backed up.
  final String? clusterId;

  /// The date and time when the backup was copied from a source backup.
  final DateTime? copyTimestamp;

  /// The date and time when the backup was created.
  final DateTime? createTimestamp;

  /// The date and time when the backup will be permanently deleted.
  final DateTime? deleteTimestamp;

  /// The HSM type used to create the backup.
  final String? hsmType;

  /// The mode of the cluster that was backed up.
  final ClusterMode? mode;

  /// Specifies whether the service should exempt a backup from the retention
  /// policy for the cluster. <code>True</code> exempts a backup from the
  /// retention policy. <code>False</code> means the service applies the backup
  /// retention policy defined at the cluster.
  final bool? neverExpires;

  /// The identifier (ID) of the source backup from which the new backup was
  /// copied.
  final String? sourceBackup;

  /// The identifier (ID) of the cluster containing the source backup from which
  /// the new backup was copied.
  final String? sourceCluster;

  /// The AWS Region that contains the source backup from which the new backup was
  /// copied.
  final String? sourceRegion;

  /// The list of tags for the backup.
  final List<Tag>? tagList;

  Backup({
    required this.backupId,
    this.backupArn,
    this.backupState,
    this.clusterId,
    this.copyTimestamp,
    this.createTimestamp,
    this.deleteTimestamp,
    this.hsmType,
    this.mode,
    this.neverExpires,
    this.sourceBackup,
    this.sourceCluster,
    this.sourceRegion,
    this.tagList,
  });

  factory Backup.fromJson(Map<String, dynamic> json) {
    return Backup(
      backupId: json['BackupId'] as String,
      backupArn: json['BackupArn'] as String?,
      backupState:
          (json['BackupState'] as String?)?.let(BackupState.fromString),
      clusterId: json['ClusterId'] as String?,
      copyTimestamp: timeStampFromJson(json['CopyTimestamp']),
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      deleteTimestamp: timeStampFromJson(json['DeleteTimestamp']),
      hsmType: json['HsmType'] as String?,
      mode: (json['Mode'] as String?)?.let(ClusterMode.fromString),
      neverExpires: json['NeverExpires'] as bool?,
      sourceBackup: json['SourceBackup'] as String?,
      sourceCluster: json['SourceCluster'] as String?,
      sourceRegion: json['SourceRegion'] as String?,
      tagList: (json['TagList'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum BackupPolicy {
  $default('DEFAULT'),
  ;

  final String value;

  const BackupPolicy(this.value);

  static BackupPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum BackupPolicy'));
}

/// A policy that defines the number of days to retain backups.
class BackupRetentionPolicy {
  /// The type of backup retention policy. For the <code>DAYS</code> type, the
  /// value is the number of days to retain backups.
  final BackupRetentionType? type;

  /// Use a value between 7 - 379.
  final String? value;

  BackupRetentionPolicy({
    this.type,
    this.value,
  });

  factory BackupRetentionPolicy.fromJson(Map<String, dynamic> json) {
    return BackupRetentionPolicy(
      type: (json['Type'] as String?)?.let(BackupRetentionType.fromString),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type.value,
      if (value != null) 'Value': value,
    };
  }
}

enum BackupRetentionType {
  days('DAYS'),
  ;

  final String value;

  const BackupRetentionType(this.value);

  static BackupRetentionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BackupRetentionType'));
}

enum BackupState {
  createInProgress('CREATE_IN_PROGRESS'),
  ready('READY'),
  deleted('DELETED'),
  pendingDeletion('PENDING_DELETION'),
  ;

  final String value;

  const BackupState(this.value);

  static BackupState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum BackupState'));
}

/// Contains one or more certificates or a certificate signing request (CSR).
class Certificates {
  /// The HSM hardware certificate issued (signed) by CloudHSM.
  final String? awsHardwareCertificate;

  /// The cluster certificate issued (signed) by the issuing certificate authority
  /// (CA) of the cluster's owner.
  final String? clusterCertificate;

  /// The cluster's certificate signing request (CSR). The CSR exists only when
  /// the cluster's state is <code>UNINITIALIZED</code>.
  final String? clusterCsr;

  /// The HSM certificate issued (signed) by the HSM hardware.
  final String? hsmCertificate;

  /// The HSM hardware certificate issued (signed) by the hardware manufacturer.
  final String? manufacturerHardwareCertificate;

  Certificates({
    this.awsHardwareCertificate,
    this.clusterCertificate,
    this.clusterCsr,
    this.hsmCertificate,
    this.manufacturerHardwareCertificate,
  });

  factory Certificates.fromJson(Map<String, dynamic> json) {
    return Certificates(
      awsHardwareCertificate: json['AwsHardwareCertificate'] as String?,
      clusterCertificate: json['ClusterCertificate'] as String?,
      clusterCsr: json['ClusterCsr'] as String?,
      hsmCertificate: json['HsmCertificate'] as String?,
      manufacturerHardwareCertificate:
          json['ManufacturerHardwareCertificate'] as String?,
    );
  }
}

/// Contains information about an CloudHSM cluster.
class Cluster {
  /// The cluster's backup policy.
  final BackupPolicy? backupPolicy;

  /// A policy that defines how the service retains backups.
  final BackupRetentionPolicy? backupRetentionPolicy;

  /// Contains one or more certificates or a certificate signing request (CSR).
  final Certificates? certificates;

  /// The cluster's identifier (ID).
  final String? clusterId;

  /// The date and time when the cluster was created.
  final DateTime? createTimestamp;

  /// The type of HSM that the cluster contains.
  final String? hsmType;

  /// Contains information about the HSMs in the cluster.
  final List<Hsm>? hsms;

  /// The mode of the cluster.
  final ClusterMode? mode;

  /// The default password for the cluster's Pre-Crypto Officer (PRECO) user.
  final String? preCoPassword;

  /// The identifier (ID) of the cluster's security group.
  final String? securityGroup;

  /// The identifier (ID) of the backup used to create the cluster. This value
  /// exists only when the cluster was created from a backup.
  final String? sourceBackupId;

  /// The cluster's state.
  final ClusterState? state;

  /// A description of the cluster's state.
  final String? stateMessage;

  /// A map from availability zone to the cluster’s subnet in that availability
  /// zone.
  final Map<String, String>? subnetMapping;

  /// The list of tags for the cluster.
  final List<Tag>? tagList;

  /// The identifier (ID) of the virtual private cloud (VPC) that contains the
  /// cluster.
  final String? vpcId;

  Cluster({
    this.backupPolicy,
    this.backupRetentionPolicy,
    this.certificates,
    this.clusterId,
    this.createTimestamp,
    this.hsmType,
    this.hsms,
    this.mode,
    this.preCoPassword,
    this.securityGroup,
    this.sourceBackupId,
    this.state,
    this.stateMessage,
    this.subnetMapping,
    this.tagList,
    this.vpcId,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      backupPolicy:
          (json['BackupPolicy'] as String?)?.let(BackupPolicy.fromString),
      backupRetentionPolicy: json['BackupRetentionPolicy'] != null
          ? BackupRetentionPolicy.fromJson(
              json['BackupRetentionPolicy'] as Map<String, dynamic>)
          : null,
      certificates: json['Certificates'] != null
          ? Certificates.fromJson(json['Certificates'] as Map<String, dynamic>)
          : null,
      clusterId: json['ClusterId'] as String?,
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      hsmType: json['HsmType'] as String?,
      hsms: (json['Hsms'] as List?)
          ?.nonNulls
          .map((e) => Hsm.fromJson(e as Map<String, dynamic>))
          .toList(),
      mode: (json['Mode'] as String?)?.let(ClusterMode.fromString),
      preCoPassword: json['PreCoPassword'] as String?,
      securityGroup: json['SecurityGroup'] as String?,
      sourceBackupId: json['SourceBackupId'] as String?,
      state: (json['State'] as String?)?.let(ClusterState.fromString),
      stateMessage: json['StateMessage'] as String?,
      subnetMapping: (json['SubnetMapping'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tagList: (json['TagList'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }
}

enum ClusterMode {
  fips('FIPS'),
  nonFips('NON_FIPS'),
  ;

  final String value;

  const ClusterMode(this.value);

  static ClusterMode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ClusterMode'));
}

enum ClusterState {
  createInProgress('CREATE_IN_PROGRESS'),
  uninitialized('UNINITIALIZED'),
  initializeInProgress('INITIALIZE_IN_PROGRESS'),
  initialized('INITIALIZED'),
  active('ACTIVE'),
  updateInProgress('UPDATE_IN_PROGRESS'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  deleted('DELETED'),
  degraded('DEGRADED'),
  ;

  final String value;

  const ClusterState(this.value);

  static ClusterState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ClusterState'));
}

class CopyBackupToRegionResponse {
  /// Information on the backup that will be copied to the destination region,
  /// including CreateTimestamp, SourceBackup, SourceCluster, and Source Region.
  /// CreateTimestamp of the destination backup will be the same as that of the
  /// source backup.
  ///
  /// You will need to use the <code>sourceBackupID</code> returned in this
  /// operation to use the <a>DescribeBackups</a> operation on the backup that
  /// will be copied to the destination region.
  final DestinationBackup? destinationBackup;

  CopyBackupToRegionResponse({
    this.destinationBackup,
  });

  factory CopyBackupToRegionResponse.fromJson(Map<String, dynamic> json) {
    return CopyBackupToRegionResponse(
      destinationBackup: json['DestinationBackup'] != null
          ? DestinationBackup.fromJson(
              json['DestinationBackup'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateClusterResponse {
  /// Information about the cluster that was created.
  final Cluster? cluster;

  CreateClusterResponse({
    this.cluster,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateHsmResponse {
  /// Information about the HSM that was created.
  final Hsm? hsm;

  CreateHsmResponse({
    this.hsm,
  });

  factory CreateHsmResponse.fromJson(Map<String, dynamic> json) {
    return CreateHsmResponse(
      hsm: json['Hsm'] != null
          ? Hsm.fromJson(json['Hsm'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteBackupResponse {
  /// Information on the <code>Backup</code> object deleted.
  final Backup? backup;

  DeleteBackupResponse({
    this.backup,
  });

  factory DeleteBackupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackupResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteClusterResponse {
  /// Information about the cluster that was deleted.
  final Cluster? cluster;

  DeleteClusterResponse({
    this.cluster,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteHsmResponse {
  /// The identifier (ID) of the HSM that was deleted.
  final String? hsmId;

  DeleteHsmResponse({
    this.hsmId,
  });

  factory DeleteHsmResponse.fromJson(Map<String, dynamic> json) {
    return DeleteHsmResponse(
      hsmId: json['HsmId'] as String?,
    );
  }
}

class DeleteResourcePolicyResponse {
  /// The policy previously attached to the resource.
  final String? policy;

  /// Amazon Resource Name (ARN) of the resource from which the policy was
  /// deleted.
  final String? resourceArn;

  DeleteResourcePolicyResponse({
    this.policy,
    this.resourceArn,
  });

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyResponse(
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }
}

class DescribeBackupsResponse {
  /// A list of backups.
  final List<Backup>? backups;

  /// An opaque string that indicates that the response contains only a subset of
  /// backups. Use this value in a subsequent <code>DescribeBackups</code> request
  /// to get more backups.
  final String? nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });

  factory DescribeBackupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBackupsResponse(
      backups: (json['Backups'] as List?)
          ?.nonNulls
          .map((e) => Backup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeClustersResponse {
  /// A list of clusters.
  final List<Cluster>? clusters;

  /// An opaque string that indicates that the response contains only a subset of
  /// clusters. Use this value in a subsequent <code>DescribeClusters</code>
  /// request to get more clusters.
  final String? nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });

  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClustersResponse(
      clusters: (json['Clusters'] as List?)
          ?.nonNulls
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// Contains information about the backup that will be copied and created by the
/// <a>CopyBackupToRegion</a> operation.
class DestinationBackup {
  /// The date and time when both the source backup was created.
  final DateTime? createTimestamp;

  /// The identifier (ID) of the source backup from which the new backup was
  /// copied.
  final String? sourceBackup;

  /// The identifier (ID) of the cluster containing the source backup from which
  /// the new backup was copied.
  final String? sourceCluster;

  /// The AWS region that contains the source backup from which the new backup was
  /// copied.
  final String? sourceRegion;

  DestinationBackup({
    this.createTimestamp,
    this.sourceBackup,
    this.sourceCluster,
    this.sourceRegion,
  });

  factory DestinationBackup.fromJson(Map<String, dynamic> json) {
    return DestinationBackup(
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      sourceBackup: json['SourceBackup'] as String?,
      sourceCluster: json['SourceCluster'] as String?,
      sourceRegion: json['SourceRegion'] as String?,
    );
  }
}

class GetResourcePolicyResponse {
  /// The policy attached to a resource.
  final String? policy;

  GetResourcePolicyResponse({
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['Policy'] as String?,
    );
  }
}

/// Contains information about a hardware security module (HSM) in an CloudHSM
/// cluster.
class Hsm {
  /// The HSM's identifier (ID).
  final String hsmId;

  /// The Availability Zone that contains the HSM.
  final String? availabilityZone;

  /// The identifier (ID) of the cluster that contains the HSM.
  final String? clusterId;

  /// The identifier (ID) of the HSM's elastic network interface (ENI).
  final String? eniId;

  /// The IP address of the HSM's elastic network interface (ENI).
  final String? eniIp;

  /// The HSM's state.
  final HsmState? state;

  /// A description of the HSM's state.
  final String? stateMessage;

  /// The subnet that contains the HSM's elastic network interface (ENI).
  final String? subnetId;

  Hsm({
    required this.hsmId,
    this.availabilityZone,
    this.clusterId,
    this.eniId,
    this.eniIp,
    this.state,
    this.stateMessage,
    this.subnetId,
  });

  factory Hsm.fromJson(Map<String, dynamic> json) {
    return Hsm(
      hsmId: json['HsmId'] as String,
      availabilityZone: json['AvailabilityZone'] as String?,
      clusterId: json['ClusterId'] as String?,
      eniId: json['EniId'] as String?,
      eniIp: json['EniIp'] as String?,
      state: (json['State'] as String?)?.let(HsmState.fromString),
      stateMessage: json['StateMessage'] as String?,
      subnetId: json['SubnetId'] as String?,
    );
  }
}

enum HsmState {
  createInProgress('CREATE_IN_PROGRESS'),
  active('ACTIVE'),
  degraded('DEGRADED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  deleted('DELETED'),
  ;

  final String value;

  const HsmState(this.value);

  static HsmState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum HsmState'));
}

class InitializeClusterResponse {
  /// The cluster's state.
  final ClusterState? state;

  /// A description of the cluster's state.
  final String? stateMessage;

  InitializeClusterResponse({
    this.state,
    this.stateMessage,
  });

  factory InitializeClusterResponse.fromJson(Map<String, dynamic> json) {
    return InitializeClusterResponse(
      state: (json['State'] as String?)?.let(ClusterState.fromString),
      stateMessage: json['StateMessage'] as String?,
    );
  }
}

class ListTagsResponse {
  /// A list of tags.
  final List<Tag> tagList;

  /// An opaque string that indicates that the response contains only a subset of
  /// tags. Use this value in a subsequent <code>ListTags</code> request to get
  /// more tags.
  final String? nextToken;

  ListTagsResponse({
    required this.tagList,
    this.nextToken,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tagList: (json['TagList'] as List)
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ModifyBackupAttributesResponse {
  final Backup? backup;

  ModifyBackupAttributesResponse({
    this.backup,
  });

  factory ModifyBackupAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ModifyBackupAttributesResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ModifyClusterResponse {
  final Cluster? cluster;

  ModifyClusterResponse({
    this.cluster,
  });

  factory ModifyClusterResponse.fromJson(Map<String, dynamic> json) {
    return ModifyClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutResourcePolicyResponse {
  /// The policy attached to a resource.
  final String? policy;

  /// Amazon Resource Name (ARN) of the resource to which a policy is attached.
  final String? resourceArn;

  PutResourcePolicyResponse({
    this.policy,
    this.resourceArn,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }
}

class RestoreBackupResponse {
  /// Information on the <code>Backup</code> object created.
  final Backup? backup;

  RestoreBackupResponse({
    this.backup,
  });

  factory RestoreBackupResponse.fromJson(Map<String, dynamic> json) {
    return RestoreBackupResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains a tag. A tag is a key-value pair.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
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
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class CloudHsmAccessDeniedException extends _s.GenericAwsException {
  CloudHsmAccessDeniedException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmAccessDeniedException',
            message: message);
}

class CloudHsmInternalFailureException extends _s.GenericAwsException {
  CloudHsmInternalFailureException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmInternalFailureException',
            message: message);
}

class CloudHsmInvalidRequestException extends _s.GenericAwsException {
  CloudHsmInvalidRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmInvalidRequestException',
            message: message);
}

class CloudHsmResourceNotFoundException extends _s.GenericAwsException {
  CloudHsmResourceNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmResourceNotFoundException',
            message: message);
}

class CloudHsmServiceException extends _s.GenericAwsException {
  CloudHsmServiceException({String? type, String? message})
      : super(type: type, code: 'CloudHsmServiceException', message: message);
}

class CloudHsmTagException extends _s.GenericAwsException {
  CloudHsmTagException({String? type, String? message})
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
