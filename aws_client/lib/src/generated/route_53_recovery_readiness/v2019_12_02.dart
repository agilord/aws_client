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

/// Recovery readiness
class Route53RecoveryReadiness {
  final _s.RestJsonProtocol _protocol;
  Route53RecoveryReadiness({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53-recovery-readiness',
            signingName: 'route53-recovery-readiness',
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

  /// Creates a cell in an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cellName] :
  /// The name of the cell to create.
  ///
  /// Parameter [cells] :
  /// A list of cell Amazon Resource Names (ARNs) contained within this cell,
  /// for use in nested cells. For example, Availability Zones within specific
  /// Amazon Web Services Regions.
  Future<CreateCellResponse> createCell({
    required String cellName,
    List<String>? cells,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'cellName': cellName,
      if (cells != null) 'cells': cells,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cells',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCellResponse.fromJson(response);
  }

  /// Creates a cross-account readiness authorization. This lets you authorize
  /// another account to work with Route 53 Application Recovery Controller, for
  /// example, to check the readiness status of resources in a separate account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crossAccountAuthorization] :
  /// The cross-account authorization.
  Future<CreateCrossAccountAuthorizationResponse>
      createCrossAccountAuthorization({
    required String crossAccountAuthorization,
  }) async {
    final $payload = <String, dynamic>{
      'crossAccountAuthorization': crossAccountAuthorization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/crossaccountauthorizations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCrossAccountAuthorizationResponse.fromJson(response);
  }

  /// Creates a readiness check in an account. A readiness check monitors a
  /// resource set in your application, such as a set of Amazon Aurora
  /// instances, that Application Recovery Controller is auditing recovery
  /// readiness for. The audits run once every minute on every resource that's
  /// associated with a readiness check.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// The name of the readiness check to create.
  ///
  /// Parameter [resourceSetName] :
  /// The name of the resource set to check.
  Future<CreateReadinessCheckResponse> createReadinessCheck({
    required String readinessCheckName,
    required String resourceSetName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'readinessCheckName': readinessCheckName,
      'resourceSetName': resourceSetName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/readinesschecks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReadinessCheckResponse.fromJson(response);
  }

  /// Creates a recovery group in an account. A recovery group corresponds to an
  /// application and includes a list of the cells that make up the application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of the recovery group to create.
  ///
  /// Parameter [cells] :
  /// A list of the cell Amazon Resource Names (ARNs) in the recovery group.
  Future<CreateRecoveryGroupResponse> createRecoveryGroup({
    required String recoveryGroupName,
    List<String>? cells,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryGroupName': recoveryGroupName,
      if (cells != null) 'cells': cells,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recoverygroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecoveryGroupResponse.fromJson(response);
  }

  /// Creates a resource set. A resource set is a set of resources of one type
  /// that span multiple cells. You can associate a resource set with a
  /// readiness check to monitor the resources for failover readiness.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceSetName] :
  /// The name of the resource set to create.
  ///
  /// Parameter [resourceSetType] :
  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  ///
  /// Parameter [resources] :
  /// A list of resource objects in the resource set.
  ///
  /// Parameter [tags] :
  /// A tag to associate with the parameters for a resource set.
  Future<CreateResourceSetResponse> createResourceSet({
    required String resourceSetName,
    required String resourceSetType,
    required List<Resource> resources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceSetName': resourceSetName,
      'resourceSetType': resourceSetType,
      'resources': resources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resourcesets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceSetResponse.fromJson(response);
  }

  /// Delete a cell. When successful, the response code is 204, with no response
  /// body.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cellName] :
  /// The name of the cell.
  Future<void> deleteCell({
    required String cellName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cells/${Uri.encodeComponent(cellName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes cross account readiness authorization.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crossAccountAuthorization] :
  /// The cross-account authorization.
  Future<void> deleteCrossAccountAuthorization({
    required String crossAccountAuthorization,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/crossaccountauthorizations/${Uri.encodeComponent(crossAccountAuthorization)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a readiness check.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// Name of a readiness check.
  Future<void> deleteReadinessCheck({
    required String readinessCheckName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/readinesschecks/${Uri.encodeComponent(readinessCheckName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a recovery group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of a recovery group.
  Future<void> deleteRecoveryGroup({
    required String recoveryGroupName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/recoverygroups/${Uri.encodeComponent(recoveryGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a resource set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceSetName] :
  /// Name of a resource set.
  Future<void> deleteResourceSet({
    required String resourceSetName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resourcesets/${Uri.encodeComponent(resourceSetName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets recommendations about architecture designs for improving resiliency
  /// for an application, based on a recovery group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of a recovery group.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<GetArchitectureRecommendationsResponse>
      getArchitectureRecommendations({
    required String recoveryGroupName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/recoverygroups/${Uri.encodeComponent(recoveryGroupName)}/architectureRecommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetArchitectureRecommendationsResponse.fromJson(response);
  }

  /// Gets information about a cell including cell name, cell Amazon Resource
  /// Name (ARN), ARNs of nested cells for this cell, and a list of those cell
  /// ARNs with their associated recovery group ARNs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cellName] :
  /// The name of the cell.
  Future<GetCellResponse> getCell({
    required String cellName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cells/${Uri.encodeComponent(cellName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCellResponse.fromJson(response);
  }

  /// Gets readiness for a cell. Aggregates the readiness of all the resources
  /// that are associated with the cell into a single value.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cellName] :
  /// The name of the cell.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<GetCellReadinessSummaryResponse> getCellReadinessSummary({
    required String cellName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cellreadiness/${Uri.encodeComponent(cellName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCellReadinessSummaryResponse.fromJson(response);
  }

  /// Gets details about a readiness check.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// Name of a readiness check.
  Future<GetReadinessCheckResponse> getReadinessCheck({
    required String readinessCheckName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/readinesschecks/${Uri.encodeComponent(readinessCheckName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReadinessCheckResponse.fromJson(response);
  }

  /// Gets individual readiness status for a readiness check. To see the overall
  /// readiness status for a recovery group, that considers the readiness status
  /// for all the readiness checks in the recovery group, use
  /// GetRecoveryGroupReadinessSummary.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// Name of a readiness check.
  ///
  /// Parameter [resourceIdentifier] :
  /// The resource identifier, which is the Amazon Resource Name (ARN) or the
  /// identifier generated for the resource by Application Recovery Controller
  /// (for example, for a DNS target resource).
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<GetReadinessCheckResourceStatusResponse>
      getReadinessCheckResourceStatus({
    required String readinessCheckName,
    required String resourceIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/readinesschecks/${Uri.encodeComponent(readinessCheckName)}/resource/${Uri.encodeComponent(resourceIdentifier)}/status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReadinessCheckResourceStatusResponse.fromJson(response);
  }

  /// Gets the readiness status for an individual readiness check. To see the
  /// overall readiness status for a recovery group, that considers the
  /// readiness status for all the readiness checks in a recovery group, use
  /// GetRecoveryGroupReadinessSummary.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// Name of a readiness check.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<GetReadinessCheckStatusResponse> getReadinessCheckStatus({
    required String readinessCheckName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/readinesschecks/${Uri.encodeComponent(readinessCheckName)}/status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReadinessCheckStatusResponse.fromJson(response);
  }

  /// Gets details about a recovery group, including a list of the cells that
  /// are included in it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of a recovery group.
  Future<GetRecoveryGroupResponse> getRecoveryGroup({
    required String recoveryGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recoverygroups/${Uri.encodeComponent(recoveryGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryGroupResponse.fromJson(response);
  }

  /// Displays a summary of information about a recovery group's readiness
  /// status. Includes the readiness checks for resources in the recovery group
  /// and the readiness status of each one.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of a recovery group.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<GetRecoveryGroupReadinessSummaryResponse>
      getRecoveryGroupReadinessSummary({
    required String recoveryGroupName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/recoverygroupreadiness/${Uri.encodeComponent(recoveryGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryGroupReadinessSummaryResponse.fromJson(response);
  }

  /// Displays the details about a resource set, including a list of the
  /// resources in the set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceSetName] :
  /// Name of a resource set.
  Future<GetResourceSetResponse> getResourceSet({
    required String resourceSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcesets/${Uri.encodeComponent(resourceSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceSetResponse.fromJson(response);
  }

  /// Lists the cells for an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListCellsResponse> listCells({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cells',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCellsResponse.fromJson(response);
  }

  /// Lists the cross-account readiness authorizations that are in place for an
  /// account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListCrossAccountAuthorizationsResponse>
      listCrossAccountAuthorizations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/crossaccountauthorizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCrossAccountAuthorizationsResponse.fromJson(response);
  }

  /// Lists the readiness checks for an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListReadinessChecksResponse> listReadinessChecks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/readinesschecks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadinessChecksResponse.fromJson(response);
  }

  /// Lists the recovery groups in an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListRecoveryGroupsResponse> listRecoveryGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recoverygroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryGroupsResponse.fromJson(response);
  }

  /// Lists the resource sets in an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListResourceSetsResponse> listResourceSets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcesets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceSetsResponse.fromJson(response);
  }

  /// Lists all readiness rules, or lists the readiness rules for a specific
  /// resource type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  ///
  /// Parameter [resourceType] :
  /// The resource type that a readiness rule applies to.
  Future<ListRulesResponse> listRules({
    int? maxResults,
    String? nextToken,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRulesResponse.fromJson(response);
  }

  /// Lists the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a resource.
  Future<ListTagsForResourcesResponse> listTagsForResources({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourcesResponse.fromJson(response);
  }

  /// Adds a tag to a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a resource.
  ///
  /// Parameter [tags] :
  ///
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

  /// Removes a tag from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a resource.
  ///
  /// Parameter [tagKeys] :
  /// The keys for tags you add to resources.
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

  /// Updates a cell to replace the list of nested cells with a new list of
  /// nested cells.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cellName] :
  /// The name of the cell.
  ///
  /// Parameter [cells] :
  /// A list of cell Amazon Resource Names (ARNs), which completely replaces the
  /// previous list.
  Future<UpdateCellResponse> updateCell({
    required String cellName,
    required List<String> cells,
  }) async {
    final $payload = <String, dynamic>{
      'cells': cells,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cells/${Uri.encodeComponent(cellName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCellResponse.fromJson(response);
  }

  /// Updates a readiness check.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [readinessCheckName] :
  /// Name of a readiness check.
  ///
  /// Parameter [resourceSetName] :
  /// The name of the resource set to be checked.
  Future<UpdateReadinessCheckResponse> updateReadinessCheck({
    required String readinessCheckName,
    required String resourceSetName,
  }) async {
    final $payload = <String, dynamic>{
      'resourceSetName': resourceSetName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/readinesschecks/${Uri.encodeComponent(readinessCheckName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateReadinessCheckResponse.fromJson(response);
  }

  /// Updates a recovery group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cells] :
  /// A list of cell Amazon Resource Names (ARNs). This list completely replaces
  /// the previous list.
  ///
  /// Parameter [recoveryGroupName] :
  /// The name of a recovery group.
  Future<UpdateRecoveryGroupResponse> updateRecoveryGroup({
    required List<String> cells,
    required String recoveryGroupName,
  }) async {
    final $payload = <String, dynamic>{
      'cells': cells,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/recoverygroups/${Uri.encodeComponent(recoveryGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecoveryGroupResponse.fromJson(response);
  }

  /// Updates a resource set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceSetName] :
  /// Name of a resource set.
  ///
  /// Parameter [resourceSetType] :
  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  ///
  /// Parameter [resources] :
  /// A list of resource objects.
  Future<UpdateResourceSetResponse> updateResourceSet({
    required String resourceSetName,
    required String resourceSetType,
    required List<Resource> resources,
  }) async {
    final $payload = <String, dynamic>{
      'resourceSetType': resourceSetType,
      'resources': resources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resourcesets/${Uri.encodeComponent(resourceSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceSetResponse.fromJson(response);
  }
}

/// Information about a cell.
class CellOutput {
  /// The Amazon Resource Name (ARN) for the cell.
  final String cellArn;

  /// The name of the cell.
  final String cellName;

  /// A list of cell ARNs.
  final List<String> cells;

  /// The readiness scope for the cell, which can be a cell Amazon Resource Name
  /// (ARN) or a recovery group ARN. This is a list but currently can have only
  /// one element.
  final List<String> parentReadinessScopes;

  /// Tags on the resources.
  final Map<String, String>? tags;

  CellOutput({
    required this.cellArn,
    required this.cellName,
    required this.cells,
    required this.parentReadinessScopes,
    this.tags,
  });

  factory CellOutput.fromJson(Map<String, dynamic> json) {
    return CellOutput(
      cellArn: json['cellArn'] as String,
      cellName: json['cellName'] as String,
      cells: (json['cells'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      parentReadinessScopes: (json['parentReadinessScopes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cellArn = this.cellArn;
    final cellName = this.cellName;
    final cells = this.cells;
    final parentReadinessScopes = this.parentReadinessScopes;
    final tags = this.tags;
    return {
      'cellArn': cellArn,
      'cellName': cellName,
      'cells': cells,
      'parentReadinessScopes': parentReadinessScopes,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateCellResponse {
  /// The Amazon Resource Name (ARN) for the cell.
  final String? cellArn;

  /// The name of the cell.
  final String? cellName;

  /// A list of cell ARNs.
  final List<String>? cells;

  /// The readiness scope for the cell, which can be a cell Amazon Resource Name
  /// (ARN) or a recovery group ARN. This is a list but currently can have only
  /// one element.
  final List<String>? parentReadinessScopes;

  /// Tags on the resources.
  final Map<String, String>? tags;

  CreateCellResponse({
    this.cellArn,
    this.cellName,
    this.cells,
    this.parentReadinessScopes,
    this.tags,
  });

  factory CreateCellResponse.fromJson(Map<String, dynamic> json) {
    return CreateCellResponse(
      cellArn: json['cellArn'] as String?,
      cellName: json['cellName'] as String?,
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      parentReadinessScopes: (json['parentReadinessScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cellArn = this.cellArn;
    final cellName = this.cellName;
    final cells = this.cells;
    final parentReadinessScopes = this.parentReadinessScopes;
    final tags = this.tags;
    return {
      if (cellArn != null) 'cellArn': cellArn,
      if (cellName != null) 'cellName': cellName,
      if (cells != null) 'cells': cells,
      if (parentReadinessScopes != null)
        'parentReadinessScopes': parentReadinessScopes,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateCrossAccountAuthorizationResponse {
  /// The cross-account authorization.
  final String? crossAccountAuthorization;

  CreateCrossAccountAuthorizationResponse({
    this.crossAccountAuthorization,
  });

  factory CreateCrossAccountAuthorizationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCrossAccountAuthorizationResponse(
      crossAccountAuthorization: json['crossAccountAuthorization'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossAccountAuthorization = this.crossAccountAuthorization;
    return {
      if (crossAccountAuthorization != null)
        'crossAccountAuthorization': crossAccountAuthorization,
    };
  }
}

class CreateReadinessCheckResponse {
  /// The Amazon Resource Name (ARN) associated with a readiness check.
  final String? readinessCheckArn;

  /// Name of a readiness check.
  final String? readinessCheckName;

  /// Name of the resource set to be checked.
  final String? resourceSet;
  final Map<String, String>? tags;

  CreateReadinessCheckResponse({
    this.readinessCheckArn,
    this.readinessCheckName,
    this.resourceSet,
    this.tags,
  });

  factory CreateReadinessCheckResponse.fromJson(Map<String, dynamic> json) {
    return CreateReadinessCheckResponse(
      readinessCheckArn: json['readinessCheckArn'] as String?,
      readinessCheckName: json['readinessCheckName'] as String?,
      resourceSet: json['resourceSet'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final readinessCheckArn = this.readinessCheckArn;
    final readinessCheckName = this.readinessCheckName;
    final resourceSet = this.resourceSet;
    final tags = this.tags;
    return {
      if (readinessCheckArn != null) 'readinessCheckArn': readinessCheckArn,
      if (readinessCheckName != null) 'readinessCheckName': readinessCheckName,
      if (resourceSet != null) 'resourceSet': resourceSet,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateRecoveryGroupResponse {
  /// A list of a cell's Amazon Resource Names (ARNs).
  final List<String>? cells;

  /// The Amazon Resource Name (ARN) for the recovery group.
  final String? recoveryGroupArn;

  /// The name of the recovery group.
  final String? recoveryGroupName;

  /// The tags associated with the recovery group.
  final Map<String, String>? tags;

  CreateRecoveryGroupResponse({
    this.cells,
    this.recoveryGroupArn,
    this.recoveryGroupName,
    this.tags,
  });

  factory CreateRecoveryGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecoveryGroupResponse(
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      recoveryGroupArn: json['recoveryGroupArn'] as String?,
      recoveryGroupName: json['recoveryGroupName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final recoveryGroupArn = this.recoveryGroupArn;
    final recoveryGroupName = this.recoveryGroupName;
    final tags = this.tags;
    return {
      if (cells != null) 'cells': cells,
      if (recoveryGroupArn != null) 'recoveryGroupArn': recoveryGroupArn,
      if (recoveryGroupName != null) 'recoveryGroupName': recoveryGroupName,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateResourceSetResponse {
  /// The Amazon Resource Name (ARN) for the resource set.
  final String? resourceSetArn;

  /// The name of the resource set.
  final String? resourceSetName;

  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  final String? resourceSetType;

  /// A list of resource objects.
  final List<Resource>? resources;
  final Map<String, String>? tags;

  CreateResourceSetResponse({
    this.resourceSetArn,
    this.resourceSetName,
    this.resourceSetType,
    this.resources,
    this.tags,
  });

  factory CreateResourceSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceSetResponse(
      resourceSetArn: json['resourceSetArn'] as String?,
      resourceSetName: json['resourceSetName'] as String?,
      resourceSetType: json['resourceSetType'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSetArn = this.resourceSetArn;
    final resourceSetName = this.resourceSetName;
    final resourceSetType = this.resourceSetType;
    final resources = this.resources;
    final tags = this.tags;
    return {
      if (resourceSetArn != null) 'resourceSetArn': resourceSetArn,
      if (resourceSetName != null) 'resourceSetName': resourceSetName,
      if (resourceSetType != null) 'resourceSetType': resourceSetType,
      if (resources != null) 'resources': resources,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A component for DNS/routing control readiness checks and architecture
/// checks.
class DNSTargetResource {
  /// The domain name that acts as an ingress point to a portion of the customer
  /// application.
  final String? domainName;

  /// The hosted zone Amazon Resource Name (ARN) that contains the DNS record with
  /// the provided name of the target resource.
  final String? hostedZoneArn;

  /// The Route 53 record set ID that uniquely identifies a DNS record, given a
  /// name and a type.
  final String? recordSetId;

  /// The type of DNS record of the target resource.
  final String? recordType;

  /// The target resource of the DNS target resource.
  final TargetResource? targetResource;

  DNSTargetResource({
    this.domainName,
    this.hostedZoneArn,
    this.recordSetId,
    this.recordType,
    this.targetResource,
  });

  factory DNSTargetResource.fromJson(Map<String, dynamic> json) {
    return DNSTargetResource(
      domainName: json['domainName'] as String?,
      hostedZoneArn: json['hostedZoneArn'] as String?,
      recordSetId: json['recordSetId'] as String?,
      recordType: json['recordType'] as String?,
      targetResource: json['targetResource'] != null
          ? TargetResource.fromJson(
              json['targetResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final hostedZoneArn = this.hostedZoneArn;
    final recordSetId = this.recordSetId;
    final recordType = this.recordType;
    final targetResource = this.targetResource;
    return {
      if (domainName != null) 'domainName': domainName,
      if (hostedZoneArn != null) 'hostedZoneArn': hostedZoneArn,
      if (recordSetId != null) 'recordSetId': recordSetId,
      if (recordType != null) 'recordType': recordType,
      if (targetResource != null) 'targetResource': targetResource,
    };
  }
}

class DeleteCrossAccountAuthorizationResponse {
  DeleteCrossAccountAuthorizationResponse();

  factory DeleteCrossAccountAuthorizationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteCrossAccountAuthorizationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetArchitectureRecommendationsResponse {
  /// The time that a recovery group was last assessed for recommendations, in UTC
  /// ISO-8601 format.
  final DateTime? lastAuditTimestamp;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// A list of the recommendations for the customer's application.
  final List<Recommendation>? recommendations;

  GetArchitectureRecommendationsResponse({
    this.lastAuditTimestamp,
    this.nextToken,
    this.recommendations,
  });

  factory GetArchitectureRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetArchitectureRecommendationsResponse(
      lastAuditTimestamp: timeStampFromJson(json['lastAuditTimestamp']),
      nextToken: json['nextToken'] as String?,
      recommendations: (json['recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastAuditTimestamp = this.lastAuditTimestamp;
    final nextToken = this.nextToken;
    final recommendations = this.recommendations;
    return {
      if (lastAuditTimestamp != null)
        'lastAuditTimestamp': iso8601ToJson(lastAuditTimestamp),
      if (nextToken != null) 'nextToken': nextToken,
      if (recommendations != null) 'recommendations': recommendations,
    };
  }
}

class GetCellReadinessSummaryResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// The readiness at a cell level.
  final Readiness? readiness;

  /// Summaries for the readiness checks that make up the cell.
  final List<ReadinessCheckSummary>? readinessChecks;

  GetCellReadinessSummaryResponse({
    this.nextToken,
    this.readiness,
    this.readinessChecks,
  });

  factory GetCellReadinessSummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetCellReadinessSummaryResponse(
      nextToken: json['nextToken'] as String?,
      readiness: (json['readiness'] as String?)?.toReadiness(),
      readinessChecks: (json['readinessChecks'] as List?)
          ?.whereNotNull()
          .map((e) => ReadinessCheckSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final readiness = this.readiness;
    final readinessChecks = this.readinessChecks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (readiness != null) 'readiness': readiness.toValue(),
      if (readinessChecks != null) 'readinessChecks': readinessChecks,
    };
  }
}

class GetCellResponse {
  /// The Amazon Resource Name (ARN) for the cell.
  final String? cellArn;

  /// The name of the cell.
  final String? cellName;

  /// A list of cell ARNs.
  final List<String>? cells;

  /// The readiness scope for the cell, which can be a cell Amazon Resource Name
  /// (ARN) or a recovery group ARN. This is a list but currently can have only
  /// one element.
  final List<String>? parentReadinessScopes;

  /// Tags on the resources.
  final Map<String, String>? tags;

  GetCellResponse({
    this.cellArn,
    this.cellName,
    this.cells,
    this.parentReadinessScopes,
    this.tags,
  });

  factory GetCellResponse.fromJson(Map<String, dynamic> json) {
    return GetCellResponse(
      cellArn: json['cellArn'] as String?,
      cellName: json['cellName'] as String?,
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      parentReadinessScopes: (json['parentReadinessScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cellArn = this.cellArn;
    final cellName = this.cellName;
    final cells = this.cells;
    final parentReadinessScopes = this.parentReadinessScopes;
    final tags = this.tags;
    return {
      if (cellArn != null) 'cellArn': cellArn,
      if (cellName != null) 'cellName': cellName,
      if (cells != null) 'cells': cells,
      if (parentReadinessScopes != null)
        'parentReadinessScopes': parentReadinessScopes,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetReadinessCheckResourceStatusResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// The readiness at a rule level.
  final Readiness? readiness;

  /// Details of the rule's results.
  final List<RuleResult>? rules;

  GetReadinessCheckResourceStatusResponse({
    this.nextToken,
    this.readiness,
    this.rules,
  });

  factory GetReadinessCheckResourceStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetReadinessCheckResourceStatusResponse(
      nextToken: json['nextToken'] as String?,
      readiness: (json['readiness'] as String?)?.toReadiness(),
      rules: (json['rules'] as List?)
          ?.whereNotNull()
          .map((e) => RuleResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final readiness = this.readiness;
    final rules = this.rules;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (readiness != null) 'readiness': readiness.toValue(),
      if (rules != null) 'rules': rules,
    };
  }
}

class GetReadinessCheckResponse {
  /// The Amazon Resource Name (ARN) associated with a readiness check.
  final String? readinessCheckArn;

  /// Name of a readiness check.
  final String? readinessCheckName;

  /// Name of the resource set to be checked.
  final String? resourceSet;
  final Map<String, String>? tags;

  GetReadinessCheckResponse({
    this.readinessCheckArn,
    this.readinessCheckName,
    this.resourceSet,
    this.tags,
  });

  factory GetReadinessCheckResponse.fromJson(Map<String, dynamic> json) {
    return GetReadinessCheckResponse(
      readinessCheckArn: json['readinessCheckArn'] as String?,
      readinessCheckName: json['readinessCheckName'] as String?,
      resourceSet: json['resourceSet'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final readinessCheckArn = this.readinessCheckArn;
    final readinessCheckName = this.readinessCheckName;
    final resourceSet = this.resourceSet;
    final tags = this.tags;
    return {
      if (readinessCheckArn != null) 'readinessCheckArn': readinessCheckArn,
      if (readinessCheckName != null) 'readinessCheckName': readinessCheckName,
      if (resourceSet != null) 'resourceSet': resourceSet,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetReadinessCheckStatusResponse {
  /// Top level messages for readiness check status
  final List<Message>? messages;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// The readiness at rule level.
  final Readiness? readiness;

  /// Summary of the readiness of resources.
  final List<ResourceResult>? resources;

  GetReadinessCheckStatusResponse({
    this.messages,
    this.nextToken,
    this.readiness,
    this.resources,
  });

  factory GetReadinessCheckStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetReadinessCheckStatusResponse(
      messages: (json['messages'] as List?)
          ?.whereNotNull()
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      readiness: (json['readiness'] as String?)?.toReadiness(),
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final nextToken = this.nextToken;
    final readiness = this.readiness;
    final resources = this.resources;
    return {
      if (messages != null) 'messages': messages,
      if (nextToken != null) 'nextToken': nextToken,
      if (readiness != null) 'readiness': readiness.toValue(),
      if (resources != null) 'resources': resources,
    };
  }
}

class GetRecoveryGroupReadinessSummaryResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// The readiness status at a recovery group level.
  final Readiness? readiness;

  /// Summaries of the readiness checks for the recovery group.
  final List<ReadinessCheckSummary>? readinessChecks;

  GetRecoveryGroupReadinessSummaryResponse({
    this.nextToken,
    this.readiness,
    this.readinessChecks,
  });

  factory GetRecoveryGroupReadinessSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRecoveryGroupReadinessSummaryResponse(
      nextToken: json['nextToken'] as String?,
      readiness: (json['readiness'] as String?)?.toReadiness(),
      readinessChecks: (json['readinessChecks'] as List?)
          ?.whereNotNull()
          .map((e) => ReadinessCheckSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final readiness = this.readiness;
    final readinessChecks = this.readinessChecks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (readiness != null) 'readiness': readiness.toValue(),
      if (readinessChecks != null) 'readinessChecks': readinessChecks,
    };
  }
}

class GetRecoveryGroupResponse {
  /// A list of a cell's Amazon Resource Names (ARNs).
  final List<String>? cells;

  /// The Amazon Resource Name (ARN) for the recovery group.
  final String? recoveryGroupArn;

  /// The name of the recovery group.
  final String? recoveryGroupName;

  /// The tags associated with the recovery group.
  final Map<String, String>? tags;

  GetRecoveryGroupResponse({
    this.cells,
    this.recoveryGroupArn,
    this.recoveryGroupName,
    this.tags,
  });

  factory GetRecoveryGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetRecoveryGroupResponse(
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      recoveryGroupArn: json['recoveryGroupArn'] as String?,
      recoveryGroupName: json['recoveryGroupName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final recoveryGroupArn = this.recoveryGroupArn;
    final recoveryGroupName = this.recoveryGroupName;
    final tags = this.tags;
    return {
      if (cells != null) 'cells': cells,
      if (recoveryGroupArn != null) 'recoveryGroupArn': recoveryGroupArn,
      if (recoveryGroupName != null) 'recoveryGroupName': recoveryGroupName,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetResourceSetResponse {
  /// The Amazon Resource Name (ARN) for the resource set.
  final String? resourceSetArn;

  /// The name of the resource set.
  final String? resourceSetName;

  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  final String? resourceSetType;

  /// A list of resource objects.
  final List<Resource>? resources;
  final Map<String, String>? tags;

  GetResourceSetResponse({
    this.resourceSetArn,
    this.resourceSetName,
    this.resourceSetType,
    this.resources,
    this.tags,
  });

  factory GetResourceSetResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSetResponse(
      resourceSetArn: json['resourceSetArn'] as String?,
      resourceSetName: json['resourceSetName'] as String?,
      resourceSetType: json['resourceSetType'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSetArn = this.resourceSetArn;
    final resourceSetName = this.resourceSetName;
    final resourceSetType = this.resourceSetType;
    final resources = this.resources;
    final tags = this.tags;
    return {
      if (resourceSetArn != null) 'resourceSetArn': resourceSetArn,
      if (resourceSetName != null) 'resourceSetName': resourceSetName,
      if (resourceSetType != null) 'resourceSetType': resourceSetType,
      if (resources != null) 'resources': resources,
      if (tags != null) 'tags': tags,
    };
  }
}

class ListCellsResponse {
  /// A list of cells.
  final List<CellOutput>? cells;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  ListCellsResponse({
    this.cells,
    this.nextToken,
  });

  factory ListCellsResponse.fromJson(Map<String, dynamic> json) {
    return ListCellsResponse(
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => CellOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final nextToken = this.nextToken;
    return {
      if (cells != null) 'cells': cells,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCrossAccountAuthorizationsResponse {
  /// A list of cross-account authorizations.
  final List<String>? crossAccountAuthorizations;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  ListCrossAccountAuthorizationsResponse({
    this.crossAccountAuthorizations,
    this.nextToken,
  });

  factory ListCrossAccountAuthorizationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCrossAccountAuthorizationsResponse(
      crossAccountAuthorizations: (json['crossAccountAuthorizations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossAccountAuthorizations = this.crossAccountAuthorizations;
    final nextToken = this.nextToken;
    return {
      if (crossAccountAuthorizations != null)
        'crossAccountAuthorizations': crossAccountAuthorizations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReadinessChecksResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// A list of readiness checks associated with the account.
  final List<ReadinessCheckOutput>? readinessChecks;

  ListReadinessChecksResponse({
    this.nextToken,
    this.readinessChecks,
  });

  factory ListReadinessChecksResponse.fromJson(Map<String, dynamic> json) {
    return ListReadinessChecksResponse(
      nextToken: json['nextToken'] as String?,
      readinessChecks: (json['readinessChecks'] as List?)
          ?.whereNotNull()
          .map((e) => ReadinessCheckOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final readinessChecks = this.readinessChecks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (readinessChecks != null) 'readinessChecks': readinessChecks,
    };
  }
}

class ListRecoveryGroupsResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// A list of recovery groups.
  final List<RecoveryGroupOutput>? recoveryGroups;

  ListRecoveryGroupsResponse({
    this.nextToken,
    this.recoveryGroups,
  });

  factory ListRecoveryGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecoveryGroupsResponse(
      nextToken: json['nextToken'] as String?,
      recoveryGroups: (json['recoveryGroups'] as List?)
          ?.whereNotNull()
          .map((e) => RecoveryGroupOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recoveryGroups = this.recoveryGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recoveryGroups != null) 'recoveryGroups': recoveryGroups,
    };
  }
}

class ListResourceSetsResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// A list of resource sets associated with the account.
  final List<ResourceSetOutput>? resourceSets;

  ListResourceSetsResponse({
    this.nextToken,
    this.resourceSets,
  });

  factory ListResourceSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceSetsResponse(
      nextToken: json['nextToken'] as String?,
      resourceSets: (json['resourceSets'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSetOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceSets = this.resourceSets;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceSets != null) 'resourceSets': resourceSets,
    };
  }
}

/// Readiness rule information, including the resource type, rule ID, and rule
/// description.
class ListRulesOutput {
  /// The resource type that the readiness rule applies to.
  final String resourceType;

  /// The description of a readiness rule.
  final String ruleDescription;

  /// The ID for the readiness rule.
  final String ruleId;

  ListRulesOutput({
    required this.resourceType,
    required this.ruleDescription,
    required this.ruleId,
  });

  factory ListRulesOutput.fromJson(Map<String, dynamic> json) {
    return ListRulesOutput(
      resourceType: json['resourceType'] as String,
      ruleDescription: json['ruleDescription'] as String,
      ruleId: json['ruleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final ruleDescription = this.ruleDescription;
    final ruleId = this.ruleId;
    return {
      'resourceType': resourceType,
      'ruleDescription': ruleDescription,
      'ruleId': ruleId,
    };
  }
}

class ListRulesResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// A list of readiness rules for a specific resource type.
  final List<ListRulesOutput>? rules;

  ListRulesResponse({
    this.nextToken,
    this.rules,
  });

  factory ListRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesResponse(
      nextToken: json['nextToken'] as String?,
      rules: (json['rules'] as List?)
          ?.whereNotNull()
          .map((e) => ListRulesOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rules = this.rules;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (rules != null) 'rules': rules,
    };
  }
}

class ListTagsForResourcesResponse {
  ///
  final Map<String, String>? tags;

  ListTagsForResourcesResponse({
    this.tags,
  });

  factory ListTagsForResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourcesResponse(
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

/// Information relating to readiness check status.
class Message {
  /// The text of a readiness check message.
  final String? messageText;

  Message({
    this.messageText,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageText: json['messageText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageText = this.messageText;
    return {
      if (messageText != null) 'messageText': messageText,
    };
  }
}

/// The Network Load Balancer resource that a DNS target resource points to.
class NLBResource {
  /// The Network Load Balancer resource Amazon Resource Name (ARN).
  final String? arn;

  NLBResource({
    this.arn,
  });

  factory NLBResource.fromJson(Map<String, dynamic> json) {
    return NLBResource(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

/// The Route 53 resource that a DNS target resource record points to.
class R53ResourceRecord {
  /// The DNS target domain name.
  final String? domainName;

  /// The Route 53 Resource Record Set ID.
  final String? recordSetId;

  R53ResourceRecord({
    this.domainName,
    this.recordSetId,
  });

  factory R53ResourceRecord.fromJson(Map<String, dynamic> json) {
    return R53ResourceRecord(
      domainName: json['domainName'] as String?,
      recordSetId: json['recordSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final recordSetId = this.recordSetId;
    return {
      if (domainName != null) 'domainName': domainName,
      if (recordSetId != null) 'recordSetId': recordSetId,
    };
  }
}

/// The readiness status.
enum Readiness {
  ready,
  notReady,
  unknown,
  notAuthorized,
}

extension ReadinessValueExtension on Readiness {
  String toValue() {
    switch (this) {
      case Readiness.ready:
        return 'READY';
      case Readiness.notReady:
        return 'NOT_READY';
      case Readiness.unknown:
        return 'UNKNOWN';
      case Readiness.notAuthorized:
        return 'NOT_AUTHORIZED';
    }
  }
}

extension ReadinessFromString on String {
  Readiness toReadiness() {
    switch (this) {
      case 'READY':
        return Readiness.ready;
      case 'NOT_READY':
        return Readiness.notReady;
      case 'UNKNOWN':
        return Readiness.unknown;
      case 'NOT_AUTHORIZED':
        return Readiness.notAuthorized;
    }
    throw Exception('$this is not known in enum Readiness');
  }
}

/// A readiness check.
class ReadinessCheckOutput {
  /// The Amazon Resource Name (ARN) associated with a readiness check.
  final String readinessCheckArn;

  /// Name of the resource set to be checked.
  final String resourceSet;

  /// Name of a readiness check.
  final String? readinessCheckName;
  final Map<String, String>? tags;

  ReadinessCheckOutput({
    required this.readinessCheckArn,
    required this.resourceSet,
    this.readinessCheckName,
    this.tags,
  });

  factory ReadinessCheckOutput.fromJson(Map<String, dynamic> json) {
    return ReadinessCheckOutput(
      readinessCheckArn: json['readinessCheckArn'] as String,
      resourceSet: json['resourceSet'] as String,
      readinessCheckName: json['readinessCheckName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final readinessCheckArn = this.readinessCheckArn;
    final resourceSet = this.resourceSet;
    final readinessCheckName = this.readinessCheckName;
    final tags = this.tags;
    return {
      'readinessCheckArn': readinessCheckArn,
      'resourceSet': resourceSet,
      if (readinessCheckName != null) 'readinessCheckName': readinessCheckName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary of all readiness check statuses in a recovery group, paginated in
/// GetRecoveryGroupReadinessSummary and GetCellReadinessSummary.
class ReadinessCheckSummary {
  /// The readiness status of this readiness check.
  final Readiness? readiness;

  /// The name of a readiness check.
  final String? readinessCheckName;

  ReadinessCheckSummary({
    this.readiness,
    this.readinessCheckName,
  });

  factory ReadinessCheckSummary.fromJson(Map<String, dynamic> json) {
    return ReadinessCheckSummary(
      readiness: (json['readiness'] as String?)?.toReadiness(),
      readinessCheckName: json['readinessCheckName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readiness = this.readiness;
    final readinessCheckName = this.readinessCheckName;
    return {
      if (readiness != null) 'readiness': readiness.toValue(),
      if (readinessCheckName != null) 'readinessCheckName': readinessCheckName,
    };
  }
}

/// Recommendations that are provided to make an application more recovery
/// resilient.
class Recommendation {
  /// Text of the recommendations that are provided to make an application more
  /// recovery resilient.
  final String recommendationText;

  Recommendation({
    required this.recommendationText,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      recommendationText: json['recommendationText'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationText = this.recommendationText;
    return {
      'recommendationText': recommendationText,
    };
  }
}

/// A representation of the application, typically containing multiple cells.
class RecoveryGroupOutput {
  /// A list of a cell's Amazon Resource Names (ARNs).
  final List<String> cells;

  /// The Amazon Resource Name (ARN) for the recovery group.
  final String recoveryGroupArn;

  /// The name of the recovery group.
  final String recoveryGroupName;

  /// The tags associated with the recovery group.
  final Map<String, String>? tags;

  RecoveryGroupOutput({
    required this.cells,
    required this.recoveryGroupArn,
    required this.recoveryGroupName,
    this.tags,
  });

  factory RecoveryGroupOutput.fromJson(Map<String, dynamic> json) {
    return RecoveryGroupOutput(
      cells: (json['cells'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      recoveryGroupArn: json['recoveryGroupArn'] as String,
      recoveryGroupName: json['recoveryGroupName'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final recoveryGroupArn = this.recoveryGroupArn;
    final recoveryGroupName = this.recoveryGroupName;
    final tags = this.tags;
    return {
      'cells': cells,
      'recoveryGroupArn': recoveryGroupArn,
      'recoveryGroupName': recoveryGroupName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The resource element of a resource set.
class Resource {
  /// The component identifier of the resource, generated when DNS target resource
  /// is used.
  final String? componentId;

  /// The DNS target resource.
  final DNSTargetResource? dnsTargetResource;

  /// A list of recovery group Amazon Resource Names (ARNs) and cell ARNs that
  /// this resource is contained within.
  final List<String>? readinessScopes;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services resource.
  final String? resourceArn;

  Resource({
    this.componentId,
    this.dnsTargetResource,
    this.readinessScopes,
    this.resourceArn,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      componentId: json['componentId'] as String?,
      dnsTargetResource: json['dnsTargetResource'] != null
          ? DNSTargetResource.fromJson(
              json['dnsTargetResource'] as Map<String, dynamic>)
          : null,
      readinessScopes: (json['readinessScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentId = this.componentId;
    final dnsTargetResource = this.dnsTargetResource;
    final readinessScopes = this.readinessScopes;
    final resourceArn = this.resourceArn;
    return {
      if (componentId != null) 'componentId': componentId,
      if (dnsTargetResource != null) 'dnsTargetResource': dnsTargetResource,
      if (readinessScopes != null) 'readinessScopes': readinessScopes,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// The result of a successful Resource request, with status for an individual
/// resource.
class ResourceResult {
  /// The time (UTC) that the resource was last checked for readiness, in ISO-8601
  /// format.
  final DateTime lastCheckedTimestamp;

  /// The readiness of a resource.
  final Readiness readiness;

  /// The component id of the resource.
  final String? componentId;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  ResourceResult({
    required this.lastCheckedTimestamp,
    required this.readiness,
    this.componentId,
    this.resourceArn,
  });

  factory ResourceResult.fromJson(Map<String, dynamic> json) {
    return ResourceResult(
      lastCheckedTimestamp:
          nonNullableTimeStampFromJson(json['lastCheckedTimestamp'] as Object),
      readiness: (json['readiness'] as String).toReadiness(),
      componentId: json['componentId'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastCheckedTimestamp = this.lastCheckedTimestamp;
    final readiness = this.readiness;
    final componentId = this.componentId;
    final resourceArn = this.resourceArn;
    return {
      'lastCheckedTimestamp': iso8601ToJson(lastCheckedTimestamp),
      'readiness': readiness.toValue(),
      if (componentId != null) 'componentId': componentId,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// A collection of resources of the same type.
class ResourceSetOutput {
  /// The Amazon Resource Name (ARN) for the resource set.
  final String resourceSetArn;

  /// The name of the resource set.
  final String resourceSetName;

  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  final String resourceSetType;

  /// A list of resource objects.
  final List<Resource> resources;
  final Map<String, String>? tags;

  ResourceSetOutput({
    required this.resourceSetArn,
    required this.resourceSetName,
    required this.resourceSetType,
    required this.resources,
    this.tags,
  });

  factory ResourceSetOutput.fromJson(Map<String, dynamic> json) {
    return ResourceSetOutput(
      resourceSetArn: json['resourceSetArn'] as String,
      resourceSetName: json['resourceSetName'] as String,
      resourceSetType: json['resourceSetType'] as String,
      resources: (json['resources'] as List)
          .whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSetArn = this.resourceSetArn;
    final resourceSetName = this.resourceSetName;
    final resourceSetType = this.resourceSetType;
    final resources = this.resources;
    final tags = this.tags;
    return {
      'resourceSetArn': resourceSetArn,
      'resourceSetName': resourceSetName,
      'resourceSetType': resourceSetType,
      'resources': resources,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The result of a successful Rule request, with status for an individual rule.
class RuleResult {
  /// The time the resource was last checked for readiness, in ISO-8601 format,
  /// UTC.
  final DateTime lastCheckedTimestamp;

  /// Details about the resource's readiness.
  final List<Message> messages;

  /// The readiness at rule level.
  final Readiness readiness;

  /// The identifier of the rule.
  final String ruleId;

  RuleResult({
    required this.lastCheckedTimestamp,
    required this.messages,
    required this.readiness,
    required this.ruleId,
  });

  factory RuleResult.fromJson(Map<String, dynamic> json) {
    return RuleResult(
      lastCheckedTimestamp:
          nonNullableTimeStampFromJson(json['lastCheckedTimestamp'] as Object),
      messages: (json['messages'] as List)
          .whereNotNull()
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      readiness: (json['readiness'] as String).toReadiness(),
      ruleId: json['ruleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lastCheckedTimestamp = this.lastCheckedTimestamp;
    final messages = this.messages;
    final readiness = this.readiness;
    final ruleId = this.ruleId;
    return {
      'lastCheckedTimestamp': iso8601ToJson(lastCheckedTimestamp),
      'messages': messages,
      'readiness': readiness.toValue(),
      'ruleId': ruleId,
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

/// The target resource that the Route 53 record points to.
class TargetResource {
  /// The Network Load Balancer Resource.
  final NLBResource? nLBResource;

  /// The Route 53 resource.
  final R53ResourceRecord? r53Resource;

  TargetResource({
    this.nLBResource,
    this.r53Resource,
  });

  factory TargetResource.fromJson(Map<String, dynamic> json) {
    return TargetResource(
      nLBResource: json['nLBResource'] != null
          ? NLBResource.fromJson(json['nLBResource'] as Map<String, dynamic>)
          : null,
      r53Resource: json['r53Resource'] != null
          ? R53ResourceRecord.fromJson(
              json['r53Resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nLBResource = this.nLBResource;
    final r53Resource = this.r53Resource;
    return {
      if (nLBResource != null) 'nLBResource': nLBResource,
      if (r53Resource != null) 'r53Resource': r53Resource,
    };
  }
}

class UpdateCellResponse {
  /// The Amazon Resource Name (ARN) for the cell.
  final String? cellArn;

  /// The name of the cell.
  final String? cellName;

  /// A list of cell ARNs.
  final List<String>? cells;

  /// The readiness scope for the cell, which can be a cell Amazon Resource Name
  /// (ARN) or a recovery group ARN. This is a list but currently can have only
  /// one element.
  final List<String>? parentReadinessScopes;

  /// Tags on the resources.
  final Map<String, String>? tags;

  UpdateCellResponse({
    this.cellArn,
    this.cellName,
    this.cells,
    this.parentReadinessScopes,
    this.tags,
  });

  factory UpdateCellResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCellResponse(
      cellArn: json['cellArn'] as String?,
      cellName: json['cellName'] as String?,
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      parentReadinessScopes: (json['parentReadinessScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cellArn = this.cellArn;
    final cellName = this.cellName;
    final cells = this.cells;
    final parentReadinessScopes = this.parentReadinessScopes;
    final tags = this.tags;
    return {
      if (cellArn != null) 'cellArn': cellArn,
      if (cellName != null) 'cellName': cellName,
      if (cells != null) 'cells': cells,
      if (parentReadinessScopes != null)
        'parentReadinessScopes': parentReadinessScopes,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateReadinessCheckResponse {
  /// The Amazon Resource Name (ARN) associated with a readiness check.
  final String? readinessCheckArn;

  /// Name of a readiness check.
  final String? readinessCheckName;

  /// Name of the resource set to be checked.
  final String? resourceSet;
  final Map<String, String>? tags;

  UpdateReadinessCheckResponse({
    this.readinessCheckArn,
    this.readinessCheckName,
    this.resourceSet,
    this.tags,
  });

  factory UpdateReadinessCheckResponse.fromJson(Map<String, dynamic> json) {
    return UpdateReadinessCheckResponse(
      readinessCheckArn: json['readinessCheckArn'] as String?,
      readinessCheckName: json['readinessCheckName'] as String?,
      resourceSet: json['resourceSet'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final readinessCheckArn = this.readinessCheckArn;
    final readinessCheckName = this.readinessCheckName;
    final resourceSet = this.resourceSet;
    final tags = this.tags;
    return {
      if (readinessCheckArn != null) 'readinessCheckArn': readinessCheckArn,
      if (readinessCheckName != null) 'readinessCheckName': readinessCheckName,
      if (resourceSet != null) 'resourceSet': resourceSet,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateRecoveryGroupResponse {
  /// A list of a cell's Amazon Resource Names (ARNs).
  final List<String>? cells;

  /// The Amazon Resource Name (ARN) for the recovery group.
  final String? recoveryGroupArn;

  /// The name of the recovery group.
  final String? recoveryGroupName;

  /// The tags associated with the recovery group.
  final Map<String, String>? tags;

  UpdateRecoveryGroupResponse({
    this.cells,
    this.recoveryGroupArn,
    this.recoveryGroupName,
    this.tags,
  });

  factory UpdateRecoveryGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecoveryGroupResponse(
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      recoveryGroupArn: json['recoveryGroupArn'] as String?,
      recoveryGroupName: json['recoveryGroupName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final recoveryGroupArn = this.recoveryGroupArn;
    final recoveryGroupName = this.recoveryGroupName;
    final tags = this.tags;
    return {
      if (cells != null) 'cells': cells,
      if (recoveryGroupArn != null) 'recoveryGroupArn': recoveryGroupArn,
      if (recoveryGroupName != null) 'recoveryGroupName': recoveryGroupName,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateResourceSetResponse {
  /// The Amazon Resource Name (ARN) for the resource set.
  final String? resourceSetArn;

  /// The name of the resource set.
  final String? resourceSetName;

  /// The resource type of the resources in the resource set. Enter one of the
  /// following values for resource type:
  ///
  /// AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage,
  /// AWS::AutoScaling::AutoScalingGroup, AWS::CloudWatch::Alarm,
  /// AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
  /// AWS::ElasticLoadBalancing::LoadBalancer,
  /// AWS::ElasticLoadBalancingV2::LoadBalancer, AWS::Lambda::Function,
  /// AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
  /// AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC,
  /// AWS::EC2::VPNConnection, AWS::EC2::VPNGateway,
  /// AWS::Route53RecoveryReadiness::DNSTargetResource
  final String? resourceSetType;

  /// A list of resource objects.
  final List<Resource>? resources;
  final Map<String, String>? tags;

  UpdateResourceSetResponse({
    this.resourceSetArn,
    this.resourceSetName,
    this.resourceSetType,
    this.resources,
    this.tags,
  });

  factory UpdateResourceSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResourceSetResponse(
      resourceSetArn: json['resourceSetArn'] as String?,
      resourceSetName: json['resourceSetName'] as String?,
      resourceSetType: json['resourceSetType'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSetArn = this.resourceSetArn;
    final resourceSetName = this.resourceSetName;
    final resourceSetType = this.resourceSetType;
    final resources = this.resources;
    final tags = this.tags;
    return {
      if (resourceSetArn != null) 'resourceSetArn': resourceSetArn,
      if (resourceSetName != null) 'resourceSetName': resourceSetName,
      if (resourceSetType != null) 'resourceSetType': resourceSetType,
      if (resources != null) 'resources': resources,
      if (tags != null) 'tags': tags,
    };
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
