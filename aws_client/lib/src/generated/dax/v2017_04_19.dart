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

/// DAX is a managed caching service engineered for Amazon DynamoDB. DAX
/// dramatically speeds up database reads by caching frequently-accessed data
/// from DynamoDB, so applications can access that data with sub-millisecond
/// latency. You can create a DAX cluster easily, using the AWS Management
/// Console. With a few simple modifications to your code, your application can
/// begin taking advantage of the DAX cluster and realize significant
/// improvements in read performance.
class Dax {
  final _s.JsonProtocol _protocol;
  Dax({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dax',
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

  /// Creates a DAX cluster. All nodes in the cluster run the same DAX caching
  /// software.
  ///
  /// May throw [ClusterAlreadyExistsFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [clusterName] :
  /// The cluster identifier. This parameter is stored as a lowercase string.
  ///
  /// <b>Constraints:</b>
  ///
  /// <ul>
  /// <li>
  /// A name must contain from 1 to 20 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// A name cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [iamRoleArn] :
  /// A valid Amazon Resource Name (ARN) that identifies an IAM role. At
  /// runtime, DAX will assume this role and use the role's permissions to
  /// access DynamoDB on your behalf.
  ///
  /// Parameter [nodeType] :
  /// The compute and memory capacity of the nodes in the cluster.
  ///
  /// Parameter [replicationFactor] :
  /// The number of nodes in the DAX cluster. A replication factor of 1 will
  /// create a single-node cluster, without any read replicas. For additional
  /// fault tolerance, you can create a multiple node cluster with one or more
  /// read replicas. To do this, set <code>ReplicationFactor</code> to a number
  /// between 3 (one primary and two read replicas) and 10 (one primary and nine
  /// read replicas). <code>If the AvailabilityZones</code> parameter is
  /// provided, its length must equal the <code>ReplicationFactor</code>.
  /// <note>
  /// AWS recommends that you have at least two read replicas per cluster.
  /// </note>
  ///
  /// Parameter [availabilityZones] :
  /// The Availability Zones (AZs) in which the cluster nodes will reside after
  /// the cluster has been created or updated. If provided, the length of this
  /// list must equal the <code>ReplicationFactor</code> parameter. If you omit
  /// this parameter, DAX will spread the nodes across Availability Zones for
  /// the highest availability.
  ///
  /// Parameter [clusterEndpointEncryptionType] :
  /// The type of encryption the cluster's endpoint should support. Values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> for no encryption
  /// </li>
  /// <li>
  /// <code>TLS</code> for Transport Layer Security
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the cluster.
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which
  /// notifications will be sent.
  /// <note>
  /// The Amazon SNS topic owner must be same as the DAX cluster owner.
  /// </note>
  ///
  /// Parameter [parameterGroupName] :
  /// The parameter group to be associated with the DAX cluster.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// Specifies the weekly time range during which maintenance on the DAX
  /// cluster is performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period. Valid values for <code>ddd</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>sun</code>
  /// </li>
  /// <li>
  /// <code>mon</code>
  /// </li>
  /// <li>
  /// <code>tue</code>
  /// </li>
  /// <li>
  /// <code>wed</code>
  /// </li>
  /// <li>
  /// <code>thu</code>
  /// </li>
  /// <li>
  /// <code>fri</code>
  /// </li>
  /// <li>
  /// <code>sat</code>
  /// </li>
  /// </ul>
  /// Example: <code>sun:05:00-sun:09:00</code>
  /// <note>
  /// If you don't specify a preferred maintenance window when you create or
  /// modify a cache cluster, DAX assigns a 60-minute maintenance window on a
  /// randomly selected day of the week.
  /// </note>
  ///
  /// Parameter [sSESpecification] :
  /// Represents the settings used to enable server-side encryption on the
  /// cluster.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of security group IDs to be assigned to each node in the DAX
  /// cluster. (Each of the security group ID is system-generated.)
  ///
  /// If this parameter is not specified, DAX assigns the default VPC security
  /// group to each node.
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group to be used for the replication group.
  /// <important>
  /// DAX clusters can only run in an Amazon VPC environment. All of the subnets
  /// that you specify in a subnet group must exist in the same VPC.
  /// </important>
  ///
  /// Parameter [tags] :
  /// A set of tags to associate with the DAX cluster.
  Future<CreateClusterResponse> createCluster({
    required String clusterName,
    required String iamRoleArn,
    required String nodeType,
    required int replicationFactor,
    List<String>? availabilityZones,
    ClusterEndpointEncryptionType? clusterEndpointEncryptionType,
    String? description,
    String? notificationTopicArn,
    String? parameterGroupName,
    String? preferredMaintenanceWindow,
    SSESpecification? sSESpecification,
    List<String>? securityGroupIds,
    String? subnetGroupName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'IamRoleArn': iamRoleArn,
        'NodeType': nodeType,
        'ReplicationFactor': replicationFactor,
        if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
        if (clusterEndpointEncryptionType != null)
          'ClusterEndpointEncryptionType':
              clusterEndpointEncryptionType.toValue(),
        if (description != null) 'Description': description,
        if (notificationTopicArn != null)
          'NotificationTopicArn': notificationTopicArn,
        if (parameterGroupName != null)
          'ParameterGroupName': parameterGroupName,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        if (sSESpecification != null) 'SSESpecification': sSESpecification,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new parameter group. A parameter group is a collection of
  /// parameters that you apply to all of the nodes in a DAX cluster.
  ///
  /// May throw [ParameterGroupQuotaExceededFault].
  /// May throw [ParameterGroupAlreadyExistsFault].
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to apply to all of the clusters in this
  /// replication group.
  ///
  /// Parameter [description] :
  /// A description of the parameter group.
  Future<CreateParameterGroupResponse> createParameterGroup({
    required String parameterGroupName,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.CreateParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        if (description != null) 'Description': description,
      },
    );

    return CreateParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new subnet group.
  ///
  /// May throw [SubnetGroupAlreadyExistsFault].
  /// May throw [SubnetGroupQuotaExceededFault].
  /// May throw [SubnetQuotaExceededFault].
  /// May throw [InvalidSubnet].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [subnetGroupName] :
  /// A name for the subnet group. This value is stored as a lowercase string.
  ///
  /// Parameter [subnetIds] :
  /// A list of VPC subnet IDs for the subnet group.
  ///
  /// Parameter [description] :
  /// A description for the subnet group
  Future<CreateSubnetGroupResponse> createSubnetGroup({
    required String subnetGroupName,
    required List<String> subnetIds,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.CreateSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
        'SubnetIds': subnetIds,
        if (description != null) 'Description': description,
      },
    );

    return CreateSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more nodes from a DAX cluster.
  /// <note>
  /// You cannot use <code>DecreaseReplicationFactor</code> to remove the last
  /// node in a DAX cluster. If you need to do this, use
  /// <code>DeleteCluster</code> instead.
  /// </note>
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [NodeNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the DAX cluster from which you want to remove nodes.
  ///
  /// Parameter [newReplicationFactor] :
  /// The new number of nodes for the DAX cluster.
  ///
  /// Parameter [availabilityZones] :
  /// The Availability Zone(s) from which to remove nodes.
  ///
  /// Parameter [nodeIdsToRemove] :
  /// The unique identifiers of the nodes to be removed from the cluster.
  Future<DecreaseReplicationFactorResponse> decreaseReplicationFactor({
    required String clusterName,
    required int newReplicationFactor,
    List<String>? availabilityZones,
    List<String>? nodeIdsToRemove,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DecreaseReplicationFactor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'NewReplicationFactor': newReplicationFactor,
        if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
        if (nodeIdsToRemove != null) 'NodeIdsToRemove': nodeIdsToRemove,
      },
    );

    return DecreaseReplicationFactorResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a previously provisioned DAX cluster. <i>DeleteCluster</i> deletes
  /// all associated nodes, node endpoints and the DAX cluster itself. When you
  /// receive a successful response from this action, DAX immediately begins
  /// deleting the cluster; you cannot cancel or revert this action.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to be deleted.
  Future<DeleteClusterResponse> deleteCluster({
    required String clusterName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DeleteCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
      },
    );

    return DeleteClusterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified parameter group. You cannot delete a parameter group
  /// if it is associated with any DAX clusters.
  ///
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to delete.
  Future<DeleteParameterGroupResponse> deleteParameterGroup({
    required String parameterGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DeleteParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
      },
    );

    return DeleteParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a subnet group.
  /// <note>
  /// You cannot delete a subnet group if it is associated with any DAX
  /// clusters.
  /// </note>
  ///
  /// May throw [SubnetGroupInUseFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group to delete.
  Future<DeleteSubnetGroupResponse> deleteSubnetGroup({
    required String subnetGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DeleteSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
      },
    );

    return DeleteSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about all provisioned DAX clusters if no cluster
  /// identifier is specified, or about a specific DAX cluster if a cluster
  /// identifier is supplied.
  ///
  /// If the cluster is in the CREATING state, only cluster level information
  /// will be displayed until all of the nodes are successfully provisioned.
  ///
  /// If the cluster is in the DELETING state, only cluster level information
  /// will be displayed.
  ///
  /// If nodes are currently being added to the DAX cluster, node endpoint
  /// information and creation time for the additional nodes will not be
  /// displayed until they are completely provisioned. When the DAX cluster
  /// state is <i>available</i>, the cluster is ready for use.
  ///
  /// If nodes are currently being removed from the DAX cluster, no endpoint
  /// information for the removed nodes is displayed.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterNames] :
  /// The names of the DAX clusters being described.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  Future<DescribeClustersResponse> describeClusters({
    List<String>? clusterNames,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterNames != null) 'ClusterNames': clusterNames,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeClustersResponse.fromJson(jsonResponse.body);
  }

  /// Returns the default system parameter information for the DAX caching
  /// software.
  ///
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  Future<DescribeDefaultParametersResponse> describeDefaultParameters({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeDefaultParameters'
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

    return DescribeDefaultParametersResponse.fromJson(jsonResponse.body);
  }

  /// Returns events related to DAX clusters and parameter groups. You can
  /// obtain events specific to a particular DAX cluster or parameter group by
  /// providing the name as a parameter.
  ///
  /// By default, only the events occurring within the last 24 hours are
  /// returned; however, you can retrieve up to 14 days' worth of events if
  /// necessary.
  ///
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [duration] :
  /// The number of minutes' worth of events to retrieve.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [sourceName] :
  /// The identifier of the event source for which events will be returned. If
  /// not specified, then all sources are included in the response.
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format.
  Future<DescribeEventsResponse> describeEvents({
    int? duration,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    String? sourceName,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (duration != null) 'Duration': duration,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sourceName != null) 'SourceName': sourceName,
        if (sourceType != null) 'SourceType': sourceType.toValue(),
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return DescribeEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of parameter group descriptions. If a parameter group name
  /// is specified, the list will contain only the descriptions for that group.
  ///
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [parameterGroupNames] :
  /// The names of the parameter groups.
  Future<DescribeParameterGroupsResponse> describeParameterGroups({
    int? maxResults,
    String? nextToken,
    List<String>? parameterGroupNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeParameterGroups'
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
        if (parameterGroupNames != null)
          'ParameterGroupNames': parameterGroupNames,
      },
    );

    return DescribeParameterGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the detailed parameter list for a particular parameter group.
  ///
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [source] :
  /// How the parameter is defined. For example, <code>system</code> denotes a
  /// system-defined parameter.
  Future<DescribeParametersResponse> describeParameters({
    required String parameterGroupName,
    int? maxResults,
    String? nextToken,
    String? source,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (source != null) 'Source': source,
      },
    );

    return DescribeParametersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of subnet group descriptions. If a subnet group name is
  /// specified, the list will contain only the description of that group.
  ///
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for <code>MaxResults</code> must be between 20 and 100.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [subnetGroupNames] :
  /// The name of the subnet group.
  Future<DescribeSubnetGroupsResponse> describeSubnetGroups({
    int? maxResults,
    String? nextToken,
    List<String>? subnetGroupNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.DescribeSubnetGroups'
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
        if (subnetGroupNames != null) 'SubnetGroupNames': subnetGroupNames,
      },
    );

    return DescribeSubnetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more nodes to a DAX cluster.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the DAX cluster that will receive additional nodes.
  ///
  /// Parameter [newReplicationFactor] :
  /// The new number of nodes for the DAX cluster.
  ///
  /// Parameter [availabilityZones] :
  /// The Availability Zones (AZs) in which the cluster nodes will be created.
  /// All nodes belonging to the cluster are placed in these Availability Zones.
  /// Use this parameter if you want to distribute the nodes across multiple
  /// AZs.
  Future<IncreaseReplicationFactorResponse> increaseReplicationFactor({
    required String clusterName,
    required int newReplicationFactor,
    List<String>? availabilityZones,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.IncreaseReplicationFactor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'NewReplicationFactor': newReplicationFactor,
        if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      },
    );

    return IncreaseReplicationFactorResponse.fromJson(jsonResponse.body);
  }

  /// List all of the tags for a DAX cluster. You can call <code>ListTags</code>
  /// up to 10 times per second, per account.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidARNFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [resourceName] :
  /// The name of the DAX resource to which the tags belong.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token.
  Future<ListTagsResponse> listTags({
    required String resourceName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Reboots a single node of a DAX cluster. The reboot action takes place as
  /// soon as possible. During the reboot, the node status is set to REBOOTING.
  /// <note>
  /// <code>RebootNode</code> restarts the DAX engine process and does not
  /// remove the contents of the cache.
  /// </note>
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [NodeNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the DAX cluster containing the node to be rebooted.
  ///
  /// Parameter [nodeId] :
  /// The system-assigned ID of the node to be rebooted.
  Future<RebootNodeResponse> rebootNode({
    required String clusterName,
    required String nodeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.RebootNode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'NodeId': nodeId,
      },
    );

    return RebootNodeResponse.fromJson(jsonResponse.body);
  }

  /// Associates a set of tags with a DAX resource. You can call
  /// <code>TagResource</code> up to 5 times per second, per account.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidARNFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [resourceName] :
  /// The name of the DAX resource to which tags should be added.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the DAX resource.
  Future<TagResourceResponse> tagResource({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the association of tags from a DAX resource. You can call
  /// <code>UntagResource</code> up to 5 times per second, per account.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidARNFault].
  /// May throw [TagNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [resourceName] :
  /// The name of the DAX resource from which the tags should be removed.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. If the DAX cluster has any tags with these keys, then
  /// the tags are removed from the cluster.
  Future<UntagResourceResponse> untagResource({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the settings for a DAX cluster. You can use this action to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  ///
  /// May throw [InvalidClusterStateFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the DAX cluster to be modified.
  ///
  /// Parameter [description] :
  /// A description of the changes being made to the cluster.
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) that identifies the topic.
  ///
  /// Parameter [notificationTopicStatus] :
  /// The current state of the topic. A value of “active” means that
  /// notifications will be sent to the topic. A value of “inactive” means that
  /// notifications will not be sent to the topic.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of a parameter group for this cluster.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// A range of time when maintenance of DAX cluster software will be
  /// performed. For example: <code>sun:01:00-sun:09:00</code>. Cluster
  /// maintenance normally takes less than 30 minutes, and is performed
  /// automatically within the maintenance window.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of user-specified security group IDs to be assigned to each node in
  /// the DAX cluster. If this parameter is not specified, DAX assigns the
  /// default VPC security group to each node.
  Future<UpdateClusterResponse> updateCluster({
    required String clusterName,
    String? description,
    String? notificationTopicArn,
    String? notificationTopicStatus,
    String? parameterGroupName,
    String? preferredMaintenanceWindow,
    List<String>? securityGroupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.UpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        if (description != null) 'Description': description,
        if (notificationTopicArn != null)
          'NotificationTopicArn': notificationTopicArn,
        if (notificationTopicStatus != null)
          'NotificationTopicStatus': notificationTopicStatus,
        if (parameterGroupName != null)
          'ParameterGroupName': parameterGroupName,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      },
    );

    return UpdateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the parameters of a parameter group. You can modify up to 20
  /// parameters in a single request by submitting a list parameter name and
  /// value pairs.
  ///
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group.
  ///
  /// Parameter [parameterNameValues] :
  /// An array of name-value pairs for the parameters in the group. Each element
  /// in the array represents a single parameter.
  /// <note>
  /// <code>record-ttl-millis</code> and <code>query-ttl-millis</code> are the
  /// only supported parameter names. For more details, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.cluster-management.html#DAX.cluster-management.custom-settings.ttl">Configuring
  /// TTL Settings</a>.
  /// </note>
  Future<UpdateParameterGroupResponse> updateParameterGroup({
    required String parameterGroupName,
    required List<ParameterNameValue> parameterNameValues,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.UpdateParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        'ParameterNameValues': parameterNameValues,
      },
    );

    return UpdateParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an existing subnet group.
  ///
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [SubnetQuotaExceededFault].
  /// May throw [SubnetInUse].
  /// May throw [InvalidSubnet].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group.
  ///
  /// Parameter [description] :
  /// A description of the subnet group.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs in the subnet group.
  Future<UpdateSubnetGroupResponse> updateSubnetGroup({
    required String subnetGroupName,
    String? description,
    List<String>? subnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDAXV3.UpdateSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
        if (description != null) 'Description': description,
        if (subnetIds != null) 'SubnetIds': subnetIds,
      },
    );

    return UpdateSubnetGroupResponse.fromJson(jsonResponse.body);
  }
}

enum ChangeType {
  immediate,
  requiresReboot,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.immediate:
        return 'IMMEDIATE';
      case ChangeType.requiresReboot:
        return 'REQUIRES_REBOOT';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'IMMEDIATE':
        return ChangeType.immediate;
      case 'REQUIRES_REBOOT':
        return ChangeType.requiresReboot;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

/// Contains all of the attributes of a specific DAX cluster.
class Cluster {
  /// The number of nodes in the cluster that are active (i.e., capable of serving
  /// requests).
  final int? activeNodes;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  final String? clusterArn;

  /// The endpoint for this DAX cluster, consisting of a DNS name, a port number,
  /// and a URL. Applications should use the URL to configure the DAX client to
  /// find their cluster.
  final Endpoint? clusterDiscoveryEndpoint;

  /// The type of encryption supported by the cluster's endpoint. Values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> for no encryption
  ///
  /// <code>TLS</code> for Transport Layer Security
  /// </li>
  /// </ul>
  final ClusterEndpointEncryptionType? clusterEndpointEncryptionType;

  /// The name of the DAX cluster.
  final String? clusterName;

  /// The description of the cluster.
  final String? description;

  /// A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime,
  /// DAX will assume this role and use the role's permissions to access DynamoDB
  /// on your behalf.
  final String? iamRoleArn;

  /// A list of nodes to be removed from the cluster.
  final List<String>? nodeIdsToRemove;

  /// The node type for the nodes in the cluster. (All nodes in a DAX cluster are
  /// of the same type.)
  final String? nodeType;

  /// A list of nodes that are currently in the cluster.
  final List<Node>? nodes;

  /// Describes a notification topic and its status. Notification topics are used
  /// for publishing DAX events to subscribers using Amazon Simple Notification
  /// Service (SNS).
  final NotificationConfiguration? notificationConfiguration;

  /// The parameter group being used by nodes in the cluster.
  final ParameterGroupStatus? parameterGroup;

  /// A range of time when maintenance of DAX cluster software will be performed.
  /// For example: <code>sun:01:00-sun:09:00</code>. Cluster maintenance normally
  /// takes less than 30 minutes, and is performed automatically within the
  /// maintenance window.
  final String? preferredMaintenanceWindow;

  /// The description of the server-side encryption status on the specified DAX
  /// cluster.
  final SSEDescription? sSEDescription;

  /// A list of security groups, and the status of each, for the nodes in the
  /// cluster.
  final List<SecurityGroupMembership>? securityGroups;

  /// The current status of the cluster.
  final String? status;

  /// The subnet group where the DAX cluster is running.
  final String? subnetGroup;

  /// The total number of nodes in the cluster.
  final int? totalNodes;

  Cluster({
    this.activeNodes,
    this.clusterArn,
    this.clusterDiscoveryEndpoint,
    this.clusterEndpointEncryptionType,
    this.clusterName,
    this.description,
    this.iamRoleArn,
    this.nodeIdsToRemove,
    this.nodeType,
    this.nodes,
    this.notificationConfiguration,
    this.parameterGroup,
    this.preferredMaintenanceWindow,
    this.sSEDescription,
    this.securityGroups,
    this.status,
    this.subnetGroup,
    this.totalNodes,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      activeNodes: json['ActiveNodes'] as int?,
      clusterArn: json['ClusterArn'] as String?,
      clusterDiscoveryEndpoint: json['ClusterDiscoveryEndpoint'] != null
          ? Endpoint.fromJson(
              json['ClusterDiscoveryEndpoint'] as Map<String, dynamic>)
          : null,
      clusterEndpointEncryptionType:
          (json['ClusterEndpointEncryptionType'] as String?)
              ?.toClusterEndpointEncryptionType(),
      clusterName: json['ClusterName'] as String?,
      description: json['Description'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      nodeIdsToRemove: (json['NodeIdsToRemove'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nodeType: json['NodeType'] as String?,
      nodes: (json['Nodes'] as List?)
          ?.whereNotNull()
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationConfiguration: json['NotificationConfiguration'] != null
          ? NotificationConfiguration.fromJson(
              json['NotificationConfiguration'] as Map<String, dynamic>)
          : null,
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroupStatus.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      sSEDescription: json['SSEDescription'] != null
          ? SSEDescription.fromJson(
              json['SSEDescription'] as Map<String, dynamic>)
          : null,
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['Status'] as String?,
      subnetGroup: json['SubnetGroup'] as String?,
      totalNodes: json['TotalNodes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeNodes = this.activeNodes;
    final clusterArn = this.clusterArn;
    final clusterDiscoveryEndpoint = this.clusterDiscoveryEndpoint;
    final clusterEndpointEncryptionType = this.clusterEndpointEncryptionType;
    final clusterName = this.clusterName;
    final description = this.description;
    final iamRoleArn = this.iamRoleArn;
    final nodeIdsToRemove = this.nodeIdsToRemove;
    final nodeType = this.nodeType;
    final nodes = this.nodes;
    final notificationConfiguration = this.notificationConfiguration;
    final parameterGroup = this.parameterGroup;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final sSEDescription = this.sSEDescription;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final subnetGroup = this.subnetGroup;
    final totalNodes = this.totalNodes;
    return {
      if (activeNodes != null) 'ActiveNodes': activeNodes,
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (clusterDiscoveryEndpoint != null)
        'ClusterDiscoveryEndpoint': clusterDiscoveryEndpoint,
      if (clusterEndpointEncryptionType != null)
        'ClusterEndpointEncryptionType':
            clusterEndpointEncryptionType.toValue(),
      if (clusterName != null) 'ClusterName': clusterName,
      if (description != null) 'Description': description,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (nodeIdsToRemove != null) 'NodeIdsToRemove': nodeIdsToRemove,
      if (nodeType != null) 'NodeType': nodeType,
      if (nodes != null) 'Nodes': nodes,
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (sSEDescription != null) 'SSEDescription': sSEDescription,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (status != null) 'Status': status,
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
      if (totalNodes != null) 'TotalNodes': totalNodes,
    };
  }
}

enum ClusterEndpointEncryptionType {
  none,
  tls,
}

extension ClusterEndpointEncryptionTypeValueExtension
    on ClusterEndpointEncryptionType {
  String toValue() {
    switch (this) {
      case ClusterEndpointEncryptionType.none:
        return 'NONE';
      case ClusterEndpointEncryptionType.tls:
        return 'TLS';
    }
  }
}

extension ClusterEndpointEncryptionTypeFromString on String {
  ClusterEndpointEncryptionType toClusterEndpointEncryptionType() {
    switch (this) {
      case 'NONE':
        return ClusterEndpointEncryptionType.none;
      case 'TLS':
        return ClusterEndpointEncryptionType.tls;
    }
    throw Exception('$this is not known in enum ClusterEndpointEncryptionType');
  }
}

class CreateClusterResponse {
  /// A description of the DAX cluster that you have created.
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

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class CreateParameterGroupResponse {
  /// Represents the output of a <i>CreateParameterGroup</i> action.
  final ParameterGroup? parameterGroup;

  CreateParameterGroupResponse({
    this.parameterGroup,
  });

  factory CreateParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

class CreateSubnetGroupResponse {
  /// Represents the output of a <i>CreateSubnetGroup</i> operation.
  final SubnetGroup? subnetGroup;

  CreateSubnetGroupResponse({
    this.subnetGroup,
  });

  factory CreateSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateSubnetGroupResponse(
      subnetGroup: json['SubnetGroup'] != null
          ? SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetGroup = this.subnetGroup;
    return {
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
    };
  }
}

class DecreaseReplicationFactorResponse {
  /// A description of the DAX cluster, after you have decreased its replication
  /// factor.
  final Cluster? cluster;

  DecreaseReplicationFactorResponse({
    this.cluster,
  });

  factory DecreaseReplicationFactorResponse.fromJson(
      Map<String, dynamic> json) {
    return DecreaseReplicationFactorResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class DeleteClusterResponse {
  /// A description of the DAX cluster that is being deleted.
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

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class DeleteParameterGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// parameter group).
  final String? deletionMessage;

  DeleteParameterGroupResponse({
    this.deletionMessage,
  });

  factory DeleteParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteParameterGroupResponse(
      deletionMessage: json['DeletionMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionMessage = this.deletionMessage;
    return {
      if (deletionMessage != null) 'DeletionMessage': deletionMessage,
    };
  }
}

class DeleteSubnetGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// subnet group).
  final String? deletionMessage;

  DeleteSubnetGroupResponse({
    this.deletionMessage,
  });

  factory DeleteSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSubnetGroupResponse(
      deletionMessage: json['DeletionMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionMessage = this.deletionMessage;
    return {
      if (deletionMessage != null) 'DeletionMessage': deletionMessage,
    };
  }
}

class DescribeClustersResponse {
  /// The descriptions of your DAX clusters, in response to a
  /// <i>DescribeClusters</i> request.
  final List<Cluster>? clusters;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });

  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClustersResponse(
      clusters: (json['Clusters'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      if (clusters != null) 'Clusters': clusters,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeDefaultParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// A list of parameters. Each element in the list represents one parameter.
  final List<Parameter>? parameters;

  DescribeDefaultParametersResponse({
    this.nextToken,
    this.parameters,
  });

  factory DescribeDefaultParametersResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDefaultParametersResponse(
      nextToken: json['NextToken'] as String?,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parameters = this.parameters;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

class DescribeEventsResponse {
  /// An array of events. Each element in the array represents one event.
  final List<Event>? events;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });

  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventsResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeParameterGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// An array of parameter groups. Each element in the array represents one
  /// parameter group.
  final List<ParameterGroup>? parameterGroups;

  DescribeParameterGroupsResponse({
    this.nextToken,
    this.parameterGroups,
  });

  factory DescribeParameterGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeParameterGroupsResponse(
      nextToken: json['NextToken'] as String?,
      parameterGroups: (json['ParameterGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parameterGroups = this.parameterGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parameterGroups != null) 'ParameterGroups': parameterGroups,
    };
  }
}

class DescribeParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// A list of parameters within a parameter group. Each element in the list
  /// represents one parameter.
  final List<Parameter>? parameters;

  DescribeParametersResponse({
    this.nextToken,
    this.parameters,
  });

  factory DescribeParametersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeParametersResponse(
      nextToken: json['NextToken'] as String?,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parameters = this.parameters;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

class DescribeSubnetGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// An array of subnet groups. Each element in the array represents a single
  /// subnet group.
  final List<SubnetGroup>? subnetGroups;

  DescribeSubnetGroupsResponse({
    this.nextToken,
    this.subnetGroups,
  });

  factory DescribeSubnetGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSubnetGroupsResponse(
      nextToken: json['NextToken'] as String?,
      subnetGroups: (json['SubnetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SubnetGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subnetGroups = this.subnetGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subnetGroups != null) 'SubnetGroups': subnetGroups,
    };
  }
}

/// Represents the information required for client programs to connect to the
/// endpoint for a DAX cluster.
class Endpoint {
  /// The DNS hostname of the endpoint.
  final String? address;

  /// The port number that applications should use to connect to the endpoint.
  final int? port;

  /// The URL that applications should use to connect to the endpoint. The default
  /// ports are 8111 for the "dax" protocol and 9111 for the "daxs" protocol.
  final String? url;

  Endpoint({
    this.address,
    this.port,
    this.url,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      address: json['Address'] as String?,
      port: json['Port'] as int?,
      url: json['URL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    final url = this.url;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
      if (url != null) 'URL': url,
    };
  }
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a DAX cluster, adding or removing a
/// node, or rebooting a node.
class Event {
  /// The date and time when the event occurred.
  final DateTime? date;

  /// A user-defined message associated with the event.
  final String? message;

  /// The source of the event. For example, if the event occurred at the node
  /// level, the source would be the node ID.
  final String? sourceName;

  /// Specifies the origin of this event - a cluster, a parameter group, a node
  /// ID, etc.
  final SourceType? sourceType;

  Event({
    this.date,
    this.message,
    this.sourceName,
    this.sourceType,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: timeStampFromJson(json['Date']),
      message: json['Message'] as String?,
      sourceName: json['SourceName'] as String?,
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final message = this.message;
    final sourceName = this.sourceName;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (message != null) 'Message': message,
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

class IncreaseReplicationFactorResponse {
  /// A description of the DAX cluster. with its new replication factor.
  final Cluster? cluster;

  IncreaseReplicationFactorResponse({
    this.cluster,
  });

  factory IncreaseReplicationFactorResponse.fromJson(
      Map<String, dynamic> json) {
    return IncreaseReplicationFactorResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

enum IsModifiable {
  $true,
  $false,
  conditional,
}

extension IsModifiableValueExtension on IsModifiable {
  String toValue() {
    switch (this) {
      case IsModifiable.$true:
        return 'TRUE';
      case IsModifiable.$false:
        return 'FALSE';
      case IsModifiable.conditional:
        return 'CONDITIONAL';
    }
  }
}

extension IsModifiableFromString on String {
  IsModifiable toIsModifiable() {
    switch (this) {
      case 'TRUE':
        return IsModifiable.$true;
      case 'FALSE':
        return IsModifiable.$false;
      case 'CONDITIONAL':
        return IsModifiable.conditional;
    }
    throw Exception('$this is not known in enum IsModifiable');
  }
}

class ListTagsResponse {
  /// If this value is present, there are additional results to be displayed. To
  /// retrieve them, call <code>ListTags</code> again, with <code>NextToken</code>
  /// set to this value.
  final String? nextToken;

  /// A list of tags currently associated with the DAX cluster.
  final List<Tag>? tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents an individual node within a DAX cluster.
class Node {
  /// The Availability Zone (AZ) in which the node has been deployed.
  final String? availabilityZone;

  /// The endpoint for the node, consisting of a DNS name and a port number.
  /// Client applications can connect directly to a node endpoint, if desired (as
  /// an alternative to allowing DAX client software to intelligently route
  /// requests and responses to nodes in the DAX cluster.
  final Endpoint? endpoint;

  /// The date and time (in UNIX epoch format) when the node was launched.
  final DateTime? nodeCreateTime;

  /// A system-generated identifier for the node.
  final String? nodeId;

  /// The current status of the node. For example: <code>available</code>.
  final String? nodeStatus;

  /// The status of the parameter group associated with this node. For example,
  /// <code>in-sync</code>.
  final String? parameterGroupStatus;

  Node({
    this.availabilityZone,
    this.endpoint,
    this.nodeCreateTime,
    this.nodeId,
    this.nodeStatus,
    this.parameterGroupStatus,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      availabilityZone: json['AvailabilityZone'] as String?,
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
      nodeCreateTime: timeStampFromJson(json['NodeCreateTime']),
      nodeId: json['NodeId'] as String?,
      nodeStatus: json['NodeStatus'] as String?,
      parameterGroupStatus: json['ParameterGroupStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final endpoint = this.endpoint;
    final nodeCreateTime = this.nodeCreateTime;
    final nodeId = this.nodeId;
    final nodeStatus = this.nodeStatus;
    final parameterGroupStatus = this.parameterGroupStatus;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (endpoint != null) 'Endpoint': endpoint,
      if (nodeCreateTime != null)
        'NodeCreateTime': unixTimestampToJson(nodeCreateTime),
      if (nodeId != null) 'NodeId': nodeId,
      if (nodeStatus != null) 'NodeStatus': nodeStatus,
      if (parameterGroupStatus != null)
        'ParameterGroupStatus': parameterGroupStatus,
    };
  }
}

/// Represents a parameter value that is applicable to a particular node type.
class NodeTypeSpecificValue {
  /// A node type to which the parameter value applies.
  final String? nodeType;

  /// The parameter value for this node type.
  final String? value;

  NodeTypeSpecificValue({
    this.nodeType,
    this.value,
  });

  factory NodeTypeSpecificValue.fromJson(Map<String, dynamic> json) {
    return NodeTypeSpecificValue(
      nodeType: json['NodeType'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeType = this.nodeType;
    final value = this.value;
    return {
      if (nodeType != null) 'NodeType': nodeType,
      if (value != null) 'Value': value,
    };
  }
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing DAX events to subscribers using Amazon Simple Notification
/// Service (SNS).
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  final String? topicArn;

  /// The current state of the topic. A value of “active” means that notifications
  /// will be sent to the topic. A value of “inactive” means that notifications
  /// will not be sent to the topic.
  final String? topicStatus;

  NotificationConfiguration({
    this.topicArn,
    this.topicStatus,
  });

  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationConfiguration(
      topicArn: json['TopicArn'] as String?,
      topicStatus: json['TopicStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    final topicStatus = this.topicStatus;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
      if (topicStatus != null) 'TopicStatus': topicStatus,
    };
  }
}

/// Describes an individual setting that controls some aspect of DAX behavior.
class Parameter {
  /// A range of values within which the parameter can be set.
  final String? allowedValues;

  /// The conditions under which changes to this parameter can be applied. For
  /// example, <code>requires-reboot</code> indicates that a new value for this
  /// parameter will only take effect if a node is rebooted.
  final ChangeType? changeType;

  /// The data type of the parameter. For example, <code>integer</code>:
  final String? dataType;

  /// A description of the parameter
  final String? description;

  /// Whether the customer is allowed to modify the parameter.
  final IsModifiable? isModifiable;

  /// A list of node types, and specific parameter values for each node.
  final List<NodeTypeSpecificValue>? nodeTypeSpecificValues;

  /// The name of the parameter.
  final String? parameterName;

  /// Determines whether the parameter can be applied to any nodes, or only nodes
  /// of a particular type.
  final ParameterType? parameterType;

  /// The value for the parameter.
  final String? parameterValue;

  /// How the parameter is defined. For example, <code>system</code> denotes a
  /// system-defined parameter.
  final String? source;

  Parameter({
    this.allowedValues,
    this.changeType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.nodeTypeSpecificValues,
    this.parameterName,
    this.parameterType,
    this.parameterValue,
    this.source,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      allowedValues: json['AllowedValues'] as String?,
      changeType: (json['ChangeType'] as String?)?.toChangeType(),
      dataType: json['DataType'] as String?,
      description: json['Description'] as String?,
      isModifiable: (json['IsModifiable'] as String?)?.toIsModifiable(),
      nodeTypeSpecificValues: (json['NodeTypeSpecificValues'] as List?)
          ?.whereNotNull()
          .map((e) => NodeTypeSpecificValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameterName: json['ParameterName'] as String?,
      parameterType: (json['ParameterType'] as String?)?.toParameterType(),
      parameterValue: json['ParameterValue'] as String?,
      source: json['Source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final changeType = this.changeType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final nodeTypeSpecificValues = this.nodeTypeSpecificValues;
    final parameterName = this.parameterName;
    final parameterType = this.parameterType;
    final parameterValue = this.parameterValue;
    final source = this.source;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (changeType != null) 'ChangeType': changeType.toValue(),
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable.toValue(),
      if (nodeTypeSpecificValues != null)
        'NodeTypeSpecificValues': nodeTypeSpecificValues,
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterType != null) 'ParameterType': parameterType.toValue(),
      if (parameterValue != null) 'ParameterValue': parameterValue,
      if (source != null) 'Source': source,
    };
  }
}

/// A named set of parameters that are applied to all of the nodes in a DAX
/// cluster.
class ParameterGroup {
  /// A description of the parameter group.
  final String? description;

  /// The name of the parameter group.
  final String? parameterGroupName;

  ParameterGroup({
    this.description,
    this.parameterGroupName,
  });

  factory ParameterGroup.fromJson(Map<String, dynamic> json) {
    return ParameterGroup(
      description: json['Description'] as String?,
      parameterGroupName: json['ParameterGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final parameterGroupName = this.parameterGroupName;
    return {
      if (description != null) 'Description': description,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
    };
  }
}

/// The status of a parameter group.
class ParameterGroupStatus {
  /// The node IDs of one or more nodes to be rebooted.
  final List<String>? nodeIdsToReboot;

  /// The status of parameter updates.
  final String? parameterApplyStatus;

  /// The name of the parameter group.
  final String? parameterGroupName;

  ParameterGroupStatus({
    this.nodeIdsToReboot,
    this.parameterApplyStatus,
    this.parameterGroupName,
  });

  factory ParameterGroupStatus.fromJson(Map<String, dynamic> json) {
    return ParameterGroupStatus(
      nodeIdsToReboot: (json['NodeIdsToReboot'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      parameterApplyStatus: json['ParameterApplyStatus'] as String?,
      parameterGroupName: json['ParameterGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeIdsToReboot = this.nodeIdsToReboot;
    final parameterApplyStatus = this.parameterApplyStatus;
    final parameterGroupName = this.parameterGroupName;
    return {
      if (nodeIdsToReboot != null) 'NodeIdsToReboot': nodeIdsToReboot,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
    };
  }
}

/// An individual DAX parameter.
class ParameterNameValue {
  /// The name of the parameter.
  final String? parameterName;

  /// The value of the parameter.
  final String? parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
    };
  }
}

enum ParameterType {
  $default,
  nodeTypeSpecific,
}

extension ParameterTypeValueExtension on ParameterType {
  String toValue() {
    switch (this) {
      case ParameterType.$default:
        return 'DEFAULT';
      case ParameterType.nodeTypeSpecific:
        return 'NODE_TYPE_SPECIFIC';
    }
  }
}

extension ParameterTypeFromString on String {
  ParameterType toParameterType() {
    switch (this) {
      case 'DEFAULT':
        return ParameterType.$default;
      case 'NODE_TYPE_SPECIFIC':
        return ParameterType.nodeTypeSpecific;
    }
    throw Exception('$this is not known in enum ParameterType');
  }
}

class RebootNodeResponse {
  /// A description of the DAX cluster after a node has been rebooted.
  final Cluster? cluster;

  RebootNodeResponse({
    this.cluster,
  });

  factory RebootNodeResponse.fromJson(Map<String, dynamic> json) {
    return RebootNodeResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// The description of the server-side encryption status on the specified DAX
/// cluster.
class SSEDescription {
  /// The current state of server-side encryption:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLING</code> - Server-side encryption is being enabled.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Server-side encryption is enabled.
  /// </li>
  /// <li>
  /// <code>DISABLING</code> - Server-side encryption is being disabled.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - Server-side encryption is disabled.
  /// </li>
  /// </ul>
  final SSEStatus? status;

  SSEDescription({
    this.status,
  });

  factory SSEDescription.fromJson(Map<String, dynamic> json) {
    return SSEDescription(
      status: (json['Status'] as String?)?.toSSEStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Represents the settings used to enable server-side encryption.
class SSESpecification {
  /// Indicates whether server-side encryption is enabled (true) or disabled
  /// (false) on the cluster.
  final bool enabled;

  SSESpecification({
    required this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'Enabled': enabled,
    };
  }
}

enum SSEStatus {
  enabling,
  enabled,
  disabling,
  disabled,
}

extension SSEStatusValueExtension on SSEStatus {
  String toValue() {
    switch (this) {
      case SSEStatus.enabling:
        return 'ENABLING';
      case SSEStatus.enabled:
        return 'ENABLED';
      case SSEStatus.disabling:
        return 'DISABLING';
      case SSEStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension SSEStatusFromString on String {
  SSEStatus toSSEStatus() {
    switch (this) {
      case 'ENABLING':
        return SSEStatus.enabling;
      case 'ENABLED':
        return SSEStatus.enabled;
      case 'DISABLING':
        return SSEStatus.disabling;
      case 'DISABLED':
        return SSEStatus.disabled;
    }
    throw Exception('$this is not known in enum SSEStatus');
  }
}

/// An individual VPC security group and its status.
class SecurityGroupMembership {
  /// The unique ID for this security group.
  final String? securityGroupIdentifier;

  /// The status of this security group.
  final String? status;

  SecurityGroupMembership({
    this.securityGroupIdentifier,
    this.status,
  });

  factory SecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return SecurityGroupMembership(
      securityGroupIdentifier: json['SecurityGroupIdentifier'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIdentifier = this.securityGroupIdentifier;
    final status = this.status;
    return {
      if (securityGroupIdentifier != null)
        'SecurityGroupIdentifier': securityGroupIdentifier,
      if (status != null) 'Status': status,
    };
  }
}

enum SourceType {
  cluster,
  parameterGroup,
  subnetGroup,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.cluster:
        return 'CLUSTER';
      case SourceType.parameterGroup:
        return 'PARAMETER_GROUP';
      case SourceType.subnetGroup:
        return 'SUBNET_GROUP';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'CLUSTER':
        return SourceType.cluster;
      case 'PARAMETER_GROUP':
        return SourceType.parameterGroup;
      case 'SUBNET_GROUP':
        return SourceType.subnetGroup;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Represents the subnet associated with a DAX cluster. This parameter refers
/// to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used
/// with DAX.
class Subnet {
  /// The Availability Zone (AZ) for the subnet.
  final String? subnetAvailabilityZone;

  /// The system-assigned identifier for the subnet.
  final String? subnetIdentifier;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
  });

  factory Subnet.fromJson(Map<String, dynamic> json) {
    return Subnet(
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      subnetIdentifier: json['SubnetIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
    };
  }
}

/// Represents the output of one of the following actions:
///
/// <ul>
/// <li>
/// <i>CreateSubnetGroup</i>
/// </li>
/// <li>
/// <i>ModifySubnetGroup</i>
/// </li>
/// </ul>
class SubnetGroup {
  /// The description of the subnet group.
  final String? description;

  /// The name of the subnet group.
  final String? subnetGroupName;

  /// A list of subnets associated with the subnet group.
  final List<Subnet>? subnets;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.
  final String? vpcId;

  SubnetGroup({
    this.description,
    this.subnetGroupName,
    this.subnets,
    this.vpcId,
  });

  factory SubnetGroup.fromJson(Map<String, dynamic> json) {
    return SubnetGroup(
      description: json['Description'] as String?,
      subnetGroupName: json['SubnetGroupName'] as String?,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => Subnet.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final subnetGroupName = this.subnetGroupName;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (description != null) 'Description': description,
      if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A description of a tag. Every tag is a key-value pair. You can add up to 50
/// tags to a single DAX cluster.
///
/// AWS-assigned tag names and values are automatically assigned the
/// <code>aws:</code> prefix, which the user cannot assign. AWS-assigned tag
/// names do not count towards the tag limit of 50. User-assigned tag names have
/// the prefix <code>user:</code>.
///
/// You cannot backdate the application of a tag.
class Tag {
  /// The key for the tag. Tag keys are case sensitive. Every DAX cluster can only
  /// have one tag with the same key. If you try to add an existing tag (same
  /// key), the existing tag value will be updated to the new value.
  final String? key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
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

class TagResourceResponse {
  /// The list of tags that are associated with the DAX resource.
  final List<Tag>? tags;

  TagResourceResponse({
    this.tags,
  });

  factory TagResourceResponse.fromJson(Map<String, dynamic> json) {
    return TagResourceResponse(
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

class UntagResourceResponse {
  /// The tag keys that have been removed from the cluster.
  final List<Tag>? tags;

  UntagResourceResponse({
    this.tags,
  });

  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) {
    return UntagResourceResponse(
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

class UpdateClusterResponse {
  /// A description of the DAX cluster, after it has been modified.
  final Cluster? cluster;

  UpdateClusterResponse({
    this.cluster,
  });

  factory UpdateClusterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class UpdateParameterGroupResponse {
  /// The parameter group that has been modified.
  final ParameterGroup? parameterGroup;

  UpdateParameterGroupResponse({
    this.parameterGroup,
  });

  factory UpdateParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

class UpdateSubnetGroupResponse {
  /// The subnet group that has been modified.
  final SubnetGroup? subnetGroup;

  UpdateSubnetGroupResponse({
    this.subnetGroup,
  });

  factory UpdateSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSubnetGroupResponse(
      subnetGroup: json['SubnetGroup'] != null
          ? SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetGroup = this.subnetGroup;
    return {
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
    };
  }
}

class ClusterAlreadyExistsFault extends _s.GenericAwsException {
  ClusterAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'ClusterAlreadyExistsFault', message: message);
}

class ClusterNotFoundFault extends _s.GenericAwsException {
  ClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ClusterNotFoundFault', message: message);
}

class ClusterQuotaForCustomerExceededFault extends _s.GenericAwsException {
  ClusterQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterQuotaForCustomerExceededFault',
            message: message);
}

class InsufficientClusterCapacityFault extends _s.GenericAwsException {
  InsufficientClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientClusterCapacityFault',
            message: message);
}

class InvalidARNFault extends _s.GenericAwsException {
  InvalidARNFault({String? type, String? message})
      : super(type: type, code: 'InvalidARNFault', message: message);
}

class InvalidClusterStateFault extends _s.GenericAwsException {
  InvalidClusterStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidClusterStateFault', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterGroupStateFault extends _s.GenericAwsException {
  InvalidParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterGroupStateFault',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class NodeNotFoundFault extends _s.GenericAwsException {
  NodeNotFoundFault({String? type, String? message})
      : super(type: type, code: 'NodeNotFoundFault', message: message);
}

class NodeQuotaForClusterExceededFault extends _s.GenericAwsException {
  NodeQuotaForClusterExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NodeQuotaForClusterExceededFault',
            message: message);
}

class NodeQuotaForCustomerExceededFault extends _s.GenericAwsException {
  NodeQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NodeQuotaForCustomerExceededFault',
            message: message);
}

class ParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  ParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ParameterGroupAlreadyExistsFault',
            message: message);
}

class ParameterGroupNotFoundFault extends _s.GenericAwsException {
  ParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'ParameterGroupNotFoundFault', message: message);
}

class ParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  ParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ParameterGroupQuotaExceededFault',
            message: message);
}

class ServiceLinkedRoleNotFoundFault extends _s.GenericAwsException {
  ServiceLinkedRoleNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLinkedRoleNotFoundFault',
            message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class SubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  SubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetGroupAlreadyExistsFault',
            message: message);
}

class SubnetGroupInUseFault extends _s.GenericAwsException {
  SubnetGroupInUseFault({String? type, String? message})
      : super(type: type, code: 'SubnetGroupInUseFault', message: message);
}

class SubnetGroupNotFoundFault extends _s.GenericAwsException {
  SubnetGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SubnetGroupNotFoundFault', message: message);
}

class SubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  SubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetGroupQuotaExceededFault',
            message: message);
}

class SubnetInUse extends _s.GenericAwsException {
  SubnetInUse({String? type, String? message})
      : super(type: type, code: 'SubnetInUse', message: message);
}

class SubnetQuotaExceededFault extends _s.GenericAwsException {
  SubnetQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SubnetQuotaExceededFault', message: message);
}

class TagNotFoundFault extends _s.GenericAwsException {
  TagNotFoundFault({String? type, String? message})
      : super(type: type, code: 'TagNotFoundFault', message: message);
}

class TagQuotaPerResourceExceeded extends _s.GenericAwsException {
  TagQuotaPerResourceExceeded({String? type, String? message})
      : super(
            type: type, code: 'TagQuotaPerResourceExceeded', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClusterAlreadyExistsFault': (type, message) =>
      ClusterAlreadyExistsFault(type: type, message: message),
  'ClusterNotFoundFault': (type, message) =>
      ClusterNotFoundFault(type: type, message: message),
  'ClusterQuotaForCustomerExceededFault': (type, message) =>
      ClusterQuotaForCustomerExceededFault(type: type, message: message),
  'InsufficientClusterCapacityFault': (type, message) =>
      InsufficientClusterCapacityFault(type: type, message: message),
  'InvalidARNFault': (type, message) =>
      InvalidARNFault(type: type, message: message),
  'InvalidClusterStateFault': (type, message) =>
      InvalidClusterStateFault(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterGroupStateFault': (type, message) =>
      InvalidParameterGroupStateFault(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'NodeNotFoundFault': (type, message) =>
      NodeNotFoundFault(type: type, message: message),
  'NodeQuotaForClusterExceededFault': (type, message) =>
      NodeQuotaForClusterExceededFault(type: type, message: message),
  'NodeQuotaForCustomerExceededFault': (type, message) =>
      NodeQuotaForCustomerExceededFault(type: type, message: message),
  'ParameterGroupAlreadyExistsFault': (type, message) =>
      ParameterGroupAlreadyExistsFault(type: type, message: message),
  'ParameterGroupNotFoundFault': (type, message) =>
      ParameterGroupNotFoundFault(type: type, message: message),
  'ParameterGroupQuotaExceededFault': (type, message) =>
      ParameterGroupQuotaExceededFault(type: type, message: message),
  'ServiceLinkedRoleNotFoundFault': (type, message) =>
      ServiceLinkedRoleNotFoundFault(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'SubnetGroupAlreadyExistsFault': (type, message) =>
      SubnetGroupAlreadyExistsFault(type: type, message: message),
  'SubnetGroupInUseFault': (type, message) =>
      SubnetGroupInUseFault(type: type, message: message),
  'SubnetGroupNotFoundFault': (type, message) =>
      SubnetGroupNotFoundFault(type: type, message: message),
  'SubnetGroupQuotaExceededFault': (type, message) =>
      SubnetGroupQuotaExceededFault(type: type, message: message),
  'SubnetInUse': (type, message) => SubnetInUse(type: type, message: message),
  'SubnetQuotaExceededFault': (type, message) =>
      SubnetQuotaExceededFault(type: type, message: message),
  'TagNotFoundFault': (type, message) =>
      TagNotFoundFault(type: type, message: message),
  'TagQuotaPerResourceExceeded': (type, message) =>
      TagQuotaPerResourceExceeded(type: type, message: message),
};
