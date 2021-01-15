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

part '2017-04-19.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dax',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String clusterName,
    @_s.required String iamRoleArn,
    @_s.required String nodeType,
    @_s.required int replicationFactor,
    List<String> availabilityZones,
    String description,
    String notificationTopicArn,
    String parameterGroupName,
    String preferredMaintenanceWindow,
    SSESpecification sSESpecification,
    List<String> securityGroupIds,
    String subnetGroupName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(nodeType, 'nodeType');
    ArgumentError.checkNotNull(replicationFactor, 'replicationFactor');
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
    @_s.required String parameterGroupName,
    String description,
  }) async {
    ArgumentError.checkNotNull(parameterGroupName, 'parameterGroupName');
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
    @_s.required String subnetGroupName,
    @_s.required List<String> subnetIds,
    String description,
  }) async {
    ArgumentError.checkNotNull(subnetGroupName, 'subnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
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
    @_s.required String clusterName,
    @_s.required int newReplicationFactor,
    List<String> availabilityZones,
    List<String> nodeIdsToRemove,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(newReplicationFactor, 'newReplicationFactor');
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
    @_s.required String clusterName,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
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
    @_s.required String parameterGroupName,
  }) async {
    ArgumentError.checkNotNull(parameterGroupName, 'parameterGroupName');
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
    @_s.required String subnetGroupName,
  }) async {
    ArgumentError.checkNotNull(subnetGroupName, 'subnetGroupName');
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
    List<String> clusterNames,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int duration,
    DateTime endTime,
    int maxResults,
    String nextToken,
    String sourceName,
    SourceType sourceType,
    DateTime startTime,
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
    int maxResults,
    String nextToken,
    List<String> parameterGroupNames,
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
    @_s.required String parameterGroupName,
    int maxResults,
    String nextToken,
    String source,
  }) async {
    ArgumentError.checkNotNull(parameterGroupName, 'parameterGroupName');
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
    int maxResults,
    String nextToken,
    List<String> subnetGroupNames,
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
    @_s.required String clusterName,
    @_s.required int newReplicationFactor,
    List<String> availabilityZones,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(newReplicationFactor, 'newReplicationFactor');
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
    @_s.required String resourceName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
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
    @_s.required String clusterName,
    @_s.required String nodeId,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodeId, 'nodeId');
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
    @_s.required String resourceName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
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
    @_s.required String resourceName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// The current state of the topic.
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
    @_s.required String clusterName,
    String description,
    String notificationTopicArn,
    String notificationTopicStatus,
    String parameterGroupName,
    String preferredMaintenanceWindow,
    List<String> securityGroupIds,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
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
  Future<UpdateParameterGroupResponse> updateParameterGroup({
    @_s.required String parameterGroupName,
    @_s.required List<ParameterNameValue> parameterNameValues,
  }) async {
    ArgumentError.checkNotNull(parameterGroupName, 'parameterGroupName');
    ArgumentError.checkNotNull(parameterNameValues, 'parameterNameValues');
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
    @_s.required String subnetGroupName,
    String description,
    List<String> subnetIds,
  }) async {
    ArgumentError.checkNotNull(subnetGroupName, 'subnetGroupName');
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
  @_s.JsonValue('IMMEDIATE')
  immediate,
  @_s.JsonValue('REQUIRES_REBOOT')
  requiresReboot,
}

/// Contains all of the attributes of a specific DAX cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cluster {
  /// The number of nodes in the cluster that are active (i.e., capable of serving
  /// requests).
  @_s.JsonKey(name: 'ActiveNodes')
  final int activeNodes;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// The configuration endpoint for this DAX cluster, consisting of a DNS name
  /// and a port number. Client applications can specify this endpoint, rather
  /// than an individual node endpoint, and allow the DAX client software to
  /// intelligently route requests and responses to nodes in the DAX cluster.
  @_s.JsonKey(name: 'ClusterDiscoveryEndpoint')
  final Endpoint clusterDiscoveryEndpoint;

  /// The name of the DAX cluster.
  @_s.JsonKey(name: 'ClusterName')
  final String clusterName;

  /// The description of the cluster.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime,
  /// DAX will assume this role and use the role's permissions to access DynamoDB
  /// on your behalf.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// A list of nodes to be removed from the cluster.
  @_s.JsonKey(name: 'NodeIdsToRemove')
  final List<String> nodeIdsToRemove;

  /// The node type for the nodes in the cluster. (All nodes in a DAX cluster are
  /// of the same type.)
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// A list of nodes that are currently in the cluster.
  @_s.JsonKey(name: 'Nodes')
  final List<Node> nodes;

  /// Describes a notification topic and its status. Notification topics are used
  /// for publishing DAX events to subscribers using Amazon Simple Notification
  /// Service (SNS).
  @_s.JsonKey(name: 'NotificationConfiguration')
  final NotificationConfiguration notificationConfiguration;

  /// The parameter group being used by nodes in the cluster.
  @_s.JsonKey(name: 'ParameterGroup')
  final ParameterGroupStatus parameterGroup;

  /// A range of time when maintenance of DAX cluster software will be performed.
  /// For example: <code>sun:01:00-sun:09:00</code>. Cluster maintenance normally
  /// takes less than 30 minutes, and is performed automatically within the
  /// maintenance window.
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// The description of the server-side encryption status on the specified DAX
  /// cluster.
  @_s.JsonKey(name: 'SSEDescription')
  final SSEDescription sSEDescription;

  /// A list of security groups, and the status of each, for the nodes in the
  /// cluster.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<SecurityGroupMembership> securityGroups;

  /// The current status of the cluster.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The subnet group where the DAX cluster is running.
  @_s.JsonKey(name: 'SubnetGroup')
  final String subnetGroup;

  /// The total number of nodes in the cluster.
  @_s.JsonKey(name: 'TotalNodes')
  final int totalNodes;

  Cluster({
    this.activeNodes,
    this.clusterArn,
    this.clusterDiscoveryEndpoint,
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
  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClusterResponse {
  /// A description of the DAX cluster that you have created.
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
class CreateParameterGroupResponse {
  /// Represents the output of a <i>CreateParameterGroup</i> action.
  @_s.JsonKey(name: 'ParameterGroup')
  final ParameterGroup parameterGroup;

  CreateParameterGroupResponse({
    this.parameterGroup,
  });
  factory CreateParameterGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateParameterGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSubnetGroupResponse {
  /// Represents the output of a <i>CreateSubnetGroup</i> operation.
  @_s.JsonKey(name: 'SubnetGroup')
  final SubnetGroup subnetGroup;

  CreateSubnetGroupResponse({
    this.subnetGroup,
  });
  factory CreateSubnetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSubnetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecreaseReplicationFactorResponse {
  /// A description of the DAX cluster, after you have decreased its replication
  /// factor.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  DecreaseReplicationFactorResponse({
    this.cluster,
  });
  factory DecreaseReplicationFactorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DecreaseReplicationFactorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteClusterResponse {
  /// A description of the DAX cluster that is being deleted.
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
class DeleteParameterGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// parameter group).
  @_s.JsonKey(name: 'DeletionMessage')
  final String deletionMessage;

  DeleteParameterGroupResponse({
    this.deletionMessage,
  });
  factory DeleteParameterGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteParameterGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSubnetGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// subnet group).
  @_s.JsonKey(name: 'DeletionMessage')
  final String deletionMessage;

  DeleteSubnetGroupResponse({
    this.deletionMessage,
  });
  factory DeleteSubnetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSubnetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClustersResponse {
  /// The descriptions of your DAX clusters, in response to a
  /// <i>DescribeClusters</i> request.
  @_s.JsonKey(name: 'Clusters')
  final List<Cluster> clusters;

  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });
  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeClustersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDefaultParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of parameters. Each element in the list represents one parameter.
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  DescribeDefaultParametersResponse({
    this.nextToken,
    this.parameters,
  });
  factory DescribeDefaultParametersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDefaultParametersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventsResponse {
  /// An array of events. Each element in the array represents one event.
  @_s.JsonKey(name: 'Events')
  final List<Event> events;

  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });
  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeParameterGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of parameter groups. Each element in the array represents one
  /// parameter group.
  @_s.JsonKey(name: 'ParameterGroups')
  final List<ParameterGroup> parameterGroups;

  DescribeParameterGroupsResponse({
    this.nextToken,
    this.parameterGroups,
  });
  factory DescribeParameterGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeParameterGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of parameters within a parameter group. Each element in the list
  /// represents one parameter.
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  DescribeParametersResponse({
    this.nextToken,
    this.parameters,
  });
  factory DescribeParametersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeParametersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSubnetGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of subnet groups. Each element in the array represents a single
  /// subnet group.
  @_s.JsonKey(name: 'SubnetGroups')
  final List<SubnetGroup> subnetGroups;

  DescribeSubnetGroupsResponse({
    this.nextToken,
    this.subnetGroups,
  });
  factory DescribeSubnetGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSubnetGroupsResponseFromJson(json);
}

/// Represents the information required for client programs to connect to the
/// configuration endpoint for a DAX cluster, or to an individual node within
/// the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// The DNS hostname of the endpoint.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The port number that applications should use to connect to the endpoint.
  @_s.JsonKey(name: 'Port')
  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a DAX cluster, adding or removing a
/// node, or rebooting a node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Event {
  /// The date and time when the event occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Date')
  final DateTime date;

  /// A user-defined message associated with the event.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The source of the event. For example, if the event occurred at the node
  /// level, the source would be the node ID.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// Specifies the origin of this event - a cluster, a parameter group, a node
  /// ID, etc.
  @_s.JsonKey(name: 'SourceType')
  final SourceType sourceType;

  Event({
    this.date,
    this.message,
    this.sourceName,
    this.sourceType,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IncreaseReplicationFactorResponse {
  /// A description of the DAX cluster. with its new replication factor.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  IncreaseReplicationFactorResponse({
    this.cluster,
  });
  factory IncreaseReplicationFactorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$IncreaseReplicationFactorResponseFromJson(json);
}

enum IsModifiable {
  @_s.JsonValue('TRUE')
  $true,
  @_s.JsonValue('FALSE')
  $false,
  @_s.JsonValue('CONDITIONAL')
  conditional,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// If this value is present, there are additional results to be displayed. To
  /// retrieve them, call <code>ListTags</code> again, with <code>NextToken</code>
  /// set to this value.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tags currently associated with the DAX cluster.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

/// Represents an individual node within a DAX cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Node {
  /// The Availability Zone (AZ) in which the node has been deployed.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The endpoint for the node, consisting of a DNS name and a port number.
  /// Client applications can connect directly to a node endpoint, if desired (as
  /// an alternative to allowing DAX client software to intelligently route
  /// requests and responses to nodes in the DAX cluster.
  @_s.JsonKey(name: 'Endpoint')
  final Endpoint endpoint;

  /// The date and time (in UNIX epoch format) when the node was launched.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'NodeCreateTime')
  final DateTime nodeCreateTime;

  /// A system-generated identifier for the node.
  @_s.JsonKey(name: 'NodeId')
  final String nodeId;

  /// The current status of the node. For example: <code>available</code>.
  @_s.JsonKey(name: 'NodeStatus')
  final String nodeStatus;

  /// The status of the parameter group associated with this node. For example,
  /// <code>in-sync</code>.
  @_s.JsonKey(name: 'ParameterGroupStatus')
  final String parameterGroupStatus;

  Node({
    this.availabilityZone,
    this.endpoint,
    this.nodeCreateTime,
    this.nodeId,
    this.nodeStatus,
    this.parameterGroupStatus,
  });
  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}

/// Represents a parameter value that is applicable to a particular node type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeTypeSpecificValue {
  /// A node type to which the parameter value applies.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The parameter value for this node type.
  @_s.JsonKey(name: 'Value')
  final String value;

  NodeTypeSpecificValue({
    this.nodeType,
    this.value,
  });
  factory NodeTypeSpecificValue.fromJson(Map<String, dynamic> json) =>
      _$NodeTypeSpecificValueFromJson(json);
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing DAX events to subscribers using Amazon Simple Notification
/// Service (SNS).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  /// The current state of the topic.
  @_s.JsonKey(name: 'TopicStatus')
  final String topicStatus;

  NotificationConfiguration({
    this.topicArn,
    this.topicStatus,
  });
  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NotificationConfigurationFromJson(json);
}

/// Describes an individual setting that controls some aspect of DAX behavior.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Parameter {
  /// A range of values within which the parameter can be set.
  @_s.JsonKey(name: 'AllowedValues')
  final String allowedValues;

  /// The conditions under which changes to this parameter can be applied. For
  /// example, <code>requires-reboot</code> indicates that a new value for this
  /// parameter will only take effect if a node is rebooted.
  @_s.JsonKey(name: 'ChangeType')
  final ChangeType changeType;

  /// The data type of the parameter. For example, <code>integer</code>:
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// A description of the parameter
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Whether the customer is allowed to modify the parameter.
  @_s.JsonKey(name: 'IsModifiable')
  final IsModifiable isModifiable;

  /// A list of node types, and specific parameter values for each node.
  @_s.JsonKey(name: 'NodeTypeSpecificValues')
  final List<NodeTypeSpecificValue> nodeTypeSpecificValues;

  /// The name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  /// Determines whether the parameter can be applied to any nodes, or only nodes
  /// of a particular type.
  @_s.JsonKey(name: 'ParameterType')
  final ParameterType parameterType;

  /// The value for the parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  /// How the parameter is defined. For example, <code>system</code> denotes a
  /// system-defined parameter.
  @_s.JsonKey(name: 'Source')
  final String source;

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
  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);
}

/// A named set of parameters that are applied to all of the nodes in a DAX
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterGroup {
  /// A description of the parameter group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the parameter group.
  @_s.JsonKey(name: 'ParameterGroupName')
  final String parameterGroupName;

  ParameterGroup({
    this.description,
    this.parameterGroupName,
  });
  factory ParameterGroup.fromJson(Map<String, dynamic> json) =>
      _$ParameterGroupFromJson(json);
}

/// The status of a parameter group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParameterGroupStatus {
  /// The node IDs of one or more nodes to be rebooted.
  @_s.JsonKey(name: 'NodeIdsToReboot')
  final List<String> nodeIdsToReboot;

  /// The status of parameter updates.
  @_s.JsonKey(name: 'ParameterApplyStatus')
  final String parameterApplyStatus;

  /// The name of the parameter group.
  @_s.JsonKey(name: 'ParameterGroupName')
  final String parameterGroupName;

  ParameterGroupStatus({
    this.nodeIdsToReboot,
    this.parameterApplyStatus,
    this.parameterGroupName,
  });
  factory ParameterGroupStatus.fromJson(Map<String, dynamic> json) =>
      _$ParameterGroupStatusFromJson(json);
}

/// An individual DAX parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParameterNameValue {
  /// The name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  /// The value of the parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });
  Map<String, dynamic> toJson() => _$ParameterNameValueToJson(this);
}

enum ParameterType {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('NODE_TYPE_SPECIFIC')
  nodeTypeSpecific,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootNodeResponse {
  /// A description of the DAX cluster after a node has been rebooted.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  RebootNodeResponse({
    this.cluster,
  });
  factory RebootNodeResponse.fromJson(Map<String, dynamic> json) =>
      _$RebootNodeResponseFromJson(json);
}

/// The description of the server-side encryption status on the specified DAX
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'Status')
  final SSEStatus status;

  SSEDescription({
    this.status,
  });
  factory SSEDescription.fromJson(Map<String, dynamic> json) =>
      _$SSEDescriptionFromJson(json);
}

/// Represents the settings used to enable server-side encryption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SSESpecification {
  /// Indicates whether server-side encryption is enabled (true) or disabled
  /// (false) on the cluster.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  SSESpecification({
    @_s.required this.enabled,
  });
  Map<String, dynamic> toJson() => _$SSESpecificationToJson(this);
}

enum SSEStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// An individual VPC security group and its status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityGroupMembership {
  /// The unique ID for this security group.
  @_s.JsonKey(name: 'SecurityGroupIdentifier')
  final String securityGroupIdentifier;

  /// The status of this security group.
  @_s.JsonKey(name: 'Status')
  final String status;

  SecurityGroupMembership({
    this.securityGroupIdentifier,
    this.status,
  });
  factory SecurityGroupMembership.fromJson(Map<String, dynamic> json) =>
      _$SecurityGroupMembershipFromJson(json);
}

enum SourceType {
  @_s.JsonValue('CLUSTER')
  cluster,
  @_s.JsonValue('PARAMETER_GROUP')
  parameterGroup,
  @_s.JsonValue('SUBNET_GROUP')
  subnetGroup,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.cluster:
        return 'CLUSTER';
      case SourceType.parameterGroup:
        return 'PARAMETER_GROUP';
      case SourceType.subnetGroup:
        return 'SUBNET_GROUP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the subnet associated with a DAX cluster. This parameter refers
/// to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used
/// with DAX.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Subnet {
  /// The Availability Zone (AZ) for the subnet.
  @_s.JsonKey(name: 'SubnetAvailabilityZone')
  final String subnetAvailabilityZone;

  /// The system-assigned identifier for the subnet.
  @_s.JsonKey(name: 'SubnetIdentifier')
  final String subnetIdentifier;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
  });
  factory Subnet.fromJson(Map<String, dynamic> json) => _$SubnetFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubnetGroup {
  /// The description of the subnet group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the subnet group.
  @_s.JsonKey(name: 'SubnetGroupName')
  final String subnetGroupName;

  /// A list of subnets associated with the subnet group.
  @_s.JsonKey(name: 'Subnets')
  final List<Subnet> subnets;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  SubnetGroup({
    this.description,
    this.subnetGroupName,
    this.subnets,
    this.vpcId,
  });
  factory SubnetGroup.fromJson(Map<String, dynamic> json) =>
      _$SubnetGroupFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key for the tag. Tag keys are case sensitive. Every DAX cluster can only
  /// have one tag with the same key. If you try to add an existing tag (same
  /// key), the existing tag value will be updated to the new value.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
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
  /// The list of tags that are associated with the DAX resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  TagResourceResponse({
    this.tags,
  });
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  /// The tag keys that have been removed from the cluster.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  UntagResourceResponse({
    this.tags,
  });
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterResponse {
  /// A description of the DAX cluster, after it has been modified.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  UpdateClusterResponse({
    this.cluster,
  });
  factory UpdateClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateParameterGroupResponse {
  /// The parameter group that has been modified.
  @_s.JsonKey(name: 'ParameterGroup')
  final ParameterGroup parameterGroup;

  UpdateParameterGroupResponse({
    this.parameterGroup,
  });
  factory UpdateParameterGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateParameterGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSubnetGroupResponse {
  /// The subnet group that has been modified.
  @_s.JsonKey(name: 'SubnetGroup')
  final SubnetGroup subnetGroup;

  UpdateSubnetGroupResponse({
    this.subnetGroup,
  });
  factory UpdateSubnetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubnetGroupResponseFromJson(json);
}

class ClusterAlreadyExistsFault extends _s.GenericAwsException {
  ClusterAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'ClusterAlreadyExistsFault', message: message);
}

class ClusterNotFoundFault extends _s.GenericAwsException {
  ClusterNotFoundFault({String type, String message})
      : super(type: type, code: 'ClusterNotFoundFault', message: message);
}

class ClusterQuotaForCustomerExceededFault extends _s.GenericAwsException {
  ClusterQuotaForCustomerExceededFault({String type, String message})
      : super(
            type: type,
            code: 'ClusterQuotaForCustomerExceededFault',
            message: message);
}

class InsufficientClusterCapacityFault extends _s.GenericAwsException {
  InsufficientClusterCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientClusterCapacityFault',
            message: message);
}

class InvalidARNFault extends _s.GenericAwsException {
  InvalidARNFault({String type, String message})
      : super(type: type, code: 'InvalidARNFault', message: message);
}

class InvalidClusterStateFault extends _s.GenericAwsException {
  InvalidClusterStateFault({String type, String message})
      : super(type: type, code: 'InvalidClusterStateFault', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterGroupStateFault extends _s.GenericAwsException {
  InvalidParameterGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterGroupStateFault',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String type, String message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class NodeNotFoundFault extends _s.GenericAwsException {
  NodeNotFoundFault({String type, String message})
      : super(type: type, code: 'NodeNotFoundFault', message: message);
}

class NodeQuotaForClusterExceededFault extends _s.GenericAwsException {
  NodeQuotaForClusterExceededFault({String type, String message})
      : super(
            type: type,
            code: 'NodeQuotaForClusterExceededFault',
            message: message);
}

class NodeQuotaForCustomerExceededFault extends _s.GenericAwsException {
  NodeQuotaForCustomerExceededFault({String type, String message})
      : super(
            type: type,
            code: 'NodeQuotaForCustomerExceededFault',
            message: message);
}

class ParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  ParameterGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'ParameterGroupAlreadyExistsFault',
            message: message);
}

class ParameterGroupNotFoundFault extends _s.GenericAwsException {
  ParameterGroupNotFoundFault({String type, String message})
      : super(
            type: type, code: 'ParameterGroupNotFoundFault', message: message);
}

class ParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  ParameterGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'ParameterGroupQuotaExceededFault',
            message: message);
}

class ServiceLinkedRoleNotFoundFault extends _s.GenericAwsException {
  ServiceLinkedRoleNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ServiceLinkedRoleNotFoundFault',
            message: message);
}

class SubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  SubnetGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'SubnetGroupAlreadyExistsFault',
            message: message);
}

class SubnetGroupInUseFault extends _s.GenericAwsException {
  SubnetGroupInUseFault({String type, String message})
      : super(type: type, code: 'SubnetGroupInUseFault', message: message);
}

class SubnetGroupNotFoundFault extends _s.GenericAwsException {
  SubnetGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'SubnetGroupNotFoundFault', message: message);
}

class SubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  SubnetGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'SubnetGroupQuotaExceededFault',
            message: message);
}

class SubnetInUse extends _s.GenericAwsException {
  SubnetInUse({String type, String message})
      : super(type: type, code: 'SubnetInUse', message: message);
}

class SubnetQuotaExceededFault extends _s.GenericAwsException {
  SubnetQuotaExceededFault({String type, String message})
      : super(type: type, code: 'SubnetQuotaExceededFault', message: message);
}

class TagNotFoundFault extends _s.GenericAwsException {
  TagNotFoundFault({String type, String message})
      : super(type: type, code: 'TagNotFoundFault', message: message);
}

class TagQuotaPerResourceExceeded extends _s.GenericAwsException {
  TagQuotaPerResourceExceeded({String type, String message})
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
