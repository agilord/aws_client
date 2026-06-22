// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_05_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is an interface reference for Amazon Aurora DSQL. It contains
/// documentation for one of the programming or command line interfaces you can
/// use to manage Amazon Aurora DSQL.
///
/// Amazon Aurora DSQL is a serverless, distributed SQL database suitable for
/// workloads of any size. is available in both single-Region and multi-Region
/// configurations, so your clusters and databases are always available even if
/// an Availability Zone or an Amazon Web Services Region are unavailable. lets
/// you focus on using your data to acquire new insights for your business and
/// customers.
class Dsql {
  final _s.RestJsonProtocol _protocol;
  factory Dsql({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'dsql',
    );
    return Dsql._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Dsql._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Lists all of the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to list the tags.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Tags a resource with a map of key and value pairs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// A map of key and value pairs to use to tag your resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource from which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The array of keys of the tags that you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The CreateCluster API allows you to create both single-Region clusters and
  /// multi-Region clusters. With the addition of the
  /// <i>multiRegionProperties</i> parameter, you can create a cluster with
  /// witness Region support and establish peer relationships with clusters in
  /// other Regions during creation.
  /// <note>
  /// Creating multi-Region clusters requires additional IAM permissions beyond
  /// those needed for single-Region clusters, as detailed in the <b>Required
  /// permissions</b> section below.
  /// </note>
  /// <b>Required permissions</b>
  /// <dl> <dt>dsql:CreateCluster</dt> <dd>
  /// Required to create a cluster.
  ///
  /// Resources: <code>arn:aws:dsql:region:account-id:cluster/*</code>
  /// </dd> <dt>dsql:TagResource</dt> <dd>
  /// Permission to add tags to a resource.
  ///
  /// Resources: <code>arn:aws:dsql:region:account-id:cluster/*</code>
  /// </dd> <dt>dsql:PutMultiRegionProperties</dt> <dd>
  /// Permission to configure multi-Region properties for a cluster.
  ///
  /// Resources: <code>arn:aws:dsql:region:account-id:cluster/*</code>
  /// </dd> <dt>dsql:AddPeerCluster</dt> <dd>
  /// When specifying <code>multiRegionProperties.clusters</code>, permission to
  /// add peer clusters.
  ///
  /// Resources:
  ///
  /// <ul>
  /// <li>
  /// Local cluster: <code>arn:aws:dsql:region:account-id:cluster/*</code>
  /// </li>
  /// <li>
  /// Each peer cluster: exact ARN of each specified peer cluster
  /// </li>
  /// </ul> </dd> <dt>dsql:PutWitnessRegion</dt> <dd>
  /// When specifying <code>multiRegionProperties.witnessRegion</code>,
  /// permission to set a witness Region. This permission is checked both in the
  /// cluster Region and in the witness Region.
  ///
  /// Resources: <code>arn:aws:dsql:region:account-id:cluster/*</code>
  ///
  /// Condition Keys: <code>dsql:WitnessRegion</code> (matching the specified
  /// witness region)
  /// </dd> </dl> <important>
  /// <ul>
  /// <li>
  /// The witness Region specified in
  /// <code>multiRegionProperties.witnessRegion</code> cannot be the same as the
  /// cluster's Region.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// An optional field that controls whether to bypass the lockout prevention
  /// check. When set to true, this parameter allows you to apply a policy that
  /// might lock you out of the cluster. Use with caution.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you don't specify a client token, the Amazon Web Services SDK
  /// automatically generates one.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// If enabled, you can't delete your cluster. You must first disable this
  /// property before you can delete your cluster.
  ///
  /// Parameter [kmsEncryptionKey] :
  /// The KMS key that encrypts and protects the data on your cluster. You can
  /// specify the ARN, ID, or alias of an existing key or have Amazon Web
  /// Services create a default key for you.
  ///
  /// Parameter [multiRegionProperties] :
  /// The configuration settings when creating a multi-Region cluster, including
  /// the witness region and linked cluster properties.
  ///
  /// Parameter [policy] :
  /// An optional resource-based policy document in JSON format that defines
  /// access permissions for the cluster.
  ///
  /// Parameter [tags] :
  /// A map of key and value pairs to use to tag your cluster.
  Future<CreateClusterOutput> createCluster({
    bool? bypassPolicyLockoutSafetyCheck,
    String? clientToken,
    bool? deletionProtectionEnabled,
    String? kmsEncryptionKey,
    MultiRegionProperties? multiRegionProperties,
    String? policy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (bypassPolicyLockoutSafetyCheck != null)
        'bypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deletionProtectionEnabled != null)
        'deletionProtectionEnabled': deletionProtectionEnabled,
      if (kmsEncryptionKey != null) 'kmsEncryptionKey': kmsEncryptionKey,
      if (multiRegionProperties != null)
        'multiRegionProperties': multiRegionProperties,
      if (policy != null) 'policy': policy,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterOutput.fromJson(response);
  }

  /// Retrieves information about a cluster.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ID of the cluster to retrieve.
  Future<GetClusterOutput> getCluster({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterOutput.fromJson(response);
  }

  /// The <i>UpdateCluster</i> API allows you to modify both single-Region and
  /// multi-Region cluster configurations. With the <i>multiRegionProperties</i>
  /// parameter, you can add or modify witness Region support and manage peer
  /// relationships with clusters in other Regions.
  /// <note>
  /// Note that updating multi-Region clusters requires additional IAM
  /// permissions beyond those needed for standard cluster updates, as detailed
  /// in the Permissions section.
  /// </note>
  /// <b>Required permissions</b>
  /// <dl> <dt>dsql:UpdateCluster</dt> <dd>
  /// Permission to update a DSQL cluster.
  ///
  /// Resources:
  /// <code>arn:aws:dsql:<i>region</i>:<i>account-id</i>:cluster/<i>cluster-id</i>
  /// </code>
  /// </dd> </dl> <dl> <dt>dsql:PutMultiRegionProperties</dt> <dd>
  /// Permission to configure multi-Region properties for a cluster.
  ///
  /// Resources:
  /// <code>arn:aws:dsql:<i>region</i>:<i>account-id</i>:cluster/<i>cluster-id</i>
  /// </code>
  /// </dd> </dl> <dl> <dt>dsql:GetCluster</dt> <dd>
  /// Permission to retrieve cluster information.
  ///
  /// Resources:
  /// <code>arn:aws:dsql:<i>region</i>:<i>account-id</i>:cluster/<i>cluster-id</i>
  /// </code>
  /// </dd> <dt>dsql:AddPeerCluster</dt> <dd>
  /// Permission to add peer clusters.
  ///
  /// Resources:
  ///
  /// <ul>
  /// <li>
  /// Local cluster:
  /// <code>arn:aws:dsql:<i>region</i>:<i>account-id</i>:cluster/<i>cluster-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// Each peer cluster: exact ARN of each specified peer cluster
  /// </li>
  /// </ul> </dd> <dt>dsql:RemovePeerCluster</dt> <dd>
  /// Permission to remove peer clusters. The <i>dsql:RemovePeerCluster</i>
  /// permission uses a wildcard ARN pattern to simplify permission management
  /// during updates.
  ///
  /// Resources: <code>arn:aws:dsql:*:<i>account-id</i>:cluster/*</code>
  /// </dd> </dl> <dl> <dt>dsql:PutWitnessRegion</dt> <dd>
  /// Permission to set a witness Region.
  ///
  /// Resources:
  /// <code>arn:aws:dsql:<i>region</i>:<i>account-id</i>:cluster/<i>cluster-id</i>
  /// </code>
  ///
  /// Condition Keys: dsql:WitnessRegion (matching the specified witness Region)
  ///
  /// <b>This permission is checked both in the cluster Region and in the
  /// witness Region.</b>
  /// </dd> </dl> <important>
  /// <ul>
  /// <li>
  /// The witness region specified in
  /// <code>multiRegionProperties.witnessRegion</code> cannot be the same as the
  /// cluster's Region.
  /// </li>
  /// <li>
  /// When updating clusters with peer relationships, permissions are checked
  /// for both adding and removing peers.
  /// </li>
  /// <li>
  /// The <code>dsql:RemovePeerCluster</code> permission uses a wildcard ARN
  /// pattern to simplify permission management during updates.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The ID of the cluster you want to update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully. The subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you don't specify a client token, the Amazon Web Services SDK
  /// automatically generates one.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// Specifies whether to enable deletion protection in your cluster.
  ///
  /// Parameter [kmsEncryptionKey] :
  /// The KMS key that encrypts and protects the data on your cluster. You can
  /// specify the ARN, ID, or alias of an existing key or have Amazon Web
  /// Services create a default key for you.
  ///
  /// Parameter [multiRegionProperties] :
  /// The new multi-Region cluster configuration settings to be applied during
  /// an update operation.
  Future<UpdateClusterOutput> updateCluster({
    required String identifier,
    String? clientToken,
    bool? deletionProtectionEnabled,
    String? kmsEncryptionKey,
    MultiRegionProperties? multiRegionProperties,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deletionProtectionEnabled != null)
        'deletionProtectionEnabled': deletionProtectionEnabled,
      if (kmsEncryptionKey != null) 'kmsEncryptionKey': kmsEncryptionKey,
      if (multiRegionProperties != null)
        'multiRegionProperties': multiRegionProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterOutput.fromJson(response);
  }

  /// Deletes a cluster in Amazon Aurora DSQL.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ID of the cluster to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully. The subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you don't specify a client token, the Amazon Web Services SDK
  /// automatically generates one.
  Future<DeleteClusterOutput> deleteCluster({
    required String identifier,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'client-token': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterOutput.fromJson(response);
  }

  /// Retrieves information about a list of clusters.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use nextToken to display the next page of results.
  ///
  /// Parameter [nextToken] :
  /// If your initial ListClusters operation returns a nextToken, you can
  /// include the returned nextToken in following ListClusters operations, which
  /// returns results in the next page.
  Future<ListClustersOutput> listClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersOutput.fromJson(response);
  }

  /// Deletes the resource-based policy attached to a cluster. This removes all
  /// access permissions defined by the policy, reverting to default access
  /// controls.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expectedPolicyVersion] :
  /// The expected version of the policy to delete. This parameter ensures that
  /// you're deleting the correct version of the policy and helps prevent
  /// accidental deletions.
  Future<DeleteClusterPolicyOutput> deleteClusterPolicy({
    required String identifier,
    String? clientToken,
    String? expectedPolicyVersion,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'client-token': [clientToken],
      if (expectedPolicyVersion != null)
        'expected-policy-version': [expectedPolicyVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterPolicyOutput.fromJson(response);
  }

  /// Retrieves the resource-based policy document attached to a cluster. This
  /// policy defines the access permissions and conditions for the cluster.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The ID of the cluster to retrieve the policy from.
  Future<GetClusterPolicyOutput> getClusterPolicy({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterPolicyOutput.fromJson(response);
  }

  /// Retrieves the VPC endpoint service name.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The ID of the cluster to retrieve.
  Future<GetVpcEndpointServiceNameOutput> getVpcEndpointServiceName({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(identifier)}/vpc-endpoint-service-name',
      exceptionFnMap: _exceptionFns,
    );
    return GetVpcEndpointServiceNameOutput.fromJson(response);
  }

  /// Attaches a resource-based policy to a cluster. This policy defines access
  /// permissions and conditions for the cluster, allowing you to control which
  /// principals can perform actions on the cluster.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// The resource-based policy document to attach to the cluster. This should
  /// be a valid JSON policy document that defines permissions and conditions.
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// A flag that allows you to bypass the policy lockout safety check. When set
  /// to true, this parameter allows you to apply a policy that might lock you
  /// out of the cluster. Use with caution.
  ///
  /// Parameter [expectedPolicyVersion] :
  /// The expected version of the current policy. This parameter ensures that
  /// you're updating the correct version of the policy and helps prevent
  /// concurrent modification conflicts.
  Future<PutClusterPolicyOutput> putClusterPolicy({
    required String identifier,
    required String policy,
    bool? bypassPolicyLockoutSafetyCheck,
    String? clientToken,
    String? expectedPolicyVersion,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      if (bypassPolicyLockoutSafetyCheck != null)
        'bypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (expectedPolicyVersion != null)
        'expectedPolicyVersion': expectedPolicyVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster/${Uri.encodeComponent(identifier)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutClusterPolicyOutput.fromJson(response);
  }

  /// Creates a new change data capture (CDC) stream for a cluster. The stream
  /// captures database changes and delivers them to the specified target
  /// destination.
  ///
  /// <b>Required permissions</b>
  /// <dl> <dt>dsql:CreateStream</dt> <dd>
  /// Permission to create a new stream.
  ///
  /// Resources: <code>arn:aws:dsql:region:account-id:cluster/cluster-id</code>
  /// </dd> <dt>iam:PassRole</dt> <dd>
  /// Permission to pass the IAM role specified in the target definition to the
  /// service.
  ///
  /// Resources: ARN of the IAM role specified in
  /// <code>targetDefinition.kinesis.roleArn</code>
  /// </dd> <dt>kms:Decrypt</dt> <dd>
  /// Required when the cluster uses a customer managed KMS key (CMK).
  /// Permission to decrypt data using the cluster's CMK.
  ///
  /// Resources: ARN of the KMS key used by the cluster
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The ID of the cluster for which to create the stream.
  ///
  /// Parameter [format] :
  /// The format of the stream records.
  ///
  /// Parameter [ordering] :
  /// The ordering mode for the stream. Determines how change events are ordered
  /// when delivered to the target.
  ///
  /// Parameter [targetDefinition] :
  /// The target destination configuration for the stream. Contains Kinesis
  /// stream configuration including stream ARN and IAM role ARN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you don't specify a client token, the Amazon Web Services SDK
  /// automatically generates one.
  ///
  /// Parameter [tags] :
  /// A map of key and value pairs to use to tag your stream.
  Future<CreateStreamOutput> createStream({
    required String clusterIdentifier,
    required StreamFormat format,
    required StreamOrdering ordering,
    required TargetDefinition targetDefinition,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.value,
      'ordering': ordering.value,
      'targetDefinition': targetDefinition,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stream/${Uri.encodeComponent(clusterIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamOutput.fromJson(response);
  }

  /// Retrieves information about a stream.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The ID of the cluster containing the stream to retrieve.
  ///
  /// Parameter [streamIdentifier] :
  /// The ID of the stream to retrieve.
  Future<GetStreamOutput> getStream({
    required String clusterIdentifier,
    required String streamIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/stream/${Uri.encodeComponent(clusterIdentifier)}/${Uri.encodeComponent(streamIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamOutput.fromJson(response);
  }

  /// Deletes a stream from a cluster.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The ID of the cluster containing the stream to delete.
  ///
  /// Parameter [streamIdentifier] :
  /// The ID of the stream to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you don't specify a client token, the Amazon Web Services SDK
  /// automatically generates one.
  Future<DeleteStreamOutput> deleteStream({
    required String clusterIdentifier,
    required String streamIdentifier,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'client-token': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/stream/${Uri.encodeComponent(clusterIdentifier)}/${Uri.encodeComponent(streamIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStreamOutput.fromJson(response);
  }

  /// Retrieves information about a list of streams for a cluster.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The ID of the cluster for which to list streams.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use nextToken to display the next page of results.
  /// Default: 10.
  ///
  /// Parameter [nextToken] :
  /// If your initial ListStreams operation returns a nextToken, you can include
  /// the returned nextToken in following ListStreams operations, which returns
  /// results in the next page.
  Future<ListStreamsOutput> listStreams({
    required String clusterIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/stream/${Uri.encodeComponent(clusterIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamsOutput.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// A map of key and value pairs that you used to tag your resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// The output of a created cluster.
///
/// @nodoc
class CreateClusterOutput {
  /// The ARN of the created cluster.
  final String arn;

  /// The time of when created the cluster.
  final DateTime creationTime;

  /// Whether deletion protection is enabled on this cluster.
  final bool deletionProtectionEnabled;

  /// The ID of the created cluster.
  final String identifier;

  /// The status of the created cluster.
  final ClusterStatus status;

  /// The encryption configuration for the cluster that was specified during the
  /// creation process, including the KMS key identifier and encryption state.
  final EncryptionDetails? encryptionDetails;

  /// The connection endpoint for the created cluster.
  final String? endpoint;

  /// The multi-Region cluster configuration details that were set during cluster
  /// creation
  final MultiRegionProperties? multiRegionProperties;

  CreateClusterOutput({
    required this.arn,
    required this.creationTime,
    required this.deletionProtectionEnabled,
    required this.identifier,
    required this.status,
    this.encryptionDetails,
    this.endpoint,
    this.multiRegionProperties,
  });

  factory CreateClusterOutput.fromJson(Map<String, dynamic> json) {
    return CreateClusterOutput(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      deletionProtectionEnabled:
          (json['deletionProtectionEnabled'] as bool?) ?? false,
      identifier: (json['identifier'] as String?) ?? '',
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
      encryptionDetails: json['encryptionDetails'] != null
          ? EncryptionDetails.fromJson(
              json['encryptionDetails'] as Map<String, dynamic>)
          : null,
      endpoint: json['endpoint'] as String?,
      multiRegionProperties: json['multiRegionProperties'] != null
          ? MultiRegionProperties.fromJson(
              json['multiRegionProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final identifier = this.identifier;
    final status = this.status;
    final encryptionDetails = this.encryptionDetails;
    final endpoint = this.endpoint;
    final multiRegionProperties = this.multiRegionProperties;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'deletionProtectionEnabled': deletionProtectionEnabled,
      'identifier': identifier,
      'status': status.value,
      if (encryptionDetails != null) 'encryptionDetails': encryptionDetails,
      if (endpoint != null) 'endpoint': endpoint,
      if (multiRegionProperties != null)
        'multiRegionProperties': multiRegionProperties,
    };
  }
}

/// The output of a cluster.
///
/// @nodoc
class GetClusterOutput {
  /// The ARN of the retrieved cluster.
  final String arn;

  /// The time of when the cluster was created.
  final DateTime creationTime;

  /// Whether deletion protection is enabled in this cluster.
  final bool deletionProtectionEnabled;

  /// The ID of the retrieved cluster.
  final String identifier;

  /// The status of the retrieved cluster.
  final ClusterStatus status;

  /// The current encryption configuration details for the cluster.
  final EncryptionDetails? encryptionDetails;

  /// The connection endpoint for the cluster.
  final String? endpoint;

  /// Returns the current multi-Region cluster configuration, including witness
  /// region and linked cluster information.
  final MultiRegionProperties? multiRegionProperties;
  final Map<String, String>? tags;

  GetClusterOutput({
    required this.arn,
    required this.creationTime,
    required this.deletionProtectionEnabled,
    required this.identifier,
    required this.status,
    this.encryptionDetails,
    this.endpoint,
    this.multiRegionProperties,
    this.tags,
  });

  factory GetClusterOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterOutput(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      deletionProtectionEnabled:
          (json['deletionProtectionEnabled'] as bool?) ?? false,
      identifier: (json['identifier'] as String?) ?? '',
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
      encryptionDetails: json['encryptionDetails'] != null
          ? EncryptionDetails.fromJson(
              json['encryptionDetails'] as Map<String, dynamic>)
          : null,
      endpoint: json['endpoint'] as String?,
      multiRegionProperties: json['multiRegionProperties'] != null
          ? MultiRegionProperties.fromJson(
              json['multiRegionProperties'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final identifier = this.identifier;
    final status = this.status;
    final encryptionDetails = this.encryptionDetails;
    final endpoint = this.endpoint;
    final multiRegionProperties = this.multiRegionProperties;
    final tags = this.tags;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'deletionProtectionEnabled': deletionProtectionEnabled,
      'identifier': identifier,
      'status': status.value,
      if (encryptionDetails != null) 'encryptionDetails': encryptionDetails,
      if (endpoint != null) 'endpoint': endpoint,
      if (multiRegionProperties != null)
        'multiRegionProperties': multiRegionProperties,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The details of the cluster after it has been updated.
///
/// @nodoc
class UpdateClusterOutput {
  /// The ARN of the updated cluster.
  final String arn;

  /// The time of when the cluster was created.
  final DateTime creationTime;

  /// The ID of the cluster to update.
  final String identifier;

  /// The status of the updated cluster.
  final ClusterStatus status;

  UpdateClusterOutput({
    required this.arn,
    required this.creationTime,
    required this.identifier,
    required this.status,
  });

  factory UpdateClusterOutput.fromJson(Map<String, dynamic> json) {
    return UpdateClusterOutput(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      identifier: (json['identifier'] as String?) ?? '',
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final identifier = this.identifier;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'identifier': identifier,
      'status': status.value,
    };
  }
}

/// The output from a deleted cluster.
///
/// @nodoc
class DeleteClusterOutput {
  /// The ARN of the deleted cluster.
  final String arn;

  /// The time of when the cluster was created.
  final DateTime creationTime;

  /// The ID of the deleted cluster.
  final String identifier;

  /// The status of the cluster.
  final ClusterStatus status;

  DeleteClusterOutput({
    required this.arn,
    required this.creationTime,
    required this.identifier,
    required this.status,
  });

  factory DeleteClusterOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterOutput(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      identifier: (json['identifier'] as String?) ?? '',
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final identifier = this.identifier;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'identifier': identifier,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListClustersOutput {
  /// An array of the returned clusters.
  final List<ClusterSummary> clusters;

  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. To retrieve the next
  /// page, make the call again using the returned token.
  final String? nextToken;

  ListClustersOutput({
    required this.clusters,
    this.nextToken,
  });

  factory ListClustersOutput.fromJson(Map<String, dynamic> json) {
    return ListClustersOutput(
      clusters: ((json['clusters'] as List?) ?? const [])
          .nonNulls
          .map((e) => ClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      'clusters': clusters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DeleteClusterPolicyOutput {
  /// The version of the policy that was deleted.
  final String policyVersion;

  DeleteClusterPolicyOutput({
    required this.policyVersion,
  });

  factory DeleteClusterPolicyOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterPolicyOutput(
      policyVersion: (json['policyVersion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyVersion = this.policyVersion;
    return {
      'policyVersion': policyVersion,
    };
  }
}

/// @nodoc
class GetClusterPolicyOutput {
  /// The resource-based policy document attached to the cluster, returned as a
  /// JSON string.
  final String policy;

  /// The version of the policy document. This version number is incremented each
  /// time the policy is updated.
  final String policyVersion;

  GetClusterPolicyOutput({
    required this.policy,
    required this.policyVersion,
  });

  factory GetClusterPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterPolicyOutput(
      policy: (json['policy'] as String?) ?? '',
      policyVersion: (json['policyVersion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final policyVersion = this.policyVersion;
    return {
      'policy': policy,
      'policyVersion': policyVersion,
    };
  }
}

/// @nodoc
class GetVpcEndpointServiceNameOutput {
  /// The VPC endpoint service name.
  final String serviceName;

  /// The VPC connection endpoint for the cluster.
  final String? clusterVpcEndpoint;

  GetVpcEndpointServiceNameOutput({
    required this.serviceName,
    this.clusterVpcEndpoint,
  });

  factory GetVpcEndpointServiceNameOutput.fromJson(Map<String, dynamic> json) {
    return GetVpcEndpointServiceNameOutput(
      serviceName: (json['serviceName'] as String?) ?? '',
      clusterVpcEndpoint: json['clusterVpcEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final clusterVpcEndpoint = this.clusterVpcEndpoint;
    return {
      'serviceName': serviceName,
      if (clusterVpcEndpoint != null) 'clusterVpcEndpoint': clusterVpcEndpoint,
    };
  }
}

/// @nodoc
class PutClusterPolicyOutput {
  /// The version of the policy after it has been updated or created.
  final String policyVersion;

  PutClusterPolicyOutput({
    required this.policyVersion,
  });

  factory PutClusterPolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutClusterPolicyOutput(
      policyVersion: (json['policyVersion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyVersion = this.policyVersion;
    return {
      'policyVersion': policyVersion,
    };
  }
}

/// The output of a created stream.
///
/// @nodoc
class CreateStreamOutput {
  /// The ARN of the created stream.
  final String arn;

  /// The ID of the cluster for the created stream.
  final String clusterIdentifier;

  /// The time when created the stream.
  final DateTime creationTime;

  /// The format of the created stream records.
  final StreamFormat format;

  /// The ordering mode of the created stream.
  final StreamOrdering ordering;

  /// The status of the created stream.
  final StreamStatus status;

  /// The ID of the created stream.
  final String streamIdentifier;

  CreateStreamOutput({
    required this.arn,
    required this.clusterIdentifier,
    required this.creationTime,
    required this.format,
    required this.ordering,
    required this.status,
    required this.streamIdentifier,
  });

  factory CreateStreamOutput.fromJson(Map<String, dynamic> json) {
    return CreateStreamOutput(
      arn: (json['arn'] as String?) ?? '',
      clusterIdentifier: (json['clusterIdentifier'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      format: StreamFormat.fromString((json['format'] as String?) ?? ''),
      ordering: StreamOrdering.fromString((json['ordering'] as String?) ?? ''),
      status: StreamStatus.fromString((json['status'] as String?) ?? ''),
      streamIdentifier: (json['streamIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterIdentifier = this.clusterIdentifier;
    final creationTime = this.creationTime;
    final format = this.format;
    final ordering = this.ordering;
    final status = this.status;
    final streamIdentifier = this.streamIdentifier;
    return {
      'arn': arn,
      'clusterIdentifier': clusterIdentifier,
      'creationTime': unixTimestampToJson(creationTime),
      'format': format.value,
      'ordering': ordering.value,
      'status': status.value,
      'streamIdentifier': streamIdentifier,
    };
  }
}

/// The output of a retrieved stream.
///
/// @nodoc
class GetStreamOutput {
  /// The ARN of the retrieved stream.
  final String arn;

  /// The ID of the cluster for the retrieved stream.
  final String clusterIdentifier;

  /// The time when the stream was created.
  final DateTime creationTime;

  /// The format of the stream records.
  final StreamFormat format;

  /// The ordering mode of the stream.
  final StreamOrdering ordering;

  /// The current status of the retrieved stream.
  final StreamStatus status;

  /// The ID of the retrieved stream.
  final String streamIdentifier;

  /// Stream status reason with error code and timestamp (if applicable).
  final StatusReason? statusReason;

  /// A map of tags associated with the stream.
  final Map<String, String>? tags;

  /// The target definition for the stream destination.
  final TargetDefinition? targetDefinition;

  GetStreamOutput({
    required this.arn,
    required this.clusterIdentifier,
    required this.creationTime,
    required this.format,
    required this.ordering,
    required this.status,
    required this.streamIdentifier,
    this.statusReason,
    this.tags,
    this.targetDefinition,
  });

  factory GetStreamOutput.fromJson(Map<String, dynamic> json) {
    return GetStreamOutput(
      arn: (json['arn'] as String?) ?? '',
      clusterIdentifier: (json['clusterIdentifier'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      format: StreamFormat.fromString((json['format'] as String?) ?? ''),
      ordering: StreamOrdering.fromString((json['ordering'] as String?) ?? ''),
      status: StreamStatus.fromString((json['status'] as String?) ?? ''),
      streamIdentifier: (json['streamIdentifier'] as String?) ?? '',
      statusReason: json['statusReason'] != null
          ? StatusReason.fromJson(json['statusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetDefinition: json['targetDefinition'] != null
          ? TargetDefinition.fromJson(
              json['targetDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterIdentifier = this.clusterIdentifier;
    final creationTime = this.creationTime;
    final format = this.format;
    final ordering = this.ordering;
    final status = this.status;
    final streamIdentifier = this.streamIdentifier;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final targetDefinition = this.targetDefinition;
    return {
      'arn': arn,
      'clusterIdentifier': clusterIdentifier,
      'creationTime': unixTimestampToJson(creationTime),
      'format': format.value,
      'ordering': ordering.value,
      'status': status.value,
      'streamIdentifier': streamIdentifier,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
      if (targetDefinition != null) 'targetDefinition': targetDefinition,
    };
  }
}

/// The output from a deleted stream.
///
/// @nodoc
class DeleteStreamOutput {
  /// The ARN of the deleted stream.
  final String arn;

  /// The ID of the cluster for the deleted stream.
  final String clusterIdentifier;

  /// The time when the stream was created.
  final DateTime creationTime;

  /// The status of the stream.
  final StreamStatus status;

  /// The ID of the deleted stream.
  final String streamIdentifier;

  DeleteStreamOutput({
    required this.arn,
    required this.clusterIdentifier,
    required this.creationTime,
    required this.status,
    required this.streamIdentifier,
  });

  factory DeleteStreamOutput.fromJson(Map<String, dynamic> json) {
    return DeleteStreamOutput(
      arn: (json['arn'] as String?) ?? '',
      clusterIdentifier: (json['clusterIdentifier'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      status: StreamStatus.fromString((json['status'] as String?) ?? ''),
      streamIdentifier: (json['streamIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterIdentifier = this.clusterIdentifier;
    final creationTime = this.creationTime;
    final status = this.status;
    final streamIdentifier = this.streamIdentifier;
    return {
      'arn': arn,
      'clusterIdentifier': clusterIdentifier,
      'creationTime': unixTimestampToJson(creationTime),
      'status': status.value,
      'streamIdentifier': streamIdentifier,
    };
  }
}

/// @nodoc
class ListStreamsOutput {
  /// An array of the returned streams.
  final List<StreamSummary> streams;

  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. To retrieve the next
  /// page, make the call again using the returned token.
  final String? nextToken;

  ListStreamsOutput({
    required this.streams,
    this.nextToken,
  });

  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamsOutput(
      streams: ((json['streams'] as List?) ?? const [])
          .nonNulls
          .map((e) => StreamSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streams = this.streams;
    final nextToken = this.nextToken;
    return {
      'streams': streams,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary information about a stream.
///
/// @nodoc
class StreamSummary {
  /// The ARN of the stream.
  final String arn;

  /// The ID of the cluster.
  final String clusterIdentifier;

  /// The timestamp when the stream was created.
  final DateTime creationTime;

  /// The current status of the stream.
  final StreamStatus status;

  /// The ID of the stream.
  final String streamIdentifier;

  StreamSummary({
    required this.arn,
    required this.clusterIdentifier,
    required this.creationTime,
    required this.status,
    required this.streamIdentifier,
  });

  factory StreamSummary.fromJson(Map<String, dynamic> json) {
    return StreamSummary(
      arn: (json['arn'] as String?) ?? '',
      clusterIdentifier: (json['clusterIdentifier'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      status: StreamStatus.fromString((json['status'] as String?) ?? ''),
      streamIdentifier: (json['streamIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterIdentifier = this.clusterIdentifier;
    final creationTime = this.creationTime;
    final status = this.status;
    final streamIdentifier = this.streamIdentifier;
    return {
      'arn': arn,
      'clusterIdentifier': clusterIdentifier,
      'creationTime': unixTimestampToJson(creationTime),
      'status': status.value,
      'streamIdentifier': streamIdentifier,
    };
  }
}

/// The current status of a stream.
/// <dl> <dt>CREATING</dt> <dd>
/// The stream is being created.
/// </dd> <dt>ACTIVE</dt> <dd>
/// The stream is active and processing changes.
/// </dd> <dt>DELETING</dt> <dd>
/// The stream is being deleted.
/// </dd> <dt>DELETED</dt> <dd>
/// The stream has been deleted.
/// </dd> <dt>FAILED</dt> <dd>
/// The stream has failed.
/// </dd> <dt>IMPAIRED</dt> <dd>
/// The stream is impaired and may not be processing changes correctly.
/// </dd> </dl>
///
/// @nodoc
class StreamStatus {
  static const creating = StreamStatus._('CREATING');
  static const active = StreamStatus._('ACTIVE');
  static const deleting = StreamStatus._('DELETING');
  static const deleted = StreamStatus._('DELETED');
  static const failed = StreamStatus._('FAILED');
  static const impaired = StreamStatus._('IMPAIRED');

  final String value;

  const StreamStatus._(this.value);

  static const values = [creating, active, deleting, deleted, failed, impaired];

  static StreamStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamStatus._(value));

  @override
  bool operator ==(other) => other is StreamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Stream ordering mode.
/// <dl> <dt>UNORDERED</dt> <dd>
/// Changes are streamed without ordering guarantees.
/// </dd> </dl>
///
/// @nodoc
class StreamOrdering {
  static const unordered = StreamOrdering._('UNORDERED');

  final String value;

  const StreamOrdering._(this.value);

  static const values = [unordered];

  static StreamOrdering fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamOrdering._(value));

  @override
  bool operator ==(other) => other is StreamOrdering && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Stream record format.
/// <dl> <dt>JSON</dt> <dd>
/// Stream records are formatted as JSON.
/// </dd> </dl>
///
/// @nodoc
class StreamFormat {
  static const json = StreamFormat._('JSON');

  final String value;

  const StreamFormat._(this.value);

  static const values = [json];

  static StreamFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamFormat._(value));

  @override
  bool operator ==(other) => other is StreamFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Target definition for stream destination.
///
/// @nodoc
class TargetDefinition {
  /// Kinesis stream target configuration.
  final KinesisTargetDefinition? kinesis;

  TargetDefinition({
    this.kinesis,
  });

  factory TargetDefinition.fromJson(Map<String, dynamic> json) {
    return TargetDefinition(
      kinesis: json['kinesis'] != null
          ? KinesisTargetDefinition.fromJson(
              json['kinesis'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesis = this.kinesis;
    return {
      if (kinesis != null) 'kinesis': kinesis,
    };
  }
}

/// Stream status reason with error and timestamp.
///
/// @nodoc
class StatusReason {
  /// The error code for the stream failure.
  final StreamFailureErrorCode error;

  /// The timestamp when the status was updated.
  final DateTime updatedAt;

  StatusReason({
    required this.error,
    required this.updatedAt,
  });

  factory StatusReason.fromJson(Map<String, dynamic> json) {
    return StatusReason(
      error:
          StreamFailureErrorCode.fromString((json['error'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final updatedAt = this.updatedAt;
    return {
      'error': error.value,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Error codes for stream failures.
/// <dl> <dt>KINESIS_THROUGHPUT_EXCEEDED</dt> <dd>
/// The Kinesis stream throughput limit was exceeded.
/// </dd> <dt>KINESIS_STREAM_NOT_FOUND</dt> <dd>
/// The specified Kinesis stream was not found.
/// </dd> <dt>ROLE_ACCESS_DENIED</dt> <dd>
/// Access was denied for the specified IAM role.
/// </dd> <dt>KINESIS_ACCESS_DENIED</dt> <dd>
/// Access to the Kinesis stream was denied.
/// </dd> <dt>KINESIS_KMS_ACCESS_DENIED</dt> <dd>
/// Access to the KMS key for the Kinesis stream was denied.
/// </dd> <dt>KINESIS_OVERSIZE_RECORD</dt> <dd>
/// A record exceeded the Kinesis stream size limit.
/// </dd> <dt>CLUSTER_CMK_INACCESSIBLE</dt> <dd>
/// The cluster's customer-managed key is inaccessible.
/// </dd> <dt>INTERNAL_ERROR</dt> <dd>
/// An internal error occurred.
/// </dd> </dl>
///
/// @nodoc
class StreamFailureErrorCode {
  static const kinesisThroughputExceeded =
      StreamFailureErrorCode._('KINESIS_THROUGHPUT_EXCEEDED');
  static const kinesisStreamNotFound =
      StreamFailureErrorCode._('KINESIS_STREAM_NOT_FOUND');
  static const roleAccessDenied =
      StreamFailureErrorCode._('ROLE_ACCESS_DENIED');
  static const kinesisAccessDenied =
      StreamFailureErrorCode._('KINESIS_ACCESS_DENIED');
  static const kinesisKmsAccessDenied =
      StreamFailureErrorCode._('KINESIS_KMS_ACCESS_DENIED');
  static const kinesisOversizeRecord =
      StreamFailureErrorCode._('KINESIS_OVERSIZE_RECORD');
  static const clusterCmkInaccessible =
      StreamFailureErrorCode._('CLUSTER_CMK_INACCESSIBLE');
  static const internalError = StreamFailureErrorCode._('INTERNAL_ERROR');

  final String value;

  const StreamFailureErrorCode._(this.value);

  static const values = [
    kinesisThroughputExceeded,
    kinesisStreamNotFound,
    roleAccessDenied,
    kinesisAccessDenied,
    kinesisKmsAccessDenied,
    kinesisOversizeRecord,
    clusterCmkInaccessible,
    internalError
  ];

  static StreamFailureErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamFailureErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is StreamFailureErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Kinesis stream target configuration.
///
/// @nodoc
class KinesisTargetDefinition {
  /// The ARN of the IAM role that grants permission to write to the Kinesis
  /// stream. This can be a standard role
  /// (<code>arn:aws:iam::account-id:role/role-name</code>) or a role with a path
  /// prefix (<code>arn:aws:iam::account-id:role/service-role/role-name</code>),
  /// such as roles auto-created by the console.
  final String roleArn;

  /// The ARN of the Kinesis stream.
  final String streamArn;

  KinesisTargetDefinition({
    required this.roleArn,
    required this.streamArn,
  });

  factory KinesisTargetDefinition.fromJson(Map<String, dynamic> json) {
    return KinesisTargetDefinition(
      roleArn: (json['roleArn'] as String?) ?? '',
      streamArn: (json['streamArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final streamArn = this.streamArn;
    return {
      'roleArn': roleArn,
      'streamArn': streamArn,
    };
  }
}

/// A summary of the properties of a cluster.
///
/// @nodoc
class ClusterSummary {
  /// The ARN of the cluster.
  final String arn;

  /// The ID of the cluster.
  final String identifier;

  ClusterSummary({
    required this.arn,
    required this.identifier,
  });

  factory ClusterSummary.fromJson(Map<String, dynamic> json) {
    return ClusterSummary(
      arn: (json['arn'] as String?) ?? '',
      identifier: (json['identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final identifier = this.identifier;
    return {
      'arn': arn,
      'identifier': identifier,
    };
  }
}

/// The current status of a cluster.
///
/// @nodoc
class ClusterStatus {
  static const creating = ClusterStatus._('CREATING');
  static const active = ClusterStatus._('ACTIVE');
  static const idle = ClusterStatus._('IDLE');
  static const inactive = ClusterStatus._('INACTIVE');
  static const updating = ClusterStatus._('UPDATING');
  static const deleting = ClusterStatus._('DELETING');
  static const deleted = ClusterStatus._('DELETED');
  static const failed = ClusterStatus._('FAILED');
  static const pendingSetup = ClusterStatus._('PENDING_SETUP');
  static const pendingDelete = ClusterStatus._('PENDING_DELETE');

  final String value;

  const ClusterStatus._(this.value);

  static const values = [
    creating,
    active,
    idle,
    inactive,
    updating,
    deleting,
    deleted,
    failed,
    pendingSetup,
    pendingDelete
  ];

  static ClusterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterStatus._(value));

  @override
  bool operator ==(other) => other is ClusterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the structure for multi-Region cluster configurations, containing
/// the witness region and linked cluster settings.
///
/// @nodoc
class MultiRegionProperties {
  /// The set of peered clusters that form the multi-Region cluster configuration.
  /// Each peered cluster represents a database instance in a different Region.
  final List<String>? clusters;

  /// The Region that serves as the witness region for a multi-Region cluster. The
  /// witness Region helps maintain cluster consistency and quorum.
  final String? witnessRegion;

  MultiRegionProperties({
    this.clusters,
    this.witnessRegion,
  });

  factory MultiRegionProperties.fromJson(Map<String, dynamic> json) {
    return MultiRegionProperties(
      clusters: (json['clusters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      witnessRegion: json['witnessRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final witnessRegion = this.witnessRegion;
    return {
      if (clusters != null) 'clusters': clusters,
      if (witnessRegion != null) 'witnessRegion': witnessRegion,
    };
  }
}

/// Configuration details about encryption for the cluster including the KMS key
/// ARN, encryption type, and encryption status.
///
/// @nodoc
class EncryptionDetails {
  /// The status of encryption for the cluster.
  final EncryptionStatus encryptionStatus;

  /// The type of encryption that protects the data on your cluster.
  final EncryptionType encryptionType;

  /// The ARN of the KMS key that encrypts data in the cluster.
  final String? kmsKeyArn;

  EncryptionDetails({
    required this.encryptionStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory EncryptionDetails.fromJson(Map<String, dynamic> json) {
    return EncryptionDetails(
      encryptionStatus: EncryptionStatus.fromString(
          (json['encryptionStatus'] as String?) ?? ''),
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionStatus = this.encryptionStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'encryptionStatus': encryptionStatus.value,
      'encryptionType': encryptionType.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// @nodoc
class EncryptionType {
  static const awsOwnedKmsKey = EncryptionType._('AWS_OWNED_KMS_KEY');
  static const customerManagedKmsKey =
      EncryptionType._('CUSTOMER_MANAGED_KMS_KEY');

  final String value;

  const EncryptionType._(this.value);

  static const values = [awsOwnedKmsKey, customerManagedKmsKey];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EncryptionStatus {
  static const enabled = EncryptionStatus._('ENABLED');
  static const updating = EncryptionStatus._('UPDATING');
  static const kmsKeyInaccessible = EncryptionStatus._('KMS_KEY_INACCESSIBLE');
  static const enabling = EncryptionStatus._('ENABLING');

  final String value;

  const EncryptionStatus._(this.value);

  static const values = [enabled, updating, kmsKeyInaccessible, enabling];

  static EncryptionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionStatus._(value));

  @override
  bool operator ==(other) => other is EncryptionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
