// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Use the Amazon OpenSearch Serverless API to create, configure, and manage
/// OpenSearch Serverless collections and security policies.
///
/// OpenSearch Serverless is an on-demand, pre-provisioned serverless
/// configuration for Amazon OpenSearch Service. OpenSearch Serverless removes
/// the operational complexities of provisioning, configuring, and tuning your
/// OpenSearch clusters. It enables you to easily search and analyze petabytes
/// of data without having to worry about the underlying infrastructure and data
/// management.
///
/// To learn more about OpenSearch Serverless, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-overview.html">What
/// is Amazon OpenSearch Serverless?</a>
class OpenSearchServerless {
  final _s.JsonProtocol _protocol;
  OpenSearchServerless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aoss',
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

  /// Returns attributes for one or more collections, including the collection
  /// endpoint, the OpenSearch Dashboards endpoint, and FIPS-compliant
  /// endpoints. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ids] :
  /// A list of collection IDs. You can't provide names and IDs in the same
  /// request. The ID is part of the collection endpoint. You can also retrieve
  /// it using the <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html">ListCollections</a>
  /// API.
  ///
  /// Parameter [names] :
  /// A list of collection names. You can't provide names and IDs in the same
  /// request.
  Future<BatchGetCollectionResponse> batchGetCollection({
    List<String>? ids,
    List<String>? names,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.BatchGetCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ids != null) 'ids': ids,
        if (names != null) 'names': names,
      },
    );

    return BatchGetCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Returns attributes for one or more collection groups, including capacity
  /// limits and the number of collections in each group. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ids] :
  /// A list of collection group IDs. You can't provide names and IDs in the
  /// same request.
  ///
  /// Parameter [names] :
  /// A list of collection group names. You can't provide names and IDs in the
  /// same request.
  Future<BatchGetCollectionGroupResponse> batchGetCollectionGroup({
    List<String>? ids,
    List<String>? names,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.BatchGetCollectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ids != null) 'ids': ids,
        if (names != null) 'names': names,
      },
    );

    return BatchGetCollectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of successful and failed retrievals for the OpenSearch
  /// Serverless indexes. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list">Viewing
  /// data lifecycle policies</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceIdentifiers] :
  /// The unique identifiers of policy types and resource names.
  Future<BatchGetEffectiveLifecyclePolicyResponse>
      batchGetEffectiveLifecyclePolicy({
    required List<LifecyclePolicyResourceIdentifier> resourceIdentifiers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.BatchGetEffectiveLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceIdentifiers': resourceIdentifiers,
      },
    );

    return BatchGetEffectiveLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns one or more configured OpenSearch Serverless lifecycle policies.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list">Viewing
  /// data lifecycle policies</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The unique identifiers of policy types and policy names.
  Future<BatchGetLifecyclePolicyResponse> batchGetLifecyclePolicy({
    required List<LifecyclePolicyIdentifier> identifiers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.BatchGetLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifiers': identifiers,
      },
    );

    return BatchGetLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns attributes for one or more VPC endpoints associated with the
  /// current account. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
  /// Amazon OpenSearch Serverless using an interface endpoint</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ids] :
  /// A list of VPC endpoint identifiers.
  Future<BatchGetVpcEndpointResponse> batchGetVpcEndpoint({
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.BatchGetVpcEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
      },
    );

    return BatchGetVpcEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a lifecyle policy to be applied to OpenSearch Serverless indexes.
  /// Lifecycle policies define the number of days or hours to retain the data
  /// on an OpenSearch Serverless index. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-create">Creating
  /// data lifecycle policies</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the lifecycle policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the lifecycle policy.
  ///
  /// Parameter [type] :
  /// The type of lifecycle policy.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the lifecycle policy.
  Future<CreateLifecyclePolicyResponse> createLifecyclePolicy({
    required String name,
    required String policy,
    required LifecyclePolicyType type,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policy': policy,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreateLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a security policy to be used by one or more OpenSearch Serverless
  /// collections. Security policies provide access to a collection and its
  /// OpenSearch Dashboards endpoint from public networks or specific VPC
  /// endpoints. They also allow you to secure a collection with a KMS
  /// encryption key. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html">Network
  /// access for Amazon OpenSearch Serverless</a> and <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html">Encryption
  /// at rest for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the new policy.
  ///
  /// Parameter [type] :
  /// The type of security policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the policy. Typically used to store information about the
  /// permissions defined in the policy.
  Future<CreateSecurityPolicyResponse> createSecurityPolicy({
    required String name,
    required String policy,
    required SecurityPolicyType type,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateSecurityPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policy': policy,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreateSecurityPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns account-level settings related to OpenSearch Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Returns statistical information about your OpenSearch Serverless access
  /// policies, security configurations, and security policies.
  ///
  /// May throw [InternalServerException].
  Future<GetPoliciesStatsResponse> getPoliciesStats() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetPoliciesStats'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetPoliciesStatsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the tags for an OpenSearch Serverless resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html">Tagging
  /// Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. The resource must be
  /// active (not in the <code>DELETING</code> state), and must be owned by the
  /// account ID included in the request.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Associates tags with an OpenSearch Serverless resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html">Tagging
  /// Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. The resource must be
  /// active (not in the <code>DELETING</code> state), and must be owned by the
  /// account ID included in the request.
  ///
  /// Parameter [tags] :
  /// A list of tags (key-value pairs) to add to the resource. All tag keys in
  /// the request must be unique.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes a tag or set of tags from an OpenSearch Serverless resource. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html">Tagging
  /// Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from. The
  /// resource must be active (not in the <code>DELETING</code> state), and must
  /// be owned by the account ID included in the request.
  ///
  /// Parameter [tagKeys] :
  /// The tag or set of tags to remove from the resource. All tag keys in the
  /// request must be unique.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Update the OpenSearch Serverless settings for the current Amazon Web
  /// Services account. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html">Managing
  /// capacity limits for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  Future<UpdateAccountSettingsResponse> updateAccountSettings({
    CapacityLimits? capacityLimits,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (capacityLimits != null) 'capacityLimits': capacityLimits,
      },
    );

    return UpdateAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Updates an OpenSearch Serverless-managed interface endpoint. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
  /// Amazon OpenSearch Serverless using an interface endpoint</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the interface endpoint to update.
  ///
  /// Parameter [addSecurityGroupIds] :
  /// The unique identifiers of the security groups to add to the endpoint.
  /// Security groups define the ports, protocols, and sources for inbound
  /// traffic that you are authorizing into your endpoint.
  ///
  /// Parameter [addSubnetIds] :
  /// The ID of one or more subnets to add to the endpoint.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [removeSecurityGroupIds] :
  /// The unique identifiers of the security groups to remove from the endpoint.
  ///
  /// Parameter [removeSubnetIds] :
  /// The unique identifiers of the subnets to remove from the endpoint.
  Future<UpdateVpcEndpointResponse> updateVpcEndpoint({
    required String id,
    List<String>? addSecurityGroupIds,
    List<String>? addSubnetIds,
    String? clientToken,
    List<String>? removeSecurityGroupIds,
    List<String>? removeSubnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateVpcEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (addSecurityGroupIds != null)
          'addSecurityGroupIds': addSecurityGroupIds,
        if (addSubnetIds != null) 'addSubnetIds': addSubnetIds,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (removeSecurityGroupIds != null)
          'removeSecurityGroupIds': removeSecurityGroupIds,
        if (removeSubnetIds != null) 'removeSubnetIds': removeSubnetIds,
      },
    );

    return UpdateVpcEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a data access policy for OpenSearch Serverless. Access policies
  /// limit access to collections and the resources within them, and allow a
  /// user to access that data irrespective of the access mechanism or network
  /// source. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
  /// access control for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the policy.
  ///
  /// Parameter [type] :
  /// The type of policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the policy. Typically used to store information about the
  /// permissions defined in the policy.
  Future<CreateAccessPolicyResponse> createAccessPolicy({
    required String name,
    required String policy,
    required AccessPolicyType type,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateAccessPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policy': policy,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreateAccessPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns an OpenSearch Serverless access policy. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
  /// access control for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the access policy.
  ///
  /// Parameter [type] :
  /// Tye type of policy. Currently, the only supported value is
  /// <code>data</code>.
  Future<GetAccessPolicyResponse> getAccessPolicy({
    required String name,
    required AccessPolicyType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetAccessPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
      },
    );

    return GetAccessPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Updates an OpenSearch Serverless access policy. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
  /// access control for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersion] :
  /// The version of the policy being updated.
  ///
  /// Parameter [type] :
  /// The type of policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the policy. Typically used to store information about the
  /// permissions defined in the policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the policy.
  Future<UpdateAccessPolicyResponse> updateAccessPolicy({
    required String name,
    required String policyVersion,
    required AccessPolicyType type,
    String? clientToken,
    String? description,
    String? policy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateAccessPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policyVersion': policyVersion,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (policy != null) 'policy': policy,
      },
    );

    return UpdateAccessPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an OpenSearch Serverless access policy. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
  /// access control for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy to delete.
  ///
  /// Parameter [type] :
  /// The type of policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteAccessPolicy({
    required String name,
    required AccessPolicyType type,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteAccessPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns information about a list of OpenSearch Serverless access policies.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// The type of access policy.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results. The default is 20.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListAccessPolicies</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListAccessPolicies</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [resource] :
  /// Resource filters (can be collections or indexes) that policies can apply
  /// to.
  Future<ListAccessPoliciesResponse> listAccessPolicies({
    required AccessPolicyType type,
    int? maxResults,
    String? nextToken,
    List<String>? resource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListAccessPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'type': type.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (resource != null) 'resource': resource,
      },
    );

    return ListAccessPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new OpenSearch Serverless collection. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [OcuLimitExceededException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Name of the collection.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [collectionGroupName] :
  /// The name of the collection group to associate with the collection.
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether to enable deletion protection for the collection. When
  /// set to <code>ENABLED</code>, the collection cannot be deleted.
  ///
  /// Parameter [description] :
  /// Description of the collection.
  ///
  /// Parameter [encryptionConfig] :
  /// Encryption settings for the collection.
  ///
  /// Parameter [standbyReplicas] :
  /// Indicates whether standby replicas should be used for a collection.
  ///
  /// Parameter [tags] :
  /// An arbitrary set of tags (key–value pairs) to associate with the
  /// OpenSearch Serverless collection.
  ///
  /// Parameter [type] :
  /// The type of collection.
  ///
  /// Parameter [vectorOptions] :
  /// Configuration options for vector search capabilities in the collection.
  Future<CreateCollectionResponse> createCollection({
    required String name,
    String? clientToken,
    String? collectionGroupName,
    DeletionProtection? deletionProtection,
    String? description,
    EncryptionConfig? encryptionConfig,
    StandbyReplicas? standbyReplicas,
    List<Tag>? tags,
    CollectionType? type,
    VectorOptions? vectorOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (collectionGroupName != null)
          'collectionGroupName': collectionGroupName,
        if (deletionProtection != null)
          'deletionProtection': deletionProtection.value,
        if (description != null) 'description': description,
        if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
        if (standbyReplicas != null) 'standbyReplicas': standbyReplicas.value,
        if (tags != null) 'tags': tags,
        if (type != null) 'type': type.value,
        if (vectorOptions != null) 'vectorOptions': vectorOptions,
      },
    );

    return CreateCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Updates an OpenSearch Serverless collection.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether to enable or disable deletion protection for the
  /// collection. When set to <code>ENABLED</code>, the collection cannot be
  /// deleted.
  ///
  /// Parameter [description] :
  /// A description of the collection.
  ///
  /// Parameter [vectorOptions] :
  /// Configuration options for vector search capabilities in the collection.
  Future<UpdateCollectionResponse> updateCollection({
    required String id,
    String? clientToken,
    DeletionProtection? deletionProtection,
    String? description,
    VectorOptions? vectorOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtection != null)
          'deletionProtection': deletionProtection.value,
        if (description != null) 'description': description,
        if (vectorOptions != null) 'vectorOptions': vectorOptions,
      },
    );

    return UpdateCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an OpenSearch Serverless collection. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection. For example,
  /// <code>1iu5usc406kd</code>. The ID is part of the collection endpoint. You
  /// can also retrieve it using the <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html">ListCollections</a>
  /// API.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  Future<DeleteCollectionResponse> deleteCollection({
    required String id,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Lists all OpenSearch Serverless collections. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  /// <note>
  /// Make sure to include an empty request body {} if you don't include any
  /// collection filters in the request.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionFilters] :
  /// A list of filter names and values that you can use for requests.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Default is 20. You can use
  /// <code>nextToken</code> to get the next page of results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListCollections</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListCollections</code>
  /// operations, which returns results in the next page.
  Future<ListCollectionsResponse> listCollections({
    CollectionFilters? collectionFilters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListCollections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (collectionFilters != null) 'collectionFilters': collectionFilters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListCollectionsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a collection group within OpenSearch Serverless. Collection groups
  /// let you manage OpenSearch Compute Units (OCUs) at a group level, with
  /// multiple collections sharing the group's capacity limits.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collection-groups.html">Managing
  /// collection groups</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the collection group.
  ///
  /// Parameter [standbyReplicas] :
  /// Indicates whether standby replicas should be used for a collection group.
  ///
  /// Parameter [capacityLimits] :
  /// The capacity limits for the collection group, in OpenSearch Compute Units
  /// (OCUs). These limits control the maximum and minimum capacity for
  /// collections within the group.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the collection group.
  ///
  /// Parameter [generation] :
  /// The generation of Amazon OpenSearch Serverless for the collection group.
  /// Valid values are <code>CLASSIC</code> and <code>NEXTGEN</code>.
  ///
  /// Parameter [tags] :
  /// An arbitrary set of tags (key–value pairs) to associate with the
  /// OpenSearch Serverless collection group.
  Future<CreateCollectionGroupResponse> createCollectionGroup({
    required String name,
    required StandbyReplicas standbyReplicas,
    CollectionGroupCapacityLimits? capacityLimits,
    String? clientToken,
    String? description,
    ServerlessGeneration? generation,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateCollectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'standbyReplicas': standbyReplicas.value,
        if (capacityLimits != null) 'capacityLimits': capacityLimits,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (generation != null) 'generation': generation.value,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCollectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates the description and capacity limits of a collection group.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection group to update.
  ///
  /// Parameter [capacityLimits] :
  /// Updated capacity limits for the collection group, in OpenSearch Compute
  /// Units (OCUs).
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A new description for the collection group.
  Future<UpdateCollectionGroupResponse> updateCollectionGroup({
    required String id,
    CollectionGroupCapacityLimits? capacityLimits,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateCollectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (capacityLimits != null) 'capacityLimits': capacityLimits,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return UpdateCollectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a collection group. You can only delete empty collection groups
  /// that contain no collections. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection group to delete.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteCollectionGroup({
    required String id,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteCollectionGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns a list of collection groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html">Creating
  /// and managing Amazon OpenSearch Serverless collections</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Default is 20. You can use
  /// <code>nextToken</code> to get the next page of results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListCollectionGroups</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListCollectionGroups</code>
  /// operations, which returns results in the next page.
  Future<ListCollectionGroupsResponse> listCollectionGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListCollectionGroups'
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

    return ListCollectionGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an index within an OpenSearch Serverless collection. Unlike other
  /// OpenSearch indexes, indexes created by this API are automatically
  /// configured to conduct automatic semantic enrichment ingestion and search.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html#serverless-semantic-enrichment">About
  /// automatic semantic enrichment</a> in the <i>OpenSearch User Guide</i>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection in which to create the index.
  ///
  /// Parameter [indexName] :
  /// The name of the index to create. Index names must be lowercase and can't
  /// begin with underscores (_) or hyphens (-).
  ///
  /// Parameter [indexSchema] :
  /// The JSON schema definition for the index, including field mappings and
  /// settings.
  Future<void> createIndex({
    required String id,
    required String indexName,
    Object? indexSchema,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'indexName': indexName,
        if (indexSchema != null) 'indexSchema': indexSchema,
      },
    );
  }

  /// Retrieves information about an index in an OpenSearch Serverless
  /// collection, including its schema definition. The index might be configured
  /// to conduct automatic semantic enrichment ingestion and search. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html#serverless-semantic-enrichment">About
  /// automatic semantic enrichment</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection containing the index.
  ///
  /// Parameter [indexName] :
  /// The name of the index to retrieve information about.
  Future<GetIndexResponse> getIndex({
    required String id,
    required String indexName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetIndex'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'indexName': indexName,
      },
    );

    return GetIndexResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing index in an OpenSearch Serverless collection. This
  /// operation allows you to modify the index schema, including adding new
  /// fields or changing field mappings. You can also enable automatic semantic
  /// enrichment ingestion and search. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html#serverless-semantic-enrichment">About
  /// automatic semantic enrichment</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection containing the index to update.
  ///
  /// Parameter [indexName] :
  /// The name of the index to update.
  ///
  /// Parameter [indexSchema] :
  /// The updated JSON schema definition for the index, including field mappings
  /// and settings.
  Future<void> updateIndex({
    required String id,
    required String indexName,
    Object? indexSchema,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'indexName': indexName,
        if (indexSchema != null) 'indexSchema': indexSchema,
      },
    );
  }

  /// Deletes an index from an OpenSearch Serverless collection. Be aware that
  /// the index might be configured to conduct automatic semantic enrichment
  /// ingestion and search. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html#serverless-semantic-enrichment">About
  /// automatic semantic enrichment</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the collection containing the index to delete.
  ///
  /// Parameter [indexName] :
  /// The name of the index to delete.
  Future<void> deleteIndex({
    required String id,
    required String indexName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'indexName': indexName,
      },
    );
  }

  /// Updates an OpenSearch Serverless access policy. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-update">Updating
  /// data lifecycle policies</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersion] :
  /// The version of the policy being updated.
  ///
  /// Parameter [type] :
  /// The type of lifecycle policy.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the lifecycle policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the lifecycle policy.
  Future<UpdateLifecyclePolicyResponse> updateLifecyclePolicy({
    required String name,
    required String policyVersion,
    required LifecyclePolicyType type,
    String? clientToken,
    String? description,
    String? policy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policyVersion': policyVersion,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (policy != null) 'policy': policy,
      },
    );

    return UpdateLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an OpenSearch Serverless lifecycle policy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-delete">Deleting
  /// data lifecycle policies</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy to delete.
  ///
  /// Parameter [type] :
  /// The type of lifecycle policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteLifecyclePolicy({
    required String name,
    required LifecyclePolicyType type,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteLifecyclePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns a list of OpenSearch Serverless lifecycle policies. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list">Viewing
  /// data lifecycle policies</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// The type of lifecycle policy.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use use <code>nextToken</code> to get the next page of
  /// results. The default is 10.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListLifecyclePolicies</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListLifecyclePolicies</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [resources] :
  /// Resource filters that policies can apply to. Currently, the only supported
  /// resource type is <code>index</code>.
  Future<ListLifecyclePoliciesResponse> listLifecyclePolicies({
    required LifecyclePolicyType type,
    int? maxResults,
    String? nextToken,
    List<String>? resources,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListLifecyclePolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'type': type.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (resources != null) 'resources': resources,
      },
    );

    return ListLifecyclePoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Specifies a security configuration for OpenSearch Serverless. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html">SAML
  /// authentication for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  ///
  /// Parameter [type] :
  /// The type of security configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the security configuration.
  ///
  /// Parameter [iamFederationOptions] :
  /// Describes IAM federation options in the form of a key-value map. This
  /// field is required if you specify <code>iamFederation</code> for the
  /// <code>type</code> parameter.
  ///
  /// Parameter [iamIdentityCenterOptions] :
  /// Describes IAM Identity Center options in the form of a key-value map. This
  /// field is required if you specify <code>iamidentitycenter</code> for the
  /// <code>type</code> parameter.
  ///
  /// Parameter [samlOptions] :
  /// Describes SAML options in the form of a key-value map. This field is
  /// required if you specify <code>SAML</code> for the <code>type</code>
  /// parameter.
  Future<CreateSecurityConfigResponse> createSecurityConfig({
    required String name,
    required SecurityConfigType type,
    String? clientToken,
    String? description,
    IamFederationConfigOptions? iamFederationOptions,
    CreateIamIdentityCenterConfigOptions? iamIdentityCenterOptions,
    SamlConfigOptions? samlOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateSecurityConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (iamFederationOptions != null)
          'iamFederationOptions': iamFederationOptions,
        if (iamIdentityCenterOptions != null)
          'iamIdentityCenterOptions': iamIdentityCenterOptions,
        if (samlOptions != null) 'samlOptions': samlOptions,
      },
    );

    return CreateSecurityConfigResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about an OpenSearch Serverless security configuration.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html">SAML
  /// authentication for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the security configuration.
  Future<GetSecurityConfigResponse> getSecurityConfig({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetSecurityConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return GetSecurityConfigResponse.fromJson(jsonResponse.body);
  }

  /// Updates a security configuration for OpenSearch Serverless. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html">SAML
  /// authentication for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configVersion] :
  /// The version of the security configuration to be updated. You can find the
  /// most recent version of a security configuration using the
  /// <code>GetSecurityPolicy</code> command.
  ///
  /// Parameter [id] :
  /// The security configuration identifier. For SAML the ID will be
  /// <code>saml/&lt;accountId&gt;/&lt;idpProviderName&gt;</code>. For example,
  /// <code>saml/123456789123/OKTADev</code>.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the security configuration.
  ///
  /// Parameter [iamFederationOptions] :
  /// Describes IAM federation options in the form of a key-value map for
  /// updating an existing security configuration. Use this field to modify IAM
  /// federation settings for the security configuration.
  ///
  /// Parameter [iamIdentityCenterOptionsUpdates] :
  /// Describes IAM Identity Center options in the form of a key-value map.
  ///
  /// Parameter [samlOptions] :
  /// SAML options in in the form of a key-value map.
  Future<UpdateSecurityConfigResponse> updateSecurityConfig({
    required String configVersion,
    required String id,
    String? clientToken,
    String? description,
    IamFederationConfigOptions? iamFederationOptions,
    UpdateIamIdentityCenterConfigOptions? iamIdentityCenterOptionsUpdates,
    SamlConfigOptions? samlOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateSecurityConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configVersion': configVersion,
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (iamFederationOptions != null)
          'iamFederationOptions': iamFederationOptions,
        if (iamIdentityCenterOptionsUpdates != null)
          'iamIdentityCenterOptionsUpdates': iamIdentityCenterOptionsUpdates,
        if (samlOptions != null) 'samlOptions': samlOptions,
      },
    );

    return UpdateSecurityConfigResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a security configuration for OpenSearch Serverless. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html">SAML
  /// authentication for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The security configuration identifier. For SAML the ID will be
  /// <code>saml/&lt;accountId&gt;/&lt;idpProviderName&gt;</code>. For example,
  /// <code>saml/123456789123/OKTADev</code>.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteSecurityConfig({
    required String id,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteSecurityConfig'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns information about configured OpenSearch Serverless security
  /// configurations. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html">SAML
  /// authentication for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// The type of security configuration.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results. The default is 20.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListSecurityConfigs</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListSecurityConfigs</code>
  /// operations, which returns results in the next page.
  Future<ListSecurityConfigsResponse> listSecurityConfigs({
    required SecurityConfigType type,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListSecurityConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'type': type.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSecurityConfigsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a configured OpenSearch Serverless security
  /// policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html">Network
  /// access for Amazon OpenSearch Serverless</a> and <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html">Encryption
  /// at rest for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the security policy.
  ///
  /// Parameter [type] :
  /// The type of security policy.
  Future<GetSecurityPolicyResponse> getSecurityPolicy({
    required String name,
    required SecurityPolicyType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.GetSecurityPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
      },
    );

    return GetSecurityPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Updates an OpenSearch Serverless security policy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html">Network
  /// access for Amazon OpenSearch Serverless</a> and <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html">Encryption
  /// at rest for Amazon OpenSearch Serverless</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersion] :
  /// The version of the policy being updated.
  ///
  /// Parameter [type] :
  /// The type of access policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the policy. Typically used to store information about the
  /// permissions defined in the policy.
  ///
  /// Parameter [policy] :
  /// The JSON policy document to use as the content for the new policy.
  Future<UpdateSecurityPolicyResponse> updateSecurityPolicy({
    required String name,
    required String policyVersion,
    required SecurityPolicyType type,
    String? clientToken,
    String? description,
    String? policy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.UpdateSecurityPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'policyVersion': policyVersion,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (policy != null) 'policy': policy,
      },
    );

    return UpdateSecurityPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an OpenSearch Serverless security policy.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the policy to delete.
  ///
  /// Parameter [type] :
  /// The type of policy.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteSecurityPolicy({
    required String name,
    required SecurityPolicyType type,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteSecurityPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns information about configured OpenSearch Serverless security
  /// policies.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// The type of policy.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results. The default is 20.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListSecurityPolicies</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListSecurityPolicies</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [resource] :
  /// Resource filters (can be collection or indexes) that policies can apply
  /// to.
  Future<ListSecurityPoliciesResponse> listSecurityPolicies({
    required SecurityPolicyType type,
    int? maxResults,
    String? nextToken,
    List<String>? resource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListSecurityPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'type': type.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (resource != null) 'resource': resource,
      },
    );

    return ListSecurityPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Creates an OpenSearch Serverless-managed interface VPC endpoint. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
  /// Amazon OpenSearch Serverless using an interface endpoint</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the interface endpoint.
  ///
  /// Parameter [subnetIds] :
  /// The ID of one or more subnets from which you'll access OpenSearch
  /// Serverless.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC from which you'll access OpenSearch Serverless.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [securityGroupIds] :
  /// The unique identifiers of the security groups that define the ports,
  /// protocols, and sources for inbound traffic that you are authorizing into
  /// your endpoint.
  Future<CreateVpcEndpointResponse> createVpcEndpoint({
    required String name,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    List<String>? securityGroupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.CreateVpcEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'subnetIds': subnetIds,
        'vpcId': vpcId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      },
    );

    return CreateVpcEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an OpenSearch Serverless-managed interface endpoint. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
  /// Amazon OpenSearch Serverless using an interface endpoint</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The VPC endpoint identifier.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<DeleteVpcEndpointResponse> deleteVpcEndpoint({
    required String id,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.DeleteVpcEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteVpcEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Returns the OpenSearch Serverless-managed interface VPC endpoints
  /// associated with the current account. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
  /// Amazon OpenSearch Serverless using an interface endpoint</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results. The default is 20.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListVpcEndpoints</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListVpcEndpoints</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [vpcEndpointFilters] :
  /// Filter the results according to the current status of the VPC endpoint.
  /// Possible statuses are <code>CREATING</code>, <code>DELETING</code>,
  /// <code>UPDATING</code>, <code>ACTIVE</code>, and <code>FAILED</code>.
  Future<ListVpcEndpointsResponse> listVpcEndpoints({
    int? maxResults,
    String? nextToken,
    VpcEndpointFilters? vpcEndpointFilters,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'OpenSearchServerless.ListVpcEndpoints'
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
        if (vpcEndpointFilters != null)
          'vpcEndpointFilters': vpcEndpointFilters,
      },
    );

    return ListVpcEndpointsResponse.fromJson(jsonResponse.body);
  }
}

class BatchGetCollectionResponse {
  /// Details about each collection.
  final List<CollectionDetail>? collectionDetails;

  /// Error information for the request.
  final List<CollectionErrorDetail>? collectionErrorDetails;

  BatchGetCollectionResponse({
    this.collectionDetails,
    this.collectionErrorDetails,
  });

  factory BatchGetCollectionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetCollectionResponse(
      collectionDetails: (json['collectionDetails'] as List?)
          ?.nonNulls
          .map((e) => CollectionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectionErrorDetails: (json['collectionErrorDetails'] as List?)
          ?.nonNulls
          .map((e) => CollectionErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionDetails = this.collectionDetails;
    final collectionErrorDetails = this.collectionErrorDetails;
    return {
      if (collectionDetails != null) 'collectionDetails': collectionDetails,
      if (collectionErrorDetails != null)
        'collectionErrorDetails': collectionErrorDetails,
    };
  }
}

class BatchGetCollectionGroupResponse {
  /// Details about each collection group.
  final List<CollectionGroupDetail>? collectionGroupDetails;

  /// Error information for the request.
  final List<CollectionGroupErrorDetail>? collectionGroupErrorDetails;

  BatchGetCollectionGroupResponse({
    this.collectionGroupDetails,
    this.collectionGroupErrorDetails,
  });

  factory BatchGetCollectionGroupResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetCollectionGroupResponse(
      collectionGroupDetails: (json['collectionGroupDetails'] as List?)
          ?.nonNulls
          .map((e) => CollectionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectionGroupErrorDetails: (json['collectionGroupErrorDetails']
              as List?)
          ?.nonNulls
          .map((e) =>
              CollectionGroupErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionGroupDetails = this.collectionGroupDetails;
    final collectionGroupErrorDetails = this.collectionGroupErrorDetails;
    return {
      if (collectionGroupDetails != null)
        'collectionGroupDetails': collectionGroupDetails,
      if (collectionGroupErrorDetails != null)
        'collectionGroupErrorDetails': collectionGroupErrorDetails,
    };
  }
}

class BatchGetEffectiveLifecyclePolicyResponse {
  /// A list of lifecycle policies applied to the OpenSearch Serverless indexes.
  final List<EffectiveLifecyclePolicyDetail>? effectiveLifecyclePolicyDetails;

  /// A list of resources for which retrieval failed.
  final List<EffectiveLifecyclePolicyErrorDetail>?
      effectiveLifecyclePolicyErrorDetails;

  BatchGetEffectiveLifecyclePolicyResponse({
    this.effectiveLifecyclePolicyDetails,
    this.effectiveLifecyclePolicyErrorDetails,
  });

  factory BatchGetEffectiveLifecyclePolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetEffectiveLifecyclePolicyResponse(
      effectiveLifecyclePolicyDetails:
          (json['effectiveLifecyclePolicyDetails'] as List?)
              ?.nonNulls
              .map((e) => EffectiveLifecyclePolicyDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      effectiveLifecyclePolicyErrorDetails:
          (json['effectiveLifecyclePolicyErrorDetails'] as List?)
              ?.nonNulls
              .map((e) => EffectiveLifecyclePolicyErrorDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveLifecyclePolicyDetails =
        this.effectiveLifecyclePolicyDetails;
    final effectiveLifecyclePolicyErrorDetails =
        this.effectiveLifecyclePolicyErrorDetails;
    return {
      if (effectiveLifecyclePolicyDetails != null)
        'effectiveLifecyclePolicyDetails': effectiveLifecyclePolicyDetails,
      if (effectiveLifecyclePolicyErrorDetails != null)
        'effectiveLifecyclePolicyErrorDetails':
            effectiveLifecyclePolicyErrorDetails,
    };
  }
}

class BatchGetLifecyclePolicyResponse {
  /// A list of lifecycle policies matched to the input policy name and policy
  /// type.
  final List<LifecyclePolicyDetail>? lifecyclePolicyDetails;

  /// A list of lifecycle policy names and policy types for which retrieval
  /// failed.
  final List<LifecyclePolicyErrorDetail>? lifecyclePolicyErrorDetails;

  BatchGetLifecyclePolicyResponse({
    this.lifecyclePolicyDetails,
    this.lifecyclePolicyErrorDetails,
  });

  factory BatchGetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetLifecyclePolicyResponse(
      lifecyclePolicyDetails: (json['lifecyclePolicyDetails'] as List?)
          ?.nonNulls
          .map((e) => LifecyclePolicyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      lifecyclePolicyErrorDetails: (json['lifecyclePolicyErrorDetails']
              as List?)
          ?.nonNulls
          .map((e) =>
              LifecyclePolicyErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyDetails = this.lifecyclePolicyDetails;
    final lifecyclePolicyErrorDetails = this.lifecyclePolicyErrorDetails;
    return {
      if (lifecyclePolicyDetails != null)
        'lifecyclePolicyDetails': lifecyclePolicyDetails,
      if (lifecyclePolicyErrorDetails != null)
        'lifecyclePolicyErrorDetails': lifecyclePolicyErrorDetails,
    };
  }
}

class BatchGetVpcEndpointResponse {
  /// Details about the specified VPC endpoint.
  final List<VpcEndpointDetail>? vpcEndpointDetails;

  /// Error information for a failed request.
  final List<VpcEndpointErrorDetail>? vpcEndpointErrorDetails;

  BatchGetVpcEndpointResponse({
    this.vpcEndpointDetails,
    this.vpcEndpointErrorDetails,
  });

  factory BatchGetVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetVpcEndpointResponse(
      vpcEndpointDetails: (json['vpcEndpointDetails'] as List?)
          ?.nonNulls
          .map((e) => VpcEndpointDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcEndpointErrorDetails: (json['vpcEndpointErrorDetails'] as List?)
          ?.nonNulls
          .map(
              (e) => VpcEndpointErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointDetails = this.vpcEndpointDetails;
    final vpcEndpointErrorDetails = this.vpcEndpointErrorDetails;
    return {
      if (vpcEndpointDetails != null) 'vpcEndpointDetails': vpcEndpointDetails,
      if (vpcEndpointErrorDetails != null)
        'vpcEndpointErrorDetails': vpcEndpointErrorDetails,
    };
  }
}

class CreateLifecyclePolicyResponse {
  /// Details about the created lifecycle policy.
  final LifecyclePolicyDetail? lifecyclePolicyDetail;

  CreateLifecyclePolicyResponse({
    this.lifecyclePolicyDetail,
  });

  factory CreateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateLifecyclePolicyResponse(
      lifecyclePolicyDetail: json['lifecyclePolicyDetail'] != null
          ? LifecyclePolicyDetail.fromJson(
              json['lifecyclePolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyDetail = this.lifecyclePolicyDetail;
    return {
      if (lifecyclePolicyDetail != null)
        'lifecyclePolicyDetail': lifecyclePolicyDetail,
    };
  }
}

class CreateSecurityPolicyResponse {
  /// Details about the created security policy.
  final SecurityPolicyDetail? securityPolicyDetail;

  CreateSecurityPolicyResponse({
    this.securityPolicyDetail,
  });

  factory CreateSecurityPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecurityPolicyResponse(
      securityPolicyDetail: json['securityPolicyDetail'] != null
          ? SecurityPolicyDetail.fromJson(
              json['securityPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyDetail = this.securityPolicyDetail;
    return {
      if (securityPolicyDetail != null)
        'securityPolicyDetail': securityPolicyDetail,
    };
  }
}

class GetAccountSettingsResponse {
  /// OpenSearch Serverless-related details for the current account.
  final AccountSettingsDetail? accountSettingsDetail;

  GetAccountSettingsResponse({
    this.accountSettingsDetail,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResponse(
      accountSettingsDetail: json['accountSettingsDetail'] != null
          ? AccountSettingsDetail.fromJson(
              json['accountSettingsDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettingsDetail = this.accountSettingsDetail;
    return {
      if (accountSettingsDetail != null)
        'accountSettingsDetail': accountSettingsDetail,
    };
  }
}

class GetPoliciesStatsResponse {
  /// Information about the data access policies in your account.
  final AccessPolicyStats? accessPolicyStats;

  /// Information about the lifecycle policies in your account.
  final LifecyclePolicyStats? lifecyclePolicyStats;

  /// Information about the security configurations in your account.
  final SecurityConfigStats? securityConfigStats;

  /// Information about the security policies in your account.
  final SecurityPolicyStats? securityPolicyStats;

  /// The total number of OpenSearch Serverless security policies and
  /// configurations in your account.
  final int? totalPolicyCount;

  GetPoliciesStatsResponse({
    this.accessPolicyStats,
    this.lifecyclePolicyStats,
    this.securityConfigStats,
    this.securityPolicyStats,
    this.totalPolicyCount,
  });

  factory GetPoliciesStatsResponse.fromJson(Map<String, dynamic> json) {
    return GetPoliciesStatsResponse(
      accessPolicyStats: json['AccessPolicyStats'] != null
          ? AccessPolicyStats.fromJson(
              json['AccessPolicyStats'] as Map<String, dynamic>)
          : null,
      lifecyclePolicyStats: json['LifecyclePolicyStats'] != null
          ? LifecyclePolicyStats.fromJson(
              json['LifecyclePolicyStats'] as Map<String, dynamic>)
          : null,
      securityConfigStats: json['SecurityConfigStats'] != null
          ? SecurityConfigStats.fromJson(
              json['SecurityConfigStats'] as Map<String, dynamic>)
          : null,
      securityPolicyStats: json['SecurityPolicyStats'] != null
          ? SecurityPolicyStats.fromJson(
              json['SecurityPolicyStats'] as Map<String, dynamic>)
          : null,
      totalPolicyCount: json['TotalPolicyCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyStats = this.accessPolicyStats;
    final lifecyclePolicyStats = this.lifecyclePolicyStats;
    final securityConfigStats = this.securityConfigStats;
    final securityPolicyStats = this.securityPolicyStats;
    final totalPolicyCount = this.totalPolicyCount;
    return {
      if (accessPolicyStats != null) 'AccessPolicyStats': accessPolicyStats,
      if (lifecyclePolicyStats != null)
        'LifecyclePolicyStats': lifecyclePolicyStats,
      if (securityConfigStats != null)
        'SecurityConfigStats': securityConfigStats,
      if (securityPolicyStats != null)
        'SecurityPolicyStats': securityPolicyStats,
      if (totalPolicyCount != null) 'TotalPolicyCount': totalPolicyCount,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAccountSettingsResponse {
  /// OpenSearch Serverless-related settings for the current Amazon Web Services
  /// account.
  final AccountSettingsDetail? accountSettingsDetail;

  UpdateAccountSettingsResponse({
    this.accountSettingsDetail,
  });

  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccountSettingsResponse(
      accountSettingsDetail: json['accountSettingsDetail'] != null
          ? AccountSettingsDetail.fromJson(
              json['accountSettingsDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettingsDetail = this.accountSettingsDetail;
    return {
      if (accountSettingsDetail != null)
        'accountSettingsDetail': accountSettingsDetail,
    };
  }
}

class UpdateVpcEndpointResponse {
  /// Details about the updated VPC endpoint.
  final UpdateVpcEndpointDetail? updateVpcEndpointDetail;

  UpdateVpcEndpointResponse({
    this.updateVpcEndpointDetail,
  });

  factory UpdateVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVpcEndpointResponse(
      updateVpcEndpointDetail: json['UpdateVpcEndpointDetail'] != null
          ? UpdateVpcEndpointDetail.fromJson(
              json['UpdateVpcEndpointDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final updateVpcEndpointDetail = this.updateVpcEndpointDetail;
    return {
      if (updateVpcEndpointDetail != null)
        'UpdateVpcEndpointDetail': updateVpcEndpointDetail,
    };
  }
}

class CreateAccessPolicyResponse {
  /// Details about the created access policy.
  final AccessPolicyDetail? accessPolicyDetail;

  CreateAccessPolicyResponse({
    this.accessPolicyDetail,
  });

  factory CreateAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessPolicyResponse(
      accessPolicyDetail: json['accessPolicyDetail'] != null
          ? AccessPolicyDetail.fromJson(
              json['accessPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyDetail = this.accessPolicyDetail;
    return {
      if (accessPolicyDetail != null) 'accessPolicyDetail': accessPolicyDetail,
    };
  }
}

class GetAccessPolicyResponse {
  /// Details about the requested access policy.
  final AccessPolicyDetail? accessPolicyDetail;

  GetAccessPolicyResponse({
    this.accessPolicyDetail,
  });

  factory GetAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessPolicyResponse(
      accessPolicyDetail: json['accessPolicyDetail'] != null
          ? AccessPolicyDetail.fromJson(
              json['accessPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyDetail = this.accessPolicyDetail;
    return {
      if (accessPolicyDetail != null) 'accessPolicyDetail': accessPolicyDetail,
    };
  }
}

class UpdateAccessPolicyResponse {
  /// Details about the updated access policy.
  final AccessPolicyDetail? accessPolicyDetail;

  UpdateAccessPolicyResponse({
    this.accessPolicyDetail,
  });

  factory UpdateAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccessPolicyResponse(
      accessPolicyDetail: json['accessPolicyDetail'] != null
          ? AccessPolicyDetail.fromJson(
              json['accessPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyDetail = this.accessPolicyDetail;
    return {
      if (accessPolicyDetail != null) 'accessPolicyDetail': accessPolicyDetail,
    };
  }
}

class DeleteAccessPolicyResponse {
  DeleteAccessPolicyResponse();

  factory DeleteAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListAccessPoliciesResponse {
  /// Details about the requested access policies.
  final List<AccessPolicySummary>? accessPolicySummaries;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListAccessPoliciesResponse({
    this.accessPolicySummaries,
    this.nextToken,
  });

  factory ListAccessPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPoliciesResponse(
      accessPolicySummaries: (json['accessPolicySummaries'] as List?)
          ?.nonNulls
          .map((e) => AccessPolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicySummaries = this.accessPolicySummaries;
    final nextToken = this.nextToken;
    return {
      if (accessPolicySummaries != null)
        'accessPolicySummaries': accessPolicySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateCollectionResponse {
  /// Details about the collection.
  final CreateCollectionDetail? createCollectionDetail;

  CreateCollectionResponse({
    this.createCollectionDetail,
  });

  factory CreateCollectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateCollectionResponse(
      createCollectionDetail: json['createCollectionDetail'] != null
          ? CreateCollectionDetail.fromJson(
              json['createCollectionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createCollectionDetail = this.createCollectionDetail;
    return {
      if (createCollectionDetail != null)
        'createCollectionDetail': createCollectionDetail,
    };
  }
}

class UpdateCollectionResponse {
  /// Details about the updated collection.
  final UpdateCollectionDetail? updateCollectionDetail;

  UpdateCollectionResponse({
    this.updateCollectionDetail,
  });

  factory UpdateCollectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCollectionResponse(
      updateCollectionDetail: json['updateCollectionDetail'] != null
          ? UpdateCollectionDetail.fromJson(
              json['updateCollectionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final updateCollectionDetail = this.updateCollectionDetail;
    return {
      if (updateCollectionDetail != null)
        'updateCollectionDetail': updateCollectionDetail,
    };
  }
}

class DeleteCollectionResponse {
  /// Details of the deleted collection.
  final DeleteCollectionDetail? deleteCollectionDetail;

  DeleteCollectionResponse({
    this.deleteCollectionDetail,
  });

  factory DeleteCollectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCollectionResponse(
      deleteCollectionDetail: json['deleteCollectionDetail'] != null
          ? DeleteCollectionDetail.fromJson(
              json['deleteCollectionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteCollectionDetail = this.deleteCollectionDetail;
    return {
      if (deleteCollectionDetail != null)
        'deleteCollectionDetail': deleteCollectionDetail,
    };
  }
}

class ListCollectionsResponse {
  /// Details about each collection.
  final List<CollectionSummary>? collectionSummaries;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListCollectionsResponse({
    this.collectionSummaries,
    this.nextToken,
  });

  factory ListCollectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListCollectionsResponse(
      collectionSummaries: (json['collectionSummaries'] as List?)
          ?.nonNulls
          .map((e) => CollectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionSummaries = this.collectionSummaries;
    final nextToken = this.nextToken;
    return {
      if (collectionSummaries != null)
        'collectionSummaries': collectionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateCollectionGroupResponse {
  /// Details about the created collection group.
  final CreateCollectionGroupDetail? createCollectionGroupDetail;

  CreateCollectionGroupResponse({
    this.createCollectionGroupDetail,
  });

  factory CreateCollectionGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateCollectionGroupResponse(
      createCollectionGroupDetail: json['createCollectionGroupDetail'] != null
          ? CreateCollectionGroupDetail.fromJson(
              json['createCollectionGroupDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createCollectionGroupDetail = this.createCollectionGroupDetail;
    return {
      if (createCollectionGroupDetail != null)
        'createCollectionGroupDetail': createCollectionGroupDetail,
    };
  }
}

class UpdateCollectionGroupResponse {
  /// Details about the updated collection group.
  final UpdateCollectionGroupDetail? updateCollectionGroupDetail;

  UpdateCollectionGroupResponse({
    this.updateCollectionGroupDetail,
  });

  factory UpdateCollectionGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCollectionGroupResponse(
      updateCollectionGroupDetail: json['updateCollectionGroupDetail'] != null
          ? UpdateCollectionGroupDetail.fromJson(
              json['updateCollectionGroupDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final updateCollectionGroupDetail = this.updateCollectionGroupDetail;
    return {
      if (updateCollectionGroupDetail != null)
        'updateCollectionGroupDetail': updateCollectionGroupDetail,
    };
  }
}

class DeleteCollectionGroupResponse {
  DeleteCollectionGroupResponse();

  factory DeleteCollectionGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCollectionGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListCollectionGroupsResponse {
  /// Details about each collection group.
  final List<CollectionGroupSummary>? collectionGroupSummaries;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListCollectionGroupsResponse({
    this.collectionGroupSummaries,
    this.nextToken,
  });

  factory ListCollectionGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListCollectionGroupsResponse(
      collectionGroupSummaries: (json['collectionGroupSummaries'] as List?)
          ?.nonNulls
          .map(
              (e) => CollectionGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionGroupSummaries = this.collectionGroupSummaries;
    final nextToken = this.nextToken;
    return {
      if (collectionGroupSummaries != null)
        'collectionGroupSummaries': collectionGroupSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateIndexResponse {
  CreateIndexResponse();

  factory CreateIndexResponse.fromJson(Map<String, dynamic> _) {
    return CreateIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetIndexResponse {
  /// The JSON schema definition for the index, including field mappings and
  /// settings.
  final Object? indexSchema;

  GetIndexResponse({
    this.indexSchema,
  });

  factory GetIndexResponse.fromJson(Map<String, dynamic> json) {
    return GetIndexResponse(
      indexSchema: json['indexSchema'],
    );
  }

  Map<String, dynamic> toJson() {
    final indexSchema = this.indexSchema;
    return {
      if (indexSchema != null) 'indexSchema': indexSchema,
    };
  }
}

class UpdateIndexResponse {
  UpdateIndexResponse();

  factory UpdateIndexResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIndexResponse {
  DeleteIndexResponse();

  factory DeleteIndexResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLifecyclePolicyResponse {
  /// Details about the updated lifecycle policy.
  final LifecyclePolicyDetail? lifecyclePolicyDetail;

  UpdateLifecyclePolicyResponse({
    this.lifecyclePolicyDetail,
  });

  factory UpdateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLifecyclePolicyResponse(
      lifecyclePolicyDetail: json['lifecyclePolicyDetail'] != null
          ? LifecyclePolicyDetail.fromJson(
              json['lifecyclePolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyDetail = this.lifecyclePolicyDetail;
    return {
      if (lifecyclePolicyDetail != null)
        'lifecyclePolicyDetail': lifecyclePolicyDetail,
    };
  }
}

class DeleteLifecyclePolicyResponse {
  DeleteLifecyclePolicyResponse();

  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLifecyclePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListLifecyclePoliciesResponse {
  /// Details about the requested lifecycle policies.
  final List<LifecyclePolicySummary>? lifecyclePolicySummaries;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListLifecyclePoliciesResponse({
    this.lifecyclePolicySummaries,
    this.nextToken,
  });

  factory ListLifecyclePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListLifecyclePoliciesResponse(
      lifecyclePolicySummaries: (json['lifecyclePolicySummaries'] as List?)
          ?.nonNulls
          .map(
              (e) => LifecyclePolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicySummaries = this.lifecyclePolicySummaries;
    final nextToken = this.nextToken;
    return {
      if (lifecyclePolicySummaries != null)
        'lifecyclePolicySummaries': lifecyclePolicySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateSecurityConfigResponse {
  /// Details about the created security configuration.
  final SecurityConfigDetail? securityConfigDetail;

  CreateSecurityConfigResponse({
    this.securityConfigDetail,
  });

  factory CreateSecurityConfigResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecurityConfigResponse(
      securityConfigDetail: json['securityConfigDetail'] != null
          ? SecurityConfigDetail.fromJson(
              json['securityConfigDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityConfigDetail = this.securityConfigDetail;
    return {
      if (securityConfigDetail != null)
        'securityConfigDetail': securityConfigDetail,
    };
  }
}

class GetSecurityConfigResponse {
  /// Details of the requested security configuration.
  final SecurityConfigDetail? securityConfigDetail;

  GetSecurityConfigResponse({
    this.securityConfigDetail,
  });

  factory GetSecurityConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetSecurityConfigResponse(
      securityConfigDetail: json['securityConfigDetail'] != null
          ? SecurityConfigDetail.fromJson(
              json['securityConfigDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityConfigDetail = this.securityConfigDetail;
    return {
      if (securityConfigDetail != null)
        'securityConfigDetail': securityConfigDetail,
    };
  }
}

class UpdateSecurityConfigResponse {
  /// Details about the updated security configuration.
  final SecurityConfigDetail? securityConfigDetail;

  UpdateSecurityConfigResponse({
    this.securityConfigDetail,
  });

  factory UpdateSecurityConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityConfigResponse(
      securityConfigDetail: json['securityConfigDetail'] != null
          ? SecurityConfigDetail.fromJson(
              json['securityConfigDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityConfigDetail = this.securityConfigDetail;
    return {
      if (securityConfigDetail != null)
        'securityConfigDetail': securityConfigDetail,
    };
  }
}

class DeleteSecurityConfigResponse {
  DeleteSecurityConfigResponse();

  factory DeleteSecurityConfigResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSecurityConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListSecurityConfigsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// Details about the security configurations in your account.
  final List<SecurityConfigSummary>? securityConfigSummaries;

  ListSecurityConfigsResponse({
    this.nextToken,
    this.securityConfigSummaries,
  });

  factory ListSecurityConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityConfigsResponse(
      nextToken: json['nextToken'] as String?,
      securityConfigSummaries: (json['securityConfigSummaries'] as List?)
          ?.nonNulls
          .map((e) => SecurityConfigSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityConfigSummaries = this.securityConfigSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (securityConfigSummaries != null)
        'securityConfigSummaries': securityConfigSummaries,
    };
  }
}

class GetSecurityPolicyResponse {
  /// Details about the requested security policy.
  final SecurityPolicyDetail? securityPolicyDetail;

  GetSecurityPolicyResponse({
    this.securityPolicyDetail,
  });

  factory GetSecurityPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetSecurityPolicyResponse(
      securityPolicyDetail: json['securityPolicyDetail'] != null
          ? SecurityPolicyDetail.fromJson(
              json['securityPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyDetail = this.securityPolicyDetail;
    return {
      if (securityPolicyDetail != null)
        'securityPolicyDetail': securityPolicyDetail,
    };
  }
}

class UpdateSecurityPolicyResponse {
  /// Details about the updated security policy.
  final SecurityPolicyDetail? securityPolicyDetail;

  UpdateSecurityPolicyResponse({
    this.securityPolicyDetail,
  });

  factory UpdateSecurityPolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityPolicyResponse(
      securityPolicyDetail: json['securityPolicyDetail'] != null
          ? SecurityPolicyDetail.fromJson(
              json['securityPolicyDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyDetail = this.securityPolicyDetail;
    return {
      if (securityPolicyDetail != null)
        'securityPolicyDetail': securityPolicyDetail,
    };
  }
}

class DeleteSecurityPolicyResponse {
  DeleteSecurityPolicyResponse();

  factory DeleteSecurityPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSecurityPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListSecurityPoliciesResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// Details about the security policies in your account.
  final List<SecurityPolicySummary>? securityPolicySummaries;

  ListSecurityPoliciesResponse({
    this.nextToken,
    this.securityPolicySummaries,
  });

  factory ListSecurityPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityPoliciesResponse(
      nextToken: json['nextToken'] as String?,
      securityPolicySummaries: (json['securityPolicySummaries'] as List?)
          ?.nonNulls
          .map((e) => SecurityPolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityPolicySummaries = this.securityPolicySummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (securityPolicySummaries != null)
        'securityPolicySummaries': securityPolicySummaries,
    };
  }
}

class CreateVpcEndpointResponse {
  /// Details about the created interface VPC endpoint.
  final CreateVpcEndpointDetail? createVpcEndpointDetail;

  CreateVpcEndpointResponse({
    this.createVpcEndpointDetail,
  });

  factory CreateVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcEndpointResponse(
      createVpcEndpointDetail: json['createVpcEndpointDetail'] != null
          ? CreateVpcEndpointDetail.fromJson(
              json['createVpcEndpointDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createVpcEndpointDetail = this.createVpcEndpointDetail;
    return {
      if (createVpcEndpointDetail != null)
        'createVpcEndpointDetail': createVpcEndpointDetail,
    };
  }
}

class DeleteVpcEndpointResponse {
  /// Details about the deleted endpoint.
  final DeleteVpcEndpointDetail? deleteVpcEndpointDetail;

  DeleteVpcEndpointResponse({
    this.deleteVpcEndpointDetail,
  });

  factory DeleteVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVpcEndpointResponse(
      deleteVpcEndpointDetail: json['deleteVpcEndpointDetail'] != null
          ? DeleteVpcEndpointDetail.fromJson(
              json['deleteVpcEndpointDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteVpcEndpointDetail = this.deleteVpcEndpointDetail;
    return {
      if (deleteVpcEndpointDetail != null)
        'deleteVpcEndpointDetail': deleteVpcEndpointDetail,
    };
  }
}

class ListVpcEndpointsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// Details about each VPC endpoint, including the name and current status.
  final List<VpcEndpointSummary>? vpcEndpointSummaries;

  ListVpcEndpointsResponse({
    this.nextToken,
    this.vpcEndpointSummaries,
  });

  factory ListVpcEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcEndpointsResponse(
      nextToken: json['nextToken'] as String?,
      vpcEndpointSummaries: (json['vpcEndpointSummaries'] as List?)
          ?.nonNulls
          .map((e) => VpcEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vpcEndpointSummaries = this.vpcEndpointSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (vpcEndpointSummaries != null)
        'vpcEndpointSummaries': vpcEndpointSummaries,
    };
  }
}

/// The VPC endpoint object.
class VpcEndpointSummary {
  /// The unique identifier of the endpoint.
  final String? id;

  /// The name of the endpoint.
  final String? name;

  /// The current status of the endpoint.
  final VpcEndpointStatus? status;

  VpcEndpointSummary({
    this.id,
    this.name,
    this.status,
  });

  factory VpcEndpointSummary.fromJson(Map<String, dynamic> json) {
    return VpcEndpointSummary(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(VpcEndpointStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class VpcEndpointStatus {
  static const pending = VpcEndpointStatus._('PENDING');
  static const deleting = VpcEndpointStatus._('DELETING');
  static const active = VpcEndpointStatus._('ACTIVE');
  static const failed = VpcEndpointStatus._('FAILED');

  final String value;

  const VpcEndpointStatus._(this.value);

  static const values = [pending, deleting, active, failed];

  static VpcEndpointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcEndpointStatus._(value));

  @override
  bool operator ==(other) => other is VpcEndpointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filter the results of a <code>ListVpcEndpoints</code> request.
class VpcEndpointFilters {
  /// The current status of the endpoint.
  final VpcEndpointStatus? status;

  VpcEndpointFilters({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// Deletion details for an OpenSearch Serverless-managed interface endpoint.
class DeleteVpcEndpointDetail {
  /// The unique identifier of the endpoint.
  final String? id;

  /// The name of the endpoint.
  final String? name;

  /// The current status of the endpoint deletion process.
  final VpcEndpointStatus? status;

  DeleteVpcEndpointDetail({
    this.id,
    this.name,
    this.status,
  });

  factory DeleteVpcEndpointDetail.fromJson(Map<String, dynamic> json) {
    return DeleteVpcEndpointDetail(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(VpcEndpointStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// Creation details for an OpenSearch Serverless-managed interface endpoint.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html">Access
/// Amazon OpenSearch Serverless using an interface endpoint</a>.
class CreateVpcEndpointDetail {
  /// The unique identifier of the endpoint.
  final String? id;

  /// The name of the endpoint.
  final String? name;

  /// The current status in the endpoint creation process.
  final VpcEndpointStatus? status;

  CreateVpcEndpointDetail({
    this.id,
    this.name,
    this.status,
  });

  factory CreateVpcEndpointDetail.fromJson(Map<String, dynamic> json) {
    return CreateVpcEndpointDetail(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(VpcEndpointStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// A summary of a security policy for OpenSearch Serverless.
class SecurityPolicySummary {
  /// The date the policy was created.
  final int? createdDate;

  /// The description of the security policy.
  final String? description;

  /// The timestamp of when the policy was last modified.
  final int? lastModifiedDate;

  /// The name of the policy.
  final String? name;

  /// The version of the policy.
  final String? policyVersion;

  /// The type of security policy.
  final SecurityPolicyType? type;

  SecurityPolicySummary({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policyVersion,
    this.type,
  });

  factory SecurityPolicySummary.fromJson(Map<String, dynamic> json) {
    return SecurityPolicySummary(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(SecurityPolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

class SecurityPolicyType {
  static const encryption = SecurityPolicyType._('encryption');
  static const network = SecurityPolicyType._('network');

  final String value;

  const SecurityPolicyType._(this.value);

  static const values = [encryption, network];

  static SecurityPolicyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityPolicyType._(value));

  @override
  bool operator ==(other) =>
      other is SecurityPolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an OpenSearch Serverless security policy.
class SecurityPolicyDetail {
  /// The date the policy was created.
  final int? createdDate;

  /// The description of the security policy.
  final String? description;

  /// The timestamp of when the policy was last modified.
  final int? lastModifiedDate;

  /// The name of the policy.
  final String? name;

  /// The JSON policy document without any whitespaces.
  final Document? policy;

  /// The version of the policy.
  final String? policyVersion;

  /// The type of security policy.
  final SecurityPolicyType? type;

  SecurityPolicyDetail({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policy,
    this.policyVersion,
    this.type,
  });

  factory SecurityPolicyDetail.fromJson(Map<String, dynamic> json) {
    return SecurityPolicyDetail(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policy: json['policy'] != null
          ? Document.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(SecurityPolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policy = this.policy;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policy != null) 'policy': policy,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

/// A summary of a security configuration for OpenSearch Serverless.
class SecurityConfigSummary {
  /// The version of the security configuration.
  final String? configVersion;

  /// The Epoch time when the security configuration was created.
  final int? createdDate;

  /// The description of the security configuration.
  final String? description;

  /// The unique identifier of the security configuration.
  final String? id;

  /// The timestamp of when the configuration was last modified.
  final int? lastModifiedDate;

  /// The type of security configuration.
  final SecurityConfigType? type;

  SecurityConfigSummary({
    this.configVersion,
    this.createdDate,
    this.description,
    this.id,
    this.lastModifiedDate,
    this.type,
  });

  factory SecurityConfigSummary.fromJson(Map<String, dynamic> json) {
    return SecurityConfigSummary(
      configVersion: json['configVersion'] as String?,
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      type: (json['type'] as String?)?.let(SecurityConfigType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final configVersion = this.configVersion;
    final createdDate = this.createdDate;
    final description = this.description;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final type = this.type;
    return {
      if (configVersion != null) 'configVersion': configVersion,
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (type != null) 'type': type.value,
    };
  }
}

class SecurityConfigType {
  static const saml = SecurityConfigType._('saml');
  static const iamidentitycenter = SecurityConfigType._('iamidentitycenter');
  static const iamfederation = SecurityConfigType._('iamfederation');

  final String value;

  const SecurityConfigType._(this.value);

  static const values = [saml, iamidentitycenter, iamfederation];

  static SecurityConfigType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityConfigType._(value));

  @override
  bool operator ==(other) =>
      other is SecurityConfigType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a security configuration for OpenSearch Serverless.
class SecurityConfigDetail {
  /// The version of the security configuration.
  final String? configVersion;

  /// The date the configuration was created.
  final int? createdDate;

  /// The description of the security configuration.
  final String? description;

  /// Describes IAM federation options in the form of a key-value map. Contains
  /// configuration details about how OpenSearch Serverless integrates with
  /// external identity providers through federation.
  final IamFederationConfigOptions? iamFederationOptions;

  /// Describes IAM Identity Center options in the form of a key-value map.
  final IamIdentityCenterConfigOptions? iamIdentityCenterOptions;

  /// The unique identifier of the security configuration.
  final String? id;

  /// The timestamp of when the configuration was last modified.
  final int? lastModifiedDate;

  /// SAML options for the security configuration in the form of a key-value map.
  final SamlConfigOptions? samlOptions;

  /// The type of security configuration.
  final SecurityConfigType? type;

  SecurityConfigDetail({
    this.configVersion,
    this.createdDate,
    this.description,
    this.iamFederationOptions,
    this.iamIdentityCenterOptions,
    this.id,
    this.lastModifiedDate,
    this.samlOptions,
    this.type,
  });

  factory SecurityConfigDetail.fromJson(Map<String, dynamic> json) {
    return SecurityConfigDetail(
      configVersion: json['configVersion'] as String?,
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      iamFederationOptions: json['iamFederationOptions'] != null
          ? IamFederationConfigOptions.fromJson(
              json['iamFederationOptions'] as Map<String, dynamic>)
          : null,
      iamIdentityCenterOptions: json['iamIdentityCenterOptions'] != null
          ? IamIdentityCenterConfigOptions.fromJson(
              json['iamIdentityCenterOptions'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      samlOptions: json['samlOptions'] != null
          ? SamlConfigOptions.fromJson(
              json['samlOptions'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(SecurityConfigType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final configVersion = this.configVersion;
    final createdDate = this.createdDate;
    final description = this.description;
    final iamFederationOptions = this.iamFederationOptions;
    final iamIdentityCenterOptions = this.iamIdentityCenterOptions;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final samlOptions = this.samlOptions;
    final type = this.type;
    return {
      if (configVersion != null) 'configVersion': configVersion,
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (iamFederationOptions != null)
        'iamFederationOptions': iamFederationOptions,
      if (iamIdentityCenterOptions != null)
        'iamIdentityCenterOptions': iamIdentityCenterOptions,
      if (id != null) 'id': id,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (samlOptions != null) 'samlOptions': samlOptions,
      if (type != null) 'type': type.value,
    };
  }
}

/// Describes SAML options for an OpenSearch Serverless security configuration
/// in the form of a key-value map.
class SamlConfigOptions {
  /// The XML IdP metadata file generated from your identity provider.
  final String metadata;

  /// The group attribute for this SAML integration.
  final String? groupAttribute;

  /// Custom entity ID attribute to override the default entity ID for this SAML
  /// integration.
  final String? openSearchServerlessEntityId;

  /// The session timeout, in minutes. Default is 60 minutes (12 hours).
  final int? sessionTimeout;

  /// A user attribute for this SAML integration.
  final String? userAttribute;

  SamlConfigOptions({
    required this.metadata,
    this.groupAttribute,
    this.openSearchServerlessEntityId,
    this.sessionTimeout,
    this.userAttribute,
  });

  factory SamlConfigOptions.fromJson(Map<String, dynamic> json) {
    return SamlConfigOptions(
      metadata: (json['metadata'] as String?) ?? '',
      groupAttribute: json['groupAttribute'] as String?,
      openSearchServerlessEntityId:
          json['openSearchServerlessEntityId'] as String?,
      sessionTimeout: json['sessionTimeout'] as int?,
      userAttribute: json['userAttribute'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final groupAttribute = this.groupAttribute;
    final openSearchServerlessEntityId = this.openSearchServerlessEntityId;
    final sessionTimeout = this.sessionTimeout;
    final userAttribute = this.userAttribute;
    return {
      'metadata': metadata,
      if (groupAttribute != null) 'groupAttribute': groupAttribute,
      if (openSearchServerlessEntityId != null)
        'openSearchServerlessEntityId': openSearchServerlessEntityId,
      if (sessionTimeout != null) 'sessionTimeout': sessionTimeout,
      if (userAttribute != null) 'userAttribute': userAttribute,
    };
  }
}

/// Describes IAM Identity Center options for an OpenSearch Serverless security
/// configuration in the form of a key-value map.
class IamIdentityCenterConfigOptions {
  /// The ARN of the IAM Identity Center application used to integrate with
  /// OpenSearch Serverless.
  final String? applicationArn;

  /// The description of the IAM Identity Center application used to integrate
  /// with OpenSearch Serverless.
  final String? applicationDescription;

  /// The name of the IAM Identity Center application used to integrate with
  /// OpenSearch Serverless.
  final String? applicationName;

  /// The group attribute for this IAM Identity Center integration. Defaults to
  /// <code>GroupId</code>.
  final IamIdentityCenterGroupAttribute? groupAttribute;

  /// The ARN of the IAM Identity Center instance used to integrate with
  /// OpenSearch Serverless.
  final String? instanceArn;

  /// The user attribute for this IAM Identity Center integration. Defaults to
  /// <code>UserId</code>
  final IamIdentityCenterUserAttribute? userAttribute;

  IamIdentityCenterConfigOptions({
    this.applicationArn,
    this.applicationDescription,
    this.applicationName,
    this.groupAttribute,
    this.instanceArn,
    this.userAttribute,
  });

  factory IamIdentityCenterConfigOptions.fromJson(Map<String, dynamic> json) {
    return IamIdentityCenterConfigOptions(
      applicationArn: json['applicationArn'] as String?,
      applicationDescription: json['applicationDescription'] as String?,
      applicationName: json['applicationName'] as String?,
      groupAttribute: (json['groupAttribute'] as String?)
          ?.let(IamIdentityCenterGroupAttribute.fromString),
      instanceArn: json['instanceArn'] as String?,
      userAttribute: (json['userAttribute'] as String?)
          ?.let(IamIdentityCenterUserAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationDescription = this.applicationDescription;
    final applicationName = this.applicationName;
    final groupAttribute = this.groupAttribute;
    final instanceArn = this.instanceArn;
    final userAttribute = this.userAttribute;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (applicationDescription != null)
        'applicationDescription': applicationDescription,
      if (applicationName != null) 'applicationName': applicationName,
      if (groupAttribute != null) 'groupAttribute': groupAttribute.value,
      if (instanceArn != null) 'instanceArn': instanceArn,
      if (userAttribute != null) 'userAttribute': userAttribute.value,
    };
  }
}

/// Describes IAM federation options for an OpenSearch Serverless security
/// configuration in the form of a key-value map. These options define how
/// OpenSearch Serverless integrates with external identity providers using
/// federation.
class IamFederationConfigOptions {
  /// The group attribute for this IAM federation integration. This attribute is
  /// used to map identity provider groups to OpenSearch Serverless permissions.
  final String? groupAttribute;

  /// The user attribute for this IAM federation integration. This attribute is
  /// used to identify users in the federated authentication process.
  final String? userAttribute;

  IamFederationConfigOptions({
    this.groupAttribute,
    this.userAttribute,
  });

  factory IamFederationConfigOptions.fromJson(Map<String, dynamic> json) {
    return IamFederationConfigOptions(
      groupAttribute: json['groupAttribute'] as String?,
      userAttribute: json['userAttribute'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupAttribute = this.groupAttribute;
    final userAttribute = this.userAttribute;
    return {
      if (groupAttribute != null) 'groupAttribute': groupAttribute,
      if (userAttribute != null) 'userAttribute': userAttribute,
    };
  }
}

class IamIdentityCenterUserAttribute {
  static const userId = IamIdentityCenterUserAttribute._('UserId');
  static const userName = IamIdentityCenterUserAttribute._('UserName');
  static const email = IamIdentityCenterUserAttribute._('Email');

  final String value;

  const IamIdentityCenterUserAttribute._(this.value);

  static const values = [userId, userName, email];

  static IamIdentityCenterUserAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IamIdentityCenterUserAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IamIdentityCenterUserAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IamIdentityCenterGroupAttribute {
  static const groupId = IamIdentityCenterGroupAttribute._('GroupId');
  static const groupName = IamIdentityCenterGroupAttribute._('GroupName');

  final String value;

  const IamIdentityCenterGroupAttribute._(this.value);

  static const values = [groupId, groupName];

  static IamIdentityCenterGroupAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IamIdentityCenterGroupAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IamIdentityCenterGroupAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes IAM Identity Center options for updating an OpenSearch Serverless
/// security configuration in the form of a key-value map.
class UpdateIamIdentityCenterConfigOptions {
  /// The group attribute for this IAM Identity Center integration. Defaults to
  /// <code>GroupId</code>.
  final IamIdentityCenterGroupAttribute? groupAttribute;

  /// The user attribute for this IAM Identity Center integration. Defaults to
  /// <code>UserId</code>.
  final IamIdentityCenterUserAttribute? userAttribute;

  UpdateIamIdentityCenterConfigOptions({
    this.groupAttribute,
    this.userAttribute,
  });

  Map<String, dynamic> toJson() {
    final groupAttribute = this.groupAttribute;
    final userAttribute = this.userAttribute;
    return {
      if (groupAttribute != null) 'groupAttribute': groupAttribute.value,
      if (userAttribute != null) 'userAttribute': userAttribute.value,
    };
  }
}

/// Describes IAM Identity Center options for creating an OpenSearch Serverless
/// security configuration in the form of a key-value map.
class CreateIamIdentityCenterConfigOptions {
  /// The ARN of the IAM Identity Center instance used to integrate with
  /// OpenSearch Serverless.
  final String instanceArn;

  /// The group attribute for this IAM Identity Center integration. Defaults to
  /// <code>GroupId</code>.
  final IamIdentityCenterGroupAttribute? groupAttribute;

  /// The user attribute for this IAM Identity Center integration. Defaults to
  /// <code>UserId</code>.
  final IamIdentityCenterUserAttribute? userAttribute;

  CreateIamIdentityCenterConfigOptions({
    required this.instanceArn,
    this.groupAttribute,
    this.userAttribute,
  });

  Map<String, dynamic> toJson() {
    final instanceArn = this.instanceArn;
    final groupAttribute = this.groupAttribute;
    final userAttribute = this.userAttribute;
    return {
      'instanceArn': instanceArn,
      if (groupAttribute != null) 'groupAttribute': groupAttribute.value,
      if (userAttribute != null) 'userAttribute': userAttribute.value,
    };
  }
}

/// A summary of the lifecycle policy.
class LifecyclePolicySummary {
  /// The Epoch time when the lifecycle policy was created.
  final int? createdDate;

  /// The description of the lifecycle policy.
  final String? description;

  /// The date and time when the lifecycle policy was last modified.
  final int? lastModifiedDate;

  /// The name of the lifecycle policy.
  final String? name;

  /// The version of the lifecycle policy.
  final String? policyVersion;

  /// The type of lifecycle policy.
  final LifecyclePolicyType? type;

  LifecyclePolicySummary({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policyVersion,
    this.type,
  });

  factory LifecyclePolicySummary.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicySummary(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(LifecyclePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

class LifecyclePolicyType {
  static const retention = LifecyclePolicyType._('retention');

  final String value;

  const LifecyclePolicyType._(this.value);

  static const values = [retention];

  static LifecyclePolicyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifecyclePolicyType._(value));

  @override
  bool operator ==(other) =>
      other is LifecyclePolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an OpenSearch Serverless lifecycle policy.
class LifecyclePolicyDetail {
  /// The date the lifecycle policy was created.
  final int? createdDate;

  /// The description of the lifecycle policy.
  final String? description;

  /// The timestamp of when the lifecycle policy was last modified.
  final int? lastModifiedDate;

  /// The name of the lifecycle policy.
  final String? name;

  /// The JSON policy document without any whitespaces.
  final Document? policy;

  /// The version of the lifecycle policy.
  final String? policyVersion;

  /// The type of lifecycle policy.
  final LifecyclePolicyType? type;

  LifecyclePolicyDetail({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policy,
    this.policyVersion,
    this.type,
  });

  factory LifecyclePolicyDetail.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyDetail(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policy: json['policy'] != null
          ? Document.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(LifecyclePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policy = this.policy;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policy != null) 'policy': policy,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

/// Summary information about a collection group.
class CollectionGroupSummary {
  /// The Amazon Resource Name (ARN) of the collection group.
  final String? arn;
  final CollectionGroupCapacityLimits? capacityLimits;

  /// The Epoch time when the collection group was created.
  final int? createdDate;

  /// The generation of Amazon OpenSearch Serverless for the collection group.
  final ServerlessGeneration? generation;

  /// The unique identifier of the collection group.
  final String? id;

  /// The name of the collection group.
  final String? name;

  /// The number of collections within the collection group.
  final int? numberOfCollections;

  CollectionGroupSummary({
    this.arn,
    this.capacityLimits,
    this.createdDate,
    this.generation,
    this.id,
    this.name,
    this.numberOfCollections,
  });

  factory CollectionGroupSummary.fromJson(Map<String, dynamic> json) {
    return CollectionGroupSummary(
      arn: json['arn'] as String?,
      capacityLimits: json['capacityLimits'] != null
          ? CollectionGroupCapacityLimits.fromJson(
              json['capacityLimits'] as Map<String, dynamic>)
          : null,
      createdDate: json['createdDate'] as int?,
      generation:
          (json['generation'] as String?)?.let(ServerlessGeneration.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
      numberOfCollections: json['numberOfCollections'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityLimits = this.capacityLimits;
    final createdDate = this.createdDate;
    final generation = this.generation;
    final id = this.id;
    final name = this.name;
    final numberOfCollections = this.numberOfCollections;
    return {
      if (arn != null) 'arn': arn,
      if (capacityLimits != null) 'capacityLimits': capacityLimits,
      if (createdDate != null) 'createdDate': createdDate,
      if (generation != null) 'generation': generation.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numberOfCollections != null)
        'numberOfCollections': numberOfCollections,
    };
  }
}

/// Capacity limits for a collection group. These limits define the minimum and
/// maximum OpenSearch Compute Units (OCUs) for indexing and search operations
/// that can be used by collections in the group.
class CollectionGroupCapacityLimits {
  /// The maximum indexing capacity for collections in the group.
  final double? maxIndexingCapacityInOCU;

  /// The maximum search capacity for collections in the group.
  final double? maxSearchCapacityInOCU;

  /// The minimum indexing capacity for collections in the group.
  final double? minIndexingCapacityInOCU;

  /// The minimum search capacity for collections in the group.
  final double? minSearchCapacityInOCU;

  CollectionGroupCapacityLimits({
    this.maxIndexingCapacityInOCU,
    this.maxSearchCapacityInOCU,
    this.minIndexingCapacityInOCU,
    this.minSearchCapacityInOCU,
  });

  factory CollectionGroupCapacityLimits.fromJson(Map<String, dynamic> json) {
    return CollectionGroupCapacityLimits(
      maxIndexingCapacityInOCU: json['maxIndexingCapacityInOCU'] as double?,
      maxSearchCapacityInOCU: json['maxSearchCapacityInOCU'] as double?,
      minIndexingCapacityInOCU: json['minIndexingCapacityInOCU'] as double?,
      minSearchCapacityInOCU: json['minSearchCapacityInOCU'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxIndexingCapacityInOCU = this.maxIndexingCapacityInOCU;
    final maxSearchCapacityInOCU = this.maxSearchCapacityInOCU;
    final minIndexingCapacityInOCU = this.minIndexingCapacityInOCU;
    final minSearchCapacityInOCU = this.minSearchCapacityInOCU;
    return {
      if (maxIndexingCapacityInOCU != null)
        'maxIndexingCapacityInOCU': maxIndexingCapacityInOCU,
      if (maxSearchCapacityInOCU != null)
        'maxSearchCapacityInOCU': maxSearchCapacityInOCU,
      if (minIndexingCapacityInOCU != null)
        'minIndexingCapacityInOCU': minIndexingCapacityInOCU,
      if (minSearchCapacityInOCU != null)
        'minSearchCapacityInOCU': minSearchCapacityInOCU,
    };
  }
}

class ServerlessGeneration {
  static const classic = ServerlessGeneration._('CLASSIC');
  static const nextgen = ServerlessGeneration._('NEXTGEN');

  final String value;

  const ServerlessGeneration._(this.value);

  static const values = [classic, nextgen];

  static ServerlessGeneration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServerlessGeneration._(value));

  @override
  bool operator ==(other) =>
      other is ServerlessGeneration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the updated collection group.
class UpdateCollectionGroupDetail {
  /// The Amazon Resource Name (ARN) of the collection group.
  final String? arn;

  /// The capacity limits for the collection group, in OpenSearch Compute Units
  /// (OCUs).
  final CollectionGroupCapacityLimits? capacityLimits;

  /// The Epoch time when the collection group was created.
  final int? createdDate;

  /// The description of the collection group.
  final String? description;

  /// The generation of Amazon OpenSearch Serverless for the collection group.
  final ServerlessGeneration? generation;

  /// The unique identifier of the collection group.
  final String? id;

  /// The date and time when the collection group was last modified.
  final int? lastModifiedDate;

  /// The name of the collection group.
  final String? name;

  UpdateCollectionGroupDetail({
    this.arn,
    this.capacityLimits,
    this.createdDate,
    this.description,
    this.generation,
    this.id,
    this.lastModifiedDate,
    this.name,
  });

  factory UpdateCollectionGroupDetail.fromJson(Map<String, dynamic> json) {
    return UpdateCollectionGroupDetail(
      arn: json['arn'] as String?,
      capacityLimits: json['capacityLimits'] != null
          ? CollectionGroupCapacityLimits.fromJson(
              json['capacityLimits'] as Map<String, dynamic>)
          : null,
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      generation:
          (json['generation'] as String?)?.let(ServerlessGeneration.fromString),
      id: json['id'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityLimits = this.capacityLimits;
    final createdDate = this.createdDate;
    final description = this.description;
    final generation = this.generation;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (capacityLimits != null) 'capacityLimits': capacityLimits,
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (generation != null) 'generation': generation.value,
      if (id != null) 'id': id,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
    };
  }
}

/// Details about the created collection group.
class CreateCollectionGroupDetail {
  /// The Amazon Resource Name (ARN) of the collection group.
  final String? arn;

  /// The capacity limits for the collection group, in OpenSearch Compute Units
  /// (OCUs).
  final CollectionGroupCapacityLimits? capacityLimits;

  /// The Epoch time when the collection group was created.
  final int? createdDate;

  /// The description of the collection group.
  final String? description;

  /// The generation of Amazon OpenSearch Serverless for the collection group.
  final ServerlessGeneration? generation;

  /// The unique identifier of the collection group.
  final String? id;

  /// The name of the collection group.
  final String? name;

  /// Indicates whether standby replicas are used for the collection group.
  final StandbyReplicas? standbyReplicas;

  /// A map of key-value pairs associated with the collection group.
  final List<Tag>? tags;

  CreateCollectionGroupDetail({
    this.arn,
    this.capacityLimits,
    this.createdDate,
    this.description,
    this.generation,
    this.id,
    this.name,
    this.standbyReplicas,
    this.tags,
  });

  factory CreateCollectionGroupDetail.fromJson(Map<String, dynamic> json) {
    return CreateCollectionGroupDetail(
      arn: json['arn'] as String?,
      capacityLimits: json['capacityLimits'] != null
          ? CollectionGroupCapacityLimits.fromJson(
              json['capacityLimits'] as Map<String, dynamic>)
          : null,
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      generation:
          (json['generation'] as String?)?.let(ServerlessGeneration.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
      standbyReplicas:
          (json['standbyReplicas'] as String?)?.let(StandbyReplicas.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityLimits = this.capacityLimits;
    final createdDate = this.createdDate;
    final description = this.description;
    final generation = this.generation;
    final id = this.id;
    final name = this.name;
    final standbyReplicas = this.standbyReplicas;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (capacityLimits != null) 'capacityLimits': capacityLimits,
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (generation != null) 'generation': generation.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (standbyReplicas != null) 'standbyReplicas': standbyReplicas.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class StandbyReplicas {
  static const enabled = StandbyReplicas._('ENABLED');
  static const disabled = StandbyReplicas._('DISABLED');

  final String value;

  const StandbyReplicas._(this.value);

  static const values = [enabled, disabled];

  static StandbyReplicas fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StandbyReplicas._(value));

  @override
  bool operator ==(other) => other is StandbyReplicas && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A map of key-value pairs associated to an OpenSearch Serverless resource.
class Tag {
  /// The key to use in the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Details about each OpenSearch Serverless collection.
class CollectionSummary {
  /// The Amazon Resource Name (ARN) of the collection.
  final String? arn;

  /// The name of the collection group that contains this collection.
  final String? collectionGroupName;

  /// The unique identifier of the collection.
  final String? id;

  /// The ARN of the Amazon Web Services Key Management Service key used to
  /// encrypt the collection.
  final String? kmsKeyArn;

  /// The name of the collection.
  final String? name;

  /// The current status of the collection.
  final CollectionStatus? status;

  CollectionSummary({
    this.arn,
    this.collectionGroupName,
    this.id,
    this.kmsKeyArn,
    this.name,
    this.status,
  });

  factory CollectionSummary.fromJson(Map<String, dynamic> json) {
    return CollectionSummary(
      arn: json['arn'] as String?,
      collectionGroupName: json['collectionGroupName'] as String?,
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(CollectionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collectionGroupName = this.collectionGroupName;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (collectionGroupName != null)
        'collectionGroupName': collectionGroupName,
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class CollectionStatus {
  static const creating = CollectionStatus._('CREATING');
  static const updating = CollectionStatus._('UPDATING');
  static const deleting = CollectionStatus._('DELETING');
  static const active = CollectionStatus._('ACTIVE');
  static const failed = CollectionStatus._('FAILED');
  static const updateFailed = CollectionStatus._('UPDATE_FAILED');

  final String value;

  const CollectionStatus._(this.value);

  static const values = [
    creating,
    updating,
    deleting,
    active,
    failed,
    updateFailed
  ];

  static CollectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CollectionStatus._(value));

  @override
  bool operator ==(other) => other is CollectionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of filter keys that you can use for LIST, UPDATE, and DELETE requests
/// to OpenSearch Serverless collections.
class CollectionFilters {
  /// The name of the collection group to filter by.
  final String? collectionGroupName;

  /// The name of the collection.
  final String? name;

  /// The current status of the collection.
  final CollectionStatus? status;

  CollectionFilters({
    this.collectionGroupName,
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final collectionGroupName = this.collectionGroupName;
    final name = this.name;
    final status = this.status;
    return {
      if (collectionGroupName != null)
        'collectionGroupName': collectionGroupName,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// Details about a deleted OpenSearch Serverless collection.
class DeleteCollectionDetail {
  /// Indicates whether deletion protection is <code>ENABLED</code> or
  /// <code>DISABLED</code> for the collection.
  final DeletionProtection? deletionProtection;

  /// The unique identifier of the collection.
  final String? id;

  /// The name of the collection.
  final String? name;

  /// The current status of the collection.
  final CollectionStatus? status;

  DeleteCollectionDetail({
    this.deletionProtection,
    this.id,
    this.name,
    this.status,
  });

  factory DeleteCollectionDetail.fromJson(Map<String, dynamic> json) {
    return DeleteCollectionDetail(
      deletionProtection: (json['deletionProtection'] as String?)
          ?.let(DeletionProtection.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(CollectionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionProtection = this.deletionProtection;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (deletionProtection != null)
        'deletionProtection': deletionProtection.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// Indicates whether deletion protection is <code>ENABLED</code> or
/// <code>DISABLED</code> for the collection. When deletion protection is
/// <code>ENABLED</code>, the collection cannot be deleted.
class DeletionProtection {
  static const enabled = DeletionProtection._('ENABLED');
  static const disabled = DeletionProtection._('DISABLED');

  final String value;

  const DeletionProtection._(this.value);

  static const values = [enabled, disabled];

  static DeletionProtection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeletionProtection._(value));

  @override
  bool operator ==(other) =>
      other is DeletionProtection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an updated OpenSearch Serverless collection.
class UpdateCollectionDetail {
  /// The Amazon Resource Name (ARN) of the collection.
  final String? arn;

  /// The date and time when the collection was created.
  final int? createdDate;

  /// Indicates whether deletion protection is <code>ENABLED</code> or
  /// <code>DISABLED</code> for the collection.
  final DeletionProtection? deletionProtection;

  /// The description of the collection.
  final String? description;

  /// The unique identifier of the collection.
  final String? id;

  /// The date and time when the collection was last modified.
  final int? lastModifiedDate;

  /// The name of the collection.
  final String? name;

  /// The current status of the collection.
  final CollectionStatus? status;

  /// The collection type.
  final CollectionType? type;

  /// Configuration options for vector search capabilities in the collection.
  final VectorOptions? vectorOptions;

  UpdateCollectionDetail({
    this.arn,
    this.createdDate,
    this.deletionProtection,
    this.description,
    this.id,
    this.lastModifiedDate,
    this.name,
    this.status,
    this.type,
    this.vectorOptions,
  });

  factory UpdateCollectionDetail.fromJson(Map<String, dynamic> json) {
    return UpdateCollectionDetail(
      arn: json['arn'] as String?,
      createdDate: json['createdDate'] as int?,
      deletionProtection: (json['deletionProtection'] as String?)
          ?.let(DeletionProtection.fromString),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(CollectionStatus.fromString),
      type: (json['type'] as String?)?.let(CollectionType.fromString),
      vectorOptions: json['vectorOptions'] != null
          ? VectorOptions.fromJson(
              json['vectorOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final deletionProtection = this.deletionProtection;
    final description = this.description;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final vectorOptions = this.vectorOptions;
    return {
      if (arn != null) 'arn': arn,
      if (createdDate != null) 'createdDate': createdDate,
      if (deletionProtection != null)
        'deletionProtection': deletionProtection.value,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (vectorOptions != null) 'vectorOptions': vectorOptions,
    };
  }
}

class CollectionType {
  static const search = CollectionType._('SEARCH');
  static const timeseries = CollectionType._('TIMESERIES');
  static const vectorsearch = CollectionType._('VECTORSEARCH');

  final String value;

  const CollectionType._(this.value);

  static const values = [search, timeseries, vectorsearch];

  static CollectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CollectionType._(value));

  @override
  bool operator ==(other) => other is CollectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration options for vector search capabilities in an OpenSearch
/// Serverless collection.
class VectorOptions {
  /// Specifies whether serverless vector acceleration is enabled for the
  /// collection.
  final ServerlessVectorAccelerationStatus serverlessVectorAcceleration;

  VectorOptions({
    required this.serverlessVectorAcceleration,
  });

  factory VectorOptions.fromJson(Map<String, dynamic> json) {
    return VectorOptions(
      serverlessVectorAcceleration:
          ServerlessVectorAccelerationStatus.fromString(
              (json['ServerlessVectorAcceleration'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessVectorAcceleration = this.serverlessVectorAcceleration;
    return {
      'ServerlessVectorAcceleration': serverlessVectorAcceleration.value,
    };
  }
}

/// Specifies whether serverless vector acceleration is enabled for the
/// collection.
class ServerlessVectorAccelerationStatus {
  static const enabled = ServerlessVectorAccelerationStatus._('ENABLED');
  static const disabled = ServerlessVectorAccelerationStatus._('DISABLED');
  static const allowed = ServerlessVectorAccelerationStatus._('ALLOWED');

  final String value;

  const ServerlessVectorAccelerationStatus._(this.value);

  static const values = [enabled, disabled, allowed];

  static ServerlessVectorAccelerationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServerlessVectorAccelerationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServerlessVectorAccelerationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the created OpenSearch Serverless collection.
class CreateCollectionDetail {
  /// The Amazon Resource Name (ARN) of the collection.
  final String? arn;

  /// The name of the collection group that contains this collection.
  final String? collectionGroupName;

  /// The Epoch time when the collection was created.
  final int? createdDate;

  /// Indicates whether deletion protection is <code>ENABLED</code> or
  /// <code>DISABLED</code> for the collection.
  final DeletionProtection? deletionProtection;

  /// A description of the collection.
  final String? description;

  /// The unique identifier of the collection.
  final String? id;

  /// The Amazon Resource Name (ARN) of the KMS key with which to encrypt the
  /// collection.
  final String? kmsKeyArn;

  /// The date and time when the collection was last modified.
  final int? lastModifiedDate;

  /// The name of the collection.
  final String? name;

  /// Creates details about an OpenSearch Serverless collection.
  final StandbyReplicas? standbyReplicas;

  /// The current status of the collection.
  final CollectionStatus? status;

  /// The type of collection.
  final CollectionType? type;

  /// Configuration options for vector search capabilities in the collection.
  final VectorOptions? vectorOptions;

  CreateCollectionDetail({
    this.arn,
    this.collectionGroupName,
    this.createdDate,
    this.deletionProtection,
    this.description,
    this.id,
    this.kmsKeyArn,
    this.lastModifiedDate,
    this.name,
    this.standbyReplicas,
    this.status,
    this.type,
    this.vectorOptions,
  });

  factory CreateCollectionDetail.fromJson(Map<String, dynamic> json) {
    return CreateCollectionDetail(
      arn: json['arn'] as String?,
      collectionGroupName: json['collectionGroupName'] as String?,
      createdDate: json['createdDate'] as int?,
      deletionProtection: (json['deletionProtection'] as String?)
          ?.let(DeletionProtection.fromString),
      description: json['description'] as String?,
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      standbyReplicas:
          (json['standbyReplicas'] as String?)?.let(StandbyReplicas.fromString),
      status: (json['status'] as String?)?.let(CollectionStatus.fromString),
      type: (json['type'] as String?)?.let(CollectionType.fromString),
      vectorOptions: json['vectorOptions'] != null
          ? VectorOptions.fromJson(
              json['vectorOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collectionGroupName = this.collectionGroupName;
    final createdDate = this.createdDate;
    final deletionProtection = this.deletionProtection;
    final description = this.description;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final standbyReplicas = this.standbyReplicas;
    final status = this.status;
    final type = this.type;
    final vectorOptions = this.vectorOptions;
    return {
      if (arn != null) 'arn': arn,
      if (collectionGroupName != null)
        'collectionGroupName': collectionGroupName,
      if (createdDate != null) 'createdDate': createdDate,
      if (deletionProtection != null)
        'deletionProtection': deletionProtection.value,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (standbyReplicas != null) 'standbyReplicas': standbyReplicas.value,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (vectorOptions != null) 'vectorOptions': vectorOptions,
    };
  }
}

/// Encryption settings for a collection.
class EncryptionConfig {
  /// Indicates whether to use an Amazon Web Services-owned key for encryption.
  final bool? awsOwnedKey;

  /// The ARN of the Amazon Web Services Key Management Service key used to
  /// encrypt the collection.
  final String? kmsKeyArn;

  EncryptionConfig({
    this.awsOwnedKey,
    this.kmsKeyArn,
  });

  Map<String, dynamic> toJson() {
    final awsOwnedKey = this.awsOwnedKey;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (awsOwnedKey != null) 'aWSOwnedKey': awsOwnedKey,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// A summary of the data access policy.
class AccessPolicySummary {
  /// The Epoch time when the access policy was created.
  final int? createdDate;

  /// The description of the access policy.
  final String? description;

  /// The date and time when the collection was last modified.
  final int? lastModifiedDate;

  /// The name of the access policy.
  final String? name;

  /// The version of the policy.
  final String? policyVersion;

  /// The type of access policy. Currently, the only available type is
  /// <code>data</code>.
  final AccessPolicyType? type;

  AccessPolicySummary({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policyVersion,
    this.type,
  });

  factory AccessPolicySummary.fromJson(Map<String, dynamic> json) {
    return AccessPolicySummary(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(AccessPolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

class AccessPolicyType {
  static const data = AccessPolicyType._('data');

  final String value;

  const AccessPolicyType._(this.value);

  static const values = [data];

  static AccessPolicyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccessPolicyType._(value));

  @override
  bool operator ==(other) => other is AccessPolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an OpenSearch Serverless access policy.
class AccessPolicyDetail {
  /// The date the policy was created.
  final int? createdDate;

  /// The description of the policy.
  final String? description;

  /// The timestamp of when the policy was last modified.
  final int? lastModifiedDate;

  /// The name of the policy.
  final String? name;

  /// The JSON policy document without any whitespaces.
  final Document? policy;

  /// The version of the policy.
  final String? policyVersion;

  /// The type of access policy.
  final AccessPolicyType? type;

  AccessPolicyDetail({
    this.createdDate,
    this.description,
    this.lastModifiedDate,
    this.name,
    this.policy,
    this.policyVersion,
    this.type,
  });

  factory AccessPolicyDetail.fromJson(Map<String, dynamic> json) {
    return AccessPolicyDetail(
      createdDate: json['createdDate'] as int?,
      description: json['description'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      policy: json['policy'] != null
          ? Document.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
      policyVersion: json['policyVersion'] as String?,
      type: (json['type'] as String?)?.let(AccessPolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final policy = this.policy;
    final policyVersion = this.policyVersion;
    final type = this.type;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (description != null) 'description': description,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (policy != null) 'policy': policy,
      if (policyVersion != null) 'policyVersion': policyVersion,
      if (type != null) 'type': type.value,
    };
  }
}

/// Update details for an OpenSearch Serverless-managed interface endpoint.
class UpdateVpcEndpointDetail {
  /// The unique identifier of the endpoint.
  final String? id;

  /// The timestamp of when the endpoint was last modified.
  final int? lastModifiedDate;

  /// The name of the endpoint.
  final String? name;

  /// The unique identifiers of the security groups that define the ports,
  /// protocols, and sources for inbound traffic that you are authorizing into
  /// your endpoint.
  final List<String>? securityGroupIds;

  /// The current status of the endpoint update process.
  final VpcEndpointStatus? status;

  /// The ID of the subnets from which you access OpenSearch Serverless.
  final List<String>? subnetIds;

  UpdateVpcEndpointDetail({
    this.id,
    this.lastModifiedDate,
    this.name,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
  });

  factory UpdateVpcEndpointDetail.fromJson(Map<String, dynamic> json) {
    return UpdateVpcEndpointDetail(
      id: json['id'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(VpcEndpointStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    return {
      if (id != null) 'id': id,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// OpenSearch Serverless-related information for the current account.
class AccountSettingsDetail {
  final CapacityLimits? capacityLimits;

  AccountSettingsDetail({
    this.capacityLimits,
  });

  factory AccountSettingsDetail.fromJson(Map<String, dynamic> json) {
    return AccountSettingsDetail(
      capacityLimits: json['capacityLimits'] != null
          ? CapacityLimits.fromJson(
              json['capacityLimits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityLimits = this.capacityLimits;
    return {
      if (capacityLimits != null) 'capacityLimits': capacityLimits,
    };
  }
}

/// The maximum capacity limits for all OpenSearch Serverless collections, in
/// OpenSearch Compute Units (OCUs). These limits are used to scale your
/// collections based on the current workload. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html">Managing
/// capacity limits for Amazon OpenSearch Serverless</a>.
class CapacityLimits {
  /// The maximum indexing capacity for collections.
  final int? maxIndexingCapacityInOCU;

  /// The maximum search capacity for collections.
  final int? maxSearchCapacityInOCU;

  CapacityLimits({
    this.maxIndexingCapacityInOCU,
    this.maxSearchCapacityInOCU,
  });

  factory CapacityLimits.fromJson(Map<String, dynamic> json) {
    return CapacityLimits(
      maxIndexingCapacityInOCU: json['maxIndexingCapacityInOCU'] as int?,
      maxSearchCapacityInOCU: json['maxSearchCapacityInOCU'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxIndexingCapacityInOCU = this.maxIndexingCapacityInOCU;
    final maxSearchCapacityInOCU = this.maxSearchCapacityInOCU;
    return {
      if (maxIndexingCapacityInOCU != null)
        'maxIndexingCapacityInOCU': maxIndexingCapacityInOCU,
      if (maxSearchCapacityInOCU != null)
        'maxSearchCapacityInOCU': maxSearchCapacityInOCU,
    };
  }
}

/// Statistics for an OpenSearch Serverless access policy.
class AccessPolicyStats {
  /// The number of data access policies in the current account.
  final int? dataPolicyCount;

  AccessPolicyStats({
    this.dataPolicyCount,
  });

  factory AccessPolicyStats.fromJson(Map<String, dynamic> json) {
    return AccessPolicyStats(
      dataPolicyCount: json['DataPolicyCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataPolicyCount = this.dataPolicyCount;
    return {
      if (dataPolicyCount != null) 'DataPolicyCount': dataPolicyCount,
    };
  }
}

/// Statistics for an OpenSearch Serverless security policy.
class SecurityPolicyStats {
  /// The number of encryption policies in the current account.
  final int? encryptionPolicyCount;

  /// The number of network policies in the current account.
  final int? networkPolicyCount;

  SecurityPolicyStats({
    this.encryptionPolicyCount,
    this.networkPolicyCount,
  });

  factory SecurityPolicyStats.fromJson(Map<String, dynamic> json) {
    return SecurityPolicyStats(
      encryptionPolicyCount: json['EncryptionPolicyCount'] as int?,
      networkPolicyCount: json['NetworkPolicyCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionPolicyCount = this.encryptionPolicyCount;
    final networkPolicyCount = this.networkPolicyCount;
    return {
      if (encryptionPolicyCount != null)
        'EncryptionPolicyCount': encryptionPolicyCount,
      if (networkPolicyCount != null) 'NetworkPolicyCount': networkPolicyCount,
    };
  }
}

/// Statistics for an OpenSearch Serverless security configuration.
class SecurityConfigStats {
  /// The number of security configurations in the current account.
  final int? samlConfigCount;

  SecurityConfigStats({
    this.samlConfigCount,
  });

  factory SecurityConfigStats.fromJson(Map<String, dynamic> json) {
    return SecurityConfigStats(
      samlConfigCount: json['SamlConfigCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final samlConfigCount = this.samlConfigCount;
    return {
      if (samlConfigCount != null) 'SamlConfigCount': samlConfigCount,
    };
  }
}

/// Statistics for an OpenSearch Serverless lifecycle policy.
class LifecyclePolicyStats {
  /// The number of retention lifecycle policies in the current account.
  final int? retentionPolicyCount;

  LifecyclePolicyStats({
    this.retentionPolicyCount,
  });

  factory LifecyclePolicyStats.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyStats(
      retentionPolicyCount: json['RetentionPolicyCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final retentionPolicyCount = this.retentionPolicyCount;
    return {
      if (retentionPolicyCount != null)
        'RetentionPolicyCount': retentionPolicyCount,
    };
  }
}

/// Error information for a failed <code>BatchGetVpcEndpoint</code> request.
class VpcEndpointErrorDetail {
  /// The error code for the failed request.
  final String? errorCode;

  /// An error message describing the reason for the failure.
  final String? errorMessage;

  /// The unique identifier of the VPC endpoint.
  final String? id;

  VpcEndpointErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory VpcEndpointErrorDetail.fromJson(Map<String, dynamic> json) {
    return VpcEndpointErrorDetail(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// Details about an OpenSearch Serverless-managed interface endpoint.
class VpcEndpointDetail {
  /// The date the endpoint was created.
  final int? createdDate;

  /// A failure code associated with the request.
  final String? failureCode;

  /// A message associated with the failure code.
  final String? failureMessage;

  /// The unique identifier of the endpoint.
  final String? id;

  /// The name of the endpoint.
  final String? name;

  /// The unique identifiers of the security groups that define the ports,
  /// protocols, and sources for inbound traffic that you are authorizing into
  /// your endpoint.
  final List<String>? securityGroupIds;

  /// The current status of the endpoint.
  final VpcEndpointStatus? status;

  /// The ID of the subnets from which you access OpenSearch Serverless.
  final List<String>? subnetIds;

  /// The ID of the VPC from which you access OpenSearch Serverless.
  final String? vpcId;

  VpcEndpointDetail({
    this.createdDate,
    this.failureCode,
    this.failureMessage,
    this.id,
    this.name,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcEndpointDetail.fromJson(Map<String, dynamic> json) {
    return VpcEndpointDetail(
      createdDate: json['createdDate'] as int?,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(VpcEndpointStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (createdDate != null) 'createdDate': createdDate,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Error information for an OpenSearch Serverless request.
class LifecyclePolicyErrorDetail {
  /// The error code for the request. For example, <code>NOT_FOUND</code>.
  final String? errorCode;

  /// A description of the error. For example, <code>The specified Lifecycle
  /// Policy is not found</code>.
  final String? errorMessage;

  /// The name of the lifecycle policy.
  final String? name;

  /// The type of lifecycle policy.
  final LifecyclePolicyType? type;

  LifecyclePolicyErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.name,
    this.type,
  });

  factory LifecyclePolicyErrorDetail.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyErrorDetail(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      name: json['name'] as String?,
      type: (json['type'] as String?)?.let(LifecyclePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final name = this.name;
    final type = this.type;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (name != null) 'name': name,
      if (type != null) 'type': type.value,
    };
  }
}

/// The unique identifiers of policy types and policy names.
class LifecyclePolicyIdentifier {
  /// The name of the lifecycle policy.
  final String name;

  /// The type of lifecycle policy.
  final LifecyclePolicyType type;

  LifecyclePolicyIdentifier({
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type.value,
    };
  }
}

/// Error information for an OpenSearch Serverless request.
class EffectiveLifecyclePolicyErrorDetail {
  /// The error code for the request.
  final String? errorCode;

  /// A description of the error. For example, <code>The specified Index resource
  /// is not found</code>.
  final String? errorMessage;

  /// The name of OpenSearch Serverless index resource.
  final String? resource;

  /// The type of lifecycle policy.
  final LifecyclePolicyType? type;

  EffectiveLifecyclePolicyErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.resource,
    this.type,
  });

  factory EffectiveLifecyclePolicyErrorDetail.fromJson(
      Map<String, dynamic> json) {
    return EffectiveLifecyclePolicyErrorDetail(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      resource: json['resource'] as String?,
      type: (json['type'] as String?)?.let(LifecyclePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final resource = this.resource;
    final type = this.type;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (resource != null) 'resource': resource,
      if (type != null) 'type': type.value,
    };
  }
}

/// Error information for an OpenSearch Serverless request.
class EffectiveLifecyclePolicyDetail {
  /// The minimum number of index retention days set. That is an optional param
  /// that will return as <code>true</code> if the minimum number of days or hours
  /// is not set to a index resource.
  final bool? noMinRetentionPeriod;

  /// The name of the lifecycle policy.
  final String? policyName;

  /// The name of the OpenSearch Serverless index resource.
  final String? resource;

  /// The type of OpenSearch Serverless resource. Currently, the only supported
  /// resource is <code>index</code>.
  final ResourceType? resourceType;

  /// The minimum number of index retention in days or hours. This is an optional
  /// parameter that will return only if it’s set.
  final String? retentionPeriod;

  /// The type of lifecycle policy.
  final LifecyclePolicyType? type;

  EffectiveLifecyclePolicyDetail({
    this.noMinRetentionPeriod,
    this.policyName,
    this.resource,
    this.resourceType,
    this.retentionPeriod,
    this.type,
  });

  factory EffectiveLifecyclePolicyDetail.fromJson(Map<String, dynamic> json) {
    return EffectiveLifecyclePolicyDetail(
      noMinRetentionPeriod: json['noMinRetentionPeriod'] as bool?,
      policyName: json['policyName'] as String?,
      resource: json['resource'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      retentionPeriod: json['retentionPeriod'] as String?,
      type: (json['type'] as String?)?.let(LifecyclePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final noMinRetentionPeriod = this.noMinRetentionPeriod;
    final policyName = this.policyName;
    final resource = this.resource;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final type = this.type;
    return {
      if (noMinRetentionPeriod != null)
        'noMinRetentionPeriod': noMinRetentionPeriod,
      if (policyName != null) 'policyName': policyName,
      if (resource != null) 'resource': resource,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (type != null) 'type': type.value,
    };
  }
}

class ResourceType {
  static const $index = ResourceType._('index');

  final String value;

  const ResourceType._(this.value);

  static const values = [$index];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The unique identifiers of policy types and resource names.
class LifecyclePolicyResourceIdentifier {
  /// The name of the OpenSearch Serverless ilndex resource.
  final String resource;

  /// The type of lifecycle policy.
  final LifecyclePolicyType type;

  LifecyclePolicyResourceIdentifier({
    required this.resource,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final type = this.type;
    return {
      'resource': resource,
      'type': type.value,
    };
  }
}

/// Error details for a collection group operation.
class CollectionGroupErrorDetail {
  /// The error code for the request. For example, <code>NOT_FOUND</code>.
  final String? errorCode;

  /// A description of the error. For example, <code>The specified Collection
  /// Group is not found.</code>
  final String? errorMessage;

  /// If the request contains collection group IDs, the response includes the IDs
  /// provided in the request.
  final String? id;

  /// If the request contains collection group names, the response includes the
  /// names provided in the request.
  final String? name;

  CollectionGroupErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.id,
    this.name,
  });

  factory CollectionGroupErrorDetail.fromJson(Map<String, dynamic> json) {
    return CollectionGroupErrorDetail(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final name = this.name;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Details about a collection group.
class CollectionGroupDetail {
  /// The Amazon Resource Name (ARN) of the collection group.
  final String? arn;

  /// The capacity limits for the collection group, in OpenSearch Compute Units
  /// (OCUs).
  final CollectionGroupCapacityLimits? capacityLimits;

  /// The Epoch time when the collection group was created.
  final int? createdDate;

  /// Current search and indexing capacity for the collection group.
  final CurrentCapacity? currentCapacity;

  /// The description of the collection group.
  final String? description;

  /// The generation of Amazon OpenSearch Serverless for the collection group.
  final ServerlessGeneration? generation;

  /// The unique identifier of the collection group.
  final String? id;

  /// The name of the collection group.
  final String? name;

  /// The number of collections associated with the collection group.
  final int? numberOfCollections;

  /// Indicates whether standby replicas are used for the collection group.
  final StandbyReplicas? standbyReplicas;

  /// A map of key-value pairs associated with the collection group.
  final List<Tag>? tags;

  CollectionGroupDetail({
    this.arn,
    this.capacityLimits,
    this.createdDate,
    this.currentCapacity,
    this.description,
    this.generation,
    this.id,
    this.name,
    this.numberOfCollections,
    this.standbyReplicas,
    this.tags,
  });

  factory CollectionGroupDetail.fromJson(Map<String, dynamic> json) {
    return CollectionGroupDetail(
      arn: json['arn'] as String?,
      capacityLimits: json['capacityLimits'] != null
          ? CollectionGroupCapacityLimits.fromJson(
              json['capacityLimits'] as Map<String, dynamic>)
          : null,
      createdDate: json['createdDate'] as int?,
      currentCapacity: json['currentCapacity'] != null
          ? CurrentCapacity.fromJson(
              json['currentCapacity'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      generation:
          (json['generation'] as String?)?.let(ServerlessGeneration.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
      numberOfCollections: json['numberOfCollections'] as int?,
      standbyReplicas:
          (json['standbyReplicas'] as String?)?.let(StandbyReplicas.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityLimits = this.capacityLimits;
    final createdDate = this.createdDate;
    final currentCapacity = this.currentCapacity;
    final description = this.description;
    final generation = this.generation;
    final id = this.id;
    final name = this.name;
    final numberOfCollections = this.numberOfCollections;
    final standbyReplicas = this.standbyReplicas;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (capacityLimits != null) 'capacityLimits': capacityLimits,
      if (createdDate != null) 'createdDate': createdDate,
      if (currentCapacity != null) 'currentCapacity': currentCapacity,
      if (description != null) 'description': description,
      if (generation != null) 'generation': generation.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numberOfCollections != null)
        'numberOfCollections': numberOfCollections,
      if (standbyReplicas != null) 'standbyReplicas': standbyReplicas.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Current search and indexing capacity for an OpenSearch Serverless collection
/// group. Measured in OpenSearch Compute Units (OCUs).
class CurrentCapacity {
  /// The indexing capacity for the collection group.
  final CapacityDetails? indexing;

  /// The search capacity for the collection group.
  final CapacityDetails? search;

  CurrentCapacity({
    this.indexing,
    this.search,
  });

  factory CurrentCapacity.fromJson(Map<String, dynamic> json) {
    return CurrentCapacity(
      indexing: json['indexing'] != null
          ? CapacityDetails.fromJson(json['indexing'] as Map<String, dynamic>)
          : null,
      search: json['search'] != null
          ? CapacityDetails.fromJson(json['search'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexing = this.indexing;
    final search = this.search;
    return {
      if (indexing != null) 'indexing': indexing,
      if (search != null) 'search': search,
    };
  }
}

/// Capacity details for an OpenSearch Serverless collection group, including
/// the current capacity and autoscaling status.
class CapacityDetails {
  /// The current autoscaling status for the collection group.
  final AutoscalingStatus? autoscalingStatus;

  /// The current capacity in OpenSearch Compute Units (OCUs).
  final double? capacityInOcu;

  CapacityDetails({
    this.autoscalingStatus,
    this.capacityInOcu,
  });

  factory CapacityDetails.fromJson(Map<String, dynamic> json) {
    return CapacityDetails(
      autoscalingStatus: (json['autoscalingStatus'] as String?)
          ?.let(AutoscalingStatus.fromString),
      capacityInOcu: json['capacityInOcu'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoscalingStatus = this.autoscalingStatus;
    final capacityInOcu = this.capacityInOcu;
    return {
      if (autoscalingStatus != null)
        'autoscalingStatus': autoscalingStatus.value,
      if (capacityInOcu != null) 'capacityInOcu': capacityInOcu,
    };
  }
}

/// The autoscaling status of an OpenSearch Serverless collection group:
/// <code>ACTION_SCALING_UP</code>, <code>ACTION_SCALING_DOWN</code>, or
/// <code>NO_ACTION</code>.
class AutoscalingStatus {
  static const actionScalingUp = AutoscalingStatus._('ACTION_SCALING_UP');
  static const actionScalingDown = AutoscalingStatus._('ACTION_SCALING_DOWN');
  static const noAction = AutoscalingStatus._('NO_ACTION');

  final String value;

  const AutoscalingStatus._(this.value);

  static const values = [actionScalingUp, actionScalingDown, noAction];

  static AutoscalingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoscalingStatus._(value));

  @override
  bool operator ==(other) => other is AutoscalingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Error information for an OpenSearch Serverless request.
class CollectionErrorDetail {
  /// The error code for the request. For example, <code>NOT_FOUND</code>.
  final String? errorCode;

  /// A description of the error. For example, <code>The specified Collection is
  /// not found.</code>
  final String? errorMessage;

  /// If the request contains collection IDs, the response includes the IDs
  /// provided in the request.
  final String? id;

  /// If the request contains collection names, the response includes the names
  /// provided in the request.
  final String? name;

  CollectionErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.id,
    this.name,
  });

  factory CollectionErrorDetail.fromJson(Map<String, dynamic> json) {
    return CollectionErrorDetail(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final name = this.name;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Details about each OpenSearch Serverless collection, including the
/// collection endpoint, the OpenSearch Dashboards endpoint, and FIPS-compliant
/// endpoints for federal government workloads.
class CollectionDetail {
  /// The Amazon Resource Name (ARN) of the collection.
  final String? arn;

  /// Collection-specific endpoint used to submit index, search, and data upload
  /// requests to an OpenSearch Serverless collection.
  final String? collectionEndpoint;

  /// The name of the collection group that contains this collection.
  final String? collectionGroupName;

  /// The Epoch time when the collection was created.
  final int? createdDate;

  /// Collection-specific endpoint used to access OpenSearch Dashboards.
  final String? dashboardEndpoint;

  /// Indicates whether deletion protection is <code>ENABLED</code> or
  /// <code>DISABLED</code> for the collection.
  final DeletionProtection? deletionProtection;

  /// A description of the collection.
  final String? description;

  /// A failure code associated with the request.
  final String? failureCode;

  /// A message associated with the failure code.
  final String? failureMessage;

  /// FIPS-compliant endpoints for the collection. These endpoints use FIPS 140-3
  /// validated cryptographic modules and are required for federal government
  /// workloads that must comply with FedRAMP security standards.
  final FipsEndpoints? fipsEndpoints;

  /// A unique identifier for the collection.
  final String? id;

  /// The ARN of the Amazon Web Services KMS key used to encrypt the collection.
  final String? kmsKeyArn;

  /// The date and time when the collection was last modified.
  final int? lastModifiedDate;

  /// The name of the collection.
  final String? name;

  /// Details about an OpenSearch Serverless collection.
  final StandbyReplicas? standbyReplicas;

  /// The current status of the collection.
  final CollectionStatus? status;

  /// The type of collection.
  final CollectionType? type;

  /// Configuration options for vector search capabilities in the collection.
  final VectorOptions? vectorOptions;

  CollectionDetail({
    this.arn,
    this.collectionEndpoint,
    this.collectionGroupName,
    this.createdDate,
    this.dashboardEndpoint,
    this.deletionProtection,
    this.description,
    this.failureCode,
    this.failureMessage,
    this.fipsEndpoints,
    this.id,
    this.kmsKeyArn,
    this.lastModifiedDate,
    this.name,
    this.standbyReplicas,
    this.status,
    this.type,
    this.vectorOptions,
  });

  factory CollectionDetail.fromJson(Map<String, dynamic> json) {
    return CollectionDetail(
      arn: json['arn'] as String?,
      collectionEndpoint: json['collectionEndpoint'] as String?,
      collectionGroupName: json['collectionGroupName'] as String?,
      createdDate: json['createdDate'] as int?,
      dashboardEndpoint: json['dashboardEndpoint'] as String?,
      deletionProtection: (json['deletionProtection'] as String?)
          ?.let(DeletionProtection.fromString),
      description: json['description'] as String?,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      fipsEndpoints: json['fipsEndpoints'] != null
          ? FipsEndpoints.fromJson(
              json['fipsEndpoints'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as int?,
      name: json['name'] as String?,
      standbyReplicas:
          (json['standbyReplicas'] as String?)?.let(StandbyReplicas.fromString),
      status: (json['status'] as String?)?.let(CollectionStatus.fromString),
      type: (json['type'] as String?)?.let(CollectionType.fromString),
      vectorOptions: json['vectorOptions'] != null
          ? VectorOptions.fromJson(
              json['vectorOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collectionEndpoint = this.collectionEndpoint;
    final collectionGroupName = this.collectionGroupName;
    final createdDate = this.createdDate;
    final dashboardEndpoint = this.dashboardEndpoint;
    final deletionProtection = this.deletionProtection;
    final description = this.description;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final fipsEndpoints = this.fipsEndpoints;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final standbyReplicas = this.standbyReplicas;
    final status = this.status;
    final type = this.type;
    final vectorOptions = this.vectorOptions;
    return {
      if (arn != null) 'arn': arn,
      if (collectionEndpoint != null) 'collectionEndpoint': collectionEndpoint,
      if (collectionGroupName != null)
        'collectionGroupName': collectionGroupName,
      if (createdDate != null) 'createdDate': createdDate,
      if (dashboardEndpoint != null) 'dashboardEndpoint': dashboardEndpoint,
      if (deletionProtection != null)
        'deletionProtection': deletionProtection.value,
      if (description != null) 'description': description,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (fipsEndpoints != null) 'fipsEndpoints': fipsEndpoints,
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lastModifiedDate != null) 'lastModifiedDate': lastModifiedDate,
      if (name != null) 'name': name,
      if (standbyReplicas != null) 'standbyReplicas': standbyReplicas.value,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (vectorOptions != null) 'vectorOptions': vectorOptions,
    };
  }
}

/// FIPS-compliant endpoint URLs for an OpenSearch Serverless collection. These
/// endpoints ensure all data transmission uses FIPS 140-3 validated
/// cryptographic implementations, meeting federal security requirements for
/// government workloads.
class FipsEndpoints {
  /// FIPS-compliant collection endpoint used to submit index, search, and data
  /// upload requests to an OpenSearch Serverless collection. This endpoint uses
  /// FIPS 140-3 validated cryptography and is required for federal government
  /// workloads.
  final String? collectionEndpoint;

  /// FIPS-compliant endpoint used to access OpenSearch Dashboards. This endpoint
  /// uses FIPS 140-3 validated cryptography and is required for federal
  /// government workloads that need dashboard visualization capabilities.
  final String? dashboardEndpoint;

  FipsEndpoints({
    this.collectionEndpoint,
    this.dashboardEndpoint,
  });

  factory FipsEndpoints.fromJson(Map<String, dynamic> json) {
    return FipsEndpoints(
      collectionEndpoint: json['collectionEndpoint'] as String?,
      dashboardEndpoint: json['dashboardEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionEndpoint = this.collectionEndpoint;
    final dashboardEndpoint = this.dashboardEndpoint;
    return {
      if (collectionEndpoint != null) 'collectionEndpoint': collectionEndpoint,
      if (dashboardEndpoint != null) 'dashboardEndpoint': dashboardEndpoint,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class OcuLimitExceededException extends _s.GenericAwsException {
  OcuLimitExceededException({String? type, String? message})
      : super(type: type, code: 'OcuLimitExceededException', message: message);
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'OcuLimitExceededException': (type, message) =>
      OcuLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
