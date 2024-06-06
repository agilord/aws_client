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

import 'v2012_12_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is an interface reference for Amazon Redshift. It contains
/// documentation for one of the programming or command line interfaces you can
/// use to manage Amazon Redshift clusters. Note that Amazon Redshift is
/// asynchronous, which means that some interfaces may require techniques, such
/// as polling or asynchronous callback handlers, to determine when a command
/// has been applied. In this reference, the parameter descriptions indicate
/// whether a change is applied immediately, on the next instance reboot, or
/// during the next maintenance window. For a summary of the Amazon Redshift
/// cluster management interfaces, go to <a
/// href="https://docs.aws.amazon.com/redshift/latest/mgmt/using-aws-sdk.html">Using
/// the Amazon Redshift Management Interfaces</a>.
class Redshift {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Redshift({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'redshift',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to
  /// the configuration (term, payment type, or number of nodes) and no
  /// additional costs.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [InvalidReservedNodeStateFault].
  /// May throw [ReservedNodeAlreadyMigratedFault].
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [ReservedNodeAlreadyExistsFault].
  ///
  /// Parameter [reservedNodeId] :
  /// A string representing the node identifier of the DC1 Reserved Node to be
  /// exchanged.
  ///
  /// Parameter [targetReservedNodeOfferingId] :
  /// The unique identifier of the DC2 Reserved Node offering to be used for the
  /// exchange. You can obtain the value for the parameter by calling
  /// <a>GetReservedNodeExchangeOfferings</a>
  Future<AcceptReservedNodeExchangeOutputMessage> acceptReservedNodeExchange({
    required String reservedNodeId,
    required String targetReservedNodeOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReservedNodeId'] = reservedNodeId;
    $request['TargetReservedNodeOfferingId'] = targetReservedNodeOfferingId;
    final $result = await _protocol.send(
      $request,
      action: 'AcceptReservedNodeExchange',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AcceptReservedNodeExchangeInputMessage'],
      shapes: shapes,
      resultWrapper: 'AcceptReservedNodeExchangeResult',
    );
    return AcceptReservedNodeExchangeOutputMessage.fromXml($result);
  }

  /// Adds a partner integration to a cluster. This operation authorizes a
  /// partner to push status updates for the specified database. To complete the
  /// integration, you also set up the integration on the partner website.
  ///
  /// May throw [PartnerNotFoundFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnauthorizedPartnerIntegrationFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the cluster.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster that receives data from the partner.
  ///
  /// Parameter [databaseName] :
  /// The name of the database that receives data from the partner.
  ///
  /// Parameter [partnerName] :
  /// The name of the partner that is authorized to send data.
  Future<PartnerIntegrationOutputMessage> addPartner({
    required String accountId,
    required String clusterIdentifier,
    required String databaseName,
    required String partnerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountId'] = accountId;
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['DatabaseName'] = databaseName;
    $request['PartnerName'] = partnerName;
    final $result = await _protocol.send(
      $request,
      action: 'AddPartner',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PartnerIntegrationInputMessage'],
      shapes: shapes,
      resultWrapper: 'AddPartnerResult',
    );
    return PartnerIntegrationOutputMessage.fromXml($result);
  }

  /// From a datashare consumer account, associates a datashare with the account
  /// (AssociateEntireAccount) or the specified namespace (ConsumerArn). If you
  /// make this association, the consumer can consume the datashare.
  ///
  /// May throw [InvalidDataShareFault].
  /// May throw [InvalidNamespaceFault].
  ///
  /// Parameter [dataShareArn] :
  /// The Amazon Resource Name (ARN) of the datashare that the consumer is to
  /// use.
  ///
  /// Parameter [allowWrites] :
  /// If set to true, allows write operations for a datashare.
  ///
  /// Parameter [associateEntireAccount] :
  /// A value that specifies whether the datashare is associated with the entire
  /// account.
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) of the consumer namespace associated with
  /// the datashare.
  ///
  /// Parameter [consumerRegion] :
  /// From a datashare consumer account, associates a datashare with all
  /// existing and future namespaces in the specified Amazon Web Services
  /// Region.
  Future<DataShare> associateDataShareConsumer({
    required String dataShareArn,
    bool? allowWrites,
    bool? associateEntireAccount,
    String? consumerArn,
    String? consumerRegion,
  }) async {
    final $request = <String, dynamic>{};
    $request['DataShareArn'] = dataShareArn;
    allowWrites?.also((arg) => $request['AllowWrites'] = arg);
    associateEntireAccount
        ?.also((arg) => $request['AssociateEntireAccount'] = arg);
    consumerArn?.also((arg) => $request['ConsumerArn'] = arg);
    consumerRegion?.also((arg) => $request['ConsumerRegion'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AssociateDataShareConsumer',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AssociateDataShareConsumerMessage'],
      shapes: shapes,
      resultWrapper: 'AssociateDataShareConsumerResult',
    );
    return DataShare.fromXml($result);
  }

  /// Adds an inbound (ingress) rule to an Amazon Redshift security group.
  /// Depending on whether the application accessing your cluster is running on
  /// the Internet or an Amazon EC2 instance, you can authorize inbound access
  /// to either a Classless Interdomain Routing (CIDR)/Internet Protocol (IP)
  /// range or to an Amazon EC2 security group. You can add as many as 20
  /// ingress rules to an Amazon Redshift security group.
  ///
  /// If you authorize access to an Amazon EC2 security group, specify
  /// <i>EC2SecurityGroupName</i> and <i>EC2SecurityGroupOwnerId</i>. The Amazon
  /// EC2 security group and Amazon Redshift cluster must be in the same Amazon
  /// Web Services Region.
  ///
  /// If you authorize access to a CIDR/IP address range, specify <i>CIDRIP</i>.
  /// For an overview of CIDR blocks, see the Wikipedia article on <a
  /// href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// You must also associate the security group with a cluster so that clients
  /// running on these IP addresses or the EC2 instance are authorized to
  /// connect to the cluster. For information about managing security groups, go
  /// to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Working
  /// with Security Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [AuthorizationQuotaExceededFault].
  ///
  /// Parameter [clusterSecurityGroupName] :
  /// The name of the security group to which the ingress rule is added.
  ///
  /// Parameter [cidrip] :
  /// The IP range to be added the Amazon Redshift security group.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// The EC2 security group to be added the Amazon Redshift security group.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// The Amazon Web Services account number of the owner of the security group
  /// specified by the <i>EC2SecurityGroupName</i> parameter. The Amazon Web
  /// Services Access Key ID is not an acceptable value.
  ///
  /// Example: <code>111122223333</code>
  Future<AuthorizeClusterSecurityGroupIngressResult>
      authorizeClusterSecurityGroupIngress({
    required String clusterSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSecurityGroupName'] = clusterSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeClusterSecurityGroupIngress',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeClusterSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeClusterSecurityGroupIngressResult',
    );
    return AuthorizeClusterSecurityGroupIngressResult.fromXml($result);
  }

  /// From a data producer account, authorizes the sharing of a datashare with
  /// one or more consumer accounts or managing entities. To authorize a
  /// datashare for a data consumer, the producer account must have the correct
  /// access permissions.
  ///
  /// May throw [InvalidDataShareFault].
  ///
  /// Parameter [consumerIdentifier] :
  /// The identifier of the data consumer that is authorized to access the
  /// datashare. This identifier is an Amazon Web Services account ID or a
  /// keyword, such as ADX.
  ///
  /// Parameter [dataShareArn] :
  /// The Amazon Resource Name (ARN) of the datashare namespace that producers
  /// are to authorize sharing for.
  ///
  /// Parameter [allowWrites] :
  /// If set to true, allows write operations for a datashare.
  Future<DataShare> authorizeDataShare({
    required String consumerIdentifier,
    required String dataShareArn,
    bool? allowWrites,
  }) async {
    final $request = <String, dynamic>{};
    $request['ConsumerIdentifier'] = consumerIdentifier;
    $request['DataShareArn'] = dataShareArn;
    allowWrites?.also((arg) => $request['AllowWrites'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeDataShare',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeDataShareMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeDataShareResult',
    );
    return DataShare.fromXml($result);
  }

  /// Grants access to a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [EndpointAuthorizationsPerClusterLimitExceededFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [EndpointAuthorizationAlreadyExistsFault].
  /// May throw [InvalidAuthorizationStateFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID to grant access to.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster to grant access to.
  ///
  /// Parameter [vpcIds] :
  /// The virtual private cloud (VPC) identifiers to grant access to.
  Future<EndpointAuthorization> authorizeEndpointAccess({
    required String account,
    String? clusterIdentifier,
    List<String>? vpcIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['Account'] = account;
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    vpcIds?.also((arg) => $request['VpcIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeEndpointAccessResult',
    );
    return EndpointAuthorization.fromXml($result);
  }

  /// Authorizes the specified Amazon Web Services account to restore the
  /// specified snapshot.
  ///
  /// For more information about working with snapshots, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon
  /// Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [AuthorizationQuotaExceededFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [LimitExceededFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountWithRestoreAccess] :
  /// The identifier of the Amazon Web Services account authorized to restore
  /// the specified snapshot.
  ///
  /// To share a snapshot with Amazon Web Services Support, specify
  /// amazon-redshift-support.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot to authorize access to.
  ///
  /// Parameter [snapshotClusterIdentifier] :
  /// The identifier of the cluster the snapshot was created from.
  ///
  /// <ul>
  /// <li>
  /// <i>If the snapshot to access doesn't exist and the associated IAM policy
  /// doesn't allow access to all (*) snapshots</i> - This parameter is
  /// required. Otherwise, permissions aren't available to check if the snapshot
  /// exists.
  /// </li>
  /// <li>
  /// <i>If the snapshot to access exists</i> - This parameter isn't required.
  /// Redshift can retrieve the cluster identifier and use it to validate
  /// snapshot authorization.
  /// </li>
  /// </ul>
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier of the snapshot the account is authorized to restore.
  Future<AuthorizeSnapshotAccessResult> authorizeSnapshotAccess({
    required String accountWithRestoreAccess,
    String? snapshotArn,
    String? snapshotClusterIdentifier,
    String? snapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountWithRestoreAccess'] = accountWithRestoreAccess;
    snapshotArn?.also((arg) => $request['SnapshotArn'] = arg);
    snapshotClusterIdentifier
        ?.also((arg) => $request['SnapshotClusterIdentifier'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeSnapshotAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeSnapshotAccessMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeSnapshotAccessResult',
    );
    return AuthorizeSnapshotAccessResult.fromXml($result);
  }

  /// Deletes a set of cluster snapshots.
  ///
  /// May throw [BatchDeleteRequestSizeExceededFault].
  ///
  /// Parameter [identifiers] :
  /// A list of identifiers for the snapshots that you want to delete.
  Future<BatchDeleteClusterSnapshotsResult> batchDeleteClusterSnapshots({
    required List<DeleteClusterSnapshotMessage> identifiers,
  }) async {
    final $request = <String, dynamic>{};
    $request['Identifiers'] = identifiers;
    final $result = await _protocol.send(
      $request,
      action: 'BatchDeleteClusterSnapshots',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchDeleteClusterSnapshotsRequest'],
      shapes: shapes,
      resultWrapper: 'BatchDeleteClusterSnapshotsResult',
    );
    return BatchDeleteClusterSnapshotsResult.fromXml($result);
  }

  /// Modifies the settings for a set of cluster snapshots.
  ///
  /// May throw [InvalidRetentionPeriodFault].
  /// May throw [BatchModifyClusterSnapshotsLimitExceededFault].
  ///
  /// Parameter [snapshotIdentifierList] :
  /// A list of snapshot identifiers you want to modify.
  ///
  /// Parameter [force] :
  /// A boolean value indicating whether to override an exception if the
  /// retention period has passed.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The number of days that a manual snapshot is retained. If you specify the
  /// value -1, the manual snapshot is retained indefinitely.
  ///
  /// The number must be either -1 or an integer between 1 and 3,653.
  ///
  /// If you decrease the manual snapshot retention period from its current
  /// value, existing manual snapshots that fall outside of the new retention
  /// period will return an error. If you want to suppress the errors and delete
  /// the snapshots, use the force option.
  Future<BatchModifyClusterSnapshotsOutputMessage> batchModifyClusterSnapshots({
    required List<String> snapshotIdentifierList,
    bool? force,
    int? manualSnapshotRetentionPeriod,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotIdentifierList'] = snapshotIdentifierList;
    force?.also((arg) => $request['Force'] = arg);
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'BatchModifyClusterSnapshots',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchModifyClusterSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'BatchModifyClusterSnapshotsResult',
    );
    return BatchModifyClusterSnapshotsOutputMessage.fromXml($result);
  }

  /// Cancels a resize operation for a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ResizeNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier for the cluster that you want to cancel a resize
  /// operation for.
  Future<ResizeProgressMessage> cancelResize({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'CancelResize',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CancelResizeMessage'],
      shapes: shapes,
      resultWrapper: 'CancelResizeResult',
    );
    return ResizeProgressMessage.fromXml($result);
  }

  /// Copies the specified automated cluster snapshot to a new manual cluster
  /// snapshot. The source must be an automated snapshot and it must be in the
  /// available state.
  ///
  /// When you delete a cluster, Amazon Redshift deletes any automated snapshots
  /// of the cluster. Also, when the retention period of the snapshot expires,
  /// Amazon Redshift automatically deletes it. If you want to keep an automated
  /// snapshot for a longer period, you can make a manual copy of the snapshot.
  /// Manual snapshots are retained until you delete them.
  ///
  /// For more information about working with snapshots, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon
  /// Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ClusterSnapshotAlreadyExistsFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [ClusterSnapshotQuotaExceededFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [sourceSnapshotIdentifier] :
  /// The identifier for the source snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the identifier for a valid automated snapshot whose state is
  /// <code>available</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetSnapshotIdentifier] :
  /// The identifier given to the new manual snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot be null, empty, or blank.
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique for the Amazon Web Services account that is making the
  /// request.
  /// </li>
  /// </ul>
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// Parameter [sourceSnapshotClusterIdentifier] :
  /// The identifier of the cluster the source snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster
  /// name.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the identifier for a valid cluster.
  /// </li>
  /// </ul>
  Future<CopyClusterSnapshotResult> copyClusterSnapshot({
    required String sourceSnapshotIdentifier,
    required String targetSnapshotIdentifier,
    int? manualSnapshotRetentionPeriod,
    String? sourceSnapshotClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceSnapshotIdentifier'] = sourceSnapshotIdentifier;
    $request['TargetSnapshotIdentifier'] = targetSnapshotIdentifier;
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    sourceSnapshotClusterIdentifier
        ?.also((arg) => $request['SourceSnapshotClusterIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopyClusterSnapshotResult',
    );
    return CopyClusterSnapshotResult.fromXml($result);
  }

  /// Creates an authentication profile with the specified parameters.
  ///
  /// May throw [AuthenticationProfileAlreadyExistsFault].
  /// May throw [AuthenticationProfileQuotaExceededFault].
  /// May throw [InvalidAuthenticationProfileRequestFault].
  ///
  /// Parameter [authenticationProfileContent] :
  /// The content of the authentication profile in JSON format. The maximum
  /// length of the JSON string is determined by a quota for your account.
  ///
  /// Parameter [authenticationProfileName] :
  /// The name of the authentication profile to be created.
  Future<CreateAuthenticationProfileResult> createAuthenticationProfile({
    required String authenticationProfileContent,
    required String authenticationProfileName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AuthenticationProfileContent'] = authenticationProfileContent;
    $request['AuthenticationProfileName'] = authenticationProfileName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateAuthenticationProfile',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAuthenticationProfileMessage'],
      shapes: shapes,
      resultWrapper: 'CreateAuthenticationProfileResult',
    );
    return CreateAuthenticationProfileResult.fromXml($result);
  }

  /// Creates a new cluster with the specified parameters.
  ///
  /// To create a cluster in Virtual Private Cloud (VPC), you must provide a
  /// cluster subnet group name. The cluster subnet group identifies the subnets
  /// of your VPC that Amazon Redshift uses when creating the cluster. For more
  /// information about managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterAlreadyExistsFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [ClusterParameterGroupNotFoundFault].
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [ClusterQuotaExceededFault].
  /// May throw [NumberOfNodesQuotaExceededFault].
  /// May throw [NumberOfNodesPerClusterLimitExceededFault].
  /// May throw [ClusterSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidClusterSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [UnauthorizedOperation].
  /// May throw [HsmClientCertificateNotFoundFault].
  /// May throw [HsmConfigurationNotFoundFault].
  /// May throw [InvalidElasticIpFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  /// May throw [LimitExceededFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [InvalidClusterTrackFault].
  /// May throw [SnapshotScheduleNotFoundFault].
  /// May throw [InvalidRetentionPeriodFault].
  /// May throw [Ipv6CidrBlockNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [RedshiftIdcApplicationNotExistsFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// A unique identifier for the cluster. You use this identifier to refer to
  /// the cluster for any subsequent cluster operations such as deleting or
  /// modifying. The identifier also appears in the Amazon Redshift console.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Alphabetic characters must be lowercase.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique for all clusters within an Amazon Web Services account.
  /// </li>
  /// </ul>
  /// Example: <code>myexamplecluster</code>
  ///
  /// Parameter [masterUsername] :
  /// The user name associated with the admin user account for the cluster that
  /// is being created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 - 128 alphanumeric characters or hyphens. The user name can't be
  /// <code>PUBLIC</code>.
  /// </li>
  /// <li>
  /// Must contain only lowercase letters, numbers, underscore, plus sign,
  /// period (dot), at symbol (@), or hyphen.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Must not contain a colon (:) or a slash (/).
  /// </li>
  /// <li>
  /// Cannot be a reserved word. A list of reserved words can be found in <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nodeType] :
  /// The node type to be provisioned for the cluster. For information about
  /// node types, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes">
  /// Working with Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Valid Values: <code>ds2.xlarge</code> | <code>ds2.8xlarge</code> |
  /// <code>dc1.large</code> | <code>dc1.8xlarge</code> | <code>dc2.large</code>
  /// | <code>dc2.8xlarge</code> | <code>ra3.xlplus</code> |
  /// <code>ra3.4xlarge</code> | <code>ra3.16xlarge</code>
  ///
  /// Parameter [additionalInfo] :
  /// Reserved.
  ///
  /// Parameter [allowVersionUpgrade] :
  /// If <code>true</code>, major version upgrades can be applied during the
  /// maintenance window to the Amazon Redshift engine that is running on the
  /// cluster.
  ///
  /// When a new major version of the Amazon Redshift engine is released, you
  /// can request that the service automatically apply upgrades during the
  /// maintenance window to the Amazon Redshift engine that is running on your
  /// cluster.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [aquaConfigurationStatus] :
  /// This parameter is retired. It does not set the AQUA configuration status.
  /// Amazon Redshift automatically determines whether to use AQUA (Advanced
  /// Query Accelerator).
  ///
  /// Parameter [automatedSnapshotRetentionPeriod] :
  /// The number of days that automated snapshots are retained. If the value is
  /// 0, automated snapshots are disabled. Even if automated snapshots are
  /// disabled, you can still create manual snapshots when you want with
  /// <a>CreateClusterSnapshot</a>.
  ///
  /// You can't disable automated snapshots for RA3 node types. Set the
  /// automated retention period from 1-35 days.
  ///
  /// Default: <code>1</code>
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// Parameter [availabilityZone] :
  /// The EC2 Availability Zone (AZ) in which you want Amazon Redshift to
  /// provision the cluster. For example, if you have several EC2 instances
  /// running in a specific Availability Zone, then you might want the cluster
  /// to be provisioned in the same zone in order to decrease network latency.
  ///
  /// Default: A random, system-chosen Availability Zone in the region that is
  /// specified by the endpoint.
  ///
  /// Example: <code>us-east-2d</code>
  ///
  /// Constraint: The specified Availability Zone must be in the same region as
  /// the current endpoint.
  ///
  /// Parameter [availabilityZoneRelocation] :
  /// The option to enable relocation for an Amazon Redshift cluster between
  /// Availability Zones after the cluster is created.
  ///
  /// Parameter [clusterParameterGroupName] :
  /// The name of the parameter group to be associated with this cluster.
  ///
  /// Default: The default Amazon Redshift cluster parameter group. For
  /// information about the default parameter group, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Working
  /// with Amazon Redshift Parameter Groups</a>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterSecurityGroups] :
  /// A list of security groups to be associated with this cluster.
  ///
  /// Default: The default cluster security group for Amazon Redshift.
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name of a cluster subnet group to be associated with this cluster.
  ///
  /// If this parameter is not provided the resulting cluster will be deployed
  /// outside virtual private cloud (VPC).
  ///
  /// Parameter [clusterType] :
  /// The type of the cluster. When cluster type is specified as
  ///
  /// <ul>
  /// <li>
  /// <code>single-node</code>, the <b>NumberOfNodes</b> parameter is not
  /// required.
  /// </li>
  /// <li>
  /// <code>multi-node</code>, the <b>NumberOfNodes</b> parameter is required.
  /// </li>
  /// </ul>
  /// Valid Values: <code>multi-node</code> | <code>single-node</code>
  ///
  /// Default: <code>multi-node</code>
  ///
  /// Parameter [clusterVersion] :
  /// The version of the Amazon Redshift engine software that you want to deploy
  /// on the cluster.
  ///
  /// The version selected runs on all the nodes in the cluster.
  ///
  /// Constraints: Only version 1.0 is currently available.
  ///
  /// Example: <code>1.0</code>
  ///
  /// Parameter [dBName] :
  /// The name of the first database to be created when the cluster is created.
  ///
  /// To create additional databases after the cluster is created, connect to
  /// the cluster with a SQL client and use SQL commands to create a database.
  /// For more information, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/t_creating_database.html">Create
  /// a Database</a> in the Amazon Redshift Database Developer Guide.
  ///
  /// Default: <code>dev</code>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 64 alphanumeric characters.
  /// </li>
  /// <li>
  /// Must contain only lowercase letters.
  /// </li>
  /// <li>
  /// Cannot be a word that is reserved by the service. A list of reserved words
  /// can be found in <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultIamRoleArn] :
  /// The Amazon Resource Name (ARN) for the IAM role that was set as default
  /// for the cluster when the cluster was created.
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP (EIP) address for the cluster.
  ///
  /// Constraints: The cluster must be provisioned in EC2-VPC and
  /// publicly-accessible through an Internet gateway. Don't specify the Elastic
  /// IP address for a publicly accessible cluster with availability zone
  /// relocation turned on. For more information about provisioning clusters in
  /// EC2-VPC, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms">Supported
  /// Platforms to Launch Your Cluster</a> in the Amazon Redshift Cluster
  /// Management Guide.
  ///
  /// Parameter [encrypted] :
  /// If <code>true</code>, the data in the cluster is encrypted at rest.
  ///
  /// Default: false
  ///
  /// Parameter [enhancedVpcRouting] :
  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// Specifies the name of the HSM client certificate the Amazon Redshift
  /// cluster uses to retrieve the data encryption keys stored in an HSM.
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// Specifies the name of the HSM configuration that contains the information
  /// the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  ///
  /// Parameter [iamRoles] :
  /// A list of Identity and Access Management (IAM) roles that can be used by
  /// the cluster to access other Amazon Web Services services. You must supply
  /// the IAM roles in their Amazon Resource Name (ARN) format.
  ///
  /// The maximum number of IAM roles that you can associate is subject to a
  /// quota. For more information, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html">Quotas
  /// and limits</a> in the <i>Amazon Redshift Cluster Management Guide</i>.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address types that the cluster supports. Possible values are
  /// <code>ipv4</code> and <code>dualstack</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key Management Service (KMS) key ID of the encryption key that you
  /// want to use to encrypt data in the cluster.
  ///
  /// Parameter [loadSampleData] :
  /// A flag that specifies whether to load sample data once the cluster is
  /// created.
  ///
  /// Parameter [maintenanceTrackName] :
  /// An optional parameter for the name of the maintenance track for the
  /// cluster. If you don't provide a maintenance track name, the cluster is
  /// assigned to the <code>current</code> track.
  ///
  /// Parameter [manageMasterPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage this
  /// cluster's admin credentials. You can't use <code>MasterUserPassword</code>
  /// if <code>ManageMasterPassword</code> is true. If
  /// <code>ManageMasterPassword</code> is false or not set, Amazon Redshift
  /// uses <code>MasterUserPassword</code> for the admin user account's
  /// password.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The default number of days to retain a manual snapshot. If the value is
  /// -1, the snapshot is retained indefinitely. This setting doesn't change the
  /// retention period of existing snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// Parameter [masterPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the cluster's admin credentials secret. You can only use this parameter if
  /// <code>ManageMasterPassword</code> is true.
  ///
  /// Parameter [masterUserPassword] :
  /// The password associated with the admin user account for the cluster that
  /// is being created.
  ///
  /// You can't use <code>MasterUserPassword</code> if
  /// <code>ManageMasterPassword</code> is <code>true</code>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be between 8 and 64 characters in length.
  /// </li>
  /// <li>
  /// Must contain at least one uppercase letter.
  /// </li>
  /// <li>
  /// Must contain at least one lowercase letter.
  /// </li>
  /// <li>
  /// Must contain one number.
  /// </li>
  /// <li>
  /// Can be any printable ASCII character (ASCII code 33-126) except
  /// <code>'</code> (single quote), <code>"</code> (double quote),
  /// <code>\</code>, <code>/</code>, or <code>@</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiAZ] :
  /// If true, Amazon Redshift will deploy the cluster in two Availability Zones
  /// (AZ).
  ///
  /// Parameter [numberOfNodes] :
  /// The number of compute nodes in the cluster. This parameter is required
  /// when the <b>ClusterType</b> parameter is specified as
  /// <code>multi-node</code>.
  ///
  /// For information about determining how many nodes you need, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes">
  /// Working with Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// If you don't specify this parameter, you get a single-node cluster. When
  /// requesting a multi-node cluster, you must specify the number of nodes that
  /// you want in the cluster.
  ///
  /// Default: <code>1</code>
  ///
  /// Constraints: Value must be at least 1 and no more than 100.
  ///
  /// Parameter [port] :
  /// The port number on which the cluster accepts incoming connections.
  ///
  /// The cluster is accessible only via the JDBC and ODBC connection strings.
  /// Part of the connection string requires the port on which the cluster will
  /// listen for incoming connections.
  ///
  /// Default: <code>5439</code>
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// For clusters with ra3 nodes - Select a port within the ranges
  /// <code>5431-5455</code> or <code>8191-8215</code>. (If you have an existing
  /// cluster with ra3 nodes, it isn't required that you change the port to
  /// these ranges.)
  /// </li>
  /// <li>
  /// For clusters with ds2 or dc2 nodes - Select a port within the range
  /// <code>1150-65535</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which automated cluster maintenance
  /// can occur.
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// Default: A 30-minute window selected at random from an 8-hour block of
  /// time per region, occurring on a random day of the week. For more
  /// information about the time blocks for each region, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows">Maintenance
  /// Windows</a> in Amazon Redshift Cluster Management Guide.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [publiclyAccessible] :
  /// If <code>true</code>, the cluster can be accessed from a public network.
  ///
  /// Parameter [redshiftIdcApplicationArn] :
  /// The Amazon resource name (ARN) of the Amazon Redshift IAM Identity Center
  /// application.
  ///
  /// Parameter [snapshotScheduleIdentifier] :
  /// A unique identifier for the snapshot schedule.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of Virtual Private Cloud (VPC) security groups to be associated
  /// with the cluster.
  ///
  /// Default: The default VPC security group is associated with the cluster.
  Future<CreateClusterResult> createCluster({
    required String clusterIdentifier,
    required String masterUsername,
    required String nodeType,
    String? additionalInfo,
    bool? allowVersionUpgrade,
    AquaConfigurationStatus? aquaConfigurationStatus,
    int? automatedSnapshotRetentionPeriod,
    String? availabilityZone,
    bool? availabilityZoneRelocation,
    String? clusterParameterGroupName,
    List<String>? clusterSecurityGroups,
    String? clusterSubnetGroupName,
    String? clusterType,
    String? clusterVersion,
    String? dBName,
    String? defaultIamRoleArn,
    String? elasticIp,
    bool? encrypted,
    bool? enhancedVpcRouting,
    String? hsmClientCertificateIdentifier,
    String? hsmConfigurationIdentifier,
    List<String>? iamRoles,
    String? ipAddressType,
    String? kmsKeyId,
    String? loadSampleData,
    String? maintenanceTrackName,
    bool? manageMasterPassword,
    int? manualSnapshotRetentionPeriod,
    String? masterPasswordSecretKmsKeyId,
    String? masterUserPassword,
    bool? multiAZ,
    int? numberOfNodes,
    int? port,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    String? redshiftIdcApplicationArn,
    String? snapshotScheduleIdentifier,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['MasterUsername'] = masterUsername;
    $request['NodeType'] = nodeType;
    additionalInfo?.also((arg) => $request['AdditionalInfo'] = arg);
    allowVersionUpgrade?.also((arg) => $request['AllowVersionUpgrade'] = arg);
    aquaConfigurationStatus
        ?.also((arg) => $request['AquaConfigurationStatus'] = arg.toValue());
    automatedSnapshotRetentionPeriod
        ?.also((arg) => $request['AutomatedSnapshotRetentionPeriod'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    availabilityZoneRelocation
        ?.also((arg) => $request['AvailabilityZoneRelocation'] = arg);
    clusterParameterGroupName
        ?.also((arg) => $request['ClusterParameterGroupName'] = arg);
    clusterSecurityGroups
        ?.also((arg) => $request['ClusterSecurityGroups'] = arg);
    clusterSubnetGroupName
        ?.also((arg) => $request['ClusterSubnetGroupName'] = arg);
    clusterType?.also((arg) => $request['ClusterType'] = arg);
    clusterVersion?.also((arg) => $request['ClusterVersion'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    defaultIamRoleArn?.also((arg) => $request['DefaultIamRoleArn'] = arg);
    elasticIp?.also((arg) => $request['ElasticIp'] = arg);
    encrypted?.also((arg) => $request['Encrypted'] = arg);
    enhancedVpcRouting?.also((arg) => $request['EnhancedVpcRouting'] = arg);
    hsmClientCertificateIdentifier
        ?.also((arg) => $request['HsmClientCertificateIdentifier'] = arg);
    hsmConfigurationIdentifier
        ?.also((arg) => $request['HsmConfigurationIdentifier'] = arg);
    iamRoles?.also((arg) => $request['IamRoles'] = arg);
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    loadSampleData?.also((arg) => $request['LoadSampleData'] = arg);
    maintenanceTrackName?.also((arg) => $request['MaintenanceTrackName'] = arg);
    manageMasterPassword?.also((arg) => $request['ManageMasterPassword'] = arg);
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    masterPasswordSecretKmsKeyId
        ?.also((arg) => $request['MasterPasswordSecretKmsKeyId'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    numberOfNodes?.also((arg) => $request['NumberOfNodes'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    redshiftIdcApplicationArn
        ?.also((arg) => $request['RedshiftIdcApplicationArn'] = arg);
    snapshotScheduleIdentifier
        ?.also((arg) => $request['SnapshotScheduleIdentifier'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateClusterResult',
    );
    return CreateClusterResult.fromXml($result);
  }

  /// Creates an Amazon Redshift parameter group.
  ///
  /// Creating parameter groups is independent of creating clusters. You can
  /// associate a cluster with a parameter group when you create the cluster.
  /// You can also associate an existing cluster with a parameter group after
  /// the cluster is created by using <a>ModifyCluster</a>.
  ///
  /// Parameters in the parameter group define specific behavior that applies to
  /// the databases you create on the cluster. For more information about
  /// parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterParameterGroupQuotaExceededFault].
  /// May throw [ClusterParameterGroupAlreadyExistsFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [description] :
  /// A description of the parameter group.
  ///
  /// Parameter [parameterGroupFamily] :
  /// The Amazon Redshift engine version to which the cluster parameter group
  /// applies. The cluster engine version determines the set of parameters.
  ///
  /// To get a list of valid parameter group family names, you can call
  /// <a>DescribeClusterParameterGroups</a>. By default, Amazon Redshift returns
  /// a list of all the parameter groups that are owned by your Amazon Web
  /// Services account, including the default parameter groups for each Amazon
  /// Redshift engine version. The parameter group family names associated with
  /// the default parameter groups provide you the valid values. For example, a
  /// valid family name is "redshift-1.0".
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique withing your Amazon Web Services account.
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lower-case string.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateClusterParameterGroupResult> createClusterParameterGroup({
    required String description,
    required String parameterGroupFamily,
    required String parameterGroupName,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['Description'] = description;
    $request['ParameterGroupFamily'] = parameterGroupFamily;
    $request['ParameterGroupName'] = parameterGroupName;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateClusterParameterGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateClusterParameterGroupResult',
    );
    return CreateClusterParameterGroupResult.fromXml($result);
  }

  /// Creates a new Amazon Redshift security group. You use security groups to
  /// control access to non-VPC clusters.
  ///
  /// For information about managing security groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon
  /// Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [ClusterSecurityGroupAlreadyExistsFault].
  /// May throw [ClusterSecurityGroupQuotaExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [clusterSecurityGroupName] :
  /// The name for the security group. Amazon Redshift stores the value as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain no more than 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Must not be "Default".
  /// </li>
  /// <li>
  /// Must be unique for all security groups that are created by your Amazon Web
  /// Services account.
  /// </li>
  /// </ul>
  /// Example: <code>examplesecuritygroup</code>
  ///
  /// Parameter [description] :
  /// A description for the security group.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateClusterSecurityGroupResult> createClusterSecurityGroup({
    required String clusterSecurityGroupName,
    required String description,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSecurityGroupName'] = clusterSecurityGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateClusterSecurityGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateClusterSecurityGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateClusterSecurityGroupResult',
    );
    return CreateClusterSecurityGroupResult.fromXml($result);
  }

  /// Creates a manual snapshot of the specified cluster. The cluster must be in
  /// the <code>available</code> state.
  ///
  /// For more information about working with snapshots, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon
  /// Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterSnapshotAlreadyExistsFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [ClusterSnapshotQuotaExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier for which you want a snapshot.
  ///
  /// Parameter [snapshotIdentifier] :
  /// A unique identifier for the snapshot that you are requesting. This
  /// identifier must be unique for all snapshots within the Amazon Web Services
  /// account.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateClusterSnapshotResult> createClusterSnapshot({
    required String clusterIdentifier,
    required String snapshotIdentifier,
    int? manualSnapshotRetentionPeriod,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateClusterSnapshotResult',
    );
    return CreateClusterSnapshotResult.fromXml($result);
  }

  /// Creates a new Amazon Redshift subnet group. You must provide a list of one
  /// or more subnets in your existing Amazon Virtual Private Cloud (Amazon VPC)
  /// when creating Amazon Redshift subnet group.
  ///
  /// For information about subnet groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html">Amazon
  /// Redshift Cluster Subnet Groups</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [ClusterSubnetGroupAlreadyExistsFault].
  /// May throw [ClusterSubnetGroupQuotaExceededFault].
  /// May throw [ClusterSubnetQuotaExceededFault].
  /// May throw [InvalidSubnet].
  /// May throw [UnauthorizedOperation].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name for the subnet group. Amazon Redshift stores the value as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain no more than 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Must not be "Default".
  /// </li>
  /// <li>
  /// Must be unique for all subnet groups that are created by your Amazon Web
  /// Services account.
  /// </li>
  /// </ul>
  /// Example: <code>examplesubnetgroup</code>
  ///
  /// Parameter [description] :
  /// A description for the subnet group.
  ///
  /// Parameter [subnetIds] :
  /// An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a
  /// single request.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateClusterSubnetGroupResult> createClusterSubnetGroup({
    required String clusterSubnetGroupName,
    required String description,
    required List<String> subnetIds,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSubnetGroupName'] = clusterSubnetGroupName;
    $request['Description'] = description;
    $request['SubnetIds'] = subnetIds;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateClusterSubnetGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateClusterSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateClusterSubnetGroupResult',
    );
    return CreateClusterSubnetGroupResult.fromXml($result);
  }

  /// Used to create a custom domain name for a cluster. Properties include the
  /// custom domain name, the cluster the custom domain is associated with, and
  /// the certificate Amazon Resource Name (ARN).
  ///
  /// May throw [UnsupportedOperationFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [CustomCnameAssociationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier that the custom domain is associated with.
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The certificate Amazon Resource Name (ARN) for the custom domain name
  /// association.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for a custom domain association.
  Future<CreateCustomDomainAssociationResult> createCustomDomainAssociation({
    required String clusterIdentifier,
    required String customDomainCertificateArn,
    required String customDomainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['CustomDomainCertificateArn'] = customDomainCertificateArn;
    $request['CustomDomainName'] = customDomainName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateCustomDomainAssociation',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCustomDomainAssociationMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCustomDomainAssociationResult',
    );
    return CreateCustomDomainAssociationResult.fromXml($result);
  }

  /// Creates a Redshift-managed VPC endpoint.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [AccessToClusterDeniedFault].
  /// May throw [EndpointsPerClusterLimitExceededFault].
  /// May throw [EndpointsPerAuthorizationLimitExceededFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [ClusterSubnetGroupNotFoundFault].
  /// May throw [EndpointAlreadyExistsFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnauthorizedOperation].
  ///
  /// Parameter [endpointName] :
  /// The Redshift-managed VPC endpoint name.
  ///
  /// An endpoint name must contain 1-30 characters. Valid characters are A-Z,
  /// a-z, 0-9, and hyphen(-). The first character must be a letter. The name
  /// can't contain two consecutive hyphens or end with a hyphen.
  ///
  /// Parameter [subnetGroupName] :
  /// The subnet group from which Amazon Redshift chooses the subnet to deploy
  /// the endpoint.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster to access.
  ///
  /// Parameter [resourceOwner] :
  /// The Amazon Web Services account ID of the owner of the cluster. This is
  /// only required if the cluster is in another Amazon Web Services account.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// The security group that defines the ports, protocols, and sources for
  /// inbound traffic that you are authorizing into your endpoint.
  Future<EndpointAccess> createEndpointAccess({
    required String endpointName,
    required String subnetGroupName,
    String? clusterIdentifier,
    String? resourceOwner,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['EndpointName'] = endpointName;
    $request['SubnetGroupName'] = subnetGroupName;
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    resourceOwner?.also((arg) => $request['ResourceOwner'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEndpointAccessResult',
    );
    return EndpointAccess.fromXml($result);
  }

  /// Creates an Amazon Redshift event notification subscription. This action
  /// requires an ARN (Amazon Resource Name) of an Amazon SNS topic created by
  /// either the Amazon Redshift console, the Amazon SNS console, or the Amazon
  /// SNS API. To obtain an ARN with Amazon SNS, you must create a topic in
  /// Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS
  /// console.
  ///
  /// You can specify the source type, and lists of Amazon Redshift source IDs,
  /// event categories, and event severities. Notifications will be sent for all
  /// events you want that match those criteria. For example, you can specify
  /// source type = cluster, source ID = my-cluster-1 and mycluster2, event
  /// categories = Availability, Backup, and severity = ERROR. The subscription
  /// will only send notifications for those ERROR events in the Availability
  /// and Backup categories for the specified clusters.
  ///
  /// If you specify both the source type and source IDs, such as source type =
  /// cluster and source identifier = my-cluster-1, notifications will be sent
  /// for all the cluster events for my-cluster-1. If you specify a source type
  /// but do not specify a source identifier, you will receive notice of the
  /// events for the objects of that type in your Amazon Web Services account.
  /// If you do not specify either the SourceType nor the SourceIdentifier, you
  /// will be notified of events generated from all Amazon Redshift sources
  /// belonging to your Amazon Web Services account. You must specify a source
  /// type if you specify a source ID.
  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionAlreadyExistFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionEventIdNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SubscriptionSeverityNotFoundFault].
  /// May throw [SourceNotFoundFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic used to transmit
  /// the event notifications. The ARN is created by Amazon SNS when you create
  /// a topic and subscribe to it.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event subscription to be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot be null, empty, or blank.
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [enabled] :
  /// A boolean value; set to <code>true</code> to activate the subscription,
  /// and set to <code>false</code> to create the subscription but not activate
  /// it.
  ///
  /// Parameter [eventCategories] :
  /// Specifies the Amazon Redshift event categories to be published by the
  /// event notification subscription.
  ///
  /// Values: configuration, management, monitoring, security, pending
  ///
  /// Parameter [severity] :
  /// Specifies the Amazon Redshift event severity to be published by the event
  /// notification subscription.
  ///
  /// Values: ERROR, INFO
  ///
  /// Parameter [sourceIds] :
  /// A list of one or more identifiers of Amazon Redshift source objects. All
  /// of the objects must be of the same type as was specified in the source
  /// type parameter. The event subscription will return only events generated
  /// by the specified objects. If not specified, then events are returned for
  /// all objects within the source type specified.
  ///
  /// Example: my-cluster-1, my-cluster-2
  ///
  /// Example: my-snapshot-20131010
  ///
  /// Parameter [sourceType] :
  /// The type of source that will be generating the events. For example, if you
  /// want to be notified of events generated by a cluster, you would set this
  /// parameter to cluster. If this value is not specified, events are returned
  /// for all Amazon Redshift objects in your Amazon Web Services account. You
  /// must specify a source type in order to specify source IDs.
  ///
  /// Valid values: cluster, cluster-parameter-group, cluster-security-group,
  /// cluster-snapshot, and scheduled-action.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateEventSubscriptionResult> createEventSubscription({
    required String snsTopicArn,
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? severity,
    List<String>? sourceIds,
    String? sourceType,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnsTopicArn'] = snsTopicArn;
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    severity?.also((arg) => $request['Severity'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEventSubscription',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEventSubscriptionResult',
    );
    return CreateEventSubscriptionResult.fromXml($result);
  }

  /// Creates an HSM client certificate that an Amazon Redshift cluster will use
  /// to connect to the client's HSM in order to store and retrieve the keys
  /// used to encrypt the cluster databases.
  ///
  /// The command returns a public key, which you must store in the HSM. In
  /// addition to creating the HSM certificate, you must create an Amazon
  /// Redshift HSM configuration that provides a cluster the information needed
  /// to store and use encryption keys in the HSM. For more information, go to
  /// <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html#working-with-HSM">Hardware
  /// Security Modules</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [HsmClientCertificateAlreadyExistsFault].
  /// May throw [HsmClientCertificateQuotaExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// The identifier to be assigned to the new HSM client certificate that the
  /// cluster will use to connect to the HSM to use the database encryption
  /// keys.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateHsmClientCertificateResult> createHsmClientCertificate({
    required String hsmClientCertificateIdentifier,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['HsmClientCertificateIdentifier'] = hsmClientCertificateIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateHsmClientCertificate',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateHsmClientCertificateMessage'],
      shapes: shapes,
      resultWrapper: 'CreateHsmClientCertificateResult',
    );
    return CreateHsmClientCertificateResult.fromXml($result);
  }

  /// Creates an HSM configuration that contains the information required by an
  /// Amazon Redshift cluster to store and use database encryption keys in a
  /// Hardware Security Module (HSM). After creating the HSM configuration, you
  /// can specify it as a parameter when creating a cluster. The cluster will
  /// then store its encryption keys in the HSM.
  ///
  /// In addition to creating an HSM configuration, you must also create an HSM
  /// client certificate. For more information, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware
  /// Security Modules</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// May throw [HsmConfigurationAlreadyExistsFault].
  /// May throw [HsmConfigurationQuotaExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [description] :
  /// A text description of the HSM configuration to be created.
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// The identifier to be assigned to the new Amazon Redshift HSM
  /// configuration.
  ///
  /// Parameter [hsmIpAddress] :
  /// The IP address that the Amazon Redshift cluster must use to access the
  /// HSM.
  ///
  /// Parameter [hsmPartitionName] :
  /// The name of the partition in the HSM where the Amazon Redshift clusters
  /// will store their database encryption keys.
  ///
  /// Parameter [hsmPartitionPassword] :
  /// The password required to access the HSM partition.
  ///
  /// Parameter [hsmServerPublicCertificate] :
  /// The HSMs public certificate file. When using Cloud HSM, the file name is
  /// server.pem.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateHsmConfigurationResult> createHsmConfiguration({
    required String description,
    required String hsmConfigurationIdentifier,
    required String hsmIpAddress,
    required String hsmPartitionName,
    required String hsmPartitionPassword,
    required String hsmServerPublicCertificate,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['Description'] = description;
    $request['HsmConfigurationIdentifier'] = hsmConfigurationIdentifier;
    $request['HsmIpAddress'] = hsmIpAddress;
    $request['HsmPartitionName'] = hsmPartitionName;
    $request['HsmPartitionPassword'] = hsmPartitionPassword;
    $request['HsmServerPublicCertificate'] = hsmServerPublicCertificate;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateHsmConfiguration',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateHsmConfigurationMessage'],
      shapes: shapes,
      resultWrapper: 'CreateHsmConfigurationResult',
    );
    return CreateHsmConfigurationResult.fromXml($result);
  }

  /// Creates an Amazon Redshift application for use with IAM Identity Center.
  ///
  /// May throw [RedshiftIdcApplicationAlreadyExistsFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceAccessDeniedFault].
  /// May throw [RedshiftIdcApplicationQuotaExceededFault].
  ///
  /// Parameter [iamRoleArn] :
  /// The IAM role ARN for the Amazon Redshift IAM Identity Center application
  /// instance. It has the required permissions to be assumed and invoke the IDC
  /// Identity Center API.
  ///
  /// Parameter [idcDisplayName] :
  /// The display name for the Amazon Redshift IAM Identity Center application
  /// instance. It appears in the console.
  ///
  /// Parameter [idcInstanceArn] :
  /// The Amazon resource name (ARN) of the IAM Identity Center instance where
  /// Amazon Redshift creates a new managed application.
  ///
  /// Parameter [redshiftIdcApplicationName] :
  /// The name of the Redshift application in IAM Identity Center.
  ///
  /// Parameter [authorizedTokenIssuerList] :
  /// The token issuer list for the Amazon Redshift IAM Identity Center
  /// application instance.
  ///
  /// Parameter [identityNamespace] :
  /// The namespace for the Amazon Redshift IAM Identity Center application
  /// instance. It determines which managed application verifies the connection
  /// token.
  ///
  /// Parameter [serviceIntegrations] :
  /// A collection of service integrations for the Redshift IAM Identity Center
  /// application.
  Future<CreateRedshiftIdcApplicationResult> createRedshiftIdcApplication({
    required String iamRoleArn,
    required String idcDisplayName,
    required String idcInstanceArn,
    required String redshiftIdcApplicationName,
    List<AuthorizedTokenIssuer>? authorizedTokenIssuerList,
    String? identityNamespace,
    List<ServiceIntegrationsUnion>? serviceIntegrations,
  }) async {
    final $request = <String, dynamic>{};
    $request['IamRoleArn'] = iamRoleArn;
    $request['IdcDisplayName'] = idcDisplayName;
    $request['IdcInstanceArn'] = idcInstanceArn;
    $request['RedshiftIdcApplicationName'] = redshiftIdcApplicationName;
    authorizedTokenIssuerList
        ?.also((arg) => $request['AuthorizedTokenIssuerList'] = arg);
    identityNamespace?.also((arg) => $request['IdentityNamespace'] = arg);
    serviceIntegrations?.also((arg) => $request['ServiceIntegrations'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateRedshiftIdcApplication',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateRedshiftIdcApplicationMessage'],
      shapes: shapes,
      resultWrapper: 'CreateRedshiftIdcApplicationResult',
    );
    return CreateRedshiftIdcApplicationResult.fromXml($result);
  }

  /// Creates a scheduled action. A scheduled action contains a schedule and an
  /// Amazon Redshift API action. For example, you can create a schedule of when
  /// to run the <code>ResizeCluster</code> API operation.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ScheduledActionAlreadyExistsFault].
  /// May throw [ScheduledActionQuotaExceededFault].
  /// May throw [ScheduledActionTypeUnsupportedFault].
  /// May throw [InvalidScheduleFault].
  /// May throw [InvalidScheduledActionFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [iamRole] :
  /// The IAM role to assume to run the target action. For more information
  /// about this parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [schedule] :
  /// The schedule in <code>at( )</code> or <code>cron( )</code> format. For
  /// more information about this parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action. The name must be unique within an
  /// account. For more information about this parameter, see
  /// <a>ScheduledAction</a>.
  ///
  /// Parameter [targetAction] :
  /// A JSON format string of the Amazon Redshift API operation with input
  /// parameters. For more information about this parameter, see
  /// <a>ScheduledAction</a>.
  ///
  /// Parameter [enable] :
  /// If true, the schedule is enabled. If false, the scheduled action does not
  /// trigger. For more information about <code>state</code> of the scheduled
  /// action, see <a>ScheduledAction</a>.
  ///
  /// Parameter [endTime] :
  /// The end time in UTC of the scheduled action. After this time, the
  /// scheduled action does not trigger. For more information about this
  /// parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [scheduledActionDescription] :
  /// The description of the scheduled action.
  ///
  /// Parameter [startTime] :
  /// The start time in UTC of the scheduled action. Before this time, the
  /// scheduled action does not trigger. For more information about this
  /// parameter, see <a>ScheduledAction</a>.
  Future<ScheduledAction> createScheduledAction({
    required String iamRole,
    required String schedule,
    required String scheduledActionName,
    required ScheduledActionType targetAction,
    bool? enable,
    DateTime? endTime,
    String? scheduledActionDescription,
    DateTime? startTime,
  }) async {
    final $request = <String, dynamic>{};
    $request['IamRole'] = iamRole;
    $request['Schedule'] = schedule;
    $request['ScheduledActionName'] = scheduledActionName;
    $request['TargetAction'] = targetAction;
    enable?.also((arg) => $request['Enable'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    scheduledActionDescription
        ?.also((arg) => $request['ScheduledActionDescription'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'CreateScheduledAction',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateScheduledActionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateScheduledActionResult',
    );
    return ScheduledAction.fromXml($result);
  }

  /// Creates a snapshot copy grant that permits Amazon Redshift to use an
  /// encrypted symmetric key from Key Management Service (KMS) to encrypt
  /// copied snapshots in a destination region.
  ///
  /// For more information about managing snapshot copy grants, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon
  /// Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [SnapshotCopyGrantAlreadyExistsFault].
  /// May throw [SnapshotCopyGrantQuotaExceededFault].
  /// May throw [LimitExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  ///
  /// Parameter [snapshotCopyGrantName] :
  /// The name of the snapshot copy grant. This name must be unique in the
  /// region for the Amazon Web Services account.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Alphabetic characters must be lowercase.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique for all clusters within an Amazon Web Services account.
  /// </li>
  /// </ul>
  ///
  /// Parameter [kmsKeyId] :
  /// The unique identifier of the encrypted symmetric key to which to grant
  /// Amazon Redshift permission. If no key is specified, the default key is
  /// used.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateSnapshotCopyGrantResult> createSnapshotCopyGrant({
    required String snapshotCopyGrantName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotCopyGrantName'] = snapshotCopyGrantName;
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateSnapshotCopyGrant',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateSnapshotCopyGrantMessage'],
      shapes: shapes,
      resultWrapper: 'CreateSnapshotCopyGrantResult',
    );
    return CreateSnapshotCopyGrantResult.fromXml($result);
  }

  /// Create a snapshot schedule that can be associated to a cluster and which
  /// overrides the default system backup schedule.
  ///
  /// May throw [SnapshotScheduleAlreadyExistsFault].
  /// May throw [InvalidScheduleFault].
  /// May throw [SnapshotScheduleQuotaExceededFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [ScheduleDefinitionTypeUnsupportedFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [dryRun] :
  /// <p/>
  ///
  /// Parameter [nextInvocations] :
  /// <p/>
  ///
  /// Parameter [scheduleDefinitions] :
  /// The definition of the snapshot schedule. The definition is made up of
  /// schedule expressions, for example "cron(30 12 *)" or "rate(12 hours)".
  ///
  /// Parameter [scheduleDescription] :
  /// The description of the snapshot schedule.
  ///
  /// Parameter [scheduleIdentifier] :
  /// A unique identifier for a snapshot schedule. Only alphanumeric characters
  /// are allowed for the identifier.
  ///
  /// Parameter [tags] :
  /// An optional set of tags you can use to search for the schedule.
  Future<SnapshotSchedule> createSnapshotSchedule({
    bool? dryRun,
    int? nextInvocations,
    List<String>? scheduleDefinitions,
    String? scheduleDescription,
    String? scheduleIdentifier,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    dryRun?.also((arg) => $request['DryRun'] = arg);
    nextInvocations?.also((arg) => $request['NextInvocations'] = arg);
    scheduleDefinitions?.also((arg) => $request['ScheduleDefinitions'] = arg);
    scheduleDescription?.also((arg) => $request['ScheduleDescription'] = arg);
    scheduleIdentifier?.also((arg) => $request['ScheduleIdentifier'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateSnapshotSchedule',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateSnapshotScheduleMessage'],
      shapes: shapes,
      resultWrapper: 'CreateSnapshotScheduleResult',
    );
    return SnapshotSchedule.fromXml($result);
  }

  /// Adds tags to a cluster.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, you will receive an error and the attempt will fail.
  ///
  /// If you specify a key that already exists for the resource, the value for
  /// that key will be updated with the new value.
  ///
  /// May throw [TagLimitExceededFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidTagFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) to which you want to add the tag or tags.
  /// For example, <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>.
  ///
  /// Parameter [tags] :
  /// One or more name/value pairs to add as tags to the specified resource.
  /// Each tag name is passed in with the parameter <code>Key</code> and the
  /// corresponding value is passed in with the parameter <code>Value</code>.
  /// The <code>Key</code> and <code>Value</code> parameters are separated by a
  /// comma (,). Separate multiple tags with a space. For example, <code>--tags
  /// "Key"="owner","Value"="admin" "Key"="environment","Value"="test"
  /// "Key"="version","Value"="1.0"</code>.
  Future<void> createTags({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'CreateTags',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTagsMessage'],
      shapes: shapes,
    );
  }

  /// Creates a usage limit for a specified Amazon Redshift feature on a
  /// cluster. The usage limit is identified by the returned usage limit
  /// identifier.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [LimitExceededFault].
  /// May throw [UsageLimitAlreadyExistsFault].
  /// May throw [InvalidUsageLimitFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [amount] :
  /// The limit amount. If time-based, this amount is in minutes. If data-based,
  /// this amount is in terabytes (TB). The value must be a positive number.
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster that you want to limit usage.
  ///
  /// Parameter [featureType] :
  /// The Amazon Redshift feature that you want to limit.
  ///
  /// Parameter [limitType] :
  /// The type of limit. Depending on the feature type, this can be based on a
  /// time duration or data size. If <code>FeatureType</code> is
  /// <code>spectrum</code>, then <code>LimitType</code> must be
  /// <code>data-scanned</code>. If <code>FeatureType</code> is
  /// <code>concurrency-scaling</code>, then <code>LimitType</code> must be
  /// <code>time</code>. If <code>FeatureType</code> is
  /// <code>cross-region-datasharing</code>, then <code>LimitType</code> must be
  /// <code>data-scanned</code>.
  ///
  /// Parameter [breachAction] :
  /// The action that Amazon Redshift takes when the limit is reached. The
  /// default is log. For more information about this parameter, see
  /// <a>UsageLimit</a>.
  ///
  /// Parameter [period] :
  /// The time period that the amount applies to. A <code>weekly</code> period
  /// begins on Sunday. The default is <code>monthly</code>.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<UsageLimit> createUsageLimit({
    required int amount,
    required String clusterIdentifier,
    required UsageLimitFeatureType featureType,
    required UsageLimitLimitType limitType,
    UsageLimitBreachAction? breachAction,
    UsageLimitPeriod? period,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['Amount'] = amount;
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['FeatureType'] = featureType.toValue();
    $request['LimitType'] = limitType.toValue();
    breachAction?.also((arg) => $request['BreachAction'] = arg.toValue());
    period?.also((arg) => $request['Period'] = arg.toValue());
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateUsageLimit',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateUsageLimitMessage'],
      shapes: shapes,
      resultWrapper: 'CreateUsageLimitResult',
    );
    return UsageLimit.fromXml($result);
  }

  /// From a datashare producer account, removes authorization from the
  /// specified datashare.
  ///
  /// May throw [InvalidDataShareFault].
  ///
  /// Parameter [consumerIdentifier] :
  /// The identifier of the data consumer that is to have authorization removed
  /// from the datashare. This identifier is an Amazon Web Services account ID
  /// or a keyword, such as ADX.
  ///
  /// Parameter [dataShareArn] :
  /// The namespace Amazon Resource Name (ARN) of the datashare to remove
  /// authorization from.
  Future<DataShare> deauthorizeDataShare({
    required String consumerIdentifier,
    required String dataShareArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['ConsumerIdentifier'] = consumerIdentifier;
    $request['DataShareArn'] = dataShareArn;
    final $result = await _protocol.send(
      $request,
      action: 'DeauthorizeDataShare',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeauthorizeDataShareMessage'],
      shapes: shapes,
      resultWrapper: 'DeauthorizeDataShareResult',
    );
    return DataShare.fromXml($result);
  }

  /// Deletes an authentication profile.
  ///
  /// May throw [AuthenticationProfileNotFoundFault].
  /// May throw [InvalidAuthenticationProfileRequestFault].
  ///
  /// Parameter [authenticationProfileName] :
  /// The name of the authentication profile to delete.
  Future<DeleteAuthenticationProfileResult> deleteAuthenticationProfile({
    required String authenticationProfileName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AuthenticationProfileName'] = authenticationProfileName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteAuthenticationProfile',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAuthenticationProfileMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteAuthenticationProfileResult',
    );
    return DeleteAuthenticationProfileResult.fromXml($result);
  }

  /// Deletes a previously provisioned cluster without its final snapshot being
  /// created. A successful response from the web service indicates that the
  /// request was received correctly. Use <a>DescribeClusters</a> to monitor the
  /// status of the deletion. The delete operation cannot be canceled or
  /// reverted once submitted. For more information about managing clusters, go
  /// to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// If you want to shut down the cluster and retain it for future use, set
  /// <i>SkipFinalClusterSnapshot</i> to <code>false</code> and specify a name
  /// for <i>FinalClusterSnapshotIdentifier</i>. You can later restore this
  /// snapshot to resume using the cluster. If a final cluster snapshot is
  /// requested, the status of the cluster will be "final-snapshot" while the
  /// snapshot is being taken, then it's "deleting" once Amazon Redshift begins
  /// deleting the cluster.
  ///
  /// For more information about managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterSnapshotAlreadyExistsFault].
  /// May throw [ClusterSnapshotQuotaExceededFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to be deleted.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain lowercase characters.
  /// </li>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalClusterSnapshotIdentifier] :
  /// The identifier of the final snapshot that is to be created immediately
  /// before deleting the cluster. If this parameter is provided,
  /// <i>SkipFinalClusterSnapshot</i> must be <code>false</code>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalClusterSnapshotRetentionPeriod] :
  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// Parameter [skipFinalClusterSnapshot] :
  /// Determines whether a final snapshot of the cluster is created before
  /// Amazon Redshift deletes the cluster. If <code>true</code>, a final cluster
  /// snapshot is not created. If <code>false</code>, a final cluster snapshot
  /// is created before the cluster is deleted.
  /// <note>
  /// The <i>FinalClusterSnapshotIdentifier</i> parameter must be specified if
  /// <i>SkipFinalClusterSnapshot</i> is <code>false</code>.
  /// </note>
  /// Default: <code>false</code>
  Future<DeleteClusterResult> deleteCluster({
    required String clusterIdentifier,
    String? finalClusterSnapshotIdentifier,
    int? finalClusterSnapshotRetentionPeriod,
    bool? skipFinalClusterSnapshot,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    finalClusterSnapshotIdentifier
        ?.also((arg) => $request['FinalClusterSnapshotIdentifier'] = arg);
    finalClusterSnapshotRetentionPeriod
        ?.also((arg) => $request['FinalClusterSnapshotRetentionPeriod'] = arg);
    skipFinalClusterSnapshot
        ?.also((arg) => $request['SkipFinalClusterSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteClusterResult',
    );
    return DeleteClusterResult.fromXml($result);
  }

  /// Deletes a specified Amazon Redshift parameter group.
  /// <note>
  /// You cannot delete a parameter group if it is associated with a cluster.
  /// </note>
  ///
  /// May throw [InvalidClusterParameterGroupStateFault].
  /// May throw [ClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to be deleted.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing cluster parameter group.
  /// </li>
  /// <li>
  /// Cannot delete a default cluster parameter group.
  /// </li>
  /// </ul>
  Future<void> deleteClusterParameterGroup({
    required String parameterGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ParameterGroupName'] = parameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteClusterParameterGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteClusterParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes an Amazon Redshift security group.
  /// <note>
  /// You cannot delete a security group that is associated with any clusters.
  /// You cannot delete the default security group.
  /// </note>
  /// For information about managing security groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon
  /// Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [ClusterSecurityGroupNotFoundFault].
  ///
  /// Parameter [clusterSecurityGroupName] :
  /// The name of the cluster security group to be deleted.
  Future<void> deleteClusterSecurityGroup({
    required String clusterSecurityGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSecurityGroupName'] = clusterSecurityGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteClusterSecurityGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteClusterSecurityGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified manual snapshot. The snapshot must be in the
  /// <code>available</code> state, with no other users authorized to access the
  /// snapshot.
  ///
  /// Unlike automated snapshots, manual snapshots are retained even after you
  /// delete your cluster. Amazon Redshift does not delete your manual
  /// snapshots. You must delete manual snapshot explicitly to avoid getting
  /// charged. If other accounts are authorized to access the snapshot, you must
  /// revoke all of the authorizations before you can delete the snapshot.
  ///
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  ///
  /// Parameter [snapshotIdentifier] :
  /// The unique identifier of the manual snapshot to be deleted.
  ///
  /// Constraints: Must be the name of an existing snapshot that is in the
  /// <code>available</code>, <code>failed</code>, or <code>cancelled</code>
  /// state.
  ///
  /// Parameter [snapshotClusterIdentifier] :
  /// The unique identifier of the cluster the snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster
  /// name.
  ///
  /// Constraints: Must be the name of valid cluster.
  Future<DeleteClusterSnapshotResult> deleteClusterSnapshot({
    required String snapshotIdentifier,
    String? snapshotClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    snapshotClusterIdentifier
        ?.also((arg) => $request['SnapshotClusterIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteClusterSnapshotResult',
    );
    return DeleteClusterSnapshotResult.fromXml($result);
  }

  /// Deletes the specified cluster subnet group.
  ///
  /// May throw [InvalidClusterSubnetGroupStateFault].
  /// May throw [InvalidClusterSubnetStateFault].
  /// May throw [ClusterSubnetGroupNotFoundFault].
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name of the cluster subnet group name to be deleted.
  Future<void> deleteClusterSubnetGroup({
    required String clusterSubnetGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSubnetGroupName'] = clusterSubnetGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteClusterSubnetGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteClusterSubnetGroupMessage'],
      shapes: shapes,
    );
  }

  /// Contains information about deleting a custom domain association for a
  /// cluster.
  ///
  /// May throw [UnsupportedOperationFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [CustomCnameAssociationFault].
  /// May throw [CustomDomainAssociationNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to delete a custom domain association for.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for the custom domain association.
  Future<void> deleteCustomDomainAssociation({
    required String clusterIdentifier,
    required String customDomainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['CustomDomainName'] = customDomainName;
    await _protocol.send(
      $request,
      action: 'DeleteCustomDomainAssociation',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCustomDomainAssociationMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a Redshift-managed VPC endpoint.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidEndpointStateFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [EndpointNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [endpointName] :
  /// The Redshift-managed VPC endpoint to delete.
  Future<EndpointAccess> deleteEndpointAccess({
    required String endpointName,
  }) async {
    final $request = <String, dynamic>{};
    $request['EndpointName'] = endpointName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteEndpointAccessResult',
    );
    return EndpointAccess.fromXml($result);
  }

  /// Deletes an Amazon Redshift event notification subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidSubscriptionStateFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the Amazon Redshift event notification subscription to be
  /// deleted.
  Future<void> deleteEventSubscription({
    required String subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    await _protocol.send(
      $request,
      action: 'DeleteEventSubscription',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEventSubscriptionMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified HSM client certificate.
  ///
  /// May throw [InvalidHsmClientCertificateStateFault].
  /// May throw [HsmClientCertificateNotFoundFault].
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// The identifier of the HSM client certificate to be deleted.
  Future<void> deleteHsmClientCertificate({
    required String hsmClientCertificateIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['HsmClientCertificateIdentifier'] = hsmClientCertificateIdentifier;
    await _protocol.send(
      $request,
      action: 'DeleteHsmClientCertificate',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteHsmClientCertificateMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified Amazon Redshift HSM configuration.
  ///
  /// May throw [InvalidHsmConfigurationStateFault].
  /// May throw [HsmConfigurationNotFoundFault].
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// The identifier of the Amazon Redshift HSM configuration to be deleted.
  Future<void> deleteHsmConfiguration({
    required String hsmConfigurationIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['HsmConfigurationIdentifier'] = hsmConfigurationIdentifier;
    await _protocol.send(
      $request,
      action: 'DeleteHsmConfiguration',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteHsmConfigurationMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a partner integration from a cluster. Data can still flow to the
  /// cluster until the integration is deleted at the partner's website.
  ///
  /// May throw [PartnerNotFoundFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnauthorizedPartnerIntegrationFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the cluster.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster that receives data from the partner.
  ///
  /// Parameter [databaseName] :
  /// The name of the database that receives data from the partner.
  ///
  /// Parameter [partnerName] :
  /// The name of the partner that is authorized to send data.
  Future<PartnerIntegrationOutputMessage> deletePartner({
    required String accountId,
    required String clusterIdentifier,
    required String databaseName,
    required String partnerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountId'] = accountId;
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['DatabaseName'] = databaseName;
    $request['PartnerName'] = partnerName;
    final $result = await _protocol.send(
      $request,
      action: 'DeletePartner',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PartnerIntegrationInputMessage'],
      shapes: shapes,
      resultWrapper: 'DeletePartnerResult',
    );
    return PartnerIntegrationOutputMessage.fromXml($result);
  }

  /// Deletes an Amazon Redshift IAM Identity Center application.
  ///
  /// May throw [RedshiftIdcApplicationNotExistsFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceAccessDeniedFault].
  ///
  /// Parameter [redshiftIdcApplicationArn] :
  /// The ARN for a deleted Amazon Redshift IAM Identity Center application.
  Future<void> deleteRedshiftIdcApplication({
    required String redshiftIdcApplicationArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['RedshiftIdcApplicationArn'] = redshiftIdcApplicationArn;
    await _protocol.send(
      $request,
      action: 'DeleteRedshiftIdcApplication',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRedshiftIdcApplicationMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the resource policy for a specified resource.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource of which its resource
  /// policy is deleted.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    await _protocol.send(
      $request,
      action: 'DeleteResourcePolicy',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteResourcePolicyMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a scheduled action.
  ///
  /// May throw [ScheduledActionNotFoundFault].
  /// May throw [UnauthorizedOperation].
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action to delete.
  Future<void> deleteScheduledAction({
    required String scheduledActionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ScheduledActionName'] = scheduledActionName;
    await _protocol.send(
      $request,
      action: 'DeleteScheduledAction',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteScheduledActionMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified snapshot copy grant.
  ///
  /// May throw [InvalidSnapshotCopyGrantStateFault].
  /// May throw [SnapshotCopyGrantNotFoundFault].
  ///
  /// Parameter [snapshotCopyGrantName] :
  /// The name of the snapshot copy grant to delete.
  Future<void> deleteSnapshotCopyGrant({
    required String snapshotCopyGrantName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotCopyGrantName'] = snapshotCopyGrantName;
    await _protocol.send(
      $request,
      action: 'DeleteSnapshotCopyGrant',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSnapshotCopyGrantMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a snapshot schedule.
  ///
  /// May throw [InvalidClusterSnapshotScheduleStateFault].
  /// May throw [SnapshotScheduleNotFoundFault].
  ///
  /// Parameter [scheduleIdentifier] :
  /// A unique identifier of the snapshot schedule to delete.
  Future<void> deleteSnapshotSchedule({
    required String scheduleIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ScheduleIdentifier'] = scheduleIdentifier;
    await _protocol.send(
      $request,
      action: 'DeleteSnapshotSchedule',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSnapshotScheduleMessage'],
      shapes: shapes,
    );
  }

  /// Deletes tags from a resource. You must provide the ARN of the resource
  /// from which you want to delete the tag or tags.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) from which you want to remove the tag or
  /// tags. For example,
  /// <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>.
  ///
  /// Parameter [tagKeys] :
  /// The tag key that you want to delete.
  Future<void> deleteTags({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'DeleteTags',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTagsMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a usage limit from a cluster.
  ///
  /// May throw [UsageLimitNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [usageLimitId] :
  /// The identifier of the usage limit to delete.
  Future<void> deleteUsageLimit({
    required String usageLimitId,
  }) async {
    final $request = <String, dynamic>{};
    $request['UsageLimitId'] = usageLimitId;
    await _protocol.send(
      $request,
      action: 'DeleteUsageLimit',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUsageLimitMessage'],
      shapes: shapes,
    );
  }

  /// Returns a list of attributes attached to an account
  ///
  /// Parameter [attributeNames] :
  /// A list of attribute names.
  Future<AccountAttributeList> describeAccountAttributes({
    List<String>? attributeNames,
  }) async {
    final $request = <String, dynamic>{};
    attributeNames?.also((arg) => $request['AttributeNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountAttributes',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountAttributesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountAttributesResult',
    );
    return AccountAttributeList.fromXml($result);
  }

  /// Describes an authentication profile.
  ///
  /// May throw [AuthenticationProfileNotFoundFault].
  /// May throw [InvalidAuthenticationProfileRequestFault].
  ///
  /// Parameter [authenticationProfileName] :
  /// The name of the authentication profile to describe. If not specified then
  /// all authentication profiles owned by the account are listed.
  Future<DescribeAuthenticationProfilesResult> describeAuthenticationProfiles({
    String? authenticationProfileName,
  }) async {
    final $request = <String, dynamic>{};
    authenticationProfileName
        ?.also((arg) => $request['AuthenticationProfileName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAuthenticationProfiles',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAuthenticationProfilesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeAuthenticationProfilesResult',
    );
    return DescribeAuthenticationProfilesResult.fromXml($result);
  }

  /// Returns an array of <code>ClusterDbRevision</code> objects.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// A unique identifier for a cluster whose <code>ClusterDbRevisions</code>
  /// you are requesting. This parameter is case sensitive. All clusters defined
  /// for an account are returned by default.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point for returning a
  /// set of response records. When the results of a
  /// <code>DescribeClusterDbRevisions</code> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Redshift returns a value in the
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned <code>marker</code> value in
  /// the <code>marker</code> parameter and retrying the request.
  ///
  /// Constraints: You can specify either the <code>ClusterIdentifier</code>
  /// parameter, or the <code>marker</code> parameter, but not both.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified MaxRecords
  /// value, a value is returned in the <code>marker</code> field of the
  /// response. You can retrieve the next set of response records by providing
  /// the returned <code>marker</code> value in the <code>marker</code>
  /// parameter and retrying the request.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20, maximum 100.
  Future<ClusterDbRevisionsMessage> describeClusterDbRevisions({
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterDbRevisions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterDbRevisionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterDbRevisionsResult',
    );
    return ClusterDbRevisionsMessage.fromXml($result);
  }

  /// Returns a list of Amazon Redshift parameter groups, including parameter
  /// groups you created and the default parameter group. For each parameter
  /// group, the response includes the parameter group name, description, and
  /// parameter group family name. You can optionally specify a name to retrieve
  /// the description of a specific parameter group.
  ///
  /// For more information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all parameter groups that match any combination of the
  /// specified keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all parameter groups that have any
  /// combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, parameter groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ClusterParameterGroupNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeClusterParameterGroups</a> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of a specific parameter group for which to return details. By
  /// default, details about all parameter groups and the default parameter
  /// group are returned.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching cluster
  /// parameter groups that are associated with the specified key or keys. For
  /// example, suppose that you have parameter groups that are tagged with keys
  /// called <code>owner</code> and <code>environment</code>. If you specify
  /// both of these tag keys in the request, Amazon Redshift returns a response
  /// with the parameter groups that have either or both of these tag keys
  /// associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching cluster
  /// parameter groups that are associated with the specified tag value or
  /// values. For example, suppose that you have parameter groups that are
  /// tagged with values called <code>admin</code> and <code>test</code>. If you
  /// specify both of these tag values in the request, Amazon Redshift returns a
  /// response with the parameter groups that have either or both of these tag
  /// values associated with them.
  Future<ClusterParameterGroupsMessage> describeClusterParameterGroups({
    String? marker,
    int? maxRecords,
    String? parameterGroupName,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    parameterGroupName?.also((arg) => $request['ParameterGroupName'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterParameterGroups',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterParameterGroupsResult',
    );
    return ClusterParameterGroupsMessage.fromXml($result);
  }

  /// Returns a detailed list of parameters contained within the specified
  /// Amazon Redshift parameter group. For each parameter the response includes
  /// information such as parameter name, description, data type, value, whether
  /// the parameter value is modifiable, and so on.
  ///
  /// You can specify <i>source</i> filter to retrieve parameters of only
  /// specific type. For example, to retrieve parameters that were modified by a
  /// user action such as from <a>ModifyClusterParameterGroup</a>, you can
  /// specify <i>source</i> equal to <i>user</i>.
  ///
  /// For more information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of a cluster parameter group for which to return details.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeClusterParameters</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [source] :
  /// The parameter types to return. Specify <code>user</code> to show
  /// parameters that are different form the default. Similarly, specify
  /// <code>engine-default</code> to show parameters that are the same as the
  /// default parameter group.
  ///
  /// Default: All parameter types returned.
  ///
  /// Valid Values: <code>user</code> | <code>engine-default</code>
  Future<ClusterParameterGroupDetails> describeClusterParameters({
    required String parameterGroupName,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    final $request = <String, dynamic>{};
    $request['ParameterGroupName'] = parameterGroupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterParameters',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterParametersResult',
    );
    return ClusterParameterGroupDetails.fromXml($result);
  }

  /// Returns information about Amazon Redshift security groups. If the name of
  /// a security group is specified, the response will contain only information
  /// about only that security group.
  ///
  /// For information about managing security groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon
  /// Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all security groups that match any combination of the
  /// specified keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all security groups that have any
  /// combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, security groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [clusterSecurityGroupName] :
  /// The name of a cluster security group for which you are requesting details.
  /// You must specify either the <b>Marker</b> parameter or a
  /// <b>ClusterSecurityGroupName</b> parameter, but not both.
  ///
  /// Example: <code>securitygroup1</code>
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeClusterSecurityGroups</a> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Constraints: You must specify either the <b>ClusterSecurityGroupName</b>
  /// parameter or the <b>Marker</b> parameter, but not both.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching cluster
  /// security groups that are associated with the specified key or keys. For
  /// example, suppose that you have security groups that are tagged with keys
  /// called <code>owner</code> and <code>environment</code>. If you specify
  /// both of these tag keys in the request, Amazon Redshift returns a response
  /// with the security groups that have either or both of these tag keys
  /// associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching cluster
  /// security groups that are associated with the specified tag value or
  /// values. For example, suppose that you have security groups that are tagged
  /// with values called <code>admin</code> and <code>test</code>. If you
  /// specify both of these tag values in the request, Amazon Redshift returns a
  /// response with the security groups that have either or both of these tag
  /// values associated with them.
  Future<ClusterSecurityGroupMessage> describeClusterSecurityGroups({
    String? clusterSecurityGroupName,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    clusterSecurityGroupName
        ?.also((arg) => $request['ClusterSecurityGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterSecurityGroups',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterSecurityGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterSecurityGroupsResult',
    );
    return ClusterSecurityGroupMessage.fromXml($result);
  }

  /// Returns one or more snapshot objects, which contain metadata about your
  /// cluster snapshots. By default, this operation returns information about
  /// all snapshots of all clusters that are owned by your Amazon Web Services
  /// account. No information is returned for snapshots owned by inactive Amazon
  /// Web Services accounts.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all snapshots that match any combination of the specified
  /// keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all snapshots that have any combination
  /// of those values are returned. Only snapshots that you own are returned in
  /// the response; shared snapshots are not returned with the tag key and tag
  /// value request parameters.
  ///
  /// If both tag keys and values are omitted from the request, snapshots are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [InvalidTagFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterExists] :
  /// A value that indicates whether to return snapshots only for an existing
  /// cluster. You can perform table-level restore only by using a snapshot of
  /// an existing cluster, that is, a cluster that has not been deleted. Values
  /// for this parameter work as follows:
  ///
  /// <ul>
  /// <li>
  /// If <code>ClusterExists</code> is set to <code>true</code>,
  /// <code>ClusterIdentifier</code> is required.
  /// </li>
  /// <li>
  /// If <code>ClusterExists</code> is set to <code>false</code> and
  /// <code>ClusterIdentifier</code> isn't specified, all snapshots associated
  /// with deleted clusters (orphaned snapshots) are returned.
  /// </li>
  /// <li>
  /// If <code>ClusterExists</code> is set to <code>false</code> and
  /// <code>ClusterIdentifier</code> is specified for a deleted cluster,
  /// snapshots associated with that cluster are returned.
  /// </li>
  /// <li>
  /// If <code>ClusterExists</code> is set to <code>false</code> and
  /// <code>ClusterIdentifier</code> is specified for an existing cluster, no
  /// snapshots are returned.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster which generated the requested snapshots.
  ///
  /// Parameter [endTime] :
  /// A time value that requests only snapshots created at or before the
  /// specified time. The time value is specified in ISO 8601 format. For more
  /// information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: <code>2012-07-16T18:00:00Z</code>
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeClusterSnapshots</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [ownerAccount] :
  /// The Amazon Web Services account used to create or copy the snapshot. Use
  /// this field to filter the results to snapshots owned by a particular
  /// account. To describe snapshots you own, either specify your Amazon Web
  /// Services account, or do not specify the parameter.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot associated with the message
  /// to describe cluster snapshots.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The snapshot identifier of the snapshot about which to return information.
  ///
  /// Parameter [snapshotType] :
  /// The type of snapshots for which you are requesting information. By
  /// default, snapshots of all types are returned.
  ///
  /// Valid Values: <code>automated</code> | <code>manual</code>
  ///
  /// Parameter [sortingEntities] :
  /// <p/>
  ///
  /// Parameter [startTime] :
  /// A value that requests only snapshots created at or after the specified
  /// time. The time value is specified in ISO 8601 format. For more information
  /// about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: <code>2012-07-16T18:00:00Z</code>
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching cluster
  /// snapshots that are associated with the specified key or keys. For example,
  /// suppose that you have snapshots that are tagged with keys called
  /// <code>owner</code> and <code>environment</code>. If you specify both of
  /// these tag keys in the request, Amazon Redshift returns a response with the
  /// snapshots that have either or both of these tag keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching cluster
  /// snapshots that are associated with the specified tag value or values. For
  /// example, suppose that you have snapshots that are tagged with values
  /// called <code>admin</code> and <code>test</code>. If you specify both of
  /// these tag values in the request, Amazon Redshift returns a response with
  /// the snapshots that have either or both of these tag values associated with
  /// them.
  Future<SnapshotMessage> describeClusterSnapshots({
    bool? clusterExists,
    String? clusterIdentifier,
    DateTime? endTime,
    String? marker,
    int? maxRecords,
    String? ownerAccount,
    String? snapshotArn,
    String? snapshotIdentifier,
    String? snapshotType,
    List<SnapshotSortingEntity>? sortingEntities,
    DateTime? startTime,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    clusterExists?.also((arg) => $request['ClusterExists'] = arg);
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    ownerAccount?.also((arg) => $request['OwnerAccount'] = arg);
    snapshotArn?.also((arg) => $request['SnapshotArn'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    sortingEntities?.also((arg) => $request['SortingEntities'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterSnapshots',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterSnapshotsResult',
    );
    return SnapshotMessage.fromXml($result);
  }

  /// Returns one or more cluster subnet group objects, which contain metadata
  /// about your cluster subnet groups. By default, this operation returns
  /// information about all cluster subnet groups that are defined in your
  /// Amazon Web Services account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all subnet groups that match any combination of the
  /// specified keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all subnet groups that have any
  /// combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, subnet groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ClusterSubnetGroupNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name of the cluster subnet group for which information is requested.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeClusterSubnetGroups</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching cluster subnet
  /// groups that are associated with the specified key or keys. For example,
  /// suppose that you have subnet groups that are tagged with keys called
  /// <code>owner</code> and <code>environment</code>. If you specify both of
  /// these tag keys in the request, Amazon Redshift returns a response with the
  /// subnet groups that have either or both of these tag keys associated with
  /// them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching cluster
  /// subnet groups that are associated with the specified tag value or values.
  /// For example, suppose that you have subnet groups that are tagged with
  /// values called <code>admin</code> and <code>test</code>. If you specify
  /// both of these tag values in the request, Amazon Redshift returns a
  /// response with the subnet groups that have either or both of these tag
  /// values associated with them.
  Future<ClusterSubnetGroupMessage> describeClusterSubnetGroups({
    String? clusterSubnetGroupName,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    clusterSubnetGroupName
        ?.also((arg) => $request['ClusterSubnetGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterSubnetGroups',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterSubnetGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterSubnetGroupsResult',
    );
    return ClusterSubnetGroupMessage.fromXml($result);
  }

  /// Returns a list of all the available maintenance tracks.
  ///
  /// May throw [InvalidClusterTrackFault].
  /// May throw [UnauthorizedOperation].
  ///
  /// Parameter [maintenanceTrackName] :
  /// The name of the maintenance track.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <code>DescribeClusterTracks</code>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon
  /// Redshift returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// An integer value for the maximum number of maintenance tracks to return.
  Future<TrackListMessage> describeClusterTracks({
    String? maintenanceTrackName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    maintenanceTrackName?.also((arg) => $request['MaintenanceTrackName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterTracks',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterTracksMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterTracksResult',
    );
    return TrackListMessage.fromXml($result);
  }

  /// Returns descriptions of the available Amazon Redshift cluster versions.
  /// You can call this operation even before creating any clusters to learn
  /// more about the Amazon Redshift versions. For more information about
  /// managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Parameter [clusterParameterGroupFamily] :
  /// The name of a specific cluster parameter group family to return details
  /// for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterVersion] :
  /// The specific cluster version to return.
  ///
  /// Example: <code>1.0</code>
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeClusterVersions</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  Future<ClusterVersionsMessage> describeClusterVersions({
    String? clusterParameterGroupFamily,
    String? clusterVersion,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    clusterParameterGroupFamily
        ?.also((arg) => $request['ClusterParameterGroupFamily'] = arg);
    clusterVersion?.also((arg) => $request['ClusterVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusterVersions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClusterVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClusterVersionsResult',
    );
    return ClusterVersionsMessage.fromXml($result);
  }

  /// Returns properties of provisioned clusters including general cluster
  /// properties, cluster database properties, maintenance and backup
  /// properties, and security and access properties. This operation supports
  /// pagination. For more information about managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all clusters that match any combination of the specified
  /// keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all clusters that have any combination
  /// of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, clusters are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of a cluster whose properties you are requesting.
  /// This parameter is case sensitive.
  ///
  /// The default is that all clusters defined for an account are returned.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeClusters</a> request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Constraints: You can specify either the <b>ClusterIdentifier</b> parameter
  /// or the <b>Marker</b> parameter, but not both.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching clusters that
  /// are associated with the specified key or keys. For example, suppose that
  /// you have clusters that are tagged with keys called <code>owner</code> and
  /// <code>environment</code>. If you specify both of these tag keys in the
  /// request, Amazon Redshift returns a response with the clusters that have
  /// either or both of these tag keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching clusters
  /// that are associated with the specified tag value or values. For example,
  /// suppose that you have clusters that are tagged with values called
  /// <code>admin</code> and <code>test</code>. If you specify both of these tag
  /// values in the request, Amazon Redshift returns a response with the
  /// clusters that have either or both of these tag values associated with
  /// them.
  Future<ClustersMessage> describeClusters({
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeClusters',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeClustersResult',
    );
    return ClustersMessage.fromXml($result);
  }

  /// Contains information about custom domain associations for a cluster.
  ///
  /// May throw [CustomDomainAssociationNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The certificate Amazon Resource Name (ARN) for the custom domain
  /// association.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for the custom domain association.
  ///
  /// Parameter [marker] :
  /// The marker for the custom domain association.
  ///
  /// Parameter [maxRecords] :
  /// The maximum records setting for the associated custom domain.
  Future<CustomDomainAssociationsMessage> describeCustomDomainAssociations({
    String? customDomainCertificateArn,
    String? customDomainName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    customDomainCertificateArn
        ?.also((arg) => $request['CustomDomainCertificateArn'] = arg);
    customDomainName?.also((arg) => $request['CustomDomainName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCustomDomainAssociations',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCustomDomainAssociationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCustomDomainAssociationsResult',
    );
    return CustomDomainAssociationsMessage.fromXml($result);
  }

  /// Shows the status of any inbound or outbound datashares available in the
  /// specified account.
  ///
  /// May throw [InvalidDataShareFault].
  ///
  /// Parameter [dataShareArn] :
  /// The Amazon resource name (ARN) of the datashare to describe details of.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeDataShares</a> request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  Future<DescribeDataSharesResult> describeDataShares({
    String? dataShareArn,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dataShareArn?.also((arg) => $request['DataShareArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDataShares',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDataSharesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDataSharesResult',
    );
    return DescribeDataSharesResult.fromXml($result);
  }

  /// Returns a list of datashares where the account identifier being called is
  /// a consumer account identifier.
  ///
  /// May throw [InvalidNamespaceFault].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) of the consumer namespace that returns in
  /// the list of datashares.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeDataSharesForConsumer</a> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Parameter [status] :
  /// An identifier giving the status of a datashare in the consumer cluster. If
  /// this field is specified, Amazon Redshift returns the list of datashares
  /// that have the specified status.
  Future<DescribeDataSharesForConsumerResult> describeDataSharesForConsumer({
    String? consumerArn,
    String? marker,
    int? maxRecords,
    DataShareStatusForConsumer? status,
  }) async {
    final $request = <String, dynamic>{};
    consumerArn?.also((arg) => $request['ConsumerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    status?.also((arg) => $request['Status'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDataSharesForConsumer',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDataSharesForConsumerMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDataSharesForConsumerResult',
    );
    return DescribeDataSharesForConsumerResult.fromXml($result);
  }

  /// Returns a list of datashares when the account identifier being called is a
  /// producer account identifier.
  ///
  /// May throw [InvalidNamespaceFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeDataSharesForProducer</a> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Parameter [producerArn] :
  /// The Amazon Resource Name (ARN) of the producer namespace that returns in
  /// the list of datashares.
  ///
  /// Parameter [status] :
  /// An identifier giving the status of a datashare in the producer. If this
  /// field is specified, Amazon Redshift returns the list of datashares that
  /// have the specified status.
  Future<DescribeDataSharesForProducerResult> describeDataSharesForProducer({
    String? marker,
    int? maxRecords,
    String? producerArn,
    DataShareStatusForProducer? status,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    producerArn?.also((arg) => $request['ProducerArn'] = arg);
    status?.also((arg) => $request['Status'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDataSharesForProducer',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDataSharesForProducerMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDataSharesForProducerResult',
    );
    return DescribeDataSharesForProducerResult.fromXml($result);
  }

  /// Returns a list of parameter settings for the specified parameter group
  /// family.
  ///
  /// For more information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Parameter [parameterGroupFamily] :
  /// The name of the cluster parameter group family.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeDefaultClusterParameters</a> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  Future<DescribeDefaultClusterParametersResult>
      describeDefaultClusterParameters({
    required String parameterGroupFamily,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    $request['ParameterGroupFamily'] = parameterGroupFamily;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDefaultClusterParameters',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDefaultClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDefaultClusterParametersResult',
    );
    return DescribeDefaultClusterParametersResult.fromXml($result);
  }

  /// Describes a Redshift-managed VPC endpoint.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [EndpointNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier associated with the described endpoint.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint to be described.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEndpointAccess</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by the <code>MaxRecords</code> parameter.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a <code>Marker</code> is included in the response so that the
  /// remaining results can be retrieved.
  ///
  /// Parameter [resourceOwner] :
  /// The Amazon Web Services account ID of the owner of the cluster.
  ///
  /// Parameter [vpcId] :
  /// The virtual private cloud (VPC) identifier with access to the cluster.
  Future<EndpointAccessList> describeEndpointAccess({
    String? clusterIdentifier,
    String? endpointName,
    String? marker,
    int? maxRecords,
    String? resourceOwner,
    String? vpcId,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    endpointName?.also((arg) => $request['EndpointName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    resourceOwner?.also((arg) => $request['ResourceOwner'] = arg);
    vpcId?.also((arg) => $request['VpcId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEndpointAccessResult',
    );
    return EndpointAccessList.fromXml($result);
  }

  /// Describes an endpoint authorization.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID of either the cluster owner (grantor)
  /// or grantee. If <code>Grantee</code> parameter is true, then the
  /// <code>Account</code> value is of the grantor.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster to access.
  ///
  /// Parameter [grantee] :
  /// Indicates whether to check authorization from a grantor or grantee point
  /// of view. If true, Amazon Redshift returns endpoint authorizations that
  /// you've been granted. If false (default), checks authorization from a
  /// grantor point of view.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEndpointAuthorization</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by the <code>MaxRecords</code> parameter.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a <code>Marker</code> is included in the response so that the
  /// remaining results can be retrieved.
  Future<EndpointAuthorizationList> describeEndpointAuthorization({
    String? account,
    String? clusterIdentifier,
    bool? grantee,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    account?.also((arg) => $request['Account'] = arg);
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    grantee?.also((arg) => $request['Grantee'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEndpointAuthorization',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEndpointAuthorizationMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEndpointAuthorizationResult',
    );
    return EndpointAuthorizationList.fromXml($result);
  }

  /// Displays a list of event categories for all event source types, or for a
  /// specified source type. For a list of the event categories and source
  /// types, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html">Amazon
  /// Redshift Event Notifications</a>.
  ///
  /// Parameter [sourceType] :
  /// The source type, such as cluster or parameter group, to which the
  /// described event categories apply.
  ///
  /// Valid values: cluster, cluster-snapshot, cluster-parameter-group,
  /// cluster-security-group, and scheduled-action.
  Future<EventCategoriesMessage> describeEventCategories({
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventCategories',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventCategoriesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventCategoriesResult',
    );
    return EventCategoriesMessage.fromXml($result);
  }

  /// Lists descriptions of all the Amazon Redshift event notification
  /// subscriptions for a customer account. If you specify a subscription name,
  /// lists the description for that subscription.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all event notification subscriptions that match any
  /// combination of the specified keys and values. For example, if you have
  /// <code>owner</code> and <code>environment</code> for tag keys, and
  /// <code>admin</code> and <code>test</code> for tag values, all subscriptions
  /// that have any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, subscriptions
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a DescribeEventSubscriptions request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the Amazon Redshift event notification subscription to be
  /// described.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching event
  /// notification subscriptions that are associated with the specified key or
  /// keys. For example, suppose that you have subscriptions that are tagged
  /// with keys called <code>owner</code> and <code>environment</code>. If you
  /// specify both of these tag keys in the request, Amazon Redshift returns a
  /// response with the subscriptions that have either or both of these tag keys
  /// associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching event
  /// notification subscriptions that are associated with the specified tag
  /// value or values. For example, suppose that you have subscriptions that are
  /// tagged with values called <code>admin</code> and <code>test</code>. If you
  /// specify both of these tag values in the request, Amazon Redshift returns a
  /// response with the subscriptions that have either or both of these tag
  /// values associated with them.
  Future<EventSubscriptionsMessage> describeEventSubscriptions({
    String? marker,
    int? maxRecords,
    String? subscriptionName,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    subscriptionName?.also((arg) => $request['SubscriptionName'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventSubscriptions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventSubscriptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventSubscriptionsResult',
    );
    return EventSubscriptionsMessage.fromXml($result);
  }

  /// Returns events related to clusters, security groups, snapshots, and
  /// parameter groups for the past 14 days. Events specific to a particular
  /// cluster, security group, snapshot or parameter group can be obtained by
  /// providing the name as a parameter. By default, the past hour of events are
  /// returned.
  ///
  /// Parameter [duration] :
  /// The number of minutes prior to the time of the request for which to
  /// retrieve events. For example, if the request is sent at 18:00 and you
  /// specify a duration of 60, then only events which have occurred after 17:00
  /// will be returned.
  ///
  /// Default: <code>60</code>
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: <code>2009-07-08T18:00Z</code>
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeEvents</a> request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source for which events will be returned. If
  /// this parameter is not specified, then all sources are included in the
  /// response.
  ///
  /// Constraints:
  ///
  /// If <i>SourceIdentifier</i> is supplied, <i>SourceType</i> must also be
  /// provided.
  ///
  /// <ul>
  /// <li>
  /// Specify a cluster identifier when <i>SourceType</i> is
  /// <code>cluster</code>.
  /// </li>
  /// <li>
  /// Specify a cluster security group name when <i>SourceType</i> is
  /// <code>cluster-security-group</code>.
  /// </li>
  /// <li>
  /// Specify a cluster parameter group name when <i>SourceType</i> is
  /// <code>cluster-parameter-group</code>.
  /// </li>
  /// <li>
  /// Specify a cluster snapshot identifier when <i>SourceType</i> is
  /// <code>cluster-snapshot</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Constraints:
  ///
  /// If <i>SourceType</i> is supplied, <i>SourceIdentifier</i> must also be
  /// provided.
  ///
  /// <ul>
  /// <li>
  /// Specify <code>cluster</code> when <i>SourceIdentifier</i> is a cluster
  /// identifier.
  /// </li>
  /// <li>
  /// Specify <code>cluster-security-group</code> when <i>SourceIdentifier</i>
  /// is a cluster security group name.
  /// </li>
  /// <li>
  /// Specify <code>cluster-parameter-group</code> when <i>SourceIdentifier</i>
  /// is a cluster parameter group name.
  /// </li>
  /// <li>
  /// Specify <code>cluster-snapshot</code> when <i>SourceIdentifier</i> is a
  /// cluster snapshot identifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: <code>2009-07-08T18:00Z</code>
  Future<EventsMessage> describeEvents({
    int? duration,
    DateTime? endTime,
    String? marker,
    int? maxRecords,
    String? sourceIdentifier,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final $request = <String, dynamic>{};
    duration?.also((arg) => $request['Duration'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  /// Returns information about the specified HSM client certificate. If no
  /// certificate ID is specified, returns information about all the HSM
  /// certificates owned by your Amazon Web Services account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all HSM client certificates that match any combination of
  /// the specified keys and values. For example, if you have <code>owner</code>
  /// and <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all HSM client certificates that have
  /// any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, HSM client
  /// certificates are returned regardless of whether they have tag keys or
  /// values associated with them.
  ///
  /// May throw [HsmClientCertificateNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// The identifier of a specific HSM client certificate for which you want
  /// information. If no identifier is specified, information is returned for
  /// all HSM client certificates owned by your Amazon Web Services account.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeHsmClientCertificates</a> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching HSM client
  /// certificates that are associated with the specified key or keys. For
  /// example, suppose that you have HSM client certificates that are tagged
  /// with keys called <code>owner</code> and <code>environment</code>. If you
  /// specify both of these tag keys in the request, Amazon Redshift returns a
  /// response with the HSM client certificates that have either or both of
  /// these tag keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching HSM client
  /// certificates that are associated with the specified tag value or values.
  /// For example, suppose that you have HSM client certificates that are tagged
  /// with values called <code>admin</code> and <code>test</code>. If you
  /// specify both of these tag values in the request, Amazon Redshift returns a
  /// response with the HSM client certificates that have either or both of
  /// these tag values associated with them.
  Future<HsmClientCertificateMessage> describeHsmClientCertificates({
    String? hsmClientCertificateIdentifier,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    hsmClientCertificateIdentifier
        ?.also((arg) => $request['HsmClientCertificateIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeHsmClientCertificates',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeHsmClientCertificatesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeHsmClientCertificatesResult',
    );
    return HsmClientCertificateMessage.fromXml($result);
  }

  /// Returns information about the specified Amazon Redshift HSM configuration.
  /// If no configuration ID is specified, returns information about all the HSM
  /// configurations owned by your Amazon Web Services account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all HSM connections that match any combination of the
  /// specified keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all HSM connections that have any
  /// combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, HSM connections
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [HsmConfigurationNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// The identifier of a specific Amazon Redshift HSM configuration to be
  /// described. If no identifier is specified, information is returned for all
  /// HSM configurations owned by your Amazon Web Services account.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeHsmConfigurations</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching HSM
  /// configurations that are associated with the specified key or keys. For
  /// example, suppose that you have HSM configurations that are tagged with
  /// keys called <code>owner</code> and <code>environment</code>. If you
  /// specify both of these tag keys in the request, Amazon Redshift returns a
  /// response with the HSM configurations that have either or both of these tag
  /// keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching HSM
  /// configurations that are associated with the specified tag value or values.
  /// For example, suppose that you have HSM configurations that are tagged with
  /// values called <code>admin</code> and <code>test</code>. If you specify
  /// both of these tag values in the request, Amazon Redshift returns a
  /// response with the HSM configurations that have either or both of these tag
  /// values associated with them.
  Future<HsmConfigurationMessage> describeHsmConfigurations({
    String? hsmConfigurationIdentifier,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    hsmConfigurationIdentifier
        ?.also((arg) => $request['HsmConfigurationIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeHsmConfigurations',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeHsmConfigurationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeHsmConfigurationsResult',
    );
    return HsmConfigurationMessage.fromXml($result);
  }

  /// Returns a list of inbound integrations.
  ///
  /// May throw [IntegrationNotFoundFault].
  /// May throw [InvalidNamespaceFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the inbound integration.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeInboundIntegrations</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) of the target of an inbound integration.
  Future<InboundIntegrationsMessage> describeInboundIntegrations({
    String? integrationArn,
    String? marker,
    int? maxRecords,
    String? targetArn,
  }) async {
    final $request = <String, dynamic>{};
    integrationArn?.also((arg) => $request['IntegrationArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    targetArn?.also((arg) => $request['TargetArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInboundIntegrations',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeInboundIntegrationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeInboundIntegrationsResult',
    );
    return InboundIntegrationsMessage.fromXml($result);
  }

  /// Describes whether information, such as queries and connection attempts, is
  /// being logged for the specified Amazon Redshift cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster from which to get the logging status.
  ///
  /// Example: <code>examplecluster</code>
  Future<LoggingStatus> describeLoggingStatus({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoggingStatus',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoggingStatusMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeLoggingStatusResult',
    );
    return LoggingStatus.fromXml($result);
  }

  /// Returns properties of possible node configurations such as node type,
  /// number of nodes, and disk usage for the specified action type.
  ///
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [AccessToSnapshotDeniedFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [actionType] :
  /// The action type to evaluate for possible node configurations. Specify
  /// "restore-cluster" to get configuration combinations based on an existing
  /// snapshot. Specify "recommend-node-config" to get configuration
  /// recommendations based on an existing cluster or snapshot. Specify
  /// "resize-cluster" to get configuration combinations for elastic resize
  /// based on an existing cluster.
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to evaluate for possible node
  /// configurations.
  ///
  /// Parameter [filters] :
  /// A set of name, operator, and value items to filter the results.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeNodeConfigurationOptions</a> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>500</code>
  ///
  /// Constraints: minimum 100, maximum 500.
  ///
  /// Parameter [ownerAccount] :
  /// The Amazon Web Services account used to create or copy the snapshot.
  /// Required if you are restoring a snapshot you do not own, optional if you
  /// own the snapshot.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot associated with the message
  /// to describe node configuration.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier of the snapshot to evaluate for possible node
  /// configurations.
  Future<NodeConfigurationOptionsMessage> describeNodeConfigurationOptions({
    required ActionType actionType,
    String? clusterIdentifier,
    List<NodeConfigurationOptionsFilter>? filters,
    String? marker,
    int? maxRecords,
    String? ownerAccount,
    String? snapshotArn,
    String? snapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ActionType'] = actionType.toValue();
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    ownerAccount?.also((arg) => $request['OwnerAccount'] = arg);
    snapshotArn?.also((arg) => $request['SnapshotArn'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeNodeConfigurationOptions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeNodeConfigurationOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeNodeConfigurationOptionsResult',
    );
    return NodeConfigurationOptionsMessage.fromXml($result);
  }

  /// Returns a list of orderable cluster options. Before you create a new
  /// cluster you can use this operation to find what options are available,
  /// such as the EC2 Availability Zones (AZ) in the specific Amazon Web
  /// Services Region that you can specify, and the node types you can request.
  /// The node types differ by available storage, memory, CPU and price. With
  /// the cost involved you might want to obtain a list of cluster options in
  /// the specific region and specify values when creating a cluster. For more
  /// information about managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Parameter [clusterVersion] :
  /// The version filter value. Specify this parameter to show only the
  /// available offerings matching the specified version.
  ///
  /// Default: All versions.
  ///
  /// Constraints: Must be one of the version returned from
  /// <a>DescribeClusterVersions</a>.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeOrderableClusterOptions</a> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [nodeType] :
  /// The node type filter value. Specify this parameter to show only the
  /// available offerings matching the specified node type.
  Future<OrderableClusterOptionsMessage> describeOrderableClusterOptions({
    String? clusterVersion,
    String? marker,
    int? maxRecords,
    String? nodeType,
  }) async {
    final $request = <String, dynamic>{};
    clusterVersion?.also((arg) => $request['ClusterVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nodeType?.also((arg) => $request['NodeType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrderableClusterOptions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOrderableClusterOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOrderableClusterOptionsResult',
    );
    return OrderableClusterOptionsMessage.fromXml($result);
  }

  /// Returns information about the partner integrations defined for a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnauthorizedPartnerIntegrationFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the cluster.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster whose partner integration is being
  /// described.
  ///
  /// Parameter [databaseName] :
  /// The name of the database whose partner integration is being described. If
  /// database name is not specified, then all databases in the cluster are
  /// described.
  ///
  /// Parameter [partnerName] :
  /// The name of the partner that is being described. If partner name is not
  /// specified, then all partner integrations are described.
  Future<DescribePartnersOutputMessage> describePartners({
    required String accountId,
    required String clusterIdentifier,
    String? databaseName,
    String? partnerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountId'] = accountId;
    $request['ClusterIdentifier'] = clusterIdentifier;
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    partnerName?.also((arg) => $request['PartnerName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePartners',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePartnersInputMessage'],
      shapes: shapes,
      resultWrapper: 'DescribePartnersResult',
    );
    return DescribePartnersOutputMessage.fromXml($result);
  }

  /// Lists the Amazon Redshift IAM Identity Center applications.
  ///
  /// May throw [RedshiftIdcApplicationNotExistsFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceAccessDeniedFault].
  ///
  /// Parameter [marker] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the Marker parameter and retrying the command. If the Marker
  /// field is empty, all response records have been retrieved for the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified MaxRecords
  /// value, a value is returned in a marker field of the response. You can
  /// retrieve the next set of records by retrying the command with the returned
  /// marker value.
  ///
  /// Parameter [redshiftIdcApplicationArn] :
  /// The ARN for the Redshift application that integrates with IAM Identity
  /// Center.
  Future<DescribeRedshiftIdcApplicationsResult>
      describeRedshiftIdcApplications({
    String? marker,
    int? maxRecords,
    String? redshiftIdcApplicationArn,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    redshiftIdcApplicationArn
        ?.also((arg) => $request['RedshiftIdcApplicationArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeRedshiftIdcApplications',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeRedshiftIdcApplicationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeRedshiftIdcApplicationsResult',
    );
    return DescribeRedshiftIdcApplicationsResult.fromXml($result);
  }

  /// Returns exchange status details and associated metadata for a
  /// reserved-node exchange. Statuses include such values as in progress and
  /// requested.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [ReservedNodeExchangeNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeReservedNodeExchangeStatus</code> request. If this parameter
  /// is specified, the response includes only records beyond the marker, up to
  /// the value specified by the <code>MaxRecords</code> parameter. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Parameter [reservedNodeExchangeRequestId] :
  /// The identifier of the reserved-node exchange request.
  ///
  /// Parameter [reservedNodeId] :
  /// The identifier of the source reserved node in a reserved-node exchange
  /// request.
  Future<DescribeReservedNodeExchangeStatusOutputMessage>
      describeReservedNodeExchangeStatus({
    String? marker,
    int? maxRecords,
    String? reservedNodeExchangeRequestId,
    String? reservedNodeId,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    reservedNodeExchangeRequestId
        ?.also((arg) => $request['ReservedNodeExchangeRequestId'] = arg);
    reservedNodeId?.also((arg) => $request['ReservedNodeId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedNodeExchangeStatus',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedNodeExchangeStatusInputMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedNodeExchangeStatusResult',
    );
    return DescribeReservedNodeExchangeStatusOutputMessage.fromXml($result);
  }

  /// Returns a list of the available reserved node offerings by Amazon Redshift
  /// with their descriptions including the node type, the fixed and recurring
  /// costs of reserving the node and duration the node will be reserved for
  /// you. These descriptions help you determine which reserve node offering you
  /// want to purchase. You then use the unique offering ID in you call to
  /// <a>PurchaseReservedNodeOffering</a> to reserve one or more nodes for your
  /// Amazon Redshift cluster.
  ///
  /// For more information about reserved node offerings, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing
  /// Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.
  ///
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceUnavailableFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <a>DescribeReservedNodeOfferings</a> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [reservedNodeOfferingId] :
  /// The unique identifier for the offering.
  Future<ReservedNodeOfferingsMessage> describeReservedNodeOfferings({
    String? marker,
    int? maxRecords,
    String? reservedNodeOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    reservedNodeOfferingId
        ?.also((arg) => $request['ReservedNodeOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedNodeOfferings',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedNodeOfferingsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedNodeOfferingsResult',
    );
    return ReservedNodeOfferingsMessage.fromXml($result);
  }

  /// Returns the descriptions of the reserved nodes.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [DependentServiceUnavailableFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeReservedNodes</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [reservedNodeId] :
  /// Identifier for the node reservation.
  Future<ReservedNodesMessage> describeReservedNodes({
    String? marker,
    int? maxRecords,
    String? reservedNodeId,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    reservedNodeId?.also((arg) => $request['ReservedNodeId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedNodes',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedNodesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedNodesResult',
    );
    return ReservedNodesMessage.fromXml($result);
  }

  /// Returns information about the last resize operation for the specified
  /// cluster. If no resize operation has ever been initiated for the specified
  /// cluster, a <code>HTTP 404</code> error is returned. If a resize operation
  /// was initiated and completed, the status of the resize remains as
  /// <code>SUCCEEDED</code> until the next resize.
  ///
  /// A resize operation can be requested using <a>ModifyCluster</a> and
  /// specifying a different number or type of nodes for the cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ResizeNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of a cluster whose resize progress you are
  /// requesting. This parameter is case-sensitive.
  ///
  /// By default, resize operations for all clusters defined for an Amazon Web
  /// Services account are returned.
  Future<ResizeProgressMessage> describeResize({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeResize',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeResizeMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeResizeResult',
    );
    return ResizeProgressMessage.fromXml($result);
  }

  /// Describes properties of scheduled actions.
  ///
  /// May throw [ScheduledActionNotFoundFault].
  /// May throw [UnauthorizedOperation].
  ///
  /// Parameter [active] :
  /// If true, retrieve only active scheduled actions. If false, retrieve only
  /// disabled scheduled actions.
  ///
  /// Parameter [endTime] :
  /// The end time in UTC of the scheduled action to retrieve. Only active
  /// scheduled actions that have invocations before this time are retrieved.
  ///
  /// Parameter [filters] :
  /// List of scheduled action filters.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeScheduledActions</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the <code>Marker</code> parameter and retrying
  /// the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action to retrieve.
  ///
  /// Parameter [startTime] :
  /// The start time in UTC of the scheduled actions to retrieve. Only active
  /// scheduled actions that have invocations after this time are retrieved.
  ///
  /// Parameter [targetActionType] :
  /// The type of the scheduled actions to retrieve.
  Future<ScheduledActionsMessage> describeScheduledActions({
    bool? active,
    DateTime? endTime,
    List<ScheduledActionFilter>? filters,
    String? marker,
    int? maxRecords,
    String? scheduledActionName,
    DateTime? startTime,
    ScheduledActionTypeValues? targetActionType,
  }) async {
    final $request = <String, dynamic>{};
    active?.also((arg) => $request['Active'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    scheduledActionName?.also((arg) => $request['ScheduledActionName'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    targetActionType
        ?.also((arg) => $request['TargetActionType'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeScheduledActions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeScheduledActionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeScheduledActionsResult',
    );
    return ScheduledActionsMessage.fromXml($result);
  }

  /// Returns a list of snapshot copy grants owned by the Amazon Web Services
  /// account in the destination region.
  ///
  /// For more information about managing snapshot copy grants, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon
  /// Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [SnapshotCopyGrantNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <code>DescribeSnapshotCopyGrant</code> request exceed the value specified
  /// in <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Constraints: You can specify either the <b>SnapshotCopyGrantName</b>
  /// parameter or the <b>Marker</b> parameter, but not both.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [snapshotCopyGrantName] :
  /// The name of the snapshot copy grant.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching resources that
  /// are associated with the specified key or keys. For example, suppose that
  /// you have resources tagged with keys called <code>owner</code> and
  /// <code>environment</code>. If you specify both of these tag keys in the
  /// request, Amazon Redshift returns a response with all resources that have
  /// either or both of these tag keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching resources
  /// that are associated with the specified value or values. For example,
  /// suppose that you have resources tagged with values called
  /// <code>admin</code> and <code>test</code>. If you specify both of these tag
  /// values in the request, Amazon Redshift returns a response with all
  /// resources that have either or both of these tag values associated with
  /// them.
  Future<SnapshotCopyGrantMessage> describeSnapshotCopyGrants({
    String? marker,
    int? maxRecords,
    String? snapshotCopyGrantName,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotCopyGrantName
        ?.also((arg) => $request['SnapshotCopyGrantName'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSnapshotCopyGrants',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSnapshotCopyGrantsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeSnapshotCopyGrantsResult',
    );
    return SnapshotCopyGrantMessage.fromXml($result);
  }

  /// Returns a list of snapshot schedules.
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier for the cluster whose snapshot schedules you want to
  /// view.
  ///
  /// Parameter [marker] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the <code>marker</code> parameter and retrying the command. If
  /// the <code>marker</code> field is empty, all response records have been
  /// retrieved for the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number or response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned <code>marker</code>
  /// value.
  ///
  /// Parameter [scheduleIdentifier] :
  /// A unique identifier for a snapshot schedule.
  ///
  /// Parameter [tagKeys] :
  /// The key value for a snapshot schedule tag.
  ///
  /// Parameter [tagValues] :
  /// The value corresponding to the key of the snapshot schedule tag.
  Future<DescribeSnapshotSchedulesOutputMessage> describeSnapshotSchedules({
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
    String? scheduleIdentifier,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    scheduleIdentifier?.also((arg) => $request['ScheduleIdentifier'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSnapshotSchedules',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSnapshotSchedulesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeSnapshotSchedulesResult',
    );
    return DescribeSnapshotSchedulesOutputMessage.fromXml($result);
  }

  /// Returns account level backups storage size and provisional storage.
  Future<CustomerStorageMessage> describeStorage() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeStorage',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeStorageResult',
    );
    return CustomerStorageMessage.fromXml($result);
  }

  /// Lists the status of one or more table restore requests made using the
  /// <a>RestoreTableFromClusterSnapshot</a> API action. If you don't specify a
  /// value for the <code>TableRestoreRequestId</code> parameter, then
  /// <code>DescribeTableRestoreStatus</code> returns the status of all table
  /// restore requests ordered by the date and time of the request in ascending
  /// order. Otherwise <code>DescribeTableRestoreStatus</code> returns the
  /// status of the table specified by <code>TableRestoreRequestId</code>.
  ///
  /// May throw [TableRestoreNotFoundFault].
  /// May throw [ClusterNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The Amazon Redshift cluster that the table is being restored to.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeTableRestoreStatus</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by the <code>MaxRecords</code> parameter.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Parameter [tableRestoreRequestId] :
  /// The identifier of the table restore request to return status for. If you
  /// don't specify a <code>TableRestoreRequestId</code> value, then
  /// <code>DescribeTableRestoreStatus</code> returns the status of all
  /// in-progress table restore requests.
  Future<TableRestoreStatusMessage> describeTableRestoreStatus({
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
    String? tableRestoreRequestId,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tableRestoreRequestId
        ?.also((arg) => $request['TableRestoreRequestId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTableRestoreStatus',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTableRestoreStatusMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeTableRestoreStatusResult',
    );
    return TableRestoreStatusMessage.fromXml($result);
  }

  /// Returns a list of tags. You can return tags from a specific resource by
  /// specifying an ARN, or you can return all tags for a given type of
  /// resource, such as clusters, snapshots, and so on.
  ///
  /// The following are limitations for <code>DescribeTags</code>:
  ///
  /// <ul>
  /// <li>
  /// You cannot specify an ARN and a resource-type value together in the same
  /// request.
  /// </li>
  /// <li>
  /// You cannot use the <code>MaxRecords</code> and <code>Marker</code>
  /// parameters together with the ARN parameter.
  /// </li>
  /// <li>
  /// The <code>MaxRecords</code> parameter can be a range from 10 to 50 results
  /// to return in a request.
  /// </li>
  /// </ul>
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all resources that match any combination of the specified
  /// keys and values. For example, if you have <code>owner</code> and
  /// <code>environment</code> for tag keys, and <code>admin</code> and
  /// <code>test</code> for tag values, all resources that have any combination
  /// of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, resources are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidTagFault].
  ///
  /// Parameter [marker] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the <code>marker</code> parameter and retrying the command. If
  /// the <code>marker</code> field is empty, all response records have been
  /// retrieved for the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number or response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned <code>marker</code>
  /// value.
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) for which you want to describe the tag or
  /// tags. For example,
  /// <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of resource with which you want to view tags. Valid resource
  /// types are:
  ///
  /// <ul>
  /// <li>
  /// Cluster
  /// </li>
  /// <li>
  /// CIDR/IP
  /// </li>
  /// <li>
  /// EC2 security group
  /// </li>
  /// <li>
  /// Snapshot
  /// </li>
  /// <li>
  /// Cluster security group
  /// </li>
  /// <li>
  /// Subnet group
  /// </li>
  /// <li>
  /// HSM connection
  /// </li>
  /// <li>
  /// HSM certificate
  /// </li>
  /// <li>
  /// Parameter group
  /// </li>
  /// <li>
  /// Snapshot copy grant
  /// </li>
  /// </ul>
  /// For more information about Amazon Redshift resource types and constructing
  /// ARNs, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions">Specifying
  /// Policy Elements: Actions, Effects, Resources, and Principals</a> in the
  /// Amazon Redshift Cluster Management Guide.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching resources that
  /// are associated with the specified key or keys. For example, suppose that
  /// you have resources tagged with keys called <code>owner</code> and
  /// <code>environment</code>. If you specify both of these tag keys in the
  /// request, Amazon Redshift returns a response with all resources that have
  /// either or both of these tag keys associated with them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching resources
  /// that are associated with the specified value or values. For example,
  /// suppose that you have resources tagged with values called
  /// <code>admin</code> and <code>test</code>. If you specify both of these tag
  /// values in the request, Amazon Redshift returns a response with all
  /// resources that have either or both of these tag values associated with
  /// them.
  Future<TaggedResourceListMessage> describeTags({
    String? marker,
    int? maxRecords,
    String? resourceName,
    String? resourceType,
    List<String>? tagKeys,
    List<String>? tagValues,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    resourceName?.also((arg) => $request['ResourceName'] = arg);
    resourceType?.also((arg) => $request['ResourceType'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTags',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTagsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeTagsResult',
    );
    return TaggedResourceListMessage.fromXml($result);
  }

  /// Shows usage limits on a cluster. Results are filtered based on the
  /// combination of input usage limit identifier, cluster identifier, and
  /// feature type parameters:
  ///
  /// <ul>
  /// <li>
  /// If usage limit identifier, cluster identifier, and feature type are not
  /// provided, then all usage limit objects for the current account in the
  /// current region are returned.
  /// </li>
  /// <li>
  /// If usage limit identifier is provided, then the corresponding usage limit
  /// object is returned.
  /// </li>
  /// <li>
  /// If cluster identifier is provided, then all usage limit objects for the
  /// specified cluster are returned.
  /// </li>
  /// <li>
  /// If cluster identifier and feature type are provided, then all usage limit
  /// objects for the combination of cluster and feature are returned.
  /// </li>
  /// </ul>
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster for which you want to describe usage limits.
  ///
  /// Parameter [featureType] :
  /// The feature type for which you want to describe usage limits.
  ///
  /// Parameter [marker] :
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeUsageLimits</a> request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// Parameter [tagKeys] :
  /// A tag key or keys for which you want to return all matching usage limit
  /// objects that are associated with the specified key or keys. For example,
  /// suppose that you have parameter groups that are tagged with keys called
  /// <code>owner</code> and <code>environment</code>. If you specify both of
  /// these tag keys in the request, Amazon Redshift returns a response with the
  /// usage limit objects have either or both of these tag keys associated with
  /// them.
  ///
  /// Parameter [tagValues] :
  /// A tag value or values for which you want to return all matching usage
  /// limit objects that are associated with the specified tag value or values.
  /// For example, suppose that you have parameter groups that are tagged with
  /// values called <code>admin</code> and <code>test</code>. If you specify
  /// both of these tag values in the request, Amazon Redshift returns a
  /// response with the usage limit objects that have either or both of these
  /// tag values associated with them.
  ///
  /// Parameter [usageLimitId] :
  /// The identifier of the usage limit to describe.
  Future<UsageLimitList> describeUsageLimits({
    String? clusterIdentifier,
    UsageLimitFeatureType? featureType,
    String? marker,
    int? maxRecords,
    List<String>? tagKeys,
    List<String>? tagValues,
    String? usageLimitId,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    featureType?.also((arg) => $request['FeatureType'] = arg.toValue());
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    tagKeys?.also((arg) => $request['TagKeys'] = arg);
    tagValues?.also((arg) => $request['TagValues'] = arg);
    usageLimitId?.also((arg) => $request['UsageLimitId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeUsageLimits',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeUsageLimitsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeUsageLimitsResult',
    );
    return UsageLimitList.fromXml($result);
  }

  /// Stops logging information, such as queries and connection attempts, for
  /// the specified Amazon Redshift cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster on which logging is to be stopped.
  ///
  /// Example: <code>examplecluster</code>
  Future<LoggingStatus> disableLogging({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DisableLogging',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisableLoggingMessage'],
      shapes: shapes,
      resultWrapper: 'DisableLoggingResult',
    );
    return LoggingStatus.fromXml($result);
  }

  /// Disables the automatic copying of snapshots from one region to another
  /// region for a specified cluster.
  ///
  /// If your cluster and its snapshots are encrypted using an encrypted
  /// symmetric key from Key Management Service, use
  /// <a>DeleteSnapshotCopyGrant</a> to delete the grant that grants Amazon
  /// Redshift permission to the key in the destination region.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [SnapshotCopyAlreadyDisabledFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the source cluster that you want to disable
  /// copying of snapshots to a destination region.
  ///
  /// Constraints: Must be the valid name of an existing cluster that has
  /// cross-region snapshot copy enabled.
  Future<DisableSnapshotCopyResult> disableSnapshotCopy({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DisableSnapshotCopy',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisableSnapshotCopyMessage'],
      shapes: shapes,
      resultWrapper: 'DisableSnapshotCopyResult',
    );
    return DisableSnapshotCopyResult.fromXml($result);
  }

  /// From a datashare consumer account, remove association for the specified
  /// datashare.
  ///
  /// May throw [InvalidDataShareFault].
  /// May throw [InvalidNamespaceFault].
  ///
  /// Parameter [dataShareArn] :
  /// The Amazon Resource Name (ARN) of the datashare to remove association for.
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) of the consumer namespace that association
  /// for the datashare is removed from.
  ///
  /// Parameter [consumerRegion] :
  /// From a datashare consumer account, removes association of a datashare from
  /// all the existing and future namespaces in the specified Amazon Web
  /// Services Region.
  ///
  /// Parameter [disassociateEntireAccount] :
  /// A value that specifies whether association for the datashare is removed
  /// from the entire account.
  Future<DataShare> disassociateDataShareConsumer({
    required String dataShareArn,
    String? consumerArn,
    String? consumerRegion,
    bool? disassociateEntireAccount,
  }) async {
    final $request = <String, dynamic>{};
    $request['DataShareArn'] = dataShareArn;
    consumerArn?.also((arg) => $request['ConsumerArn'] = arg);
    consumerRegion?.also((arg) => $request['ConsumerRegion'] = arg);
    disassociateEntireAccount
        ?.also((arg) => $request['DisassociateEntireAccount'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DisassociateDataShareConsumer',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisassociateDataShareConsumerMessage'],
      shapes: shapes,
      resultWrapper: 'DisassociateDataShareConsumerResult',
    );
    return DataShare.fromXml($result);
  }

  /// Starts logging information, such as queries and connection attempts, for
  /// the specified Amazon Redshift cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [BucketNotFoundFault].
  /// May throw [InsufficientS3BucketPolicyFault].
  /// May throw [InvalidS3KeyPrefixFault].
  /// May throw [InvalidS3BucketNameFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster on which logging is to be started.
  ///
  /// Example: <code>examplecluster</code>
  ///
  /// Parameter [bucketName] :
  /// The name of an existing S3 bucket where the log files are to be stored.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the same region as the cluster
  /// </li>
  /// <li>
  /// The cluster must have read bucket and put object permissions
  /// </li>
  /// </ul>
  ///
  /// Parameter [logDestinationType] :
  /// The log destination type. An enum with possible values of <code>s3</code>
  /// and <code>cloudwatch</code>.
  ///
  /// Parameter [logExports] :
  /// The collection of exported log types. Possible values are
  /// <code>connectionlog</code>, <code>useractivitylog</code>, and
  /// <code>userlog</code>.
  ///
  /// Parameter [s3KeyPrefix] :
  /// The prefix applied to the log file names.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot exceed 512 characters
  /// </li>
  /// <li>
  /// Cannot contain spaces( ), double quotes ("), single quotes ('), a
  /// backslash (\), or control characters. The hexadecimal codes for invalid
  /// characters are:
  ///
  /// <ul>
  /// <li>
  /// x00 to x20
  /// </li>
  /// <li>
  /// x22
  /// </li>
  /// <li>
  /// x27
  /// </li>
  /// <li>
  /// x5c
  /// </li>
  /// <li>
  /// x7f or larger
  /// </li>
  /// </ul> </li>
  /// </ul>
  Future<LoggingStatus> enableLogging({
    required String clusterIdentifier,
    String? bucketName,
    LogDestinationType? logDestinationType,
    List<String>? logExports,
    String? s3KeyPrefix,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    bucketName?.also((arg) => $request['BucketName'] = arg);
    logDestinationType
        ?.also((arg) => $request['LogDestinationType'] = arg.toValue());
    logExports?.also((arg) => $request['LogExports'] = arg);
    s3KeyPrefix?.also((arg) => $request['S3KeyPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'EnableLogging',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableLoggingMessage'],
      shapes: shapes,
      resultWrapper: 'EnableLoggingResult',
    );
    return LoggingStatus.fromXml($result);
  }

  /// Enables the automatic copy of snapshots from one region to another region
  /// for a specified cluster.
  ///
  /// May throw [IncompatibleOrderableOptions].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [CopyToRegionDisabledFault].
  /// May throw [SnapshotCopyAlreadyEnabledFault].
  /// May throw [UnknownSnapshotCopyRegionFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [SnapshotCopyGrantNotFoundFault].
  /// May throw [LimitExceededFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the source cluster to copy snapshots from.
  ///
  /// Constraints: Must be the valid name of an existing cluster that does not
  /// already have cross-region snapshot copy enabled.
  ///
  /// Parameter [destinationRegion] :
  /// The destination Amazon Web Services Region that you want to copy snapshots
  /// to.
  ///
  /// Constraints: Must be the name of a valid Amazon Web Services Region. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#redshift_region">Regions
  /// and Endpoints</a> in the Amazon Web Services General Reference.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The number of days to retain newly copied snapshots in the destination
  /// Amazon Web Services Region after they are copied from the source Amazon
  /// Web Services Region. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// Parameter [retentionPeriod] :
  /// The number of days to retain automated snapshots in the destination region
  /// after they are copied from the source region.
  ///
  /// Default: 7.
  ///
  /// Constraints: Must be at least 1 and no more than 35.
  ///
  /// Parameter [snapshotCopyGrantName] :
  /// The name of the snapshot copy grant to use when snapshots of an Amazon Web
  /// Services KMS-encrypted cluster are copied to the destination region.
  Future<EnableSnapshotCopyResult> enableSnapshotCopy({
    required String clusterIdentifier,
    required String destinationRegion,
    int? manualSnapshotRetentionPeriod,
    int? retentionPeriod,
    String? snapshotCopyGrantName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['DestinationRegion'] = destinationRegion;
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    retentionPeriod?.also((arg) => $request['RetentionPeriod'] = arg);
    snapshotCopyGrantName
        ?.also((arg) => $request['SnapshotCopyGrantName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'EnableSnapshotCopy',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableSnapshotCopyMessage'],
      shapes: shapes,
      resultWrapper: 'EnableSnapshotCopyResult',
    );
    return EnableSnapshotCopyResult.fromXml($result);
  }

  /// Fails over the primary compute unit of the specified Multi-AZ cluster to
  /// another Availability Zone.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster for which the primary compute unit
  /// will be failed over to another Availability Zone.
  Future<FailoverPrimaryComputeResult> failoverPrimaryCompute({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'FailoverPrimaryCompute',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['FailoverPrimaryComputeInputMessage'],
      shapes: shapes,
      resultWrapper: 'FailoverPrimaryComputeResult',
    );
    return FailoverPrimaryComputeResult.fromXml($result);
  }

  /// Returns a database user name and temporary password with temporary
  /// authorization to log on to an Amazon Redshift database. The action returns
  /// the database user name prefixed with <code>IAM:</code> if
  /// <code>AutoCreate</code> is <code>False</code> or <code>IAMA:</code> if
  /// <code>AutoCreate</code> is <code>True</code>. You can optionally specify
  /// one or more database user groups that the user will join at log on. By
  /// default, the temporary credentials expire in 900 seconds. You can
  /// optionally specify a duration between 900 seconds (15 minutes) and 3600
  /// seconds (60 minutes). For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html">Using
  /// IAM Authentication to Generate Database User Credentials</a> in the Amazon
  /// Redshift Cluster Management Guide.
  ///
  /// The Identity and Access Management (IAM) user or role that runs
  /// GetClusterCredentials must have an IAM policy attached that allows access
  /// to all necessary actions and resources. For more information about
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources">Resource
  /// Policies for GetClusterCredentials</a> in the Amazon Redshift Cluster
  /// Management Guide.
  ///
  /// If the <code>DbGroups</code> parameter is specified, the IAM policy must
  /// allow the <code>redshift:JoinGroup</code> action with access to the listed
  /// <code>dbgroups</code>.
  ///
  /// In addition, if the <code>AutoCreate</code> parameter is set to
  /// <code>True</code>, then the policy must include the
  /// <code>redshift:CreateClusterUser</code> permission.
  ///
  /// If the <code>DbName</code> parameter is specified, the IAM policy must
  /// allow access to the resource <code>dbname</code> for the specified
  /// database name.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [dbUser] :
  /// The name of a database user. If a user name matching <code>DbUser</code>
  /// exists in the database, the temporary user credentials have the same
  /// permissions as the existing user. If <code>DbUser</code> doesn't exist in
  /// the database and <code>Autocreate</code> is <code>True</code>, a new user
  /// is created using the value for <code>DbUser</code> with PUBLIC
  /// permissions. If a database user matching the value for <code>DbUser</code>
  /// doesn't exist and <code>Autocreate</code> is <code>False</code>, then the
  /// command succeeds but the connection attempt will fail because the user
  /// doesn't exist in the database.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html">CREATE
  /// USER</a> in the Amazon Redshift Database Developer Guide.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 64 alphanumeric characters or hyphens. The user name can't be
  /// <code>PUBLIC</code>.
  /// </li>
  /// <li>
  /// Must contain uppercase or lowercase letters, numbers, underscore, plus
  /// sign, period (dot), at symbol (@), or hyphen.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Must not contain a colon ( : ) or slash ( / ).
  /// </li>
  /// <li>
  /// Cannot be a reserved word. A list of reserved words can be found in <a
  /// href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [autoCreate] :
  /// Create a database user with the name specified for the user named in
  /// <code>DbUser</code> if one does not exist.
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster that contains the database for which
  /// you are requesting credentials. This parameter is case sensitive.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for the cluster credentials.
  ///
  /// Parameter [dbGroups] :
  /// A list of the names of existing database groups that the user named in
  /// <code>DbUser</code> will join for the current session, in addition to any
  /// group memberships for an existing user. If not specified, a new user is
  /// added only to PUBLIC.
  ///
  /// Database group name constraints
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 64 alphanumeric characters or hyphens
  /// </li>
  /// <li>
  /// Must contain only lowercase letters, numbers, underscore, plus sign,
  /// period (dot), at symbol (@), or hyphen.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Must not contain a colon ( : ) or slash ( / ).
  /// </li>
  /// <li>
  /// Cannot be a reserved word. A list of reserved words can be found in <a
  /// href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dbName] :
  /// The name of a database that <code>DbUser</code> is authorized to log on
  /// to. If <code>DbName</code> is not specified, <code>DbUser</code> can log
  /// on to any existing database.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 64 alphanumeric characters or hyphens
  /// </li>
  /// <li>
  /// Must contain uppercase or lowercase letters, numbers, underscore, plus
  /// sign, period (dot), at symbol (@), or hyphen.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Must not contain a colon ( : ) or slash ( / ).
  /// </li>
  /// <li>
  /// Cannot be a reserved word. A list of reserved words can be found in <a
  /// href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [durationSeconds] :
  /// The number of seconds until the returned temporary password expires.
  ///
  /// Constraint: minimum 900, maximum 3600.
  ///
  /// Default: 900
  Future<ClusterCredentials> getClusterCredentials({
    required String dbUser,
    bool? autoCreate,
    String? clusterIdentifier,
    String? customDomainName,
    List<String>? dbGroups,
    String? dbName,
    int? durationSeconds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DbUser'] = dbUser;
    autoCreate?.also((arg) => $request['AutoCreate'] = arg);
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    customDomainName?.also((arg) => $request['CustomDomainName'] = arg);
    dbGroups?.also((arg) => $request['DbGroups'] = arg);
    dbName?.also((arg) => $request['DbName'] = arg);
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetClusterCredentials',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetClusterCredentialsMessage'],
      shapes: shapes,
      resultWrapper: 'GetClusterCredentialsResult',
    );
    return ClusterCredentials.fromXml($result);
  }

  /// Returns a database user name and temporary password with temporary
  /// authorization to log in to an Amazon Redshift database. The database user
  /// is mapped 1:1 to the source Identity and Access Management (IAM) identity.
  /// For more information about IAM identities, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html">IAM
  /// Identities (users, user groups, and roles)</a> in the Amazon Web Services
  /// Identity and Access Management User Guide.
  ///
  /// The Identity and Access Management (IAM) identity that runs this operation
  /// must have an IAM policy attached that allows access to all necessary
  /// actions and resources. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using
  /// identity-based policies (IAM policies)</a> in the Amazon Redshift Cluster
  /// Management Guide.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster that contains the database for which
  /// you are requesting credentials.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for the IAM message cluster credentials.
  ///
  /// Parameter [dbName] :
  /// The name of the database for which you are requesting credentials. If the
  /// database name is specified, the IAM policy must allow access to the
  /// resource <code>dbname</code> for the specified database name. If the
  /// database name is not specified, access to all databases is allowed.
  ///
  /// Parameter [durationSeconds] :
  /// The number of seconds until the returned temporary password expires.
  ///
  /// Range: 900-3600. Default: 900.
  Future<ClusterExtendedCredentials> getClusterCredentialsWithIAM({
    String? clusterIdentifier,
    String? customDomainName,
    String? dbName,
    int? durationSeconds,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    customDomainName?.also((arg) => $request['CustomDomainName'] = arg);
    dbName?.also((arg) => $request['DbName'] = arg);
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetClusterCredentialsWithIAM',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetClusterCredentialsWithIAMMessage'],
      shapes: shapes,
      resultWrapper: 'GetClusterCredentialsWithIAMResult',
    );
    return ClusterExtendedCredentials.fromXml($result);
  }

  /// Gets the configuration options for the reserved-node exchange. These
  /// options include information about the source reserved node and target
  /// reserved node offering. Details include the node type, the price, the node
  /// count, and the offering type.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [InvalidReservedNodeStateFault].
  /// May throw [ReservedNodeAlreadyMigratedFault].
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  ///
  /// Parameter [actionType] :
  /// The action type of the reserved-node configuration. The action type can be
  /// an exchange initiated from either a snapshot or a resize.
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier for the cluster that is the source for a reserved-node
  /// exchange.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>GetReservedNodeExchangeConfigurationOptions</code> request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by the <code>MaxRecords</code>
  /// parameter. You can retrieve the next set of response records by providing
  /// the returned marker value in the <code>Marker</code> parameter and
  /// retrying the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified
  /// <code>MaxRecords</code> value, a value is returned in a
  /// <code>Marker</code> field of the response. You can retrieve the next set
  /// of records by retrying the command with the returned marker value.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier for the snapshot that is the source for the reserved-node
  /// exchange.
  Future<GetReservedNodeExchangeConfigurationOptionsOutputMessage>
      getReservedNodeExchangeConfigurationOptions({
    required ReservedNodeExchangeActionType actionType,
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
    String? snapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ActionType'] = actionType.toValue();
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetReservedNodeExchangeConfigurationOptions',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetReservedNodeExchangeConfigurationOptionsInputMessage'],
      shapes: shapes,
      resultWrapper: 'GetReservedNodeExchangeConfigurationOptionsResult',
    );
    return GetReservedNodeExchangeConfigurationOptionsOutputMessage.fromXml(
        $result);
  }

  /// Returns an array of DC2 ReservedNodeOfferings that matches the payment
  /// type, term, and usage price of the given DC1 reserved node.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [InvalidReservedNodeStateFault].
  /// May throw [ReservedNodeAlreadyMigratedFault].
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceUnavailableFault].
  ///
  /// Parameter [reservedNodeId] :
  /// A string representing the node identifier for the DC1 Reserved Node to be
  /// exchanged.
  ///
  /// Parameter [marker] :
  /// A value that indicates the starting point for the next set of
  /// ReservedNodeOfferings.
  ///
  /// Parameter [maxRecords] :
  /// An integer setting the maximum number of ReservedNodeOfferings to
  /// retrieve.
  Future<GetReservedNodeExchangeOfferingsOutputMessage>
      getReservedNodeExchangeOfferings({
    required String reservedNodeId,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReservedNodeId'] = reservedNodeId;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetReservedNodeExchangeOfferings',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetReservedNodeExchangeOfferingsInputMessage'],
      shapes: shapes,
      resultWrapper: 'GetReservedNodeExchangeOfferingsResult',
    );
    return GetReservedNodeExchangeOfferingsOutputMessage.fromXml($result);
  }

  /// Get the resource policy for a specified resource.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidPolicyFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource of which its resource
  /// policy is fetched.
  Future<GetResourcePolicyResult> getResourcePolicy({
    required String resourceArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetResourcePolicy',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetResourcePolicyMessage'],
      shapes: shapes,
      resultWrapper: 'GetResourcePolicyResult',
    );
    return GetResourcePolicyResult.fromXml($result);
  }

  /// List the Amazon Redshift Advisor recommendations for one or multiple
  /// Amazon Redshift clusters in an Amazon Web Services account.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the Amazon Redshift cluster for which the list of
  /// Advisor recommendations is returned. If the neither the cluster identifier
  /// and the cluster namespace ARN parameters are specified, then
  /// recommendations for all clusters in the account are returned.
  ///
  /// Parameter [marker] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the Marker parameter and retrying the command. If the Marker
  /// field is empty, all response records have been retrieved for the request.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of response records to return in each call. If the
  /// number of remaining response records exceeds the specified MaxRecords
  /// value, a value is returned in a marker field of the response. You can
  /// retrieve the next set of records by retrying the command with the returned
  /// marker value.
  ///
  /// Parameter [namespaceArn] :
  /// The Amazon Redshift cluster namespace Amazon Resource Name (ARN) for which
  /// the list of Advisor recommendations is returned. If the neither the
  /// cluster identifier and the cluster namespace ARN parameters are specified,
  /// then recommendations for all clusters in the account are returned.
  Future<ListRecommendationsResult> listRecommendations({
    String? clusterIdentifier,
    String? marker,
    int? maxRecords,
    String? namespaceArn,
  }) async {
    final $request = <String, dynamic>{};
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    namespaceArn?.also((arg) => $request['NamespaceArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListRecommendations',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListRecommendationsMessage'],
      shapes: shapes,
      resultWrapper: 'ListRecommendationsResult',
    );
    return ListRecommendationsResult.fromXml($result);
  }

  /// This operation is retired. Calling this operation does not change AQUA
  /// configuration. Amazon Redshift automatically determines whether to use
  /// AQUA (Advanced Query Accelerator).
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to be modified.
  ///
  /// Parameter [aquaConfigurationStatus] :
  /// This parameter is retired. Amazon Redshift automatically determines
  /// whether to use AQUA (Advanced Query Accelerator).
  Future<ModifyAquaOutputMessage> modifyAquaConfiguration({
    required String clusterIdentifier,
    AquaConfigurationStatus? aquaConfigurationStatus,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    aquaConfigurationStatus
        ?.also((arg) => $request['AquaConfigurationStatus'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ModifyAquaConfiguration',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyAquaInputMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyAquaConfigurationResult',
    );
    return ModifyAquaOutputMessage.fromXml($result);
  }

  /// Modifies an authentication profile.
  ///
  /// May throw [AuthenticationProfileNotFoundFault].
  /// May throw [AuthenticationProfileQuotaExceededFault].
  /// May throw [InvalidAuthenticationProfileRequestFault].
  ///
  /// Parameter [authenticationProfileContent] :
  /// The new content of the authentication profile in JSON format. The maximum
  /// length of the JSON string is determined by a quota for your account.
  ///
  /// Parameter [authenticationProfileName] :
  /// The name of the authentication profile to replace.
  Future<ModifyAuthenticationProfileResult> modifyAuthenticationProfile({
    required String authenticationProfileContent,
    required String authenticationProfileName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AuthenticationProfileContent'] = authenticationProfileContent;
    $request['AuthenticationProfileName'] = authenticationProfileName;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyAuthenticationProfile',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyAuthenticationProfileMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyAuthenticationProfileResult',
    );
    return ModifyAuthenticationProfileResult.fromXml($result);
  }

  /// Modifies the settings for a cluster.
  ///
  /// You can also change node type and the number of nodes to scale up or down
  /// the cluster. When resizing a cluster, you must specify both the number of
  /// nodes and the node type even if one of the parameters does not change.
  ///
  /// You can add another security or parameter group, or change the admin user
  /// password. Resetting a cluster password or modifying the security groups
  /// associated with a cluster do not need a reboot. However, modifying a
  /// parameter group requires a reboot for parameters to take effect. For more
  /// information about managing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [InvalidClusterStateFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [NumberOfNodesQuotaExceededFault].
  /// May throw [NumberOfNodesPerClusterLimitExceededFault].
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [ClusterParameterGroupNotFoundFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [UnsupportedOptionFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [HsmClientCertificateNotFoundFault].
  /// May throw [HsmConfigurationNotFoundFault].
  /// May throw [ClusterAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [InvalidElasticIpFault].
  /// May throw [TableLimitExceededFault].
  /// May throw [InvalidClusterTrackFault].
  /// May throw [InvalidRetentionPeriodFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [CustomCnameAssociationFault].
  /// May throw [Ipv6CidrBlockNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster to be modified.
  ///
  /// Example: <code>examplecluster</code>
  ///
  /// Parameter [allowVersionUpgrade] :
  /// If <code>true</code>, major version upgrades will be applied automatically
  /// to the cluster during the maintenance window.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [automatedSnapshotRetentionPeriod] :
  /// The number of days that automated snapshots are retained. If the value is
  /// 0, automated snapshots are disabled. Even if automated snapshots are
  /// disabled, you can still create manual snapshots when you want with
  /// <a>CreateClusterSnapshot</a>.
  ///
  /// If you decrease the automated snapshot retention period from its current
  /// value, existing automated snapshots that fall outside of the new retention
  /// period will be immediately deleted.
  ///
  /// You can't disable automated snapshots for RA3 node types. Set the
  /// automated retention period from 1-35 days.
  ///
  /// Default: Uses existing setting.
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// Parameter [availabilityZone] :
  /// The option to initiate relocation for an Amazon Redshift cluster to the
  /// target Availability Zone.
  ///
  /// Parameter [availabilityZoneRelocation] :
  /// The option to enable relocation for an Amazon Redshift cluster between
  /// Availability Zones after the cluster modification is complete.
  ///
  /// Parameter [clusterParameterGroupName] :
  /// The name of the cluster parameter group to apply to this cluster. This
  /// change is applied only after the cluster is rebooted. To reboot a cluster
  /// use <a>RebootCluster</a>.
  ///
  /// Default: Uses existing setting.
  ///
  /// Constraints: The cluster parameter group must be in the same parameter
  /// group family that matches the cluster version.
  ///
  /// Parameter [clusterSecurityGroups] :
  /// A list of cluster security groups to be authorized on this cluster. This
  /// change is asynchronously applied as soon as possible.
  ///
  /// Security groups currently associated with the cluster, and not in the list
  /// of groups to apply, will be revoked from the cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterType] :
  /// The new cluster type.
  ///
  /// When you submit your cluster resize request, your existing cluster goes
  /// into a read-only mode. After Amazon Redshift provisions a new cluster
  /// based on your resize requirements, there will be outage for a period while
  /// the old cluster is deleted and your connection is switched to the new
  /// cluster. You can use <a>DescribeResize</a> to track the progress of the
  /// resize request.
  ///
  /// Valid Values: <code> multi-node | single-node </code>
  ///
  /// Parameter [clusterVersion] :
  /// The new version number of the Amazon Redshift engine to upgrade to.
  ///
  /// For major version upgrades, if a non-default cluster parameter group is
  /// currently in use, a new cluster parameter group in the cluster parameter
  /// group family for the new version must be specified. The new cluster
  /// parameter group can be the default for that cluster parameter group
  /// family. For more information about parameters and parameter groups, go to
  /// <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Example: <code>1.0</code>
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP (EIP) address for the cluster.
  ///
  /// Constraints: The cluster must be provisioned in EC2-VPC and
  /// publicly-accessible through an Internet gateway. For more information
  /// about provisioning clusters in EC2-VPC, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms">Supported
  /// Platforms to Launch Your Cluster</a> in the Amazon Redshift Cluster
  /// Management Guide.
  ///
  /// Parameter [encrypted] :
  /// Indicates whether the cluster is encrypted. If the value is encrypted
  /// (true) and you provide a value for the <code>KmsKeyId</code> parameter, we
  /// encrypt the cluster with the provided <code>KmsKeyId</code>. If you don't
  /// provide a <code>KmsKeyId</code>, we encrypt with the default key.
  ///
  /// If the value is not encrypted (false), then the cluster is decrypted.
  ///
  /// Parameter [enhancedVpcRouting] :
  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// Specifies the name of the HSM client certificate the Amazon Redshift
  /// cluster uses to retrieve the data encryption keys stored in an HSM.
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// Specifies the name of the HSM configuration that contains the information
  /// the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address types that the cluster supports. Possible values are
  /// <code>ipv4</code> and <code>dualstack</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key Management Service (KMS) key ID of the encryption key that you
  /// want to use to encrypt data in the cluster.
  ///
  /// Parameter [maintenanceTrackName] :
  /// The name for the maintenance track that you want to assign for the
  /// cluster. This name change is asynchronous. The new track name stays in the
  /// <code>PendingModifiedValues</code> for the cluster until the next
  /// maintenance window. When the maintenance track changes, the cluster is
  /// switched to the latest cluster release available for the maintenance
  /// track. At this point, the maintenance track name is applied.
  ///
  /// Parameter [manageMasterPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage this
  /// cluster's admin credentials. You can't use <code>MasterUserPassword</code>
  /// if <code>ManageMasterPassword</code> is true. If
  /// <code>ManageMasterPassword</code> is false or not set, Amazon Redshift
  /// uses <code>MasterUserPassword</code> for the admin user account's
  /// password.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The default for number of days that a newly created manual snapshot is
  /// retained. If the value is -1, the manual snapshot is retained
  /// indefinitely. This value doesn't retroactively change the retention
  /// periods of existing manual snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// Parameter [masterPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the cluster's admin credentials secret. You can only use this parameter if
  /// <code>ManageMasterPassword</code> is true.
  ///
  /// Parameter [masterUserPassword] :
  /// The new password for the cluster admin user. This change is asynchronously
  /// applied as soon as possible. Between the time of the request and the
  /// completion of the request, the <code>MasterUserPassword</code> element
  /// exists in the <code>PendingModifiedValues</code> element of the operation
  /// response.
  ///
  /// You can't use <code>MasterUserPassword</code> if
  /// <code>ManageMasterPassword</code> is <code>true</code>.
  /// <note>
  /// Operations never return the password, so this operation provides a way to
  /// regain access to the admin user account for a cluster if the password is
  /// lost.
  /// </note>
  /// Default: Uses existing setting.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be between 8 and 64 characters in length.
  /// </li>
  /// <li>
  /// Must contain at least one uppercase letter.
  /// </li>
  /// <li>
  /// Must contain at least one lowercase letter.
  /// </li>
  /// <li>
  /// Must contain one number.
  /// </li>
  /// <li>
  /// Can be any printable ASCII character (ASCII code 33-126) except
  /// <code>'</code> (single quote), <code>"</code> (double quote),
  /// <code>\</code>, <code>/</code>, or <code>@</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiAZ] :
  /// If true and the cluster is currently only deployed in a single
  /// Availability Zone, the cluster will be modified to be deployed in two
  /// Availability Zones.
  ///
  /// Parameter [newClusterIdentifier] :
  /// The new identifier for the cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Alphabetic characters must be lowercase.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique for all clusters within an Amazon Web Services account.
  /// </li>
  /// </ul>
  /// Example: <code>examplecluster</code>
  ///
  /// Parameter [nodeType] :
  /// The new node type of the cluster. If you specify a new node type, you must
  /// also specify the number of nodes parameter.
  ///
  /// For more information about resizing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html">Resizing
  /// Clusters in Amazon Redshift</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// Valid Values: <code>ds2.xlarge</code> | <code>ds2.8xlarge</code> |
  /// <code>dc1.large</code> | <code>dc1.8xlarge</code> | <code>dc2.large</code>
  /// | <code>dc2.8xlarge</code> | <code>ra3.xlplus</code> |
  /// <code>ra3.4xlarge</code> | <code>ra3.16xlarge</code>
  ///
  /// Parameter [numberOfNodes] :
  /// The new number of nodes of the cluster. If you specify a new number of
  /// nodes, you must also specify the node type parameter.
  ///
  /// For more information about resizing clusters, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html">Resizing
  /// Clusters in Amazon Redshift</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// Valid Values: Integer greater than <code>0</code>.
  ///
  /// Parameter [port] :
  /// The option to change the port of an Amazon Redshift cluster.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// For clusters with ra3 nodes - Select a port within the ranges
  /// <code>5431-5455</code> or <code>8191-8215</code>. (If you have an existing
  /// cluster with ra3 nodes, it isn't required that you change the port to
  /// these ranges.)
  /// </li>
  /// <li>
  /// For clusters with ds2 or dc2 nodes - Select a port within the range
  /// <code>1150-65535</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which system maintenance can occur,
  /// if necessary. If system maintenance is necessary during the window, it may
  /// result in an outage.
  ///
  /// This maintenance window change is made immediately. If the new maintenance
  /// window indicates the current time, there must be at least 120 minutes
  /// between the current time and end of the window in order to ensure that
  /// pending changes are applied.
  ///
  /// Default: Uses existing setting.
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi, for example
  /// <code>wed:07:30-wed:08:00</code>.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes.
  ///
  /// Parameter [publiclyAccessible] :
  /// If <code>true</code>, the cluster can be accessed from a public network.
  /// Only clusters in VPCs can be set to be publicly available.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of virtual private cloud (VPC) security groups to be associated
  /// with the cluster. This change is asynchronously applied as soon as
  /// possible.
  Future<ModifyClusterResult> modifyCluster({
    required String clusterIdentifier,
    bool? allowVersionUpgrade,
    int? automatedSnapshotRetentionPeriod,
    String? availabilityZone,
    bool? availabilityZoneRelocation,
    String? clusterParameterGroupName,
    List<String>? clusterSecurityGroups,
    String? clusterType,
    String? clusterVersion,
    String? elasticIp,
    bool? encrypted,
    bool? enhancedVpcRouting,
    String? hsmClientCertificateIdentifier,
    String? hsmConfigurationIdentifier,
    String? ipAddressType,
    String? kmsKeyId,
    String? maintenanceTrackName,
    bool? manageMasterPassword,
    int? manualSnapshotRetentionPeriod,
    String? masterPasswordSecretKmsKeyId,
    String? masterUserPassword,
    bool? multiAZ,
    String? newClusterIdentifier,
    String? nodeType,
    int? numberOfNodes,
    int? port,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    allowVersionUpgrade?.also((arg) => $request['AllowVersionUpgrade'] = arg);
    automatedSnapshotRetentionPeriod
        ?.also((arg) => $request['AutomatedSnapshotRetentionPeriod'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    availabilityZoneRelocation
        ?.also((arg) => $request['AvailabilityZoneRelocation'] = arg);
    clusterParameterGroupName
        ?.also((arg) => $request['ClusterParameterGroupName'] = arg);
    clusterSecurityGroups
        ?.also((arg) => $request['ClusterSecurityGroups'] = arg);
    clusterType?.also((arg) => $request['ClusterType'] = arg);
    clusterVersion?.also((arg) => $request['ClusterVersion'] = arg);
    elasticIp?.also((arg) => $request['ElasticIp'] = arg);
    encrypted?.also((arg) => $request['Encrypted'] = arg);
    enhancedVpcRouting?.also((arg) => $request['EnhancedVpcRouting'] = arg);
    hsmClientCertificateIdentifier
        ?.also((arg) => $request['HsmClientCertificateIdentifier'] = arg);
    hsmConfigurationIdentifier
        ?.also((arg) => $request['HsmConfigurationIdentifier'] = arg);
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    maintenanceTrackName?.also((arg) => $request['MaintenanceTrackName'] = arg);
    manageMasterPassword?.also((arg) => $request['ManageMasterPassword'] = arg);
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    masterPasswordSecretKmsKeyId
        ?.also((arg) => $request['MasterPasswordSecretKmsKeyId'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    newClusterIdentifier?.also((arg) => $request['NewClusterIdentifier'] = arg);
    nodeType?.also((arg) => $request['NodeType'] = arg);
    numberOfNodes?.also((arg) => $request['NumberOfNodes'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterResult',
    );
    return ModifyClusterResult.fromXml($result);
  }

  /// Modifies the database revision of a cluster. The database revision is a
  /// unique revision of the database running in a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ClusterOnLatestRevisionFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of a cluster whose database revision you want to
  /// modify.
  ///
  /// Example: <code>examplecluster</code>
  ///
  /// Parameter [revisionTarget] :
  /// The identifier of the database revision. You can retrieve this value from
  /// the response to the <a>DescribeClusterDbRevisions</a> request.
  Future<ModifyClusterDbRevisionResult> modifyClusterDbRevision({
    required String clusterIdentifier,
    required String revisionTarget,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['RevisionTarget'] = revisionTarget;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterDbRevision',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterDbRevisionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterDbRevisionResult',
    );
    return ModifyClusterDbRevisionResult.fromXml($result);
  }

  /// Modifies the list of Identity and Access Management (IAM) roles that can
  /// be used by the cluster to access other Amazon Web Services services.
  ///
  /// The maximum number of IAM roles that you can associate is subject to a
  /// quota. For more information, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html">Quotas
  /// and limits</a> in the <i>Amazon Redshift Cluster Management Guide</i>.
  ///
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster for which you want to associate or
  /// disassociate IAM roles.
  ///
  /// Parameter [addIamRoles] :
  /// Zero or more IAM roles to associate with the cluster. The roles must be in
  /// their Amazon Resource Name (ARN) format.
  ///
  /// Parameter [defaultIamRoleArn] :
  /// The Amazon Resource Name (ARN) for the IAM role that was set as default
  /// for the cluster when the cluster was last modified.
  ///
  /// Parameter [removeIamRoles] :
  /// Zero or more IAM roles in ARN format to disassociate from the cluster.
  Future<ModifyClusterIamRolesResult> modifyClusterIamRoles({
    required String clusterIdentifier,
    List<String>? addIamRoles,
    String? defaultIamRoleArn,
    List<String>? removeIamRoles,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    addIamRoles?.also((arg) => $request['AddIamRoles'] = arg);
    defaultIamRoleArn?.also((arg) => $request['DefaultIamRoleArn'] = arg);
    removeIamRoles?.also((arg) => $request['RemoveIamRoles'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterIamRoles',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterIamRolesMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterIamRolesResult',
    );
    return ModifyClusterIamRolesResult.fromXml($result);
  }

  /// Modifies the maintenance settings of a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// A unique identifier for the cluster.
  ///
  /// Parameter [deferMaintenance] :
  /// A boolean indicating whether to enable the deferred maintenance window.
  ///
  /// Parameter [deferMaintenanceDuration] :
  /// An integer indicating the duration of the maintenance window in days. If
  /// you specify a duration, you can't specify an end time. The duration must
  /// be 45 days or less.
  ///
  /// Parameter [deferMaintenanceEndTime] :
  /// A timestamp indicating end time for the deferred maintenance window. If
  /// you specify an end time, you can't specify a duration.
  ///
  /// Parameter [deferMaintenanceIdentifier] :
  /// A unique identifier for the deferred maintenance window.
  ///
  /// Parameter [deferMaintenanceStartTime] :
  /// A timestamp indicating the start time for the deferred maintenance window.
  Future<ModifyClusterMaintenanceResult> modifyClusterMaintenance({
    required String clusterIdentifier,
    bool? deferMaintenance,
    int? deferMaintenanceDuration,
    DateTime? deferMaintenanceEndTime,
    String? deferMaintenanceIdentifier,
    DateTime? deferMaintenanceStartTime,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    deferMaintenance?.also((arg) => $request['DeferMaintenance'] = arg);
    deferMaintenanceDuration
        ?.also((arg) => $request['DeferMaintenanceDuration'] = arg);
    deferMaintenanceEndTime?.also(
        (arg) => $request['DeferMaintenanceEndTime'] = _s.iso8601ToJson(arg));
    deferMaintenanceIdentifier
        ?.also((arg) => $request['DeferMaintenanceIdentifier'] = arg);
    deferMaintenanceStartTime?.also(
        (arg) => $request['DeferMaintenanceStartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterMaintenance',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterMaintenanceMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterMaintenanceResult',
    );
    return ModifyClusterMaintenanceResult.fromXml($result);
  }

  /// Modifies the parameters of a parameter group. For the parameters
  /// parameter, it can't contain ASCII characters.
  ///
  /// For more information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [ClusterParameterGroupNotFoundFault].
  /// May throw [InvalidClusterParameterGroupStateFault].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to be modified.
  ///
  /// Parameter [parameters] :
  /// An array of parameters to be modified. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  /// For each parameter to be modified, you must supply at least the parameter
  /// name and parameter value; other name-value pairs of the parameter are
  /// optional.
  ///
  /// For the workload management (WLM) configuration, you must supply all the
  /// name-value pairs in the wlm_json_configuration parameter.
  Future<ClusterParameterGroupNameMessage> modifyClusterParameterGroup({
    required String parameterGroupName,
    required List<Parameter> parameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['ParameterGroupName'] = parameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterParameterGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterParameterGroupResult',
    );
    return ClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Modifies the settings for a snapshot.
  ///
  /// This exanmple modifies the manual retention period setting for a cluster
  /// snapshot.
  ///
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier of the snapshot whose setting you want to modify.
  ///
  /// Parameter [force] :
  /// A Boolean option to override an exception if the retention period has
  /// already passed.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// If the manual snapshot falls outside of the new retention period, you can
  /// specify the force option to immediately delete the snapshot.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  Future<ModifyClusterSnapshotResult> modifyClusterSnapshot({
    required String snapshotIdentifier,
    bool? force,
    int? manualSnapshotRetentionPeriod,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    force?.also((arg) => $request['Force'] = arg);
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterSnapshotResult',
    );
    return ModifyClusterSnapshotResult.fromXml($result);
  }

  /// Modifies a snapshot schedule for a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [SnapshotScheduleNotFoundFault].
  /// May throw [InvalidClusterSnapshotScheduleStateFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// A unique identifier for the cluster whose snapshot schedule you want to
  /// modify.
  ///
  /// Parameter [disassociateSchedule] :
  /// A boolean to indicate whether to remove the assoiciation between the
  /// cluster and the schedule.
  ///
  /// Parameter [scheduleIdentifier] :
  /// A unique alphanumeric identifier for the schedule that you want to
  /// associate with the cluster.
  Future<void> modifyClusterSnapshotSchedule({
    required String clusterIdentifier,
    bool? disassociateSchedule,
    String? scheduleIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    disassociateSchedule?.also((arg) => $request['DisassociateSchedule'] = arg);
    scheduleIdentifier?.also((arg) => $request['ScheduleIdentifier'] = arg);
    await _protocol.send(
      $request,
      action: 'ModifyClusterSnapshotSchedule',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterSnapshotScheduleMessage'],
      shapes: shapes,
    );
  }

  /// Modifies a cluster subnet group to include the specified list of VPC
  /// subnets. The operation replaces the existing list of subnets with the new
  /// list of subnets.
  ///
  /// May throw [ClusterSubnetGroupNotFoundFault].
  /// May throw [ClusterSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [InvalidSubnet].
  /// May throw [UnauthorizedOperation].
  /// May throw [DependentServiceRequestThrottlingFault].
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name of the subnet group to be modified.
  ///
  /// Parameter [subnetIds] :
  /// An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a
  /// single request.
  ///
  /// Parameter [description] :
  /// A text description of the subnet group to be modified.
  Future<ModifyClusterSubnetGroupResult> modifyClusterSubnetGroup({
    required String clusterSubnetGroupName,
    required List<String> subnetIds,
    String? description,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSubnetGroupName'] = clusterSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyClusterSubnetGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyClusterSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyClusterSubnetGroupResult',
    );
    return ModifyClusterSubnetGroupResult.fromXml($result);
  }

  /// Contains information for changing a custom domain association.
  ///
  /// May throw [UnsupportedOperationFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [CustomCnameAssociationFault].
  /// May throw [CustomDomainAssociationNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to change a custom domain association for.
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The certificate Amazon Resource Name (ARN) for the changed custom domain
  /// association.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name for a changed custom domain association.
  Future<ModifyCustomDomainAssociationResult> modifyCustomDomainAssociation({
    required String clusterIdentifier,
    required String customDomainCertificateArn,
    required String customDomainName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['CustomDomainCertificateArn'] = customDomainCertificateArn;
    $request['CustomDomainName'] = customDomainName;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCustomDomainAssociation',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCustomDomainAssociationMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCustomDomainAssociationResult',
    );
    return ModifyCustomDomainAssociationResult.fromXml($result);
  }

  /// Modifies a Redshift-managed VPC endpoint.
  ///
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidEndpointStateFault].
  /// May throw [EndpointNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnauthorizedOperation].
  ///
  /// Parameter [endpointName] :
  /// The endpoint to be modified.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// The complete list of VPC security groups associated with the endpoint
  /// after the endpoint is modified.
  Future<EndpointAccess> modifyEndpointAccess({
    required String endpointName,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['EndpointName'] = endpointName;
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyEndpointAccessResult',
    );
    return EndpointAccess.fromXml($result);
  }

  /// Modifies an existing Amazon Redshift event notification subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionEventIdNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SubscriptionSeverityNotFoundFault].
  /// May throw [SourceNotFoundFault].
  /// May throw [InvalidSubscriptionStateFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the modified Amazon Redshift event notification subscription.
  ///
  /// Parameter [enabled] :
  /// A Boolean value indicating if the subscription is enabled.
  /// <code>true</code> indicates the subscription is enabled
  ///
  /// Parameter [eventCategories] :
  /// Specifies the Amazon Redshift event categories to be published by the
  /// event notification subscription.
  ///
  /// Values: configuration, management, monitoring, security, pending
  ///
  /// Parameter [severity] :
  /// Specifies the Amazon Redshift event severity to be published by the event
  /// notification subscription.
  ///
  /// Values: ERROR, INFO
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic to be used by the event
  /// notification subscription.
  ///
  /// Parameter [sourceIds] :
  /// A list of one or more identifiers of Amazon Redshift source objects. All
  /// of the objects must be of the same type as was specified in the source
  /// type parameter. The event subscription will return only events generated
  /// by the specified objects. If not specified, then events are returned for
  /// all objects within the source type specified.
  ///
  /// Example: my-cluster-1, my-cluster-2
  ///
  /// Example: my-snapshot-20131010
  ///
  /// Parameter [sourceType] :
  /// The type of source that will be generating the events. For example, if you
  /// want to be notified of events generated by a cluster, you would set this
  /// parameter to cluster. If this value is not specified, events are returned
  /// for all Amazon Redshift objects in your Amazon Web Services account. You
  /// must specify a source type in order to specify source IDs.
  ///
  /// Valid values: cluster, cluster-parameter-group, cluster-security-group,
  /// cluster-snapshot, and scheduled-action.
  Future<ModifyEventSubscriptionResult> modifyEventSubscription({
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? severity,
    String? snsTopicArn,
    List<String>? sourceIds,
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    severity?.also((arg) => $request['Severity'] = arg);
    snsTopicArn?.also((arg) => $request['SnsTopicArn'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEventSubscription',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyEventSubscriptionResult',
    );
    return ModifyEventSubscriptionResult.fromXml($result);
  }

  /// Changes an existing Amazon Redshift IAM Identity Center application.
  ///
  /// May throw [RedshiftIdcApplicationNotExistsFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [DependentServiceAccessDeniedFault].
  ///
  /// Parameter [redshiftIdcApplicationArn] :
  /// The ARN for the Redshift application that integrates with IAM Identity
  /// Center.
  ///
  /// Parameter [authorizedTokenIssuerList] :
  /// The authorized token issuer list for the Amazon Redshift IAM Identity
  /// Center application to change.
  ///
  /// Parameter [iamRoleArn] :
  /// The IAM role ARN associated with the Amazon Redshift IAM Identity Center
  /// application to change. It has the required permissions to be assumed and
  /// invoke the IDC Identity Center API.
  ///
  /// Parameter [idcDisplayName] :
  /// The display name for the Amazon Redshift IAM Identity Center application
  /// to change. It appears on the console.
  ///
  /// Parameter [identityNamespace] :
  /// The namespace for the Amazon Redshift IAM Identity Center application to
  /// change. It determines which managed application verifies the connection
  /// token.
  ///
  /// Parameter [serviceIntegrations] :
  /// A collection of service integrations associated with the application.
  Future<ModifyRedshiftIdcApplicationResult> modifyRedshiftIdcApplication({
    required String redshiftIdcApplicationArn,
    List<AuthorizedTokenIssuer>? authorizedTokenIssuerList,
    String? iamRoleArn,
    String? idcDisplayName,
    String? identityNamespace,
    List<ServiceIntegrationsUnion>? serviceIntegrations,
  }) async {
    final $request = <String, dynamic>{};
    $request['RedshiftIdcApplicationArn'] = redshiftIdcApplicationArn;
    authorizedTokenIssuerList
        ?.also((arg) => $request['AuthorizedTokenIssuerList'] = arg);
    iamRoleArn?.also((arg) => $request['IamRoleArn'] = arg);
    idcDisplayName?.also((arg) => $request['IdcDisplayName'] = arg);
    identityNamespace?.also((arg) => $request['IdentityNamespace'] = arg);
    serviceIntegrations?.also((arg) => $request['ServiceIntegrations'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyRedshiftIdcApplication',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyRedshiftIdcApplicationMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyRedshiftIdcApplicationResult',
    );
    return ModifyRedshiftIdcApplicationResult.fromXml($result);
  }

  /// Modifies a scheduled action.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ScheduledActionNotFoundFault].
  /// May throw [ScheduledActionTypeUnsupportedFault].
  /// May throw [InvalidScheduleFault].
  /// May throw [InvalidScheduledActionFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action to modify.
  ///
  /// Parameter [enable] :
  /// A modified enable flag of the scheduled action. If true, the scheduled
  /// action is active. If false, the scheduled action is disabled.
  ///
  /// Parameter [endTime] :
  /// A modified end time of the scheduled action. For more information about
  /// this parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [iamRole] :
  /// A different IAM role to assume to run the target action. For more
  /// information about this parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [schedule] :
  /// A modified schedule in either <code>at( )</code> or <code>cron( )</code>
  /// format. For more information about this parameter, see
  /// <a>ScheduledAction</a>.
  ///
  /// Parameter [scheduledActionDescription] :
  /// A modified description of the scheduled action.
  ///
  /// Parameter [startTime] :
  /// A modified start time of the scheduled action. For more information about
  /// this parameter, see <a>ScheduledAction</a>.
  ///
  /// Parameter [targetAction] :
  /// A modified JSON format of the scheduled action. For more information about
  /// this parameter, see <a>ScheduledAction</a>.
  Future<ScheduledAction> modifyScheduledAction({
    required String scheduledActionName,
    bool? enable,
    DateTime? endTime,
    String? iamRole,
    String? schedule,
    String? scheduledActionDescription,
    DateTime? startTime,
    ScheduledActionType? targetAction,
  }) async {
    final $request = <String, dynamic>{};
    $request['ScheduledActionName'] = scheduledActionName;
    enable?.also((arg) => $request['Enable'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    iamRole?.also((arg) => $request['IamRole'] = arg);
    schedule?.also((arg) => $request['Schedule'] = arg);
    scheduledActionDescription
        ?.also((arg) => $request['ScheduledActionDescription'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    targetAction?.also((arg) => $request['TargetAction'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyScheduledAction',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyScheduledActionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyScheduledActionResult',
    );
    return ScheduledAction.fromXml($result);
  }

  /// Modifies the number of days to retain snapshots in the destination Amazon
  /// Web Services Region after they are copied from the source Amazon Web
  /// Services Region. By default, this operation only changes the retention
  /// period of copied automated snapshots. The retention periods for both new
  /// and existing copied automated snapshots are updated with the new retention
  /// period. You can set the manual option to change only the retention periods
  /// of copied manual snapshots. If you set this option, only newly copied
  /// manual snapshots have the new retention period.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [SnapshotCopyDisabledFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidClusterStateFault].
  /// May throw [InvalidRetentionPeriodFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster for which you want to change the
  /// retention period for either automated or manual snapshots that are copied
  /// to a destination Amazon Web Services Region.
  ///
  /// Constraints: Must be the valid name of an existing cluster that has
  /// cross-region snapshot copy enabled.
  ///
  /// Parameter [retentionPeriod] :
  /// The number of days to retain automated snapshots in the destination Amazon
  /// Web Services Region after they are copied from the source Amazon Web
  /// Services Region.
  ///
  /// By default, this only changes the retention period of copied automated
  /// snapshots.
  ///
  /// If you decrease the retention period for automated snapshots that are
  /// copied to a destination Amazon Web Services Region, Amazon Redshift
  /// deletes any existing automated snapshots that were copied to the
  /// destination Amazon Web Services Region and that fall outside of the new
  /// retention period.
  ///
  /// Constraints: Must be at least 1 and no more than 35 for automated
  /// snapshots.
  ///
  /// If you specify the <code>manual</code> option, only newly copied manual
  /// snapshots will have the new retention period.
  ///
  /// If you specify the value of -1 newly copied manual snapshots are retained
  /// indefinitely.
  ///
  /// Constraints: The number of days must be either -1 or an integer between 1
  /// and 3,653 for manual snapshots.
  ///
  /// Parameter [manual] :
  /// Indicates whether to apply the snapshot retention period to newly copied
  /// manual snapshots instead of automated snapshots.
  Future<ModifySnapshotCopyRetentionPeriodResult>
      modifySnapshotCopyRetentionPeriod({
    required String clusterIdentifier,
    required int retentionPeriod,
    bool? manual,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['RetentionPeriod'] = retentionPeriod;
    manual?.also((arg) => $request['Manual'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifySnapshotCopyRetentionPeriod',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifySnapshotCopyRetentionPeriodMessage'],
      shapes: shapes,
      resultWrapper: 'ModifySnapshotCopyRetentionPeriodResult',
    );
    return ModifySnapshotCopyRetentionPeriodResult.fromXml($result);
  }

  /// Modifies a snapshot schedule. Any schedule associated with a cluster is
  /// modified asynchronously.
  ///
  /// May throw [InvalidScheduleFault].
  /// May throw [SnapshotScheduleNotFoundFault].
  /// May throw [SnapshotScheduleUpdateInProgressFault].
  ///
  /// Parameter [scheduleDefinitions] :
  /// An updated list of schedule definitions. A schedule definition is made up
  /// of schedule expressions, for example, "cron(30 12 *)" or "rate(12 hours)".
  ///
  /// Parameter [scheduleIdentifier] :
  /// A unique alphanumeric identifier of the schedule to modify.
  Future<SnapshotSchedule> modifySnapshotSchedule({
    required List<String> scheduleDefinitions,
    required String scheduleIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ScheduleDefinitions'] = scheduleDefinitions;
    $request['ScheduleIdentifier'] = scheduleIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'ModifySnapshotSchedule',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifySnapshotScheduleMessage'],
      shapes: shapes,
      resultWrapper: 'ModifySnapshotScheduleResult',
    );
    return SnapshotSchedule.fromXml($result);
  }

  /// Modifies a usage limit in a cluster. You can't modify the feature type or
  /// period of a usage limit.
  ///
  /// May throw [InvalidUsageLimitFault].
  /// May throw [UsageLimitNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [usageLimitId] :
  /// The identifier of the usage limit to modify.
  ///
  /// Parameter [amount] :
  /// The new limit amount. For more information about this parameter, see
  /// <a>UsageLimit</a>.
  ///
  /// Parameter [breachAction] :
  /// The new action that Amazon Redshift takes when the limit is reached. For
  /// more information about this parameter, see <a>UsageLimit</a>.
  Future<UsageLimit> modifyUsageLimit({
    required String usageLimitId,
    int? amount,
    UsageLimitBreachAction? breachAction,
  }) async {
    final $request = <String, dynamic>{};
    $request['UsageLimitId'] = usageLimitId;
    amount?.also((arg) => $request['Amount'] = arg);
    breachAction?.also((arg) => $request['BreachAction'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ModifyUsageLimit',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyUsageLimitMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyUsageLimitResult',
    );
    return UsageLimit.fromXml($result);
  }

  /// Pauses a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to be paused.
  Future<PauseClusterResult> pauseCluster({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'PauseCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PauseClusterMessage'],
      shapes: shapes,
      resultWrapper: 'PauseClusterResult',
    );
    return PauseClusterResult.fromXml($result);
  }

  /// Allows you to purchase reserved nodes. Amazon Redshift offers a predefined
  /// set of reserved node offerings. You can purchase one or more of the
  /// offerings. You can call the <a>DescribeReservedNodeOfferings</a> API to
  /// obtain the available reserved node offerings. You can call this API by
  /// providing a specific reserved node offering and the number of nodes you
  /// want to reserve.
  ///
  /// For more information about reserved node offerings, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing
  /// Reserved Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>.
  ///
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [ReservedNodeAlreadyExistsFault].
  /// May throw [ReservedNodeQuotaExceededFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [reservedNodeOfferingId] :
  /// The unique identifier of the reserved node offering you want to purchase.
  ///
  /// Parameter [nodeCount] :
  /// The number of reserved nodes that you want to purchase.
  ///
  /// Default: <code>1</code>
  Future<PurchaseReservedNodeOfferingResult> purchaseReservedNodeOffering({
    required String reservedNodeOfferingId,
    int? nodeCount,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReservedNodeOfferingId'] = reservedNodeOfferingId;
    nodeCount?.also((arg) => $request['NodeCount'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PurchaseReservedNodeOffering',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PurchaseReservedNodeOfferingMessage'],
      shapes: shapes,
      resultWrapper: 'PurchaseReservedNodeOfferingResult',
    );
    return PurchaseReservedNodeOfferingResult.fromXml($result);
  }

  /// Updates the resource policy for a specified resource.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidPolicyFault].
  /// May throw [ConflictPolicyUpdateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [policy] :
  /// The content of the resource policy being updated.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource of which its resource
  /// policy is updated.
  Future<PutResourcePolicyResult> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['Policy'] = policy;
    $request['ResourceArn'] = resourceArn;
    final $result = await _protocol.send(
      $request,
      action: 'PutResourcePolicy',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutResourcePolicyMessage'],
      shapes: shapes,
      resultWrapper: 'PutResourcePolicyResult',
    );
    return PutResourcePolicyResult.fromXml($result);
  }

  /// Reboots a cluster. This action is taken as soon as possible. It results in
  /// a momentary outage to the cluster, during which the cluster status is set
  /// to <code>rebooting</code>. A cluster event is created when the reboot is
  /// completed. Any pending cluster modifications (see <a>ModifyCluster</a>)
  /// are applied at this reboot. For more information about managing clusters,
  /// go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon
  /// Redshift Clusters</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier.
  Future<RebootClusterResult> rebootCluster({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'RebootCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebootClusterMessage'],
      shapes: shapes,
      resultWrapper: 'RebootClusterResult',
    );
    return RebootClusterResult.fromXml($result);
  }

  /// From a datashare consumer account, rejects the specified datashare.
  ///
  /// May throw [InvalidDataShareFault].
  ///
  /// Parameter [dataShareArn] :
  /// The Amazon Resource Name (ARN) of the datashare to reject.
  Future<DataShare> rejectDataShare({
    required String dataShareArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['DataShareArn'] = dataShareArn;
    final $result = await _protocol.send(
      $request,
      action: 'RejectDataShare',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RejectDataShareMessage'],
      shapes: shapes,
      resultWrapper: 'RejectDataShareResult',
    );
    return DataShare.fromXml($result);
  }

  /// Sets one or more parameters of the specified parameter group to their
  /// default values and sets the source values of the parameters to
  /// "engine-default". To reset the entire parameter group specify the
  /// <i>ResetAllParameters</i> parameter. For parameter changes to take effect
  /// you must reboot any associated clusters.
  ///
  /// May throw [InvalidClusterParameterGroupStateFault].
  /// May throw [ClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the cluster parameter group to be reset.
  ///
  /// Parameter [parameters] :
  /// An array of names of parameters to be reset. If <i>ResetAllParameters</i>
  /// option is not used, then at least one parameter name must be supplied.
  ///
  /// Constraints: A maximum of 20 parameters can be reset in a single request.
  ///
  /// Parameter [resetAllParameters] :
  /// If <code>true</code>, all parameters in the specified parameter group will
  /// be reset to their default values.
  ///
  /// Default: <code>true</code>
  Future<ClusterParameterGroupNameMessage> resetClusterParameterGroup({
    required String parameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['ParameterGroupName'] = parameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetClusterParameterGroup',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetClusterParameterGroupResult',
    );
    return ClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Changes the size of the cluster. You can change the cluster's type, or
  /// change the number or type of nodes. The default behavior is to use the
  /// elastic resize method. With an elastic resize, your cluster is available
  /// for read and write operations more quickly than with the classic resize
  /// method.
  ///
  /// Elastic resize operations have the following restrictions:
  ///
  /// <ul>
  /// <li>
  /// You can only resize clusters of the following types:
  ///
  /// <ul>
  /// <li>
  /// dc1.large (if your cluster is in a VPC)
  /// </li>
  /// <li>
  /// dc1.8xlarge (if your cluster is in a VPC)
  /// </li>
  /// <li>
  /// dc2.large
  /// </li>
  /// <li>
  /// dc2.8xlarge
  /// </li>
  /// <li>
  /// ds2.xlarge
  /// </li>
  /// <li>
  /// ds2.8xlarge
  /// </li>
  /// <li>
  /// ra3.xlplus
  /// </li>
  /// <li>
  /// ra3.4xlarge
  /// </li>
  /// <li>
  /// ra3.16xlarge
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The type of nodes that you add must match the node type for the cluster.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [NumberOfNodesQuotaExceededFault].
  /// May throw [NumberOfNodesPerClusterLimitExceededFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [UnsupportedOptionFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [LimitExceededFault].
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [InvalidReservedNodeStateFault].
  /// May throw [ReservedNodeAlreadyMigratedFault].
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [ReservedNodeAlreadyExistsFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier for the cluster to resize.
  ///
  /// Parameter [classic] :
  /// A boolean value indicating whether the resize operation is using the
  /// classic resize process. If you don't provide this parameter or set the
  /// value to <code>false</code>, the resize type is elastic.
  ///
  /// Parameter [clusterType] :
  /// The new cluster type for the specified cluster.
  ///
  /// Parameter [nodeType] :
  /// The new node type for the nodes you are adding. If not specified, the
  /// cluster's current node type is used.
  ///
  /// Parameter [numberOfNodes] :
  /// The new number of nodes for the cluster. If not specified, the cluster's
  /// current number of nodes is used.
  ///
  /// Parameter [reservedNodeId] :
  /// The identifier of the reserved node.
  ///
  /// Parameter [targetReservedNodeOfferingId] :
  /// The identifier of the target reserved node offering.
  Future<ResizeClusterResult> resizeCluster({
    required String clusterIdentifier,
    bool? classic,
    String? clusterType,
    String? nodeType,
    int? numberOfNodes,
    String? reservedNodeId,
    String? targetReservedNodeOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    classic?.also((arg) => $request['Classic'] = arg);
    clusterType?.also((arg) => $request['ClusterType'] = arg);
    nodeType?.also((arg) => $request['NodeType'] = arg);
    numberOfNodes?.also((arg) => $request['NumberOfNodes'] = arg);
    reservedNodeId?.also((arg) => $request['ReservedNodeId'] = arg);
    targetReservedNodeOfferingId
        ?.also((arg) => $request['TargetReservedNodeOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResizeCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResizeClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ResizeClusterResult',
    );
    return ResizeClusterResult.fromXml($result);
  }

  /// Creates a new cluster from a snapshot. By default, Amazon Redshift creates
  /// the resulting cluster with the same configuration as the original cluster
  /// from which the snapshot was created, except that the new cluster is
  /// created with the default cluster security and parameter groups. After
  /// Amazon Redshift creates the cluster, you can use the <a>ModifyCluster</a>
  /// API to associate a different security group and different parameter group
  /// with the restored cluster. If you are using a DS node type, you can also
  /// choose to change to another DS node type of the same size during restore.
  ///
  /// If you restore a cluster into a VPC, you must provide a cluster subnet
  /// group where you want the cluster restored.
  ///
  /// For more information about working with snapshots, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon
  /// Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [AccessToSnapshotDeniedFault].
  /// May throw [ClusterAlreadyExistsFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [ClusterQuotaExceededFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [NumberOfNodesQuotaExceededFault].
  /// May throw [NumberOfNodesPerClusterLimitExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidClusterSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [ClusterSubnetGroupNotFoundFault].
  /// May throw [UnauthorizedOperation].
  /// May throw [HsmClientCertificateNotFoundFault].
  /// May throw [HsmConfigurationNotFoundFault].
  /// May throw [InvalidElasticIpFault].
  /// May throw [ClusterParameterGroupNotFoundFault].
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [LimitExceededFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [InvalidClusterTrackFault].
  /// May throw [SnapshotScheduleNotFoundFault].
  /// May throw [TagLimitExceededFault].
  /// May throw [InvalidTagFault].
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [InvalidReservedNodeStateFault].
  /// May throw [ReservedNodeAlreadyMigratedFault].
  /// May throw [ReservedNodeOfferingNotFoundFault].
  /// May throw [DependentServiceUnavailableFault].
  /// May throw [ReservedNodeAlreadyExistsFault].
  /// May throw [UnsupportedOperationFault].
  /// May throw [Ipv6CidrBlockNotFoundFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster that will be created from restoring the
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Alphabetic characters must be lowercase.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// <li>
  /// Must be unique for all clusters within an Amazon Web Services account.
  /// </li>
  /// </ul>
  ///
  /// Parameter [additionalInfo] :
  /// Reserved.
  ///
  /// Parameter [allowVersionUpgrade] :
  /// If <code>true</code>, major version upgrades can be applied during the
  /// maintenance window to the Amazon Redshift engine that is running on the
  /// cluster.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [aquaConfigurationStatus] :
  /// This parameter is retired. It does not set the AQUA configuration status.
  /// Amazon Redshift automatically determines whether to use AQUA (Advanced
  /// Query Accelerator).
  ///
  /// Parameter [automatedSnapshotRetentionPeriod] :
  /// The number of days that automated snapshots are retained. If the value is
  /// 0, automated snapshots are disabled. Even if automated snapshots are
  /// disabled, you can still create manual snapshots when you want with
  /// <a>CreateClusterSnapshot</a>.
  ///
  /// You can't disable automated snapshots for RA3 node types. Set the
  /// automated retention period from 1-35 days.
  ///
  /// Default: The value selected for the cluster from which the snapshot was
  /// taken.
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// Parameter [availabilityZone] :
  /// The Amazon EC2 Availability Zone in which to restore the cluster.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Example: <code>us-east-2a</code>
  ///
  /// Parameter [availabilityZoneRelocation] :
  /// The option to enable relocation for an Amazon Redshift cluster between
  /// Availability Zones after the cluster is restored.
  ///
  /// Parameter [clusterParameterGroupName] :
  /// The name of the parameter group to be associated with this cluster.
  ///
  /// Default: The default Amazon Redshift cluster parameter group. For
  /// information about the default parameter group, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Working
  /// with Amazon Redshift Parameter Groups</a>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clusterSecurityGroups] :
  /// A list of security groups to be associated with this cluster.
  ///
  /// Default: The default cluster security group for Amazon Redshift.
  ///
  /// Cluster security groups only apply to clusters outside of VPCs.
  ///
  /// Parameter [clusterSubnetGroupName] :
  /// The name of the subnet group where you want to cluster restored.
  ///
  /// A snapshot of cluster in VPC can be restored only in VPC. Therefore, you
  /// must provide subnet group name where you want the cluster restored.
  ///
  /// Parameter [defaultIamRoleArn] :
  /// The Amazon Resource Name (ARN) for the IAM role that was set as default
  /// for the cluster when the cluster was last modified while it was restored
  /// from a snapshot.
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP (EIP) address for the cluster. Don't specify the Elastic IP
  /// address for a publicly accessible cluster with availability zone
  /// relocation turned on.
  ///
  /// Parameter [encrypted] :
  /// Enables support for restoring an unencrypted snapshot to a cluster
  /// encrypted with Key Management Service (KMS) and a customer managed key.
  ///
  /// Parameter [enhancedVpcRouting] :
  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// Parameter [hsmClientCertificateIdentifier] :
  /// Specifies the name of the HSM client certificate the Amazon Redshift
  /// cluster uses to retrieve the data encryption keys stored in an HSM.
  ///
  /// Parameter [hsmConfigurationIdentifier] :
  /// Specifies the name of the HSM configuration that contains the information
  /// the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  ///
  /// Parameter [iamRoles] :
  /// A list of Identity and Access Management (IAM) roles that can be used by
  /// the cluster to access other Amazon Web Services services. You must supply
  /// the IAM roles in their Amazon Resource Name (ARN) format.
  ///
  /// The maximum number of IAM roles that you can associate is subject to a
  /// quota. For more information, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html">Quotas
  /// and limits</a> in the <i>Amazon Redshift Cluster Management Guide</i>.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the cluster. Possible values are <code>ipv4</code>
  /// and <code>dualstack</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key Management Service (KMS) key ID of the encryption key that
  /// encrypts data in the cluster restored from a shared snapshot. You can also
  /// provide the key ID when you restore from an unencrypted snapshot to an
  /// encrypted cluster in the same account. Additionally, you can specify a new
  /// KMS key ID when you restore from an encrypted snapshot in the same account
  /// in order to change it. In that case, the restored cluster is encrypted
  /// with the new KMS key ID.
  ///
  /// Parameter [maintenanceTrackName] :
  /// The name of the maintenance track for the restored cluster. When you take
  /// a snapshot, the snapshot inherits the <code>MaintenanceTrack</code> value
  /// from the cluster. The snapshot might be on a different track than the
  /// cluster that was the source for the snapshot. For example, suppose that
  /// you take a snapshot of a cluster that is on the current track and then
  /// change the cluster to be on the trailing track. In this case, the snapshot
  /// and the source cluster are on different tracks.
  ///
  /// Parameter [manageMasterPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage the
  /// restored cluster's admin credentials. If <code>ManageMasterPassword</code>
  /// is false or not set, Amazon Redshift uses the admin credentials the
  /// cluster had at the time the snapshot was taken.
  ///
  /// Parameter [manualSnapshotRetentionPeriod] :
  /// The default number of days to retain a manual snapshot. If the value is
  /// -1, the snapshot is retained indefinitely. This setting doesn't change the
  /// retention period of existing snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// Parameter [masterPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the cluster's admin credentials secret. You can only use this parameter if
  /// <code>ManageMasterPassword</code> is true.
  ///
  /// Parameter [multiAZ] :
  /// If true, the snapshot will be restored to a cluster deployed in two
  /// Availability Zones.
  ///
  /// Parameter [nodeType] :
  /// The node type that the restored cluster will be provisioned with.
  ///
  /// Default: The node type of the cluster from which the snapshot was taken.
  /// You can modify this if you are using any DS node type. In that case, you
  /// can choose to restore into another DS node type of the same size. For
  /// example, you can restore ds1.8xlarge into ds2.8xlarge, or ds1.xlarge into
  /// ds2.xlarge. If you have a DC instance type, you must restore into that
  /// same instance type and size. In other words, you can only restore a
  /// dc1.large instance type into another dc1.large instance type or dc2.large
  /// instance type. You can't restore dc1.8xlarge to dc2.8xlarge. First restore
  /// to a dc1.8xlarge cluster, then resize to a dc2.8large cluster. For more
  /// information about node types, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-about-clusters-and-nodes">
  /// About Clusters and Nodes</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// Parameter [numberOfNodes] :
  /// The number of nodes specified when provisioning the restored cluster.
  ///
  /// Parameter [ownerAccount] :
  /// The Amazon Web Services account used to create or copy the snapshot.
  /// Required if you are restoring a snapshot you do not own, optional if you
  /// own the snapshot.
  ///
  /// Parameter [port] :
  /// The port number on which the cluster accepts connections.
  ///
  /// Default: The same port as the original cluster.
  ///
  /// Valid values: For clusters with ds2 or dc2 nodes, must be within the range
  /// <code>1150</code>-<code>65535</code>. For clusters with ra3 nodes, must be
  /// within the ranges <code>5431</code>-<code>5455</code> or
  /// <code>8191</code>-<code>8215</code>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which automated cluster maintenance
  /// can occur.
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// Default: The value selected for the cluster from which the snapshot was
  /// taken. For more information about the time blocks for each region, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows">Maintenance
  /// Windows</a> in Amazon Redshift Cluster Management Guide.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [publiclyAccessible] :
  /// If <code>true</code>, the cluster can be accessed from a public network.
  ///
  /// Parameter [reservedNodeId] :
  /// The identifier of the target reserved node offering.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot associated with the message
  /// to restore from a cluster. You must specify this parameter or
  /// <code>snapshotIdentifier</code>, but not both.
  ///
  /// Parameter [snapshotClusterIdentifier] :
  /// The name of the cluster the source snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster
  /// name.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The name of the snapshot from which to create the new cluster. This
  /// parameter isn't case sensitive. You must specify this parameter or
  /// <code>snapshotArn</code>, but not both.
  ///
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [snapshotScheduleIdentifier] :
  /// A unique identifier for the snapshot schedule.
  ///
  /// Parameter [targetReservedNodeOfferingId] :
  /// The identifier of the target reserved node offering.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of Virtual Private Cloud (VPC) security groups to be associated
  /// with the cluster.
  ///
  /// Default: The default VPC security group is associated with the cluster.
  ///
  /// VPC security groups only apply to clusters in VPCs.
  Future<RestoreFromClusterSnapshotResult> restoreFromClusterSnapshot({
    required String clusterIdentifier,
    String? additionalInfo,
    bool? allowVersionUpgrade,
    AquaConfigurationStatus? aquaConfigurationStatus,
    int? automatedSnapshotRetentionPeriod,
    String? availabilityZone,
    bool? availabilityZoneRelocation,
    String? clusterParameterGroupName,
    List<String>? clusterSecurityGroups,
    String? clusterSubnetGroupName,
    String? defaultIamRoleArn,
    String? elasticIp,
    bool? encrypted,
    bool? enhancedVpcRouting,
    String? hsmClientCertificateIdentifier,
    String? hsmConfigurationIdentifier,
    List<String>? iamRoles,
    String? ipAddressType,
    String? kmsKeyId,
    String? maintenanceTrackName,
    bool? manageMasterPassword,
    int? manualSnapshotRetentionPeriod,
    String? masterPasswordSecretKmsKeyId,
    bool? multiAZ,
    String? nodeType,
    int? numberOfNodes,
    String? ownerAccount,
    int? port,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    String? reservedNodeId,
    String? snapshotArn,
    String? snapshotClusterIdentifier,
    String? snapshotIdentifier,
    String? snapshotScheduleIdentifier,
    String? targetReservedNodeOfferingId,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    additionalInfo?.also((arg) => $request['AdditionalInfo'] = arg);
    allowVersionUpgrade?.also((arg) => $request['AllowVersionUpgrade'] = arg);
    aquaConfigurationStatus
        ?.also((arg) => $request['AquaConfigurationStatus'] = arg.toValue());
    automatedSnapshotRetentionPeriod
        ?.also((arg) => $request['AutomatedSnapshotRetentionPeriod'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    availabilityZoneRelocation
        ?.also((arg) => $request['AvailabilityZoneRelocation'] = arg);
    clusterParameterGroupName
        ?.also((arg) => $request['ClusterParameterGroupName'] = arg);
    clusterSecurityGroups
        ?.also((arg) => $request['ClusterSecurityGroups'] = arg);
    clusterSubnetGroupName
        ?.also((arg) => $request['ClusterSubnetGroupName'] = arg);
    defaultIamRoleArn?.also((arg) => $request['DefaultIamRoleArn'] = arg);
    elasticIp?.also((arg) => $request['ElasticIp'] = arg);
    encrypted?.also((arg) => $request['Encrypted'] = arg);
    enhancedVpcRouting?.also((arg) => $request['EnhancedVpcRouting'] = arg);
    hsmClientCertificateIdentifier
        ?.also((arg) => $request['HsmClientCertificateIdentifier'] = arg);
    hsmConfigurationIdentifier
        ?.also((arg) => $request['HsmConfigurationIdentifier'] = arg);
    iamRoles?.also((arg) => $request['IamRoles'] = arg);
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    maintenanceTrackName?.also((arg) => $request['MaintenanceTrackName'] = arg);
    manageMasterPassword?.also((arg) => $request['ManageMasterPassword'] = arg);
    manualSnapshotRetentionPeriod
        ?.also((arg) => $request['ManualSnapshotRetentionPeriod'] = arg);
    masterPasswordSecretKmsKeyId
        ?.also((arg) => $request['MasterPasswordSecretKmsKeyId'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    nodeType?.also((arg) => $request['NodeType'] = arg);
    numberOfNodes?.also((arg) => $request['NumberOfNodes'] = arg);
    ownerAccount?.also((arg) => $request['OwnerAccount'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    reservedNodeId?.also((arg) => $request['ReservedNodeId'] = arg);
    snapshotArn?.also((arg) => $request['SnapshotArn'] = arg);
    snapshotClusterIdentifier
        ?.also((arg) => $request['SnapshotClusterIdentifier'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    snapshotScheduleIdentifier
        ?.also((arg) => $request['SnapshotScheduleIdentifier'] = arg);
    targetReservedNodeOfferingId
        ?.also((arg) => $request['TargetReservedNodeOfferingId'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreFromClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreFromClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreFromClusterSnapshotResult',
    );
    return RestoreFromClusterSnapshotResult.fromXml($result);
  }

  /// Creates a new table from a table in an Amazon Redshift cluster snapshot.
  /// You must create the new table within the Amazon Redshift cluster that the
  /// snapshot was taken from.
  ///
  /// You cannot use <code>RestoreTableFromClusterSnapshot</code> to restore a
  /// table with the same name as an existing table in an Amazon Redshift
  /// cluster. That is, you cannot overwrite an existing table in a cluster with
  /// a restored table. If you want to replace your original table with a new,
  /// restored table, then rename or drop your original table before you call
  /// <code>RestoreTableFromClusterSnapshot</code>. When you have renamed your
  /// original table, then you can pass the original name of the table as the
  /// <code>NewTableName</code> parameter value in the call to
  /// <code>RestoreTableFromClusterSnapshot</code>. This way, you can replace
  /// the original table with the table created from the snapshot.
  ///
  /// You can't use this operation to restore tables with <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/t_Sorting_data.html#t_Sorting_data-interleaved">interleaved
  /// sort keys</a>.
  ///
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [InProgressTableRestoreQuotaExceededFault].
  /// May throw [InvalidClusterSnapshotStateFault].
  /// May throw [InvalidTableRestoreArgumentFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the Amazon Redshift cluster to restore the table to.
  ///
  /// Parameter [newTableName] :
  /// The name of the table to create as a result of the current request.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier of the snapshot to restore the table from. This snapshot
  /// must have been created from the Amazon Redshift cluster specified by the
  /// <code>ClusterIdentifier</code> parameter.
  ///
  /// Parameter [sourceDatabaseName] :
  /// The name of the source database that contains the table to restore from.
  ///
  /// Parameter [sourceTableName] :
  /// The name of the source table to restore from.
  ///
  /// Parameter [enableCaseSensitiveIdentifier] :
  /// Indicates whether name identifiers for database, schema, and table are
  /// case sensitive. If <code>true</code>, the names are case sensitive. If
  /// <code>false</code> (default), the names are not case sensitive.
  ///
  /// Parameter [sourceSchemaName] :
  /// The name of the source schema that contains the table to restore from. If
  /// you do not specify a <code>SourceSchemaName</code> value, the default is
  /// <code>public</code>.
  ///
  /// Parameter [targetDatabaseName] :
  /// The name of the database to restore the table to.
  ///
  /// Parameter [targetSchemaName] :
  /// The name of the schema to restore the table to.
  Future<RestoreTableFromClusterSnapshotResult>
      restoreTableFromClusterSnapshot({
    required String clusterIdentifier,
    required String newTableName,
    required String snapshotIdentifier,
    required String sourceDatabaseName,
    required String sourceTableName,
    bool? enableCaseSensitiveIdentifier,
    String? sourceSchemaName,
    String? targetDatabaseName,
    String? targetSchemaName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['NewTableName'] = newTableName;
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    $request['SourceDatabaseName'] = sourceDatabaseName;
    $request['SourceTableName'] = sourceTableName;
    enableCaseSensitiveIdentifier
        ?.also((arg) => $request['EnableCaseSensitiveIdentifier'] = arg);
    sourceSchemaName?.also((arg) => $request['SourceSchemaName'] = arg);
    targetDatabaseName?.also((arg) => $request['TargetDatabaseName'] = arg);
    targetSchemaName?.also((arg) => $request['TargetSchemaName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreTableFromClusterSnapshot',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreTableFromClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreTableFromClusterSnapshotResult',
    );
    return RestoreTableFromClusterSnapshotResult.fromXml($result);
  }

  /// Resumes a paused cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The identifier of the cluster to be resumed.
  Future<ResumeClusterResult> resumeCluster({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'ResumeCluster',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResumeClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ResumeClusterResult',
    );
    return ResumeClusterResult.fromXml($result);
  }

  /// Revokes an ingress rule in an Amazon Redshift security group for a
  /// previously authorized IP range or Amazon EC2 security group. To add an
  /// ingress rule, see <a>AuthorizeClusterSecurityGroupIngress</a>. For
  /// information about managing security groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon
  /// Redshift Cluster Security Groups</a> in the <i>Amazon Redshift Cluster
  /// Management Guide</i>.
  ///
  /// May throw [ClusterSecurityGroupNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  ///
  /// Parameter [clusterSecurityGroupName] :
  /// The name of the security Group from which to revoke the ingress rule.
  ///
  /// Parameter [cidrip] :
  /// The IP range for which to revoke access. This range must be a valid
  /// Classless Inter-Domain Routing (CIDR) block of IP addresses. If
  /// <code>CIDRIP</code> is specified, <code>EC2SecurityGroupName</code> and
  /// <code>EC2SecurityGroupOwnerId</code> cannot be provided.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// The name of the EC2 Security Group whose access is to be revoked. If
  /// <code>EC2SecurityGroupName</code> is specified,
  /// <code>EC2SecurityGroupOwnerId</code> must also be provided and
  /// <code>CIDRIP</code> cannot be provided.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// The Amazon Web Services account number of the owner of the security group
  /// specified in the <code>EC2SecurityGroupName</code> parameter. The Amazon
  /// Web Services access key ID is not an acceptable value. If
  /// <code>EC2SecurityGroupOwnerId</code> is specified,
  /// <code>EC2SecurityGroupName</code> must also be provided. and
  /// <code>CIDRIP</code> cannot be provided.
  ///
  /// Example: <code>111122223333</code>
  Future<RevokeClusterSecurityGroupIngressResult>
      revokeClusterSecurityGroupIngress({
    required String clusterSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterSecurityGroupName'] = clusterSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RevokeClusterSecurityGroupIngress',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeClusterSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeClusterSecurityGroupIngressResult',
    );
    return RevokeClusterSecurityGroupIngressResult.fromXml($result);
  }

  /// Revokes access to a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidEndpointStateFault].
  /// May throw [InvalidClusterSecurityGroupStateFault].
  /// May throw [EndpointNotFoundFault].
  /// May throw [EndpointAuthorizationNotFoundFault].
  /// May throw [InvalidAuthorizationStateFault].
  /// May throw [InvalidClusterStateFault].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID whose access is to be revoked.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster to revoke access from.
  ///
  /// Parameter [force] :
  /// Indicates whether to force the revoke action. If true, the
  /// Redshift-managed VPC endpoints associated with the endpoint authorization
  /// are also deleted.
  ///
  /// Parameter [vpcIds] :
  /// The virtual private cloud (VPC) identifiers for which access is to be
  /// revoked.
  Future<EndpointAuthorization> revokeEndpointAccess({
    String? account,
    String? clusterIdentifier,
    bool? force,
    List<String>? vpcIds,
  }) async {
    final $request = <String, dynamic>{};
    account?.also((arg) => $request['Account'] = arg);
    clusterIdentifier?.also((arg) => $request['ClusterIdentifier'] = arg);
    force?.also((arg) => $request['Force'] = arg);
    vpcIds?.also((arg) => $request['VpcIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RevokeEndpointAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeEndpointAccessMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeEndpointAccessResult',
    );
    return EndpointAuthorization.fromXml($result);
  }

  /// Removes the ability of the specified Amazon Web Services account to
  /// restore the specified snapshot. If the account is currently restoring the
  /// snapshot, the restore will run to completion.
  ///
  /// For more information about working with snapshots, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon
  /// Redshift Snapshots</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  ///
  /// May throw [AccessToSnapshotDeniedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [ClusterSnapshotNotFoundFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountWithRestoreAccess] :
  /// The identifier of the Amazon Web Services account that can no longer
  /// restore the specified snapshot.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot associated with the message
  /// to revoke access.
  ///
  /// Parameter [snapshotClusterIdentifier] :
  /// The identifier of the cluster the snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster
  /// name.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier of the snapshot that the account can no longer access.
  Future<RevokeSnapshotAccessResult> revokeSnapshotAccess({
    required String accountWithRestoreAccess,
    String? snapshotArn,
    String? snapshotClusterIdentifier,
    String? snapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountWithRestoreAccess'] = accountWithRestoreAccess;
    snapshotArn?.also((arg) => $request['SnapshotArn'] = arg);
    snapshotClusterIdentifier
        ?.also((arg) => $request['SnapshotClusterIdentifier'] = arg);
    snapshotIdentifier?.also((arg) => $request['SnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RevokeSnapshotAccess',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeSnapshotAccessMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeSnapshotAccessResult',
    );
    return RevokeSnapshotAccessResult.fromXml($result);
  }

  /// Rotates the encryption keys for a cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [DependentServiceRequestThrottlingFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [clusterIdentifier] :
  /// The unique identifier of the cluster that you want to rotate the
  /// encryption keys for.
  ///
  /// Constraints: Must be the name of valid cluster that has encryption
  /// enabled.
  Future<RotateEncryptionKeyResult> rotateEncryptionKey({
    required String clusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ClusterIdentifier'] = clusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'RotateEncryptionKey',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RotateEncryptionKeyMessage'],
      shapes: shapes,
      resultWrapper: 'RotateEncryptionKeyResult',
    );
    return RotateEncryptionKeyResult.fromXml($result);
  }

  /// Updates the status of a partner integration.
  ///
  /// May throw [PartnerNotFoundFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [UnauthorizedPartnerIntegrationFault].
  /// May throw [UnsupportedOperationFault].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the cluster.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier of the cluster whose partner integration status is
  /// being updated.
  ///
  /// Parameter [databaseName] :
  /// The name of the database whose partner integration status is being
  /// updated.
  ///
  /// Parameter [partnerName] :
  /// The name of the partner whose integration status is being updated.
  ///
  /// Parameter [status] :
  /// The value of the updated status.
  ///
  /// Parameter [statusMessage] :
  /// The status message provided by the partner.
  Future<PartnerIntegrationOutputMessage> updatePartnerStatus({
    required String accountId,
    required String clusterIdentifier,
    required String databaseName,
    required String partnerName,
    required PartnerIntegrationStatus status,
    String? statusMessage,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccountId'] = accountId;
    $request['ClusterIdentifier'] = clusterIdentifier;
    $request['DatabaseName'] = databaseName;
    $request['PartnerName'] = partnerName;
    $request['Status'] = status.toValue();
    statusMessage?.also((arg) => $request['StatusMessage'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdatePartnerStatus',
      version: '2012-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdatePartnerStatusInputMessage'],
      shapes: shapes,
      resultWrapper: 'UpdatePartnerStatusResult',
    );
    return PartnerIntegrationOutputMessage.fromXml($result);
  }
}

class AcceptReservedNodeExchangeOutputMessage {
  /// <p/>
  final ReservedNode? exchangedReservedNode;

  AcceptReservedNodeExchangeOutputMessage({
    this.exchangedReservedNode,
  });
  factory AcceptReservedNodeExchangeOutputMessage.fromXml(_s.XmlElement elem) {
    return AcceptReservedNodeExchangeOutputMessage(
      exchangedReservedNode: _s
          .extractXmlChild(elem, 'ExchangedReservedNode')
          ?.let(ReservedNode.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final exchangedReservedNode = this.exchangedReservedNode;
    return {
      if (exchangedReservedNode != null)
        'ExchangedReservedNode': exchangedReservedNode,
    };
  }
}

/// A name value pair that describes an aspect of an account.
class AccountAttribute {
  /// The name of the attribute.
  final String? attributeName;

  /// A list of attribute values.
  final List<AttributeValueTarget>? attributeValues;

  AccountAttribute({
    this.attributeName,
    this.attributeValues,
  });
  factory AccountAttribute.fromXml(_s.XmlElement elem) {
    return AccountAttribute(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeValues: _s.extractXmlChild(elem, 'AttributeValues')?.let(
          (elem) => elem
              .findElements('AttributeValueTarget')
              .map(AttributeValueTarget.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValues = this.attributeValues;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeValues != null) 'AttributeValues': attributeValues,
    };
  }
}

class AccountAttributeList {
  /// A list of attributes assigned to an account.
  final List<AccountAttribute>? accountAttributes;

  AccountAttributeList({
    this.accountAttributes,
  });
  factory AccountAttributeList.fromXml(_s.XmlElement elem) {
    return AccountAttributeList(
      accountAttributes: _s.extractXmlChild(elem, 'AccountAttributes')?.let(
          (elem) => elem
              .findElements('AccountAttribute')
              .map(AccountAttribute.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final accountAttributes = this.accountAttributes;
    return {
      if (accountAttributes != null) 'AccountAttributes': accountAttributes,
    };
  }
}

/// Describes an Amazon Web Services account authorized to restore a snapshot.
class AccountWithRestoreAccess {
  /// The identifier of an Amazon Web Services support account authorized to
  /// restore a snapshot. For Amazon Web Services Support, the identifier is
  /// <code>amazon-redshift-support</code>.
  final String? accountAlias;

  /// The identifier of an Amazon Web Services account authorized to restore a
  /// snapshot.
  final String? accountId;

  AccountWithRestoreAccess({
    this.accountAlias,
    this.accountId,
  });
  factory AccountWithRestoreAccess.fromXml(_s.XmlElement elem) {
    return AccountWithRestoreAccess(
      accountAlias: _s.extractXmlStringValue(elem, 'AccountAlias'),
      accountId: _s.extractXmlStringValue(elem, 'AccountId'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountAlias = this.accountAlias;
    final accountId = this.accountId;
    return {
      if (accountAlias != null) 'AccountAlias': accountAlias,
      if (accountId != null) 'AccountId': accountId,
    };
  }
}

enum ActionType {
  restoreCluster,
  recommendNodeConfig,
  resizeCluster,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.restoreCluster:
        return 'restore-cluster';
      case ActionType.recommendNodeConfig:
        return 'recommend-node-config';
      case ActionType.resizeCluster:
        return 'resize-cluster';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'restore-cluster':
        return ActionType.restoreCluster;
      case 'recommend-node-config':
        return ActionType.recommendNodeConfig;
      case 'resize-cluster':
        return ActionType.resizeCluster;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

/// The operation that uses this structure is retired. Amazon Redshift
/// automatically determines whether to use AQUA (Advanced Query Accelerator).
class AquaConfiguration {
  /// This field is retired. Amazon Redshift automatically determines whether to
  /// use AQUA (Advanced Query Accelerator).
  final AquaConfigurationStatus? aquaConfigurationStatus;

  /// This field is retired. Amazon Redshift automatically determines whether to
  /// use AQUA (Advanced Query Accelerator).
  final AquaStatus? aquaStatus;

  AquaConfiguration({
    this.aquaConfigurationStatus,
    this.aquaStatus,
  });
  factory AquaConfiguration.fromXml(_s.XmlElement elem) {
    return AquaConfiguration(
      aquaConfigurationStatus: _s
          .extractXmlStringValue(elem, 'AquaConfigurationStatus')
          ?.toAquaConfigurationStatus(),
      aquaStatus: _s.extractXmlStringValue(elem, 'AquaStatus')?.toAquaStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final aquaConfigurationStatus = this.aquaConfigurationStatus;
    final aquaStatus = this.aquaStatus;
    return {
      if (aquaConfigurationStatus != null)
        'AquaConfigurationStatus': aquaConfigurationStatus.toValue(),
      if (aquaStatus != null) 'AquaStatus': aquaStatus.toValue(),
    };
  }
}

enum AquaConfigurationStatus {
  enabled,
  disabled,
  auto,
}

extension AquaConfigurationStatusValueExtension on AquaConfigurationStatus {
  String toValue() {
    switch (this) {
      case AquaConfigurationStatus.enabled:
        return 'enabled';
      case AquaConfigurationStatus.disabled:
        return 'disabled';
      case AquaConfigurationStatus.auto:
        return 'auto';
    }
  }
}

extension AquaConfigurationStatusFromString on String {
  AquaConfigurationStatus toAquaConfigurationStatus() {
    switch (this) {
      case 'enabled':
        return AquaConfigurationStatus.enabled;
      case 'disabled':
        return AquaConfigurationStatus.disabled;
      case 'auto':
        return AquaConfigurationStatus.auto;
    }
    throw Exception('$this is not known in enum AquaConfigurationStatus');
  }
}

enum AquaStatus {
  enabled,
  disabled,
  applying,
}

extension AquaStatusValueExtension on AquaStatus {
  String toValue() {
    switch (this) {
      case AquaStatus.enabled:
        return 'enabled';
      case AquaStatus.disabled:
        return 'disabled';
      case AquaStatus.applying:
        return 'applying';
    }
  }
}

extension AquaStatusFromString on String {
  AquaStatus toAquaStatus() {
    switch (this) {
      case 'enabled':
        return AquaStatus.enabled;
      case 'disabled':
        return AquaStatus.disabled;
      case 'applying':
        return AquaStatus.applying;
    }
    throw Exception('$this is not known in enum AquaStatus');
  }
}

/// Contains information about the custom domain name association.
class Association {
  /// A list of all associated clusters and domain names tied to a specific
  /// certificate.
  final List<CertificateAssociation>? certificateAssociations;

  /// The Amazon Resource Name (ARN) for the certificate associated with the
  /// custom domain.
  final String? customDomainCertificateArn;

  /// The expiration date for the certificate.
  final DateTime? customDomainCertificateExpiryDate;

  Association({
    this.certificateAssociations,
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryDate,
  });
  factory Association.fromXml(_s.XmlElement elem) {
    return Association(
      certificateAssociations: _s
          .extractXmlChild(elem, 'CertificateAssociations')
          ?.let((elem) => elem
              .findElements('CertificateAssociation')
              .map(CertificateAssociation.fromXml)
              .toList()),
      customDomainCertificateArn:
          _s.extractXmlStringValue(elem, 'CustomDomainCertificateArn'),
      customDomainCertificateExpiryDate:
          _s.extractXmlDateTimeValue(elem, 'CustomDomainCertificateExpiryDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAssociations = this.certificateAssociations;
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryDate =
        this.customDomainCertificateExpiryDate;
    return {
      if (certificateAssociations != null)
        'CertificateAssociations': certificateAssociations,
      if (customDomainCertificateArn != null)
        'CustomDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryDate != null)
        'CustomDomainCertificateExpiryDate':
            iso8601ToJson(customDomainCertificateExpiryDate),
    };
  }
}

/// Describes an attribute value.
class AttributeValueTarget {
  /// The value of the attribute.
  final String? attributeValue;

  AttributeValueTarget({
    this.attributeValue,
  });
  factory AttributeValueTarget.fromXml(_s.XmlElement elem) {
    return AttributeValueTarget(
      attributeValue: _s.extractXmlStringValue(elem, 'AttributeValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeValue = this.attributeValue;
    return {
      if (attributeValue != null) 'AttributeValue': attributeValue,
    };
  }
}

/// Describes an authentication profile.
class AuthenticationProfile {
  /// The content of the authentication profile in JSON format. The maximum length
  /// of the JSON string is determined by a quota for your account.
  final String? authenticationProfileContent;

  /// The name of the authentication profile.
  final String? authenticationProfileName;

  AuthenticationProfile({
    this.authenticationProfileContent,
    this.authenticationProfileName,
  });
  factory AuthenticationProfile.fromXml(_s.XmlElement elem) {
    return AuthenticationProfile(
      authenticationProfileContent:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileContent'),
      authenticationProfileName:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileName'),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProfileContent = this.authenticationProfileContent;
    final authenticationProfileName = this.authenticationProfileName;
    return {
      if (authenticationProfileContent != null)
        'AuthenticationProfileContent': authenticationProfileContent,
      if (authenticationProfileName != null)
        'AuthenticationProfileName': authenticationProfileName,
    };
  }
}

enum AuthorizationStatus {
  authorized,
  revoking,
}

extension AuthorizationStatusValueExtension on AuthorizationStatus {
  String toValue() {
    switch (this) {
      case AuthorizationStatus.authorized:
        return 'Authorized';
      case AuthorizationStatus.revoking:
        return 'Revoking';
    }
  }
}

extension AuthorizationStatusFromString on String {
  AuthorizationStatus toAuthorizationStatus() {
    switch (this) {
      case 'Authorized':
        return AuthorizationStatus.authorized;
      case 'Revoking':
        return AuthorizationStatus.revoking;
    }
    throw Exception('$this is not known in enum AuthorizationStatus');
  }
}

class AuthorizeClusterSecurityGroupIngressResult {
  final ClusterSecurityGroup? clusterSecurityGroup;

  AuthorizeClusterSecurityGroupIngressResult({
    this.clusterSecurityGroup,
  });
  factory AuthorizeClusterSecurityGroupIngressResult.fromXml(
      _s.XmlElement elem) {
    return AuthorizeClusterSecurityGroupIngressResult(
      clusterSecurityGroup: _s
          .extractXmlChild(elem, 'ClusterSecurityGroup')
          ?.let(ClusterSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroup = this.clusterSecurityGroup;
    return {
      if (clusterSecurityGroup != null)
        'ClusterSecurityGroup': clusterSecurityGroup,
    };
  }
}

class AuthorizeSnapshotAccessResult {
  final Snapshot? snapshot;

  AuthorizeSnapshotAccessResult({
    this.snapshot,
  });
  factory AuthorizeSnapshotAccessResult.fromXml(_s.XmlElement elem) {
    return AuthorizeSnapshotAccessResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

/// The authorized token issuer for the Amazon Redshift IAM Identity Center
/// application.
class AuthorizedTokenIssuer {
  /// The list of audiences for the authorized token issuer for integrating Amazon
  /// Redshift with IDC Identity Center.
  final List<String>? authorizedAudiencesList;

  /// The ARN for the authorized token issuer for integrating Amazon Redshift with
  /// IDC Identity Center.
  final String? trustedTokenIssuerArn;

  AuthorizedTokenIssuer({
    this.authorizedAudiencesList,
    this.trustedTokenIssuerArn,
  });
  factory AuthorizedTokenIssuer.fromXml(_s.XmlElement elem) {
    return AuthorizedTokenIssuer(
      authorizedAudiencesList: _s
          .extractXmlChild(elem, 'AuthorizedAudiencesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      trustedTokenIssuerArn:
          _s.extractXmlStringValue(elem, 'TrustedTokenIssuerArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedAudiencesList = this.authorizedAudiencesList;
    final trustedTokenIssuerArn = this.trustedTokenIssuerArn;
    return {
      if (authorizedAudiencesList != null)
        'AuthorizedAudiencesList': authorizedAudiencesList,
      if (trustedTokenIssuerArn != null)
        'TrustedTokenIssuerArn': trustedTokenIssuerArn,
    };
  }
}

/// Describes an availability zone.
class AvailabilityZone {
  /// The name of the availability zone.
  final String? name;

  /// <p/>
  final List<SupportedPlatform>? supportedPlatforms;

  AvailabilityZone({
    this.name,
    this.supportedPlatforms,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
      supportedPlatforms: _s.extractXmlChild(elem, 'SupportedPlatforms')?.let(
          (elem) => elem
              .findElements('SupportedPlatform')
              .map(SupportedPlatform.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final supportedPlatforms = this.supportedPlatforms;
    return {
      if (name != null) 'Name': name,
      if (supportedPlatforms != null) 'SupportedPlatforms': supportedPlatforms,
    };
  }
}

class BatchDeleteClusterSnapshotsResult {
  /// A list of any errors returned.
  final List<SnapshotErrorMessage>? errors;

  /// A list of the snapshot identifiers that were deleted.
  final List<String>? resources;

  BatchDeleteClusterSnapshotsResult({
    this.errors,
    this.resources,
  });
  factory BatchDeleteClusterSnapshotsResult.fromXml(_s.XmlElement elem) {
    return BatchDeleteClusterSnapshotsResult(
      errors: _s.extractXmlChild(elem, 'Errors')?.let((elem) => elem
          .findElements('SnapshotErrorMessage')
          .map(SnapshotErrorMessage.fromXml)
          .toList()),
      resources: _s
          .extractXmlChild(elem, 'Resources')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'String')),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final resources = this.resources;
    return {
      if (errors != null) 'Errors': errors,
      if (resources != null) 'Resources': resources,
    };
  }
}

class BatchModifyClusterSnapshotsOutputMessage {
  /// A list of any errors returned.
  final List<SnapshotErrorMessage>? errors;

  /// A list of the snapshots that were modified.
  final List<String>? resources;

  BatchModifyClusterSnapshotsOutputMessage({
    this.errors,
    this.resources,
  });
  factory BatchModifyClusterSnapshotsOutputMessage.fromXml(_s.XmlElement elem) {
    return BatchModifyClusterSnapshotsOutputMessage(
      errors: _s.extractXmlChild(elem, 'Errors')?.let((elem) => elem
          .findElements('SnapshotErrorMessage')
          .map(SnapshotErrorMessage.fromXml)
          .toList()),
      resources: _s
          .extractXmlChild(elem, 'Resources')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'String')),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final resources = this.resources;
    return {
      if (errors != null) 'Errors': errors,
      if (resources != null) 'Resources': resources,
    };
  }
}

/// A cluster ID and custom domain name tied to a specific certificate. These
/// are typically returned in a list.
class CertificateAssociation {
  /// The cluster identifier for the certificate association.
  final String? clusterIdentifier;

  /// The custom domain name for the certificate association.
  final String? customDomainName;

  CertificateAssociation({
    this.clusterIdentifier,
    this.customDomainName,
  });
  factory CertificateAssociation.fromXml(_s.XmlElement elem) {
    return CertificateAssociation(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      customDomainName: _s.extractXmlStringValue(elem, 'CustomDomainName'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final customDomainName = this.customDomainName;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (customDomainName != null) 'CustomDomainName': customDomainName,
    };
  }
}

/// Describes a cluster.
class Cluster {
  /// A boolean value that, if <code>true</code>, indicates that major version
  /// upgrades will be applied automatically to the cluster during the maintenance
  /// window.
  final bool? allowVersionUpgrade;

  /// This field is retired. Amazon Redshift automatically determines whether to
  /// use AQUA (Advanced Query Accelerator).
  final AquaConfiguration? aquaConfiguration;

  /// The number of days that automatic cluster snapshots are retained.
  final int? automatedSnapshotRetentionPeriod;

  /// The name of the Availability Zone in which the cluster is located.
  final String? availabilityZone;

  /// Describes the status of the Availability Zone relocation operation.
  final String? availabilityZoneRelocationStatus;

  /// The availability status of the cluster for queries. Possible values are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Available - The cluster is available for queries.
  /// </li>
  /// <li>
  /// Unavailable - The cluster is not available for queries.
  /// </li>
  /// <li>
  /// Maintenance - The cluster is intermittently available for queries due to
  /// maintenance activities.
  /// </li>
  /// <li>
  /// Modifying - The cluster is intermittently available for queries due to
  /// changes that modify the cluster.
  /// </li>
  /// <li>
  /// Failed - The cluster failed and is not available for queries.
  /// </li>
  /// </ul>
  final String? clusterAvailabilityStatus;

  /// The date and time that the cluster was created.
  final DateTime? clusterCreateTime;

  /// The unique identifier of the cluster.
  final String? clusterIdentifier;

  /// The namespace Amazon Resource Name (ARN) of the cluster.
  final String? clusterNamespaceArn;

  /// The nodes in the cluster.
  final List<ClusterNode>? clusterNodes;

  /// The list of cluster parameter groups that are associated with this cluster.
  /// Each parameter group in the list is returned with its status.
  final List<ClusterParameterGroupStatus>? clusterParameterGroups;

  /// The public key for the cluster.
  final String? clusterPublicKey;

  /// The specific revision number of the database in the cluster.
  final String? clusterRevisionNumber;

  /// A list of cluster security group that are associated with the cluster. Each
  /// security group is represented by an element that contains
  /// <code>ClusterSecurityGroup.Name</code> and
  /// <code>ClusterSecurityGroup.Status</code> subelements.
  ///
  /// Cluster security groups are used when the cluster is not created in an
  /// Amazon Virtual Private Cloud (VPC). Clusters that are created in a VPC use
  /// VPC security groups, which are listed by the <b>VpcSecurityGroups</b>
  /// parameter.
  final List<ClusterSecurityGroupMembership>? clusterSecurityGroups;

  /// A value that returns the destination region and retention period that are
  /// configured for cross-region snapshot copy.
  final ClusterSnapshotCopyStatus? clusterSnapshotCopyStatus;

  /// The current state of the cluster. Possible values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>available</code>
  /// </li>
  /// <li>
  /// <code>available, prep-for-resize</code>
  /// </li>
  /// <li>
  /// <code>available, resize-cleanup</code>
  /// </li>
  /// <li>
  /// <code>cancelling-resize</code>
  /// </li>
  /// <li>
  /// <code>creating</code>
  /// </li>
  /// <li>
  /// <code>deleting</code>
  /// </li>
  /// <li>
  /// <code>final-snapshot</code>
  /// </li>
  /// <li>
  /// <code>hardware-failure</code>
  /// </li>
  /// <li>
  /// <code>incompatible-hsm</code>
  /// </li>
  /// <li>
  /// <code>incompatible-network</code>
  /// </li>
  /// <li>
  /// <code>incompatible-parameters</code>
  /// </li>
  /// <li>
  /// <code>incompatible-restore</code>
  /// </li>
  /// <li>
  /// <code>modifying</code>
  /// </li>
  /// <li>
  /// <code>paused</code>
  /// </li>
  /// <li>
  /// <code>rebooting</code>
  /// </li>
  /// <li>
  /// <code>renaming</code>
  /// </li>
  /// <li>
  /// <code>resizing</code>
  /// </li>
  /// <li>
  /// <code>rotating-keys</code>
  /// </li>
  /// <li>
  /// <code>storage-full</code>
  /// </li>
  /// <li>
  /// <code>updating-hsm</code>
  /// </li>
  /// </ul>
  final String? clusterStatus;

  /// The name of the subnet group that is associated with the cluster. This
  /// parameter is valid only when the cluster is in a VPC.
  final String? clusterSubnetGroupName;

  /// The version ID of the Amazon Redshift engine that is running on the cluster.
  final String? clusterVersion;

  /// The certificate Amazon Resource Name (ARN) for the custom domain name.
  final String? customDomainCertificateArn;

  /// The expiration date for the certificate associated with the custom domain
  /// name.
  final DateTime? customDomainCertificateExpiryDate;

  /// The custom domain name associated with the cluster.
  final String? customDomainName;

  /// The name of the initial database that was created when the cluster was
  /// created. This same name is returned for the life of the cluster. If an
  /// initial database was not specified, a database named <code>dev</code>dev was
  /// created by default.
  final String? dBName;

  /// <p/>
  final DataTransferProgress? dataTransferProgress;

  /// The Amazon Resource Name (ARN) for the IAM role set as default for the
  /// cluster.
  final String? defaultIamRoleArn;

  /// Describes a group of <code>DeferredMaintenanceWindow</code> objects.
  final List<DeferredMaintenanceWindow>? deferredMaintenanceWindows;

  /// The status of the elastic IP (EIP) address.
  final ElasticIpStatus? elasticIpStatus;

  /// The number of nodes that you can resize the cluster to with the elastic
  /// resize method.
  final String? elasticResizeNumberOfNodeOptions;

  /// A boolean value that, if <code>true</code>, indicates that data in the
  /// cluster is encrypted at rest.
  final bool? encrypted;

  /// The connection endpoint.
  final Endpoint? endpoint;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool? enhancedVpcRouting;

  /// The date and time when the next snapshot is expected to be taken for
  /// clusters with a valid snapshot schedule and backups enabled.
  final DateTime? expectedNextSnapshotScheduleTime;

  /// The status of next expected snapshot for clusters having a valid snapshot
  /// schedule and backups enabled. Possible values are the following:
  ///
  /// <ul>
  /// <li>
  /// OnTrack - The next snapshot is expected to be taken on time.
  /// </li>
  /// <li>
  /// Pending - The next snapshot is pending to be taken.
  /// </li>
  /// </ul>
  final String? expectedNextSnapshotScheduleTimeStatus;

  /// A value that reports whether the Amazon Redshift cluster has finished
  /// applying any hardware security module (HSM) settings changes specified in a
  /// modify cluster command.
  ///
  /// Values: active, applying
  final HsmStatus? hsmStatus;

  /// A list of Identity and Access Management (IAM) roles that can be used by the
  /// cluster to access other Amazon Web Services services.
  final List<ClusterIamRole>? iamRoles;

  /// The IP address type for the cluster. Possible values are <code>ipv4</code>
  /// and <code>dualstack</code>.
  final String? ipAddressType;

  /// The Key Management Service (KMS) key ID of the encryption key used to
  /// encrypt data in the cluster.
  final String? kmsKeyId;

  /// The name of the maintenance track for the cluster.
  final String? maintenanceTrackName;

  /// The default number of days to retain a manual snapshot. If the value is -1,
  /// the snapshot is retained indefinitely. This setting doesn't change the
  /// retention period of existing snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int? manualSnapshotRetentionPeriod;

  /// The Amazon Resource Name (ARN) for the cluster's admin user credentials
  /// secret.
  final String? masterPasswordSecretArn;

  /// The ID of the Key Management Service (KMS) key used to encrypt and store the
  /// cluster's admin credentials secret.
  final String? masterPasswordSecretKmsKeyId;

  /// The admin user name for the cluster. This name is used to connect to the
  /// database that is specified in the <b>DBName</b> parameter.
  final String? masterUsername;

  /// The status of a modify operation, if any, initiated for the cluster.
  final String? modifyStatus;

  /// A boolean value that, if true, indicates that the cluster is deployed in two
  /// Availability Zones.
  final String? multiAZ;

  /// The secondary compute unit of a cluster, if Multi-AZ deployment is turned
  /// on.
  final SecondaryClusterInfo? multiAZSecondary;

  /// The date and time in UTC when system maintenance can begin.
  final DateTime? nextMaintenanceWindowStartTime;

  /// The node type for the nodes in the cluster.
  final String? nodeType;

  /// The number of compute nodes in the cluster.
  final int? numberOfNodes;

  /// Cluster operations that are waiting to be started.
  final List<String>? pendingActions;

  /// A value that, if present, indicates that changes to the cluster are pending.
  /// Specific pending changes are identified by subelements.
  final PendingModifiedValues? pendingModifiedValues;

  /// The weekly time range, in Universal Coordinated Time (UTC), during which
  /// system maintenance can occur.
  final String? preferredMaintenanceWindow;

  /// A boolean value that, if <code>true</code>, indicates that the cluster can
  /// be accessed from a public network.
  final bool? publiclyAccessible;

  /// The status of the reserved-node exchange request. Statuses include
  /// in-progress and requested.
  final ReservedNodeExchangeStatus? reservedNodeExchangeStatus;

  /// Returns the following:
  ///
  /// <ul>
  /// <li>
  /// AllowCancelResize: a boolean value indicating if the resize operation can be
  /// cancelled.
  /// </li>
  /// <li>
  /// ResizeType: Returns ClassicResize
  /// </li>
  /// </ul>
  final ResizeInfo? resizeInfo;

  /// A value that describes the status of a cluster restore action. This
  /// parameter returns null if the cluster was not created by restoring a
  /// snapshot.
  final RestoreStatus? restoreStatus;

  /// A unique identifier for the cluster snapshot schedule.
  final String? snapshotScheduleIdentifier;

  /// The current state of the cluster snapshot schedule.
  final ScheduleState? snapshotScheduleState;

  /// The list of tags for the cluster.
  final List<Tag>? tags;

  /// The total storage capacity of the cluster in megabytes.
  final int? totalStorageCapacityInMegaBytes;

  /// The identifier of the VPC the cluster is in, if the cluster is in a VPC.
  final String? vpcId;

  /// A list of Amazon Virtual Private Cloud (Amazon VPC) security groups that are
  /// associated with the cluster. This parameter is returned only if the cluster
  /// is in a VPC.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  Cluster({
    this.allowVersionUpgrade,
    this.aquaConfiguration,
    this.automatedSnapshotRetentionPeriod,
    this.availabilityZone,
    this.availabilityZoneRelocationStatus,
    this.clusterAvailabilityStatus,
    this.clusterCreateTime,
    this.clusterIdentifier,
    this.clusterNamespaceArn,
    this.clusterNodes,
    this.clusterParameterGroups,
    this.clusterPublicKey,
    this.clusterRevisionNumber,
    this.clusterSecurityGroups,
    this.clusterSnapshotCopyStatus,
    this.clusterStatus,
    this.clusterSubnetGroupName,
    this.clusterVersion,
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryDate,
    this.customDomainName,
    this.dBName,
    this.dataTransferProgress,
    this.defaultIamRoleArn,
    this.deferredMaintenanceWindows,
    this.elasticIpStatus,
    this.elasticResizeNumberOfNodeOptions,
    this.encrypted,
    this.endpoint,
    this.enhancedVpcRouting,
    this.expectedNextSnapshotScheduleTime,
    this.expectedNextSnapshotScheduleTimeStatus,
    this.hsmStatus,
    this.iamRoles,
    this.ipAddressType,
    this.kmsKeyId,
    this.maintenanceTrackName,
    this.manualSnapshotRetentionPeriod,
    this.masterPasswordSecretArn,
    this.masterPasswordSecretKmsKeyId,
    this.masterUsername,
    this.modifyStatus,
    this.multiAZ,
    this.multiAZSecondary,
    this.nextMaintenanceWindowStartTime,
    this.nodeType,
    this.numberOfNodes,
    this.pendingActions,
    this.pendingModifiedValues,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.reservedNodeExchangeStatus,
    this.resizeInfo,
    this.restoreStatus,
    this.snapshotScheduleIdentifier,
    this.snapshotScheduleState,
    this.tags,
    this.totalStorageCapacityInMegaBytes,
    this.vpcId,
    this.vpcSecurityGroups,
  });
  factory Cluster.fromXml(_s.XmlElement elem) {
    return Cluster(
      allowVersionUpgrade: _s.extractXmlBoolValue(elem, 'AllowVersionUpgrade'),
      aquaConfiguration: _s
          .extractXmlChild(elem, 'AquaConfiguration')
          ?.let(AquaConfiguration.fromXml),
      automatedSnapshotRetentionPeriod:
          _s.extractXmlIntValue(elem, 'AutomatedSnapshotRetentionPeriod'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      availabilityZoneRelocationStatus:
          _s.extractXmlStringValue(elem, 'AvailabilityZoneRelocationStatus'),
      clusterAvailabilityStatus:
          _s.extractXmlStringValue(elem, 'ClusterAvailabilityStatus'),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      clusterNamespaceArn:
          _s.extractXmlStringValue(elem, 'ClusterNamespaceArn'),
      clusterNodes: _s.extractXmlChild(elem, 'ClusterNodes')?.let((elem) =>
          elem.findElements('member').map(ClusterNode.fromXml).toList()),
      clusterParameterGroups: _s
          .extractXmlChild(elem, 'ClusterParameterGroups')
          ?.let((elem) => elem
              .findElements('ClusterParameterGroup')
              .map(ClusterParameterGroupStatus.fromXml)
              .toList()),
      clusterPublicKey: _s.extractXmlStringValue(elem, 'ClusterPublicKey'),
      clusterRevisionNumber:
          _s.extractXmlStringValue(elem, 'ClusterRevisionNumber'),
      clusterSecurityGroups: _s
          .extractXmlChild(elem, 'ClusterSecurityGroups')
          ?.let((elem) => elem
              .findElements('ClusterSecurityGroup')
              .map(ClusterSecurityGroupMembership.fromXml)
              .toList()),
      clusterSnapshotCopyStatus: _s
          .extractXmlChild(elem, 'ClusterSnapshotCopyStatus')
          ?.let(ClusterSnapshotCopyStatus.fromXml),
      clusterStatus: _s.extractXmlStringValue(elem, 'ClusterStatus'),
      clusterSubnetGroupName:
          _s.extractXmlStringValue(elem, 'ClusterSubnetGroupName'),
      clusterVersion: _s.extractXmlStringValue(elem, 'ClusterVersion'),
      customDomainCertificateArn:
          _s.extractXmlStringValue(elem, 'CustomDomainCertificateArn'),
      customDomainCertificateExpiryDate:
          _s.extractXmlDateTimeValue(elem, 'CustomDomainCertificateExpiryDate'),
      customDomainName: _s.extractXmlStringValue(elem, 'CustomDomainName'),
      dBName: _s.extractXmlStringValue(elem, 'DBName'),
      dataTransferProgress: _s
          .extractXmlChild(elem, 'DataTransferProgress')
          ?.let(DataTransferProgress.fromXml),
      defaultIamRoleArn: _s.extractXmlStringValue(elem, 'DefaultIamRoleArn'),
      deferredMaintenanceWindows: _s
          .extractXmlChild(elem, 'DeferredMaintenanceWindows')
          ?.let((elem) => elem
              .findElements('DeferredMaintenanceWindow')
              .map(DeferredMaintenanceWindow.fromXml)
              .toList()),
      elasticIpStatus: _s
          .extractXmlChild(elem, 'ElasticIpStatus')
          ?.let(ElasticIpStatus.fromXml),
      elasticResizeNumberOfNodeOptions:
          _s.extractXmlStringValue(elem, 'ElasticResizeNumberOfNodeOptions'),
      encrypted: _s.extractXmlBoolValue(elem, 'Encrypted'),
      endpoint: _s.extractXmlChild(elem, 'Endpoint')?.let(Endpoint.fromXml),
      enhancedVpcRouting: _s.extractXmlBoolValue(elem, 'EnhancedVpcRouting'),
      expectedNextSnapshotScheduleTime:
          _s.extractXmlDateTimeValue(elem, 'ExpectedNextSnapshotScheduleTime'),
      expectedNextSnapshotScheduleTimeStatus: _s.extractXmlStringValue(
          elem, 'ExpectedNextSnapshotScheduleTimeStatus'),
      hsmStatus: _s.extractXmlChild(elem, 'HsmStatus')?.let(HsmStatus.fromXml),
      iamRoles: _s.extractXmlChild(elem, 'IamRoles')?.let((elem) => elem
          .findElements('ClusterIamRole')
          .map(ClusterIamRole.fromXml)
          .toList()),
      ipAddressType: _s.extractXmlStringValue(elem, 'IpAddressType'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      maintenanceTrackName:
          _s.extractXmlStringValue(elem, 'MaintenanceTrackName'),
      manualSnapshotRetentionPeriod:
          _s.extractXmlIntValue(elem, 'ManualSnapshotRetentionPeriod'),
      masterPasswordSecretArn:
          _s.extractXmlStringValue(elem, 'MasterPasswordSecretArn'),
      masterPasswordSecretKmsKeyId:
          _s.extractXmlStringValue(elem, 'MasterPasswordSecretKmsKeyId'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      modifyStatus: _s.extractXmlStringValue(elem, 'ModifyStatus'),
      multiAZ: _s.extractXmlStringValue(elem, 'MultiAZ'),
      multiAZSecondary: _s
          .extractXmlChild(elem, 'MultiAZSecondary')
          ?.let(SecondaryClusterInfo.fromXml),
      nextMaintenanceWindowStartTime:
          _s.extractXmlDateTimeValue(elem, 'NextMaintenanceWindowStartTime'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      numberOfNodes: _s.extractXmlIntValue(elem, 'NumberOfNodes'),
      pendingActions: _s
          .extractXmlChild(elem, 'PendingActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let(PendingModifiedValues.fromXml),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      reservedNodeExchangeStatus: _s
          .extractXmlChild(elem, 'ReservedNodeExchangeStatus')
          ?.let(ReservedNodeExchangeStatus.fromXml),
      resizeInfo:
          _s.extractXmlChild(elem, 'ResizeInfo')?.let(ResizeInfo.fromXml),
      restoreStatus:
          _s.extractXmlChild(elem, 'RestoreStatus')?.let(RestoreStatus.fromXml),
      snapshotScheduleIdentifier:
          _s.extractXmlStringValue(elem, 'SnapshotScheduleIdentifier'),
      snapshotScheduleState: _s
          .extractXmlStringValue(elem, 'SnapshotScheduleState')
          ?.toScheduleState(),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
      totalStorageCapacityInMegaBytes:
          _s.extractXmlIntValue(elem, 'TotalStorageCapacityInMegaBytes'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroup')
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final allowVersionUpgrade = this.allowVersionUpgrade;
    final aquaConfiguration = this.aquaConfiguration;
    final automatedSnapshotRetentionPeriod =
        this.automatedSnapshotRetentionPeriod;
    final availabilityZone = this.availabilityZone;
    final availabilityZoneRelocationStatus =
        this.availabilityZoneRelocationStatus;
    final clusterAvailabilityStatus = this.clusterAvailabilityStatus;
    final clusterCreateTime = this.clusterCreateTime;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterNamespaceArn = this.clusterNamespaceArn;
    final clusterNodes = this.clusterNodes;
    final clusterParameterGroups = this.clusterParameterGroups;
    final clusterPublicKey = this.clusterPublicKey;
    final clusterRevisionNumber = this.clusterRevisionNumber;
    final clusterSecurityGroups = this.clusterSecurityGroups;
    final clusterSnapshotCopyStatus = this.clusterSnapshotCopyStatus;
    final clusterStatus = this.clusterStatus;
    final clusterSubnetGroupName = this.clusterSubnetGroupName;
    final clusterVersion = this.clusterVersion;
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryDate =
        this.customDomainCertificateExpiryDate;
    final customDomainName = this.customDomainName;
    final dBName = this.dBName;
    final dataTransferProgress = this.dataTransferProgress;
    final defaultIamRoleArn = this.defaultIamRoleArn;
    final deferredMaintenanceWindows = this.deferredMaintenanceWindows;
    final elasticIpStatus = this.elasticIpStatus;
    final elasticResizeNumberOfNodeOptions =
        this.elasticResizeNumberOfNodeOptions;
    final encrypted = this.encrypted;
    final endpoint = this.endpoint;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final expectedNextSnapshotScheduleTime =
        this.expectedNextSnapshotScheduleTime;
    final expectedNextSnapshotScheduleTimeStatus =
        this.expectedNextSnapshotScheduleTimeStatus;
    final hsmStatus = this.hsmStatus;
    final iamRoles = this.iamRoles;
    final ipAddressType = this.ipAddressType;
    final kmsKeyId = this.kmsKeyId;
    final maintenanceTrackName = this.maintenanceTrackName;
    final manualSnapshotRetentionPeriod = this.manualSnapshotRetentionPeriod;
    final masterPasswordSecretArn = this.masterPasswordSecretArn;
    final masterPasswordSecretKmsKeyId = this.masterPasswordSecretKmsKeyId;
    final masterUsername = this.masterUsername;
    final modifyStatus = this.modifyStatus;
    final multiAZ = this.multiAZ;
    final multiAZSecondary = this.multiAZSecondary;
    final nextMaintenanceWindowStartTime = this.nextMaintenanceWindowStartTime;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final pendingActions = this.pendingActions;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final reservedNodeExchangeStatus = this.reservedNodeExchangeStatus;
    final resizeInfo = this.resizeInfo;
    final restoreStatus = this.restoreStatus;
    final snapshotScheduleIdentifier = this.snapshotScheduleIdentifier;
    final snapshotScheduleState = this.snapshotScheduleState;
    final tags = this.tags;
    final totalStorageCapacityInMegaBytes =
        this.totalStorageCapacityInMegaBytes;
    final vpcId = this.vpcId;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allowVersionUpgrade != null)
        'AllowVersionUpgrade': allowVersionUpgrade,
      if (aquaConfiguration != null) 'AquaConfiguration': aquaConfiguration,
      if (automatedSnapshotRetentionPeriod != null)
        'AutomatedSnapshotRetentionPeriod': automatedSnapshotRetentionPeriod,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneRelocationStatus != null)
        'AvailabilityZoneRelocationStatus': availabilityZoneRelocationStatus,
      if (clusterAvailabilityStatus != null)
        'ClusterAvailabilityStatus': clusterAvailabilityStatus,
      if (clusterCreateTime != null)
        'ClusterCreateTime': iso8601ToJson(clusterCreateTime),
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterNamespaceArn != null)
        'ClusterNamespaceArn': clusterNamespaceArn,
      if (clusterNodes != null) 'ClusterNodes': clusterNodes,
      if (clusterParameterGroups != null)
        'ClusterParameterGroups': clusterParameterGroups,
      if (clusterPublicKey != null) 'ClusterPublicKey': clusterPublicKey,
      if (clusterRevisionNumber != null)
        'ClusterRevisionNumber': clusterRevisionNumber,
      if (clusterSecurityGroups != null)
        'ClusterSecurityGroups': clusterSecurityGroups,
      if (clusterSnapshotCopyStatus != null)
        'ClusterSnapshotCopyStatus': clusterSnapshotCopyStatus,
      if (clusterStatus != null) 'ClusterStatus': clusterStatus,
      if (clusterSubnetGroupName != null)
        'ClusterSubnetGroupName': clusterSubnetGroupName,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (customDomainCertificateArn != null)
        'CustomDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryDate != null)
        'CustomDomainCertificateExpiryDate':
            iso8601ToJson(customDomainCertificateExpiryDate),
      if (customDomainName != null) 'CustomDomainName': customDomainName,
      if (dBName != null) 'DBName': dBName,
      if (dataTransferProgress != null)
        'DataTransferProgress': dataTransferProgress,
      if (defaultIamRoleArn != null) 'DefaultIamRoleArn': defaultIamRoleArn,
      if (deferredMaintenanceWindows != null)
        'DeferredMaintenanceWindows': deferredMaintenanceWindows,
      if (elasticIpStatus != null) 'ElasticIpStatus': elasticIpStatus,
      if (elasticResizeNumberOfNodeOptions != null)
        'ElasticResizeNumberOfNodeOptions': elasticResizeNumberOfNodeOptions,
      if (encrypted != null) 'Encrypted': encrypted,
      if (endpoint != null) 'Endpoint': endpoint,
      if (enhancedVpcRouting != null) 'EnhancedVpcRouting': enhancedVpcRouting,
      if (expectedNextSnapshotScheduleTime != null)
        'ExpectedNextSnapshotScheduleTime':
            iso8601ToJson(expectedNextSnapshotScheduleTime),
      if (expectedNextSnapshotScheduleTimeStatus != null)
        'ExpectedNextSnapshotScheduleTimeStatus':
            expectedNextSnapshotScheduleTimeStatus,
      if (hsmStatus != null) 'HsmStatus': hsmStatus,
      if (iamRoles != null) 'IamRoles': iamRoles,
      if (ipAddressType != null) 'IpAddressType': ipAddressType,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (manualSnapshotRetentionPeriod != null)
        'ManualSnapshotRetentionPeriod': manualSnapshotRetentionPeriod,
      if (masterPasswordSecretArn != null)
        'MasterPasswordSecretArn': masterPasswordSecretArn,
      if (masterPasswordSecretKmsKeyId != null)
        'MasterPasswordSecretKmsKeyId': masterPasswordSecretKmsKeyId,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (modifyStatus != null) 'ModifyStatus': modifyStatus,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (multiAZSecondary != null) 'MultiAZSecondary': multiAZSecondary,
      if (nextMaintenanceWindowStartTime != null)
        'NextMaintenanceWindowStartTime':
            iso8601ToJson(nextMaintenanceWindowStartTime),
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (pendingActions != null) 'PendingActions': pendingActions,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (reservedNodeExchangeStatus != null)
        'ReservedNodeExchangeStatus': reservedNodeExchangeStatus,
      if (resizeInfo != null) 'ResizeInfo': resizeInfo,
      if (restoreStatus != null) 'RestoreStatus': restoreStatus,
      if (snapshotScheduleIdentifier != null)
        'SnapshotScheduleIdentifier': snapshotScheduleIdentifier,
      if (snapshotScheduleState != null)
        'SnapshotScheduleState': snapshotScheduleState.toValue(),
      if (tags != null) 'Tags': tags,
      if (totalStorageCapacityInMegaBytes != null)
        'TotalStorageCapacityInMegaBytes': totalStorageCapacityInMegaBytes,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// <p/>
class ClusterAssociatedToSchedule {
  /// <p/>
  final String? clusterIdentifier;

  /// <p/>
  final ScheduleState? scheduleAssociationState;

  ClusterAssociatedToSchedule({
    this.clusterIdentifier,
    this.scheduleAssociationState,
  });
  factory ClusterAssociatedToSchedule.fromXml(_s.XmlElement elem) {
    return ClusterAssociatedToSchedule(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      scheduleAssociationState: _s
          .extractXmlStringValue(elem, 'ScheduleAssociationState')
          ?.toScheduleState(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final scheduleAssociationState = this.scheduleAssociationState;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (scheduleAssociationState != null)
        'ScheduleAssociationState': scheduleAssociationState.toValue(),
    };
  }
}

/// Temporary credentials with authorization to log on to an Amazon Redshift
/// database.
class ClusterCredentials {
  /// A temporary password that authorizes the user name returned by
  /// <code>DbUser</code> to log on to the database <code>DbName</code>.
  final String? dbPassword;

  /// A database user name that is authorized to log on to the database
  /// <code>DbName</code> using the password <code>DbPassword</code>. If the
  /// specified DbUser exists in the database, the new user name has the same
  /// database permissions as the the user named in DbUser. By default, the user
  /// is added to PUBLIC. If the <code>DbGroups</code> parameter is specifed,
  /// <code>DbUser</code> is added to the listed groups for any sessions created
  /// using these credentials.
  final String? dbUser;

  /// The date and time the password in <code>DbPassword</code> expires.
  final DateTime? expiration;

  ClusterCredentials({
    this.dbPassword,
    this.dbUser,
    this.expiration,
  });
  factory ClusterCredentials.fromXml(_s.XmlElement elem) {
    return ClusterCredentials(
      dbPassword: _s.extractXmlStringValue(elem, 'DbPassword'),
      dbUser: _s.extractXmlStringValue(elem, 'DbUser'),
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
    );
  }

  Map<String, dynamic> toJson() {
    final dbPassword = this.dbPassword;
    final dbUser = this.dbUser;
    final expiration = this.expiration;
    return {
      if (dbPassword != null) 'DbPassword': dbPassword,
      if (dbUser != null) 'DbUser': dbUser,
      if (expiration != null) 'Expiration': iso8601ToJson(expiration),
    };
  }
}

/// Describes a <code>ClusterDbRevision</code>.
class ClusterDbRevision {
  /// The unique identifier of the cluster.
  final String? clusterIdentifier;

  /// A string representing the current cluster version.
  final String? currentDatabaseRevision;

  /// The date on which the database revision was released.
  final DateTime? databaseRevisionReleaseDate;

  /// A list of <code>RevisionTarget</code> objects, where each object describes
  /// the database revision that a cluster can be updated to.
  final List<RevisionTarget>? revisionTargets;

  ClusterDbRevision({
    this.clusterIdentifier,
    this.currentDatabaseRevision,
    this.databaseRevisionReleaseDate,
    this.revisionTargets,
  });
  factory ClusterDbRevision.fromXml(_s.XmlElement elem) {
    return ClusterDbRevision(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      currentDatabaseRevision:
          _s.extractXmlStringValue(elem, 'CurrentDatabaseRevision'),
      databaseRevisionReleaseDate:
          _s.extractXmlDateTimeValue(elem, 'DatabaseRevisionReleaseDate'),
      revisionTargets: _s.extractXmlChild(elem, 'RevisionTargets')?.let(
          (elem) => elem
              .findElements('RevisionTarget')
              .map(RevisionTarget.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final currentDatabaseRevision = this.currentDatabaseRevision;
    final databaseRevisionReleaseDate = this.databaseRevisionReleaseDate;
    final revisionTargets = this.revisionTargets;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (currentDatabaseRevision != null)
        'CurrentDatabaseRevision': currentDatabaseRevision,
      if (databaseRevisionReleaseDate != null)
        'DatabaseRevisionReleaseDate':
            iso8601ToJson(databaseRevisionReleaseDate),
      if (revisionTargets != null) 'RevisionTargets': revisionTargets,
    };
  }
}

class ClusterDbRevisionsMessage {
  /// A list of revisions.
  final List<ClusterDbRevision>? clusterDbRevisions;

  /// A string representing the starting point for the next set of revisions. If a
  /// value is returned in a response, you can retrieve the next set of revisions
  /// by providing the value in the <code>marker</code> parameter and retrying the
  /// command. If the <code>marker</code> field is empty, all revisions have
  /// already been returned.
  final String? marker;

  ClusterDbRevisionsMessage({
    this.clusterDbRevisions,
    this.marker,
  });
  factory ClusterDbRevisionsMessage.fromXml(_s.XmlElement elem) {
    return ClusterDbRevisionsMessage(
      clusterDbRevisions: _s.extractXmlChild(elem, 'ClusterDbRevisions')?.let(
          (elem) => elem
              .findElements('ClusterDbRevision')
              .map(ClusterDbRevision.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterDbRevisions = this.clusterDbRevisions;
    final marker = this.marker;
    return {
      if (clusterDbRevisions != null) 'ClusterDbRevisions': clusterDbRevisions,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ClusterExtendedCredentials {
  /// A temporary password that you provide when you connect to a database.
  final String? dbPassword;

  /// A database user name that you provide when you connect to a database. The
  /// database user is mapped 1:1 to the source IAM identity.
  final String? dbUser;

  /// The time (UTC) when the temporary password expires. After this timestamp, a
  /// log in with the temporary password fails.
  final DateTime? expiration;

  /// Reserved for future use.
  final DateTime? nextRefreshTime;

  ClusterExtendedCredentials({
    this.dbPassword,
    this.dbUser,
    this.expiration,
    this.nextRefreshTime,
  });
  factory ClusterExtendedCredentials.fromXml(_s.XmlElement elem) {
    return ClusterExtendedCredentials(
      dbPassword: _s.extractXmlStringValue(elem, 'DbPassword'),
      dbUser: _s.extractXmlStringValue(elem, 'DbUser'),
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
      nextRefreshTime: _s.extractXmlDateTimeValue(elem, 'NextRefreshTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final dbPassword = this.dbPassword;
    final dbUser = this.dbUser;
    final expiration = this.expiration;
    final nextRefreshTime = this.nextRefreshTime;
    return {
      if (dbPassword != null) 'DbPassword': dbPassword,
      if (dbUser != null) 'DbUser': dbUser,
      if (expiration != null) 'Expiration': iso8601ToJson(expiration),
      if (nextRefreshTime != null)
        'NextRefreshTime': iso8601ToJson(nextRefreshTime),
    };
  }
}

/// An Identity and Access Management (IAM) role that can be used by the
/// associated Amazon Redshift cluster to access other Amazon Web Services
/// services.
class ClusterIamRole {
  /// A value that describes the status of the IAM role's association with an
  /// Amazon Redshift cluster.
  ///
  /// The following are possible statuses and descriptions.
  ///
  /// <ul>
  /// <li>
  /// <code>in-sync</code>: The role is available for use by the cluster.
  /// </li>
  /// <li>
  /// <code>adding</code>: The role is in the process of being associated with the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>removing</code>: The role is in the process of being disassociated
  /// with the cluster.
  /// </li>
  /// </ul>
  final String? applyStatus;

  /// The Amazon Resource Name (ARN) of the IAM role, for example,
  /// <code>arn:aws:iam::123456789012:role/RedshiftCopyUnload</code>.
  final String? iamRoleArn;

  ClusterIamRole({
    this.applyStatus,
    this.iamRoleArn,
  });
  factory ClusterIamRole.fromXml(_s.XmlElement elem) {
    return ClusterIamRole(
      applyStatus: _s.extractXmlStringValue(elem, 'ApplyStatus'),
      iamRoleArn: _s.extractXmlStringValue(elem, 'IamRoleArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final applyStatus = this.applyStatus;
    final iamRoleArn = this.iamRoleArn;
    return {
      if (applyStatus != null) 'ApplyStatus': applyStatus,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
  }
}

/// The identifier of a node in a cluster.
class ClusterNode {
  /// Whether the node is a leader node or a compute node.
  final String? nodeRole;

  /// The private IP address of a node within a cluster.
  final String? privateIPAddress;

  /// The public IP address of a node within a cluster.
  final String? publicIPAddress;

  ClusterNode({
    this.nodeRole,
    this.privateIPAddress,
    this.publicIPAddress,
  });
  factory ClusterNode.fromXml(_s.XmlElement elem) {
    return ClusterNode(
      nodeRole: _s.extractXmlStringValue(elem, 'NodeRole'),
      privateIPAddress: _s.extractXmlStringValue(elem, 'PrivateIPAddress'),
      publicIPAddress: _s.extractXmlStringValue(elem, 'PublicIPAddress'),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeRole = this.nodeRole;
    final privateIPAddress = this.privateIPAddress;
    final publicIPAddress = this.publicIPAddress;
    return {
      if (nodeRole != null) 'NodeRole': nodeRole,
      if (privateIPAddress != null) 'PrivateIPAddress': privateIPAddress,
      if (publicIPAddress != null) 'PublicIPAddress': publicIPAddress,
    };
  }
}

/// Describes a parameter group.
class ClusterParameterGroup {
  /// The description of the parameter group.
  final String? description;

  /// The name of the cluster parameter group family that this cluster parameter
  /// group is compatible with.
  final String? parameterGroupFamily;

  /// The name of the cluster parameter group.
  final String? parameterGroupName;

  /// The list of tags for the cluster parameter group.
  final List<Tag>? tags;

  ClusterParameterGroup({
    this.description,
    this.parameterGroupFamily,
    this.parameterGroupName,
    this.tags,
  });
  factory ClusterParameterGroup.fromXml(_s.XmlElement elem) {
    return ClusterParameterGroup(
      description: _s.extractXmlStringValue(elem, 'Description'),
      parameterGroupFamily:
          _s.extractXmlStringValue(elem, 'ParameterGroupFamily'),
      parameterGroupName: _s.extractXmlStringValue(elem, 'ParameterGroupName'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final parameterGroupFamily = this.parameterGroupFamily;
    final parameterGroupName = this.parameterGroupName;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (parameterGroupFamily != null)
        'ParameterGroupFamily': parameterGroupFamily,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the output from the <a>DescribeClusterParameters</a> action.
class ClusterParameterGroupDetails {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of <a>Parameter</a> instances. Each instance lists the parameters of
  /// one cluster parameter group.
  final List<Parameter>? parameters;

  ClusterParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory ClusterParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return ClusterParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final parameters = this.parameters;
    return {
      if (marker != null) 'Marker': marker,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// <p/>
class ClusterParameterGroupNameMessage {
  /// The name of the cluster parameter group.
  final String? parameterGroupName;

  /// The status of the parameter group. For example, if you made a change to a
  /// parameter group name-value pair, then the change could be pending a reboot
  /// of an associated cluster.
  final String? parameterGroupStatus;

  ClusterParameterGroupNameMessage({
    this.parameterGroupName,
    this.parameterGroupStatus,
  });
  factory ClusterParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return ClusterParameterGroupNameMessage(
      parameterGroupName: _s.extractXmlStringValue(elem, 'ParameterGroupName'),
      parameterGroupStatus:
          _s.extractXmlStringValue(elem, 'ParameterGroupStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroupName = this.parameterGroupName;
    final parameterGroupStatus = this.parameterGroupStatus;
    return {
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (parameterGroupStatus != null)
        'ParameterGroupStatus': parameterGroupStatus,
    };
  }
}

/// Describes the status of a parameter group.
class ClusterParameterGroupStatus {
  /// The list of parameter statuses.
  ///
  /// For more information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  final List<ClusterParameterStatus>? clusterParameterStatusList;

  /// The status of parameter updates.
  final String? parameterApplyStatus;

  /// The name of the cluster parameter group.
  final String? parameterGroupName;

  ClusterParameterGroupStatus({
    this.clusterParameterStatusList,
    this.parameterApplyStatus,
    this.parameterGroupName,
  });
  factory ClusterParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return ClusterParameterGroupStatus(
      clusterParameterStatusList: _s
          .extractXmlChild(elem, 'ClusterParameterStatusList')
          ?.let((elem) => elem
              .findElements('member')
              .map(ClusterParameterStatus.fromXml)
              .toList()),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
      parameterGroupName: _s.extractXmlStringValue(elem, 'ParameterGroupName'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterParameterStatusList = this.clusterParameterStatusList;
    final parameterApplyStatus = this.parameterApplyStatus;
    final parameterGroupName = this.parameterGroupName;
    return {
      if (clusterParameterStatusList != null)
        'ClusterParameterStatusList': clusterParameterStatusList,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
    };
  }
}

/// Contains the output from the <a>DescribeClusterParameterGroups</a> action.
class ClusterParameterGroupsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of <a>ClusterParameterGroup</a> instances. Each instance describes
  /// one cluster parameter group.
  final List<ClusterParameterGroup>? parameterGroups;

  ClusterParameterGroupsMessage({
    this.marker,
    this.parameterGroups,
  });
  factory ClusterParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return ClusterParameterGroupsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameterGroups: _s.extractXmlChild(elem, 'ParameterGroups')?.let(
          (elem) => elem
              .findElements('ClusterParameterGroup')
              .map(ClusterParameterGroup.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final parameterGroups = this.parameterGroups;
    return {
      if (marker != null) 'Marker': marker,
      if (parameterGroups != null) 'ParameterGroups': parameterGroups,
    };
  }
}

/// Describes the status of a parameter group.
class ClusterParameterStatus {
  /// The error that prevented the parameter from being applied to the database.
  final String? parameterApplyErrorDescription;

  /// The status of the parameter that indicates whether the parameter is in sync
  /// with the database, waiting for a cluster reboot, or encountered an error
  /// when being applied.
  ///
  /// The following are possible statuses and descriptions.
  ///
  /// <ul>
  /// <li>
  /// <code>in-sync</code>: The parameter value is in sync with the database.
  /// </li>
  /// <li>
  /// <code>pending-reboot</code>: The parameter value will be applied after the
  /// cluster reboots.
  /// </li>
  /// <li>
  /// <code>applying</code>: The parameter value is being applied to the database.
  /// </li>
  /// <li>
  /// <code>invalid-parameter</code>: Cannot apply the parameter value because it
  /// has an invalid value or syntax.
  /// </li>
  /// <li>
  /// <code>apply-deferred</code>: The parameter contains static property changes.
  /// The changes are deferred until the cluster reboots.
  /// </li>
  /// <li>
  /// <code>apply-error</code>: Cannot connect to the cluster. The parameter
  /// change will be applied after the cluster reboots.
  /// </li>
  /// <li>
  /// <code>unknown-error</code>: Cannot apply the parameter change right now. The
  /// change will be applied after the cluster reboots.
  /// </li>
  /// </ul>
  final String? parameterApplyStatus;

  /// The name of the parameter.
  final String? parameterName;

  ClusterParameterStatus({
    this.parameterApplyErrorDescription,
    this.parameterApplyStatus,
    this.parameterName,
  });
  factory ClusterParameterStatus.fromXml(_s.XmlElement elem) {
    return ClusterParameterStatus(
      parameterApplyErrorDescription:
          _s.extractXmlStringValue(elem, 'ParameterApplyErrorDescription'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
    );
  }

  Map<String, dynamic> toJson() {
    final parameterApplyErrorDescription = this.parameterApplyErrorDescription;
    final parameterApplyStatus = this.parameterApplyStatus;
    final parameterName = this.parameterName;
    return {
      if (parameterApplyErrorDescription != null)
        'ParameterApplyErrorDescription': parameterApplyErrorDescription,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
      if (parameterName != null) 'ParameterName': parameterName,
    };
  }
}

/// Describes a security group.
class ClusterSecurityGroup {
  /// The name of the cluster security group to which the operation was applied.
  final String? clusterSecurityGroupName;

  /// A description of the security group.
  final String? description;

  /// A list of EC2 security groups that are permitted to access clusters
  /// associated with this cluster security group.
  final List<EC2SecurityGroup>? eC2SecurityGroups;

  /// A list of IP ranges (CIDR blocks) that are permitted to access clusters
  /// associated with this cluster security group.
  final List<IPRange>? iPRanges;

  /// The list of tags for the cluster security group.
  final List<Tag>? tags;

  ClusterSecurityGroup({
    this.clusterSecurityGroupName,
    this.description,
    this.eC2SecurityGroups,
    this.iPRanges,
    this.tags,
  });
  factory ClusterSecurityGroup.fromXml(_s.XmlElement elem) {
    return ClusterSecurityGroup(
      clusterSecurityGroupName:
          _s.extractXmlStringValue(elem, 'ClusterSecurityGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map(EC2SecurityGroup.fromXml)
              .toList()),
      iPRanges: _s.extractXmlChild(elem, 'IPRanges')?.let(
          (elem) => elem.findElements('IPRange').map(IPRange.fromXml).toList()),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroupName = this.clusterSecurityGroupName;
    final description = this.description;
    final eC2SecurityGroups = this.eC2SecurityGroups;
    final iPRanges = this.iPRanges;
    final tags = this.tags;
    return {
      if (clusterSecurityGroupName != null)
        'ClusterSecurityGroupName': clusterSecurityGroupName,
      if (description != null) 'Description': description,
      if (eC2SecurityGroups != null) 'EC2SecurityGroups': eC2SecurityGroups,
      if (iPRanges != null) 'IPRanges': iPRanges,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes a cluster security group.
class ClusterSecurityGroupMembership {
  /// The name of the cluster security group.
  final String? clusterSecurityGroupName;

  /// The status of the cluster security group.
  final String? status;

  ClusterSecurityGroupMembership({
    this.clusterSecurityGroupName,
    this.status,
  });
  factory ClusterSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return ClusterSecurityGroupMembership(
      clusterSecurityGroupName:
          _s.extractXmlStringValue(elem, 'ClusterSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroupName = this.clusterSecurityGroupName;
    final status = this.status;
    return {
      if (clusterSecurityGroupName != null)
        'ClusterSecurityGroupName': clusterSecurityGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// <p/>
class ClusterSecurityGroupMessage {
  /// A list of <a>ClusterSecurityGroup</a> instances.
  final List<ClusterSecurityGroup>? clusterSecurityGroups;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  ClusterSecurityGroupMessage({
    this.clusterSecurityGroups,
    this.marker,
  });
  factory ClusterSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return ClusterSecurityGroupMessage(
      clusterSecurityGroups: _s
          .extractXmlChild(elem, 'ClusterSecurityGroups')
          ?.let((elem) => elem
              .findElements('ClusterSecurityGroup')
              .map(ClusterSecurityGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroups = this.clusterSecurityGroups;
    final marker = this.marker;
    return {
      if (clusterSecurityGroups != null)
        'ClusterSecurityGroups': clusterSecurityGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Returns the destination region and retention period that are configured for
/// cross-region snapshot copy.
class ClusterSnapshotCopyStatus {
  /// The destination region that snapshots are automatically copied to when
  /// cross-region snapshot copy is enabled.
  final String? destinationRegion;

  /// The number of days that automated snapshots are retained in the destination
  /// region after they are copied from a source region. If the value is -1, the
  /// manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int? manualSnapshotRetentionPeriod;

  /// The number of days that automated snapshots are retained in the destination
  /// region after they are copied from a source region.
  final int? retentionPeriod;

  /// The name of the snapshot copy grant.
  final String? snapshotCopyGrantName;

  ClusterSnapshotCopyStatus({
    this.destinationRegion,
    this.manualSnapshotRetentionPeriod,
    this.retentionPeriod,
    this.snapshotCopyGrantName,
  });
  factory ClusterSnapshotCopyStatus.fromXml(_s.XmlElement elem) {
    return ClusterSnapshotCopyStatus(
      destinationRegion: _s.extractXmlStringValue(elem, 'DestinationRegion'),
      manualSnapshotRetentionPeriod:
          _s.extractXmlIntValue(elem, 'ManualSnapshotRetentionPeriod'),
      retentionPeriod: _s.extractXmlIntValue(elem, 'RetentionPeriod'),
      snapshotCopyGrantName:
          _s.extractXmlStringValue(elem, 'SnapshotCopyGrantName'),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationRegion = this.destinationRegion;
    final manualSnapshotRetentionPeriod = this.manualSnapshotRetentionPeriod;
    final retentionPeriod = this.retentionPeriod;
    final snapshotCopyGrantName = this.snapshotCopyGrantName;
    return {
      if (destinationRegion != null) 'DestinationRegion': destinationRegion,
      if (manualSnapshotRetentionPeriod != null)
        'ManualSnapshotRetentionPeriod': manualSnapshotRetentionPeriod,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (snapshotCopyGrantName != null)
        'SnapshotCopyGrantName': snapshotCopyGrantName,
    };
  }
}

/// Describes a subnet group.
class ClusterSubnetGroup {
  /// The name of the cluster subnet group.
  final String? clusterSubnetGroupName;

  /// The description of the cluster subnet group.
  final String? description;

  /// The status of the cluster subnet group. Possible values are
  /// <code>Complete</code>, <code>Incomplete</code> and <code>Invalid</code>.
  final String? subnetGroupStatus;

  /// A list of the VPC <a>Subnet</a> elements.
  final List<Subnet>? subnets;

  /// The IP address types supported by this cluster subnet group. Possible values
  /// are <code>ipv4</code> and <code>dualstack</code>.
  final List<String>? supportedClusterIpAddressTypes;

  /// The list of tags for the cluster subnet group.
  final List<Tag>? tags;

  /// The VPC ID of the cluster subnet group.
  final String? vpcId;

  ClusterSubnetGroup({
    this.clusterSubnetGroupName,
    this.description,
    this.subnetGroupStatus,
    this.subnets,
    this.supportedClusterIpAddressTypes,
    this.tags,
    this.vpcId,
  });
  factory ClusterSubnetGroup.fromXml(_s.XmlElement elem) {
    return ClusterSubnetGroup(
      clusterSubnetGroupName:
          _s.extractXmlStringValue(elem, 'ClusterSubnetGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let(
          (elem) => elem.findElements('Subnet').map(Subnet.fromXml).toList()),
      supportedClusterIpAddressTypes: _s
          .extractXmlChild(elem, 'SupportedClusterIpAddressTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'item')),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSubnetGroupName = this.clusterSubnetGroupName;
    final description = this.description;
    final subnetGroupStatus = this.subnetGroupStatus;
    final subnets = this.subnets;
    final supportedClusterIpAddressTypes = this.supportedClusterIpAddressTypes;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (clusterSubnetGroupName != null)
        'ClusterSubnetGroupName': clusterSubnetGroupName,
      if (description != null) 'Description': description,
      if (subnetGroupStatus != null) 'SubnetGroupStatus': subnetGroupStatus,
      if (subnets != null) 'Subnets': subnets,
      if (supportedClusterIpAddressTypes != null)
        'SupportedClusterIpAddressTypes': supportedClusterIpAddressTypes,
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains the output from the <a>DescribeClusterSubnetGroups</a> action.
class ClusterSubnetGroupMessage {
  /// A list of <a>ClusterSubnetGroup</a> instances.
  final List<ClusterSubnetGroup>? clusterSubnetGroups;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  ClusterSubnetGroupMessage({
    this.clusterSubnetGroups,
    this.marker,
  });
  factory ClusterSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return ClusterSubnetGroupMessage(
      clusterSubnetGroups: _s.extractXmlChild(elem, 'ClusterSubnetGroups')?.let(
          (elem) => elem
              .findElements('ClusterSubnetGroup')
              .map(ClusterSubnetGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSubnetGroups = this.clusterSubnetGroups;
    final marker = this.marker;
    return {
      if (clusterSubnetGroups != null)
        'ClusterSubnetGroups': clusterSubnetGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Describes a cluster version, including the parameter group family and
/// description of the version.
class ClusterVersion {
  /// The name of the cluster parameter group family for the cluster.
  final String? clusterParameterGroupFamily;

  /// The version number used by the cluster.
  final String? clusterVersion;

  /// The description of the cluster version.
  final String? description;

  ClusterVersion({
    this.clusterParameterGroupFamily,
    this.clusterVersion,
    this.description,
  });
  factory ClusterVersion.fromXml(_s.XmlElement elem) {
    return ClusterVersion(
      clusterParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'ClusterParameterGroupFamily'),
      clusterVersion: _s.extractXmlStringValue(elem, 'ClusterVersion'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterParameterGroupFamily = this.clusterParameterGroupFamily;
    final clusterVersion = this.clusterVersion;
    final description = this.description;
    return {
      if (clusterParameterGroupFamily != null)
        'ClusterParameterGroupFamily': clusterParameterGroupFamily,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (description != null) 'Description': description,
    };
  }
}

/// Contains the output from the <a>DescribeClusterVersions</a> action.
class ClusterVersionsMessage {
  /// A list of <code>Version</code> elements.
  final List<ClusterVersion>? clusterVersions;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  ClusterVersionsMessage({
    this.clusterVersions,
    this.marker,
  });
  factory ClusterVersionsMessage.fromXml(_s.XmlElement elem) {
    return ClusterVersionsMessage(
      clusterVersions: _s.extractXmlChild(elem, 'ClusterVersions')?.let(
          (elem) => elem
              .findElements('ClusterVersion')
              .map(ClusterVersion.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterVersions = this.clusterVersions;
    final marker = this.marker;
    return {
      if (clusterVersions != null) 'ClusterVersions': clusterVersions,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the output from the <a>DescribeClusters</a> action.
class ClustersMessage {
  /// A list of <code>Cluster</code> objects, where each object describes one
  /// cluster.
  final List<Cluster>? clusters;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  ClustersMessage({
    this.clusters,
    this.marker,
  });
  factory ClustersMessage.fromXml(_s.XmlElement elem) {
    return ClustersMessage(
      clusters: _s.extractXmlChild(elem, 'Clusters')?.let(
          (elem) => elem.findElements('Cluster').map(Cluster.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final marker = this.marker;
    return {
      if (clusters != null) 'Clusters': clusters,
      if (marker != null) 'Marker': marker,
    };
  }
}

class CopyClusterSnapshotResult {
  final Snapshot? snapshot;

  CopyClusterSnapshotResult({
    this.snapshot,
  });
  factory CopyClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyClusterSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateAuthenticationProfileResult {
  /// The content of the authentication profile in JSON format.
  final String? authenticationProfileContent;

  /// The name of the authentication profile that was created.
  final String? authenticationProfileName;

  CreateAuthenticationProfileResult({
    this.authenticationProfileContent,
    this.authenticationProfileName,
  });
  factory CreateAuthenticationProfileResult.fromXml(_s.XmlElement elem) {
    return CreateAuthenticationProfileResult(
      authenticationProfileContent:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileContent'),
      authenticationProfileName:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileName'),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProfileContent = this.authenticationProfileContent;
    final authenticationProfileName = this.authenticationProfileName;
    return {
      if (authenticationProfileContent != null)
        'AuthenticationProfileContent': authenticationProfileContent,
      if (authenticationProfileName != null)
        'AuthenticationProfileName': authenticationProfileName,
    };
  }
}

class CreateClusterParameterGroupResult {
  final ClusterParameterGroup? clusterParameterGroup;

  CreateClusterParameterGroupResult({
    this.clusterParameterGroup,
  });
  factory CreateClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateClusterParameterGroupResult(
      clusterParameterGroup: _s
          .extractXmlChild(elem, 'ClusterParameterGroup')
          ?.let(ClusterParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterParameterGroup = this.clusterParameterGroup;
    return {
      if (clusterParameterGroup != null)
        'ClusterParameterGroup': clusterParameterGroup,
    };
  }
}

class CreateClusterResult {
  final Cluster? cluster;

  CreateClusterResult({
    this.cluster,
  });
  factory CreateClusterResult.fromXml(_s.XmlElement elem) {
    return CreateClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class CreateClusterSecurityGroupResult {
  final ClusterSecurityGroup? clusterSecurityGroup;

  CreateClusterSecurityGroupResult({
    this.clusterSecurityGroup,
  });
  factory CreateClusterSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateClusterSecurityGroupResult(
      clusterSecurityGroup: _s
          .extractXmlChild(elem, 'ClusterSecurityGroup')
          ?.let(ClusterSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroup = this.clusterSecurityGroup;
    return {
      if (clusterSecurityGroup != null)
        'ClusterSecurityGroup': clusterSecurityGroup,
    };
  }
}

class CreateClusterSnapshotResult {
  final Snapshot? snapshot;

  CreateClusterSnapshotResult({
    this.snapshot,
  });
  factory CreateClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateClusterSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateClusterSubnetGroupResult {
  final ClusterSubnetGroup? clusterSubnetGroup;

  CreateClusterSubnetGroupResult({
    this.clusterSubnetGroup,
  });
  factory CreateClusterSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateClusterSubnetGroupResult(
      clusterSubnetGroup: _s
          .extractXmlChild(elem, 'ClusterSubnetGroup')
          ?.let(ClusterSubnetGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSubnetGroup = this.clusterSubnetGroup;
    return {
      if (clusterSubnetGroup != null) 'ClusterSubnetGroup': clusterSubnetGroup,
    };
  }
}

class CreateCustomDomainAssociationResult {
  /// The identifier of the cluster that the custom domain is associated with.
  final String? clusterIdentifier;

  /// The expiration time for the certificate for the custom domain.
  final String? customDomainCertExpiryTime;

  /// The Amazon Resource Name (ARN) for the certificate associated with the
  /// custom domain name.
  final String? customDomainCertificateArn;

  /// The custom domain name for the association result.
  final String? customDomainName;

  CreateCustomDomainAssociationResult({
    this.clusterIdentifier,
    this.customDomainCertExpiryTime,
    this.customDomainCertificateArn,
    this.customDomainName,
  });
  factory CreateCustomDomainAssociationResult.fromXml(_s.XmlElement elem) {
    return CreateCustomDomainAssociationResult(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      customDomainCertExpiryTime:
          _s.extractXmlStringValue(elem, 'CustomDomainCertExpiryTime'),
      customDomainCertificateArn:
          _s.extractXmlStringValue(elem, 'CustomDomainCertificateArn'),
      customDomainName: _s.extractXmlStringValue(elem, 'CustomDomainName'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final customDomainCertExpiryTime = this.customDomainCertExpiryTime;
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainName = this.customDomainName;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (customDomainCertExpiryTime != null)
        'CustomDomainCertExpiryTime': customDomainCertExpiryTime,
      if (customDomainCertificateArn != null)
        'CustomDomainCertificateArn': customDomainCertificateArn,
      if (customDomainName != null) 'CustomDomainName': customDomainName,
    };
  }
}

class CreateEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class CreateHsmClientCertificateResult {
  final HsmClientCertificate? hsmClientCertificate;

  CreateHsmClientCertificateResult({
    this.hsmClientCertificate,
  });
  factory CreateHsmClientCertificateResult.fromXml(_s.XmlElement elem) {
    return CreateHsmClientCertificateResult(
      hsmClientCertificate: _s
          .extractXmlChild(elem, 'HsmClientCertificate')
          ?.let(HsmClientCertificate.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmClientCertificate = this.hsmClientCertificate;
    return {
      if (hsmClientCertificate != null)
        'HsmClientCertificate': hsmClientCertificate,
    };
  }
}

class CreateHsmConfigurationResult {
  final HsmConfiguration? hsmConfiguration;

  CreateHsmConfigurationResult({
    this.hsmConfiguration,
  });
  factory CreateHsmConfigurationResult.fromXml(_s.XmlElement elem) {
    return CreateHsmConfigurationResult(
      hsmConfiguration: _s
          .extractXmlChild(elem, 'HsmConfiguration')
          ?.let(HsmConfiguration.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmConfiguration = this.hsmConfiguration;
    return {
      if (hsmConfiguration != null) 'HsmConfiguration': hsmConfiguration,
    };
  }
}

class CreateRedshiftIdcApplicationResult {
  final RedshiftIdcApplication? redshiftIdcApplication;

  CreateRedshiftIdcApplicationResult({
    this.redshiftIdcApplication,
  });
  factory CreateRedshiftIdcApplicationResult.fromXml(_s.XmlElement elem) {
    return CreateRedshiftIdcApplicationResult(
      redshiftIdcApplication: _s
          .extractXmlChild(elem, 'RedshiftIdcApplication')
          ?.let(RedshiftIdcApplication.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final redshiftIdcApplication = this.redshiftIdcApplication;
    return {
      if (redshiftIdcApplication != null)
        'RedshiftIdcApplication': redshiftIdcApplication,
    };
  }
}

class CreateSnapshotCopyGrantResult {
  final SnapshotCopyGrant? snapshotCopyGrant;

  CreateSnapshotCopyGrantResult({
    this.snapshotCopyGrant,
  });
  factory CreateSnapshotCopyGrantResult.fromXml(_s.XmlElement elem) {
    return CreateSnapshotCopyGrantResult(
      snapshotCopyGrant: _s
          .extractXmlChild(elem, 'SnapshotCopyGrant')
          ?.let(SnapshotCopyGrant.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotCopyGrant = this.snapshotCopyGrant;
    return {
      if (snapshotCopyGrant != null) 'SnapshotCopyGrant': snapshotCopyGrant,
    };
  }
}

class CustomDomainAssociationsMessage {
  /// The associations for the custom domain.
  final List<Association>? associations;

  /// The marker for the custom domain association.
  final String? marker;

  CustomDomainAssociationsMessage({
    this.associations,
    this.marker,
  });
  factory CustomDomainAssociationsMessage.fromXml(_s.XmlElement elem) {
    return CustomDomainAssociationsMessage(
      associations: _s.extractXmlChild(elem, 'Associations')?.let((elem) =>
          elem.findElements('Association').map(Association.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final marker = this.marker;
    return {
      if (associations != null) 'Associations': associations,
      if (marker != null) 'Marker': marker,
    };
  }
}

class CustomerStorageMessage {
  /// The total amount of storage currently used for snapshots.
  final double? totalBackupSizeInMegaBytes;

  /// The total amount of storage currently provisioned.
  final double? totalProvisionedStorageInMegaBytes;

  CustomerStorageMessage({
    this.totalBackupSizeInMegaBytes,
    this.totalProvisionedStorageInMegaBytes,
  });
  factory CustomerStorageMessage.fromXml(_s.XmlElement elem) {
    return CustomerStorageMessage(
      totalBackupSizeInMegaBytes:
          _s.extractXmlDoubleValue(elem, 'TotalBackupSizeInMegaBytes'),
      totalProvisionedStorageInMegaBytes:
          _s.extractXmlDoubleValue(elem, 'TotalProvisionedStorageInMegaBytes'),
    );
  }

  Map<String, dynamic> toJson() {
    final totalBackupSizeInMegaBytes = this.totalBackupSizeInMegaBytes;
    final totalProvisionedStorageInMegaBytes =
        this.totalProvisionedStorageInMegaBytes;
    return {
      if (totalBackupSizeInMegaBytes != null)
        'TotalBackupSizeInMegaBytes': totalBackupSizeInMegaBytes,
      if (totalProvisionedStorageInMegaBytes != null)
        'TotalProvisionedStorageInMegaBytes':
            totalProvisionedStorageInMegaBytes,
    };
  }
}

class DataShare {
  /// A value that specifies whether the datashare can be shared to a publicly
  /// accessible cluster.
  final bool? allowPubliclyAccessibleConsumers;

  /// The Amazon Resource Name (ARN) of the datashare that the consumer is to use.
  final String? dataShareArn;

  /// A value that specifies when the datashare has an association between
  /// producer and data consumers.
  final List<DataShareAssociation>? dataShareAssociations;

  /// The identifier of a datashare to show its managing entity.
  final String? managedBy;

  /// The Amazon Resource Name (ARN) of the producer namespace.
  final String? producerArn;

  DataShare({
    this.allowPubliclyAccessibleConsumers,
    this.dataShareArn,
    this.dataShareAssociations,
    this.managedBy,
    this.producerArn,
  });
  factory DataShare.fromXml(_s.XmlElement elem) {
    return DataShare(
      allowPubliclyAccessibleConsumers:
          _s.extractXmlBoolValue(elem, 'AllowPubliclyAccessibleConsumers'),
      dataShareArn: _s.extractXmlStringValue(elem, 'DataShareArn'),
      dataShareAssociations: _s
          .extractXmlChild(elem, 'DataShareAssociations')
          ?.let((elem) => elem
              .findElements('member')
              .map(DataShareAssociation.fromXml)
              .toList()),
      managedBy: _s.extractXmlStringValue(elem, 'ManagedBy'),
      producerArn: _s.extractXmlStringValue(elem, 'ProducerArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowPubliclyAccessibleConsumers =
        this.allowPubliclyAccessibleConsumers;
    final dataShareArn = this.dataShareArn;
    final dataShareAssociations = this.dataShareAssociations;
    final managedBy = this.managedBy;
    final producerArn = this.producerArn;
    return {
      if (allowPubliclyAccessibleConsumers != null)
        'AllowPubliclyAccessibleConsumers': allowPubliclyAccessibleConsumers,
      if (dataShareArn != null) 'DataShareArn': dataShareArn,
      if (dataShareAssociations != null)
        'DataShareAssociations': dataShareAssociations,
      if (managedBy != null) 'ManagedBy': managedBy,
      if (producerArn != null) 'ProducerArn': producerArn,
    };
  }
}

/// The association of a datashare from a producer account with a data consumer.
class DataShareAssociation {
  /// Specifies whether write operations were allowed during data share
  /// association.
  final bool? consumerAcceptedWrites;

  /// The name of the consumer accounts that have an association with a producer
  /// datashare.
  final String? consumerIdentifier;

  /// The Amazon Web Services Region of the consumer accounts that have an
  /// association with a producer datashare.
  final String? consumerRegion;

  /// The creation date of the datashare that is associated.
  final DateTime? createdDate;

  /// Specifies whether write operations were allowed during data share
  /// authorization.
  final bool? producerAllowedWrites;

  /// The status of the datashare that is associated.
  final DataShareStatus? status;

  /// The status change data of the datashare that is associated.
  final DateTime? statusChangeDate;

  DataShareAssociation({
    this.consumerAcceptedWrites,
    this.consumerIdentifier,
    this.consumerRegion,
    this.createdDate,
    this.producerAllowedWrites,
    this.status,
    this.statusChangeDate,
  });
  factory DataShareAssociation.fromXml(_s.XmlElement elem) {
    return DataShareAssociation(
      consumerAcceptedWrites:
          _s.extractXmlBoolValue(elem, 'ConsumerAcceptedWrites'),
      consumerIdentifier: _s.extractXmlStringValue(elem, 'ConsumerIdentifier'),
      consumerRegion: _s.extractXmlStringValue(elem, 'ConsumerRegion'),
      createdDate: _s.extractXmlDateTimeValue(elem, 'CreatedDate'),
      producerAllowedWrites:
          _s.extractXmlBoolValue(elem, 'ProducerAllowedWrites'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toDataShareStatus(),
      statusChangeDate: _s.extractXmlDateTimeValue(elem, 'StatusChangeDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final consumerAcceptedWrites = this.consumerAcceptedWrites;
    final consumerIdentifier = this.consumerIdentifier;
    final consumerRegion = this.consumerRegion;
    final createdDate = this.createdDate;
    final producerAllowedWrites = this.producerAllowedWrites;
    final status = this.status;
    final statusChangeDate = this.statusChangeDate;
    return {
      if (consumerAcceptedWrites != null)
        'ConsumerAcceptedWrites': consumerAcceptedWrites,
      if (consumerIdentifier != null) 'ConsumerIdentifier': consumerIdentifier,
      if (consumerRegion != null) 'ConsumerRegion': consumerRegion,
      if (createdDate != null) 'CreatedDate': iso8601ToJson(createdDate),
      if (producerAllowedWrites != null)
        'ProducerAllowedWrites': producerAllowedWrites,
      if (status != null) 'Status': status.toValue(),
      if (statusChangeDate != null)
        'StatusChangeDate': iso8601ToJson(statusChangeDate),
    };
  }
}

enum DataShareStatus {
  active,
  pendingAuthorization,
  authorized,
  deauthorized,
  rejected,
  available,
}

extension DataShareStatusValueExtension on DataShareStatus {
  String toValue() {
    switch (this) {
      case DataShareStatus.active:
        return 'ACTIVE';
      case DataShareStatus.pendingAuthorization:
        return 'PENDING_AUTHORIZATION';
      case DataShareStatus.authorized:
        return 'AUTHORIZED';
      case DataShareStatus.deauthorized:
        return 'DEAUTHORIZED';
      case DataShareStatus.rejected:
        return 'REJECTED';
      case DataShareStatus.available:
        return 'AVAILABLE';
    }
  }
}

extension DataShareStatusFromString on String {
  DataShareStatus toDataShareStatus() {
    switch (this) {
      case 'ACTIVE':
        return DataShareStatus.active;
      case 'PENDING_AUTHORIZATION':
        return DataShareStatus.pendingAuthorization;
      case 'AUTHORIZED':
        return DataShareStatus.authorized;
      case 'DEAUTHORIZED':
        return DataShareStatus.deauthorized;
      case 'REJECTED':
        return DataShareStatus.rejected;
      case 'AVAILABLE':
        return DataShareStatus.available;
    }
    throw Exception('$this is not known in enum DataShareStatus');
  }
}

enum DataShareStatusForConsumer {
  active,
  available,
}

extension DataShareStatusForConsumerValueExtension
    on DataShareStatusForConsumer {
  String toValue() {
    switch (this) {
      case DataShareStatusForConsumer.active:
        return 'ACTIVE';
      case DataShareStatusForConsumer.available:
        return 'AVAILABLE';
    }
  }
}

extension DataShareStatusForConsumerFromString on String {
  DataShareStatusForConsumer toDataShareStatusForConsumer() {
    switch (this) {
      case 'ACTIVE':
        return DataShareStatusForConsumer.active;
      case 'AVAILABLE':
        return DataShareStatusForConsumer.available;
    }
    throw Exception('$this is not known in enum DataShareStatusForConsumer');
  }
}

enum DataShareStatusForProducer {
  active,
  authorized,
  pendingAuthorization,
  deauthorized,
  rejected,
}

extension DataShareStatusForProducerValueExtension
    on DataShareStatusForProducer {
  String toValue() {
    switch (this) {
      case DataShareStatusForProducer.active:
        return 'ACTIVE';
      case DataShareStatusForProducer.authorized:
        return 'AUTHORIZED';
      case DataShareStatusForProducer.pendingAuthorization:
        return 'PENDING_AUTHORIZATION';
      case DataShareStatusForProducer.deauthorized:
        return 'DEAUTHORIZED';
      case DataShareStatusForProducer.rejected:
        return 'REJECTED';
    }
  }
}

extension DataShareStatusForProducerFromString on String {
  DataShareStatusForProducer toDataShareStatusForProducer() {
    switch (this) {
      case 'ACTIVE':
        return DataShareStatusForProducer.active;
      case 'AUTHORIZED':
        return DataShareStatusForProducer.authorized;
      case 'PENDING_AUTHORIZATION':
        return DataShareStatusForProducer.pendingAuthorization;
      case 'DEAUTHORIZED':
        return DataShareStatusForProducer.deauthorized;
      case 'REJECTED':
        return DataShareStatusForProducer.rejected;
    }
    throw Exception('$this is not known in enum DataShareStatusForProducer');
  }
}

/// Describes the status of a cluster while it is in the process of resizing
/// with an incremental resize.
class DataTransferProgress {
  /// Describes the data transfer rate in MB's per second.
  final double? currentRateInMegaBytesPerSecond;

  /// Describes the total amount of data that has been transfered in MB's.
  final int? dataTransferredInMegaBytes;

  /// Describes the number of seconds that have elapsed during the data transfer.
  final int? elapsedTimeInSeconds;

  /// Describes the estimated number of seconds remaining to complete the
  /// transfer.
  final int? estimatedTimeToCompletionInSeconds;

  /// Describes the status of the cluster. While the transfer is in progress the
  /// status is <code>transferringdata</code>.
  final String? status;

  /// Describes the total amount of data to be transfered in megabytes.
  final int? totalDataInMegaBytes;

  DataTransferProgress({
    this.currentRateInMegaBytesPerSecond,
    this.dataTransferredInMegaBytes,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.status,
    this.totalDataInMegaBytes,
  });
  factory DataTransferProgress.fromXml(_s.XmlElement elem) {
    return DataTransferProgress(
      currentRateInMegaBytesPerSecond:
          _s.extractXmlDoubleValue(elem, 'CurrentRateInMegaBytesPerSecond'),
      dataTransferredInMegaBytes:
          _s.extractXmlIntValue(elem, 'DataTransferredInMegaBytes'),
      elapsedTimeInSeconds: _s.extractXmlIntValue(elem, 'ElapsedTimeInSeconds'),
      estimatedTimeToCompletionInSeconds:
          _s.extractXmlIntValue(elem, 'EstimatedTimeToCompletionInSeconds'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      totalDataInMegaBytes: _s.extractXmlIntValue(elem, 'TotalDataInMegaBytes'),
    );
  }

  Map<String, dynamic> toJson() {
    final currentRateInMegaBytesPerSecond =
        this.currentRateInMegaBytesPerSecond;
    final dataTransferredInMegaBytes = this.dataTransferredInMegaBytes;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final estimatedTimeToCompletionInSeconds =
        this.estimatedTimeToCompletionInSeconds;
    final status = this.status;
    final totalDataInMegaBytes = this.totalDataInMegaBytes;
    return {
      if (currentRateInMegaBytesPerSecond != null)
        'CurrentRateInMegaBytesPerSecond': currentRateInMegaBytesPerSecond,
      if (dataTransferredInMegaBytes != null)
        'DataTransferredInMegaBytes': dataTransferredInMegaBytes,
      if (elapsedTimeInSeconds != null)
        'ElapsedTimeInSeconds': elapsedTimeInSeconds,
      if (estimatedTimeToCompletionInSeconds != null)
        'EstimatedTimeToCompletionInSeconds':
            estimatedTimeToCompletionInSeconds,
      if (status != null) 'Status': status,
      if (totalDataInMegaBytes != null)
        'TotalDataInMegaBytes': totalDataInMegaBytes,
    };
  }
}

/// Describes the default cluster parameters for a parameter group family.
class DefaultClusterParameters {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// The name of the cluster parameter group family to which the engine default
  /// parameters apply.
  final String? parameterGroupFamily;

  /// The list of cluster default parameters.
  final List<Parameter>? parameters;

  DefaultClusterParameters({
    this.marker,
    this.parameterGroupFamily,
    this.parameters,
  });
  factory DefaultClusterParameters.fromXml(_s.XmlElement elem) {
    return DefaultClusterParameters(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameterGroupFamily:
          _s.extractXmlStringValue(elem, 'ParameterGroupFamily'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final parameterGroupFamily = this.parameterGroupFamily;
    final parameters = this.parameters;
    return {
      if (marker != null) 'Marker': marker,
      if (parameterGroupFamily != null)
        'ParameterGroupFamily': parameterGroupFamily,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Describes a deferred maintenance window
class DeferredMaintenanceWindow {
  /// A timestamp for the end of the time period when we defer maintenance.
  final DateTime? deferMaintenanceEndTime;

  /// A unique identifier for the maintenance window.
  final String? deferMaintenanceIdentifier;

  /// A timestamp for the beginning of the time period when we defer maintenance.
  final DateTime? deferMaintenanceStartTime;

  DeferredMaintenanceWindow({
    this.deferMaintenanceEndTime,
    this.deferMaintenanceIdentifier,
    this.deferMaintenanceStartTime,
  });
  factory DeferredMaintenanceWindow.fromXml(_s.XmlElement elem) {
    return DeferredMaintenanceWindow(
      deferMaintenanceEndTime:
          _s.extractXmlDateTimeValue(elem, 'DeferMaintenanceEndTime'),
      deferMaintenanceIdentifier:
          _s.extractXmlStringValue(elem, 'DeferMaintenanceIdentifier'),
      deferMaintenanceStartTime:
          _s.extractXmlDateTimeValue(elem, 'DeferMaintenanceStartTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final deferMaintenanceEndTime = this.deferMaintenanceEndTime;
    final deferMaintenanceIdentifier = this.deferMaintenanceIdentifier;
    final deferMaintenanceStartTime = this.deferMaintenanceStartTime;
    return {
      if (deferMaintenanceEndTime != null)
        'DeferMaintenanceEndTime': iso8601ToJson(deferMaintenanceEndTime),
      if (deferMaintenanceIdentifier != null)
        'DeferMaintenanceIdentifier': deferMaintenanceIdentifier,
      if (deferMaintenanceStartTime != null)
        'DeferMaintenanceStartTime': iso8601ToJson(deferMaintenanceStartTime),
    };
  }
}

class DeleteAuthenticationProfileResult {
  /// The name of the authentication profile that was deleted.
  final String? authenticationProfileName;

  DeleteAuthenticationProfileResult({
    this.authenticationProfileName,
  });
  factory DeleteAuthenticationProfileResult.fromXml(_s.XmlElement elem) {
    return DeleteAuthenticationProfileResult(
      authenticationProfileName:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileName'),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProfileName = this.authenticationProfileName;
    return {
      if (authenticationProfileName != null)
        'AuthenticationProfileName': authenticationProfileName,
    };
  }
}

class DeleteClusterResult {
  final Cluster? cluster;

  DeleteClusterResult({
    this.cluster,
  });
  factory DeleteClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// <p/>
class DeleteClusterSnapshotMessage {
  /// The unique identifier of the manual snapshot to be deleted.
  ///
  /// Constraints: Must be the name of an existing snapshot that is in the
  /// <code>available</code>, <code>failed</code>, or <code>cancelled</code>
  /// state.
  final String snapshotIdentifier;

  /// The unique identifier of the cluster the snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster name.
  ///
  /// Constraints: Must be the name of valid cluster.
  final String? snapshotClusterIdentifier;

  DeleteClusterSnapshotMessage({
    required this.snapshotIdentifier,
    this.snapshotClusterIdentifier,
  });

  Map<String, dynamic> toJson() {
    final snapshotIdentifier = this.snapshotIdentifier;
    final snapshotClusterIdentifier = this.snapshotClusterIdentifier;
    return {
      'SnapshotIdentifier': snapshotIdentifier,
      if (snapshotClusterIdentifier != null)
        'SnapshotClusterIdentifier': snapshotClusterIdentifier,
    };
  }
}

class DeleteClusterSnapshotResult {
  final Snapshot? snapshot;

  DeleteClusterSnapshotResult({
    this.snapshot,
  });
  factory DeleteClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteClusterSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class DescribeAuthenticationProfilesResult {
  /// The list of authentication profiles.
  final List<AuthenticationProfile>? authenticationProfiles;

  DescribeAuthenticationProfilesResult({
    this.authenticationProfiles,
  });
  factory DescribeAuthenticationProfilesResult.fromXml(_s.XmlElement elem) {
    return DescribeAuthenticationProfilesResult(
      authenticationProfiles: _s
          .extractXmlChild(elem, 'AuthenticationProfiles')
          ?.let((elem) => elem
              .findElements('member')
              .map(AuthenticationProfile.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProfiles = this.authenticationProfiles;
    return {
      if (authenticationProfiles != null)
        'AuthenticationProfiles': authenticationProfiles,
    };
  }
}

class DescribeDataSharesForConsumerResult {
  /// Shows the results of datashares available for consumers.
  final List<DataShare>? dataShares;

  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeDataSharesForConsumer</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the returned
  /// marker value in the <code>Marker</code> parameter and retrying the request.
  final String? marker;

  DescribeDataSharesForConsumerResult({
    this.dataShares,
    this.marker,
  });
  factory DescribeDataSharesForConsumerResult.fromXml(_s.XmlElement elem) {
    return DescribeDataSharesForConsumerResult(
      dataShares: _s.extractXmlChild(elem, 'DataShares')?.let((elem) =>
          elem.findElements('member').map(DataShare.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dataShares = this.dataShares;
    final marker = this.marker;
    return {
      if (dataShares != null) 'DataShares': dataShares,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeDataSharesForProducerResult {
  /// Shows the results of datashares available for producers.
  final List<DataShare>? dataShares;

  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeDataSharesForProducer</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the returned
  /// marker value in the <code>Marker</code> parameter and retrying the request.
  final String? marker;

  DescribeDataSharesForProducerResult({
    this.dataShares,
    this.marker,
  });
  factory DescribeDataSharesForProducerResult.fromXml(_s.XmlElement elem) {
    return DescribeDataSharesForProducerResult(
      dataShares: _s.extractXmlChild(elem, 'DataShares')?.let((elem) =>
          elem.findElements('member').map(DataShare.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dataShares = this.dataShares;
    final marker = this.marker;
    return {
      if (dataShares != null) 'DataShares': dataShares,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeDataSharesResult {
  /// The results returned from describing datashares.
  final List<DataShare>? dataShares;

  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeDataShares</a> request
  /// exceed the value specified in <code>MaxRecords</code>, Amazon Web Services
  /// returns a value in the <code>Marker</code> field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  final String? marker;

  DescribeDataSharesResult({
    this.dataShares,
    this.marker,
  });
  factory DescribeDataSharesResult.fromXml(_s.XmlElement elem) {
    return DescribeDataSharesResult(
      dataShares: _s.extractXmlChild(elem, 'DataShares')?.let((elem) =>
          elem.findElements('member').map(DataShare.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dataShares = this.dataShares;
    final marker = this.marker;
    return {
      if (dataShares != null) 'DataShares': dataShares,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeDefaultClusterParametersResult {
  final DefaultClusterParameters? defaultClusterParameters;

  DescribeDefaultClusterParametersResult({
    this.defaultClusterParameters,
  });
  factory DescribeDefaultClusterParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeDefaultClusterParametersResult(
      defaultClusterParameters: _s
          .extractXmlChild(elem, 'DefaultClusterParameters')
          ?.let(DefaultClusterParameters.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultClusterParameters = this.defaultClusterParameters;
    return {
      if (defaultClusterParameters != null)
        'DefaultClusterParameters': defaultClusterParameters,
    };
  }
}

class DescribePartnersOutputMessage {
  /// A list of partner integrations.
  final List<PartnerIntegrationInfo>? partnerIntegrationInfoList;

  DescribePartnersOutputMessage({
    this.partnerIntegrationInfoList,
  });
  factory DescribePartnersOutputMessage.fromXml(_s.XmlElement elem) {
    return DescribePartnersOutputMessage(
      partnerIntegrationInfoList: _s
          .extractXmlChild(elem, 'PartnerIntegrationInfoList')
          ?.let((elem) => elem
              .findElements('PartnerIntegrationInfo')
              .map(PartnerIntegrationInfo.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final partnerIntegrationInfoList = this.partnerIntegrationInfoList;
    return {
      if (partnerIntegrationInfoList != null)
        'PartnerIntegrationInfoList': partnerIntegrationInfoList,
    };
  }
}

class DescribeRedshiftIdcApplicationsResult {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the Marker parameter and retrying the command. If the Marker field is
  /// empty, all response records have been retrieved for the request.
  final String? marker;

  /// The list of Amazon Redshift IAM Identity Center applications.
  final List<RedshiftIdcApplication>? redshiftIdcApplications;

  DescribeRedshiftIdcApplicationsResult({
    this.marker,
    this.redshiftIdcApplications,
  });
  factory DescribeRedshiftIdcApplicationsResult.fromXml(_s.XmlElement elem) {
    return DescribeRedshiftIdcApplicationsResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      redshiftIdcApplications: _s
          .extractXmlChild(elem, 'RedshiftIdcApplications')
          ?.let((elem) => elem
              .findElements('member')
              .map(RedshiftIdcApplication.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final redshiftIdcApplications = this.redshiftIdcApplications;
    return {
      if (marker != null) 'Marker': marker,
      if (redshiftIdcApplications != null)
        'RedshiftIdcApplications': redshiftIdcApplications,
    };
  }
}

class DescribeReservedNodeExchangeStatusOutputMessage {
  /// A pagination token provided by a previous
  /// <code>DescribeReservedNodeExchangeStatus</code> request.
  final String? marker;

  /// The details of the reserved-node exchange request, including the status,
  /// request time, source reserved-node identifier, and additional details.
  final List<ReservedNodeExchangeStatus>? reservedNodeExchangeStatusDetails;

  DescribeReservedNodeExchangeStatusOutputMessage({
    this.marker,
    this.reservedNodeExchangeStatusDetails,
  });
  factory DescribeReservedNodeExchangeStatusOutputMessage.fromXml(
      _s.XmlElement elem) {
    return DescribeReservedNodeExchangeStatusOutputMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedNodeExchangeStatusDetails: _s
          .extractXmlChild(elem, 'ReservedNodeExchangeStatusDetails')
          ?.let((elem) => elem
              .findElements('ReservedNodeExchangeStatus')
              .map(ReservedNodeExchangeStatus.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedNodeExchangeStatusDetails =
        this.reservedNodeExchangeStatusDetails;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedNodeExchangeStatusDetails != null)
        'ReservedNodeExchangeStatusDetails': reservedNodeExchangeStatusDetails,
    };
  }
}

class DescribeSnapshotSchedulesOutputMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>marker</code> parameter and retrying the command. If the
  /// <code>marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of SnapshotSchedules.
  final List<SnapshotSchedule>? snapshotSchedules;

  DescribeSnapshotSchedulesOutputMessage({
    this.marker,
    this.snapshotSchedules,
  });
  factory DescribeSnapshotSchedulesOutputMessage.fromXml(_s.XmlElement elem) {
    return DescribeSnapshotSchedulesOutputMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      snapshotSchedules: _s.extractXmlChild(elem, 'SnapshotSchedules')?.let(
          (elem) => elem
              .findElements('SnapshotSchedule')
              .map(SnapshotSchedule.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final snapshotSchedules = this.snapshotSchedules;
    return {
      if (marker != null) 'Marker': marker,
      if (snapshotSchedules != null) 'SnapshotSchedules': snapshotSchedules,
    };
  }
}

class DisableSnapshotCopyResult {
  final Cluster? cluster;

  DisableSnapshotCopyResult({
    this.cluster,
  });
  factory DisableSnapshotCopyResult.fromXml(_s.XmlElement elem) {
    return DisableSnapshotCopyResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes an Amazon EC2 security group.
class EC2SecurityGroup {
  /// The name of the EC2 Security Group.
  final String? eC2SecurityGroupName;

  /// The Amazon Web Services account ID of the owner of the EC2 security group
  /// specified in the <code>EC2SecurityGroupName</code> field.
  final String? eC2SecurityGroupOwnerId;

  /// The status of the EC2 security group.
  final String? status;

  /// The list of tags for the EC2 security group.
  final List<Tag>? tags;

  EC2SecurityGroup({
    this.eC2SecurityGroupName,
    this.eC2SecurityGroupOwnerId,
    this.status,
    this.tags,
  });
  factory EC2SecurityGroup.fromXml(_s.XmlElement elem) {
    return EC2SecurityGroup(
      eC2SecurityGroupName:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupName'),
      eC2SecurityGroupOwnerId:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupOwnerId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final eC2SecurityGroupName = this.eC2SecurityGroupName;
    final eC2SecurityGroupOwnerId = this.eC2SecurityGroupOwnerId;
    final status = this.status;
    final tags = this.tags;
    return {
      if (eC2SecurityGroupName != null)
        'EC2SecurityGroupName': eC2SecurityGroupName,
      if (eC2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': eC2SecurityGroupOwnerId,
      if (status != null) 'Status': status,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes the status of the elastic IP (EIP) address.
class ElasticIpStatus {
  /// The elastic IP (EIP) address for the cluster.
  final String? elasticIp;

  /// The status of the elastic IP (EIP) address.
  final String? status;

  ElasticIpStatus({
    this.elasticIp,
    this.status,
  });
  factory ElasticIpStatus.fromXml(_s.XmlElement elem) {
    return ElasticIpStatus(
      elasticIp: _s.extractXmlStringValue(elem, 'ElasticIp'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final elasticIp = this.elasticIp;
    final status = this.status;
    return {
      if (elasticIp != null) 'ElasticIp': elasticIp,
      if (status != null) 'Status': status,
    };
  }
}

class EnableSnapshotCopyResult {
  final Cluster? cluster;

  EnableSnapshotCopyResult({
    this.cluster,
  });
  factory EnableSnapshotCopyResult.fromXml(_s.XmlElement elem) {
    return EnableSnapshotCopyResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes a connection endpoint.
class Endpoint {
  /// The DNS address of the Cluster.
  final String? address;

  /// The port that the database engine is listening on.
  final int? port;

  /// Describes a connection endpoint.
  final List<VpcEndpoint>? vpcEndpoints;

  Endpoint({
    this.address,
    this.port,
    this.vpcEndpoints,
  });
  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      vpcEndpoints: _s.extractXmlChild(elem, 'VpcEndpoints')?.let((elem) =>
          elem.findElements('VpcEndpoint').map(VpcEndpoint.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    final vpcEndpoints = this.vpcEndpoints;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
      if (vpcEndpoints != null) 'VpcEndpoints': vpcEndpoints,
    };
  }
}

/// Describes a Redshift-managed VPC endpoint.
class EndpointAccess {
  /// The DNS address of the endpoint.
  final String? address;

  /// The cluster identifier of the cluster associated with the endpoint.
  final String? clusterIdentifier;

  /// The time (UTC) that the endpoint was created.
  final DateTime? endpointCreateTime;

  /// The name of the endpoint.
  final String? endpointName;

  /// The status of the endpoint.
  final String? endpointStatus;

  /// The port number on which the cluster accepts incoming connections.
  final int? port;

  /// The Amazon Web Services account ID of the owner of the cluster.
  final String? resourceOwner;

  /// The subnet group name where Amazon Redshift chooses to deploy the endpoint.
  final String? subnetGroupName;
  final VpcEndpoint? vpcEndpoint;

  /// The security groups associated with the endpoint.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  EndpointAccess({
    this.address,
    this.clusterIdentifier,
    this.endpointCreateTime,
    this.endpointName,
    this.endpointStatus,
    this.port,
    this.resourceOwner,
    this.subnetGroupName,
    this.vpcEndpoint,
    this.vpcSecurityGroups,
  });
  factory EndpointAccess.fromXml(_s.XmlElement elem) {
    return EndpointAccess(
      address: _s.extractXmlStringValue(elem, 'Address'),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      endpointCreateTime:
          _s.extractXmlDateTimeValue(elem, 'EndpointCreateTime'),
      endpointName: _s.extractXmlStringValue(elem, 'EndpointName'),
      endpointStatus: _s.extractXmlStringValue(elem, 'EndpointStatus'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      resourceOwner: _s.extractXmlStringValue(elem, 'ResourceOwner'),
      subnetGroupName: _s.extractXmlStringValue(elem, 'SubnetGroupName'),
      vpcEndpoint:
          _s.extractXmlChild(elem, 'VpcEndpoint')?.let(VpcEndpoint.fromXml),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroup')
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final clusterIdentifier = this.clusterIdentifier;
    final endpointCreateTime = this.endpointCreateTime;
    final endpointName = this.endpointName;
    final endpointStatus = this.endpointStatus;
    final port = this.port;
    final resourceOwner = this.resourceOwner;
    final subnetGroupName = this.subnetGroupName;
    final vpcEndpoint = this.vpcEndpoint;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (address != null) 'Address': address,
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (endpointCreateTime != null)
        'EndpointCreateTime': iso8601ToJson(endpointCreateTime),
      if (endpointName != null) 'EndpointName': endpointName,
      if (endpointStatus != null) 'EndpointStatus': endpointStatus,
      if (port != null) 'Port': port,
      if (resourceOwner != null) 'ResourceOwner': resourceOwner,
      if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      if (vpcEndpoint != null) 'VpcEndpoint': vpcEndpoint,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

class EndpointAccessList {
  /// The list of endpoints with access to the cluster.
  final List<EndpointAccess>? endpointAccessList;

  /// An optional pagination token provided by a previous
  /// <code>DescribeEndpointAccess</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by the <code>MaxRecords</code> parameter.
  final String? marker;

  EndpointAccessList({
    this.endpointAccessList,
    this.marker,
  });
  factory EndpointAccessList.fromXml(_s.XmlElement elem) {
    return EndpointAccessList(
      endpointAccessList: _s.extractXmlChild(elem, 'EndpointAccessList')?.let(
          (elem) =>
              elem.findElements('member').map(EndpointAccess.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointAccessList = this.endpointAccessList;
    final marker = this.marker;
    return {
      if (endpointAccessList != null) 'EndpointAccessList': endpointAccessList,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Describes an endpoint authorization for authorizing Redshift-managed VPC
/// endpoint access to a cluster across Amazon Web Services accounts.
class EndpointAuthorization {
  /// Indicates whether all VPCs in the grantee account are allowed access to the
  /// cluster.
  final bool? allowedAllVPCs;

  /// The VPCs allowed access to the cluster.
  final List<String>? allowedVPCs;

  /// The time (UTC) when the authorization was created.
  final DateTime? authorizeTime;

  /// The cluster identifier.
  final String? clusterIdentifier;

  /// The status of the cluster.
  final String? clusterStatus;

  /// The number of Redshift-managed VPC endpoints created for the authorization.
  final int? endpointCount;

  /// The Amazon Web Services account ID of the grantee of the cluster.
  final String? grantee;

  /// The Amazon Web Services account ID of the cluster owner.
  final String? grantor;

  /// The status of the authorization action.
  final AuthorizationStatus? status;

  EndpointAuthorization({
    this.allowedAllVPCs,
    this.allowedVPCs,
    this.authorizeTime,
    this.clusterIdentifier,
    this.clusterStatus,
    this.endpointCount,
    this.grantee,
    this.grantor,
    this.status,
  });
  factory EndpointAuthorization.fromXml(_s.XmlElement elem) {
    return EndpointAuthorization(
      allowedAllVPCs: _s.extractXmlBoolValue(elem, 'AllowedAllVPCs'),
      allowedVPCs: _s
          .extractXmlChild(elem, 'AllowedVPCs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'VpcIdentifier')),
      authorizeTime: _s.extractXmlDateTimeValue(elem, 'AuthorizeTime'),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      clusterStatus: _s.extractXmlStringValue(elem, 'ClusterStatus'),
      endpointCount: _s.extractXmlIntValue(elem, 'EndpointCount'),
      grantee: _s.extractXmlStringValue(elem, 'Grantee'),
      grantor: _s.extractXmlStringValue(elem, 'Grantor'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toAuthorizationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAllVPCs = this.allowedAllVPCs;
    final allowedVPCs = this.allowedVPCs;
    final authorizeTime = this.authorizeTime;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterStatus = this.clusterStatus;
    final endpointCount = this.endpointCount;
    final grantee = this.grantee;
    final grantor = this.grantor;
    final status = this.status;
    return {
      if (allowedAllVPCs != null) 'AllowedAllVPCs': allowedAllVPCs,
      if (allowedVPCs != null) 'AllowedVPCs': allowedVPCs,
      if (authorizeTime != null) 'AuthorizeTime': iso8601ToJson(authorizeTime),
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterStatus != null) 'ClusterStatus': clusterStatus,
      if (endpointCount != null) 'EndpointCount': endpointCount,
      if (grantee != null) 'Grantee': grantee,
      if (grantor != null) 'Grantor': grantor,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class EndpointAuthorizationList {
  /// The authorizations to an endpoint.
  final List<EndpointAuthorization>? endpointAuthorizationList;

  /// An optional pagination token provided by a previous
  /// <code>DescribeEndpointAuthorization</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by the <code>MaxRecords</code> parameter.
  final String? marker;

  EndpointAuthorizationList({
    this.endpointAuthorizationList,
    this.marker,
  });
  factory EndpointAuthorizationList.fromXml(_s.XmlElement elem) {
    return EndpointAuthorizationList(
      endpointAuthorizationList: _s
          .extractXmlChild(elem, 'EndpointAuthorizationList')
          ?.let((elem) => elem
              .findElements('member')
              .map(EndpointAuthorization.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointAuthorizationList = this.endpointAuthorizationList;
    final marker = this.marker;
    return {
      if (endpointAuthorizationList != null)
        'EndpointAuthorizationList': endpointAuthorizationList,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Describes an event.
class Event {
  /// The date and time of the event.
  final DateTime? date;

  /// A list of the event categories.
  ///
  /// Values: Configuration, Management, Monitoring, Security, Pending
  final List<String>? eventCategories;

  /// The identifier of the event.
  final String? eventId;

  /// The text of this event.
  final String? message;

  /// The severity of the event.
  ///
  /// Values: ERROR, INFO
  final String? severity;

  /// The identifier for the source of the event.
  final String? sourceIdentifier;

  /// The source type for this event.
  final SourceType? sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.eventId,
    this.message,
    this.severity,
    this.sourceIdentifier,
    this.sourceType,
  });
  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      eventId: _s.extractXmlStringValue(elem, 'EventId'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      severity: _s.extractXmlStringValue(elem, 'Severity'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final eventCategories = this.eventCategories;
    final eventId = this.eventId;
    final message = this.message;
    final severity = this.severity;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': iso8601ToJson(date),
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (eventId != null) 'EventId': eventId,
      if (message != null) 'Message': message,
      if (severity != null) 'Severity': severity,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

/// Describes event categories.
class EventCategoriesMap {
  /// The events in the event category.
  final List<EventInfoMap>? events;

  /// The source type, such as cluster or cluster-snapshot, that the returned
  /// categories belong to.
  final String? sourceType;

  EventCategoriesMap({
    this.events,
    this.sourceType,
  });
  factory EventCategoriesMap.fromXml(_s.XmlElement elem) {
    return EventCategoriesMap(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('EventInfoMap').map(EventInfoMap.fromXml).toList()),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final sourceType = this.sourceType;
    return {
      if (events != null) 'Events': events,
      if (sourceType != null) 'SourceType': sourceType,
    };
  }
}

/// <p/>
class EventCategoriesMessage {
  /// A list of event categories descriptions.
  final List<EventCategoriesMap>? eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  factory EventCategoriesMessage.fromXml(_s.XmlElement elem) {
    return EventCategoriesMessage(
      eventCategoriesMapList: _s
          .extractXmlChild(elem, 'EventCategoriesMapList')
          ?.let((elem) => elem
              .findElements('EventCategoriesMap')
              .map(EventCategoriesMap.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategoriesMapList = this.eventCategoriesMapList;
    return {
      if (eventCategoriesMapList != null)
        'EventCategoriesMapList': eventCategoriesMapList,
    };
  }
}

/// Describes event information.
class EventInfoMap {
  /// The category of an Amazon Redshift event.
  final List<String>? eventCategories;

  /// The description of an Amazon Redshift event.
  final String? eventDescription;

  /// The identifier of an Amazon Redshift event.
  final String? eventId;

  /// The severity of the event.
  ///
  /// Values: ERROR, INFO
  final String? severity;

  EventInfoMap({
    this.eventCategories,
    this.eventDescription,
    this.eventId,
    this.severity,
  });
  factory EventInfoMap.fromXml(_s.XmlElement elem) {
    return EventInfoMap(
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      eventDescription: _s.extractXmlStringValue(elem, 'EventDescription'),
      eventId: _s.extractXmlStringValue(elem, 'EventId'),
      severity: _s.extractXmlStringValue(elem, 'Severity'),
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategories = this.eventCategories;
    final eventDescription = this.eventDescription;
    final eventId = this.eventId;
    final severity = this.severity;
    return {
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (eventDescription != null) 'EventDescription': eventDescription,
      if (eventId != null) 'EventId': eventId,
      if (severity != null) 'Severity': severity,
    };
  }
}

/// Describes event subscriptions.
class EventSubscription {
  /// The name of the Amazon Redshift event notification subscription.
  final String? custSubscriptionId;

  /// The Amazon Web Services account associated with the Amazon Redshift event
  /// notification subscription.
  final String? customerAwsId;

  /// A boolean value indicating whether the subscription is enabled;
  /// <code>true</code> indicates that the subscription is enabled.
  final bool? enabled;

  /// The list of Amazon Redshift event categories specified in the event
  /// notification subscription.
  ///
  /// Values: Configuration, Management, Monitoring, Security, Pending
  final List<String>? eventCategoriesList;

  /// The event severity specified in the Amazon Redshift event notification
  /// subscription.
  ///
  /// Values: ERROR, INFO
  final String? severity;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event
  /// notification subscription.
  final String? snsTopicArn;

  /// A list of the sources that publish events to the Amazon Redshift event
  /// notification subscription.
  final List<String>? sourceIdsList;

  /// The source type of the events returned by the Amazon Redshift event
  /// notification, such as cluster, cluster-snapshot, cluster-parameter-group,
  /// cluster-security-group, or scheduled-action.
  final String? sourceType;

  /// The status of the Amazon Redshift event notification subscription.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Can be one of the following: active | no-permission | topic-not-exist
  /// </li>
  /// <li>
  /// The status "no-permission" indicates that Amazon Redshift no longer has
  /// permission to post to the Amazon SNS topic. The status "topic-not-exist"
  /// indicates that the topic was deleted after the subscription was created.
  /// </li>
  /// </ul>
  final String? status;

  /// The date and time the Amazon Redshift event notification subscription was
  /// created.
  final DateTime? subscriptionCreationTime;

  /// The list of tags for the event subscription.
  final List<Tag>? tags;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.severity,
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
    this.tags,
  });
  factory EventSubscription.fromXml(_s.XmlElement elem) {
    return EventSubscription(
      custSubscriptionId: _s.extractXmlStringValue(elem, 'CustSubscriptionId'),
      customerAwsId: _s.extractXmlStringValue(elem, 'CustomerAwsId'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      eventCategoriesList: _s
          .extractXmlChild(elem, 'EventCategoriesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      severity: _s.extractXmlStringValue(elem, 'Severity'),
      snsTopicArn: _s.extractXmlStringValue(elem, 'SnsTopicArn'),
      sourceIdsList: _s
          .extractXmlChild(elem, 'SourceIdsList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'SourceId')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      subscriptionCreationTime:
          _s.extractXmlDateTimeValue(elem, 'SubscriptionCreationTime'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final custSubscriptionId = this.custSubscriptionId;
    final customerAwsId = this.customerAwsId;
    final enabled = this.enabled;
    final eventCategoriesList = this.eventCategoriesList;
    final severity = this.severity;
    final snsTopicArn = this.snsTopicArn;
    final sourceIdsList = this.sourceIdsList;
    final sourceType = this.sourceType;
    final status = this.status;
    final subscriptionCreationTime = this.subscriptionCreationTime;
    final tags = this.tags;
    return {
      if (custSubscriptionId != null) 'CustSubscriptionId': custSubscriptionId,
      if (customerAwsId != null) 'CustomerAwsId': customerAwsId,
      if (enabled != null) 'Enabled': enabled,
      if (eventCategoriesList != null)
        'EventCategoriesList': eventCategoriesList,
      if (severity != null) 'Severity': severity,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sourceIdsList != null) 'SourceIdsList': sourceIdsList,
      if (sourceType != null) 'SourceType': sourceType,
      if (status != null) 'Status': status,
      if (subscriptionCreationTime != null)
        'SubscriptionCreationTime': iso8601ToJson(subscriptionCreationTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// <p/>
class EventSubscriptionsMessage {
  /// A list of event subscriptions.
  final List<EventSubscription>? eventSubscriptionsList;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  EventSubscriptionsMessage({
    this.eventSubscriptionsList,
    this.marker,
  });
  factory EventSubscriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: _s
          .extractXmlChild(elem, 'EventSubscriptionsList')
          ?.let((elem) => elem
              .findElements('EventSubscription')
              .map(EventSubscription.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscriptionsList = this.eventSubscriptionsList;
    final marker = this.marker;
    return {
      if (eventSubscriptionsList != null)
        'EventSubscriptionsList': eventSubscriptionsList,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class EventsMessage {
  /// A list of <code>Event</code> instances.
  final List<Event>? events;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  EventsMessage({
    this.events,
    this.marker,
  });
  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let(
          (elem) => elem.findElements('Event').map(Event.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final marker = this.marker;
    return {
      if (events != null) 'Events': events,
      if (marker != null) 'Marker': marker,
    };
  }
}

class FailoverPrimaryComputeResult {
  final Cluster? cluster;

  FailoverPrimaryComputeResult({
    this.cluster,
  });
  factory FailoverPrimaryComputeResult.fromXml(_s.XmlElement elem) {
    return FailoverPrimaryComputeResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class GetReservedNodeExchangeConfigurationOptionsOutputMessage {
  /// A pagination token provided by a previous
  /// <code>GetReservedNodeExchangeConfigurationOptions</code> request.
  final String? marker;

  /// the configuration options for the reserved-node exchange. These options
  /// include information about the source reserved node and target reserved node.
  /// Details include the node type, the price, the node count, and the offering
  /// type.
  final List<ReservedNodeConfigurationOption>?
      reservedNodeConfigurationOptionList;

  GetReservedNodeExchangeConfigurationOptionsOutputMessage({
    this.marker,
    this.reservedNodeConfigurationOptionList,
  });
  factory GetReservedNodeExchangeConfigurationOptionsOutputMessage.fromXml(
      _s.XmlElement elem) {
    return GetReservedNodeExchangeConfigurationOptionsOutputMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedNodeConfigurationOptionList: _s
          .extractXmlChild(elem, 'ReservedNodeConfigurationOptionList')
          ?.let((elem) => elem
              .findElements('ReservedNodeConfigurationOption')
              .map(ReservedNodeConfigurationOption.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedNodeConfigurationOptionList =
        this.reservedNodeConfigurationOptionList;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedNodeConfigurationOptionList != null)
        'ReservedNodeConfigurationOptionList':
            reservedNodeConfigurationOptionList,
    };
  }
}

class GetReservedNodeExchangeOfferingsOutputMessage {
  /// An optional parameter that specifies the starting point for returning a set
  /// of response records. When the results of a
  /// <code>GetReservedNodeExchangeOfferings</code> request exceed the value
  /// specified in MaxRecords, Amazon Redshift returns a value in the marker field
  /// of the response. You can retrieve the next set of response records by
  /// providing the returned marker value in the marker parameter and retrying the
  /// request.
  final String? marker;

  /// Returns an array of <a>ReservedNodeOffering</a> objects.
  final List<ReservedNodeOffering>? reservedNodeOfferings;

  GetReservedNodeExchangeOfferingsOutputMessage({
    this.marker,
    this.reservedNodeOfferings,
  });
  factory GetReservedNodeExchangeOfferingsOutputMessage.fromXml(
      _s.XmlElement elem) {
    return GetReservedNodeExchangeOfferingsOutputMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedNodeOfferings: _s
          .extractXmlChild(elem, 'ReservedNodeOfferings')
          ?.let((elem) => elem
              .findElements('ReservedNodeOffering')
              .map(ReservedNodeOffering.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedNodeOfferings = this.reservedNodeOfferings;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedNodeOfferings != null)
        'ReservedNodeOfferings': reservedNodeOfferings,
    };
  }
}

class GetResourcePolicyResult {
  /// The content of the resource policy.
  final ResourcePolicy? resourcePolicy;

  GetResourcePolicyResult({
    this.resourcePolicy,
  });
  factory GetResourcePolicyResult.fromXml(_s.XmlElement elem) {
    return GetResourcePolicyResult(
      resourcePolicy: _s
          .extractXmlChild(elem, 'ResourcePolicy')
          ?.let(ResourcePolicy.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

/// Returns information about an HSM client certificate. The certificate is
/// stored in a secure Hardware Storage Module (HSM), and used by the Amazon
/// Redshift cluster to encrypt data files.
class HsmClientCertificate {
  /// The identifier of the HSM client certificate.
  final String? hsmClientCertificateIdentifier;

  /// The public key that the Amazon Redshift cluster will use to connect to the
  /// HSM. You must register the public key in the HSM.
  final String? hsmClientCertificatePublicKey;

  /// The list of tags for the HSM client certificate.
  final List<Tag>? tags;

  HsmClientCertificate({
    this.hsmClientCertificateIdentifier,
    this.hsmClientCertificatePublicKey,
    this.tags,
  });
  factory HsmClientCertificate.fromXml(_s.XmlElement elem) {
    return HsmClientCertificate(
      hsmClientCertificateIdentifier:
          _s.extractXmlStringValue(elem, 'HsmClientCertificateIdentifier'),
      hsmClientCertificatePublicKey:
          _s.extractXmlStringValue(elem, 'HsmClientCertificatePublicKey'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmClientCertificateIdentifier = this.hsmClientCertificateIdentifier;
    final hsmClientCertificatePublicKey = this.hsmClientCertificatePublicKey;
    final tags = this.tags;
    return {
      if (hsmClientCertificateIdentifier != null)
        'HsmClientCertificateIdentifier': hsmClientCertificateIdentifier,
      if (hsmClientCertificatePublicKey != null)
        'HsmClientCertificatePublicKey': hsmClientCertificatePublicKey,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// <p/>
class HsmClientCertificateMessage {
  /// A list of the identifiers for one or more HSM client certificates used by
  /// Amazon Redshift clusters to store and retrieve database encryption keys in
  /// an HSM.
  final List<HsmClientCertificate>? hsmClientCertificates;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  HsmClientCertificateMessage({
    this.hsmClientCertificates,
    this.marker,
  });
  factory HsmClientCertificateMessage.fromXml(_s.XmlElement elem) {
    return HsmClientCertificateMessage(
      hsmClientCertificates: _s
          .extractXmlChild(elem, 'HsmClientCertificates')
          ?.let((elem) => elem
              .findElements('HsmClientCertificate')
              .map(HsmClientCertificate.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmClientCertificates = this.hsmClientCertificates;
    final marker = this.marker;
    return {
      if (hsmClientCertificates != null)
        'HsmClientCertificates': hsmClientCertificates,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Returns information about an HSM configuration, which is an object that
/// describes to Amazon Redshift clusters the information they require to
/// connect to an HSM where they can store database encryption keys.
class HsmConfiguration {
  /// A text description of the HSM configuration.
  final String? description;

  /// The name of the Amazon Redshift HSM configuration.
  final String? hsmConfigurationIdentifier;

  /// The IP address that the Amazon Redshift cluster must use to access the HSM.
  final String? hsmIpAddress;

  /// The name of the partition in the HSM where the Amazon Redshift clusters will
  /// store their database encryption keys.
  final String? hsmPartitionName;

  /// The list of tags for the HSM configuration.
  final List<Tag>? tags;

  HsmConfiguration({
    this.description,
    this.hsmConfigurationIdentifier,
    this.hsmIpAddress,
    this.hsmPartitionName,
    this.tags,
  });
  factory HsmConfiguration.fromXml(_s.XmlElement elem) {
    return HsmConfiguration(
      description: _s.extractXmlStringValue(elem, 'Description'),
      hsmConfigurationIdentifier:
          _s.extractXmlStringValue(elem, 'HsmConfigurationIdentifier'),
      hsmIpAddress: _s.extractXmlStringValue(elem, 'HsmIpAddress'),
      hsmPartitionName: _s.extractXmlStringValue(elem, 'HsmPartitionName'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final hsmConfigurationIdentifier = this.hsmConfigurationIdentifier;
    final hsmIpAddress = this.hsmIpAddress;
    final hsmPartitionName = this.hsmPartitionName;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (hsmConfigurationIdentifier != null)
        'HsmConfigurationIdentifier': hsmConfigurationIdentifier,
      if (hsmIpAddress != null) 'HsmIpAddress': hsmIpAddress,
      if (hsmPartitionName != null) 'HsmPartitionName': hsmPartitionName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// <p/>
class HsmConfigurationMessage {
  /// A list of <code>HsmConfiguration</code> objects.
  final List<HsmConfiguration>? hsmConfigurations;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  HsmConfigurationMessage({
    this.hsmConfigurations,
    this.marker,
  });
  factory HsmConfigurationMessage.fromXml(_s.XmlElement elem) {
    return HsmConfigurationMessage(
      hsmConfigurations: _s.extractXmlChild(elem, 'HsmConfigurations')?.let(
          (elem) => elem
              .findElements('HsmConfiguration')
              .map(HsmConfiguration.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmConfigurations = this.hsmConfigurations;
    final marker = this.marker;
    return {
      if (hsmConfigurations != null) 'HsmConfigurations': hsmConfigurations,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Describes the status of changes to HSM settings.
class HsmStatus {
  /// Specifies the name of the HSM client certificate the Amazon Redshift cluster
  /// uses to retrieve the data encryption keys stored in an HSM.
  final String? hsmClientCertificateIdentifier;

  /// Specifies the name of the HSM configuration that contains the information
  /// the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  final String? hsmConfigurationIdentifier;

  /// Reports whether the Amazon Redshift cluster has finished applying any HSM
  /// settings changes specified in a modify cluster command.
  ///
  /// Values: active, applying
  final String? status;

  HsmStatus({
    this.hsmClientCertificateIdentifier,
    this.hsmConfigurationIdentifier,
    this.status,
  });
  factory HsmStatus.fromXml(_s.XmlElement elem) {
    return HsmStatus(
      hsmClientCertificateIdentifier:
          _s.extractXmlStringValue(elem, 'HsmClientCertificateIdentifier'),
      hsmConfigurationIdentifier:
          _s.extractXmlStringValue(elem, 'HsmConfigurationIdentifier'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final hsmClientCertificateIdentifier = this.hsmClientCertificateIdentifier;
    final hsmConfigurationIdentifier = this.hsmConfigurationIdentifier;
    final status = this.status;
    return {
      if (hsmClientCertificateIdentifier != null)
        'HsmClientCertificateIdentifier': hsmClientCertificateIdentifier,
      if (hsmConfigurationIdentifier != null)
        'HsmConfigurationIdentifier': hsmConfigurationIdentifier,
      if (status != null) 'Status': status,
    };
  }
}

/// Describes an IP range used in a security group.
class IPRange {
  /// The IP range in Classless Inter-Domain Routing (CIDR) notation.
  final String? cidrip;

  /// The status of the IP range, for example, "authorized".
  final String? status;

  /// The list of tags for the IP range.
  final List<Tag>? tags;

  IPRange({
    this.cidrip,
    this.status,
    this.tags,
  });
  factory IPRange.fromXml(_s.XmlElement elem) {
    return IPRange(
      cidrip: _s.extractXmlStringValue(elem, 'CIDRIP'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrip = this.cidrip;
    final status = this.status;
    final tags = this.tags;
    return {
      if (cidrip != null) 'CIDRIP': cidrip,
      if (status != null) 'Status': status,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ImpactRankingType {
  high,
  medium,
  low,
}

extension ImpactRankingTypeValueExtension on ImpactRankingType {
  String toValue() {
    switch (this) {
      case ImpactRankingType.high:
        return 'HIGH';
      case ImpactRankingType.medium:
        return 'MEDIUM';
      case ImpactRankingType.low:
        return 'LOW';
    }
  }
}

extension ImpactRankingTypeFromString on String {
  ImpactRankingType toImpactRankingType() {
    switch (this) {
      case 'HIGH':
        return ImpactRankingType.high;
      case 'MEDIUM':
        return ImpactRankingType.medium;
      case 'LOW':
        return ImpactRankingType.low;
    }
    throw Exception('$this is not known in enum ImpactRankingType');
  }
}

/// The content of an inbound integration.
class InboundIntegration {
  /// The creation time of an inbound integration.
  final DateTime? createTime;

  /// The outstanding errors of an inbound integration. Each item is an
  /// "IntegrationError". This is null if there is no error.
  final List<IntegrationError>? errors;

  /// The Amazon Resource Name (ARN) of an inbound integration.
  final String? integrationArn;

  /// The Amazon Resource Name (ARN) of the source of an inbound integration.
  final String? sourceArn;

  /// The status of an inbound integration.
  final ZeroETLIntegrationStatus? status;

  /// The Amazon Resource Name (ARN) of the target of an inbound integration.
  final String? targetArn;

  InboundIntegration({
    this.createTime,
    this.errors,
    this.integrationArn,
    this.sourceArn,
    this.status,
    this.targetArn,
  });
  factory InboundIntegration.fromXml(_s.XmlElement elem) {
    return InboundIntegration(
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime'),
      errors: _s.extractXmlChild(elem, 'Errors')?.let((elem) => elem
          .findElements('IntegrationError')
          .map(IntegrationError.fromXml)
          .toList()),
      integrationArn: _s.extractXmlStringValue(elem, 'IntegrationArn'),
      sourceArn: _s.extractXmlStringValue(elem, 'SourceArn'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toZeroETLIntegrationStatus(),
      targetArn: _s.extractXmlStringValue(elem, 'TargetArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final errors = this.errors;
    final integrationArn = this.integrationArn;
    final sourceArn = this.sourceArn;
    final status = this.status;
    final targetArn = this.targetArn;
    return {
      if (createTime != null) 'CreateTime': iso8601ToJson(createTime),
      if (errors != null) 'Errors': errors,
      if (integrationArn != null) 'IntegrationArn': integrationArn,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (status != null) 'Status': status.toValue(),
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

class InboundIntegrationsMessage {
  /// A list of <a>InboundIntegration</a> instances.
  final List<InboundIntegration>? inboundIntegrations;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  InboundIntegrationsMessage({
    this.inboundIntegrations,
    this.marker,
  });
  factory InboundIntegrationsMessage.fromXml(_s.XmlElement elem) {
    return InboundIntegrationsMessage(
      inboundIntegrations: _s.extractXmlChild(elem, 'InboundIntegrations')?.let(
          (elem) => elem
              .findElements('InboundIntegration')
              .map(InboundIntegration.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final inboundIntegrations = this.inboundIntegrations;
    final marker = this.marker;
    return {
      if (inboundIntegrations != null)
        'InboundIntegrations': inboundIntegrations,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// The error of an inbound integration.
class IntegrationError {
  /// The error code of an inbound integration error.
  final String errorCode;

  /// The error message of an inbound integration error.
  final String? errorMessage;

  IntegrationError({
    required this.errorCode,
    this.errorMessage,
  });
  factory IntegrationError.fromXml(_s.XmlElement elem) {
    return IntegrationError(
      errorCode: _s.extractXmlStringValue(elem, 'ErrorCode')!,
      errorMessage: _s.extractXmlStringValue(elem, 'ErrorMessage'),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// The Lake Formation scope.
class LakeFormationQuery {
  /// Determines whether the query scope is enabled or disabled.
  final ServiceAuthorization authorization;

  LakeFormationQuery({
    required this.authorization,
  });
  factory LakeFormationQuery.fromXml(_s.XmlElement elem) {
    return LakeFormationQuery(
      authorization: _s
          .extractXmlStringValue(elem, 'Authorization')!
          .toServiceAuthorization(),
    );
  }

  Map<String, dynamic> toJson() {
    final authorization = this.authorization;
    return {
      'Authorization': authorization.toValue(),
    };
  }
}

/// A list of scopes set up for Lake Formation integration.
class LakeFormationScopeUnion {
  /// The Lake Formation scope.
  final LakeFormationQuery? lakeFormationQuery;

  LakeFormationScopeUnion({
    this.lakeFormationQuery,
  });
  factory LakeFormationScopeUnion.fromXml(_s.XmlElement elem) {
    return LakeFormationScopeUnion(
      lakeFormationQuery: _s
          .extractXmlChild(elem, 'LakeFormationQuery')
          ?.let(LakeFormationQuery.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final lakeFormationQuery = this.lakeFormationQuery;
    return {
      if (lakeFormationQuery != null) 'LakeFormationQuery': lakeFormationQuery,
    };
  }
}

class ListRecommendationsResult {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the Marker parameter and retrying the command. If the Marker field is
  /// empty, all response records have been retrieved for the request.
  final String? marker;

  /// The Advisor recommendations for action on the Amazon Redshift cluster.
  final List<Recommendation>? recommendations;

  ListRecommendationsResult({
    this.marker,
    this.recommendations,
  });
  factory ListRecommendationsResult.fromXml(_s.XmlElement elem) {
    return ListRecommendationsResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      recommendations: _s.extractXmlChild(elem, 'Recommendations')?.let(
          (elem) => elem
              .findElements('Recommendation')
              .map(Recommendation.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final recommendations = this.recommendations;
    return {
      if (marker != null) 'Marker': marker,
      if (recommendations != null) 'Recommendations': recommendations,
    };
  }
}

enum LogDestinationType {
  s3,
  cloudwatch,
}

extension LogDestinationTypeValueExtension on LogDestinationType {
  String toValue() {
    switch (this) {
      case LogDestinationType.s3:
        return 's3';
      case LogDestinationType.cloudwatch:
        return 'cloudwatch';
    }
  }
}

extension LogDestinationTypeFromString on String {
  LogDestinationType toLogDestinationType() {
    switch (this) {
      case 's3':
        return LogDestinationType.s3;
      case 'cloudwatch':
        return LogDestinationType.cloudwatch;
    }
    throw Exception('$this is not known in enum LogDestinationType');
  }
}

/// Describes the status of logging for a cluster.
class LoggingStatus {
  /// The name of the S3 bucket where the log files are stored.
  final String? bucketName;

  /// The message indicating that logs failed to be delivered.
  final String? lastFailureMessage;

  /// The last time when logs failed to be delivered.
  final DateTime? lastFailureTime;

  /// The last time that logs were delivered.
  final DateTime? lastSuccessfulDeliveryTime;

  /// The log destination type. An enum with possible values of <code>s3</code>
  /// and <code>cloudwatch</code>.
  final LogDestinationType? logDestinationType;

  /// The collection of exported log types. Possible values are
  /// <code>connectionlog</code>, <code>useractivitylog</code>, and
  /// <code>userlog</code>.
  final List<String>? logExports;

  /// <code>true</code> if logging is on, <code>false</code> if logging is off.
  final bool? loggingEnabled;

  /// The prefix applied to the log file names.
  final String? s3KeyPrefix;

  LoggingStatus({
    this.bucketName,
    this.lastFailureMessage,
    this.lastFailureTime,
    this.lastSuccessfulDeliveryTime,
    this.logDestinationType,
    this.logExports,
    this.loggingEnabled,
    this.s3KeyPrefix,
  });
  factory LoggingStatus.fromXml(_s.XmlElement elem) {
    return LoggingStatus(
      bucketName: _s.extractXmlStringValue(elem, 'BucketName'),
      lastFailureMessage: _s.extractXmlStringValue(elem, 'LastFailureMessage'),
      lastFailureTime: _s.extractXmlDateTimeValue(elem, 'LastFailureTime'),
      lastSuccessfulDeliveryTime:
          _s.extractXmlDateTimeValue(elem, 'LastSuccessfulDeliveryTime'),
      logDestinationType: _s
          .extractXmlStringValue(elem, 'LogDestinationType')
          ?.toLogDestinationType(),
      logExports: _s
          .extractXmlChild(elem, 'LogExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      loggingEnabled: _s.extractXmlBoolValue(elem, 'LoggingEnabled'),
      s3KeyPrefix: _s.extractXmlStringValue(elem, 'S3KeyPrefix'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final lastFailureMessage = this.lastFailureMessage;
    final lastFailureTime = this.lastFailureTime;
    final lastSuccessfulDeliveryTime = this.lastSuccessfulDeliveryTime;
    final logDestinationType = this.logDestinationType;
    final logExports = this.logExports;
    final loggingEnabled = this.loggingEnabled;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (lastFailureMessage != null) 'LastFailureMessage': lastFailureMessage,
      if (lastFailureTime != null)
        'LastFailureTime': iso8601ToJson(lastFailureTime),
      if (lastSuccessfulDeliveryTime != null)
        'LastSuccessfulDeliveryTime': iso8601ToJson(lastSuccessfulDeliveryTime),
      if (logDestinationType != null)
        'LogDestinationType': logDestinationType.toValue(),
      if (logExports != null) 'LogExports': logExports,
      if (loggingEnabled != null) 'LoggingEnabled': loggingEnabled,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// Defines a maintenance track that determines which Amazon Redshift version to
/// apply during a maintenance window. If the value for
/// <code>MaintenanceTrack</code> is <code>current</code>, the cluster is
/// updated to the most recently certified maintenance release. If the value is
/// <code>trailing</code>, the cluster is updated to the previously certified
/// maintenance release.
class MaintenanceTrack {
  /// The version number for the cluster release.
  final String? databaseVersion;

  /// The name of the maintenance track. Possible values are <code>current</code>
  /// and <code>trailing</code>.
  final String? maintenanceTrackName;

  /// An array of <a>UpdateTarget</a> objects to update with the maintenance
  /// track.
  final List<UpdateTarget>? updateTargets;

  MaintenanceTrack({
    this.databaseVersion,
    this.maintenanceTrackName,
    this.updateTargets,
  });
  factory MaintenanceTrack.fromXml(_s.XmlElement elem) {
    return MaintenanceTrack(
      databaseVersion: _s.extractXmlStringValue(elem, 'DatabaseVersion'),
      maintenanceTrackName:
          _s.extractXmlStringValue(elem, 'MaintenanceTrackName'),
      updateTargets: _s.extractXmlChild(elem, 'UpdateTargets')?.let((elem) =>
          elem.findElements('UpdateTarget').map(UpdateTarget.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseVersion = this.databaseVersion;
    final maintenanceTrackName = this.maintenanceTrackName;
    final updateTargets = this.updateTargets;
    return {
      if (databaseVersion != null) 'DatabaseVersion': databaseVersion,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (updateTargets != null) 'UpdateTargets': updateTargets,
    };
  }
}

enum Mode {
  standard,
  highPerformance,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.standard:
        return 'standard';
      case Mode.highPerformance:
        return 'high-performance';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'standard':
        return Mode.standard;
      case 'high-performance':
        return Mode.highPerformance;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

class ModifyAquaOutputMessage {
  /// This parameter is retired. Amazon Redshift automatically determines whether
  /// to use AQUA (Advanced Query Accelerator).
  final AquaConfiguration? aquaConfiguration;

  ModifyAquaOutputMessage({
    this.aquaConfiguration,
  });
  factory ModifyAquaOutputMessage.fromXml(_s.XmlElement elem) {
    return ModifyAquaOutputMessage(
      aquaConfiguration: _s
          .extractXmlChild(elem, 'AquaConfiguration')
          ?.let(AquaConfiguration.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final aquaConfiguration = this.aquaConfiguration;
    return {
      if (aquaConfiguration != null) 'AquaConfiguration': aquaConfiguration,
    };
  }
}

class ModifyAuthenticationProfileResult {
  /// The updated content of the authentication profile in JSON format.
  final String? authenticationProfileContent;

  /// The name of the authentication profile that was replaced.
  final String? authenticationProfileName;

  ModifyAuthenticationProfileResult({
    this.authenticationProfileContent,
    this.authenticationProfileName,
  });
  factory ModifyAuthenticationProfileResult.fromXml(_s.XmlElement elem) {
    return ModifyAuthenticationProfileResult(
      authenticationProfileContent:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileContent'),
      authenticationProfileName:
          _s.extractXmlStringValue(elem, 'AuthenticationProfileName'),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProfileContent = this.authenticationProfileContent;
    final authenticationProfileName = this.authenticationProfileName;
    return {
      if (authenticationProfileContent != null)
        'AuthenticationProfileContent': authenticationProfileContent,
      if (authenticationProfileName != null)
        'AuthenticationProfileName': authenticationProfileName,
    };
  }
}

class ModifyClusterDbRevisionResult {
  final Cluster? cluster;

  ModifyClusterDbRevisionResult({
    this.cluster,
  });
  factory ModifyClusterDbRevisionResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterDbRevisionResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class ModifyClusterIamRolesResult {
  final Cluster? cluster;

  ModifyClusterIamRolesResult({
    this.cluster,
  });
  factory ModifyClusterIamRolesResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterIamRolesResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class ModifyClusterMaintenanceResult {
  final Cluster? cluster;

  ModifyClusterMaintenanceResult({
    this.cluster,
  });
  factory ModifyClusterMaintenanceResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterMaintenanceResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class ModifyClusterResult {
  final Cluster? cluster;

  ModifyClusterResult({
    this.cluster,
  });
  factory ModifyClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class ModifyClusterSnapshotResult {
  final Snapshot? snapshot;

  ModifyClusterSnapshotResult({
    this.snapshot,
  });
  factory ModifyClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class ModifyClusterSubnetGroupResult {
  final ClusterSubnetGroup? clusterSubnetGroup;

  ModifyClusterSubnetGroupResult({
    this.clusterSubnetGroup,
  });
  factory ModifyClusterSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyClusterSubnetGroupResult(
      clusterSubnetGroup: _s
          .extractXmlChild(elem, 'ClusterSubnetGroup')
          ?.let(ClusterSubnetGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSubnetGroup = this.clusterSubnetGroup;
    return {
      if (clusterSubnetGroup != null) 'ClusterSubnetGroup': clusterSubnetGroup,
    };
  }
}

class ModifyCustomDomainAssociationResult {
  /// The identifier of the cluster associated with the result for the changed
  /// custom domain association.
  final String? clusterIdentifier;

  /// The certificate expiration time associated with the result for the changed
  /// custom domain association.
  final String? customDomainCertExpiryTime;

  /// The certificate Amazon Resource Name (ARN) associated with the result for
  /// the changed custom domain association.
  final String? customDomainCertificateArn;

  /// The custom domain name associated with the result for the changed custom
  /// domain association.
  final String? customDomainName;

  ModifyCustomDomainAssociationResult({
    this.clusterIdentifier,
    this.customDomainCertExpiryTime,
    this.customDomainCertificateArn,
    this.customDomainName,
  });
  factory ModifyCustomDomainAssociationResult.fromXml(_s.XmlElement elem) {
    return ModifyCustomDomainAssociationResult(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      customDomainCertExpiryTime:
          _s.extractXmlStringValue(elem, 'CustomDomainCertExpiryTime'),
      customDomainCertificateArn:
          _s.extractXmlStringValue(elem, 'CustomDomainCertificateArn'),
      customDomainName: _s.extractXmlStringValue(elem, 'CustomDomainName'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final customDomainCertExpiryTime = this.customDomainCertExpiryTime;
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainName = this.customDomainName;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (customDomainCertExpiryTime != null)
        'CustomDomainCertExpiryTime': customDomainCertExpiryTime,
      if (customDomainCertificateArn != null)
        'CustomDomainCertificateArn': customDomainCertificateArn,
      if (customDomainName != null) 'CustomDomainName': customDomainName,
    };
  }
}

class ModifyEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class ModifyRedshiftIdcApplicationResult {
  final RedshiftIdcApplication? redshiftIdcApplication;

  ModifyRedshiftIdcApplicationResult({
    this.redshiftIdcApplication,
  });
  factory ModifyRedshiftIdcApplicationResult.fromXml(_s.XmlElement elem) {
    return ModifyRedshiftIdcApplicationResult(
      redshiftIdcApplication: _s
          .extractXmlChild(elem, 'RedshiftIdcApplication')
          ?.let(RedshiftIdcApplication.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final redshiftIdcApplication = this.redshiftIdcApplication;
    return {
      if (redshiftIdcApplication != null)
        'RedshiftIdcApplication': redshiftIdcApplication,
    };
  }
}

class ModifySnapshotCopyRetentionPeriodResult {
  final Cluster? cluster;

  ModifySnapshotCopyRetentionPeriodResult({
    this.cluster,
  });
  factory ModifySnapshotCopyRetentionPeriodResult.fromXml(_s.XmlElement elem) {
    return ModifySnapshotCopyRetentionPeriodResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes a network interface.
class NetworkInterface {
  /// The Availability Zone.
  final String? availabilityZone;

  /// The IPv6 address of the network interface within the subnet.
  final String? ipv6Address;

  /// The network interface identifier.
  final String? networkInterfaceId;

  /// The IPv4 address of the network interface within the subnet.
  final String? privateIpAddress;

  /// The subnet identifier.
  final String? subnetId;

  NetworkInterface({
    this.availabilityZone,
    this.ipv6Address,
    this.networkInterfaceId,
    this.privateIpAddress,
    this.subnetId,
  });
  factory NetworkInterface.fromXml(_s.XmlElement elem) {
    return NetworkInterface(
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      ipv6Address: _s.extractXmlStringValue(elem, 'Ipv6Address'),
      networkInterfaceId: _s.extractXmlStringValue(elem, 'NetworkInterfaceId'),
      privateIpAddress: _s.extractXmlStringValue(elem, 'PrivateIpAddress'),
      subnetId: _s.extractXmlStringValue(elem, 'SubnetId'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final ipv6Address = this.ipv6Address;
    final networkInterfaceId = this.networkInterfaceId;
    final privateIpAddress = this.privateIpAddress;
    final subnetId = this.subnetId;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (ipv6Address != null) 'Ipv6Address': ipv6Address,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// A list of node configurations.
class NodeConfigurationOption {
  /// The estimated disk utilizaton percentage.
  final double? estimatedDiskUtilizationPercent;

  /// The category of the node configuration recommendation.
  final Mode? mode;

  /// The node type, such as, "ds2.8xlarge".
  final String? nodeType;

  /// The number of nodes.
  final int? numberOfNodes;

  NodeConfigurationOption({
    this.estimatedDiskUtilizationPercent,
    this.mode,
    this.nodeType,
    this.numberOfNodes,
  });
  factory NodeConfigurationOption.fromXml(_s.XmlElement elem) {
    return NodeConfigurationOption(
      estimatedDiskUtilizationPercent:
          _s.extractXmlDoubleValue(elem, 'EstimatedDiskUtilizationPercent'),
      mode: _s.extractXmlStringValue(elem, 'Mode')?.toMode(),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      numberOfNodes: _s.extractXmlIntValue(elem, 'NumberOfNodes'),
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedDiskUtilizationPercent =
        this.estimatedDiskUtilizationPercent;
    final mode = this.mode;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    return {
      if (estimatedDiskUtilizationPercent != null)
        'EstimatedDiskUtilizationPercent': estimatedDiskUtilizationPercent,
      if (mode != null) 'Mode': mode.toValue(),
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
    };
  }
}

/// A set of elements to filter the returned node configurations.
class NodeConfigurationOptionsFilter {
  /// The name of the element to filter.
  final NodeConfigurationOptionsFilterName? name;

  /// The filter operator. If filter Name is NodeType only the 'in' operator is
  /// supported. Provide one value to evaluate for 'eq', 'lt', 'le', 'gt', and
  /// 'ge'. Provide two values to evaluate for 'between'. Provide a list of values
  /// for 'in'.
  final OperatorType? operator;

  /// List of values. Compare Name using Operator to Values. If filter Name is
  /// NumberOfNodes, then values can range from 0 to 200. If filter Name is
  /// EstimatedDiskUtilizationPercent, then values can range from 0 to 100. For
  /// example, filter NumberOfNodes (name) GT (operator) 3 (values).
  final List<String>? values;

  NodeConfigurationOptionsFilter({
    this.name,
    this.operator,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (operator != null) 'Operator': operator.toValue(),
      if (values != null) 'Value': values,
    };
  }
}

enum NodeConfigurationOptionsFilterName {
  nodeType,
  numberOfNodes,
  estimatedDiskUtilizationPercent,
  mode,
}

extension NodeConfigurationOptionsFilterNameValueExtension
    on NodeConfigurationOptionsFilterName {
  String toValue() {
    switch (this) {
      case NodeConfigurationOptionsFilterName.nodeType:
        return 'NodeType';
      case NodeConfigurationOptionsFilterName.numberOfNodes:
        return 'NumberOfNodes';
      case NodeConfigurationOptionsFilterName.estimatedDiskUtilizationPercent:
        return 'EstimatedDiskUtilizationPercent';
      case NodeConfigurationOptionsFilterName.mode:
        return 'Mode';
    }
  }
}

extension NodeConfigurationOptionsFilterNameFromString on String {
  NodeConfigurationOptionsFilterName toNodeConfigurationOptionsFilterName() {
    switch (this) {
      case 'NodeType':
        return NodeConfigurationOptionsFilterName.nodeType;
      case 'NumberOfNodes':
        return NodeConfigurationOptionsFilterName.numberOfNodes;
      case 'EstimatedDiskUtilizationPercent':
        return NodeConfigurationOptionsFilterName
            .estimatedDiskUtilizationPercent;
      case 'Mode':
        return NodeConfigurationOptionsFilterName.mode;
    }
    throw Exception(
        '$this is not known in enum NodeConfigurationOptionsFilterName');
  }
}

class NodeConfigurationOptionsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of valid node configurations.
  final List<NodeConfigurationOption>? nodeConfigurationOptionList;

  NodeConfigurationOptionsMessage({
    this.marker,
    this.nodeConfigurationOptionList,
  });
  factory NodeConfigurationOptionsMessage.fromXml(_s.XmlElement elem) {
    return NodeConfigurationOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      nodeConfigurationOptionList: _s
          .extractXmlChild(elem, 'NodeConfigurationOptionList')
          ?.let((elem) => elem
              .findElements('NodeConfigurationOption')
              .map(NodeConfigurationOption.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final nodeConfigurationOptionList = this.nodeConfigurationOptionList;
    return {
      if (marker != null) 'Marker': marker,
      if (nodeConfigurationOptionList != null)
        'NodeConfigurationOptionList': nodeConfigurationOptionList,
    };
  }
}

enum OperatorType {
  eq,
  lt,
  gt,
  le,
  ge,
  $in,
  between,
}

extension OperatorTypeValueExtension on OperatorType {
  String toValue() {
    switch (this) {
      case OperatorType.eq:
        return 'eq';
      case OperatorType.lt:
        return 'lt';
      case OperatorType.gt:
        return 'gt';
      case OperatorType.le:
        return 'le';
      case OperatorType.ge:
        return 'ge';
      case OperatorType.$in:
        return 'in';
      case OperatorType.between:
        return 'between';
    }
  }
}

extension OperatorTypeFromString on String {
  OperatorType toOperatorType() {
    switch (this) {
      case 'eq':
        return OperatorType.eq;
      case 'lt':
        return OperatorType.lt;
      case 'gt':
        return OperatorType.gt;
      case 'le':
        return OperatorType.le;
      case 'ge':
        return OperatorType.ge;
      case 'in':
        return OperatorType.$in;
      case 'between':
        return OperatorType.between;
    }
    throw Exception('$this is not known in enum OperatorType');
  }
}

/// Describes an orderable cluster option.
class OrderableClusterOption {
  /// A list of availability zones for the orderable cluster.
  final List<AvailabilityZone>? availabilityZones;

  /// The cluster type, for example <code>multi-node</code>.
  final String? clusterType;

  /// The version of the orderable cluster.
  final String? clusterVersion;

  /// The node type for the orderable cluster.
  final String? nodeType;

  OrderableClusterOption({
    this.availabilityZones,
    this.clusterType,
    this.clusterVersion,
    this.nodeType,
  });
  factory OrderableClusterOption.fromXml(_s.XmlElement elem) {
    return OrderableClusterOption(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('AvailabilityZone')
              .map(AvailabilityZone.fromXml)
              .toList()),
      clusterType: _s.extractXmlStringValue(elem, 'ClusterType'),
      clusterVersion: _s.extractXmlStringValue(elem, 'ClusterVersion'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final clusterType = this.clusterType;
    final clusterVersion = this.clusterVersion;
    final nodeType = this.nodeType;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (clusterType != null) 'ClusterType': clusterType,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (nodeType != null) 'NodeType': nodeType,
    };
  }
}

/// Contains the output from the <a>DescribeOrderableClusterOptions</a> action.
class OrderableClusterOptionsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// An <code>OrderableClusterOption</code> structure containing information
  /// about orderable options for the cluster.
  final List<OrderableClusterOption>? orderableClusterOptions;

  OrderableClusterOptionsMessage({
    this.marker,
    this.orderableClusterOptions,
  });
  factory OrderableClusterOptionsMessage.fromXml(_s.XmlElement elem) {
    return OrderableClusterOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      orderableClusterOptions: _s
          .extractXmlChild(elem, 'OrderableClusterOptions')
          ?.let((elem) => elem
              .findElements('OrderableClusterOption')
              .map(OrderableClusterOption.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final orderableClusterOptions = this.orderableClusterOptions;
    return {
      if (marker != null) 'Marker': marker,
      if (orderableClusterOptions != null)
        'OrderableClusterOptions': orderableClusterOptions,
    };
  }
}

/// Describes a parameter in a cluster parameter group.
class Parameter {
  /// The valid range of values for the parameter.
  final String? allowedValues;

  /// Specifies how to apply the WLM configuration parameter. Some properties can
  /// be applied dynamically, while other properties require that any associated
  /// clusters be rebooted for the configuration changes to be applied. For more
  /// information about parameters and parameter groups, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon
  /// Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management
  /// Guide</i>.
  final ParameterApplyType? applyType;

  /// The data type of the parameter.
  final String? dataType;

  /// A description of the parameter.
  final String? description;

  /// If <code>true</code>, the parameter can be modified. Some parameters have
  /// security or operational implications that prevent them from being changed.
  final bool? isModifiable;

  /// The earliest engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// The name of the parameter.
  final String? parameterName;

  /// The value of the parameter. If <code>ParameterName</code> is
  /// <code>wlm_json_configuration</code>, then the maximum size of
  /// <code>ParameterValue</code> is 8000 characters.
  final String? parameterValue;

  /// The source of the parameter value, such as "engine-default" or "user".
  final String? source;

  Parameter({
    this.allowedValues,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.minimumEngineVersion,
    this.parameterName,
    this.parameterValue,
    this.source,
  });
  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType:
          _s.extractXmlStringValue(elem, 'ApplyType')?.toParameterApplyType(),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
      parameterValue: _s.extractXmlStringValue(elem, 'ParameterValue'),
      source: _s.extractXmlStringValue(elem, 'Source'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final minimumEngineVersion = this.minimumEngineVersion;
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    final source = this.source;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyType != null) 'ApplyType': applyType.toValue(),
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
      if (source != null) 'Source': source,
    };
  }
}

enum ParameterApplyType {
  static,
  $dynamic,
}

extension ParameterApplyTypeValueExtension on ParameterApplyType {
  String toValue() {
    switch (this) {
      case ParameterApplyType.static:
        return 'static';
      case ParameterApplyType.$dynamic:
        return 'dynamic';
    }
  }
}

extension ParameterApplyTypeFromString on String {
  ParameterApplyType toParameterApplyType() {
    switch (this) {
      case 'static':
        return ParameterApplyType.static;
      case 'dynamic':
        return ParameterApplyType.$dynamic;
    }
    throw Exception('$this is not known in enum ParameterApplyType');
  }
}

/// Describes a partner integration.
class PartnerIntegrationInfo {
  /// The date (UTC) that the partner integration was created.
  final DateTime? createdAt;

  /// The name of the database that receives data from a partner.
  final String? databaseName;

  /// The name of the partner.
  final String? partnerName;

  /// The partner integration status.
  final PartnerIntegrationStatus? status;

  /// The status message provided by the partner.
  final String? statusMessage;

  /// The date (UTC) that the partner integration status was last updated by the
  /// partner.
  final DateTime? updatedAt;

  PartnerIntegrationInfo({
    this.createdAt,
    this.databaseName,
    this.partnerName,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });
  factory PartnerIntegrationInfo.fromXml(_s.XmlElement elem) {
    return PartnerIntegrationInfo(
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      databaseName: _s.extractXmlStringValue(elem, 'DatabaseName'),
      partnerName: _s.extractXmlStringValue(elem, 'PartnerName'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toPartnerIntegrationStatus(),
      statusMessage: _s.extractXmlStringValue(elem, 'StatusMessage'),
      updatedAt: _s.extractXmlDateTimeValue(elem, 'UpdatedAt'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final databaseName = this.databaseName;
    final partnerName = this.partnerName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (partnerName != null) 'PartnerName': partnerName,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class PartnerIntegrationOutputMessage {
  /// The name of the database that receives data from the partner.
  final String? databaseName;

  /// The name of the partner that is authorized to send data.
  final String? partnerName;

  PartnerIntegrationOutputMessage({
    this.databaseName,
    this.partnerName,
  });
  factory PartnerIntegrationOutputMessage.fromXml(_s.XmlElement elem) {
    return PartnerIntegrationOutputMessage(
      databaseName: _s.extractXmlStringValue(elem, 'DatabaseName'),
      partnerName: _s.extractXmlStringValue(elem, 'PartnerName'),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final partnerName = this.partnerName;
    return {
      if (databaseName != null) 'DatabaseName': databaseName,
      if (partnerName != null) 'PartnerName': partnerName,
    };
  }
}

enum PartnerIntegrationStatus {
  active,
  inactive,
  runtimeFailure,
  connectionFailure,
}

extension PartnerIntegrationStatusValueExtension on PartnerIntegrationStatus {
  String toValue() {
    switch (this) {
      case PartnerIntegrationStatus.active:
        return 'Active';
      case PartnerIntegrationStatus.inactive:
        return 'Inactive';
      case PartnerIntegrationStatus.runtimeFailure:
        return 'RuntimeFailure';
      case PartnerIntegrationStatus.connectionFailure:
        return 'ConnectionFailure';
    }
  }
}

extension PartnerIntegrationStatusFromString on String {
  PartnerIntegrationStatus toPartnerIntegrationStatus() {
    switch (this) {
      case 'Active':
        return PartnerIntegrationStatus.active;
      case 'Inactive':
        return PartnerIntegrationStatus.inactive;
      case 'RuntimeFailure':
        return PartnerIntegrationStatus.runtimeFailure;
      case 'ConnectionFailure':
        return PartnerIntegrationStatus.connectionFailure;
    }
    throw Exception('$this is not known in enum PartnerIntegrationStatus');
  }
}

/// Describes a pause cluster operation. For example, a scheduled action to run
/// the <code>PauseCluster</code> API operation.
class PauseClusterMessage {
  /// The identifier of the cluster to be paused.
  final String clusterIdentifier;

  PauseClusterMessage({
    required this.clusterIdentifier,
  });
  factory PauseClusterMessage.fromXml(_s.XmlElement elem) {
    return PauseClusterMessage(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier')!,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    return {
      'ClusterIdentifier': clusterIdentifier,
    };
  }
}

class PauseClusterResult {
  final Cluster? cluster;

  PauseClusterResult({
    this.cluster,
  });
  factory PauseClusterResult.fromXml(_s.XmlElement elem) {
    return PauseClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes cluster attributes that are in a pending state. A change to one or
/// more the attributes was requested and is in progress or will be applied.
class PendingModifiedValues {
  /// The pending or in-progress change of the automated snapshot retention
  /// period.
  final int? automatedSnapshotRetentionPeriod;

  /// The pending or in-progress change of the new identifier for the cluster.
  final String? clusterIdentifier;

  /// The pending or in-progress change of the cluster type.
  final String? clusterType;

  /// The pending or in-progress change of the service version.
  final String? clusterVersion;

  /// The encryption type for a cluster. Possible values are: KMS and None.
  final String? encryptionType;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool? enhancedVpcRouting;

  /// The name of the maintenance track that the cluster will change to during the
  /// next maintenance window.
  final String? maintenanceTrackName;

  /// The pending or in-progress change of the admin user password for the
  /// cluster.
  final String? masterUserPassword;

  /// The pending or in-progress change of the cluster's node type.
  final String? nodeType;

  /// The pending or in-progress change of the number of nodes in the cluster.
  final int? numberOfNodes;

  /// The pending or in-progress change of the ability to connect to the cluster
  /// from the public network.
  final bool? publiclyAccessible;

  PendingModifiedValues({
    this.automatedSnapshotRetentionPeriod,
    this.clusterIdentifier,
    this.clusterType,
    this.clusterVersion,
    this.encryptionType,
    this.enhancedVpcRouting,
    this.maintenanceTrackName,
    this.masterUserPassword,
    this.nodeType,
    this.numberOfNodes,
    this.publiclyAccessible,
  });
  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      automatedSnapshotRetentionPeriod:
          _s.extractXmlIntValue(elem, 'AutomatedSnapshotRetentionPeriod'),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      clusterType: _s.extractXmlStringValue(elem, 'ClusterType'),
      clusterVersion: _s.extractXmlStringValue(elem, 'ClusterVersion'),
      encryptionType: _s.extractXmlStringValue(elem, 'EncryptionType'),
      enhancedVpcRouting: _s.extractXmlBoolValue(elem, 'EnhancedVpcRouting'),
      maintenanceTrackName:
          _s.extractXmlStringValue(elem, 'MaintenanceTrackName'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      numberOfNodes: _s.extractXmlIntValue(elem, 'NumberOfNodes'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
    );
  }

  Map<String, dynamic> toJson() {
    final automatedSnapshotRetentionPeriod =
        this.automatedSnapshotRetentionPeriod;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterType = this.clusterType;
    final clusterVersion = this.clusterVersion;
    final encryptionType = this.encryptionType;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final maintenanceTrackName = this.maintenanceTrackName;
    final masterUserPassword = this.masterUserPassword;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final publiclyAccessible = this.publiclyAccessible;
    return {
      if (automatedSnapshotRetentionPeriod != null)
        'AutomatedSnapshotRetentionPeriod': automatedSnapshotRetentionPeriod,
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterType != null) 'ClusterType': clusterType,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (encryptionType != null) 'EncryptionType': encryptionType,
      if (enhancedVpcRouting != null) 'EnhancedVpcRouting': enhancedVpcRouting,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
    };
  }
}

class PurchaseReservedNodeOfferingResult {
  final ReservedNode? reservedNode;

  PurchaseReservedNodeOfferingResult({
    this.reservedNode,
  });
  factory PurchaseReservedNodeOfferingResult.fromXml(_s.XmlElement elem) {
    return PurchaseReservedNodeOfferingResult(
      reservedNode:
          _s.extractXmlChild(elem, 'ReservedNode')?.let(ReservedNode.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final reservedNode = this.reservedNode;
    return {
      if (reservedNode != null) 'ReservedNode': reservedNode,
    };
  }
}

class PutResourcePolicyResult {
  /// The content of the updated resource policy.
  final ResourcePolicy? resourcePolicy;

  PutResourcePolicyResult({
    this.resourcePolicy,
  });
  factory PutResourcePolicyResult.fromXml(_s.XmlElement elem) {
    return PutResourcePolicyResult(
      resourcePolicy: _s
          .extractXmlChild(elem, 'ResourcePolicy')
          ?.let(ResourcePolicy.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class RebootClusterResult {
  final Cluster? cluster;

  RebootClusterResult({
    this.cluster,
  });
  factory RebootClusterResult.fromXml(_s.XmlElement elem) {
    return RebootClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// An Amazon Redshift Advisor recommended action on the Amazon Redshift
/// cluster.
class Recommendation {
  /// The unique identifier of the cluster for which the recommendation is
  /// returned.
  final String? clusterIdentifier;

  /// The date and time (UTC) that the recommendation was created.
  final DateTime? createdAt;

  /// The description of the recommendation.
  final String? description;

  /// A unique identifier of the Advisor recommendation.
  final String? id;

  /// The scale of the impact that the Advisor recommendation has to the
  /// performance and cost of the cluster.
  final ImpactRankingType? impactRanking;

  /// The Amazon Redshift cluster namespace ARN for which the recommendations is
  /// returned.
  final String? namespaceArn;

  /// The description of what was observed about your cluster.
  final String? observation;

  /// The description of the recommendation.
  final String? recommendationText;

  /// The type of Advisor recommendation.
  final String? recommendationType;

  /// List of Amazon Redshift recommended actions.
  final List<RecommendedAction>? recommendedActions;

  /// List of helpful links for more information about the Advisor recommendation.
  final List<ReferenceLink>? referenceLinks;

  /// The title of the recommendation.
  final String? title;

  Recommendation({
    this.clusterIdentifier,
    this.createdAt,
    this.description,
    this.id,
    this.impactRanking,
    this.namespaceArn,
    this.observation,
    this.recommendationText,
    this.recommendationType,
    this.recommendedActions,
    this.referenceLinks,
    this.title,
  });
  factory Recommendation.fromXml(_s.XmlElement elem) {
    return Recommendation(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      impactRanking: _s
          .extractXmlStringValue(elem, 'ImpactRanking')
          ?.toImpactRankingType(),
      namespaceArn: _s.extractXmlStringValue(elem, 'NamespaceArn'),
      observation: _s.extractXmlStringValue(elem, 'Observation'),
      recommendationText: _s.extractXmlStringValue(elem, 'RecommendationText'),
      recommendationType: _s.extractXmlStringValue(elem, 'RecommendationType'),
      recommendedActions: _s.extractXmlChild(elem, 'RecommendedActions')?.let(
          (elem) => elem
              .findElements('RecommendedAction')
              .map(RecommendedAction.fromXml)
              .toList()),
      referenceLinks: _s.extractXmlChild(elem, 'ReferenceLinks')?.let((elem) =>
          elem
              .findElements('ReferenceLink')
              .map(ReferenceLink.fromXml)
              .toList()),
      title: _s.extractXmlStringValue(elem, 'Title'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final impactRanking = this.impactRanking;
    final namespaceArn = this.namespaceArn;
    final observation = this.observation;
    final recommendationText = this.recommendationText;
    final recommendationType = this.recommendationType;
    final recommendedActions = this.recommendedActions;
    final referenceLinks = this.referenceLinks;
    final title = this.title;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (impactRanking != null) 'ImpactRanking': impactRanking.toValue(),
      if (namespaceArn != null) 'NamespaceArn': namespaceArn,
      if (observation != null) 'Observation': observation,
      if (recommendationText != null) 'RecommendationText': recommendationText,
      if (recommendationType != null) 'RecommendationType': recommendationType,
      if (recommendedActions != null) 'RecommendedActions': recommendedActions,
      if (referenceLinks != null) 'ReferenceLinks': referenceLinks,
      if (title != null) 'Title': title,
    };
  }
}

/// The recommended action from the Amazon Redshift Advisor recommendation.
class RecommendedAction {
  /// The command to run.
  final String? command;

  /// The database name to perform the action on. Only applicable if the type of
  /// command is SQL.
  final String? database;

  /// The specific instruction about the command.
  final String? text;

  /// The type of command.
  final RecommendedActionType? type;

  RecommendedAction({
    this.command,
    this.database,
    this.text,
    this.type,
  });
  factory RecommendedAction.fromXml(_s.XmlElement elem) {
    return RecommendedAction(
      command: _s.extractXmlStringValue(elem, 'Command'),
      database: _s.extractXmlStringValue(elem, 'Database'),
      text: _s.extractXmlStringValue(elem, 'Text'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toRecommendedActionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final database = this.database;
    final text = this.text;
    final type = this.type;
    return {
      if (command != null) 'Command': command,
      if (database != null) 'Database': database,
      if (text != null) 'Text': text,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RecommendedActionType {
  sql,
  cli,
}

extension RecommendedActionTypeValueExtension on RecommendedActionType {
  String toValue() {
    switch (this) {
      case RecommendedActionType.sql:
        return 'SQL';
      case RecommendedActionType.cli:
        return 'CLI';
    }
  }
}

extension RecommendedActionTypeFromString on String {
  RecommendedActionType toRecommendedActionType() {
    switch (this) {
      case 'SQL':
        return RecommendedActionType.sql;
      case 'CLI':
        return RecommendedActionType.cli;
    }
    throw Exception('$this is not known in enum RecommendedActionType');
  }
}

/// Describes a recurring charge.
class RecurringCharge {
  /// The amount charged per the period of time specified by the recurring charge
  /// frequency.
  final double? recurringChargeAmount;

  /// The frequency at which the recurring charge amount is applied.
  final String? recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  factory RecurringCharge.fromXml(_s.XmlElement elem) {
    return RecurringCharge(
      recurringChargeAmount:
          _s.extractXmlDoubleValue(elem, 'RecurringChargeAmount'),
      recurringChargeFrequency:
          _s.extractXmlStringValue(elem, 'RecurringChargeFrequency'),
    );
  }

  Map<String, dynamic> toJson() {
    final recurringChargeAmount = this.recurringChargeAmount;
    final recurringChargeFrequency = this.recurringChargeFrequency;
    return {
      if (recurringChargeAmount != null)
        'RecurringChargeAmount': recurringChargeAmount,
      if (recurringChargeFrequency != null)
        'RecurringChargeFrequency': recurringChargeFrequency,
    };
  }
}

/// Contains properties for the Redshift IDC application.
class RedshiftIdcApplication {
  /// The authorized token issuer list for the Amazon Redshift IAM Identity Center
  /// application.
  final List<AuthorizedTokenIssuer>? authorizedTokenIssuerList;

  /// The ARN for the Amazon Redshift IAM Identity Center application. It has the
  /// required permissions to be assumed and invoke the IDC Identity Center API.
  final String? iamRoleArn;

  /// The display name for the Amazon Redshift IAM Identity Center application. It
  /// appears on the console.
  final String? idcDisplayName;

  /// The ARN for the IAM Identity Center instance that Redshift integrates with.
  final String? idcInstanceArn;

  /// The ARN for the Amazon Redshift IAM Identity Center application.
  final String? idcManagedApplicationArn;

  /// The onboarding status for the Amazon Redshift IAM Identity Center
  /// application.
  final String? idcOnboardStatus;

  /// The identity namespace for the Amazon Redshift IAM Identity Center
  /// application. It determines which managed application verifies the connection
  /// token.
  final String? identityNamespace;

  /// The ARN for the Redshift application that integrates with IAM Identity
  /// Center.
  final String? redshiftIdcApplicationArn;

  /// The name of the Redshift application in IAM Identity Center.
  final String? redshiftIdcApplicationName;

  /// A list of service integrations for the Redshift IAM Identity Center
  /// application.
  final List<ServiceIntegrationsUnion>? serviceIntegrations;

  RedshiftIdcApplication({
    this.authorizedTokenIssuerList,
    this.iamRoleArn,
    this.idcDisplayName,
    this.idcInstanceArn,
    this.idcManagedApplicationArn,
    this.idcOnboardStatus,
    this.identityNamespace,
    this.redshiftIdcApplicationArn,
    this.redshiftIdcApplicationName,
    this.serviceIntegrations,
  });
  factory RedshiftIdcApplication.fromXml(_s.XmlElement elem) {
    return RedshiftIdcApplication(
      authorizedTokenIssuerList: _s
          .extractXmlChild(elem, 'AuthorizedTokenIssuerList')
          ?.let((elem) => elem
              .findElements('member')
              .map(AuthorizedTokenIssuer.fromXml)
              .toList()),
      iamRoleArn: _s.extractXmlStringValue(elem, 'IamRoleArn'),
      idcDisplayName: _s.extractXmlStringValue(elem, 'IdcDisplayName'),
      idcInstanceArn: _s.extractXmlStringValue(elem, 'IdcInstanceArn'),
      idcManagedApplicationArn:
          _s.extractXmlStringValue(elem, 'IdcManagedApplicationArn'),
      idcOnboardStatus: _s.extractXmlStringValue(elem, 'IdcOnboardStatus'),
      identityNamespace: _s.extractXmlStringValue(elem, 'IdentityNamespace'),
      redshiftIdcApplicationArn:
          _s.extractXmlStringValue(elem, 'RedshiftIdcApplicationArn'),
      redshiftIdcApplicationName:
          _s.extractXmlStringValue(elem, 'RedshiftIdcApplicationName'),
      serviceIntegrations: _s.extractXmlChild(elem, 'ServiceIntegrations')?.let(
          (elem) => elem
              .findElements('member')
              .map(ServiceIntegrationsUnion.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedTokenIssuerList = this.authorizedTokenIssuerList;
    final iamRoleArn = this.iamRoleArn;
    final idcDisplayName = this.idcDisplayName;
    final idcInstanceArn = this.idcInstanceArn;
    final idcManagedApplicationArn = this.idcManagedApplicationArn;
    final idcOnboardStatus = this.idcOnboardStatus;
    final identityNamespace = this.identityNamespace;
    final redshiftIdcApplicationArn = this.redshiftIdcApplicationArn;
    final redshiftIdcApplicationName = this.redshiftIdcApplicationName;
    final serviceIntegrations = this.serviceIntegrations;
    return {
      if (authorizedTokenIssuerList != null)
        'AuthorizedTokenIssuerList': authorizedTokenIssuerList,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (idcDisplayName != null) 'IdcDisplayName': idcDisplayName,
      if (idcInstanceArn != null) 'IdcInstanceArn': idcInstanceArn,
      if (idcManagedApplicationArn != null)
        'IdcManagedApplicationArn': idcManagedApplicationArn,
      if (idcOnboardStatus != null) 'IdcOnboardStatus': idcOnboardStatus,
      if (identityNamespace != null) 'IdentityNamespace': identityNamespace,
      if (redshiftIdcApplicationArn != null)
        'RedshiftIdcApplicationArn': redshiftIdcApplicationArn,
      if (redshiftIdcApplicationName != null)
        'RedshiftIdcApplicationName': redshiftIdcApplicationName,
      if (serviceIntegrations != null)
        'ServiceIntegrations': serviceIntegrations,
    };
  }
}

/// A link to an Amazon Redshift Advisor reference for more information about a
/// recommendation.
class ReferenceLink {
  /// The URL address to find more information.
  final String? link;

  /// The hyperlink text that describes the link to more information.
  final String? text;

  ReferenceLink({
    this.link,
    this.text,
  });
  factory ReferenceLink.fromXml(_s.XmlElement elem) {
    return ReferenceLink(
      link: _s.extractXmlStringValue(elem, 'Link'),
      text: _s.extractXmlStringValue(elem, 'Text'),
    );
  }

  Map<String, dynamic> toJson() {
    final link = this.link;
    final text = this.text;
    return {
      if (link != null) 'Link': link,
      if (text != null) 'Text': text,
    };
  }
}

/// Describes a reserved node. You can call the
/// <a>DescribeReservedNodeOfferings</a> API to obtain the available reserved
/// node offerings.
class ReservedNode {
  /// The currency code for the reserved cluster.
  final String? currencyCode;

  /// The duration of the node reservation in seconds.
  final int? duration;

  /// The fixed cost Amazon Redshift charges you for this reserved node.
  final double? fixedPrice;

  /// The number of reserved compute nodes.
  final int? nodeCount;

  /// The node type of the reserved node.
  final String? nodeType;

  /// The anticipated utilization of the reserved node, as defined in the reserved
  /// node offering.
  final String? offeringType;

  /// The recurring charges for the reserved node.
  final List<RecurringCharge>? recurringCharges;

  /// The unique identifier for the reservation.
  final String? reservedNodeId;

  /// The identifier for the reserved node offering.
  final String? reservedNodeOfferingId;

  /// <p/>
  final ReservedNodeOfferingType? reservedNodeOfferingType;

  /// The time the reservation started. You purchase a reserved node offering for
  /// a duration. This is the start time of that duration.
  final DateTime? startTime;

  /// The state of the reserved compute node.
  ///
  /// Possible Values:
  ///
  /// <ul>
  /// <li>
  /// pending-payment-This reserved node has recently been purchased, and the sale
  /// has been approved, but payment has not yet been confirmed.
  /// </li>
  /// <li>
  /// active-This reserved node is owned by the caller and is available for use.
  /// </li>
  /// <li>
  /// payment-failed-Payment failed for the purchase attempt.
  /// </li>
  /// <li>
  /// retired-The reserved node is no longer available.
  /// </li>
  /// <li>
  /// exchanging-The owner is exchanging the reserved node for another reserved
  /// node.
  /// </li>
  /// </ul>
  final String? state;

  /// The hourly rate Amazon Redshift charges you for this reserved node.
  final double? usagePrice;

  ReservedNode({
    this.currencyCode,
    this.duration,
    this.fixedPrice,
    this.nodeCount,
    this.nodeType,
    this.offeringType,
    this.recurringCharges,
    this.reservedNodeId,
    this.reservedNodeOfferingId,
    this.reservedNodeOfferingType,
    this.startTime,
    this.state,
    this.usagePrice,
  });
  factory ReservedNode.fromXml(_s.XmlElement elem) {
    return ReservedNode(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      nodeCount: _s.extractXmlIntValue(elem, 'NodeCount'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map(RecurringCharge.fromXml)
              .toList()),
      reservedNodeId: _s.extractXmlStringValue(elem, 'ReservedNodeId'),
      reservedNodeOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedNodeOfferingId'),
      reservedNodeOfferingType: _s
          .extractXmlStringValue(elem, 'ReservedNodeOfferingType')
          ?.toReservedNodeOfferingType(),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final nodeCount = this.nodeCount;
    final nodeType = this.nodeType;
    final offeringType = this.offeringType;
    final recurringCharges = this.recurringCharges;
    final reservedNodeId = this.reservedNodeId;
    final reservedNodeOfferingId = this.reservedNodeOfferingId;
    final reservedNodeOfferingType = this.reservedNodeOfferingType;
    final startTime = this.startTime;
    final state = this.state;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (nodeCount != null) 'NodeCount': nodeCount,
      if (nodeType != null) 'NodeType': nodeType,
      if (offeringType != null) 'OfferingType': offeringType,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedNodeId != null) 'ReservedNodeId': reservedNodeId,
      if (reservedNodeOfferingId != null)
        'ReservedNodeOfferingId': reservedNodeOfferingId,
      if (reservedNodeOfferingType != null)
        'ReservedNodeOfferingType': reservedNodeOfferingType.toValue(),
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (state != null) 'State': state,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

/// Details for a reserved-node exchange. Examples include the node type for a
/// reserved node, the price for a node, the node's state, and other details.
class ReservedNodeConfigurationOption {
  final ReservedNode? sourceReservedNode;

  /// The target reserved-node count.
  final int? targetReservedNodeCount;
  final ReservedNodeOffering? targetReservedNodeOffering;

  ReservedNodeConfigurationOption({
    this.sourceReservedNode,
    this.targetReservedNodeCount,
    this.targetReservedNodeOffering,
  });
  factory ReservedNodeConfigurationOption.fromXml(_s.XmlElement elem) {
    return ReservedNodeConfigurationOption(
      sourceReservedNode: _s
          .extractXmlChild(elem, 'SourceReservedNode')
          ?.let(ReservedNode.fromXml),
      targetReservedNodeCount:
          _s.extractXmlIntValue(elem, 'TargetReservedNodeCount'),
      targetReservedNodeOffering: _s
          .extractXmlChild(elem, 'TargetReservedNodeOffering')
          ?.let(ReservedNodeOffering.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceReservedNode = this.sourceReservedNode;
    final targetReservedNodeCount = this.targetReservedNodeCount;
    final targetReservedNodeOffering = this.targetReservedNodeOffering;
    return {
      if (sourceReservedNode != null) 'SourceReservedNode': sourceReservedNode,
      if (targetReservedNodeCount != null)
        'TargetReservedNodeCount': targetReservedNodeCount,
      if (targetReservedNodeOffering != null)
        'TargetReservedNodeOffering': targetReservedNodeOffering,
    };
  }
}

enum ReservedNodeExchangeActionType {
  restoreCluster,
  resizeCluster,
}

extension ReservedNodeExchangeActionTypeValueExtension
    on ReservedNodeExchangeActionType {
  String toValue() {
    switch (this) {
      case ReservedNodeExchangeActionType.restoreCluster:
        return 'restore-cluster';
      case ReservedNodeExchangeActionType.resizeCluster:
        return 'resize-cluster';
    }
  }
}

extension ReservedNodeExchangeActionTypeFromString on String {
  ReservedNodeExchangeActionType toReservedNodeExchangeActionType() {
    switch (this) {
      case 'restore-cluster':
        return ReservedNodeExchangeActionType.restoreCluster;
      case 'resize-cluster':
        return ReservedNodeExchangeActionType.resizeCluster;
    }
    throw Exception(
        '$this is not known in enum ReservedNodeExchangeActionType');
  }
}

/// Reserved-node status details, such as the source reserved-node identifier,
/// the target reserved-node identifier, the node type, the node count, and
/// other details.
class ReservedNodeExchangeStatus {
  /// A date and time that indicate when the reserved-node exchange was requested.
  final DateTime? requestTime;

  /// The identifier of the reserved-node exchange request.
  final String? reservedNodeExchangeRequestId;

  /// The source reserved-node count in the cluster.
  final int? sourceReservedNodeCount;

  /// The identifier of the source reserved node.
  final String? sourceReservedNodeId;

  /// The source reserved-node type, for example ds2.xlarge.
  final String? sourceReservedNodeType;

  /// The status of the reserved-node exchange request. Statuses include
  /// in-progress and requested.
  final ReservedNodeExchangeStatusType? status;

  /// The count of target reserved nodes in the cluster.
  final int? targetReservedNodeCount;

  /// The identifier of the target reserved node offering.
  final String? targetReservedNodeOfferingId;

  /// The node type of the target reserved node, for example ra3.4xlarge.
  final String? targetReservedNodeType;

  ReservedNodeExchangeStatus({
    this.requestTime,
    this.reservedNodeExchangeRequestId,
    this.sourceReservedNodeCount,
    this.sourceReservedNodeId,
    this.sourceReservedNodeType,
    this.status,
    this.targetReservedNodeCount,
    this.targetReservedNodeOfferingId,
    this.targetReservedNodeType,
  });
  factory ReservedNodeExchangeStatus.fromXml(_s.XmlElement elem) {
    return ReservedNodeExchangeStatus(
      requestTime: _s.extractXmlDateTimeValue(elem, 'RequestTime'),
      reservedNodeExchangeRequestId:
          _s.extractXmlStringValue(elem, 'ReservedNodeExchangeRequestId'),
      sourceReservedNodeCount:
          _s.extractXmlIntValue(elem, 'SourceReservedNodeCount'),
      sourceReservedNodeId:
          _s.extractXmlStringValue(elem, 'SourceReservedNodeId'),
      sourceReservedNodeType:
          _s.extractXmlStringValue(elem, 'SourceReservedNodeType'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toReservedNodeExchangeStatusType(),
      targetReservedNodeCount:
          _s.extractXmlIntValue(elem, 'TargetReservedNodeCount'),
      targetReservedNodeOfferingId:
          _s.extractXmlStringValue(elem, 'TargetReservedNodeOfferingId'),
      targetReservedNodeType:
          _s.extractXmlStringValue(elem, 'TargetReservedNodeType'),
    );
  }

  Map<String, dynamic> toJson() {
    final requestTime = this.requestTime;
    final reservedNodeExchangeRequestId = this.reservedNodeExchangeRequestId;
    final sourceReservedNodeCount = this.sourceReservedNodeCount;
    final sourceReservedNodeId = this.sourceReservedNodeId;
    final sourceReservedNodeType = this.sourceReservedNodeType;
    final status = this.status;
    final targetReservedNodeCount = this.targetReservedNodeCount;
    final targetReservedNodeOfferingId = this.targetReservedNodeOfferingId;
    final targetReservedNodeType = this.targetReservedNodeType;
    return {
      if (requestTime != null) 'RequestTime': iso8601ToJson(requestTime),
      if (reservedNodeExchangeRequestId != null)
        'ReservedNodeExchangeRequestId': reservedNodeExchangeRequestId,
      if (sourceReservedNodeCount != null)
        'SourceReservedNodeCount': sourceReservedNodeCount,
      if (sourceReservedNodeId != null)
        'SourceReservedNodeId': sourceReservedNodeId,
      if (sourceReservedNodeType != null)
        'SourceReservedNodeType': sourceReservedNodeType,
      if (status != null) 'Status': status.toValue(),
      if (targetReservedNodeCount != null)
        'TargetReservedNodeCount': targetReservedNodeCount,
      if (targetReservedNodeOfferingId != null)
        'TargetReservedNodeOfferingId': targetReservedNodeOfferingId,
      if (targetReservedNodeType != null)
        'TargetReservedNodeType': targetReservedNodeType,
    };
  }
}

enum ReservedNodeExchangeStatusType {
  requested,
  pending,
  inProgress,
  retrying,
  succeeded,
  failed,
}

extension ReservedNodeExchangeStatusTypeValueExtension
    on ReservedNodeExchangeStatusType {
  String toValue() {
    switch (this) {
      case ReservedNodeExchangeStatusType.requested:
        return 'REQUESTED';
      case ReservedNodeExchangeStatusType.pending:
        return 'PENDING';
      case ReservedNodeExchangeStatusType.inProgress:
        return 'IN_PROGRESS';
      case ReservedNodeExchangeStatusType.retrying:
        return 'RETRYING';
      case ReservedNodeExchangeStatusType.succeeded:
        return 'SUCCEEDED';
      case ReservedNodeExchangeStatusType.failed:
        return 'FAILED';
    }
  }
}

extension ReservedNodeExchangeStatusTypeFromString on String {
  ReservedNodeExchangeStatusType toReservedNodeExchangeStatusType() {
    switch (this) {
      case 'REQUESTED':
        return ReservedNodeExchangeStatusType.requested;
      case 'PENDING':
        return ReservedNodeExchangeStatusType.pending;
      case 'IN_PROGRESS':
        return ReservedNodeExchangeStatusType.inProgress;
      case 'RETRYING':
        return ReservedNodeExchangeStatusType.retrying;
      case 'SUCCEEDED':
        return ReservedNodeExchangeStatusType.succeeded;
      case 'FAILED':
        return ReservedNodeExchangeStatusType.failed;
    }
    throw Exception(
        '$this is not known in enum ReservedNodeExchangeStatusType');
  }
}

/// Describes a reserved node offering.
class ReservedNodeOffering {
  /// The currency code for the compute nodes offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the offering will reserve the node.
  final int? duration;

  /// The upfront fixed charge you will pay to purchase the specific reserved node
  /// offering.
  final double? fixedPrice;

  /// The node type offered by the reserved node offering.
  final String? nodeType;

  /// The anticipated utilization of the reserved node, as defined in the reserved
  /// node offering.
  final String? offeringType;

  /// The charge to your account regardless of whether you are creating any
  /// clusters using the node offering. Recurring charges are only in effect for
  /// heavy-utilization reserved nodes.
  final List<RecurringCharge>? recurringCharges;

  /// The offering identifier.
  final String? reservedNodeOfferingId;

  /// <p/>
  final ReservedNodeOfferingType? reservedNodeOfferingType;

  /// The rate you are charged for each hour the cluster that is using the
  /// offering is running.
  final double? usagePrice;

  ReservedNodeOffering({
    this.currencyCode,
    this.duration,
    this.fixedPrice,
    this.nodeType,
    this.offeringType,
    this.recurringCharges,
    this.reservedNodeOfferingId,
    this.reservedNodeOfferingType,
    this.usagePrice,
  });
  factory ReservedNodeOffering.fromXml(_s.XmlElement elem) {
    return ReservedNodeOffering(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map(RecurringCharge.fromXml)
              .toList()),
      reservedNodeOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedNodeOfferingId'),
      reservedNodeOfferingType: _s
          .extractXmlStringValue(elem, 'ReservedNodeOfferingType')
          ?.toReservedNodeOfferingType(),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final nodeType = this.nodeType;
    final offeringType = this.offeringType;
    final recurringCharges = this.recurringCharges;
    final reservedNodeOfferingId = this.reservedNodeOfferingId;
    final reservedNodeOfferingType = this.reservedNodeOfferingType;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (nodeType != null) 'NodeType': nodeType,
      if (offeringType != null) 'OfferingType': offeringType,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedNodeOfferingId != null)
        'ReservedNodeOfferingId': reservedNodeOfferingId,
      if (reservedNodeOfferingType != null)
        'ReservedNodeOfferingType': reservedNodeOfferingType.toValue(),
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

enum ReservedNodeOfferingType {
  regular,
  upgradable,
}

extension ReservedNodeOfferingTypeValueExtension on ReservedNodeOfferingType {
  String toValue() {
    switch (this) {
      case ReservedNodeOfferingType.regular:
        return 'Regular';
      case ReservedNodeOfferingType.upgradable:
        return 'Upgradable';
    }
  }
}

extension ReservedNodeOfferingTypeFromString on String {
  ReservedNodeOfferingType toReservedNodeOfferingType() {
    switch (this) {
      case 'Regular':
        return ReservedNodeOfferingType.regular;
      case 'Upgradable':
        return ReservedNodeOfferingType.upgradable;
    }
    throw Exception('$this is not known in enum ReservedNodeOfferingType');
  }
}

/// <p/>
class ReservedNodeOfferingsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of <code>ReservedNodeOffering</code> objects.
  final List<ReservedNodeOffering>? reservedNodeOfferings;

  ReservedNodeOfferingsMessage({
    this.marker,
    this.reservedNodeOfferings,
  });
  factory ReservedNodeOfferingsMessage.fromXml(_s.XmlElement elem) {
    return ReservedNodeOfferingsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedNodeOfferings: _s
          .extractXmlChild(elem, 'ReservedNodeOfferings')
          ?.let((elem) => elem
              .findElements('ReservedNodeOffering')
              .map(ReservedNodeOffering.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedNodeOfferings = this.reservedNodeOfferings;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedNodeOfferings != null)
        'ReservedNodeOfferings': reservedNodeOfferings,
    };
  }
}

/// <p/>
class ReservedNodesMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// The list of <code>ReservedNode</code> objects.
  final List<ReservedNode>? reservedNodes;

  ReservedNodesMessage({
    this.marker,
    this.reservedNodes,
  });
  factory ReservedNodesMessage.fromXml(_s.XmlElement elem) {
    return ReservedNodesMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedNodes: _s.extractXmlChild(elem, 'ReservedNodes')?.let((elem) =>
          elem.findElements('ReservedNode').map(ReservedNode.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedNodes = this.reservedNodes;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedNodes != null) 'ReservedNodes': reservedNodes,
    };
  }
}

/// Describes a resize cluster operation. For example, a scheduled action to run
/// the <code>ResizeCluster</code> API operation.
class ResizeClusterMessage {
  /// The unique identifier for the cluster to resize.
  final String clusterIdentifier;

  /// A boolean value indicating whether the resize operation is using the classic
  /// resize process. If you don't provide this parameter or set the value to
  /// <code>false</code>, the resize type is elastic.
  final bool? classic;

  /// The new cluster type for the specified cluster.
  final String? clusterType;

  /// The new node type for the nodes you are adding. If not specified, the
  /// cluster's current node type is used.
  final String? nodeType;

  /// The new number of nodes for the cluster. If not specified, the cluster's
  /// current number of nodes is used.
  final int? numberOfNodes;

  /// The identifier of the reserved node.
  final String? reservedNodeId;

  /// The identifier of the target reserved node offering.
  final String? targetReservedNodeOfferingId;

  ResizeClusterMessage({
    required this.clusterIdentifier,
    this.classic,
    this.clusterType,
    this.nodeType,
    this.numberOfNodes,
    this.reservedNodeId,
    this.targetReservedNodeOfferingId,
  });
  factory ResizeClusterMessage.fromXml(_s.XmlElement elem) {
    return ResizeClusterMessage(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier')!,
      classic: _s.extractXmlBoolValue(elem, 'Classic'),
      clusterType: _s.extractXmlStringValue(elem, 'ClusterType'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      numberOfNodes: _s.extractXmlIntValue(elem, 'NumberOfNodes'),
      reservedNodeId: _s.extractXmlStringValue(elem, 'ReservedNodeId'),
      targetReservedNodeOfferingId:
          _s.extractXmlStringValue(elem, 'TargetReservedNodeOfferingId'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final classic = this.classic;
    final clusterType = this.clusterType;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final reservedNodeId = this.reservedNodeId;
    final targetReservedNodeOfferingId = this.targetReservedNodeOfferingId;
    return {
      'ClusterIdentifier': clusterIdentifier,
      if (classic != null) 'Classic': classic,
      if (clusterType != null) 'ClusterType': clusterType,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (reservedNodeId != null) 'ReservedNodeId': reservedNodeId,
      if (targetReservedNodeOfferingId != null)
        'TargetReservedNodeOfferingId': targetReservedNodeOfferingId,
    };
  }
}

class ResizeClusterResult {
  final Cluster? cluster;

  ResizeClusterResult({
    this.cluster,
  });
  factory ResizeClusterResult.fromXml(_s.XmlElement elem) {
    return ResizeClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes a resize operation.
class ResizeInfo {
  /// A boolean value indicating if the resize operation can be cancelled.
  final bool? allowCancelResize;

  /// Returns the value <code>ClassicResize</code>.
  final String? resizeType;

  ResizeInfo({
    this.allowCancelResize,
    this.resizeType,
  });
  factory ResizeInfo.fromXml(_s.XmlElement elem) {
    return ResizeInfo(
      allowCancelResize: _s.extractXmlBoolValue(elem, 'AllowCancelResize'),
      resizeType: _s.extractXmlStringValue(elem, 'ResizeType'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowCancelResize = this.allowCancelResize;
    final resizeType = this.resizeType;
    return {
      if (allowCancelResize != null) 'AllowCancelResize': allowCancelResize,
      if (resizeType != null) 'ResizeType': resizeType,
    };
  }
}

/// Describes the result of a cluster resize operation.
class ResizeProgressMessage {
  /// The average rate of the resize operation over the last few minutes, measured
  /// in megabytes per second. After the resize operation completes, this value
  /// shows the average rate of the entire resize operation.
  final double? avgResizeRateInMegaBytesPerSecond;

  /// The percent of data transferred from source cluster to target cluster.
  final double? dataTransferProgressPercent;

  /// The amount of seconds that have elapsed since the resize operation began.
  /// After the resize operation completes, this value shows the total actual
  /// time, in seconds, for the resize operation.
  final int? elapsedTimeInSeconds;

  /// The estimated time remaining, in seconds, until the resize operation is
  /// complete. This value is calculated based on the average resize rate and the
  /// estimated amount of data remaining to be processed. Once the resize
  /// operation is complete, this value will be 0.
  final int? estimatedTimeToCompletionInSeconds;

  /// The names of tables that have been completely imported .
  ///
  /// Valid Values: List of table names.
  final List<String>? importTablesCompleted;

  /// The names of tables that are being currently imported.
  ///
  /// Valid Values: List of table names.
  final List<String>? importTablesInProgress;

  /// The names of tables that have not been yet imported.
  ///
  /// Valid Values: List of table names
  final List<String>? importTablesNotStarted;

  /// An optional string to provide additional details about the resize action.
  final String? message;

  /// While the resize operation is in progress, this value shows the current
  /// amount of data, in megabytes, that has been processed so far. When the
  /// resize operation is complete, this value shows the total amount of data, in
  /// megabytes, on the cluster, which may be more or less than
  /// TotalResizeDataInMegaBytes (the estimated total amount of data before
  /// resize).
  final int? progressInMegaBytes;

  /// An enum with possible values of <code>ClassicResize</code> and
  /// <code>ElasticResize</code>. These values describe the type of resize
  /// operation being performed.
  final String? resizeType;

  /// The status of the resize operation.
  ///
  /// Valid Values: <code>NONE</code> | <code>IN_PROGRESS</code> |
  /// <code>FAILED</code> | <code>SUCCEEDED</code> | <code>CANCELLING</code>
  final String? status;

  /// The cluster type after the resize operation is complete.
  ///
  /// Valid Values: <code>multi-node</code> | <code>single-node</code>
  final String? targetClusterType;

  /// The type of encryption for the cluster after the resize is complete.
  ///
  /// Possible values are <code>KMS</code> and <code>None</code>.
  final String? targetEncryptionType;

  /// The node type that the cluster will have after the resize operation is
  /// complete.
  final String? targetNodeType;

  /// The number of nodes that the cluster will have after the resize operation is
  /// complete.
  final int? targetNumberOfNodes;

  /// The estimated total amount of data, in megabytes, on the cluster before the
  /// resize operation began.
  final int? totalResizeDataInMegaBytes;

  ResizeProgressMessage({
    this.avgResizeRateInMegaBytesPerSecond,
    this.dataTransferProgressPercent,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.importTablesCompleted,
    this.importTablesInProgress,
    this.importTablesNotStarted,
    this.message,
    this.progressInMegaBytes,
    this.resizeType,
    this.status,
    this.targetClusterType,
    this.targetEncryptionType,
    this.targetNodeType,
    this.targetNumberOfNodes,
    this.totalResizeDataInMegaBytes,
  });
  factory ResizeProgressMessage.fromXml(_s.XmlElement elem) {
    return ResizeProgressMessage(
      avgResizeRateInMegaBytesPerSecond:
          _s.extractXmlDoubleValue(elem, 'AvgResizeRateInMegaBytesPerSecond'),
      dataTransferProgressPercent:
          _s.extractXmlDoubleValue(elem, 'DataTransferProgressPercent'),
      elapsedTimeInSeconds: _s.extractXmlIntValue(elem, 'ElapsedTimeInSeconds'),
      estimatedTimeToCompletionInSeconds:
          _s.extractXmlIntValue(elem, 'EstimatedTimeToCompletionInSeconds'),
      importTablesCompleted: _s
          .extractXmlChild(elem, 'ImportTablesCompleted')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      importTablesInProgress: _s
          .extractXmlChild(elem, 'ImportTablesInProgress')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      importTablesNotStarted: _s
          .extractXmlChild(elem, 'ImportTablesNotStarted')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      message: _s.extractXmlStringValue(elem, 'Message'),
      progressInMegaBytes: _s.extractXmlIntValue(elem, 'ProgressInMegaBytes'),
      resizeType: _s.extractXmlStringValue(elem, 'ResizeType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      targetClusterType: _s.extractXmlStringValue(elem, 'TargetClusterType'),
      targetEncryptionType:
          _s.extractXmlStringValue(elem, 'TargetEncryptionType'),
      targetNodeType: _s.extractXmlStringValue(elem, 'TargetNodeType'),
      targetNumberOfNodes: _s.extractXmlIntValue(elem, 'TargetNumberOfNodes'),
      totalResizeDataInMegaBytes:
          _s.extractXmlIntValue(elem, 'TotalResizeDataInMegaBytes'),
    );
  }

  Map<String, dynamic> toJson() {
    final avgResizeRateInMegaBytesPerSecond =
        this.avgResizeRateInMegaBytesPerSecond;
    final dataTransferProgressPercent = this.dataTransferProgressPercent;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final estimatedTimeToCompletionInSeconds =
        this.estimatedTimeToCompletionInSeconds;
    final importTablesCompleted = this.importTablesCompleted;
    final importTablesInProgress = this.importTablesInProgress;
    final importTablesNotStarted = this.importTablesNotStarted;
    final message = this.message;
    final progressInMegaBytes = this.progressInMegaBytes;
    final resizeType = this.resizeType;
    final status = this.status;
    final targetClusterType = this.targetClusterType;
    final targetEncryptionType = this.targetEncryptionType;
    final targetNodeType = this.targetNodeType;
    final targetNumberOfNodes = this.targetNumberOfNodes;
    final totalResizeDataInMegaBytes = this.totalResizeDataInMegaBytes;
    return {
      if (avgResizeRateInMegaBytesPerSecond != null)
        'AvgResizeRateInMegaBytesPerSecond': avgResizeRateInMegaBytesPerSecond,
      if (dataTransferProgressPercent != null)
        'DataTransferProgressPercent': dataTransferProgressPercent,
      if (elapsedTimeInSeconds != null)
        'ElapsedTimeInSeconds': elapsedTimeInSeconds,
      if (estimatedTimeToCompletionInSeconds != null)
        'EstimatedTimeToCompletionInSeconds':
            estimatedTimeToCompletionInSeconds,
      if (importTablesCompleted != null)
        'ImportTablesCompleted': importTablesCompleted,
      if (importTablesInProgress != null)
        'ImportTablesInProgress': importTablesInProgress,
      if (importTablesNotStarted != null)
        'ImportTablesNotStarted': importTablesNotStarted,
      if (message != null) 'Message': message,
      if (progressInMegaBytes != null)
        'ProgressInMegaBytes': progressInMegaBytes,
      if (resizeType != null) 'ResizeType': resizeType,
      if (status != null) 'Status': status,
      if (targetClusterType != null) 'TargetClusterType': targetClusterType,
      if (targetEncryptionType != null)
        'TargetEncryptionType': targetEncryptionType,
      if (targetNodeType != null) 'TargetNodeType': targetNodeType,
      if (targetNumberOfNodes != null)
        'TargetNumberOfNodes': targetNumberOfNodes,
      if (totalResizeDataInMegaBytes != null)
        'TotalResizeDataInMegaBytes': totalResizeDataInMegaBytes,
    };
  }
}

/// The policy that is attached to a resource.
class ResourcePolicy {
  /// The content of a resource policy.
  final String? policy;

  /// The resources that a policy is attached to.
  final String? resourceArn;

  ResourcePolicy({
    this.policy,
    this.resourceArn,
  });
  factory ResourcePolicy.fromXml(_s.XmlElement elem) {
    return ResourcePolicy(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class RestoreFromClusterSnapshotResult {
  final Cluster? cluster;

  RestoreFromClusterSnapshotResult({
    this.cluster,
  });
  factory RestoreFromClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreFromClusterSnapshotResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes the status of a cluster restore action. Returns null if the
/// cluster was not created by restoring a snapshot.
class RestoreStatus {
  /// The number of megabytes per second being transferred from the backup
  /// storage. Returns the average rate for a completed backup. This field is only
  /// updated when you restore to DC2 and DS2 node types.
  final double? currentRestoreRateInMegaBytesPerSecond;

  /// The amount of time an in-progress restore has been running, or the amount of
  /// time it took a completed restore to finish. This field is only updated when
  /// you restore to DC2 and DS2 node types.
  final int? elapsedTimeInSeconds;

  /// The estimate of the time remaining before the restore will complete. Returns
  /// 0 for a completed restore. This field is only updated when you restore to
  /// DC2 and DS2 node types.
  final int? estimatedTimeToCompletionInSeconds;

  /// The number of megabytes that have been transferred from snapshot storage.
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final int? progressInMegaBytes;

  /// The size of the set of snapshot data used to restore the cluster. This field
  /// is only updated when you restore to DC2 and DS2 node types.
  final int? snapshotSizeInMegaBytes;

  /// The status of the restore action. Returns starting, restoring, completed, or
  /// failed.
  final String? status;

  RestoreStatus({
    this.currentRestoreRateInMegaBytesPerSecond,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.progressInMegaBytes,
    this.snapshotSizeInMegaBytes,
    this.status,
  });
  factory RestoreStatus.fromXml(_s.XmlElement elem) {
    return RestoreStatus(
      currentRestoreRateInMegaBytesPerSecond: _s.extractXmlDoubleValue(
          elem, 'CurrentRestoreRateInMegaBytesPerSecond'),
      elapsedTimeInSeconds: _s.extractXmlIntValue(elem, 'ElapsedTimeInSeconds'),
      estimatedTimeToCompletionInSeconds:
          _s.extractXmlIntValue(elem, 'EstimatedTimeToCompletionInSeconds'),
      progressInMegaBytes: _s.extractXmlIntValue(elem, 'ProgressInMegaBytes'),
      snapshotSizeInMegaBytes:
          _s.extractXmlIntValue(elem, 'SnapshotSizeInMegaBytes'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final currentRestoreRateInMegaBytesPerSecond =
        this.currentRestoreRateInMegaBytesPerSecond;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final estimatedTimeToCompletionInSeconds =
        this.estimatedTimeToCompletionInSeconds;
    final progressInMegaBytes = this.progressInMegaBytes;
    final snapshotSizeInMegaBytes = this.snapshotSizeInMegaBytes;
    final status = this.status;
    return {
      if (currentRestoreRateInMegaBytesPerSecond != null)
        'CurrentRestoreRateInMegaBytesPerSecond':
            currentRestoreRateInMegaBytesPerSecond,
      if (elapsedTimeInSeconds != null)
        'ElapsedTimeInSeconds': elapsedTimeInSeconds,
      if (estimatedTimeToCompletionInSeconds != null)
        'EstimatedTimeToCompletionInSeconds':
            estimatedTimeToCompletionInSeconds,
      if (progressInMegaBytes != null)
        'ProgressInMegaBytes': progressInMegaBytes,
      if (snapshotSizeInMegaBytes != null)
        'SnapshotSizeInMegaBytes': snapshotSizeInMegaBytes,
      if (status != null) 'Status': status,
    };
  }
}

class RestoreTableFromClusterSnapshotResult {
  final TableRestoreStatus? tableRestoreStatus;

  RestoreTableFromClusterSnapshotResult({
    this.tableRestoreStatus,
  });
  factory RestoreTableFromClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreTableFromClusterSnapshotResult(
      tableRestoreStatus: _s
          .extractXmlChild(elem, 'TableRestoreStatus')
          ?.let(TableRestoreStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final tableRestoreStatus = this.tableRestoreStatus;
    return {
      if (tableRestoreStatus != null) 'TableRestoreStatus': tableRestoreStatus,
    };
  }
}

/// Describes a resume cluster operation. For example, a scheduled action to run
/// the <code>ResumeCluster</code> API operation.
class ResumeClusterMessage {
  /// The identifier of the cluster to be resumed.
  final String clusterIdentifier;

  ResumeClusterMessage({
    required this.clusterIdentifier,
  });
  factory ResumeClusterMessage.fromXml(_s.XmlElement elem) {
    return ResumeClusterMessage(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier')!,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    return {
      'ClusterIdentifier': clusterIdentifier,
    };
  }
}

class ResumeClusterResult {
  final Cluster? cluster;

  ResumeClusterResult({
    this.cluster,
  });
  factory ResumeClusterResult.fromXml(_s.XmlElement elem) {
    return ResumeClusterResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Describes a <code>RevisionTarget</code>.
class RevisionTarget {
  /// A unique string that identifies the version to update the cluster to. You
  /// can use this value in <a>ModifyClusterDbRevision</a>.
  final String? databaseRevision;

  /// The date on which the database revision was released.
  final DateTime? databaseRevisionReleaseDate;

  /// A string that describes the changes and features that will be applied to the
  /// cluster when it is updated to the corresponding <a>ClusterDbRevision</a>.
  final String? description;

  RevisionTarget({
    this.databaseRevision,
    this.databaseRevisionReleaseDate,
    this.description,
  });
  factory RevisionTarget.fromXml(_s.XmlElement elem) {
    return RevisionTarget(
      databaseRevision: _s.extractXmlStringValue(elem, 'DatabaseRevision'),
      databaseRevisionReleaseDate:
          _s.extractXmlDateTimeValue(elem, 'DatabaseRevisionReleaseDate'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseRevision = this.databaseRevision;
    final databaseRevisionReleaseDate = this.databaseRevisionReleaseDate;
    final description = this.description;
    return {
      if (databaseRevision != null) 'DatabaseRevision': databaseRevision,
      if (databaseRevisionReleaseDate != null)
        'DatabaseRevisionReleaseDate':
            iso8601ToJson(databaseRevisionReleaseDate),
      if (description != null) 'Description': description,
    };
  }
}

class RevokeClusterSecurityGroupIngressResult {
  final ClusterSecurityGroup? clusterSecurityGroup;

  RevokeClusterSecurityGroupIngressResult({
    this.clusterSecurityGroup,
  });
  factory RevokeClusterSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeClusterSecurityGroupIngressResult(
      clusterSecurityGroup: _s
          .extractXmlChild(elem, 'ClusterSecurityGroup')
          ?.let(ClusterSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroup = this.clusterSecurityGroup;
    return {
      if (clusterSecurityGroup != null)
        'ClusterSecurityGroup': clusterSecurityGroup,
    };
  }
}

class RevokeSnapshotAccessResult {
  final Snapshot? snapshot;

  RevokeSnapshotAccessResult({
    this.snapshot,
  });
  factory RevokeSnapshotAccessResult.fromXml(_s.XmlElement elem) {
    return RevokeSnapshotAccessResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class RotateEncryptionKeyResult {
  final Cluster? cluster;

  RotateEncryptionKeyResult({
    this.cluster,
  });
  factory RotateEncryptionKeyResult.fromXml(_s.XmlElement elem) {
    return RotateEncryptionKeyResult(
      cluster: _s.extractXmlChild(elem, 'Cluster')?.let(Cluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

enum ScheduleState {
  modifying,
  active,
  failed,
}

extension ScheduleStateValueExtension on ScheduleState {
  String toValue() {
    switch (this) {
      case ScheduleState.modifying:
        return 'MODIFYING';
      case ScheduleState.active:
        return 'ACTIVE';
      case ScheduleState.failed:
        return 'FAILED';
    }
  }
}

extension ScheduleStateFromString on String {
  ScheduleState toScheduleState() {
    switch (this) {
      case 'MODIFYING':
        return ScheduleState.modifying;
      case 'ACTIVE':
        return ScheduleState.active;
      case 'FAILED':
        return ScheduleState.failed;
    }
    throw Exception('$this is not known in enum ScheduleState');
  }
}

/// Describes a scheduled action. You can use a scheduled action to trigger some
/// Amazon Redshift API operations on a schedule. For information about which
/// API operations can be scheduled, see <a>ScheduledActionType</a>.
class ScheduledAction {
  /// The end time in UTC when the schedule is no longer active. After this time,
  /// the scheduled action does not trigger.
  final DateTime? endTime;

  /// The IAM role to assume to run the scheduled action. This IAM role must have
  /// permission to run the Amazon Redshift API operation in the scheduled action.
  /// This IAM role must allow the Amazon Redshift scheduler (Principal
  /// scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For
  /// more information about the IAM role to use with the Amazon Redshift
  /// scheduler, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using
  /// Identity-Based Policies for Amazon Redshift</a> in the <i>Amazon Redshift
  /// Cluster Management Guide</i>.
  final String? iamRole;

  /// List of times when the scheduled action will run.
  final List<DateTime>? nextInvocations;

  /// The schedule for a one-time (at format) or recurring (cron format) scheduled
  /// action. Schedule invocations must be separated by at least one hour.
  ///
  /// Format of at expressions is "<code>at(yyyy-mm-ddThh:mm:ss)</code>". For
  /// example, "<code>at(2016-03-04T17:27:00)</code>".
  ///
  /// Format of cron expressions is "<code>cron(Minutes Hours Day-of-month Month
  /// Day-of-week Year)</code>". For example, "<code>cron(0 10 ? * MON *)</code>".
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  final String? schedule;

  /// The description of the scheduled action.
  final String? scheduledActionDescription;

  /// The name of the scheduled action.
  final String? scheduledActionName;

  /// The start time in UTC when the schedule is active. Before this time, the
  /// scheduled action does not trigger.
  final DateTime? startTime;

  /// The state of the scheduled action. For example, <code>DISABLED</code>.
  final ScheduledActionState? state;

  /// A JSON format string of the Amazon Redshift API operation with input
  /// parameters.
  ///
  /// "<code>{\"ResizeCluster\":{\"NodeType\":\"ds2.8xlarge\",\"ClusterIdentifier\":\"my-test-cluster\",\"NumberOfNodes\":3}}</code>".
  final ScheduledActionType? targetAction;

  ScheduledAction({
    this.endTime,
    this.iamRole,
    this.nextInvocations,
    this.schedule,
    this.scheduledActionDescription,
    this.scheduledActionName,
    this.startTime,
    this.state,
    this.targetAction,
  });
  factory ScheduledAction.fromXml(_s.XmlElement elem) {
    return ScheduledAction(
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      iamRole: _s.extractXmlStringValue(elem, 'IamRole'),
      nextInvocations: _s.extractXmlChild(elem, 'NextInvocations')?.let(
          (elem) =>
              _s.extractXmlDateTimeListValues(elem, 'ScheduledActionTime')),
      schedule: _s.extractXmlStringValue(elem, 'Schedule'),
      scheduledActionDescription:
          _s.extractXmlStringValue(elem, 'ScheduledActionDescription'),
      scheduledActionName:
          _s.extractXmlStringValue(elem, 'ScheduledActionName'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State')?.toScheduledActionState(),
      targetAction: _s
          .extractXmlChild(elem, 'TargetAction')
          ?.let(ScheduledActionType.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final iamRole = this.iamRole;
    final nextInvocations = this.nextInvocations;
    final schedule = this.schedule;
    final scheduledActionDescription = this.scheduledActionDescription;
    final scheduledActionName = this.scheduledActionName;
    final startTime = this.startTime;
    final state = this.state;
    final targetAction = this.targetAction;
    return {
      if (endTime != null) 'EndTime': iso8601ToJson(endTime),
      if (iamRole != null) 'IamRole': iamRole,
      if (nextInvocations != null)
        'NextInvocations': nextInvocations.map(unixTimestampToJson).toList(),
      if (schedule != null) 'Schedule': schedule,
      if (scheduledActionDescription != null)
        'ScheduledActionDescription': scheduledActionDescription,
      if (scheduledActionName != null)
        'ScheduledActionName': scheduledActionName,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (state != null) 'State': state.toValue(),
      if (targetAction != null) 'TargetAction': targetAction,
    };
  }
}

/// A set of elements to filter the returned scheduled actions.
class ScheduledActionFilter {
  /// The type of element to filter.
  final ScheduledActionFilterName name;

  /// List of values. Compare if the value (of type defined by <code>Name</code>)
  /// equals an item in the list of scheduled actions.
  final List<String> values;

  ScheduledActionFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum ScheduledActionFilterName {
  clusterIdentifier,
  iamRole,
}

extension ScheduledActionFilterNameValueExtension on ScheduledActionFilterName {
  String toValue() {
    switch (this) {
      case ScheduledActionFilterName.clusterIdentifier:
        return 'cluster-identifier';
      case ScheduledActionFilterName.iamRole:
        return 'iam-role';
    }
  }
}

extension ScheduledActionFilterNameFromString on String {
  ScheduledActionFilterName toScheduledActionFilterName() {
    switch (this) {
      case 'cluster-identifier':
        return ScheduledActionFilterName.clusterIdentifier;
      case 'iam-role':
        return ScheduledActionFilterName.iamRole;
    }
    throw Exception('$this is not known in enum ScheduledActionFilterName');
  }
}

enum ScheduledActionState {
  active,
  disabled,
}

extension ScheduledActionStateValueExtension on ScheduledActionState {
  String toValue() {
    switch (this) {
      case ScheduledActionState.active:
        return 'ACTIVE';
      case ScheduledActionState.disabled:
        return 'DISABLED';
    }
  }
}

extension ScheduledActionStateFromString on String {
  ScheduledActionState toScheduledActionState() {
    switch (this) {
      case 'ACTIVE':
        return ScheduledActionState.active;
      case 'DISABLED':
        return ScheduledActionState.disabled;
    }
    throw Exception('$this is not known in enum ScheduledActionState');
  }
}

/// The action type that specifies an Amazon Redshift API operation that is
/// supported by the Amazon Redshift scheduler.
class ScheduledActionType {
  /// An action that runs a <code>PauseCluster</code> API operation.
  final PauseClusterMessage? pauseCluster;

  /// An action that runs a <code>ResizeCluster</code> API operation.
  final ResizeClusterMessage? resizeCluster;

  /// An action that runs a <code>ResumeCluster</code> API operation.
  final ResumeClusterMessage? resumeCluster;

  ScheduledActionType({
    this.pauseCluster,
    this.resizeCluster,
    this.resumeCluster,
  });
  factory ScheduledActionType.fromXml(_s.XmlElement elem) {
    return ScheduledActionType(
      pauseCluster: _s
          .extractXmlChild(elem, 'PauseCluster')
          ?.let(PauseClusterMessage.fromXml),
      resizeCluster: _s
          .extractXmlChild(elem, 'ResizeCluster')
          ?.let(ResizeClusterMessage.fromXml),
      resumeCluster: _s
          .extractXmlChild(elem, 'ResumeCluster')
          ?.let(ResumeClusterMessage.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final pauseCluster = this.pauseCluster;
    final resizeCluster = this.resizeCluster;
    final resumeCluster = this.resumeCluster;
    return {
      if (pauseCluster != null) 'PauseCluster': pauseCluster,
      if (resizeCluster != null) 'ResizeCluster': resizeCluster,
      if (resumeCluster != null) 'ResumeCluster': resumeCluster,
    };
  }
}

enum ScheduledActionTypeValues {
  resizeCluster,
  pauseCluster,
  resumeCluster,
}

extension ScheduledActionTypeValuesValueExtension on ScheduledActionTypeValues {
  String toValue() {
    switch (this) {
      case ScheduledActionTypeValues.resizeCluster:
        return 'ResizeCluster';
      case ScheduledActionTypeValues.pauseCluster:
        return 'PauseCluster';
      case ScheduledActionTypeValues.resumeCluster:
        return 'ResumeCluster';
    }
  }
}

extension ScheduledActionTypeValuesFromString on String {
  ScheduledActionTypeValues toScheduledActionTypeValues() {
    switch (this) {
      case 'ResizeCluster':
        return ScheduledActionTypeValues.resizeCluster;
      case 'PauseCluster':
        return ScheduledActionTypeValues.pauseCluster;
      case 'ResumeCluster':
        return ScheduledActionTypeValues.resumeCluster;
    }
    throw Exception('$this is not known in enum ScheduledActionTypeValues');
  }
}

class ScheduledActionsMessage {
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a <a>DescribeScheduledActions</a>
  /// request exceed the value specified in <code>MaxRecords</code>, Amazon Web
  /// Services returns a value in the <code>Marker</code> field of the response.
  /// You can retrieve the next set of response records by providing the returned
  /// marker value in the <code>Marker</code> parameter and retrying the request.
  final String? marker;

  /// List of retrieved scheduled actions.
  final List<ScheduledAction>? scheduledActions;

  ScheduledActionsMessage({
    this.marker,
    this.scheduledActions,
  });
  factory ScheduledActionsMessage.fromXml(_s.XmlElement elem) {
    return ScheduledActionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      scheduledActions: _s.extractXmlChild(elem, 'ScheduledActions')?.let(
          (elem) => elem
              .findElements('ScheduledAction')
              .map(ScheduledAction.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final scheduledActions = this.scheduledActions;
    return {
      if (marker != null) 'Marker': marker,
      if (scheduledActions != null) 'ScheduledActions': scheduledActions,
    };
  }
}

/// The AvailabilityZone and ClusterNodes information of the secondary compute
/// unit.
class SecondaryClusterInfo {
  /// The name of the Availability Zone in which the secondary compute unit of the
  /// cluster is located.
  final String? availabilityZone;

  /// The nodes in the secondary compute unit.
  final List<ClusterNode>? clusterNodes;

  SecondaryClusterInfo({
    this.availabilityZone,
    this.clusterNodes,
  });
  factory SecondaryClusterInfo.fromXml(_s.XmlElement elem) {
    return SecondaryClusterInfo(
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      clusterNodes: _s.extractXmlChild(elem, 'ClusterNodes')?.let((elem) =>
          elem.findElements('member').map(ClusterNode.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final clusterNodes = this.clusterNodes;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (clusterNodes != null) 'ClusterNodes': clusterNodes,
    };
  }
}

enum ServiceAuthorization {
  enabled,
  disabled,
}

extension ServiceAuthorizationValueExtension on ServiceAuthorization {
  String toValue() {
    switch (this) {
      case ServiceAuthorization.enabled:
        return 'Enabled';
      case ServiceAuthorization.disabled:
        return 'Disabled';
    }
  }
}

extension ServiceAuthorizationFromString on String {
  ServiceAuthorization toServiceAuthorization() {
    switch (this) {
      case 'Enabled':
        return ServiceAuthorization.enabled;
      case 'Disabled':
        return ServiceAuthorization.disabled;
    }
    throw Exception('$this is not known in enum ServiceAuthorization');
  }
}

/// A list of service integrations.
class ServiceIntegrationsUnion {
  /// A list of scopes set up for Lake Formation integration.
  final List<LakeFormationScopeUnion>? lakeFormation;

  ServiceIntegrationsUnion({
    this.lakeFormation,
  });
  factory ServiceIntegrationsUnion.fromXml(_s.XmlElement elem) {
    return ServiceIntegrationsUnion(
      lakeFormation: _s.extractXmlChild(elem, 'LakeFormation')?.let((elem) =>
          elem
              .findElements('member')
              .map(LakeFormationScopeUnion.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final lakeFormation = this.lakeFormation;
    return {
      if (lakeFormation != null) 'LakeFormation': lakeFormation,
    };
  }
}

/// Describes a snapshot.
class Snapshot {
  /// A list of the Amazon Web Services accounts authorized to restore the
  /// snapshot. Returns <code>null</code> if no accounts are authorized. Visible
  /// only to the snapshot owner.
  final List<AccountWithRestoreAccess>? accountsWithRestoreAccess;

  /// The size of the incremental backup.
  final double? actualIncrementalBackupSizeInMegaBytes;

  /// The Availability Zone in which the cluster was created.
  final String? availabilityZone;

  /// The number of megabytes that have been transferred to the snapshot backup.
  final double? backupProgressInMegaBytes;

  /// The time (UTC) when the cluster was originally created.
  final DateTime? clusterCreateTime;

  /// The identifier of the cluster for which the snapshot was taken.
  final String? clusterIdentifier;

  /// The version ID of the Amazon Redshift engine that is running on the cluster.
  final String? clusterVersion;

  /// The number of megabytes per second being transferred to the snapshot backup.
  /// Returns <code>0</code> for a completed backup.
  final double? currentBackupRateInMegaBytesPerSecond;

  /// The name of the database that was created when the cluster was created.
  final String? dBName;

  /// The amount of time an in-progress snapshot backup has been running, or the
  /// amount of time it took a completed backup to finish.
  final int? elapsedTimeInSeconds;

  /// If <code>true</code>, the data in the snapshot is encrypted at rest.
  final bool? encrypted;

  /// A boolean that indicates whether the snapshot data is encrypted using the
  /// HSM keys of the source cluster. <code>true</code> indicates that the data is
  /// encrypted using HSM keys.
  final bool? encryptedWithHSM;

  /// The cluster version of the cluster used to create the snapshot. For example,
  /// 1.0.15503.
  final String? engineFullVersion;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced
  /// VPC Routing</a> in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is <code>true</code>, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool? enhancedVpcRouting;

  /// The estimate of the time remaining before the snapshot backup will complete.
  /// Returns <code>0</code> for a completed backup.
  final int? estimatedSecondsToCompletion;

  /// The Key Management Service (KMS) key ID of the encryption key that was used
  /// to encrypt data in the cluster from which the snapshot was taken.
  final String? kmsKeyId;

  /// The name of the maintenance track for the snapshot.
  final String? maintenanceTrackName;

  /// The number of days until a manual snapshot will pass its retention period.
  final int? manualSnapshotRemainingDays;

  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int? manualSnapshotRetentionPeriod;

  /// The Amazon Resource Name (ARN) for the cluster's admin user credentials
  /// secret.
  final String? masterPasswordSecretArn;

  /// The ID of the Key Management Service (KMS) key used to encrypt and store the
  /// cluster's admin credentials secret.
  final String? masterPasswordSecretKmsKeyId;

  /// The admin user name for the cluster.
  final String? masterUsername;

  /// The node type of the nodes in the cluster.
  final String? nodeType;

  /// The number of nodes in the cluster.
  final int? numberOfNodes;

  /// For manual snapshots, the Amazon Web Services account used to create or copy
  /// the snapshot. For automatic snapshots, the owner of the cluster. The owner
  /// can perform all snapshot actions, such as sharing a manual snapshot.
  final String? ownerAccount;

  /// The port that the cluster is listening on.
  final int? port;

  /// The list of node types that this cluster snapshot is able to restore into.
  final List<String>? restorableNodeTypes;

  /// The Amazon Resource Name (ARN) of the snapshot.
  final String? snapshotArn;

  /// The time (in UTC format) when Amazon Redshift began the snapshot. A snapshot
  /// contains a copy of the cluster data as of this exact time.
  final DateTime? snapshotCreateTime;

  /// The snapshot identifier that is provided in the request.
  final String? snapshotIdentifier;

  /// A timestamp representing the start of the retention period for the snapshot.
  final DateTime? snapshotRetentionStartTime;

  /// The snapshot type. Snapshots created using <a>CreateClusterSnapshot</a> and
  /// <a>CopyClusterSnapshot</a> are of type "manual".
  final String? snapshotType;

  /// The source region from which the snapshot was copied.
  final String? sourceRegion;

  /// The snapshot status. The value of the status depends on the API operation
  /// used:
  ///
  /// <ul>
  /// <li>
  /// <a>CreateClusterSnapshot</a> and <a>CopyClusterSnapshot</a> returns status
  /// as "creating".
  /// </li>
  /// <li>
  /// <a>DescribeClusterSnapshots</a> returns status as "creating", "available",
  /// "final snapshot", or "failed".
  /// </li>
  /// <li>
  /// <a>DeleteClusterSnapshot</a> returns status as "deleted".
  /// </li>
  /// </ul>
  final String? status;

  /// The list of tags for the cluster snapshot.
  final List<Tag>? tags;

  /// The size of the complete set of backup data that would be used to restore
  /// the cluster.
  final double? totalBackupSizeInMegaBytes;

  /// The VPC identifier of the cluster if the snapshot is from a cluster in a
  /// VPC. Otherwise, this field is not in the output.
  final String? vpcId;

  Snapshot({
    this.accountsWithRestoreAccess,
    this.actualIncrementalBackupSizeInMegaBytes,
    this.availabilityZone,
    this.backupProgressInMegaBytes,
    this.clusterCreateTime,
    this.clusterIdentifier,
    this.clusterVersion,
    this.currentBackupRateInMegaBytesPerSecond,
    this.dBName,
    this.elapsedTimeInSeconds,
    this.encrypted,
    this.encryptedWithHSM,
    this.engineFullVersion,
    this.enhancedVpcRouting,
    this.estimatedSecondsToCompletion,
    this.kmsKeyId,
    this.maintenanceTrackName,
    this.manualSnapshotRemainingDays,
    this.manualSnapshotRetentionPeriod,
    this.masterPasswordSecretArn,
    this.masterPasswordSecretKmsKeyId,
    this.masterUsername,
    this.nodeType,
    this.numberOfNodes,
    this.ownerAccount,
    this.port,
    this.restorableNodeTypes,
    this.snapshotArn,
    this.snapshotCreateTime,
    this.snapshotIdentifier,
    this.snapshotRetentionStartTime,
    this.snapshotType,
    this.sourceRegion,
    this.status,
    this.tags,
    this.totalBackupSizeInMegaBytes,
    this.vpcId,
  });
  factory Snapshot.fromXml(_s.XmlElement elem) {
    return Snapshot(
      accountsWithRestoreAccess: _s
          .extractXmlChild(elem, 'AccountsWithRestoreAccess')
          ?.let((elem) => elem
              .findElements('AccountWithRestoreAccess')
              .map(AccountWithRestoreAccess.fromXml)
              .toList()),
      actualIncrementalBackupSizeInMegaBytes: _s.extractXmlDoubleValue(
          elem, 'ActualIncrementalBackupSizeInMegaBytes'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupProgressInMegaBytes:
          _s.extractXmlDoubleValue(elem, 'BackupProgressInMegaBytes'),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      clusterVersion: _s.extractXmlStringValue(elem, 'ClusterVersion'),
      currentBackupRateInMegaBytesPerSecond: _s.extractXmlDoubleValue(
          elem, 'CurrentBackupRateInMegaBytesPerSecond'),
      dBName: _s.extractXmlStringValue(elem, 'DBName'),
      elapsedTimeInSeconds: _s.extractXmlIntValue(elem, 'ElapsedTimeInSeconds'),
      encrypted: _s.extractXmlBoolValue(elem, 'Encrypted'),
      encryptedWithHSM: _s.extractXmlBoolValue(elem, 'EncryptedWithHSM'),
      engineFullVersion: _s.extractXmlStringValue(elem, 'EngineFullVersion'),
      enhancedVpcRouting: _s.extractXmlBoolValue(elem, 'EnhancedVpcRouting'),
      estimatedSecondsToCompletion:
          _s.extractXmlIntValue(elem, 'EstimatedSecondsToCompletion'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      maintenanceTrackName:
          _s.extractXmlStringValue(elem, 'MaintenanceTrackName'),
      manualSnapshotRemainingDays:
          _s.extractXmlIntValue(elem, 'ManualSnapshotRemainingDays'),
      manualSnapshotRetentionPeriod:
          _s.extractXmlIntValue(elem, 'ManualSnapshotRetentionPeriod'),
      masterPasswordSecretArn:
          _s.extractXmlStringValue(elem, 'MasterPasswordSecretArn'),
      masterPasswordSecretKmsKeyId:
          _s.extractXmlStringValue(elem, 'MasterPasswordSecretKmsKeyId'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      nodeType: _s.extractXmlStringValue(elem, 'NodeType'),
      numberOfNodes: _s.extractXmlIntValue(elem, 'NumberOfNodes'),
      ownerAccount: _s.extractXmlStringValue(elem, 'OwnerAccount'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      restorableNodeTypes: _s
          .extractXmlChild(elem, 'RestorableNodeTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'NodeType')),
      snapshotArn: _s.extractXmlStringValue(elem, 'SnapshotArn'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotIdentifier: _s.extractXmlStringValue(elem, 'SnapshotIdentifier'),
      snapshotRetentionStartTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotRetentionStartTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      sourceRegion: _s.extractXmlStringValue(elem, 'SourceRegion'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
      totalBackupSizeInMegaBytes:
          _s.extractXmlDoubleValue(elem, 'TotalBackupSizeInMegaBytes'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountsWithRestoreAccess = this.accountsWithRestoreAccess;
    final actualIncrementalBackupSizeInMegaBytes =
        this.actualIncrementalBackupSizeInMegaBytes;
    final availabilityZone = this.availabilityZone;
    final backupProgressInMegaBytes = this.backupProgressInMegaBytes;
    final clusterCreateTime = this.clusterCreateTime;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterVersion = this.clusterVersion;
    final currentBackupRateInMegaBytesPerSecond =
        this.currentBackupRateInMegaBytesPerSecond;
    final dBName = this.dBName;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final encrypted = this.encrypted;
    final encryptedWithHSM = this.encryptedWithHSM;
    final engineFullVersion = this.engineFullVersion;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final estimatedSecondsToCompletion = this.estimatedSecondsToCompletion;
    final kmsKeyId = this.kmsKeyId;
    final maintenanceTrackName = this.maintenanceTrackName;
    final manualSnapshotRemainingDays = this.manualSnapshotRemainingDays;
    final manualSnapshotRetentionPeriod = this.manualSnapshotRetentionPeriod;
    final masterPasswordSecretArn = this.masterPasswordSecretArn;
    final masterPasswordSecretKmsKeyId = this.masterPasswordSecretKmsKeyId;
    final masterUsername = this.masterUsername;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final ownerAccount = this.ownerAccount;
    final port = this.port;
    final restorableNodeTypes = this.restorableNodeTypes;
    final snapshotArn = this.snapshotArn;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotIdentifier = this.snapshotIdentifier;
    final snapshotRetentionStartTime = this.snapshotRetentionStartTime;
    final snapshotType = this.snapshotType;
    final sourceRegion = this.sourceRegion;
    final status = this.status;
    final tags = this.tags;
    final totalBackupSizeInMegaBytes = this.totalBackupSizeInMegaBytes;
    final vpcId = this.vpcId;
    return {
      if (accountsWithRestoreAccess != null)
        'AccountsWithRestoreAccess': accountsWithRestoreAccess,
      if (actualIncrementalBackupSizeInMegaBytes != null)
        'ActualIncrementalBackupSizeInMegaBytes':
            actualIncrementalBackupSizeInMegaBytes,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (backupProgressInMegaBytes != null)
        'BackupProgressInMegaBytes': backupProgressInMegaBytes,
      if (clusterCreateTime != null)
        'ClusterCreateTime': iso8601ToJson(clusterCreateTime),
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (currentBackupRateInMegaBytesPerSecond != null)
        'CurrentBackupRateInMegaBytesPerSecond':
            currentBackupRateInMegaBytesPerSecond,
      if (dBName != null) 'DBName': dBName,
      if (elapsedTimeInSeconds != null)
        'ElapsedTimeInSeconds': elapsedTimeInSeconds,
      if (encrypted != null) 'Encrypted': encrypted,
      if (encryptedWithHSM != null) 'EncryptedWithHSM': encryptedWithHSM,
      if (engineFullVersion != null) 'EngineFullVersion': engineFullVersion,
      if (enhancedVpcRouting != null) 'EnhancedVpcRouting': enhancedVpcRouting,
      if (estimatedSecondsToCompletion != null)
        'EstimatedSecondsToCompletion': estimatedSecondsToCompletion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (manualSnapshotRemainingDays != null)
        'ManualSnapshotRemainingDays': manualSnapshotRemainingDays,
      if (manualSnapshotRetentionPeriod != null)
        'ManualSnapshotRetentionPeriod': manualSnapshotRetentionPeriod,
      if (masterPasswordSecretArn != null)
        'MasterPasswordSecretArn': masterPasswordSecretArn,
      if (masterPasswordSecretKmsKeyId != null)
        'MasterPasswordSecretKmsKeyId': masterPasswordSecretKmsKeyId,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (ownerAccount != null) 'OwnerAccount': ownerAccount,
      if (port != null) 'Port': port,
      if (restorableNodeTypes != null)
        'RestorableNodeTypes': restorableNodeTypes,
      if (snapshotArn != null) 'SnapshotArn': snapshotArn,
      if (snapshotCreateTime != null)
        'SnapshotCreateTime': iso8601ToJson(snapshotCreateTime),
      if (snapshotIdentifier != null) 'SnapshotIdentifier': snapshotIdentifier,
      if (snapshotRetentionStartTime != null)
        'SnapshotRetentionStartTime': iso8601ToJson(snapshotRetentionStartTime),
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (sourceRegion != null) 'SourceRegion': sourceRegion,
      if (status != null) 'Status': status,
      if (tags != null) 'Tags': tags,
      if (totalBackupSizeInMegaBytes != null)
        'TotalBackupSizeInMegaBytes': totalBackupSizeInMegaBytes,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum SnapshotAttributeToSortBy {
  sourceType,
  totalSize,
  createTime,
}

extension SnapshotAttributeToSortByValueExtension on SnapshotAttributeToSortBy {
  String toValue() {
    switch (this) {
      case SnapshotAttributeToSortBy.sourceType:
        return 'SOURCE_TYPE';
      case SnapshotAttributeToSortBy.totalSize:
        return 'TOTAL_SIZE';
      case SnapshotAttributeToSortBy.createTime:
        return 'CREATE_TIME';
    }
  }
}

extension SnapshotAttributeToSortByFromString on String {
  SnapshotAttributeToSortBy toSnapshotAttributeToSortBy() {
    switch (this) {
      case 'SOURCE_TYPE':
        return SnapshotAttributeToSortBy.sourceType;
      case 'TOTAL_SIZE':
        return SnapshotAttributeToSortBy.totalSize;
      case 'CREATE_TIME':
        return SnapshotAttributeToSortBy.createTime;
    }
    throw Exception('$this is not known in enum SnapshotAttributeToSortBy');
  }
}

/// The snapshot copy grant that grants Amazon Redshift permission to encrypt
/// copied snapshots with the specified encrypted symmetric key from Amazon Web
/// Services KMS in the destination region.
///
/// For more information about managing snapshot copy grants, go to <a
/// href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon
/// Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster
/// Management Guide</i>.
class SnapshotCopyGrant {
  /// The unique identifier of the encrypted symmetric key in Amazon Web Services
  /// KMS to which Amazon Redshift is granted permission.
  final String? kmsKeyId;

  /// The name of the snapshot copy grant.
  final String? snapshotCopyGrantName;

  /// A list of tag instances.
  final List<Tag>? tags;

  SnapshotCopyGrant({
    this.kmsKeyId,
    this.snapshotCopyGrantName,
    this.tags,
  });
  factory SnapshotCopyGrant.fromXml(_s.XmlElement elem) {
    return SnapshotCopyGrant(
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      snapshotCopyGrantName:
          _s.extractXmlStringValue(elem, 'SnapshotCopyGrantName'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final snapshotCopyGrantName = this.snapshotCopyGrantName;
    final tags = this.tags;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (snapshotCopyGrantName != null)
        'SnapshotCopyGrantName': snapshotCopyGrantName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// <p/>
class SnapshotCopyGrantMessage {
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a
  /// <code>DescribeSnapshotCopyGrant</code> request exceed the value specified in
  /// <code>MaxRecords</code>, Amazon Web Services returns a value in the
  /// <code>Marker</code> field of the response. You can retrieve the next set of
  /// response records by providing the returned marker value in the
  /// <code>Marker</code> parameter and retrying the request.
  ///
  /// Constraints: You can specify either the <b>SnapshotCopyGrantName</b>
  /// parameter or the <b>Marker</b> parameter, but not both.
  final String? marker;

  /// The list of <code>SnapshotCopyGrant</code> objects.
  final List<SnapshotCopyGrant>? snapshotCopyGrants;

  SnapshotCopyGrantMessage({
    this.marker,
    this.snapshotCopyGrants,
  });
  factory SnapshotCopyGrantMessage.fromXml(_s.XmlElement elem) {
    return SnapshotCopyGrantMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      snapshotCopyGrants: _s.extractXmlChild(elem, 'SnapshotCopyGrants')?.let(
          (elem) => elem
              .findElements('SnapshotCopyGrant')
              .map(SnapshotCopyGrant.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final snapshotCopyGrants = this.snapshotCopyGrants;
    return {
      if (marker != null) 'Marker': marker,
      if (snapshotCopyGrants != null) 'SnapshotCopyGrants': snapshotCopyGrants,
    };
  }
}

/// Describes the errors returned by a snapshot.
class SnapshotErrorMessage {
  /// The failure code for the error.
  final String? failureCode;

  /// The text message describing the error.
  final String? failureReason;

  /// A unique identifier for the cluster.
  final String? snapshotClusterIdentifier;

  /// A unique identifier for the snapshot returning the error.
  final String? snapshotIdentifier;

  SnapshotErrorMessage({
    this.failureCode,
    this.failureReason,
    this.snapshotClusterIdentifier,
    this.snapshotIdentifier,
  });
  factory SnapshotErrorMessage.fromXml(_s.XmlElement elem) {
    return SnapshotErrorMessage(
      failureCode: _s.extractXmlStringValue(elem, 'FailureCode'),
      failureReason: _s.extractXmlStringValue(elem, 'FailureReason'),
      snapshotClusterIdentifier:
          _s.extractXmlStringValue(elem, 'SnapshotClusterIdentifier'),
      snapshotIdentifier: _s.extractXmlStringValue(elem, 'SnapshotIdentifier'),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final snapshotClusterIdentifier = this.snapshotClusterIdentifier;
    final snapshotIdentifier = this.snapshotIdentifier;
    return {
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureReason != null) 'FailureReason': failureReason,
      if (snapshotClusterIdentifier != null)
        'SnapshotClusterIdentifier': snapshotClusterIdentifier,
      if (snapshotIdentifier != null) 'SnapshotIdentifier': snapshotIdentifier,
    };
  }
}

/// Contains the output from the <a>DescribeClusterSnapshots</a> action.
class SnapshotMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of <a>Snapshot</a> instances.
  final List<Snapshot>? snapshots;

  SnapshotMessage({
    this.marker,
    this.snapshots,
  });
  factory SnapshotMessage.fromXml(_s.XmlElement elem) {
    return SnapshotMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      snapshots: _s.extractXmlChild(elem, 'Snapshots')?.let((elem) =>
          elem.findElements('Snapshot').map(Snapshot.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final snapshots = this.snapshots;
    return {
      if (marker != null) 'Marker': marker,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

/// Describes a snapshot schedule. You can set a regular interval for creating
/// snapshots of a cluster. You can also schedule snapshots for specific dates.
class SnapshotSchedule {
  /// The number of clusters associated with the schedule.
  final int? associatedClusterCount;

  /// A list of clusters associated with the schedule. A maximum of 100 clusters
  /// is returned.
  final List<ClusterAssociatedToSchedule>? associatedClusters;

  /// <p/>
  final List<DateTime>? nextInvocations;

  /// A list of ScheduleDefinitions.
  final List<String>? scheduleDefinitions;

  /// The description of the schedule.
  final String? scheduleDescription;

  /// A unique identifier for the schedule.
  final String? scheduleIdentifier;

  /// An optional set of tags describing the schedule.
  final List<Tag>? tags;

  SnapshotSchedule({
    this.associatedClusterCount,
    this.associatedClusters,
    this.nextInvocations,
    this.scheduleDefinitions,
    this.scheduleDescription,
    this.scheduleIdentifier,
    this.tags,
  });
  factory SnapshotSchedule.fromXml(_s.XmlElement elem) {
    return SnapshotSchedule(
      associatedClusterCount:
          _s.extractXmlIntValue(elem, 'AssociatedClusterCount'),
      associatedClusters: _s.extractXmlChild(elem, 'AssociatedClusters')?.let(
          (elem) => elem
              .findElements('ClusterAssociatedToSchedule')
              .map(ClusterAssociatedToSchedule.fromXml)
              .toList()),
      nextInvocations: _s.extractXmlChild(elem, 'NextInvocations')?.let(
          (elem) => _s.extractXmlDateTimeListValues(elem, 'SnapshotTime')),
      scheduleDefinitions: _s.extractXmlChild(elem, 'ScheduleDefinitions')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'ScheduleDefinition')),
      scheduleDescription:
          _s.extractXmlStringValue(elem, 'ScheduleDescription'),
      scheduleIdentifier: _s.extractXmlStringValue(elem, 'ScheduleIdentifier'),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedClusterCount = this.associatedClusterCount;
    final associatedClusters = this.associatedClusters;
    final nextInvocations = this.nextInvocations;
    final scheduleDefinitions = this.scheduleDefinitions;
    final scheduleDescription = this.scheduleDescription;
    final scheduleIdentifier = this.scheduleIdentifier;
    final tags = this.tags;
    return {
      if (associatedClusterCount != null)
        'AssociatedClusterCount': associatedClusterCount,
      if (associatedClusters != null) 'AssociatedClusters': associatedClusters,
      if (nextInvocations != null)
        'NextInvocations': nextInvocations.map(unixTimestampToJson).toList(),
      if (scheduleDefinitions != null)
        'ScheduleDefinitions': scheduleDefinitions,
      if (scheduleDescription != null)
        'ScheduleDescription': scheduleDescription,
      if (scheduleIdentifier != null) 'ScheduleIdentifier': scheduleIdentifier,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes a sorting entity
class SnapshotSortingEntity {
  /// The category for sorting the snapshots.
  final SnapshotAttributeToSortBy attribute;

  /// The order for listing the attributes.
  final SortByOrder? sortOrder;

  SnapshotSortingEntity({
    required this.attribute,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final sortOrder = this.sortOrder;
    return {
      'Attribute': attribute.toValue(),
      if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
    };
  }
}

enum SortByOrder {
  asc,
  desc,
}

extension SortByOrderValueExtension on SortByOrder {
  String toValue() {
    switch (this) {
      case SortByOrder.asc:
        return 'ASC';
      case SortByOrder.desc:
        return 'DESC';
    }
  }
}

extension SortByOrderFromString on String {
  SortByOrder toSortByOrder() {
    switch (this) {
      case 'ASC':
        return SortByOrder.asc;
      case 'DESC':
        return SortByOrder.desc;
    }
    throw Exception('$this is not known in enum SortByOrder');
  }
}

enum SourceType {
  cluster,
  clusterParameterGroup,
  clusterSecurityGroup,
  clusterSnapshot,
  scheduledAction,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.cluster:
        return 'cluster';
      case SourceType.clusterParameterGroup:
        return 'cluster-parameter-group';
      case SourceType.clusterSecurityGroup:
        return 'cluster-security-group';
      case SourceType.clusterSnapshot:
        return 'cluster-snapshot';
      case SourceType.scheduledAction:
        return 'scheduled-action';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'cluster':
        return SourceType.cluster;
      case 'cluster-parameter-group':
        return SourceType.clusterParameterGroup;
      case 'cluster-security-group':
        return SourceType.clusterSecurityGroup;
      case 'cluster-snapshot':
        return SourceType.clusterSnapshot;
      case 'scheduled-action':
        return SourceType.scheduledAction;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Describes a subnet.
class Subnet {
  /// <p/>
  final AvailabilityZone? subnetAvailabilityZone;

  /// The identifier of the subnet.
  final String? subnetIdentifier;

  /// The status of the subnet.
  final String? subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let(AvailabilityZone.fromXml),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    final subnetStatus = this.subnetStatus;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
      if (subnetStatus != null) 'SubnetStatus': subnetStatus,
    };
  }
}

/// Describes the operations that are allowed on a maintenance track.
class SupportedOperation {
  /// A list of the supported operations.
  final String? operationName;

  SupportedOperation({
    this.operationName,
  });
  factory SupportedOperation.fromXml(_s.XmlElement elem) {
    return SupportedOperation(
      operationName: _s.extractXmlStringValue(elem, 'OperationName'),
    );
  }

  Map<String, dynamic> toJson() {
    final operationName = this.operationName;
    return {
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// A list of supported platforms for orderable clusters.
class SupportedPlatform {
  /// <p/>
  final String? name;

  SupportedPlatform({
    this.name,
  });
  factory SupportedPlatform.fromXml(_s.XmlElement elem) {
    return SupportedPlatform(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Describes the status of a <a>RestoreTableFromClusterSnapshot</a> operation.
class TableRestoreStatus {
  /// The identifier of the Amazon Redshift cluster that the table is being
  /// restored to.
  final String? clusterIdentifier;

  /// A description of the status of the table restore request. Status values
  /// include <code>SUCCEEDED</code>, <code>FAILED</code>, <code>CANCELED</code>,
  /// <code>PENDING</code>, <code>IN_PROGRESS</code>.
  final String? message;

  /// The name of the table to create as a result of the table restore request.
  final String? newTableName;

  /// The amount of data restored to the new table so far, in megabytes (MB).
  final int? progressInMegaBytes;

  /// The time that the table restore request was made, in Universal Coordinated
  /// Time (UTC).
  final DateTime? requestTime;

  /// The identifier of the snapshot that the table is being restored from.
  final String? snapshotIdentifier;

  /// The name of the source database that contains the table being restored.
  final String? sourceDatabaseName;

  /// The name of the source schema that contains the table being restored.
  final String? sourceSchemaName;

  /// The name of the source table being restored.
  final String? sourceTableName;

  /// A value that describes the current state of the table restore request.
  ///
  /// Valid Values: <code>SUCCEEDED</code>, <code>FAILED</code>,
  /// <code>CANCELED</code>, <code>PENDING</code>, <code>IN_PROGRESS</code>
  final TableRestoreStatusType? status;

  /// The unique identifier for the table restore request.
  final String? tableRestoreRequestId;

  /// The name of the database to restore the table to.
  final String? targetDatabaseName;

  /// The name of the schema to restore the table to.
  final String? targetSchemaName;

  /// The total amount of data to restore to the new table, in megabytes (MB).
  final int? totalDataInMegaBytes;

  TableRestoreStatus({
    this.clusterIdentifier,
    this.message,
    this.newTableName,
    this.progressInMegaBytes,
    this.requestTime,
    this.snapshotIdentifier,
    this.sourceDatabaseName,
    this.sourceSchemaName,
    this.sourceTableName,
    this.status,
    this.tableRestoreRequestId,
    this.targetDatabaseName,
    this.targetSchemaName,
    this.totalDataInMegaBytes,
  });
  factory TableRestoreStatus.fromXml(_s.XmlElement elem) {
    return TableRestoreStatus(
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      newTableName: _s.extractXmlStringValue(elem, 'NewTableName'),
      progressInMegaBytes: _s.extractXmlIntValue(elem, 'ProgressInMegaBytes'),
      requestTime: _s.extractXmlDateTimeValue(elem, 'RequestTime'),
      snapshotIdentifier: _s.extractXmlStringValue(elem, 'SnapshotIdentifier'),
      sourceDatabaseName: _s.extractXmlStringValue(elem, 'SourceDatabaseName'),
      sourceSchemaName: _s.extractXmlStringValue(elem, 'SourceSchemaName'),
      sourceTableName: _s.extractXmlStringValue(elem, 'SourceTableName'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toTableRestoreStatusType(),
      tableRestoreRequestId:
          _s.extractXmlStringValue(elem, 'TableRestoreRequestId'),
      targetDatabaseName: _s.extractXmlStringValue(elem, 'TargetDatabaseName'),
      targetSchemaName: _s.extractXmlStringValue(elem, 'TargetSchemaName'),
      totalDataInMegaBytes: _s.extractXmlIntValue(elem, 'TotalDataInMegaBytes'),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final message = this.message;
    final newTableName = this.newTableName;
    final progressInMegaBytes = this.progressInMegaBytes;
    final requestTime = this.requestTime;
    final snapshotIdentifier = this.snapshotIdentifier;
    final sourceDatabaseName = this.sourceDatabaseName;
    final sourceSchemaName = this.sourceSchemaName;
    final sourceTableName = this.sourceTableName;
    final status = this.status;
    final tableRestoreRequestId = this.tableRestoreRequestId;
    final targetDatabaseName = this.targetDatabaseName;
    final targetSchemaName = this.targetSchemaName;
    final totalDataInMegaBytes = this.totalDataInMegaBytes;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (message != null) 'Message': message,
      if (newTableName != null) 'NewTableName': newTableName,
      if (progressInMegaBytes != null)
        'ProgressInMegaBytes': progressInMegaBytes,
      if (requestTime != null) 'RequestTime': iso8601ToJson(requestTime),
      if (snapshotIdentifier != null) 'SnapshotIdentifier': snapshotIdentifier,
      if (sourceDatabaseName != null) 'SourceDatabaseName': sourceDatabaseName,
      if (sourceSchemaName != null) 'SourceSchemaName': sourceSchemaName,
      if (sourceTableName != null) 'SourceTableName': sourceTableName,
      if (status != null) 'Status': status.toValue(),
      if (tableRestoreRequestId != null)
        'TableRestoreRequestId': tableRestoreRequestId,
      if (targetDatabaseName != null) 'TargetDatabaseName': targetDatabaseName,
      if (targetSchemaName != null) 'TargetSchemaName': targetSchemaName,
      if (totalDataInMegaBytes != null)
        'TotalDataInMegaBytes': totalDataInMegaBytes,
    };
  }
}

/// <p/>
class TableRestoreStatusMessage {
  /// A pagination token that can be used in a subsequent
  /// <a>DescribeTableRestoreStatus</a> request.
  final String? marker;

  /// A list of status details for one or more table restore requests.
  final List<TableRestoreStatus>? tableRestoreStatusDetails;

  TableRestoreStatusMessage({
    this.marker,
    this.tableRestoreStatusDetails,
  });
  factory TableRestoreStatusMessage.fromXml(_s.XmlElement elem) {
    return TableRestoreStatusMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      tableRestoreStatusDetails: _s
          .extractXmlChild(elem, 'TableRestoreStatusDetails')
          ?.let((elem) => elem
              .findElements('TableRestoreStatus')
              .map(TableRestoreStatus.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final tableRestoreStatusDetails = this.tableRestoreStatusDetails;
    return {
      if (marker != null) 'Marker': marker,
      if (tableRestoreStatusDetails != null)
        'TableRestoreStatusDetails': tableRestoreStatusDetails,
    };
  }
}

enum TableRestoreStatusType {
  pending,
  inProgress,
  succeeded,
  failed,
  canceled,
}

extension TableRestoreStatusTypeValueExtension on TableRestoreStatusType {
  String toValue() {
    switch (this) {
      case TableRestoreStatusType.pending:
        return 'PENDING';
      case TableRestoreStatusType.inProgress:
        return 'IN_PROGRESS';
      case TableRestoreStatusType.succeeded:
        return 'SUCCEEDED';
      case TableRestoreStatusType.failed:
        return 'FAILED';
      case TableRestoreStatusType.canceled:
        return 'CANCELED';
    }
  }
}

extension TableRestoreStatusTypeFromString on String {
  TableRestoreStatusType toTableRestoreStatusType() {
    switch (this) {
      case 'PENDING':
        return TableRestoreStatusType.pending;
      case 'IN_PROGRESS':
        return TableRestoreStatusType.inProgress;
      case 'SUCCEEDED':
        return TableRestoreStatusType.succeeded;
      case 'FAILED':
        return TableRestoreStatusType.failed;
      case 'CANCELED':
        return TableRestoreStatusType.canceled;
    }
    throw Exception('$this is not known in enum TableRestoreStatusType');
  }
}

/// A tag consisting of a name/value pair for a resource.
class Tag {
  /// The key, or name, for the resource tag.
  final String? key;

  /// The value for the resource tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// A tag and its associated resource.
class TaggedResource {
  /// The Amazon Resource Name (ARN) with which the tag is associated, for
  /// example: <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>.
  final String? resourceName;

  /// The type of resource with which the tag is associated. Valid resource types
  /// are:
  ///
  /// <ul>
  /// <li>
  /// Cluster
  /// </li>
  /// <li>
  /// CIDR/IP
  /// </li>
  /// <li>
  /// EC2 security group
  /// </li>
  /// <li>
  /// Snapshot
  /// </li>
  /// <li>
  /// Cluster security group
  /// </li>
  /// <li>
  /// Subnet group
  /// </li>
  /// <li>
  /// HSM connection
  /// </li>
  /// <li>
  /// HSM certificate
  /// </li>
  /// <li>
  /// Parameter group
  /// </li>
  /// </ul>
  /// For more information about Amazon Redshift resource types and constructing
  /// ARNs, go to <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions">Constructing
  /// an Amazon Redshift Amazon Resource Name (ARN)</a> in the Amazon Redshift
  /// Cluster Management Guide.
  final String? resourceType;

  /// The tag for the resource.
  final Tag? tag;

  TaggedResource({
    this.resourceName,
    this.resourceType,
    this.tag,
  });
  factory TaggedResource.fromXml(_s.XmlElement elem) {
    return TaggedResource(
      resourceName: _s.extractXmlStringValue(elem, 'ResourceName'),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let(Tag.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final tag = this.tag;
    return {
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (tag != null) 'Tag': tag,
    };
  }
}

/// <p/>
class TaggedResourceListMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// A list of tags with their associated resources.
  final List<TaggedResource>? taggedResources;

  TaggedResourceListMessage({
    this.marker,
    this.taggedResources,
  });
  factory TaggedResourceListMessage.fromXml(_s.XmlElement elem) {
    return TaggedResourceListMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      taggedResources: _s.extractXmlChild(elem, 'TaggedResources')?.let(
          (elem) => elem
              .findElements('TaggedResource')
              .map(TaggedResource.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final taggedResources = this.taggedResources;
    return {
      if (marker != null) 'Marker': marker,
      if (taggedResources != null) 'TaggedResources': taggedResources,
    };
  }
}

class TrackListMessage {
  /// A list of maintenance tracks output by the
  /// <code>DescribeClusterTracks</code> operation.
  final List<MaintenanceTrack>? maintenanceTracks;

  /// The starting point to return a set of response tracklist records. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the <code>Marker</code> parameter and retrying the request.
  final String? marker;

  TrackListMessage({
    this.maintenanceTracks,
    this.marker,
  });
  factory TrackListMessage.fromXml(_s.XmlElement elem) {
    return TrackListMessage(
      maintenanceTracks: _s.extractXmlChild(elem, 'MaintenanceTracks')?.let(
          (elem) => elem
              .findElements('MaintenanceTrack')
              .map(MaintenanceTrack.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final maintenanceTracks = this.maintenanceTracks;
    final marker = this.marker;
    return {
      if (maintenanceTracks != null) 'MaintenanceTracks': maintenanceTracks,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// A maintenance track that you can switch the current track to.
class UpdateTarget {
  /// The cluster version for the new maintenance track.
  final String? databaseVersion;

  /// The name of the new maintenance track.
  final String? maintenanceTrackName;

  /// A list of operations supported by the maintenance track.
  final List<SupportedOperation>? supportedOperations;

  UpdateTarget({
    this.databaseVersion,
    this.maintenanceTrackName,
    this.supportedOperations,
  });
  factory UpdateTarget.fromXml(_s.XmlElement elem) {
    return UpdateTarget(
      databaseVersion: _s.extractXmlStringValue(elem, 'DatabaseVersion'),
      maintenanceTrackName:
          _s.extractXmlStringValue(elem, 'MaintenanceTrackName'),
      supportedOperations: _s.extractXmlChild(elem, 'SupportedOperations')?.let(
          (elem) => elem
              .findElements('SupportedOperation')
              .map(SupportedOperation.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseVersion = this.databaseVersion;
    final maintenanceTrackName = this.maintenanceTrackName;
    final supportedOperations = this.supportedOperations;
    return {
      if (databaseVersion != null) 'DatabaseVersion': databaseVersion,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (supportedOperations != null)
        'SupportedOperations': supportedOperations,
    };
  }
}

/// Describes a usage limit object for a cluster.
class UsageLimit {
  /// The limit amount. If time-based, this amount is in minutes. If data-based,
  /// this amount is in terabytes (TB).
  final int? amount;

  /// The action that Amazon Redshift takes when the limit is reached. Possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <b>log</b> - To log an event in a system table. The default is log.
  /// </li>
  /// <li>
  /// <b>emit-metric</b> - To emit CloudWatch metrics.
  /// </li>
  /// <li>
  /// <b>disable</b> - To disable the feature until the next usage period begins.
  /// </li>
  /// </ul>
  final UsageLimitBreachAction? breachAction;

  /// The identifier of the cluster with a usage limit.
  final String? clusterIdentifier;

  /// The Amazon Redshift feature to which the limit applies.
  final UsageLimitFeatureType? featureType;

  /// The type of limit. Depending on the feature type, this can be based on a
  /// time duration or data size.
  final UsageLimitLimitType? limitType;

  /// The time period that the amount applies to. A <code>weekly</code> period
  /// begins on Sunday. The default is <code>monthly</code>.
  final UsageLimitPeriod? period;

  /// A list of tag instances.
  final List<Tag>? tags;

  /// The identifier of the usage limit.
  final String? usageLimitId;

  UsageLimit({
    this.amount,
    this.breachAction,
    this.clusterIdentifier,
    this.featureType,
    this.limitType,
    this.period,
    this.tags,
    this.usageLimitId,
  });
  factory UsageLimit.fromXml(_s.XmlElement elem) {
    return UsageLimit(
      amount: _s.extractXmlIntValue(elem, 'Amount'),
      breachAction: _s
          .extractXmlStringValue(elem, 'BreachAction')
          ?.toUsageLimitBreachAction(),
      clusterIdentifier: _s.extractXmlStringValue(elem, 'ClusterIdentifier'),
      featureType: _s
          .extractXmlStringValue(elem, 'FeatureType')
          ?.toUsageLimitFeatureType(),
      limitType:
          _s.extractXmlStringValue(elem, 'LimitType')?.toUsageLimitLimitType(),
      period: _s.extractXmlStringValue(elem, 'Period')?.toUsageLimitPeriod(),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
      usageLimitId: _s.extractXmlStringValue(elem, 'UsageLimitId'),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final breachAction = this.breachAction;
    final clusterIdentifier = this.clusterIdentifier;
    final featureType = this.featureType;
    final limitType = this.limitType;
    final period = this.period;
    final tags = this.tags;
    final usageLimitId = this.usageLimitId;
    return {
      if (amount != null) 'Amount': amount,
      if (breachAction != null) 'BreachAction': breachAction.toValue(),
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (featureType != null) 'FeatureType': featureType.toValue(),
      if (limitType != null) 'LimitType': limitType.toValue(),
      if (period != null) 'Period': period.toValue(),
      if (tags != null) 'Tags': tags,
      if (usageLimitId != null) 'UsageLimitId': usageLimitId,
    };
  }
}

enum UsageLimitBreachAction {
  log,
  emitMetric,
  disable,
}

extension UsageLimitBreachActionValueExtension on UsageLimitBreachAction {
  String toValue() {
    switch (this) {
      case UsageLimitBreachAction.log:
        return 'log';
      case UsageLimitBreachAction.emitMetric:
        return 'emit-metric';
      case UsageLimitBreachAction.disable:
        return 'disable';
    }
  }
}

extension UsageLimitBreachActionFromString on String {
  UsageLimitBreachAction toUsageLimitBreachAction() {
    switch (this) {
      case 'log':
        return UsageLimitBreachAction.log;
      case 'emit-metric':
        return UsageLimitBreachAction.emitMetric;
      case 'disable':
        return UsageLimitBreachAction.disable;
    }
    throw Exception('$this is not known in enum UsageLimitBreachAction');
  }
}

enum UsageLimitFeatureType {
  spectrum,
  concurrencyScaling,
  crossRegionDatasharing,
}

extension UsageLimitFeatureTypeValueExtension on UsageLimitFeatureType {
  String toValue() {
    switch (this) {
      case UsageLimitFeatureType.spectrum:
        return 'spectrum';
      case UsageLimitFeatureType.concurrencyScaling:
        return 'concurrency-scaling';
      case UsageLimitFeatureType.crossRegionDatasharing:
        return 'cross-region-datasharing';
    }
  }
}

extension UsageLimitFeatureTypeFromString on String {
  UsageLimitFeatureType toUsageLimitFeatureType() {
    switch (this) {
      case 'spectrum':
        return UsageLimitFeatureType.spectrum;
      case 'concurrency-scaling':
        return UsageLimitFeatureType.concurrencyScaling;
      case 'cross-region-datasharing':
        return UsageLimitFeatureType.crossRegionDatasharing;
    }
    throw Exception('$this is not known in enum UsageLimitFeatureType');
  }
}

enum UsageLimitLimitType {
  time,
  dataScanned,
}

extension UsageLimitLimitTypeValueExtension on UsageLimitLimitType {
  String toValue() {
    switch (this) {
      case UsageLimitLimitType.time:
        return 'time';
      case UsageLimitLimitType.dataScanned:
        return 'data-scanned';
    }
  }
}

extension UsageLimitLimitTypeFromString on String {
  UsageLimitLimitType toUsageLimitLimitType() {
    switch (this) {
      case 'time':
        return UsageLimitLimitType.time;
      case 'data-scanned':
        return UsageLimitLimitType.dataScanned;
    }
    throw Exception('$this is not known in enum UsageLimitLimitType');
  }
}

class UsageLimitList {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker value
  /// in the <code>Marker</code> parameter and retrying the command. If the
  /// <code>Marker</code> field is empty, all response records have been retrieved
  /// for the request.
  final String? marker;

  /// Contains the output from the <a>DescribeUsageLimits</a> action.
  final List<UsageLimit>? usageLimits;

  UsageLimitList({
    this.marker,
    this.usageLimits,
  });
  factory UsageLimitList.fromXml(_s.XmlElement elem) {
    return UsageLimitList(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      usageLimits: _s.extractXmlChild(elem, 'UsageLimits')?.let((elem) =>
          elem.findElements('member').map(UsageLimit.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final usageLimits = this.usageLimits;
    return {
      if (marker != null) 'Marker': marker,
      if (usageLimits != null) 'UsageLimits': usageLimits,
    };
  }
}

enum UsageLimitPeriod {
  daily,
  weekly,
  monthly,
}

extension UsageLimitPeriodValueExtension on UsageLimitPeriod {
  String toValue() {
    switch (this) {
      case UsageLimitPeriod.daily:
        return 'daily';
      case UsageLimitPeriod.weekly:
        return 'weekly';
      case UsageLimitPeriod.monthly:
        return 'monthly';
    }
  }
}

extension UsageLimitPeriodFromString on String {
  UsageLimitPeriod toUsageLimitPeriod() {
    switch (this) {
      case 'daily':
        return UsageLimitPeriod.daily;
      case 'weekly':
        return UsageLimitPeriod.weekly;
      case 'monthly':
        return UsageLimitPeriod.monthly;
    }
    throw Exception('$this is not known in enum UsageLimitPeriod');
  }
}

/// The connection endpoint for connecting to an Amazon Redshift cluster through
/// the proxy.
class VpcEndpoint {
  /// One or more network interfaces of the endpoint. Also known as an interface
  /// endpoint.
  final List<NetworkInterface>? networkInterfaces;

  /// The connection endpoint ID for connecting an Amazon Redshift cluster through
  /// the proxy.
  final String? vpcEndpointId;

  /// The VPC identifier that the endpoint is associated.
  final String? vpcId;

  VpcEndpoint({
    this.networkInterfaces,
    this.vpcEndpointId,
    this.vpcId,
  });
  factory VpcEndpoint.fromXml(_s.XmlElement elem) {
    return VpcEndpoint(
      networkInterfaces: _s.extractXmlChild(elem, 'NetworkInterfaces')?.let(
          (elem) => elem
              .findElements('NetworkInterface')
              .map(NetworkInterface.fromXml)
              .toList()),
      vpcEndpointId: _s.extractXmlStringValue(elem, 'VpcEndpointId'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaces = this.networkInterfaces;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (networkInterfaces != null) 'NetworkInterfaces': networkInterfaces,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Describes the members of a VPC security group.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String? status;

  /// The identifier of the VPC security group.
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory VpcSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return VpcSecurityGroupMembership(
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcSecurityGroupId: _s.extractXmlStringValue(elem, 'VpcSecurityGroupId'),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

enum ZeroETLIntegrationStatus {
  creating,
  active,
  modifying,
  failed,
  deleting,
  syncing,
  needsAttention,
}

extension ZeroETLIntegrationStatusValueExtension on ZeroETLIntegrationStatus {
  String toValue() {
    switch (this) {
      case ZeroETLIntegrationStatus.creating:
        return 'creating';
      case ZeroETLIntegrationStatus.active:
        return 'active';
      case ZeroETLIntegrationStatus.modifying:
        return 'modifying';
      case ZeroETLIntegrationStatus.failed:
        return 'failed';
      case ZeroETLIntegrationStatus.deleting:
        return 'deleting';
      case ZeroETLIntegrationStatus.syncing:
        return 'syncing';
      case ZeroETLIntegrationStatus.needsAttention:
        return 'needs_attention';
    }
  }
}

extension ZeroETLIntegrationStatusFromString on String {
  ZeroETLIntegrationStatus toZeroETLIntegrationStatus() {
    switch (this) {
      case 'creating':
        return ZeroETLIntegrationStatus.creating;
      case 'active':
        return ZeroETLIntegrationStatus.active;
      case 'modifying':
        return ZeroETLIntegrationStatus.modifying;
      case 'failed':
        return ZeroETLIntegrationStatus.failed;
      case 'deleting':
        return ZeroETLIntegrationStatus.deleting;
      case 'syncing':
        return ZeroETLIntegrationStatus.syncing;
      case 'needs_attention':
        return ZeroETLIntegrationStatus.needsAttention;
    }
    throw Exception('$this is not known in enum ZeroETLIntegrationStatus');
  }
}

class AccessToClusterDeniedFault extends _s.GenericAwsException {
  AccessToClusterDeniedFault({String? type, String? message})
      : super(type: type, code: 'AccessToClusterDeniedFault', message: message);
}

class AccessToSnapshotDeniedFault extends _s.GenericAwsException {
  AccessToSnapshotDeniedFault({String? type, String? message})
      : super(
            type: type, code: 'AccessToSnapshotDeniedFault', message: message);
}

class AuthenticationProfileAlreadyExistsFault extends _s.GenericAwsException {
  AuthenticationProfileAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthenticationProfileAlreadyExistsFault',
            message: message);
}

class AuthenticationProfileNotFoundFault extends _s.GenericAwsException {
  AuthenticationProfileNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthenticationProfileNotFoundFault',
            message: message);
}

class AuthenticationProfileQuotaExceededFault extends _s.GenericAwsException {
  AuthenticationProfileQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthenticationProfileQuotaExceededFault',
            message: message);
}

class AuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  AuthorizationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationAlreadyExistsFault',
            message: message);
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String? type, String? message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class AuthorizationQuotaExceededFault extends _s.GenericAwsException {
  AuthorizationQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationQuotaExceededFault',
            message: message);
}

class BatchDeleteRequestSizeExceededFault extends _s.GenericAwsException {
  BatchDeleteRequestSizeExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'BatchDeleteRequestSizeExceededFault',
            message: message);
}

class BatchModifyClusterSnapshotsLimitExceededFault
    extends _s.GenericAwsException {
  BatchModifyClusterSnapshotsLimitExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'BatchModifyClusterSnapshotsLimitExceededFault',
            message: message);
}

class BucketNotFoundFault extends _s.GenericAwsException {
  BucketNotFoundFault({String? type, String? message})
      : super(type: type, code: 'BucketNotFoundFault', message: message);
}

class ClusterAlreadyExistsFault extends _s.GenericAwsException {
  ClusterAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'ClusterAlreadyExistsFault', message: message);
}

class ClusterNotFoundFault extends _s.GenericAwsException {
  ClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ClusterNotFoundFault', message: message);
}

class ClusterOnLatestRevisionFault extends _s.GenericAwsException {
  ClusterOnLatestRevisionFault({String? type, String? message})
      : super(
            type: type, code: 'ClusterOnLatestRevisionFault', message: message);
}

class ClusterParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  ClusterParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterParameterGroupAlreadyExistsFault',
            message: message);
}

class ClusterParameterGroupNotFoundFault extends _s.GenericAwsException {
  ClusterParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterParameterGroupNotFoundFault',
            message: message);
}

class ClusterParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  ClusterParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterParameterGroupQuotaExceededFault',
            message: message);
}

class ClusterQuotaExceededFault extends _s.GenericAwsException {
  ClusterQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'ClusterQuotaExceededFault', message: message);
}

class ClusterSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  ClusterSecurityGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSecurityGroupAlreadyExistsFault',
            message: message);
}

class ClusterSecurityGroupNotFoundFault extends _s.GenericAwsException {
  ClusterSecurityGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSecurityGroupNotFoundFault',
            message: message);
}

class ClusterSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  ClusterSecurityGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSecurityGroupQuotaExceededFault',
            message: message);
}

class ClusterSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  ClusterSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSnapshotAlreadyExistsFault',
            message: message);
}

class ClusterSnapshotNotFoundFault extends _s.GenericAwsException {
  ClusterSnapshotNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'ClusterSnapshotNotFoundFault', message: message);
}

class ClusterSnapshotQuotaExceededFault extends _s.GenericAwsException {
  ClusterSnapshotQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSnapshotQuotaExceededFault',
            message: message);
}

class ClusterSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  ClusterSubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSubnetGroupAlreadyExistsFault',
            message: message);
}

class ClusterSubnetGroupNotFoundFault extends _s.GenericAwsException {
  ClusterSubnetGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSubnetGroupNotFoundFault',
            message: message);
}

class ClusterSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  ClusterSubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSubnetGroupQuotaExceededFault',
            message: message);
}

class ClusterSubnetQuotaExceededFault extends _s.GenericAwsException {
  ClusterSubnetQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterSubnetQuotaExceededFault',
            message: message);
}

class ConflictPolicyUpdateFault extends _s.GenericAwsException {
  ConflictPolicyUpdateFault({String? type, String? message})
      : super(type: type, code: 'ConflictPolicyUpdateFault', message: message);
}

class CopyToRegionDisabledFault extends _s.GenericAwsException {
  CopyToRegionDisabledFault({String? type, String? message})
      : super(type: type, code: 'CopyToRegionDisabledFault', message: message);
}

class CustomCnameAssociationFault extends _s.GenericAwsException {
  CustomCnameAssociationFault({String? type, String? message})
      : super(
            type: type, code: 'CustomCnameAssociationFault', message: message);
}

class CustomDomainAssociationNotFoundFault extends _s.GenericAwsException {
  CustomDomainAssociationNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'CustomDomainAssociationNotFoundFault',
            message: message);
}

class DependentServiceAccessDeniedFault extends _s.GenericAwsException {
  DependentServiceAccessDeniedFault({String? type, String? message})
      : super(
            type: type,
            code: 'DependentServiceAccessDeniedFault',
            message: message);
}

class DependentServiceRequestThrottlingFault extends _s.GenericAwsException {
  DependentServiceRequestThrottlingFault({String? type, String? message})
      : super(
            type: type,
            code: 'DependentServiceRequestThrottlingFault',
            message: message);
}

class DependentServiceUnavailableFault extends _s.GenericAwsException {
  DependentServiceUnavailableFault({String? type, String? message})
      : super(
            type: type,
            code: 'DependentServiceUnavailableFault',
            message: message);
}

class EndpointAlreadyExistsFault extends _s.GenericAwsException {
  EndpointAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'EndpointAlreadyExistsFault', message: message);
}

class EndpointAuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  EndpointAuthorizationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'EndpointAuthorizationAlreadyExistsFault',
            message: message);
}

class EndpointAuthorizationNotFoundFault extends _s.GenericAwsException {
  EndpointAuthorizationNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'EndpointAuthorizationNotFoundFault',
            message: message);
}

class EndpointAuthorizationsPerClusterLimitExceededFault
    extends _s.GenericAwsException {
  EndpointAuthorizationsPerClusterLimitExceededFault(
      {String? type, String? message})
      : super(
            type: type,
            code: 'EndpointAuthorizationsPerClusterLimitExceededFault',
            message: message);
}

class EndpointNotFoundFault extends _s.GenericAwsException {
  EndpointNotFoundFault({String? type, String? message})
      : super(type: type, code: 'EndpointNotFoundFault', message: message);
}

class EndpointsPerAuthorizationLimitExceededFault
    extends _s.GenericAwsException {
  EndpointsPerAuthorizationLimitExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EndpointsPerAuthorizationLimitExceededFault',
            message: message);
}

class EndpointsPerClusterLimitExceededFault extends _s.GenericAwsException {
  EndpointsPerClusterLimitExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EndpointsPerClusterLimitExceededFault',
            message: message);
}

class EventSubscriptionQuotaExceededFault extends _s.GenericAwsException {
  EventSubscriptionQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EventSubscriptionQuotaExceededFault',
            message: message);
}

class HsmClientCertificateAlreadyExistsFault extends _s.GenericAwsException {
  HsmClientCertificateAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmClientCertificateAlreadyExistsFault',
            message: message);
}

class HsmClientCertificateNotFoundFault extends _s.GenericAwsException {
  HsmClientCertificateNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmClientCertificateNotFoundFault',
            message: message);
}

class HsmClientCertificateQuotaExceededFault extends _s.GenericAwsException {
  HsmClientCertificateQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmClientCertificateQuotaExceededFault',
            message: message);
}

class HsmConfigurationAlreadyExistsFault extends _s.GenericAwsException {
  HsmConfigurationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmConfigurationAlreadyExistsFault',
            message: message);
}

class HsmConfigurationNotFoundFault extends _s.GenericAwsException {
  HsmConfigurationNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmConfigurationNotFoundFault',
            message: message);
}

class HsmConfigurationQuotaExceededFault extends _s.GenericAwsException {
  HsmConfigurationQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'HsmConfigurationQuotaExceededFault',
            message: message);
}

class InProgressTableRestoreQuotaExceededFault extends _s.GenericAwsException {
  InProgressTableRestoreQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'InProgressTableRestoreQuotaExceededFault',
            message: message);
}

class IncompatibleOrderableOptions extends _s.GenericAwsException {
  IncompatibleOrderableOptions({String? type, String? message})
      : super(
            type: type, code: 'IncompatibleOrderableOptions', message: message);
}

class InsufficientClusterCapacityFault extends _s.GenericAwsException {
  InsufficientClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientClusterCapacityFault',
            message: message);
}

class InsufficientS3BucketPolicyFault extends _s.GenericAwsException {
  InsufficientS3BucketPolicyFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientS3BucketPolicyFault',
            message: message);
}

class IntegrationNotFoundFault extends _s.GenericAwsException {
  IntegrationNotFoundFault({String? type, String? message})
      : super(type: type, code: 'IntegrationNotFoundFault', message: message);
}

class InvalidAuthenticationProfileRequestFault extends _s.GenericAwsException {
  InvalidAuthenticationProfileRequestFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAuthenticationProfileRequestFault',
            message: message);
}

class InvalidAuthorizationStateFault extends _s.GenericAwsException {
  InvalidAuthorizationStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAuthorizationStateFault',
            message: message);
}

class InvalidClusterParameterGroupStateFault extends _s.GenericAwsException {
  InvalidClusterParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterParameterGroupStateFault',
            message: message);
}

class InvalidClusterSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidClusterSecurityGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterSecurityGroupStateFault',
            message: message);
}

class InvalidClusterSnapshotScheduleStateFault extends _s.GenericAwsException {
  InvalidClusterSnapshotScheduleStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterSnapshotScheduleStateFault',
            message: message);
}

class InvalidClusterSnapshotStateFault extends _s.GenericAwsException {
  InvalidClusterSnapshotStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterSnapshotStateFault',
            message: message);
}

class InvalidClusterStateFault extends _s.GenericAwsException {
  InvalidClusterStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidClusterStateFault', message: message);
}

class InvalidClusterSubnetGroupStateFault extends _s.GenericAwsException {
  InvalidClusterSubnetGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterSubnetGroupStateFault',
            message: message);
}

class InvalidClusterSubnetStateFault extends _s.GenericAwsException {
  InvalidClusterSubnetStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClusterSubnetStateFault',
            message: message);
}

class InvalidClusterTrackFault extends _s.GenericAwsException {
  InvalidClusterTrackFault({String? type, String? message})
      : super(type: type, code: 'InvalidClusterTrackFault', message: message);
}

class InvalidDataShareFault extends _s.GenericAwsException {
  InvalidDataShareFault({String? type, String? message})
      : super(type: type, code: 'InvalidDataShareFault', message: message);
}

class InvalidElasticIpFault extends _s.GenericAwsException {
  InvalidElasticIpFault({String? type, String? message})
      : super(type: type, code: 'InvalidElasticIpFault', message: message);
}

class InvalidEndpointStateFault extends _s.GenericAwsException {
  InvalidEndpointStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidEndpointStateFault', message: message);
}

class InvalidHsmClientCertificateStateFault extends _s.GenericAwsException {
  InvalidHsmClientCertificateStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidHsmClientCertificateStateFault',
            message: message);
}

class InvalidHsmConfigurationStateFault extends _s.GenericAwsException {
  InvalidHsmConfigurationStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidHsmConfigurationStateFault',
            message: message);
}

class InvalidNamespaceFault extends _s.GenericAwsException {
  InvalidNamespaceFault({String? type, String? message})
      : super(type: type, code: 'InvalidNamespaceFault', message: message);
}

class InvalidPolicyFault extends _s.GenericAwsException {
  InvalidPolicyFault({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyFault', message: message);
}

class InvalidReservedNodeStateFault extends _s.GenericAwsException {
  InvalidReservedNodeStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReservedNodeStateFault',
            message: message);
}

class InvalidRestoreFault extends _s.GenericAwsException {
  InvalidRestoreFault({String? type, String? message})
      : super(type: type, code: 'InvalidRestoreFault', message: message);
}

class InvalidRetentionPeriodFault extends _s.GenericAwsException {
  InvalidRetentionPeriodFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidRetentionPeriodFault', message: message);
}

class InvalidS3BucketNameFault extends _s.GenericAwsException {
  InvalidS3BucketNameFault({String? type, String? message})
      : super(type: type, code: 'InvalidS3BucketNameFault', message: message);
}

class InvalidS3KeyPrefixFault extends _s.GenericAwsException {
  InvalidS3KeyPrefixFault({String? type, String? message})
      : super(type: type, code: 'InvalidS3KeyPrefixFault', message: message);
}

class InvalidScheduleFault extends _s.GenericAwsException {
  InvalidScheduleFault({String? type, String? message})
      : super(type: type, code: 'InvalidScheduleFault', message: message);
}

class InvalidScheduledActionFault extends _s.GenericAwsException {
  InvalidScheduledActionFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidScheduledActionFault', message: message);
}

class InvalidSnapshotCopyGrantStateFault extends _s.GenericAwsException {
  InvalidSnapshotCopyGrantStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSnapshotCopyGrantStateFault',
            message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidSubscriptionStateFault extends _s.GenericAwsException {
  InvalidSubscriptionStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSubscriptionStateFault',
            message: message);
}

class InvalidTableRestoreArgumentFault extends _s.GenericAwsException {
  InvalidTableRestoreArgumentFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTableRestoreArgumentFault',
            message: message);
}

class InvalidTagFault extends _s.GenericAwsException {
  InvalidTagFault({String? type, String? message})
      : super(type: type, code: 'InvalidTagFault', message: message);
}

class InvalidUsageLimitFault extends _s.GenericAwsException {
  InvalidUsageLimitFault({String? type, String? message})
      : super(type: type, code: 'InvalidUsageLimitFault', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class Ipv6CidrBlockNotFoundFault extends _s.GenericAwsException {
  Ipv6CidrBlockNotFoundFault({String? type, String? message})
      : super(type: type, code: 'Ipv6CidrBlockNotFoundFault', message: message);
}

class LimitExceededFault extends _s.GenericAwsException {
  LimitExceededFault({String? type, String? message})
      : super(type: type, code: 'LimitExceededFault', message: message);
}

class NumberOfNodesPerClusterLimitExceededFault extends _s.GenericAwsException {
  NumberOfNodesPerClusterLimitExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NumberOfNodesPerClusterLimitExceededFault',
            message: message);
}

class NumberOfNodesQuotaExceededFault extends _s.GenericAwsException {
  NumberOfNodesQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NumberOfNodesQuotaExceededFault',
            message: message);
}

class PartnerNotFoundFault extends _s.GenericAwsException {
  PartnerNotFoundFault({String? type, String? message})
      : super(type: type, code: 'PartnerNotFoundFault', message: message);
}

class RedshiftIdcApplicationAlreadyExistsFault extends _s.GenericAwsException {
  RedshiftIdcApplicationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'RedshiftIdcApplicationAlreadyExistsFault',
            message: message);
}

class RedshiftIdcApplicationNotExistsFault extends _s.GenericAwsException {
  RedshiftIdcApplicationNotExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'RedshiftIdcApplicationNotExistsFault',
            message: message);
}

class RedshiftIdcApplicationQuotaExceededFault extends _s.GenericAwsException {
  RedshiftIdcApplicationQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'RedshiftIdcApplicationQuotaExceededFault',
            message: message);
}

class ReservedNodeAlreadyExistsFault extends _s.GenericAwsException {
  ReservedNodeAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeAlreadyExistsFault',
            message: message);
}

class ReservedNodeAlreadyMigratedFault extends _s.GenericAwsException {
  ReservedNodeAlreadyMigratedFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeAlreadyMigratedFault',
            message: message);
}

class ReservedNodeExchangeNotFoundFault extends _s.GenericAwsException {
  ReservedNodeExchangeNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeExchangeNotFoundFault',
            message: message);
}

class ReservedNodeNotFoundFault extends _s.GenericAwsException {
  ReservedNodeNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ReservedNodeNotFoundFault', message: message);
}

class ReservedNodeOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedNodeOfferingNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeOfferingNotFoundFault',
            message: message);
}

class ReservedNodeQuotaExceededFault extends _s.GenericAwsException {
  ReservedNodeQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeQuotaExceededFault',
            message: message);
}

class ResizeNotFoundFault extends _s.GenericAwsException {
  ResizeNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ResizeNotFoundFault', message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String? type, String? message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String? type, String? message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class SNSTopicArnNotFoundFault extends _s.GenericAwsException {
  SNSTopicArnNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SNSTopicArnNotFoundFault', message: message);
}

class ScheduleDefinitionTypeUnsupportedFault extends _s.GenericAwsException {
  ScheduleDefinitionTypeUnsupportedFault({String? type, String? message})
      : super(
            type: type,
            code: 'ScheduleDefinitionTypeUnsupportedFault',
            message: message);
}

class ScheduledActionAlreadyExistsFault extends _s.GenericAwsException {
  ScheduledActionAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ScheduledActionAlreadyExistsFault',
            message: message);
}

class ScheduledActionNotFoundFault extends _s.GenericAwsException {
  ScheduledActionNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'ScheduledActionNotFoundFault', message: message);
}

class ScheduledActionQuotaExceededFault extends _s.GenericAwsException {
  ScheduledActionQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ScheduledActionQuotaExceededFault',
            message: message);
}

class ScheduledActionTypeUnsupportedFault extends _s.GenericAwsException {
  ScheduledActionTypeUnsupportedFault({String? type, String? message})
      : super(
            type: type,
            code: 'ScheduledActionTypeUnsupportedFault',
            message: message);
}

class SnapshotCopyAlreadyDisabledFault extends _s.GenericAwsException {
  SnapshotCopyAlreadyDisabledFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotCopyAlreadyDisabledFault',
            message: message);
}

class SnapshotCopyAlreadyEnabledFault extends _s.GenericAwsException {
  SnapshotCopyAlreadyEnabledFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotCopyAlreadyEnabledFault',
            message: message);
}

class SnapshotCopyDisabledFault extends _s.GenericAwsException {
  SnapshotCopyDisabledFault({String? type, String? message})
      : super(type: type, code: 'SnapshotCopyDisabledFault', message: message);
}

class SnapshotCopyGrantAlreadyExistsFault extends _s.GenericAwsException {
  SnapshotCopyGrantAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotCopyGrantAlreadyExistsFault',
            message: message);
}

class SnapshotCopyGrantNotFoundFault extends _s.GenericAwsException {
  SnapshotCopyGrantNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotCopyGrantNotFoundFault',
            message: message);
}

class SnapshotCopyGrantQuotaExceededFault extends _s.GenericAwsException {
  SnapshotCopyGrantQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotCopyGrantQuotaExceededFault',
            message: message);
}

class SnapshotScheduleAlreadyExistsFault extends _s.GenericAwsException {
  SnapshotScheduleAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotScheduleAlreadyExistsFault',
            message: message);
}

class SnapshotScheduleNotFoundFault extends _s.GenericAwsException {
  SnapshotScheduleNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotScheduleNotFoundFault',
            message: message);
}

class SnapshotScheduleQuotaExceededFault extends _s.GenericAwsException {
  SnapshotScheduleQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotScheduleQuotaExceededFault',
            message: message);
}

class SnapshotScheduleUpdateInProgressFault extends _s.GenericAwsException {
  SnapshotScheduleUpdateInProgressFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotScheduleUpdateInProgressFault',
            message: message);
}

class SourceNotFoundFault extends _s.GenericAwsException {
  SourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SourceNotFoundFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String? type, String? message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class SubscriptionAlreadyExistFault extends _s.GenericAwsException {
  SubscriptionAlreadyExistFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionAlreadyExistFault',
            message: message);
}

class SubscriptionCategoryNotFoundFault extends _s.GenericAwsException {
  SubscriptionCategoryNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionCategoryNotFoundFault',
            message: message);
}

class SubscriptionEventIdNotFoundFault extends _s.GenericAwsException {
  SubscriptionEventIdNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionEventIdNotFoundFault',
            message: message);
}

class SubscriptionNotFoundFault extends _s.GenericAwsException {
  SubscriptionNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SubscriptionNotFoundFault', message: message);
}

class SubscriptionSeverityNotFoundFault extends _s.GenericAwsException {
  SubscriptionSeverityNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionSeverityNotFoundFault',
            message: message);
}

class TableLimitExceededFault extends _s.GenericAwsException {
  TableLimitExceededFault({String? type, String? message})
      : super(type: type, code: 'TableLimitExceededFault', message: message);
}

class TableRestoreNotFoundFault extends _s.GenericAwsException {
  TableRestoreNotFoundFault({String? type, String? message})
      : super(type: type, code: 'TableRestoreNotFoundFault', message: message);
}

class TagLimitExceededFault extends _s.GenericAwsException {
  TagLimitExceededFault({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededFault', message: message);
}

class UnauthorizedOperation extends _s.GenericAwsException {
  UnauthorizedOperation({String? type, String? message})
      : super(type: type, code: 'UnauthorizedOperation', message: message);
}

class UnauthorizedPartnerIntegrationFault extends _s.GenericAwsException {
  UnauthorizedPartnerIntegrationFault({String? type, String? message})
      : super(
            type: type,
            code: 'UnauthorizedPartnerIntegrationFault',
            message: message);
}

class UnknownSnapshotCopyRegionFault extends _s.GenericAwsException {
  UnknownSnapshotCopyRegionFault({String? type, String? message})
      : super(
            type: type,
            code: 'UnknownSnapshotCopyRegionFault',
            message: message);
}

class UnsupportedOperationFault extends _s.GenericAwsException {
  UnsupportedOperationFault({String? type, String? message})
      : super(type: type, code: 'UnsupportedOperationFault', message: message);
}

class UnsupportedOptionFault extends _s.GenericAwsException {
  UnsupportedOptionFault({String? type, String? message})
      : super(type: type, code: 'UnsupportedOptionFault', message: message);
}

class UsageLimitAlreadyExistsFault extends _s.GenericAwsException {
  UsageLimitAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'UsageLimitAlreadyExistsFault', message: message);
}

class UsageLimitNotFoundFault extends _s.GenericAwsException {
  UsageLimitNotFoundFault({String? type, String? message})
      : super(type: type, code: 'UsageLimitNotFoundFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessToClusterDeniedFault': (type, message) =>
      AccessToClusterDeniedFault(type: type, message: message),
  'AccessToSnapshotDeniedFault': (type, message) =>
      AccessToSnapshotDeniedFault(type: type, message: message),
  'AuthenticationProfileAlreadyExistsFault': (type, message) =>
      AuthenticationProfileAlreadyExistsFault(type: type, message: message),
  'AuthenticationProfileNotFoundFault': (type, message) =>
      AuthenticationProfileNotFoundFault(type: type, message: message),
  'AuthenticationProfileQuotaExceededFault': (type, message) =>
      AuthenticationProfileQuotaExceededFault(type: type, message: message),
  'AuthorizationAlreadyExistsFault': (type, message) =>
      AuthorizationAlreadyExistsFault(type: type, message: message),
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'AuthorizationQuotaExceededFault': (type, message) =>
      AuthorizationQuotaExceededFault(type: type, message: message),
  'BatchDeleteRequestSizeExceededFault': (type, message) =>
      BatchDeleteRequestSizeExceededFault(type: type, message: message),
  'BatchModifyClusterSnapshotsLimitExceededFault': (type, message) =>
      BatchModifyClusterSnapshotsLimitExceededFault(
          type: type, message: message),
  'BucketNotFoundFault': (type, message) =>
      BucketNotFoundFault(type: type, message: message),
  'ClusterAlreadyExistsFault': (type, message) =>
      ClusterAlreadyExistsFault(type: type, message: message),
  'ClusterNotFoundFault': (type, message) =>
      ClusterNotFoundFault(type: type, message: message),
  'ClusterOnLatestRevisionFault': (type, message) =>
      ClusterOnLatestRevisionFault(type: type, message: message),
  'ClusterParameterGroupAlreadyExistsFault': (type, message) =>
      ClusterParameterGroupAlreadyExistsFault(type: type, message: message),
  'ClusterParameterGroupNotFoundFault': (type, message) =>
      ClusterParameterGroupNotFoundFault(type: type, message: message),
  'ClusterParameterGroupQuotaExceededFault': (type, message) =>
      ClusterParameterGroupQuotaExceededFault(type: type, message: message),
  'ClusterQuotaExceededFault': (type, message) =>
      ClusterQuotaExceededFault(type: type, message: message),
  'ClusterSecurityGroupAlreadyExistsFault': (type, message) =>
      ClusterSecurityGroupAlreadyExistsFault(type: type, message: message),
  'ClusterSecurityGroupNotFoundFault': (type, message) =>
      ClusterSecurityGroupNotFoundFault(type: type, message: message),
  'ClusterSecurityGroupQuotaExceededFault': (type, message) =>
      ClusterSecurityGroupQuotaExceededFault(type: type, message: message),
  'ClusterSnapshotAlreadyExistsFault': (type, message) =>
      ClusterSnapshotAlreadyExistsFault(type: type, message: message),
  'ClusterSnapshotNotFoundFault': (type, message) =>
      ClusterSnapshotNotFoundFault(type: type, message: message),
  'ClusterSnapshotQuotaExceededFault': (type, message) =>
      ClusterSnapshotQuotaExceededFault(type: type, message: message),
  'ClusterSubnetGroupAlreadyExistsFault': (type, message) =>
      ClusterSubnetGroupAlreadyExistsFault(type: type, message: message),
  'ClusterSubnetGroupNotFoundFault': (type, message) =>
      ClusterSubnetGroupNotFoundFault(type: type, message: message),
  'ClusterSubnetGroupQuotaExceededFault': (type, message) =>
      ClusterSubnetGroupQuotaExceededFault(type: type, message: message),
  'ClusterSubnetQuotaExceededFault': (type, message) =>
      ClusterSubnetQuotaExceededFault(type: type, message: message),
  'ConflictPolicyUpdateFault': (type, message) =>
      ConflictPolicyUpdateFault(type: type, message: message),
  'CopyToRegionDisabledFault': (type, message) =>
      CopyToRegionDisabledFault(type: type, message: message),
  'CustomCnameAssociationFault': (type, message) =>
      CustomCnameAssociationFault(type: type, message: message),
  'CustomDomainAssociationNotFoundFault': (type, message) =>
      CustomDomainAssociationNotFoundFault(type: type, message: message),
  'DependentServiceAccessDeniedFault': (type, message) =>
      DependentServiceAccessDeniedFault(type: type, message: message),
  'DependentServiceRequestThrottlingFault': (type, message) =>
      DependentServiceRequestThrottlingFault(type: type, message: message),
  'DependentServiceUnavailableFault': (type, message) =>
      DependentServiceUnavailableFault(type: type, message: message),
  'EndpointAlreadyExistsFault': (type, message) =>
      EndpointAlreadyExistsFault(type: type, message: message),
  'EndpointAuthorizationAlreadyExistsFault': (type, message) =>
      EndpointAuthorizationAlreadyExistsFault(type: type, message: message),
  'EndpointAuthorizationNotFoundFault': (type, message) =>
      EndpointAuthorizationNotFoundFault(type: type, message: message),
  'EndpointAuthorizationsPerClusterLimitExceededFault': (type, message) =>
      EndpointAuthorizationsPerClusterLimitExceededFault(
          type: type, message: message),
  'EndpointNotFoundFault': (type, message) =>
      EndpointNotFoundFault(type: type, message: message),
  'EndpointsPerAuthorizationLimitExceededFault': (type, message) =>
      EndpointsPerAuthorizationLimitExceededFault(type: type, message: message),
  'EndpointsPerClusterLimitExceededFault': (type, message) =>
      EndpointsPerClusterLimitExceededFault(type: type, message: message),
  'EventSubscriptionQuotaExceededFault': (type, message) =>
      EventSubscriptionQuotaExceededFault(type: type, message: message),
  'HsmClientCertificateAlreadyExistsFault': (type, message) =>
      HsmClientCertificateAlreadyExistsFault(type: type, message: message),
  'HsmClientCertificateNotFoundFault': (type, message) =>
      HsmClientCertificateNotFoundFault(type: type, message: message),
  'HsmClientCertificateQuotaExceededFault': (type, message) =>
      HsmClientCertificateQuotaExceededFault(type: type, message: message),
  'HsmConfigurationAlreadyExistsFault': (type, message) =>
      HsmConfigurationAlreadyExistsFault(type: type, message: message),
  'HsmConfigurationNotFoundFault': (type, message) =>
      HsmConfigurationNotFoundFault(type: type, message: message),
  'HsmConfigurationQuotaExceededFault': (type, message) =>
      HsmConfigurationQuotaExceededFault(type: type, message: message),
  'InProgressTableRestoreQuotaExceededFault': (type, message) =>
      InProgressTableRestoreQuotaExceededFault(type: type, message: message),
  'IncompatibleOrderableOptions': (type, message) =>
      IncompatibleOrderableOptions(type: type, message: message),
  'InsufficientClusterCapacityFault': (type, message) =>
      InsufficientClusterCapacityFault(type: type, message: message),
  'InsufficientS3BucketPolicyFault': (type, message) =>
      InsufficientS3BucketPolicyFault(type: type, message: message),
  'IntegrationNotFoundFault': (type, message) =>
      IntegrationNotFoundFault(type: type, message: message),
  'InvalidAuthenticationProfileRequestFault': (type, message) =>
      InvalidAuthenticationProfileRequestFault(type: type, message: message),
  'InvalidAuthorizationStateFault': (type, message) =>
      InvalidAuthorizationStateFault(type: type, message: message),
  'InvalidClusterParameterGroupStateFault': (type, message) =>
      InvalidClusterParameterGroupStateFault(type: type, message: message),
  'InvalidClusterSecurityGroupStateFault': (type, message) =>
      InvalidClusterSecurityGroupStateFault(type: type, message: message),
  'InvalidClusterSnapshotScheduleStateFault': (type, message) =>
      InvalidClusterSnapshotScheduleStateFault(type: type, message: message),
  'InvalidClusterSnapshotStateFault': (type, message) =>
      InvalidClusterSnapshotStateFault(type: type, message: message),
  'InvalidClusterStateFault': (type, message) =>
      InvalidClusterStateFault(type: type, message: message),
  'InvalidClusterSubnetGroupStateFault': (type, message) =>
      InvalidClusterSubnetGroupStateFault(type: type, message: message),
  'InvalidClusterSubnetStateFault': (type, message) =>
      InvalidClusterSubnetStateFault(type: type, message: message),
  'InvalidClusterTrackFault': (type, message) =>
      InvalidClusterTrackFault(type: type, message: message),
  'InvalidDataShareFault': (type, message) =>
      InvalidDataShareFault(type: type, message: message),
  'InvalidElasticIpFault': (type, message) =>
      InvalidElasticIpFault(type: type, message: message),
  'InvalidEndpointStateFault': (type, message) =>
      InvalidEndpointStateFault(type: type, message: message),
  'InvalidHsmClientCertificateStateFault': (type, message) =>
      InvalidHsmClientCertificateStateFault(type: type, message: message),
  'InvalidHsmConfigurationStateFault': (type, message) =>
      InvalidHsmConfigurationStateFault(type: type, message: message),
  'InvalidNamespaceFault': (type, message) =>
      InvalidNamespaceFault(type: type, message: message),
  'InvalidPolicyFault': (type, message) =>
      InvalidPolicyFault(type: type, message: message),
  'InvalidReservedNodeStateFault': (type, message) =>
      InvalidReservedNodeStateFault(type: type, message: message),
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidRetentionPeriodFault': (type, message) =>
      InvalidRetentionPeriodFault(type: type, message: message),
  'InvalidS3BucketNameFault': (type, message) =>
      InvalidS3BucketNameFault(type: type, message: message),
  'InvalidS3KeyPrefixFault': (type, message) =>
      InvalidS3KeyPrefixFault(type: type, message: message),
  'InvalidScheduleFault': (type, message) =>
      InvalidScheduleFault(type: type, message: message),
  'InvalidScheduledActionFault': (type, message) =>
      InvalidScheduledActionFault(type: type, message: message),
  'InvalidSnapshotCopyGrantStateFault': (type, message) =>
      InvalidSnapshotCopyGrantStateFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidSubscriptionStateFault': (type, message) =>
      InvalidSubscriptionStateFault(type: type, message: message),
  'InvalidTableRestoreArgumentFault': (type, message) =>
      InvalidTableRestoreArgumentFault(type: type, message: message),
  'InvalidTagFault': (type, message) =>
      InvalidTagFault(type: type, message: message),
  'InvalidUsageLimitFault': (type, message) =>
      InvalidUsageLimitFault(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'Ipv6CidrBlockNotFoundFault': (type, message) =>
      Ipv6CidrBlockNotFoundFault(type: type, message: message),
  'LimitExceededFault': (type, message) =>
      LimitExceededFault(type: type, message: message),
  'NumberOfNodesPerClusterLimitExceededFault': (type, message) =>
      NumberOfNodesPerClusterLimitExceededFault(type: type, message: message),
  'NumberOfNodesQuotaExceededFault': (type, message) =>
      NumberOfNodesQuotaExceededFault(type: type, message: message),
  'PartnerNotFoundFault': (type, message) =>
      PartnerNotFoundFault(type: type, message: message),
  'RedshiftIdcApplicationAlreadyExistsFault': (type, message) =>
      RedshiftIdcApplicationAlreadyExistsFault(type: type, message: message),
  'RedshiftIdcApplicationNotExistsFault': (type, message) =>
      RedshiftIdcApplicationNotExistsFault(type: type, message: message),
  'RedshiftIdcApplicationQuotaExceededFault': (type, message) =>
      RedshiftIdcApplicationQuotaExceededFault(type: type, message: message),
  'ReservedNodeAlreadyExistsFault': (type, message) =>
      ReservedNodeAlreadyExistsFault(type: type, message: message),
  'ReservedNodeAlreadyMigratedFault': (type, message) =>
      ReservedNodeAlreadyMigratedFault(type: type, message: message),
  'ReservedNodeExchangeNotFoundFault': (type, message) =>
      ReservedNodeExchangeNotFoundFault(type: type, message: message),
  'ReservedNodeNotFoundFault': (type, message) =>
      ReservedNodeNotFoundFault(type: type, message: message),
  'ReservedNodeOfferingNotFoundFault': (type, message) =>
      ReservedNodeOfferingNotFoundFault(type: type, message: message),
  'ReservedNodeQuotaExceededFault': (type, message) =>
      ReservedNodeQuotaExceededFault(type: type, message: message),
  'ResizeNotFoundFault': (type, message) =>
      ResizeNotFoundFault(type: type, message: message),
  'ResourceNotFoundFault': (type, message) =>
      ResourceNotFoundFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'SNSTopicArnNotFoundFault': (type, message) =>
      SNSTopicArnNotFoundFault(type: type, message: message),
  'ScheduleDefinitionTypeUnsupportedFault': (type, message) =>
      ScheduleDefinitionTypeUnsupportedFault(type: type, message: message),
  'ScheduledActionAlreadyExistsFault': (type, message) =>
      ScheduledActionAlreadyExistsFault(type: type, message: message),
  'ScheduledActionNotFoundFault': (type, message) =>
      ScheduledActionNotFoundFault(type: type, message: message),
  'ScheduledActionQuotaExceededFault': (type, message) =>
      ScheduledActionQuotaExceededFault(type: type, message: message),
  'ScheduledActionTypeUnsupportedFault': (type, message) =>
      ScheduledActionTypeUnsupportedFault(type: type, message: message),
  'SnapshotCopyAlreadyDisabledFault': (type, message) =>
      SnapshotCopyAlreadyDisabledFault(type: type, message: message),
  'SnapshotCopyAlreadyEnabledFault': (type, message) =>
      SnapshotCopyAlreadyEnabledFault(type: type, message: message),
  'SnapshotCopyDisabledFault': (type, message) =>
      SnapshotCopyDisabledFault(type: type, message: message),
  'SnapshotCopyGrantAlreadyExistsFault': (type, message) =>
      SnapshotCopyGrantAlreadyExistsFault(type: type, message: message),
  'SnapshotCopyGrantNotFoundFault': (type, message) =>
      SnapshotCopyGrantNotFoundFault(type: type, message: message),
  'SnapshotCopyGrantQuotaExceededFault': (type, message) =>
      SnapshotCopyGrantQuotaExceededFault(type: type, message: message),
  'SnapshotScheduleAlreadyExistsFault': (type, message) =>
      SnapshotScheduleAlreadyExistsFault(type: type, message: message),
  'SnapshotScheduleNotFoundFault': (type, message) =>
      SnapshotScheduleNotFoundFault(type: type, message: message),
  'SnapshotScheduleQuotaExceededFault': (type, message) =>
      SnapshotScheduleQuotaExceededFault(type: type, message: message),
  'SnapshotScheduleUpdateInProgressFault': (type, message) =>
      SnapshotScheduleUpdateInProgressFault(type: type, message: message),
  'SourceNotFoundFault': (type, message) =>
      SourceNotFoundFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'SubscriptionAlreadyExistFault': (type, message) =>
      SubscriptionAlreadyExistFault(type: type, message: message),
  'SubscriptionCategoryNotFoundFault': (type, message) =>
      SubscriptionCategoryNotFoundFault(type: type, message: message),
  'SubscriptionEventIdNotFoundFault': (type, message) =>
      SubscriptionEventIdNotFoundFault(type: type, message: message),
  'SubscriptionNotFoundFault': (type, message) =>
      SubscriptionNotFoundFault(type: type, message: message),
  'SubscriptionSeverityNotFoundFault': (type, message) =>
      SubscriptionSeverityNotFoundFault(type: type, message: message),
  'TableLimitExceededFault': (type, message) =>
      TableLimitExceededFault(type: type, message: message),
  'TableRestoreNotFoundFault': (type, message) =>
      TableRestoreNotFoundFault(type: type, message: message),
  'TagLimitExceededFault': (type, message) =>
      TagLimitExceededFault(type: type, message: message),
  'UnauthorizedOperation': (type, message) =>
      UnauthorizedOperation(type: type, message: message),
  'UnauthorizedPartnerIntegrationFault': (type, message) =>
      UnauthorizedPartnerIntegrationFault(type: type, message: message),
  'UnknownSnapshotCopyRegionFault': (type, message) =>
      UnknownSnapshotCopyRegionFault(type: type, message: message),
  'UnsupportedOperationFault': (type, message) =>
      UnsupportedOperationFault(type: type, message: message),
  'UnsupportedOptionFault': (type, message) =>
      UnsupportedOptionFault(type: type, message: message),
  'UsageLimitAlreadyExistsFault': (type, message) =>
      UsageLimitAlreadyExistsFault(type: type, message: message),
  'UsageLimitNotFoundFault': (type, message) =>
      UsageLimitNotFoundFault(type: type, message: message),
};
