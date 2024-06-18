// ignore_for_file: deprecated_member_use_from_same_package
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

/// Config provides a way to keep track of the configurations of all the Amazon
/// Web Services resources associated with your Amazon Web Services account. You
/// can use Config to get the current and historical configurations of each
/// Amazon Web Services resource and also to get information about the
/// relationship between the resources. An Amazon Web Services resource can be
/// an Amazon Compute Cloud (Amazon EC2) instance, an Elastic Block Store (EBS)
/// volume, an elastic network Interface (ENI), or a security group. For a
/// complete list of resources currently supported by Config, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
/// Amazon Web Services resources</a>.
class ConfigService {
  final _s.JsonProtocol _protocol;
  ConfigService({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'config',
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

  /// Returns the current configuration items for resources that are present in
  /// your Config aggregator. The operation also returns a list of resources
  /// that are not processed in the current request. If there are no unprocessed
  /// resources, the operation returns an empty
  /// <code>unprocessedResourceIdentifiers</code> list.
  /// <note>
  /// <ul>
  /// <li>
  /// The API does not return results for deleted resources.
  /// </li>
  /// <li>
  /// The API does not return tags and relationships.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ValidationException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [resourceIdentifiers] :
  /// A list of aggregate ResourceIdentifiers objects.
  Future<BatchGetAggregateResourceConfigResponse>
      batchGetAggregateResourceConfig({
    required String configurationAggregatorName,
    required List<AggregateResourceIdentifier> resourceIdentifiers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.BatchGetAggregateResourceConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        'ResourceIdentifiers': resourceIdentifiers,
      },
    );

    return BatchGetAggregateResourceConfigResponse.fromJson(jsonResponse.body);
  }

  /// Returns the <code>BaseConfigurationItem</code> for one or more requested
  /// resources. The operation also returns a list of resources that are not
  /// processed in the current request. If there are no unprocessed resources,
  /// the operation returns an empty unprocessedResourceKeys list.
  /// <note>
  /// <ul>
  /// <li>
  /// The API does not return results for deleted resources.
  /// </li>
  /// <li>
  /// The API does not return any tags for the requested resources. This
  /// information is filtered out of the supplementaryConfiguration section of
  /// the API response.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ValidationException].
  /// May throw [NoAvailableConfigurationRecorderException].
  ///
  /// Parameter [resourceKeys] :
  /// A list of resource keys to be processed with the current request. Each
  /// element in the list consists of the resource type and resource ID.
  Future<BatchGetResourceConfigResponse> batchGetResourceConfig({
    required List<ResourceKey> resourceKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.BatchGetResourceConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceKeys': resourceKeys,
      },
    );

    return BatchGetResourceConfigResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the authorization granted to the specified configuration
  /// aggregator account in a specified region.
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [authorizedAccountId] :
  /// The 12-digit account ID of the account authorized to aggregate data.
  ///
  /// Parameter [authorizedAwsRegion] :
  /// The region authorized to collect aggregated data.
  Future<void> deleteAggregationAuthorization({
    required String authorizedAccountId,
    required String authorizedAwsRegion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteAggregationAuthorization'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthorizedAccountId': authorizedAccountId,
        'AuthorizedAwsRegion': authorizedAwsRegion,
      },
    );
  }

  /// Deletes the specified Config rule and all of its evaluation results.
  ///
  /// Config sets the state of a rule to <code>DELETING</code> until the
  /// deletion is complete. You cannot update a rule while it is in this state.
  /// If you make a <code>PutConfigRule</code> or <code>DeleteConfigRule</code>
  /// request for the rule, you will receive a
  /// <code>ResourceInUseException</code>.
  ///
  /// You can check the state of a rule by using the
  /// <code>DescribeConfigRules</code> request.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule that you want to delete.
  Future<void> deleteConfigRule({
    required String configRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConfigRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
      },
    );
  }

  /// Deletes the specified configuration aggregator and the aggregated data
  /// associated with the aggregator.
  ///
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  Future<void> deleteConfigurationAggregator({
    required String configurationAggregatorName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConfigurationAggregator'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
      },
    );
  }

  /// Deletes the configuration recorder.
  ///
  /// After the configuration recorder is deleted, Config will not record
  /// resource configuration changes until you create a new configuration
  /// recorder.
  ///
  /// This action does not delete the configuration information that was
  /// previously recorded. You will be able to access the previously recorded
  /// information by using the <code>GetResourceConfigHistory</code> action, but
  /// you will not be able to access this information in the Config console
  /// until you create a new configuration recorder.
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  ///
  /// Parameter [configurationRecorderName] :
  /// The name of the configuration recorder to be deleted. You can retrieve the
  /// name of your configuration recorder by using the
  /// <code>DescribeConfigurationRecorders</code> action.
  Future<void> deleteConfigurationRecorder({
    required String configurationRecorderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConfigurationRecorder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationRecorderName': configurationRecorderName,
      },
    );
  }

  /// Deletes the specified conformance pack and all the Config rules,
  /// remediation actions, and all evaluation results within that conformance
  /// pack.
  ///
  /// Config sets the conformance pack to <code>DELETE_IN_PROGRESS</code> until
  /// the deletion is complete. You cannot update a conformance pack while it is
  /// in this state.
  ///
  /// May throw [NoSuchConformancePackException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [conformancePackName] :
  /// Name of the conformance pack you want to delete.
  Future<void> deleteConformancePack({
    required String conformancePackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConformancePack'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConformancePackName': conformancePackName,
      },
    );
  }

  /// Deletes the delivery channel.
  ///
  /// Before you can delete the delivery channel, you must stop the
  /// configuration recorder by using the <a>StopConfigurationRecorder</a>
  /// action.
  ///
  /// May throw [NoSuchDeliveryChannelException].
  /// May throw [LastDeliveryChannelDeleteFailedException].
  ///
  /// Parameter [deliveryChannelName] :
  /// The name of the delivery channel to delete.
  Future<void> deleteDeliveryChannel({
    required String deliveryChannelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteDeliveryChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryChannelName': deliveryChannelName,
      },
    );
  }

  /// Deletes the evaluation results for the specified Config rule. You can
  /// specify one Config rule per request. After you delete the evaluation
  /// results, you can call the <a>StartConfigRulesEvaluation</a> API to start
  /// evaluating your Amazon Web Services resources against the rule.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want to delete the evaluation
  /// results.
  Future<void> deleteEvaluationResults({
    required String configRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteEvaluationResults'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
      },
    );
  }

  /// Deletes the specified organization Config rule and all of its evaluation
  /// results from all member accounts in that organization.
  ///
  /// Only a management account and a delegated administrator account can delete
  /// an organization Config rule. When calling this API with a delegated
  /// administrator, you must ensure Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added.
  ///
  /// Config sets the state of a rule to DELETE_IN_PROGRESS until the deletion
  /// is complete. You cannot update a rule while it is in this state.
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [ResourceInUseException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name of organization Config rule that you want to delete.
  Future<void> deleteOrganizationConfigRule({
    required String organizationConfigRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteOrganizationConfigRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConfigRuleName': organizationConfigRuleName,
      },
    );
  }

  /// Deletes the specified organization conformance pack and all of the Config
  /// rules and remediation actions from all member accounts in that
  /// organization.
  ///
  /// Only a management account or a delegated administrator account can delete
  /// an organization conformance pack. When calling this API with a delegated
  /// administrator, you must ensure Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added.
  ///
  /// Config sets the state of a conformance pack to DELETE_IN_PROGRESS until
  /// the deletion is complete. You cannot update a conformance pack while it is
  /// in this state.
  ///
  /// May throw [NoSuchOrganizationConformancePackException].
  /// May throw [ResourceInUseException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConformancePackName] :
  /// The name of organization conformance pack that you want to delete.
  Future<void> deleteOrganizationConformancePack({
    required String organizationConformancePackName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteOrganizationConformancePack'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConformancePackName': organizationConformancePackName,
      },
    );
  }

  /// Deletes pending authorization requests for a specified aggregator account
  /// in a specified region.
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [requesterAccountId] :
  /// The 12-digit account ID of the account requesting to aggregate data.
  ///
  /// Parameter [requesterAwsRegion] :
  /// The region requesting to aggregate data.
  Future<void> deletePendingAggregationRequest({
    required String requesterAccountId,
    required String requesterAwsRegion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeletePendingAggregationRequest'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequesterAccountId': requesterAccountId,
        'RequesterAwsRegion': requesterAwsRegion,
      },
    );
  }

  /// Deletes the remediation configuration.
  ///
  /// May throw [NoSuchRemediationConfigurationException].
  /// May throw [RemediationInProgressException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want to delete remediation
  /// configuration.
  ///
  /// Parameter [resourceType] :
  /// The type of a resource.
  Future<void> deleteRemediationConfiguration({
    required String configRuleName,
    String? resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteRemediationConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        if (resourceType != null) 'ResourceType': resourceType,
      },
    );
  }

  /// Deletes one or more remediation exceptions mentioned in the resource keys.
  /// <note>
  /// Config generates a remediation exception when a problem occurs executing a
  /// remediation action to a specific resource. Remediation exceptions blocks
  /// auto-remediation until the exception is cleared.
  /// </note>
  ///
  /// May throw [NoSuchRemediationExceptionException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want to delete remediation
  /// exception configuration.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. Config adds exception for each resource key. For example,
  /// Config adds 3 exceptions for 3 resource keys.
  Future<DeleteRemediationExceptionsResponse> deleteRemediationExceptions({
    required String configRuleName,
    required List<RemediationExceptionResourceKey> resourceKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteRemediationExceptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        'ResourceKeys': resourceKeys,
      },
    );

    return DeleteRemediationExceptionsResponse.fromJson(jsonResponse.body);
  }

  /// Records the configuration state for a custom resource that has been
  /// deleted. This API records a new ConfigurationItem with a ResourceDeleted
  /// status. You can retrieve the ConfigurationItems recorded for this resource
  /// in your Config History.
  ///
  /// May throw [ValidationException].
  /// May throw [NoRunningConfigurationRecorderException].
  ///
  /// Parameter [resourceId] :
  /// Unique identifier of the resource.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource.
  Future<void> deleteResourceConfig({
    required String resourceId,
    required String resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteResourceConfig'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType,
      },
    );
  }

  /// Deletes the retention configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchRetentionConfigurationException].
  ///
  /// Parameter [retentionConfigurationName] :
  /// The name of the retention configuration to delete.
  Future<void> deleteRetentionConfiguration({
    required String retentionConfigurationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteRetentionConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RetentionConfigurationName': retentionConfigurationName,
      },
    );
  }

  /// Deletes the stored query for a single Amazon Web Services account and a
  /// single Amazon Web Services Region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [queryName] :
  /// The name of the query that you want to delete.
  Future<void> deleteStoredQuery({
    required String queryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteStoredQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryName': queryName,
      },
    );
  }

  /// Schedules delivery of a configuration snapshot to the Amazon S3 bucket in
  /// the specified delivery channel. After the delivery has started, Config
  /// sends the following notifications using an Amazon SNS topic that you have
  /// specified.
  ///
  /// <ul>
  /// <li>
  /// Notification of the start of the delivery.
  /// </li>
  /// <li>
  /// Notification of the completion of the delivery, if the delivery was
  /// successfully completed.
  /// </li>
  /// <li>
  /// Notification of delivery failure, if the delivery failed.
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchDeliveryChannelException].
  /// May throw [NoAvailableConfigurationRecorderException].
  /// May throw [NoRunningConfigurationRecorderException].
  ///
  /// Parameter [deliveryChannelName] :
  /// The name of the delivery channel through which the snapshot is delivered.
  Future<DeliverConfigSnapshotResponse> deliverConfigSnapshot({
    required String deliveryChannelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeliverConfigSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deliveryChannelName': deliveryChannelName,
      },
    );

    return DeliverConfigSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of compliant and noncompliant rules with the number of
  /// resources for compliant and noncompliant rules. Does not display rules
  /// that do not have compliance results.
  /// <note>
  /// The results can return an empty result page, but if you have a
  /// <code>nextToken</code>, the results are displayed on the next page.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [filters] :
  /// Filters the results by ConfigRuleComplianceFilters object.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeAggregateComplianceByConfigRulesResponse>
      describeAggregateComplianceByConfigRules({
    required String configurationAggregatorName,
    ConfigRuleComplianceFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.DescribeAggregateComplianceByConfigRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAggregateComplianceByConfigRulesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of the conformance packs and their associated compliance
  /// status with the count of compliant and noncompliant Config rules within
  /// each conformance pack. Also returns the total rule count which includes
  /// compliant rules, noncompliant rules, and rules that cannot be evaluated
  /// due to insufficient data.
  /// <note>
  /// The results can return an empty result page, but if you have a
  /// <code>nextToken</code>, the results are displayed on the next page.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [filters] :
  /// Filters the result by
  /// <code>AggregateConformancePackComplianceFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of conformance packs compliance details returned on
  /// each page. The default is maximum. If you specify 0, Config uses the
  /// default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeAggregateComplianceByConformancePacksResponse>
      describeAggregateComplianceByConformancePacks({
    required String configurationAggregatorName,
    AggregateConformancePackComplianceFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.DescribeAggregateComplianceByConformancePacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAggregateComplianceByConformancePacksResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of authorizations granted to various aggregator accounts
  /// and regions.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  ///
  /// Parameter [limit] :
  /// The maximum number of AggregationAuthorizations returned on each page. The
  /// default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeAggregationAuthorizationsResponse>
      describeAggregationAuthorizations({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeAggregationAuthorizations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAggregationAuthorizationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Indicates whether the specified Config rules are compliant. If a rule is
  /// noncompliant, this action returns the number of Amazon Web Services
  /// resources that do not comply with the rule.
  ///
  /// A rule is compliant if all of the evaluated resources comply with it. It
  /// is noncompliant if any of these resources do not comply.
  ///
  /// If Config has no current evaluation results for the rule, it returns
  /// <code>INSUFFICIENT_DATA</code>. This result might indicate one of the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// Config has never invoked an evaluation for the rule. To check whether it
  /// has, use the <code>DescribeConfigRuleEvaluationStatus</code> action to get
  /// the <code>LastSuccessfulInvocationTime</code> and
  /// <code>LastFailedInvocationTime</code>.
  /// </li>
  /// <li>
  /// The rule's Lambda function is failing to send evaluation results to
  /// Config. Verify that the role you assigned to your configuration recorder
  /// includes the <code>config:PutEvaluations</code> permission. If the rule is
  /// a custom rule, verify that the Lambda execution role includes the
  /// <code>config:PutEvaluations</code> permission.
  /// </li>
  /// <li>
  /// The rule's Lambda function has returned <code>NOT_APPLICABLE</code> for
  /// all evaluation results. This can occur if the resources were deleted or
  /// removed from the rule's scope.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// Parameter [configRuleNames] :
  /// Specify one or more Config rule names to filter the results by rule.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeComplianceByConfigRuleResponse>
      describeComplianceByConfigRule({
    List<ComplianceType>? complianceTypes,
    List<String>? configRuleNames,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeComplianceByConfigRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (complianceTypes != null)
          'ComplianceTypes': complianceTypes.map((e) => e.value).toList(),
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeComplianceByConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Indicates whether the specified Amazon Web Services resources are
  /// compliant. If a resource is noncompliant, this action returns the number
  /// of Config rules that the resource does not comply with.
  ///
  /// A resource is compliant if it complies with all the Config rules that
  /// evaluate it. It is noncompliant if it does not comply with one or more of
  /// these rules.
  ///
  /// If Config has no current evaluation results for the resource, it returns
  /// <code>INSUFFICIENT_DATA</code>. This result might indicate one of the
  /// following conditions about the rules that evaluate the resource:
  ///
  /// <ul>
  /// <li>
  /// Config has never invoked an evaluation for the rule. To check whether it
  /// has, use the <code>DescribeConfigRuleEvaluationStatus</code> action to get
  /// the <code>LastSuccessfulInvocationTime</code> and
  /// <code>LastFailedInvocationTime</code>.
  /// </li>
  /// <li>
  /// The rule's Lambda function is failing to send evaluation results to
  /// Config. Verify that the role that you assigned to your configuration
  /// recorder includes the <code>config:PutEvaluations</code> permission. If
  /// the rule is a custom rule, verify that the Lambda execution role includes
  /// the <code>config:PutEvaluations</code> permission.
  /// </li>
  /// <li>
  /// The rule's Lambda function has returned <code>NOT_APPLICABLE</code> for
  /// all evaluation results. This can occur if the resources were deleted or
  /// removed from the rule's scope.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceId] :
  /// The ID of the Amazon Web Services resource for which you want compliance
  /// information. You can specify only one resource ID. If you specify a
  /// resource ID, you must also specify a type for <code>ResourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// The types of Amazon Web Services resources for which you want compliance
  /// information (for example, <code>AWS::EC2::Instance</code>). For this
  /// action, you can specify that the resource type is an Amazon Web Services
  /// account by specifying <code>AWS::::Account</code>.
  Future<DescribeComplianceByResourceResponse> describeComplianceByResource({
    List<ComplianceType>? complianceTypes,
    int? limit,
    String? nextToken,
    String? resourceId,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeComplianceByResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (complianceTypes != null)
          'ComplianceTypes': complianceTypes.map((e) => e.value).toList(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceId != null) 'ResourceId': resourceId,
        if (resourceType != null) 'ResourceType': resourceType,
      },
    );

    return DescribeComplianceByResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns status information for each of your Config managed rules. The
  /// status includes information such as the last time Config invoked the rule,
  /// the last time Config failed to invoke the rule, and the related error for
  /// the last failure.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [configRuleNames] :
  /// The name of the Config managed rules for which you want status
  /// information. If you do not specify any names, Config returns status
  /// information for all Config managed rules that you use.
  ///
  /// Parameter [limit] :
  /// The number of rule evaluation results that you want returned.
  ///
  /// This parameter is required if the rule limit for your account is more than
  /// the default of 1000 rules.
  ///
  /// For information about requesting a rule limit increase, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config">Config
  /// Limits</a> in the <i>Amazon Web Services General Reference Guide</i>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeConfigRuleEvaluationStatusResponse>
      describeConfigRuleEvaluationStatus({
    List<String>? configRuleNames,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConfigRuleEvaluationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConfigRuleEvaluationStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns details about your Config rules.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleNames] :
  /// The names of the Config rules for which you want details. If you do not
  /// specify any names, Config returns details for all your rules.
  ///
  /// Parameter [filters] :
  /// Returns a list of Detective or Proactive Config rules. By default, this
  /// API returns an unfiltered list. For more information on Detective or
  /// Proactive Config rules, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html">
  /// <b>Evaluation Mode</b> </a> in the <i>Config Developer Guide</i>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeConfigRulesResponse> describeConfigRules({
    List<String>? configRuleNames,
    DescribeConfigRulesFilters? filters,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConfigRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
        if (filters != null) 'Filters': filters,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConfigRulesResponse.fromJson(jsonResponse.body);
  }

  /// Returns status information for sources within an aggregator. The status
  /// includes information about the last time Config verified authorization
  /// between the source account and an aggregator account. In case of a
  /// failure, the status contains the related error code or message.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchConfigurationAggregatorException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [limit] :
  /// The maximum number of AggregatorSourceStatus returned on each page. The
  /// default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [updateStatus] :
  /// Filters the status type.
  ///
  /// <ul>
  /// <li>
  /// Valid value FAILED indicates errors while moving data.
  /// </li>
  /// <li>
  /// Valid value SUCCEEDED indicates the data was successfully moved.
  /// </li>
  /// <li>
  /// Valid value OUTDATED indicates the data is not the most recent.
  /// </li>
  /// </ul>
  Future<DescribeConfigurationAggregatorSourcesStatusResponse>
      describeConfigurationAggregatorSourcesStatus({
    required String configurationAggregatorName,
    int? limit,
    String? nextToken,
    List<AggregatedSourceStatusType>? updateStatus,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.DescribeConfigurationAggregatorSourcesStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (updateStatus != null)
          'UpdateStatus': updateStatus.map((e) => e.value).toList(),
      },
    );

    return DescribeConfigurationAggregatorSourcesStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the details of one or more configuration aggregators. If the
  /// configuration aggregator is not specified, this action returns the details
  /// for all the configuration aggregators associated with the account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchConfigurationAggregatorException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  ///
  /// Parameter [configurationAggregatorNames] :
  /// The name of the configuration aggregators.
  ///
  /// Parameter [limit] :
  /// The maximum number of configuration aggregators returned on each page. The
  /// default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeConfigurationAggregatorsResponse>
      describeConfigurationAggregators({
    List<String>? configurationAggregatorNames,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConfigurationAggregators'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configurationAggregatorNames != null)
          'ConfigurationAggregatorNames': configurationAggregatorNames,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConfigurationAggregatorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the current status of the specified configuration recorder as well
  /// as the status of the last recording event for the recorder. If a
  /// configuration recorder is not specified, this action returns the status of
  /// all configuration recorders associated with the account.
  /// <note>
  /// &gt;You can specify only one configuration recorder for each Amazon Web
  /// Services Region for each account. For a detailed status of recording
  /// events over time, add your Config events to Amazon CloudWatch metrics and
  /// use CloudWatch metrics.
  /// </note>
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  ///
  /// Parameter [configurationRecorderNames] :
  /// The name(s) of the configuration recorder. If the name is not specified,
  /// the action returns the current status of all the configuration recorders
  /// associated with the account.
  Future<DescribeConfigurationRecorderStatusResponse>
      describeConfigurationRecorderStatus({
    List<String>? configurationRecorderNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConfigurationRecorderStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configurationRecorderNames != null)
          'ConfigurationRecorderNames': configurationRecorderNames,
      },
    );

    return DescribeConfigurationRecorderStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the details for the specified configuration recorders. If the
  /// configuration recorder is not specified, this action returns the details
  /// for all configuration recorders associated with the account.
  /// <note>
  /// You can specify only one configuration recorder for each Amazon Web
  /// Services Region for each account.
  /// </note>
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  ///
  /// Parameter [configurationRecorderNames] :
  /// A list of configuration recorder names.
  Future<DescribeConfigurationRecordersResponse>
      describeConfigurationRecorders({
    List<String>? configurationRecorderNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConfigurationRecorders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configurationRecorderNames != null)
          'ConfigurationRecorderNames': configurationRecorderNames,
      },
    );

    return DescribeConfigurationRecordersResponse.fromJson(jsonResponse.body);
  }

  /// Returns compliance details for each rule in that conformance pack.
  /// <note>
  /// You must provide exact rule names.
  /// </note>
  ///
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchConfigRuleInConformancePackException].
  /// May throw [NoSuchConformancePackException].
  ///
  /// Parameter [conformancePackName] :
  /// Name of the conformance pack.
  ///
  /// Parameter [filters] :
  /// A <code>ConformancePackComplianceFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of Config rules within a conformance pack are returned
  /// on each page.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  Future<DescribeConformancePackComplianceResponse>
      describeConformancePackCompliance({
    required String conformancePackName,
    ConformancePackComplianceFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConformancePackCompliance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConformancePackName': conformancePackName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConformancePackComplianceResponse.fromJson(
        jsonResponse.body);
  }

  /// Provides one or more conformance packs deployment status.
  /// <note>
  /// If there are no conformance packs then you will see an empty result.
  /// </note>
  ///
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [conformancePackNames] :
  /// Comma-separated list of conformance pack names.
  ///
  /// Parameter [limit] :
  /// The maximum number of conformance packs status returned on each page.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  Future<DescribeConformancePackStatusResponse> describeConformancePackStatus({
    List<String>? conformancePackNames,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConformancePackStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (conformancePackNames != null)
          'ConformancePackNames': conformancePackNames,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConformancePackStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of one or more conformance packs.
  ///
  /// May throw [NoSuchConformancePackException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [conformancePackNames] :
  /// Comma-separated list of conformance pack names for which you want details.
  /// If you do not specify any names, Config returns details for all your
  /// conformance packs.
  ///
  /// Parameter [limit] :
  /// The maximum number of conformance packs returned on each page.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  Future<DescribeConformancePacksResponse> describeConformancePacks({
    List<String>? conformancePackNames,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeConformancePacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (conformancePackNames != null)
          'ConformancePackNames': conformancePackNames,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConformancePacksResponse.fromJson(jsonResponse.body);
  }

  /// Returns the current status of the specified delivery channel. If a
  /// delivery channel is not specified, this action returns the current status
  /// of all delivery channels associated with the account.
  /// <note>
  /// Currently, you can specify only one delivery channel per region in your
  /// account.
  /// </note>
  ///
  /// May throw [NoSuchDeliveryChannelException].
  ///
  /// Parameter [deliveryChannelNames] :
  /// A list of delivery channel names.
  Future<DescribeDeliveryChannelStatusResponse> describeDeliveryChannelStatus({
    List<String>? deliveryChannelNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeDeliveryChannelStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deliveryChannelNames != null)
          'DeliveryChannelNames': deliveryChannelNames,
      },
    );

    return DescribeDeliveryChannelStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns details about the specified delivery channel. If a delivery
  /// channel is not specified, this action returns the details of all delivery
  /// channels associated with the account.
  /// <note>
  /// Currently, you can specify only one delivery channel per region in your
  /// account.
  /// </note>
  ///
  /// May throw [NoSuchDeliveryChannelException].
  ///
  /// Parameter [deliveryChannelNames] :
  /// A list of delivery channel names.
  Future<DescribeDeliveryChannelsResponse> describeDeliveryChannels({
    List<String>? deliveryChannelNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeDeliveryChannels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deliveryChannelNames != null)
          'DeliveryChannelNames': deliveryChannelNames,
      },
    );

    return DescribeDeliveryChannelsResponse.fromJson(jsonResponse.body);
  }

  /// Provides organization Config rule deployment status for an organization.
  /// <note>
  /// The status is not considered successful until organization Config rule is
  /// successfully deployed in all the member accounts with an exception of
  /// excluded accounts.
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization Config rule names. It is only applicable, when you request
  /// all the organization Config rules.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>OrganizationConfigRuleStatuses</code> returned
  /// on each page. If you do no specify a number, Config uses the default. The
  /// default is 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [organizationConfigRuleNames] :
  /// The names of organization Config rules for which you want status details.
  /// If you do not specify any names, Config returns details for all your
  /// organization Config rules.
  Future<DescribeOrganizationConfigRuleStatusesResponse>
      describeOrganizationConfigRuleStatuses({
    int? limit,
    String? nextToken,
    List<String>? organizationConfigRuleNames,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.DescribeOrganizationConfigRuleStatuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (organizationConfigRuleNames != null)
          'OrganizationConfigRuleNames': organizationConfigRuleNames,
      },
    );

    return DescribeOrganizationConfigRuleStatusesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of organization Config rules.
  /// <note>
  /// When you specify the limit and the next token, you receive a paginated
  /// response.
  ///
  /// Limit and next token are not applicable if you specify organization Config
  /// rule names. It is only applicable, when you request all the organization
  /// Config rules.
  ///
  /// <i>For accounts within an organization</i>
  ///
  /// If you deploy an organizational rule or conformance pack in an
  /// organization administrator account, and then establish a delegated
  /// administrator and deploy an organizational rule or conformance pack in the
  /// delegated administrator account, you won't be able to see the
  /// organizational rule or conformance pack in the organization administrator
  /// account from the delegated administrator account or see the organizational
  /// rule or conformance pack in the delegated administrator account from
  /// organization administrator account. The
  /// <code>DescribeOrganizationConfigRules</code> and
  /// <code>DescribeOrganizationConformancePacks</code> APIs can only see and
  /// interact with the organization-related resource that were deployed from
  /// within the account calling those APIs.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of organization Config rules returned on each page. If
  /// you do no specify a number, Config uses the default. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [organizationConfigRuleNames] :
  /// The names of organization Config rules for which you want details. If you
  /// do not specify any names, Config returns details for all your organization
  /// Config rules.
  Future<DescribeOrganizationConfigRulesResponse>
      describeOrganizationConfigRules({
    int? limit,
    String? nextToken,
    List<String>? organizationConfigRuleNames,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeOrganizationConfigRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (organizationConfigRuleNames != null)
          'OrganizationConfigRuleNames': organizationConfigRuleNames,
      },
    );

    return DescribeOrganizationConfigRulesResponse.fromJson(jsonResponse.body);
  }

  /// Provides organization conformance pack deployment status for an
  /// organization.
  /// <note>
  /// The status is not considered successful until organization conformance
  /// pack is successfully deployed in all the member accounts with an exception
  /// of excluded accounts.
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization conformance pack names. They are only applicable, when you
  /// request all the organization conformance packs.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConformancePackException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of OrganizationConformancePackStatuses returned on each
  /// page. If you do no specify a number, Config uses the default. The default
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  ///
  /// Parameter [organizationConformancePackNames] :
  /// The names of organization conformance packs for which you want status
  /// details. If you do not specify any names, Config returns details for all
  /// your organization conformance packs.
  Future<DescribeOrganizationConformancePackStatusesResponse>
      describeOrganizationConformancePackStatuses({
    int? limit,
    String? nextToken,
    List<String>? organizationConformancePackNames,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.DescribeOrganizationConformancePackStatuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (organizationConformancePackNames != null)
          'OrganizationConformancePackNames': organizationConformancePackNames,
      },
    );

    return DescribeOrganizationConformancePackStatusesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of organization conformance packs.
  /// <note>
  /// When you specify the limit and the next token, you receive a paginated
  /// response.
  ///
  /// Limit and next token are not applicable if you specify organization
  /// conformance packs names. They are only applicable, when you request all
  /// the organization conformance packs.
  ///
  /// <i>For accounts within an organization</i>
  ///
  /// If you deploy an organizational rule or conformance pack in an
  /// organization administrator account, and then establish a delegated
  /// administrator and deploy an organizational rule or conformance pack in the
  /// delegated administrator account, you won't be able to see the
  /// organizational rule or conformance pack in the organization administrator
  /// account from the delegated administrator account or see the organizational
  /// rule or conformance pack in the delegated administrator account from
  /// organization administrator account. The
  /// <code>DescribeOrganizationConfigRules</code> and
  /// <code>DescribeOrganizationConformancePacks</code> APIs can only see and
  /// interact with the organization-related resource that were deployed from
  /// within the account calling those APIs.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConformancePackException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of organization config packs returned on each page. If
  /// you do no specify a number, Config uses the default. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  ///
  /// Parameter [organizationConformancePackNames] :
  /// The name that you assign to an organization conformance pack.
  Future<DescribeOrganizationConformancePacksResponse>
      describeOrganizationConformancePacks({
    int? limit,
    String? nextToken,
    List<String>? organizationConformancePackNames,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeOrganizationConformancePacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (organizationConformancePackNames != null)
          'OrganizationConformancePackNames': organizationConformancePackNames,
      },
    );

    return DescribeOrganizationConformancePacksResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of all pending aggregation requests.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribePendingAggregationRequestsResponse>
      describePendingAggregationRequests({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribePendingAggregationRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribePendingAggregationRequestsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the details of one or more remediation configurations.
  ///
  /// Parameter [configRuleNames] :
  /// A list of Config rule names of remediation configurations for which you
  /// want details.
  Future<DescribeRemediationConfigurationsResponse>
      describeRemediationConfigurations({
    required List<String> configRuleNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeRemediationConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleNames': configRuleNames,
      },
    );

    return DescribeRemediationConfigurationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the details of one or more remediation exceptions. A detailed view
  /// of a remediation exception for a set of resources that includes an
  /// explanation of an exception and the time when the exception will be
  /// deleted. When you specify the limit and the next token, you receive a
  /// paginated response.
  /// <note>
  /// Config generates a remediation exception when a problem occurs executing a
  /// remediation action to a specific resource. Remediation exceptions blocks
  /// auto-remediation until the exception is cleared.
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response.
  ///
  /// Limit and next token are not applicable if you request resources in batch.
  /// It is only applicable, when you request all resources.
  /// </note>
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule.
  ///
  /// Parameter [limit] :
  /// The maximum number of RemediationExceptionResourceKey returned on each
  /// page. The default is 25. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. Config adds exception for each resource key. For example,
  /// Config adds 3 exceptions for 3 resource keys.
  Future<DescribeRemediationExceptionsResponse> describeRemediationExceptions({
    required String configRuleName,
    int? limit,
    String? nextToken,
    List<RemediationExceptionResourceKey>? resourceKeys,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeRemediationExceptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceKeys != null) 'ResourceKeys': resourceKeys,
      },
    );

    return DescribeRemediationExceptionsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a detailed view of a Remediation Execution for a set of resources
  /// including state, timestamps for when steps for the remediation execution
  /// occur, and any error messages for steps that have failed. When you specify
  /// the limit and the next token, you receive a paginated response.
  ///
  /// May throw [NoSuchRemediationConfigurationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleName] :
  /// A list of Config rule names.
  ///
  /// Parameter [limit] :
  /// The maximum number of RemediationExecutionStatuses returned on each page.
  /// The default is maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceKeys] :
  /// A list of resource keys to be processed with the current request. Each
  /// element in the list consists of the resource type and resource ID.
  Future<DescribeRemediationExecutionStatusResponse>
      describeRemediationExecutionStatus({
    required String configRuleName,
    int? limit,
    String? nextToken,
    List<ResourceKey>? resourceKeys,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeRemediationExecutionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceKeys != null) 'ResourceKeys': resourceKeys,
      },
    );

    return DescribeRemediationExecutionStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the details of one or more retention configurations. If the
  /// retention configuration name is not specified, this action returns the
  /// details for all the retention configurations for that account.
  /// <note>
  /// Currently, Config supports only one retention configuration per region in
  /// your account.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchRetentionConfigurationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [retentionConfigurationNames] :
  /// A list of names of retention configurations for which you want details. If
  /// you do not specify a name, Config returns details for all the retention
  /// configurations for that account.
  /// <note>
  /// Currently, Config supports only one retention configuration per region in
  /// your account.
  /// </note>
  Future<DescribeRetentionConfigurationsResponse>
      describeRetentionConfigurations({
    String? nextToken,
    List<String>? retentionConfigurationNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DescribeRetentionConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (retentionConfigurationNames != null)
          'RetentionConfigurationNames': retentionConfigurationNames,
      },
    );

    return DescribeRetentionConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the evaluation results for the specified Config rule for a
  /// specific resource in a rule. The results indicate which Amazon Web
  /// Services resources were evaluated by the rule, when each resource was last
  /// evaluated, and whether each resource complies with the rule.
  /// <note>
  /// The results can return an empty result page. But if you have a
  /// <code>nextToken</code>, the results are displayed on the next page.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [accountId] :
  /// The 12-digit account ID of the source account.
  ///
  /// Parameter [awsRegion] :
  /// The source region from where the data is aggregated.
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want compliance information.
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [complianceType] :
  /// The resource compliance status.
  /// <note>
  /// For the <code>GetAggregateComplianceDetailsByConfigRuleRequest</code> data
  /// type, Config supports only the <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. Config does not support the
  /// <code>NOT_APPLICABLE</code> and <code>INSUFFICIENT_DATA</code> values.
  /// </note>
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 50. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetAggregateComplianceDetailsByConfigRuleResponse>
      getAggregateComplianceDetailsByConfigRule({
    required String accountId,
    required String awsRegion,
    required String configRuleName,
    required String configurationAggregatorName,
    ComplianceType? complianceType,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.GetAggregateComplianceDetailsByConfigRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'AwsRegion': awsRegion,
        'ConfigRuleName': configRuleName,
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (complianceType != null) 'ComplianceType': complianceType.value,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateComplianceDetailsByConfigRuleResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the number of compliant and noncompliant rules for one or more
  /// accounts and regions in an aggregator.
  /// <note>
  /// The results can return an empty result page, but if you have a nextToken,
  /// the results are displayed on the next page.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [filters] :
  /// Filters the results based on the ConfigRuleComplianceSummaryFilters
  /// object.
  ///
  /// Parameter [groupByKey] :
  /// Groups the result based on ACCOUNT_ID or AWS_REGION.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 1000. You cannot specify a number greater than 1000. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetAggregateConfigRuleComplianceSummaryResponse>
      getAggregateConfigRuleComplianceSummary({
    required String configurationAggregatorName,
    ConfigRuleComplianceSummaryFilters? filters,
    ConfigRuleComplianceSummaryGroupKey? groupByKey,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.GetAggregateConfigRuleComplianceSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (filters != null) 'Filters': filters,
        if (groupByKey != null) 'GroupByKey': groupByKey.value,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateConfigRuleComplianceSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the count of compliant and noncompliant conformance packs across
  /// all Amazon Web Services accounts and Amazon Web Services Regions in an
  /// aggregator. You can filter based on Amazon Web Services account ID or
  /// Amazon Web Services Region.
  /// <note>
  /// The results can return an empty result page, but if you have a nextToken,
  /// the results are displayed on the next page.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [filters] :
  /// Filters the results based on the
  /// <code>AggregateConformancePackComplianceSummaryFilters</code> object.
  ///
  /// Parameter [groupByKey] :
  /// Groups the result based on Amazon Web Services account ID or Amazon Web
  /// Services Region.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned on each page. The default is
  /// maximum. If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetAggregateConformancePackComplianceSummaryResponse>
      getAggregateConformancePackComplianceSummary({
    required String configurationAggregatorName,
    AggregateConformancePackComplianceSummaryFilters? filters,
    AggregateConformancePackComplianceSummaryGroupKey? groupByKey,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.GetAggregateConformancePackComplianceSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (filters != null) 'Filters': filters,
        if (groupByKey != null) 'GroupByKey': groupByKey.value,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateConformancePackComplianceSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the resource counts across accounts and regions that are present
  /// in your Config aggregator. You can request the resource counts by
  /// providing filters and GroupByKey.
  ///
  /// For example, if the input contains accountID 12345678910 and region
  /// us-east-1 in filters, the API returns the count of resources in account ID
  /// 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a
  /// GroupByKey, the API returns resource counts for all source accounts that
  /// are present in your aggregator.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [filters] :
  /// Filters the results based on the <code>ResourceCountFilters</code> object.
  ///
  /// Parameter [groupByKey] :
  /// The key to group the resource counts.
  ///
  /// Parameter [limit] :
  /// The maximum number of <a>GroupedResourceCount</a> objects returned on each
  /// page. The default is 1000. You cannot specify a number greater than 1000.
  /// If you specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetAggregateDiscoveredResourceCountsResponse>
      getAggregateDiscoveredResourceCounts({
    required String configurationAggregatorName,
    ResourceCountFilters? filters,
    ResourceCountGroupKey? groupByKey,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetAggregateDiscoveredResourceCounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (filters != null) 'Filters': filters,
        if (groupByKey != null) 'GroupByKey': groupByKey.value,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateDiscoveredResourceCountsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns configuration item that is aggregated for your specific resource
  /// in a specific source account and region.
  ///
  /// May throw [ValidationException].
  /// May throw [NoSuchConfigurationAggregatorException].
  /// May throw [OversizedConfigurationItemException].
  /// May throw [ResourceNotDiscoveredException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [resourceIdentifier] :
  /// An object that identifies aggregate resource.
  Future<GetAggregateResourceConfigResponse> getAggregateResourceConfig({
    required String configurationAggregatorName,
    required AggregateResourceIdentifier resourceIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetAggregateResourceConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        'ResourceIdentifier': resourceIdentifier,
      },
    );

    return GetAggregateResourceConfigResponse.fromJson(jsonResponse.body);
  }

  /// Returns the evaluation results for the specified Config rule. The results
  /// indicate which Amazon Web Services resources were evaluated by the rule,
  /// when each resource was last evaluated, and whether each resource complies
  /// with the rule.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigRuleException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want compliance information.
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// <code>INSUFFICIENT_DATA</code> is a valid <code>ComplianceType</code> that
  /// is returned when an Config rule cannot be evaluated. However,
  /// <code>INSUFFICIENT_DATA</code> cannot be used as a
  /// <code>ComplianceType</code> for filtering results.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetComplianceDetailsByConfigRuleResponse>
      getComplianceDetailsByConfigRule({
    required String configRuleName,
    List<ComplianceType>? complianceTypes,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetComplianceDetailsByConfigRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        if (complianceTypes != null)
          'ComplianceTypes': complianceTypes.map((e) => e.value).toList(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetComplianceDetailsByConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Returns the evaluation results for the specified Amazon Web Services
  /// resource. The results indicate which Config rules were used to evaluate
  /// the resource, when each rule was last invoked, and whether the resource
  /// complies with each rule.
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// <code>INSUFFICIENT_DATA</code> is a valid <code>ComplianceType</code> that
  /// is returned when an Config rule cannot be evaluated. However,
  /// <code>INSUFFICIENT_DATA</code> cannot be used as a
  /// <code>ComplianceType</code> for filtering results.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceEvaluationId] :
  /// The unique ID of Amazon Web Services resource execution for which you want
  /// to retrieve evaluation results.
  /// <note>
  /// You need to only provide either a <code>ResourceEvaluationID</code> or a
  /// <code>ResourceID </code>and <code>ResourceType</code>.
  /// </note>
  ///
  /// Parameter [resourceId] :
  /// The ID of the Amazon Web Services resource for which you want compliance
  /// information.
  ///
  /// Parameter [resourceType] :
  /// The type of the Amazon Web Services resource for which you want compliance
  /// information.
  Future<GetComplianceDetailsByResourceResponse>
      getComplianceDetailsByResource({
    List<ComplianceType>? complianceTypes,
    String? nextToken,
    String? resourceEvaluationId,
    String? resourceId,
    String? resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetComplianceDetailsByResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (complianceTypes != null)
          'ComplianceTypes': complianceTypes.map((e) => e.value).toList(),
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceEvaluationId != null)
          'ResourceEvaluationId': resourceEvaluationId,
        if (resourceId != null) 'ResourceId': resourceId,
        if (resourceType != null) 'ResourceType': resourceType,
      },
    );

    return GetComplianceDetailsByResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns the number of Config rules that are compliant and noncompliant, up
  /// to a maximum of 25 for each.
  Future<GetComplianceSummaryByConfigRuleResponse>
      getComplianceSummaryByConfigRule() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetComplianceSummaryByConfigRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetComplianceSummaryByConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Returns the number of resources that are compliant and the number that are
  /// noncompliant. You can specify one or more resource types to get these
  /// numbers for each resource type. The maximum number returned is 100.
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [resourceTypes] :
  /// Specify one or more resource types to get the number of resources that are
  /// compliant and the number that are noncompliant for each resource type.
  ///
  /// For this request, you can specify an Amazon Web Services resource type
  /// such as <code>AWS::EC2::Instance</code>. You can specify that the resource
  /// type is an Amazon Web Services account by specifying
  /// <code>AWS::::Account</code>.
  Future<GetComplianceSummaryByResourceTypeResponse>
      getComplianceSummaryByResourceType({
    List<String>? resourceTypes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetComplianceSummaryByResourceType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      },
    );

    return GetComplianceSummaryByResourceTypeResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns compliance details of a conformance pack for all Amazon Web
  /// Services resources that are monitered by conformance pack.
  ///
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConformancePackException].
  /// May throw [NoSuchConfigRuleInConformancePackException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [conformancePackName] :
  /// Name of the conformance pack.
  ///
  /// Parameter [filters] :
  /// A <code>ConformancePackEvaluationFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. If you do
  /// no specify a number, Config uses the default. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  Future<GetConformancePackComplianceDetailsResponse>
      getConformancePackComplianceDetails({
    required String conformancePackName,
    ConformancePackEvaluationFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetConformancePackComplianceDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConformancePackName': conformancePackName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetConformancePackComplianceDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns compliance details for the conformance pack based on the
  /// cumulative compliance results of all the rules in that conformance pack.
  ///
  /// May throw [NoSuchConformancePackException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [conformancePackNames] :
  /// Names of conformance packs.
  ///
  /// Parameter [limit] :
  /// The maximum number of conformance packs returned on each page.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  Future<GetConformancePackComplianceSummaryResponse>
      getConformancePackComplianceSummary({
    required List<String> conformancePackNames,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetConformancePackComplianceSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConformancePackNames': conformancePackNames,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetConformancePackComplianceSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the policy definition containing the logic for your Config Custom
  /// Policy rule.
  ///
  /// May throw [NoSuchConfigRuleException].
  ///
  /// Parameter [configRuleName] :
  /// The name of your Config Custom Policy rule.
  Future<GetCustomRulePolicyResponse> getCustomRulePolicy({
    String? configRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetCustomRulePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configRuleName != null) 'ConfigRuleName': configRuleName,
      },
    );

    return GetCustomRulePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns the resource types, the number of each resource type, and the
  /// total number of resources that Config is recording in this region for your
  /// Amazon Web Services account.
  /// <p class="title"> <b>Example</b>
  /// <ol>
  /// <li>
  /// Config is recording three resource types in the US East (Ohio) Region for
  /// your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.
  /// </li>
  /// <li>
  /// You make a call to the <code>GetDiscoveredResourceCounts</code> action and
  /// specify that you want all resource types.
  /// </li>
  /// <li>
  /// Config returns the following:
  ///
  /// <ul>
  /// <li>
  /// The resource types (EC2 instances, IAM users, and S3 buckets).
  /// </li>
  /// <li>
  /// The number of each resource type (25, 20, and 15).
  /// </li>
  /// <li>
  /// The total number of all resources (60).
  /// </li>
  /// </ul> </li> </ol>
  /// The response is paginated. By default, Config lists 100
  /// <a>ResourceCount</a> objects on each page. You can customize this number
  /// with the <code>limit</code> parameter. The response includes a
  /// <code>nextToken</code> string. To get the next page of results, run the
  /// request again and specify the string for the <code>nextToken</code>
  /// parameter.
  /// <note>
  /// If you make a call to the <a>GetDiscoveredResourceCounts</a> action, you
  /// might not immediately receive resource counts in the following situations:
  ///
  /// <ul>
  /// <li>
  /// You are a new Config customer.
  /// </li>
  /// <li>
  /// You just enabled resource recording.
  /// </li>
  /// </ul>
  /// It might take a few minutes for Config to record and count your resources.
  /// Wait a few minutes and then retry the <a>GetDiscoveredResourceCounts</a>
  /// action.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [limit] :
  /// The maximum number of <a>ResourceCount</a> objects returned on each page.
  /// The default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceTypes] :
  /// The comma-separated list that specifies the resource types that you want
  /// Config to return (for example, <code>"AWS::EC2::Instance"</code>,
  /// <code>"AWS::IAM::User"</code>).
  ///
  /// If a value for <code>resourceTypes</code> is not specified, Config returns
  /// all resource types that Config is recording in the region for your
  /// account.
  /// <note>
  /// If the configuration recorder is turned off, Config returns an empty list
  /// of <a>ResourceCount</a> objects. If the configuration recorder is not
  /// recording a specific resource type (for example, S3 buckets), that
  /// resource type is not returned in the list of <a>ResourceCount</a> objects.
  /// </note>
  Future<GetDiscoveredResourceCountsResponse> getDiscoveredResourceCounts({
    int? limit,
    String? nextToken,
    List<String>? resourceTypes,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetDiscoveredResourceCounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (resourceTypes != null) 'resourceTypes': resourceTypes,
      },
    );

    return GetDiscoveredResourceCountsResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed status for each member account within an organization for
  /// a given organization Config rule.
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name of your organization Config rule for which you want status
  /// details for member accounts.
  ///
  /// Parameter [filters] :
  /// A <code>StatusDetailFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>OrganizationConfigRuleDetailedStatus</code>
  /// returned on each page. If you do not specify a number, Config uses the
  /// default. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetOrganizationConfigRuleDetailedStatusResponse>
      getOrganizationConfigRuleDetailedStatus({
    required String organizationConfigRuleName,
    StatusDetailFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.GetOrganizationConfigRuleDetailedStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConfigRuleName': organizationConfigRuleName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetOrganizationConfigRuleDetailedStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns detailed status for each member account within an organization for
  /// a given organization conformance pack.
  ///
  /// May throw [NoSuchOrganizationConformancePackException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConformancePackName] :
  /// The name of organization conformance pack for which you want status
  /// details for member accounts.
  ///
  /// Parameter [filters] :
  /// An <code>OrganizationResourceDetailedStatusFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of
  /// <code>OrganizationConformancePackDetailedStatuses</code> returned on each
  /// page. If you do not specify a number, Config uses the default. The default
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  Future<GetOrganizationConformancePackDetailedStatusResponse>
      getOrganizationConformancePackDetailedStatus({
    required String organizationConformancePackName,
    OrganizationResourceDetailedStatusFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'StarlingDoveService.GetOrganizationConformancePackDetailedStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConformancePackName': organizationConformancePackName,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetOrganizationConformancePackDetailedStatusResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the policy definition containing the logic for your organization
  /// Config Custom Policy rule.
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name of your organization Config Custom Policy rule.
  Future<GetOrganizationCustomRulePolicyResponse>
      getOrganizationCustomRulePolicy({
    required String organizationConfigRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetOrganizationCustomRulePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConfigRuleName': organizationConfigRuleName,
      },
    );

    return GetOrganizationCustomRulePolicyResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// For accurate reporting on the compliance status, you must record the
  /// <code>AWS::Config::ResourceCompliance</code> resource type. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html">Selecting
  /// Which Resources Config Records</a>.
  /// </important>
  /// Returns a list of <code>ConfigurationItems</code> for the specified
  /// resource. The list contains details about each state of the resource
  /// during the specified time interval. If you specified a retention period to
  /// retain your <code>ConfigurationItems</code> between a minimum of 30 days
  /// and a maximum of 7 years (2557 days), Config returns the
  /// <code>ConfigurationItems</code> for the specified retention period.
  ///
  /// The response is paginated. By default, Config returns a limit of 10
  /// configuration items per page. You can customize this number with the
  /// <code>limit</code> parameter. The response includes a
  /// <code>nextToken</code> string. To get the next page of results, run the
  /// request again and specify the string for the <code>nextToken</code>
  /// parameter.
  /// <note>
  /// Each call to the API is limited to span a duration of seven days. It is
  /// likely that the number of records returned is smaller than the specified
  /// <code>limit</code>. In such cases, you can make another call, using the
  /// <code>nextToken</code>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidTimeRangeException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoAvailableConfigurationRecorderException].
  /// May throw [ResourceNotDiscoveredException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource (for example., <code>sg-xxxxxx</code>).
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// Parameter [chronologicalOrder] :
  /// The chronological order for configuration items listed. By default, the
  /// results are listed in reverse chronological order.
  ///
  /// Parameter [earlierTime] :
  /// The chronologically earliest time in the time range for which the history
  /// requested. If not specified, the action returns paginated results that
  /// contain configuration items that start when the first configuration item
  /// was recorded.
  ///
  /// Parameter [laterTime] :
  /// The chronologically latest time in the time range for which the history
  /// requested. If not specified, current time is taken.
  ///
  /// Parameter [limit] :
  /// The maximum number of configuration items returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetResourceConfigHistoryResponse> getResourceConfigHistory({
    required String resourceId,
    required ResourceType resourceType,
    ChronologicalOrder? chronologicalOrder,
    DateTime? earlierTime,
    DateTime? laterTime,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetResourceConfigHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceId': resourceId,
        'resourceType': resourceType.value,
        if (chronologicalOrder != null)
          'chronologicalOrder': chronologicalOrder.value,
        if (earlierTime != null)
          'earlierTime': unixTimestampToJson(earlierTime),
        if (laterTime != null) 'laterTime': unixTimestampToJson(laterTime),
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetResourceConfigHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Returns a summary of resource evaluation for the specified resource
  /// evaluation ID from the proactive rules that were run. The results indicate
  /// which evaluation context was used to evaluate the rules, which resource
  /// details were evaluated, the evaluation mode that was run, and whether the
  /// resource details comply with the configuration of the proactive rules.
  /// <note>
  /// To see additional information about the evaluation result, such as which
  /// rule flagged a resource as NON_COMPLIANT, use the <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_GetComplianceDetailsByResource.html">GetComplianceDetailsByResource</a>
  /// API. For more information, see the <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceEvaluationSummary.html#API_GetResourceEvaluationSummary_Examples">Examples</a>
  /// section.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceEvaluationId] :
  /// The unique <code>ResourceEvaluationId</code> of Amazon Web Services
  /// resource execution for which you want to retrieve the evaluation summary.
  Future<GetResourceEvaluationSummaryResponse> getResourceEvaluationSummary({
    required String resourceEvaluationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetResourceEvaluationSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceEvaluationId': resourceEvaluationId,
      },
    );

    return GetResourceEvaluationSummaryResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of a specific stored query.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [queryName] :
  /// The name of the query.
  Future<GetStoredQueryResponse> getStoredQuery({
    required String queryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.GetStoredQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryName': queryName,
      },
    );

    return GetStoredQueryResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a resource type and returns a list of resource identifiers that
  /// are aggregated for a specific resource type across accounts and regions. A
  /// resource identifier includes the resource type, ID, (if available) the
  /// custom resource name, source account, and source region. You can narrow
  /// the results to include only resources that have specific resource IDs, or
  /// a resource name, or source account ID, or source region.
  ///
  /// For example, if the input consists of accountID 12345678910 and the region
  /// is us-east-1 for resource type <code>AWS::EC2::Instance</code> then the
  /// API returns all the EC2 instance identifiers of accountID 12345678910 and
  /// region us-east-1.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigurationAggregatorException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [resourceType] :
  /// The type of resources that you want Config to list in the response.
  ///
  /// Parameter [filters] :
  /// Filters the results based on the <code>ResourceFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of resource identifiers returned on each page. You
  /// cannot specify a number greater than 100. If you specify 0, Config uses
  /// the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<ListAggregateDiscoveredResourcesResponse>
      listAggregateDiscoveredResources({
    required String configurationAggregatorName,
    required ResourceType resourceType,
    ResourceFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListAggregateDiscoveredResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        'ResourceType': resourceType.value,
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAggregateDiscoveredResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of conformance pack compliance scores. A compliance score
  /// is the percentage of the number of compliant rule-resource combinations in
  /// a conformance pack compared to the number of total possible rule-resource
  /// combinations in the conformance pack. This metric provides you with a
  /// high-level view of the compliance state of your conformance packs. You can
  /// use it to identify, investigate, and understand the level of compliance in
  /// your conformance packs.
  /// <note>
  /// Conformance packs with no evaluation results will have a compliance score
  /// of <code>INSUFFICIENT_DATA</code>.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [filters] :
  /// Filters the results based on the
  /// <code>ConformancePackComplianceScoresFilters</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of conformance pack compliance scores returned on each
  /// page.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string in a prior request that you can use to
  /// get the paginated response for the next set of conformance pack compliance
  /// scores.
  ///
  /// Parameter [sortBy] :
  /// Sorts your conformance pack compliance scores in either ascending or
  /// descending order, depending on <code>SortOrder</code>.
  ///
  /// By default, conformance pack compliance scores are sorted in alphabetical
  /// order by name of the conformance pack. Enter <code>SCORE</code>, to sort
  /// conformance pack compliance scores by the numerical value of the
  /// compliance score.
  ///
  /// Parameter [sortOrder] :
  /// Determines the order in which conformance pack compliance scores are
  /// sorted. Either in ascending or descending order.
  ///
  /// By default, conformance pack compliance scores are sorted in alphabetical
  /// order by name of the conformance pack. Conformance pack compliance scores
  /// are sorted in reverse alphabetical order if you enter
  /// <code>DESCENDING</code>.
  ///
  /// You can sort conformance pack compliance scores by the numerical value of
  /// the compliance score by entering <code>SCORE</code> in the
  /// <code>SortBy</code> action. When compliance scores are sorted by
  /// <code>SCORE</code>, conformance packs with a compliance score of
  /// <code>INSUFFICIENT_DATA</code> will be last when sorting by ascending
  /// order and first when sorting by descending order.
  Future<ListConformancePackComplianceScoresResponse>
      listConformancePackComplianceScores({
    ConformancePackComplianceScoresFilters? filters,
    int? limit,
    String? nextToken,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListConformancePackComplianceScores'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.value,
        if (sortOrder != null) 'SortOrder': sortOrder.value,
      },
    );

    return ListConformancePackComplianceScoresResponse.fromJson(
        jsonResponse.body);
  }

  /// Accepts a resource type and returns a list of resource identifiers for the
  /// resources of that type. A resource identifier includes the resource type,
  /// ID, and (if available) the custom resource name. The results consist of
  /// resources that Config has discovered, including those that Config is not
  /// currently recording. You can narrow the results to include only resources
  /// that have specific resource IDs or a resource name.
  /// <note>
  /// You can specify either resource IDs or a resource name, but not both, in
  /// the same request.
  /// </note>
  /// The response is paginated. By default, Config lists 100 resource
  /// identifiers on each page. You can customize this number with the
  /// <code>limit</code> parameter. The response includes a
  /// <code>nextToken</code> string. To get the next page of results, run the
  /// request again and specify the string for the <code>nextToken</code>
  /// parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoAvailableConfigurationRecorderException].
  ///
  /// Parameter [resourceType] :
  /// The type of resources that you want Config to list in the response.
  ///
  /// Parameter [includeDeletedResources] :
  /// Specifies whether Config includes deleted resources in the results. By
  /// default, deleted resources are not included.
  ///
  /// Parameter [limit] :
  /// The maximum number of resource identifiers returned on each page. The
  /// default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceIds] :
  /// The IDs of only those resources that you want Config to list in the
  /// response. If you do not specify this parameter, Config lists all resources
  /// of the specified type that it has discovered. You can list a minimum of 1
  /// resourceID and a maximum of 20 resourceIds.
  ///
  /// Parameter [resourceName] :
  /// The custom name of only those resources that you want Config to list in
  /// the response. If you do not specify this parameter, Config lists all
  /// resources of the specified type that it has discovered.
  Future<ListDiscoveredResourcesResponse> listDiscoveredResources({
    required ResourceType resourceType,
    bool? includeDeletedResources,
    int? limit,
    String? nextToken,
    List<String>? resourceIds,
    String? resourceName,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListDiscoveredResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceType': resourceType.value,
        if (includeDeletedResources != null)
          'includeDeletedResources': includeDeletedResources,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (resourceIds != null) 'resourceIds': resourceIds,
        if (resourceName != null) 'resourceName': resourceName,
      },
    );

    return ListDiscoveredResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of proactive resource evaluations.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidTimeRangeException].
  ///
  /// Parameter [filters] :
  /// Returns a <code>ResourceEvaluationFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluations returned on each page. The default is
  /// 10. You cannot specify a number greater than 100. If you specify 0, Config
  /// uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<ListResourceEvaluationsResponse> listResourceEvaluations({
    ResourceEvaluationFilters? filters,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListResourceEvaluations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourceEvaluationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the stored queries for a single Amazon Web Services account and a
  /// single Amazon Web Services Region. The default is 100.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned in a previous request that you use to
  /// request the next page of results in a paginated response.
  Future<ListStoredQueriesResponse> listStoredQueries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListStoredQueries'
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

    return ListStoredQueriesResponse.fromJson(jsonResponse.body);
  }

  /// List the tags for Config resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the supported resources are
  /// <code>ConfigRule</code>, <code>ConfigurationAggregator</code> and
  /// <code>AggregatorAuthorization</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of tags returned on each page. The limit maximum is 50.
  /// You cannot specify a number greater than 50. If you specify 0, Config uses
  /// the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Authorizes the aggregator account and region to collect data from the
  /// source account and region.
  /// <note>
  /// <code>PutAggregationAuthorization</code> is an idempotent API. Subsequent
  /// requests won’t create a duplicate resource if one was already created. If
  /// a following request has different <code>tags</code> values, Config will
  /// ignore these differences and treat it as an idempotent request of the
  /// previous. In this case, <code>tags</code> will not be updated, even if
  /// they are different.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [authorizedAccountId] :
  /// The 12-digit account ID of the account authorized to aggregate data.
  ///
  /// Parameter [authorizedAwsRegion] :
  /// The region authorized to collect aggregated data.
  ///
  /// Parameter [tags] :
  /// An array of tag object.
  Future<PutAggregationAuthorizationResponse> putAggregationAuthorization({
    required String authorizedAccountId,
    required String authorizedAwsRegion,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutAggregationAuthorization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthorizedAccountId': authorizedAccountId,
        'AuthorizedAwsRegion': authorizedAwsRegion,
        if (tags != null) 'Tags': tags,
      },
    );

    return PutAggregationAuthorizationResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates an Config rule to evaluate if your Amazon Web Services
  /// resources comply with your desired configurations. For information on how
  /// many Config rules you can have per account, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html">
  /// <b>Service Limits</b> </a> in the <i>Config Developer Guide</i>.
  ///
  /// There are two types of rules: <i>Config Managed Rules</i> and <i>Config
  /// Custom Rules</i>. You can use <code>PutConfigRule</code> to create both
  /// Config Managed Rules and Config Custom Rules.
  ///
  /// Config Managed Rules are predefined, customizable rules created by Config.
  /// For a list of managed rules, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html">List
  /// of Config Managed Rules</a>. If you are adding an Config managed rule, you
  /// must specify the rule's identifier for the <code>SourceIdentifier</code>
  /// key.
  ///
  /// Config Custom Rules are rules that you create from scratch. There are two
  /// ways to create Config custom rules: with Lambda functions (<a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function">
  /// Lambda Developer Guide</a>) and with Guard (<a
  /// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
  /// GitHub Repository</a>), a policy-as-code language. Config custom rules
  /// created with Lambda are called <i>Config Custom Lambda Rules</i> and
  /// Config custom rules created with Guard are called <i>Config Custom Policy
  /// Rules</i>.
  ///
  /// If you are adding a new Config Custom Lambda rule, you first need to
  /// create an Lambda function that the rule invokes to evaluate your
  /// resources. When you use <code>PutConfigRule</code> to add a Custom Lambda
  /// rule to Config, you must specify the Amazon Resource Name (ARN) that
  /// Lambda assigns to the function. You specify the ARN in the
  /// <code>SourceIdentifier</code> key. This key is part of the
  /// <code>Source</code> object, which is part of the <code>ConfigRule</code>
  /// object.
  ///
  /// For any new Config rule that you add, specify the
  /// <code>ConfigRuleName</code> in the <code>ConfigRule</code> object. Do not
  /// specify the <code>ConfigRuleArn</code> or the <code>ConfigRuleId</code>.
  /// These values are generated by Config for new rules.
  ///
  /// If you are updating a rule that you added previously, you can specify the
  /// rule by <code>ConfigRuleName</code>, <code>ConfigRuleId</code>, or
  /// <code>ConfigRuleArn</code> in the <code>ConfigRule</code> data type that
  /// you use in this request.
  ///
  /// For more information about developing and using Config rules, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html">Evaluating
  /// Resources with Config Rules</a> in the <i>Config Developer Guide</i>.
  /// <note>
  /// <code>PutConfigRule</code> is an idempotent API. Subsequent requests won’t
  /// create a duplicate resource if one was already created. If a following
  /// request has different <code>tags</code> values, Config will ignore these
  /// differences and treat it as an idempotent request of the previous. In this
  /// case, <code>tags</code> will not be updated, even if they are different.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MaxNumberOfConfigRulesExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [NoAvailableConfigurationRecorderException].
  ///
  /// Parameter [configRule] :
  /// The rule that you want to add to your account.
  ///
  /// Parameter [tags] :
  /// An array of tag object.
  Future<void> putConfigRule({
    required ConfigRule configRule,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConfigRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRule': configRule,
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Creates and updates the configuration aggregator with the selected source
  /// accounts and regions. The source account can be individual account(s) or
  /// an organization.
  ///
  /// <code>accountIds</code> that are passed will be replaced with existing
  /// accounts. If you want to add additional accounts into the aggregator, call
  /// <code>DescribeConfigurationAggregators</code> to get the previous accounts
  /// and then append new ones.
  /// <note>
  /// Config should be enabled in source accounts and regions you want to
  /// aggregate.
  ///
  /// If your source type is an organization, you must be signed in to the
  /// management account or a registered delegated administrator and all the
  /// features must be enabled in your organization. If the caller is a
  /// management account, Config calls <code>EnableAwsServiceAccess</code> API
  /// to enable integration between Config and Organizations. If the caller is a
  /// registered delegated administrator, Config calls
  /// <code>ListDelegatedAdministrators</code> API to verify whether the caller
  /// is a valid delegated administrator.
  ///
  /// To register a delegated administrator, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli">Register
  /// a Delegated Administrator</a> in the <i>Config developer guide</i>.
  /// </note> <note>
  /// <code>PutConfigurationAggregator</code> is an idempotent API. Subsequent
  /// requests won’t create a duplicate resource if one was already created. If
  /// a following request has different <code>tags</code> values, Config will
  /// ignore these differences and treat it as an idempotent request of the
  /// previous. In this case, <code>tags</code> will not be updated, even if
  /// they are different.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRoleException].
  /// May throw [OrganizationAccessDeniedException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [OrganizationAllFeaturesNotEnabledException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [accountAggregationSources] :
  /// A list of AccountAggregationSource object.
  ///
  /// Parameter [organizationAggregationSource] :
  /// An OrganizationAggregationSource object.
  ///
  /// Parameter [tags] :
  /// An array of tag object.
  Future<PutConfigurationAggregatorResponse> putConfigurationAggregator({
    required String configurationAggregatorName,
    List<AccountAggregationSource>? accountAggregationSources,
    OrganizationAggregationSource? organizationAggregationSource,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConfigurationAggregator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        if (accountAggregationSources != null)
          'AccountAggregationSources': accountAggregationSources,
        if (organizationAggregationSource != null)
          'OrganizationAggregationSource': organizationAggregationSource,
        if (tags != null) 'Tags': tags,
      },
    );

    return PutConfigurationAggregatorResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new configuration recorder to record configuration changes for
  /// specified resource types.
  ///
  /// You can also use this action to change the <code>roleARN</code> or the
  /// <code>recordingGroup</code> of an existing recorder. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html">
  /// <b>Managing the Configuration Recorder</b> </a> in the <i>Config Developer
  /// Guide</i>.
  /// <note>
  /// You can specify only one configuration recorder for each Amazon Web
  /// Services Region for each account.
  ///
  /// If the configuration recorder does not have the
  /// <code>recordingGroup</code> field specified, the default is to record all
  /// supported resource types.
  /// </note>
  ///
  /// May throw [MaxNumberOfConfigurationRecordersExceededException].
  /// May throw [ValidationException].
  /// May throw [InvalidConfigurationRecorderNameException].
  /// May throw [InvalidRoleException].
  /// May throw [InvalidRecordingGroupException].
  ///
  /// Parameter [configurationRecorder] :
  /// An object for the configuration recorder to record configuration changes
  /// for specified resource types.
  Future<void> putConfigurationRecorder({
    required ConfigurationRecorder configurationRecorder,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConfigurationRecorder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationRecorder': configurationRecorder,
      },
    );
  }

  /// Creates or updates a conformance pack. A conformance pack is a collection
  /// of Config rules that can be easily deployed in an account and a region and
  /// across an organization. For information on how many conformance packs you
  /// can have per account, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html">
  /// <b>Service Limits</b> </a> in the <i>Config Developer Guide</i>.
  ///
  /// This API creates a service-linked role
  /// <code>AWSServiceRoleForConfigConforms</code> in your account. The
  /// service-linked role is created only when the role does not exist in your
  /// account.
  /// <note>
  /// You must specify only one of the follow parameters:
  /// <code>TemplateS3Uri</code>, <code>TemplateBody</code> or
  /// <code>TemplateSSMDocumentDetails</code>.
  /// </note>
  ///
  /// May throw [InsufficientPermissionsException].
  /// May throw [ConformancePackTemplateValidationException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MaxNumberOfConformancePacksExceededException].
  ///
  /// Parameter [conformancePackName] :
  /// The unique name of the conformance pack you want to deploy.
  ///
  /// Parameter [conformancePackInputParameters] :
  /// A list of <code>ConformancePackInputParameter</code> objects.
  ///
  /// Parameter [deliveryS3Bucket] :
  /// The name of the Amazon S3 bucket where Config stores conformance pack
  /// templates.
  /// <note>
  /// This field is optional.
  /// </note>
  ///
  /// Parameter [deliveryS3KeyPrefix] :
  /// The prefix for the Amazon S3 bucket.
  /// <note>
  /// This field is optional.
  /// </note>
  ///
  /// Parameter [templateBody] :
  /// A string containing the full conformance pack template body. The structure
  /// containing the template body has a minimum length of 1 byte and a maximum
  /// length of 51,200 bytes.
  /// <note>
  /// You can use a YAML template with two resource types: Config rule
  /// (<code>AWS::Config::ConfigRule</code>) and remediation action
  /// (<code>AWS::Config::RemediationConfiguration</code>).
  /// </note>
  ///
  /// Parameter [templateS3Uri] :
  /// The location of the file containing the template body
  /// (<code>s3://bucketname/prefix</code>). The uri must point to a conformance
  /// pack template (max size: 300 KB) that is located in an Amazon S3 bucket in
  /// the same Region as the conformance pack.
  /// <note>
  /// You must have access to read Amazon S3 bucket. In addition, in order to
  /// ensure a successful deployment, the template object must not be in an <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html">archived
  /// storage class</a> if this parameter is passed.
  /// </note>
  ///
  /// Parameter [templateSSMDocumentDetails] :
  /// An object of type <code>TemplateSSMDocumentDetails</code>, which contains
  /// the name or the Amazon Resource Name (ARN) of the Amazon Web Services
  /// Systems Manager document (SSM document) and the version of the SSM
  /// document that is used to create a conformance pack.
  Future<PutConformancePackResponse> putConformancePack({
    required String conformancePackName,
    List<ConformancePackInputParameter>? conformancePackInputParameters,
    String? deliveryS3Bucket,
    String? deliveryS3KeyPrefix,
    String? templateBody,
    String? templateS3Uri,
    TemplateSSMDocumentDetails? templateSSMDocumentDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConformancePack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConformancePackName': conformancePackName,
        if (conformancePackInputParameters != null)
          'ConformancePackInputParameters': conformancePackInputParameters,
        if (deliveryS3Bucket != null) 'DeliveryS3Bucket': deliveryS3Bucket,
        if (deliveryS3KeyPrefix != null)
          'DeliveryS3KeyPrefix': deliveryS3KeyPrefix,
        if (templateBody != null) 'TemplateBody': templateBody,
        if (templateS3Uri != null) 'TemplateS3Uri': templateS3Uri,
        if (templateSSMDocumentDetails != null)
          'TemplateSSMDocumentDetails': templateSSMDocumentDetails,
      },
    );

    return PutConformancePackResponse.fromJson(jsonResponse.body);
  }

  /// Creates a delivery channel object to deliver configuration information and
  /// other compliance information to an Amazon S3 bucket and Amazon SNS topic.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/notifications-for-AWS-Config.html">Notifications
  /// that Config Sends to an Amazon SNS topic</a>.
  ///
  /// Before you can create a delivery channel, you must create a configuration
  /// recorder.
  ///
  /// You can use this action to change the Amazon S3 bucket or an Amazon SNS
  /// topic of the existing delivery channel. To change the Amazon S3 bucket or
  /// an Amazon SNS topic, call this action and specify the changed values for
  /// the S3 bucket and the SNS topic. If you specify a different value for
  /// either the S3 bucket or the SNS topic, this action will keep the existing
  /// value for the parameter that is not changed.
  /// <note>
  /// You can have only one delivery channel per region in your account.
  /// </note>
  ///
  /// May throw [MaxNumberOfDeliveryChannelsExceededException].
  /// May throw [NoAvailableConfigurationRecorderException].
  /// May throw [InvalidDeliveryChannelNameException].
  /// May throw [NoSuchBucketException].
  /// May throw [InvalidS3KeyPrefixException].
  /// May throw [InvalidS3KmsKeyArnException].
  /// May throw [InvalidSNSTopicARNException].
  /// May throw [InsufficientDeliveryPolicyException].
  ///
  /// Parameter [deliveryChannel] :
  /// The configuration delivery channel object that delivers the configuration
  /// information to an Amazon S3 bucket and to an Amazon SNS topic.
  Future<void> putDeliveryChannel({
    required DeliveryChannel deliveryChannel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutDeliveryChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryChannel': deliveryChannel,
      },
    );
  }

  /// Used by an Lambda function to deliver evaluation results to Config. This
  /// action is required in every Lambda function that is invoked by an Config
  /// rule.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResultTokenException].
  /// May throw [NoSuchConfigRuleException].
  ///
  /// Parameter [resultToken] :
  /// An encrypted token that associates an evaluation with an Config rule.
  /// Identifies the rule and the event that triggered the evaluation.
  ///
  /// Parameter [evaluations] :
  /// The assessments that the Lambda function performs. Each evaluation
  /// identifies an Amazon Web Services resource and indicates whether it
  /// complies with the Config rule that invokes the Lambda function.
  ///
  /// Parameter [testMode] :
  /// Use this parameter to specify a test run for <code>PutEvaluations</code>.
  /// You can verify whether your Lambda function will deliver evaluation
  /// results to Config. No updates occur to your existing evaluations, and
  /// evaluation results are not sent to Config.
  /// <note>
  /// When <code>TestMode</code> is <code>true</code>,
  /// <code>PutEvaluations</code> doesn't require a valid value for the
  /// <code>ResultToken</code> parameter, but the value cannot be null.
  /// </note>
  Future<PutEvaluationsResponse> putEvaluations({
    required String resultToken,
    List<Evaluation>? evaluations,
    bool? testMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutEvaluations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResultToken': resultToken,
        if (evaluations != null) 'Evaluations': evaluations,
        if (testMode != null) 'TestMode': testMode,
      },
    );

    return PutEvaluationsResponse.fromJson(jsonResponse.body);
  }

  /// Add or updates the evaluations for process checks. This API checks if the
  /// rule is a process check when the name of the Config rule is provided.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule.
  ///
  /// Parameter [externalEvaluation] :
  /// An <code>ExternalEvaluation</code> object that provides details about
  /// compliance.
  Future<void> putExternalEvaluation({
    required String configRuleName,
    required ExternalEvaluation externalEvaluation,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutExternalEvaluation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        'ExternalEvaluation': externalEvaluation,
      },
    );
  }

  /// Adds or updates an Config rule for your entire organization to evaluate if
  /// your Amazon Web Services resources comply with your desired
  /// configurations. For information on how many organization Config rules you
  /// can have per account, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html">
  /// <b>Service Limits</b> </a> in the <i>Config Developer Guide</i>.
  ///
  /// Only a management account and a delegated administrator can create or
  /// update an organization Config rule. When calling this API with a delegated
  /// administrator, you must ensure Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added. An
  /// organization can have up to 3 delegated administrators.
  ///
  /// This API enables organization service access through the
  /// <code>EnableAWSServiceAccess</code> action and creates a service-linked
  /// role <code>AWSServiceRoleForConfigMultiAccountSetup</code> in the
  /// management or delegated administrator account of your organization. The
  /// service-linked role is created only when the role does not exist in the
  /// caller account. Config verifies the existence of role with
  /// <code>GetRole</code> action.
  ///
  /// To use this API with delegated administrator, register a delegated
  /// administrator by calling Amazon Web Services Organization
  /// <code>register-delegated-administrator</code> for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// There are two types of rules: <i>Config Managed Rules</i> and <i>Config
  /// Custom Rules</i>. You can use <code>PutOrganizationConfigRule</code> to
  /// create both Config Managed Rules and Config Custom Rules.
  ///
  /// Config Managed Rules are predefined, customizable rules created by Config.
  /// For a list of managed rules, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html">List
  /// of Config Managed Rules</a>. If you are adding an Config managed rule, you
  /// must specify the rule's identifier for the <code>RuleIdentifier</code>
  /// key.
  ///
  /// Config Custom Rules are rules that you create from scratch. There are two
  /// ways to create Config custom rules: with Lambda functions (<a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function">
  /// Lambda Developer Guide</a>) and with Guard (<a
  /// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
  /// GitHub Repository</a>), a policy-as-code language. Config custom rules
  /// created with Lambda are called <i>Config Custom Lambda Rules</i> and
  /// Config custom rules created with Guard are called <i>Config Custom Policy
  /// Rules</i>.
  ///
  /// If you are adding a new Config Custom Lambda rule, you first need to
  /// create an Lambda function in the management account or a delegated
  /// administrator that the rule invokes to evaluate your resources. You also
  /// need to create an IAM role in the managed account that can be assumed by
  /// the Lambda function. When you use <code>PutOrganizationConfigRule</code>
  /// to add a Custom Lambda rule to Config, you must specify the Amazon
  /// Resource Name (ARN) that Lambda assigns to the function.
  /// <note>
  /// Prerequisite: Ensure you call <code>EnableAllFeatures</code> API to enable
  /// all features in an organization.
  ///
  /// Make sure to specify one of either
  /// <code>OrganizationCustomPolicyRuleMetadata</code> for Custom Policy rules,
  /// <code>OrganizationCustomRuleMetadata</code> for Custom Lambda rules, or
  /// <code>OrganizationManagedRuleMetadata</code> for managed rules.
  /// </note>
  ///
  /// May throw [MaxNumberOfOrganizationConfigRulesExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ValidationException].
  /// May throw [OrganizationAccessDeniedException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [OrganizationAllFeaturesNotEnabledException].
  /// May throw [InsufficientPermissionsException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name that you assign to an organization Config rule.
  ///
  /// Parameter [excludedAccounts] :
  /// A comma-separated list of accounts that you want to exclude from an
  /// organization Config rule.
  ///
  /// Parameter [organizationCustomPolicyRuleMetadata] :
  /// An <code>OrganizationCustomPolicyRuleMetadata</code> object. This object
  /// specifies metadata for your organization's Config Custom Policy rule. The
  /// metadata includes the runtime system in use, which accounts have debug
  /// logging enabled, and other custom rule metadata, such as resource type,
  /// resource ID of Amazon Web Services resource, and organization trigger
  /// types that initiate Config to evaluate Amazon Web Services resources
  /// against a rule.
  ///
  /// Parameter [organizationCustomRuleMetadata] :
  /// An <code>OrganizationCustomRuleMetadata</code> object. This object
  /// specifies organization custom rule metadata such as resource type,
  /// resource ID of Amazon Web Services resource, Lambda function ARN, and
  /// organization trigger types that trigger Config to evaluate your Amazon Web
  /// Services resources against a rule. It also provides the frequency with
  /// which you want Config to run evaluations for the rule if the trigger type
  /// is periodic.
  ///
  /// Parameter [organizationManagedRuleMetadata] :
  /// An <code>OrganizationManagedRuleMetadata</code> object. This object
  /// specifies organization managed rule metadata such as resource type and ID
  /// of Amazon Web Services resource along with the rule identifier. It also
  /// provides the frequency with which you want Config to run evaluations for
  /// the rule if the trigger type is periodic.
  Future<PutOrganizationConfigRuleResponse> putOrganizationConfigRule({
    required String organizationConfigRuleName,
    List<String>? excludedAccounts,
    OrganizationCustomPolicyRuleMetadata? organizationCustomPolicyRuleMetadata,
    OrganizationCustomRuleMetadata? organizationCustomRuleMetadata,
    OrganizationManagedRuleMetadata? organizationManagedRuleMetadata,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutOrganizationConfigRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConfigRuleName': organizationConfigRuleName,
        if (excludedAccounts != null) 'ExcludedAccounts': excludedAccounts,
        if (organizationCustomPolicyRuleMetadata != null)
          'OrganizationCustomPolicyRuleMetadata':
              organizationCustomPolicyRuleMetadata,
        if (organizationCustomRuleMetadata != null)
          'OrganizationCustomRuleMetadata': organizationCustomRuleMetadata,
        if (organizationManagedRuleMetadata != null)
          'OrganizationManagedRuleMetadata': organizationManagedRuleMetadata,
      },
    );

    return PutOrganizationConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deploys conformance packs across member accounts in an Amazon Web Services
  /// Organization. For information on how many organization conformance packs
  /// and how many Config rules you can have per account, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html">
  /// <b>Service Limits</b> </a> in the <i>Config Developer Guide</i>.
  ///
  /// Only a management account and a delegated administrator can call this API.
  /// When calling this API with a delegated administrator, you must ensure
  /// Organizations <code>ListDelegatedAdministrator</code> permissions are
  /// added. An organization can have up to 3 delegated administrators.
  ///
  /// This API enables organization service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code> through the
  /// <code>EnableAWSServiceAccess</code> action and creates a service-linked
  /// role <code>AWSServiceRoleForConfigMultiAccountSetup</code> in the
  /// management or delegated administrator account of your organization. The
  /// service-linked role is created only when the role does not exist in the
  /// caller account. To use this API with delegated administrator, register a
  /// delegated administrator by calling Amazon Web Services Organization
  /// <code>register-delegate-admin</code> for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  /// <note>
  /// Prerequisite: Ensure you call <code>EnableAllFeatures</code> API to enable
  /// all features in an organization.
  ///
  /// You must specify either the <code>TemplateS3Uri</code> or the
  /// <code>TemplateBody</code> parameter, but not both. If you provide both
  /// Config uses the <code>TemplateS3Uri</code> parameter and ignores the
  /// <code>TemplateBody</code> parameter.
  ///
  /// Config sets the state of a conformance pack to CREATE_IN_PROGRESS and
  /// UPDATE_IN_PROGRESS until the conformance pack is created or updated. You
  /// cannot update a conformance pack while it is in this state.
  /// </note>
  ///
  /// May throw [MaxNumberOfOrganizationConformancePacksExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ValidationException].
  /// May throw [OrganizationAccessDeniedException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [OrganizationConformancePackTemplateValidationException].
  /// May throw [OrganizationAllFeaturesNotEnabledException].
  /// May throw [NoAvailableOrganizationException].
  ///
  /// Parameter [organizationConformancePackName] :
  /// Name of the organization conformance pack you want to create.
  ///
  /// Parameter [conformancePackInputParameters] :
  /// A list of <code>ConformancePackInputParameter</code> objects.
  ///
  /// Parameter [deliveryS3Bucket] :
  /// The name of the Amazon S3 bucket where Config stores conformance pack
  /// templates.
  /// <note>
  /// This field is optional. If used, it must be prefixed with
  /// <code>awsconfigconforms</code>.
  /// </note>
  ///
  /// Parameter [deliveryS3KeyPrefix] :
  /// The prefix for the Amazon S3 bucket.
  /// <note>
  /// This field is optional.
  /// </note>
  ///
  /// Parameter [excludedAccounts] :
  /// A list of Amazon Web Services accounts to be excluded from an organization
  /// conformance pack while deploying a conformance pack.
  ///
  /// Parameter [templateBody] :
  /// A string containing full conformance pack template body. Structure
  /// containing the template body with a minimum length of 1 byte and a maximum
  /// length of 51,200 bytes.
  ///
  /// Parameter [templateS3Uri] :
  /// Location of file containing the template body. The uri must point to the
  /// conformance pack template (max size: 300 KB).
  /// <note>
  /// You must have access to read Amazon S3 bucket. In addition, in order to
  /// ensure a successful deployment, the template object must not be in an <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html">archived
  /// storage class</a> if this parameter is passed.
  /// </note>
  Future<PutOrganizationConformancePackResponse>
      putOrganizationConformancePack({
    required String organizationConformancePackName,
    List<ConformancePackInputParameter>? conformancePackInputParameters,
    String? deliveryS3Bucket,
    String? deliveryS3KeyPrefix,
    List<String>? excludedAccounts,
    String? templateBody,
    String? templateS3Uri,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutOrganizationConformancePack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationConformancePackName': organizationConformancePackName,
        if (conformancePackInputParameters != null)
          'ConformancePackInputParameters': conformancePackInputParameters,
        if (deliveryS3Bucket != null) 'DeliveryS3Bucket': deliveryS3Bucket,
        if (deliveryS3KeyPrefix != null)
          'DeliveryS3KeyPrefix': deliveryS3KeyPrefix,
        if (excludedAccounts != null) 'ExcludedAccounts': excludedAccounts,
        if (templateBody != null) 'TemplateBody': templateBody,
        if (templateS3Uri != null) 'TemplateS3Uri': templateS3Uri,
      },
    );

    return PutOrganizationConformancePackResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates the remediation configuration with a specific Config rule
  /// with the selected target or action. The API creates the
  /// <code>RemediationConfiguration</code> object for the Config rule. The
  /// Config rule must already exist for you to add a remediation configuration.
  /// The target (SSM document) must exist and have permissions to use the
  /// target.
  /// <note>
  /// <b>Be aware of backward incompatible changes</b>
  ///
  /// If you make backward incompatible changes to the SSM document, you must
  /// call this again to ensure the remediations can run.
  ///
  /// This API does not support adding remediation configurations for
  /// service-linked Config Rules such as Organization Config rules, the rules
  /// deployed by conformance packs, and rules deployed by Amazon Web Services
  /// Security Hub.
  /// </note> <note>
  /// <b>Required fields</b>
  ///
  /// For manual remediation configuration, you need to provide a value for
  /// <code>automationAssumeRole</code> or use a value in the
  /// <code>assumeRole</code>field to remediate your resources. The SSM
  /// automation document can use either as long as it maps to a valid
  /// parameter.
  ///
  /// However, for automatic remediation configuration, the only valid
  /// <code>assumeRole</code> field value is <code>AutomationAssumeRole</code>
  /// and you need to provide a value for <code>AutomationAssumeRole</code> to
  /// remediate your resources.
  /// </note> <note>
  /// <b>Auto remediation can be initiated even for compliant resources</b>
  ///
  /// If you enable auto remediation for a specific Config rule using the <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html">PutRemediationConfigurations</a>
  /// API or the Config console, it initiates the remediation process for all
  /// non-compliant resources for that specific rule. The auto remediation
  /// process relies on the compliance data snapshot which is captured on a
  /// periodic basis. Any non-compliant resource that is updated between the
  /// snapshot schedule will continue to be remediated based on the last known
  /// compliance data snapshot.
  ///
  /// This means that in some cases auto remediation can be initiated even for
  /// compliant resources, since the bootstrap processor uses a database that
  /// can have stale evaluation results based on the last known compliance data
  /// snapshot.
  /// </note>
  ///
  /// May throw [InsufficientPermissionsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [remediationConfigurations] :
  /// A list of remediation configuration objects.
  Future<PutRemediationConfigurationsResponse> putRemediationConfigurations({
    required List<RemediationConfiguration> remediationConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutRemediationConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RemediationConfigurations': remediationConfigurations,
      },
    );

    return PutRemediationConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// A remediation exception is when a specified resource is no longer
  /// considered for auto-remediation. This API adds a new exception or updates
  /// an existing exception for a specified resource with a specified Config
  /// rule.
  /// <note>
  /// <b>Exceptions block auto remediation</b>
  ///
  /// Config generates a remediation exception when a problem occurs running a
  /// remediation action for a specified resource. Remediation exceptions blocks
  /// auto-remediation until the exception is cleared.
  /// </note> <note>
  /// <b>Manual remediation is recommended when placing an exception</b>
  ///
  /// When placing an exception on an Amazon Web Services resource, it is
  /// recommended that remediation is set as manual remediation until the given
  /// Config rule for the specified resource evaluates the resource as
  /// <code>NON_COMPLIANT</code>. Once the resource has been evaluated as
  /// <code>NON_COMPLIANT</code>, you can add remediation exceptions and change
  /// the remediation type back from Manual to Auto if you want to use
  /// auto-remediation. Otherwise, using auto-remediation before a
  /// <code>NON_COMPLIANT</code> evaluation result can delete resources before
  /// the exception is applied.
  /// </note> <note>
  /// <b>Exceptions can only be performed on non-compliant resources</b>
  ///
  /// Placing an exception can only be performed on resources that are
  /// <code>NON_COMPLIANT</code>. If you use this API for <code>COMPLIANT</code>
  /// resources or resources that are <code>NOT_APPLICABLE</code>, a remediation
  /// exception will not be generated. For more information on the conditions
  /// that initiate the possible Config evaluation results, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/config-concepts.html#aws-config-rules">Concepts
  /// | Config Rules</a> in the <i>Config Developer Guide</i>.
  /// </note> <note>
  /// <b>Auto remediation can be initiated even for compliant resources</b>
  ///
  /// If you enable auto remediation for a specific Config rule using the <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html">PutRemediationConfigurations</a>
  /// API or the Config console, it initiates the remediation process for all
  /// non-compliant resources for that specific rule. The auto remediation
  /// process relies on the compliance data snapshot which is captured on a
  /// periodic basis. Any non-compliant resource that is updated between the
  /// snapshot schedule will continue to be remediated based on the last known
  /// compliance data snapshot.
  ///
  /// This means that in some cases auto remediation can be initiated even for
  /// compliant resources, since the bootstrap processor uses a database that
  /// can have stale evaluation results based on the last known compliance data
  /// snapshot.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InsufficientPermissionsException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the Config rule for which you want to create remediation
  /// exception.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. Config adds exception for each resource key. For example,
  /// Config adds 3 exceptions for 3 resource keys.
  ///
  /// Parameter [expirationTime] :
  /// The exception is automatically deleted after the expiration date.
  ///
  /// Parameter [message] :
  /// The message contains an explanation of the exception.
  Future<PutRemediationExceptionsResponse> putRemediationExceptions({
    required String configRuleName,
    required List<RemediationExceptionResourceKey> resourceKeys,
    DateTime? expirationTime,
    String? message,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutRemediationExceptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        'ResourceKeys': resourceKeys,
        if (expirationTime != null)
          'ExpirationTime': unixTimestampToJson(expirationTime),
        if (message != null) 'Message': message,
      },
    );

    return PutRemediationExceptionsResponse.fromJson(jsonResponse.body);
  }

  /// Records the configuration state for the resource provided in the request.
  /// The configuration state of a resource is represented in Config as
  /// Configuration Items. Once this API records the configuration item, you can
  /// retrieve the list of configuration items for the custom resource type
  /// using existing Config APIs.
  /// <note>
  /// The custom resource type must be registered with CloudFormation. This API
  /// accepts the configuration item registered with CloudFormation.
  ///
  /// When you call this API, Config only stores configuration state of the
  /// resource provided in the request. This API does not change or remediate
  /// the configuration of the resource.
  ///
  /// Write-only schema properites are not recorded as part of the published
  /// configuration item.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [NoRunningConfigurationRecorderException].
  /// May throw [MaxActiveResourcesExceededException].
  ///
  /// Parameter [configuration] :
  /// The configuration object of the resource in valid JSON format. It must
  /// match the schema registered with CloudFormation.
  /// <note>
  /// The configuration JSON must not exceed 64 KB.
  /// </note>
  ///
  /// Parameter [resourceId] :
  /// Unique identifier of the resource.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource. The custom resource type must be registered with
  /// CloudFormation.
  /// <note>
  /// You cannot use the organization names “amzn”, “amazon”, “alexa”, “custom”
  /// with custom resource types. It is the first part of the ResourceType up to
  /// the first ::.
  /// </note>
  ///
  /// Parameter [schemaVersionId] :
  /// Version of the schema registered for the ResourceType in CloudFormation.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  ///
  /// Parameter [tags] :
  /// Tags associated with the resource.
  /// <note>
  /// This field is not to be confused with the Amazon Web Services-wide tag
  /// feature for Amazon Web Services resources. Tags for
  /// <code>PutResourceConfig</code> are tags that you supply for the
  /// configuration items of your custom resources.
  /// </note>
  Future<void> putResourceConfig({
    required String configuration,
    required String resourceId,
    required String resourceType,
    required String schemaVersionId,
    String? resourceName,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutResourceConfig'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Configuration': configuration,
        'ResourceId': resourceId,
        'ResourceType': resourceType,
        'SchemaVersionId': schemaVersionId,
        if (resourceName != null) 'ResourceName': resourceName,
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Creates and updates the retention configuration with details about
  /// retention period (number of days) that Config stores your historical
  /// information. The API creates the <code>RetentionConfiguration</code>
  /// object and names the object as <b>default</b>. When you have a
  /// <code>RetentionConfiguration</code> object named <b>default</b>, calling
  /// the API modifies the default object.
  /// <note>
  /// Currently, Config supports only one retention configuration per region in
  /// your account.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MaxNumberOfRetentionConfigurationsExceededException].
  ///
  /// Parameter [retentionPeriodInDays] :
  /// Number of days Config stores your historical information.
  /// <note>
  /// Currently, only applicable to the configuration item history.
  /// </note>
  Future<PutRetentionConfigurationResponse> putRetentionConfiguration({
    required int retentionPeriodInDays,
  }) async {
    _s.validateNumRange(
      'retentionPeriodInDays',
      retentionPeriodInDays,
      30,
      2557,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutRetentionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RetentionPeriodInDays': retentionPeriodInDays,
      },
    );

    return PutRetentionConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Saves a new query or updates an existing saved query. The
  /// <code>QueryName</code> must be unique for a single Amazon Web Services
  /// account and a single Amazon Web Services Region. You can create upto 300
  /// queries in a single Amazon Web Services account and a single Amazon Web
  /// Services Region.
  /// <note>
  /// <code>PutStoredQuery</code> is an idempotent API. Subsequent requests
  /// won’t create a duplicate resource if one was already created. If a
  /// following request has different <code>tags</code> values, Config will
  /// ignore these differences and treat it as an idempotent request of the
  /// previous. In this case, <code>tags</code> will not be updated, even if
  /// they are different.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceConcurrentModificationException].
  ///
  /// Parameter [storedQuery] :
  /// A list of <code>StoredQuery</code> objects. The mandatory fields are
  /// <code>QueryName</code> and <code>Expression</code>.
  /// <note>
  /// When you are creating a query, you must provide a query name and an
  /// expression. When you are updating a query, you must provide a query name
  /// but updating the description is optional.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of <code>Tags</code> object.
  Future<PutStoredQueryResponse> putStoredQuery({
    required StoredQuery storedQuery,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutStoredQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StoredQuery': storedQuery,
        if (tags != null) 'Tags': tags,
      },
    );

    return PutStoredQueryResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a structured query language (SQL) SELECT command and an aggregator
  /// to query configuration state of Amazon Web Services resources across
  /// multiple accounts and regions, performs the corresponding search, and
  /// returns resource configurations matching the properties.
  ///
  /// For more information about query components, see the <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/query-components.html">
  /// <b>Query Components</b> </a> section in the <i>Config Developer Guide</i>.
  /// <note>
  /// If you run an aggregation query (i.e., using <code>GROUP BY</code> or
  /// using aggregate functions such as <code>COUNT</code>; e.g., <code>SELECT
  /// resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY
  /// resourceId</code>) and do not specify the <code>MaxResults</code> or the
  /// <code>Limit</code> query parameters, the default page size is set to 500.
  ///
  /// If you run a non-aggregation query (i.e., not using <code>GROUP BY</code>
  /// or aggregate function; e.g., <code>SELECT * WHERE resourceType =
  /// 'AWS::IAM::Role'</code>) and do not specify the <code>MaxResults</code> or
  /// the <code>Limit</code> query parameters, the default page size is set to
  /// 25.
  /// </note>
  ///
  /// May throw [InvalidExpressionException].
  /// May throw [NoSuchConfigurationAggregatorException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [expression] :
  /// The SQL query SELECT command.
  ///
  /// Parameter [limit] :
  /// The maximum number of query results returned on each page.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of query results returned on each page. Config also
  /// allows the Limit request parameter.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned in a previous request that you use to
  /// request the next page of results in a paginated response.
  Future<SelectAggregateResourceConfigResponse> selectAggregateResourceConfig({
    required String configurationAggregatorName,
    required String expression,
    int? limit,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.SelectAggregateResourceConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationAggregatorName': configurationAggregatorName,
        'Expression': expression,
        if (limit != null) 'Limit': limit,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return SelectAggregateResourceConfigResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a structured query language (SQL) <code>SELECT</code> command,
  /// performs the corresponding search, and returns resource configurations
  /// matching the properties.
  ///
  /// For more information about query components, see the <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/query-components.html">
  /// <b>Query Components</b> </a> section in the <i>Config Developer Guide</i>.
  ///
  /// May throw [InvalidExpressionException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [expression] :
  /// The SQL query <code>SELECT</code> command.
  ///
  /// Parameter [limit] :
  /// The maximum number of query results returned on each page.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  Future<SelectResourceConfigResponse> selectResourceConfig({
    required String expression,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.SelectResourceConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Expression': expression,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return SelectResourceConfigResponse.fromJson(jsonResponse.body);
  }

  /// Runs an on-demand evaluation for the specified Config rules against the
  /// last known configuration state of the resources. Use
  /// <code>StartConfigRulesEvaluation</code> when you want to test that a rule
  /// you updated is working as expected.
  /// <code>StartConfigRulesEvaluation</code> does not re-record the latest
  /// configuration state for your resources. It re-runs an evaluation against
  /// the last known state of your resources.
  ///
  /// You can specify up to 25 Config rules per request.
  ///
  /// An existing <code>StartConfigRulesEvaluation</code> call for the specified
  /// rules must complete before you can call the API again. If you chose to
  /// have Config stream to an Amazon SNS topic, you will receive a
  /// <code>ConfigRuleEvaluationStarted</code> notification when the evaluation
  /// starts.
  /// <note>
  /// You don't need to call the <code>StartConfigRulesEvaluation</code> API to
  /// run an evaluation for a new rule. When you create a rule, Config evaluates
  /// your resources against the rule automatically.
  /// </note>
  /// The <code>StartConfigRulesEvaluation</code> API is useful if you want to
  /// run on-demand evaluations, such as the following example:
  /// <ol>
  /// <li>
  /// You have a custom rule that evaluates your IAM resources every 24 hours.
  /// </li>
  /// <li>
  /// You update your Lambda function to add additional conditions to your rule.
  /// </li>
  /// <li>
  /// Instead of waiting for the next periodic evaluation, you call the
  /// <code>StartConfigRulesEvaluation</code> API.
  /// </li>
  /// <li>
  /// Config invokes your Lambda function and evaluates your IAM resources.
  /// </li>
  /// <li>
  /// Your custom rule will still run periodic evaluations every 24 hours.
  /// </li> </ol>
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleNames] :
  /// The list of names of Config rules that you want to run evaluations for.
  Future<void> startConfigRulesEvaluation({
    List<String>? configRuleNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StartConfigRulesEvaluation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      },
    );
  }

  /// Starts recording configurations of the Amazon Web Services resources you
  /// have selected to record in your Amazon Web Services account.
  ///
  /// You must have created at least one delivery channel to successfully start
  /// the configuration recorder.
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  /// May throw [NoAvailableDeliveryChannelException].
  ///
  /// Parameter [configurationRecorderName] :
  /// The name of the recorder object that records each configuration change
  /// made to the resources.
  Future<void> startConfigurationRecorder({
    required String configurationRecorderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StartConfigurationRecorder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationRecorderName': configurationRecorderName,
      },
    );
  }

  /// Runs an on-demand remediation for the specified Config rules against the
  /// last known remediation configuration. It runs an execution against the
  /// current state of your resources. Remediation execution is asynchronous.
  ///
  /// You can specify up to 100 resource keys per request. An existing
  /// StartRemediationExecution call for the specified resource keys must
  /// complete before you can call the API again.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [NoSuchRemediationConfigurationException].
  ///
  /// Parameter [configRuleName] :
  /// The list of names of Config rules that you want to run remediation
  /// execution for.
  ///
  /// Parameter [resourceKeys] :
  /// A list of resource keys to be processed with the current request. Each
  /// element in the list consists of the resource type and resource ID.
  Future<StartRemediationExecutionResponse> startRemediationExecution({
    required String configRuleName,
    required List<ResourceKey> resourceKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StartRemediationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
        'ResourceKeys': resourceKeys,
      },
    );

    return StartRemediationExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Runs an on-demand evaluation for the specified resource to determine
  /// whether the resource details will comply with configured Config rules. You
  /// can also use it for evaluation purposes. Config recommends using an
  /// evaluation context. It runs an execution against the resource details with
  /// all of the Config rules in your account that match with the specified
  /// proactive mode and resource type.
  /// <note>
  /// Ensure you have the <code>cloudformation:DescribeType</code> role setup to
  /// validate the resource type schema.
  ///
  /// You can find the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">Resource
  /// type schema</a> in "<i>Amazon Web Services public extensions</i>" within
  /// the CloudFormation registry or with the following CLI commmand: <code>aws
  /// cloudformation describe-type --type-name "AWS::S3::Bucket" --type
  /// RESOURCE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view">Managing
  /// extensions through the CloudFormation registry</a> and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services resource and property types reference</a> in the
  /// CloudFormation User Guide.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [IdempotentParameterMismatch].
  ///
  /// Parameter [evaluationMode] :
  /// The mode of an evaluation. The valid values for this API are
  /// <code>DETECTIVE</code> and <code>PROACTIVE</code>.
  ///
  /// Parameter [resourceDetails] :
  /// Returns a <code>ResourceDetails</code> object.
  ///
  /// Parameter [clientToken] :
  /// A client token is a unique, case-sensitive string of up to 64 ASCII
  /// characters. To make an idempotent API request using one of these actions,
  /// specify a client token in the request.
  /// <note>
  /// Avoid reusing the same client token for other API requests. If you retry a
  /// request that completed successfully using the same client token and the
  /// same parameters, the retry succeeds without performing any further
  /// actions. If you retry a successful request using the same client token,
  /// but one or more of the parameters are different, other than the Region or
  /// Availability Zone, the retry fails with an IdempotentParameterMismatch
  /// error.
  /// </note>
  ///
  /// Parameter [evaluationContext] :
  /// Returns an <code>EvaluationContext</code> object.
  ///
  /// Parameter [evaluationTimeout] :
  /// The timeout for an evaluation. The default is 900 seconds. You cannot
  /// specify a number greater than 3600. If you specify 0, Config uses the
  /// default.
  Future<StartResourceEvaluationResponse> startResourceEvaluation({
    required EvaluationMode evaluationMode,
    required ResourceDetails resourceDetails,
    String? clientToken,
    EvaluationContext? evaluationContext,
    int? evaluationTimeout,
  }) async {
    _s.validateNumRange(
      'evaluationTimeout',
      evaluationTimeout,
      0,
      3600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StartResourceEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EvaluationMode': evaluationMode.value,
        'ResourceDetails': resourceDetails,
        if (clientToken != null) 'ClientToken': clientToken,
        if (evaluationContext != null) 'EvaluationContext': evaluationContext,
        if (evaluationTimeout != null) 'EvaluationTimeout': evaluationTimeout,
      },
    );

    return StartResourceEvaluationResponse.fromJson(jsonResponse.body);
  }

  /// Stops recording configurations of the Amazon Web Services resources you
  /// have selected to record in your Amazon Web Services account.
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  ///
  /// Parameter [configurationRecorderName] :
  /// The name of the recorder object that records each configuration change
  /// made to the resources.
  Future<void> stopConfigurationRecorder({
    required String configurationRecorderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StopConfigurationRecorder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationRecorderName': configurationRecorderName,
      },
    );
  }

  /// Associates the specified tags to a resource with the specified
  /// resourceArn. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. If existing tags are specified,
  /// however, then their values will be updated. When a resource is deleted,
  /// the tags associated with that resource are deleted as well.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the supported resources are
  /// <code>ConfigRule</code>, <code>ConfigurationAggregator</code> and
  /// <code>AggregatorAuthorization</code>.
  ///
  /// Parameter [tags] :
  /// An array of tag object.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the supported resources are
  /// <code>ConfigRule</code>, <code>ConfigurationAggregator</code> and
  /// <code>AggregatorAuthorization</code>.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }
}

/// A collection of accounts and regions.
class AccountAggregationSource {
  /// The 12-digit account ID of the account being aggregated.
  final List<String> accountIds;

  /// If true, aggregate existing Config regions and future regions.
  final bool? allAwsRegions;

  /// The source regions being aggregated.
  final List<String>? awsRegions;

  AccountAggregationSource({
    required this.accountIds,
    this.allAwsRegions,
    this.awsRegions,
  });

  factory AccountAggregationSource.fromJson(Map<String, dynamic> json) {
    return AccountAggregationSource(
      accountIds: (json['AccountIds'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allAwsRegions: json['AllAwsRegions'] as bool?,
      awsRegions: (json['AwsRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final allAwsRegions = this.allAwsRegions;
    final awsRegions = this.awsRegions;
    return {
      'AccountIds': accountIds,
      if (allAwsRegions != null) 'AllAwsRegions': allAwsRegions,
      if (awsRegions != null) 'AwsRegions': awsRegions,
    };
  }
}

/// Indicates whether an Config rule is compliant based on account ID, region,
/// compliance, and rule name.
///
/// A rule is compliant if all of the resources that the rule evaluated comply
/// with it. It is noncompliant if any of these resources do not comply.
class AggregateComplianceByConfigRule {
  /// The 12-digit account ID of the source account.
  final String? accountId;

  /// The source region from where the data is aggregated.
  final String? awsRegion;

  /// Indicates whether an Amazon Web Services resource or Config rule is
  /// compliant and provides the number of contributors that affect the
  /// compliance.
  final Compliance? compliance;

  /// The name of the Config rule.
  final String? configRuleName;

  AggregateComplianceByConfigRule({
    this.accountId,
    this.awsRegion,
    this.compliance,
    this.configRuleName,
  });

  factory AggregateComplianceByConfigRule.fromJson(Map<String, dynamic> json) {
    return AggregateComplianceByConfigRule(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      compliance: json['Compliance'] != null
          ? Compliance.fromJson(json['Compliance'] as Map<String, dynamic>)
          : null,
      configRuleName: json['ConfigRuleName'] as String?,
    );
  }
}

/// Provides aggregate compliance of the conformance pack. Indicates whether a
/// conformance pack is compliant based on the name of the conformance pack,
/// account ID, and region.
///
/// A conformance pack is compliant if all of the rules in a conformance packs
/// are compliant. It is noncompliant if any of the rules are not compliant. The
/// compliance status of a conformance pack is INSUFFICIENT_DATA only if all
/// rules within a conformance pack cannot be evaluated due to insufficient
/// data. If some of the rules in a conformance pack are compliant but the
/// compliance status of other rules in that same conformance pack is
/// INSUFFICIENT_DATA, the conformance pack shows compliant.
class AggregateComplianceByConformancePack {
  /// The 12-digit Amazon Web Services account ID of the source account.
  final String? accountId;

  /// The source Amazon Web Services Region from where the data is aggregated.
  final String? awsRegion;

  /// The compliance status of the conformance pack.
  final AggregateConformancePackCompliance? compliance;

  /// The name of the conformance pack.
  final String? conformancePackName;

  AggregateComplianceByConformancePack({
    this.accountId,
    this.awsRegion,
    this.compliance,
    this.conformancePackName,
  });

  factory AggregateComplianceByConformancePack.fromJson(
      Map<String, dynamic> json) {
    return AggregateComplianceByConformancePack(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      compliance: json['Compliance'] != null
          ? AggregateConformancePackCompliance.fromJson(
              json['Compliance'] as Map<String, dynamic>)
          : null,
      conformancePackName: json['ConformancePackName'] as String?,
    );
  }
}

/// Returns the number of compliant and noncompliant rules for one or more
/// accounts and regions in an aggregator.
class AggregateComplianceCount {
  /// The number of compliant and noncompliant Config rules.
  final ComplianceSummary? complianceSummary;

  /// The 12-digit account ID or region based on the GroupByKey value.
  final String? groupName;

  AggregateComplianceCount({
    this.complianceSummary,
    this.groupName,
  });

  factory AggregateComplianceCount.fromJson(Map<String, dynamic> json) {
    return AggregateComplianceCount(
      complianceSummary: json['ComplianceSummary'] != null
          ? ComplianceSummary.fromJson(
              json['ComplianceSummary'] as Map<String, dynamic>)
          : null,
      groupName: json['GroupName'] as String?,
    );
  }
}

/// Provides the number of compliant and noncompliant rules within a conformance
/// pack. Also provides the compliance status of the conformance pack and the
/// total rule count which includes compliant rules, noncompliant rules, and
/// rules that cannot be evaluated due to insufficient data.
///
/// A conformance pack is compliant if all of the rules in a conformance packs
/// are compliant. It is noncompliant if any of the rules are not compliant. The
/// compliance status of a conformance pack is INSUFFICIENT_DATA only if all
/// rules within a conformance pack cannot be evaluated due to insufficient
/// data. If some of the rules in a conformance pack are compliant but the
/// compliance status of other rules in that same conformance pack is
/// INSUFFICIENT_DATA, the conformance pack shows compliant.
class AggregateConformancePackCompliance {
  /// The compliance status of the conformance pack.
  final ConformancePackComplianceType? complianceType;

  /// The number of compliant Config Rules.
  final int? compliantRuleCount;

  /// The number of noncompliant Config Rules.
  final int? nonCompliantRuleCount;

  /// Total number of compliant rules, noncompliant rules, and the rules that do
  /// not have any applicable resources to evaluate upon resulting in insufficient
  /// data.
  final int? totalRuleCount;

  AggregateConformancePackCompliance({
    this.complianceType,
    this.compliantRuleCount,
    this.nonCompliantRuleCount,
    this.totalRuleCount,
  });

  factory AggregateConformancePackCompliance.fromJson(
      Map<String, dynamic> json) {
    return AggregateConformancePackCompliance(
      complianceType: (json['ComplianceType'] as String?)
          ?.let(ConformancePackComplianceType.fromString),
      compliantRuleCount: json['CompliantRuleCount'] as int?,
      nonCompliantRuleCount: json['NonCompliantRuleCount'] as int?,
      totalRuleCount: json['TotalRuleCount'] as int?,
    );
  }
}

/// The number of conformance packs that are compliant and noncompliant.
class AggregateConformancePackComplianceCount {
  /// Number of compliant conformance packs.
  final int? compliantConformancePackCount;

  /// Number of noncompliant conformance packs.
  final int? nonCompliantConformancePackCount;

  AggregateConformancePackComplianceCount({
    this.compliantConformancePackCount,
    this.nonCompliantConformancePackCount,
  });

  factory AggregateConformancePackComplianceCount.fromJson(
      Map<String, dynamic> json) {
    return AggregateConformancePackComplianceCount(
      compliantConformancePackCount:
          json['CompliantConformancePackCount'] as int?,
      nonCompliantConformancePackCount:
          json['NonCompliantConformancePackCount'] as int?,
    );
  }
}

/// Filters the conformance packs based on an account ID, region, compliance
/// type, and the name of the conformance pack.
class AggregateConformancePackComplianceFilters {
  /// The 12-digit Amazon Web Services account ID of the source account.
  final String? accountId;

  /// The source Amazon Web Services Region from where the data is aggregated.
  final String? awsRegion;

  /// The compliance status of the conformance pack.
  final ConformancePackComplianceType? complianceType;

  /// The name of the conformance pack.
  final String? conformancePackName;

  AggregateConformancePackComplianceFilters({
    this.accountId,
    this.awsRegion,
    this.complianceType,
    this.conformancePackName,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final complianceType = this.complianceType;
    final conformancePackName = this.conformancePackName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType.value,
      if (conformancePackName != null)
        'ConformancePackName': conformancePackName,
    };
  }
}

/// Provides a summary of compliance based on either account ID or region.
class AggregateConformancePackComplianceSummary {
  /// Returns an <code>AggregateConformancePackComplianceCount</code> object.
  final AggregateConformancePackComplianceCount? complianceSummary;

  /// Groups the result based on Amazon Web Services account ID or Amazon Web
  /// Services Region.
  final String? groupName;

  AggregateConformancePackComplianceSummary({
    this.complianceSummary,
    this.groupName,
  });

  factory AggregateConformancePackComplianceSummary.fromJson(
      Map<String, dynamic> json) {
    return AggregateConformancePackComplianceSummary(
      complianceSummary: json['ComplianceSummary'] != null
          ? AggregateConformancePackComplianceCount.fromJson(
              json['ComplianceSummary'] as Map<String, dynamic>)
          : null,
      groupName: json['GroupName'] as String?,
    );
  }
}

/// Filters the results based on account ID and region.
class AggregateConformancePackComplianceSummaryFilters {
  /// The 12-digit Amazon Web Services account ID of the source account.
  final String? accountId;

  /// The source Amazon Web Services Region from where the data is aggregated.
  final String? awsRegion;

  AggregateConformancePackComplianceSummaryFilters({
    this.accountId,
    this.awsRegion,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
    };
  }
}

enum AggregateConformancePackComplianceSummaryGroupKey {
  accountId('ACCOUNT_ID'),
  awsRegion('AWS_REGION'),
  ;

  final String value;

  const AggregateConformancePackComplianceSummaryGroupKey(this.value);

  static AggregateConformancePackComplianceSummaryGroupKey fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AggregateConformancePackComplianceSummaryGroupKey'));
}

/// The details of an Config evaluation for an account ID and region in an
/// aggregator. Provides the Amazon Web Services resource that was evaluated,
/// the compliance of the resource, related time stamps, and supplementary
/// information.
class AggregateEvaluationResult {
  /// The 12-digit account ID of the source account.
  final String? accountId;

  /// Supplementary information about how the agrregate evaluation determined the
  /// compliance.
  final String? annotation;

  /// The source region from where the data is aggregated.
  final String? awsRegion;

  /// The resource compliance status.
  ///
  /// For the <code>AggregationEvaluationResult</code> data type, Config supports
  /// only the <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. Config does
  /// not support the <code>NOT_APPLICABLE</code> and
  /// <code>INSUFFICIENT_DATA</code> value.
  final ComplianceType? complianceType;

  /// The time when the Config rule evaluated the Amazon Web Services resource.
  final DateTime? configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier? evaluationResultIdentifier;

  /// The time when Config recorded the aggregate evaluation result.
  final DateTime? resultRecordedTime;

  AggregateEvaluationResult({
    this.accountId,
    this.annotation,
    this.awsRegion,
    this.complianceType,
    this.configRuleInvokedTime,
    this.evaluationResultIdentifier,
    this.resultRecordedTime,
  });

  factory AggregateEvaluationResult.fromJson(Map<String, dynamic> json) {
    return AggregateEvaluationResult(
      accountId: json['AccountId'] as String?,
      annotation: json['Annotation'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      complianceType:
          (json['ComplianceType'] as String?)?.let(ComplianceType.fromString),
      configRuleInvokedTime: timeStampFromJson(json['ConfigRuleInvokedTime']),
      evaluationResultIdentifier: json['EvaluationResultIdentifier'] != null
          ? EvaluationResultIdentifier.fromJson(
              json['EvaluationResultIdentifier'] as Map<String, dynamic>)
          : null,
      resultRecordedTime: timeStampFromJson(json['ResultRecordedTime']),
    );
  }
}

/// The details that identify a resource that is collected by Config aggregator,
/// including the resource type, ID, (if available) the custom resource name,
/// the source account, and source region.
class AggregateResourceIdentifier {
  /// The ID of the Amazon Web Services resource.
  final String resourceId;

  /// The type of the Amazon Web Services resource.
  final ResourceType resourceType;

  /// The 12-digit account ID of the source account.
  final String sourceAccountId;

  /// The source region where data is aggregated.
  final String sourceRegion;

  /// The name of the Amazon Web Services resource.
  final String? resourceName;

  AggregateResourceIdentifier({
    required this.resourceId,
    required this.resourceType,
    required this.sourceAccountId,
    required this.sourceRegion,
    this.resourceName,
  });

  factory AggregateResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return AggregateResourceIdentifier(
      resourceId: json['ResourceId'] as String,
      resourceType: ResourceType.fromString((json['ResourceType'] as String)),
      sourceAccountId: json['SourceAccountId'] as String,
      sourceRegion: json['SourceRegion'] as String,
      resourceName: json['ResourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final sourceAccountId = this.sourceAccountId;
    final sourceRegion = this.sourceRegion;
    final resourceName = this.resourceName;
    return {
      'ResourceId': resourceId,
      'ResourceType': resourceType.value,
      'SourceAccountId': sourceAccountId,
      'SourceRegion': sourceRegion,
      if (resourceName != null) 'ResourceName': resourceName,
    };
  }
}

/// The current sync status between the source and the aggregator account.
class AggregatedSourceStatus {
  /// The region authorized to collect aggregated data.
  final String? awsRegion;

  /// The error code that Config returned when the source account aggregation last
  /// failed.
  final String? lastErrorCode;

  /// The message indicating that the source account aggregation failed due to an
  /// error.
  final String? lastErrorMessage;

  /// Filters the last updated status type.
  ///
  /// <ul>
  /// <li>
  /// Valid value FAILED indicates errors while moving data.
  /// </li>
  /// <li>
  /// Valid value SUCCEEDED indicates the data was successfully moved.
  /// </li>
  /// <li>
  /// Valid value OUTDATED indicates the data is not the most recent.
  /// </li>
  /// </ul>
  final AggregatedSourceStatusType? lastUpdateStatus;

  /// The time of the last update.
  final DateTime? lastUpdateTime;

  /// The source account ID or an organization.
  final String? sourceId;

  /// The source account or an organization.
  final AggregatedSourceType? sourceType;

  AggregatedSourceStatus({
    this.awsRegion,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastUpdateStatus,
    this.lastUpdateTime,
    this.sourceId,
    this.sourceType,
  });

  factory AggregatedSourceStatus.fromJson(Map<String, dynamic> json) {
    return AggregatedSourceStatus(
      awsRegion: json['AwsRegion'] as String?,
      lastErrorCode: json['LastErrorCode'] as String?,
      lastErrorMessage: json['LastErrorMessage'] as String?,
      lastUpdateStatus: (json['LastUpdateStatus'] as String?)
          ?.let(AggregatedSourceStatusType.fromString),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      sourceId: json['SourceId'] as String?,
      sourceType:
          (json['SourceType'] as String?)?.let(AggregatedSourceType.fromString),
    );
  }
}

enum AggregatedSourceStatusType {
  failed('FAILED'),
  succeeded('SUCCEEDED'),
  outdated('OUTDATED'),
  ;

  final String value;

  const AggregatedSourceStatusType(this.value);

  static AggregatedSourceStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AggregatedSourceStatusType'));
}

enum AggregatedSourceType {
  account('ACCOUNT'),
  organization('ORGANIZATION'),
  ;

  final String value;

  const AggregatedSourceType(this.value);

  static AggregatedSourceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AggregatedSourceType'));
}

/// An object that represents the authorizations granted to aggregator accounts
/// and regions.
class AggregationAuthorization {
  /// The Amazon Resource Name (ARN) of the aggregation object.
  final String? aggregationAuthorizationArn;

  /// The 12-digit account ID of the account authorized to aggregate data.
  final String? authorizedAccountId;

  /// The region authorized to collect aggregated data.
  final String? authorizedAwsRegion;

  /// The time stamp when the aggregation authorization was created.
  final DateTime? creationTime;

  AggregationAuthorization({
    this.aggregationAuthorizationArn,
    this.authorizedAccountId,
    this.authorizedAwsRegion,
    this.creationTime,
  });

  factory AggregationAuthorization.fromJson(Map<String, dynamic> json) {
    return AggregationAuthorization(
      aggregationAuthorizationArn:
          json['AggregationAuthorizationArn'] as String?,
      authorizedAccountId: json['AuthorizedAccountId'] as String?,
      authorizedAwsRegion: json['AuthorizedAwsRegion'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
    );
  }
}

/// The detailed configurations of a specified resource.
class BaseConfigurationItem {
  /// The 12-digit Amazon Web Services account ID associated with the resource.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The Availability Zone associated with the resource.
  final String? availabilityZone;

  /// The region where the resource resides.
  final String? awsRegion;

  /// The description of the resource configuration.
  final String? configuration;

  /// The time when the recording of configuration changes was initiated for the
  /// resource.
  final DateTime? configurationItemCaptureTime;

  /// The time when configuration changes for the resource were delivered.
  /// <note>
  /// This field is optional and is not guaranteed to be present in a
  /// configuration item (CI). If you are using daily recording, this field will
  /// be populated. However, if you are using continuous recording, this field
  /// will be omitted since the delivery time is instantaneous as the CI is
  /// available right away. For more information on daily recording and continuous
  /// recording, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency">Recording
  /// Frequency</a> in the <i>Config Developer Guide</i>.
  /// </note>
  final DateTime? configurationItemDeliveryTime;

  /// The configuration item status. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// OK – The resource configuration has been updated.
  /// </li>
  /// <li>
  /// ResourceDiscovered – The resource was newly discovered.
  /// </li>
  /// <li>
  /// ResourceNotRecorded – The resource was discovered, but its configuration was
  /// not recorded since the recorder doesn't record resources of this type.
  /// </li>
  /// <li>
  /// ResourceDeleted – The resource was deleted
  /// </li>
  /// <li>
  /// ResourceDeletedNotRecorded – The resource was deleted, but its configuration
  /// was not recorded since the recorder doesn't record resources of this type.
  /// </li>
  /// </ul>
  final ConfigurationItemStatus? configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String? configurationStateId;

  /// The recording frequency that Config uses to record configuration changes for
  /// the resource.
  final RecordingFrequency? recordingFrequency;

  /// The time stamp when the resource was created.
  final DateTime? resourceCreationTime;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String? resourceId;

  /// The custom name of the resource, if available.
  final String? resourceName;

  /// The type of Amazon Web Services resource.
  final ResourceType? resourceType;

  /// Configuration attributes that Config returns for certain resource types to
  /// supplement the information returned for the configuration parameter.
  final Map<String, String>? supplementaryConfiguration;

  /// The version number of the resource configuration.
  final String? version;

  BaseConfigurationItem({
    this.accountId,
    this.arn,
    this.availabilityZone,
    this.awsRegion,
    this.configuration,
    this.configurationItemCaptureTime,
    this.configurationItemDeliveryTime,
    this.configurationItemStatus,
    this.configurationStateId,
    this.recordingFrequency,
    this.resourceCreationTime,
    this.resourceId,
    this.resourceName,
    this.resourceType,
    this.supplementaryConfiguration,
    this.version,
  });

  factory BaseConfigurationItem.fromJson(Map<String, dynamic> json) {
    return BaseConfigurationItem(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      availabilityZone: json['availabilityZone'] as String?,
      awsRegion: json['awsRegion'] as String?,
      configuration: json['configuration'] as String?,
      configurationItemCaptureTime:
          timeStampFromJson(json['configurationItemCaptureTime']),
      configurationItemDeliveryTime:
          timeStampFromJson(json['configurationItemDeliveryTime']),
      configurationItemStatus: (json['configurationItemStatus'] as String?)
          ?.let(ConfigurationItemStatus.fromString),
      configurationStateId: json['configurationStateId'] as String?,
      recordingFrequency: (json['recordingFrequency'] as String?)
          ?.let(RecordingFrequency.fromString),
      resourceCreationTime: timeStampFromJson(json['resourceCreationTime']),
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      supplementaryConfiguration:
          (json['supplementaryConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }
}

class BatchGetAggregateResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  final List<BaseConfigurationItem>? baseConfigurationItems;

  /// A list of resource identifiers that were not processed with current scope.
  /// The list is empty if all the resources are processed.
  final List<AggregateResourceIdentifier>? unprocessedResourceIdentifiers;

  BatchGetAggregateResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceIdentifiers,
  });

  factory BatchGetAggregateResourceConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAggregateResourceConfigResponse(
      baseConfigurationItems: (json['BaseConfigurationItems'] as List?)
          ?.nonNulls
          .map((e) => BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedResourceIdentifiers: (json['UnprocessedResourceIdentifiers']
              as List?)
          ?.nonNulls
          .map((e) =>
              AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchGetResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  final List<BaseConfigurationItem>? baseConfigurationItems;

  /// A list of resource keys that were not processed with the current response.
  /// The unprocessesResourceKeys value is in the same form as ResourceKeys, so
  /// the value can be directly provided to a subsequent BatchGetResourceConfig
  /// operation. If there are no unprocessed resource keys, the response contains
  /// an empty unprocessedResourceKeys list.
  final List<ResourceKey>? unprocessedResourceKeys;

  BatchGetResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceKeys,
  });

  factory BatchGetResourceConfigResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetResourceConfigResponse(
      baseConfigurationItems: (json['baseConfigurationItems'] as List?)
          ?.nonNulls
          .map((e) => BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedResourceKeys: (json['unprocessedResourceKeys'] as List?)
          ?.nonNulls
          .map((e) => ResourceKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum ChronologicalOrder {
  reverse('Reverse'),
  forward('Forward'),
  ;

  final String value;

  const ChronologicalOrder(this.value);

  static ChronologicalOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ChronologicalOrder'));
}

/// Indicates whether an Amazon Web Services resource or Config rule is
/// compliant and provides the number of contributors that affect the
/// compliance.
class Compliance {
  /// The number of Amazon Web Services resources or Config rules that cause a
  /// result of <code>NON_COMPLIANT</code>, up to a maximum number.
  final ComplianceContributorCount? complianceContributorCount;

  /// Indicates whether an Amazon Web Services resource or Config rule is
  /// compliant.
  ///
  /// A resource is compliant if it complies with all of the Config rules that
  /// evaluate it. A resource is noncompliant if it does not comply with one or
  /// more of these rules.
  ///
  /// A rule is compliant if all of the resources that the rule evaluates comply
  /// with it. A rule is noncompliant if any of these resources do not comply.
  ///
  /// Config returns the <code>INSUFFICIENT_DATA</code> value when no evaluation
  /// results are available for the Amazon Web Services resource or Config rule.
  ///
  /// For the <code>Compliance</code> data type, Config supports only
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>INSUFFICIENT_DATA</code> values. Config does not support the
  /// <code>NOT_APPLICABLE</code> value for the <code>Compliance</code> data type.
  final ComplianceType? complianceType;

  Compliance({
    this.complianceContributorCount,
    this.complianceType,
  });

  factory Compliance.fromJson(Map<String, dynamic> json) {
    return Compliance(
      complianceContributorCount: json['ComplianceContributorCount'] != null
          ? ComplianceContributorCount.fromJson(
              json['ComplianceContributorCount'] as Map<String, dynamic>)
          : null,
      complianceType:
          (json['ComplianceType'] as String?)?.let(ComplianceType.fromString),
    );
  }
}

/// Indicates whether an Config rule is compliant. A rule is compliant if all of
/// the resources that the rule evaluated comply with it. A rule is noncompliant
/// if any of these resources do not comply.
class ComplianceByConfigRule {
  /// Indicates whether the Config rule is compliant.
  final Compliance? compliance;

  /// The name of the Config rule.
  final String? configRuleName;

  ComplianceByConfigRule({
    this.compliance,
    this.configRuleName,
  });

  factory ComplianceByConfigRule.fromJson(Map<String, dynamic> json) {
    return ComplianceByConfigRule(
      compliance: json['Compliance'] != null
          ? Compliance.fromJson(json['Compliance'] as Map<String, dynamic>)
          : null,
      configRuleName: json['ConfigRuleName'] as String?,
    );
  }
}

/// Indicates whether an Amazon Web Services resource that is evaluated
/// according to one or more Config rules is compliant. A resource is compliant
/// if it complies with all of the rules that evaluate it. A resource is
/// noncompliant if it does not comply with one or more of these rules.
class ComplianceByResource {
  /// Indicates whether the Amazon Web Services resource complies with all of the
  /// Config rules that evaluated it.
  final Compliance? compliance;

  /// The ID of the Amazon Web Services resource that was evaluated.
  final String? resourceId;

  /// The type of the Amazon Web Services resource that was evaluated.
  final String? resourceType;

  ComplianceByResource({
    this.compliance,
    this.resourceId,
    this.resourceType,
  });

  factory ComplianceByResource.fromJson(Map<String, dynamic> json) {
    return ComplianceByResource(
      compliance: json['Compliance'] != null
          ? Compliance.fromJson(json['Compliance'] as Map<String, dynamic>)
          : null,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }
}

/// The number of Amazon Web Services resources or Config rules responsible for
/// the current compliance of the item, up to a maximum number.
class ComplianceContributorCount {
  /// Indicates whether the maximum count is reached.
  final bool? capExceeded;

  /// The number of Amazon Web Services resources or Config rules responsible for
  /// the current compliance of the item.
  final int? cappedCount;

  ComplianceContributorCount({
    this.capExceeded,
    this.cappedCount,
  });

  factory ComplianceContributorCount.fromJson(Map<String, dynamic> json) {
    return ComplianceContributorCount(
      capExceeded: json['CapExceeded'] as bool?,
      cappedCount: json['CappedCount'] as int?,
    );
  }
}

/// The number of Config rules or Amazon Web Services resources that are
/// compliant and noncompliant.
class ComplianceSummary {
  /// The time that Config created the compliance summary.
  final DateTime? complianceSummaryTimestamp;

  /// The number of Config rules or Amazon Web Services resources that are
  /// compliant, up to a maximum of 25 for rules and 100 for resources.
  final ComplianceContributorCount? compliantResourceCount;

  /// The number of Config rules or Amazon Web Services resources that are
  /// noncompliant, up to a maximum of 25 for rules and 100 for resources.
  final ComplianceContributorCount? nonCompliantResourceCount;

  ComplianceSummary({
    this.complianceSummaryTimestamp,
    this.compliantResourceCount,
    this.nonCompliantResourceCount,
  });

  factory ComplianceSummary.fromJson(Map<String, dynamic> json) {
    return ComplianceSummary(
      complianceSummaryTimestamp:
          timeStampFromJson(json['ComplianceSummaryTimestamp']),
      compliantResourceCount: json['CompliantResourceCount'] != null
          ? ComplianceContributorCount.fromJson(
              json['CompliantResourceCount'] as Map<String, dynamic>)
          : null,
      nonCompliantResourceCount: json['NonCompliantResourceCount'] != null
          ? ComplianceContributorCount.fromJson(
              json['NonCompliantResourceCount'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The number of Amazon Web Services resources of a specific type that are
/// compliant or noncompliant, up to a maximum of 100 for each.
class ComplianceSummaryByResourceType {
  /// The number of Amazon Web Services resources that are compliant or
  /// noncompliant, up to a maximum of 100 for each.
  final ComplianceSummary? complianceSummary;

  /// The type of Amazon Web Services resource.
  final String? resourceType;

  ComplianceSummaryByResourceType({
    this.complianceSummary,
    this.resourceType,
  });

  factory ComplianceSummaryByResourceType.fromJson(Map<String, dynamic> json) {
    return ComplianceSummaryByResourceType(
      complianceSummary: json['ComplianceSummary'] != null
          ? ComplianceSummary.fromJson(
              json['ComplianceSummary'] as Map<String, dynamic>)
          : null,
      resourceType: json['ResourceType'] as String?,
    );
  }
}

enum ComplianceType {
  compliant('COMPLIANT'),
  nonCompliant('NON_COMPLIANT'),
  notApplicable('NOT_APPLICABLE'),
  insufficientData('INSUFFICIENT_DATA'),
  ;

  final String value;

  const ComplianceType(this.value);

  static ComplianceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ComplianceType'));
}

/// Provides status of the delivery of the snapshot or the configuration history
/// to the specified Amazon S3 bucket. Also provides the status of notifications
/// about the Amazon S3 delivery to the specified Amazon SNS topic.
class ConfigExportDeliveryInfo {
  /// The time of the last attempted delivery.
  final DateTime? lastAttemptTime;

  /// The error code from the last attempted delivery.
  final String? lastErrorCode;

  /// The error message from the last attempted delivery.
  final String? lastErrorMessage;

  /// Status of the last attempted delivery.
  final DeliveryStatus? lastStatus;

  /// The time of the last successful delivery.
  final DateTime? lastSuccessfulTime;

  /// The time that the next delivery occurs.
  final DateTime? nextDeliveryTime;

  ConfigExportDeliveryInfo({
    this.lastAttemptTime,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatus,
    this.lastSuccessfulTime,
    this.nextDeliveryTime,
  });

  factory ConfigExportDeliveryInfo.fromJson(Map<String, dynamic> json) {
    return ConfigExportDeliveryInfo(
      lastAttemptTime: timeStampFromJson(json['lastAttemptTime']),
      lastErrorCode: json['lastErrorCode'] as String?,
      lastErrorMessage: json['lastErrorMessage'] as String?,
      lastStatus:
          (json['lastStatus'] as String?)?.let(DeliveryStatus.fromString),
      lastSuccessfulTime: timeStampFromJson(json['lastSuccessfulTime']),
      nextDeliveryTime: timeStampFromJson(json['nextDeliveryTime']),
    );
  }
}

/// Config rules evaluate the configuration settings of your Amazon Web Services
/// resources. A rule can run when Config detects a configuration change to an
/// Amazon Web Services resource or at a periodic frequency that you choose (for
/// example, every 24 hours). There are two types of rules: <i>Config Managed
/// Rules</i> and <i>Config Custom Rules</i>.
///
/// Config Managed Rules are predefined, customizable rules created by Config.
/// For a list of managed rules, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html">List
/// of Config Managed Rules</a>.
///
/// Config Custom Rules are rules that you create from scratch. There are two
/// ways to create Config custom rules: with Lambda functions (<a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function">
/// Lambda Developer Guide</a>) and with Guard (<a
/// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
/// GitHub Repository</a>), a policy-as-code language. Config custom rules
/// created with Lambda are called <i>Config Custom Lambda Rules</i> and Config
/// custom rules created with Guard are called <i>Config Custom Policy
/// Rules</i>.
///
/// For more information about developing and using Config rules, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html">Evaluating
/// Resource with Config Rules</a> in the <i>Config Developer Guide</i>.
/// <note>
/// You can use the Amazon Web Services CLI and Amazon Web Services SDKs if you
/// want to create a rule that triggers evaluations for your resources when
/// Config delivers the configuration snapshot. For more information, see
/// <a>ConfigSnapshotDeliveryProperties</a>.
/// </note>
class ConfigRule {
  /// Provides the rule owner (<code>Amazon Web Services</code> for managed rules,
  /// <code>CUSTOM_POLICY</code> for Custom Policy rules, and
  /// <code>CUSTOM_LAMBDA</code> for Custom Lambda rules), the rule identifier,
  /// and the notifications that cause the function to evaluate your Amazon Web
  /// Services resources.
  final Source source;

  /// The Amazon Resource Name (ARN) of the Config rule.
  final String? configRuleArn;

  /// The ID of the Config rule.
  final String? configRuleId;

  /// The name that you assign to the Config rule. The name is required if you are
  /// adding a new rule.
  final String? configRuleName;

  /// Indicates whether the Config rule is active or is currently being deleted by
  /// Config. It can also indicate the evaluation status for the Config rule.
  ///
  /// Config sets the state of the rule to <code>EVALUATING</code> temporarily
  /// after you use the <code>StartConfigRulesEvaluation</code> request to
  /// evaluate your resources against the Config rule.
  ///
  /// Config sets the state of the rule to <code>DELETING_RESULTS</code>
  /// temporarily after you use the <code>DeleteEvaluationResults</code> request
  /// to delete the current evaluation results for the Config rule.
  ///
  /// Config temporarily sets the state of a rule to <code>DELETING</code> after
  /// you use the <code>DeleteConfigRule</code> request to delete the rule. After
  /// Config deletes the rule, the rule and all of its evaluations are erased and
  /// are no longer available.
  final ConfigRuleState? configRuleState;

  /// Service principal name of the service that created the rule.
  /// <note>
  /// The field is populated only if the service-linked rule is created by a
  /// service. The field is empty if you create your own rule.
  /// </note>
  final String? createdBy;

  /// The description that you provide for the Config rule.
  final String? description;

  /// The modes the Config rule can be evaluated in. The valid values are distinct
  /// objects. By default, the value is Detective evaluation mode only.
  final List<EvaluationModeConfiguration>? evaluationModes;

  /// A string, in JSON format, that is passed to the Config rule Lambda function.
  final String? inputParameters;

  /// The maximum frequency with which Config runs evaluations for a rule. You can
  /// specify a value for <code>MaximumExecutionFrequency</code> when:
  ///
  /// <ul>
  /// <li>
  /// This is for an Config managed rule that is triggered at a periodic
  /// frequency.
  /// </li>
  /// <li>
  /// Your custom rule is triggered when Config delivers the configuration
  /// snapshot. For more information, see <a>ConfigSnapshotDeliveryProperties</a>.
  /// </li>
  /// </ul> <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// Defines which resources can trigger an evaluation for the rule. The scope
  /// can include one or more resource types, a combination of one resource type
  /// and one resource ID, or a combination of a tag key and value. Specify a
  /// scope to constrain the resources that can trigger an evaluation for the
  /// rule. If you do not specify a scope, evaluations are triggered when any
  /// resource in the recording group changes.
  /// <note>
  /// The scope can be empty.
  /// </note>
  final Scope? scope;

  ConfigRule({
    required this.source,
    this.configRuleArn,
    this.configRuleId,
    this.configRuleName,
    this.configRuleState,
    this.createdBy,
    this.description,
    this.evaluationModes,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.scope,
  });

  factory ConfigRule.fromJson(Map<String, dynamic> json) {
    return ConfigRule(
      source: Source.fromJson(json['Source'] as Map<String, dynamic>),
      configRuleArn: json['ConfigRuleArn'] as String?,
      configRuleId: json['ConfigRuleId'] as String?,
      configRuleName: json['ConfigRuleName'] as String?,
      configRuleState:
          (json['ConfigRuleState'] as String?)?.let(ConfigRuleState.fromString),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      evaluationModes: (json['EvaluationModes'] as List?)
          ?.nonNulls
          .map((e) =>
              EvaluationModeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
      scope: json['Scope'] != null
          ? Scope.fromJson(json['Scope'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final configRuleArn = this.configRuleArn;
    final configRuleId = this.configRuleId;
    final configRuleName = this.configRuleName;
    final configRuleState = this.configRuleState;
    final createdBy = this.createdBy;
    final description = this.description;
    final evaluationModes = this.evaluationModes;
    final inputParameters = this.inputParameters;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final scope = this.scope;
    return {
      'Source': source,
      if (configRuleArn != null) 'ConfigRuleArn': configRuleArn,
      if (configRuleId != null) 'ConfigRuleId': configRuleId,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
      if (configRuleState != null) 'ConfigRuleState': configRuleState.value,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (evaluationModes != null) 'EvaluationModes': evaluationModes,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.value,
      if (scope != null) 'Scope': scope,
    };
  }
}

/// Filters the compliance results based on account ID, region, compliance type,
/// and rule name.
class ConfigRuleComplianceFilters {
  /// The 12-digit account ID of the source account.
  final String? accountId;

  /// The source region where the data is aggregated.
  final String? awsRegion;

  /// The rule compliance status.
  ///
  /// For the <code>ConfigRuleComplianceFilters</code> data type, Config supports
  /// only <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. Config does not
  /// support the <code>NOT_APPLICABLE</code> and the
  /// <code>INSUFFICIENT_DATA</code> values.
  final ComplianceType? complianceType;

  /// The name of the Config rule.
  final String? configRuleName;

  ConfigRuleComplianceFilters({
    this.accountId,
    this.awsRegion,
    this.complianceType,
    this.configRuleName,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final complianceType = this.complianceType;
    final configRuleName = this.configRuleName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType.value,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
    };
  }
}

/// Filters the results based on the account IDs and regions.
class ConfigRuleComplianceSummaryFilters {
  /// The 12-digit account ID of the source account.
  final String? accountId;

  /// The source region where the data is aggregated.
  final String? awsRegion;

  ConfigRuleComplianceSummaryFilters({
    this.accountId,
    this.awsRegion,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
    };
  }
}

enum ConfigRuleComplianceSummaryGroupKey {
  accountId('ACCOUNT_ID'),
  awsRegion('AWS_REGION'),
  ;

  final String value;

  const ConfigRuleComplianceSummaryGroupKey(this.value);

  static ConfigRuleComplianceSummaryGroupKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigRuleComplianceSummaryGroupKey'));
}

/// Status information for your Config Managed rules and Config Custom Policy
/// rules. The status includes information such as the last time the rule ran,
/// the last time it failed, and the related error for the last failure.
///
/// This action does not return status information about Config Custom Lambda
/// rules.
class ConfigRuleEvaluationStatus {
  /// The Amazon Resource Name (ARN) of the Config rule.
  final String? configRuleArn;

  /// The ID of the Config rule.
  final String? configRuleId;

  /// The name of the Config rule.
  final String? configRuleName;

  /// The time that you first activated the Config rule.
  final DateTime? firstActivatedTime;

  /// Indicates whether Config has evaluated your resources against the rule at
  /// least once.
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> - Config has evaluated your Amazon Web Services resources
  /// against the rule at least once.
  /// </li>
  /// <li>
  /// <code>false</code> - Config has not finished evaluating your Amazon Web
  /// Services resources against the rule at least once.
  /// </li>
  /// </ul>
  final bool? firstEvaluationStarted;

  /// The time that you last turned off the Config rule.
  final DateTime? lastDeactivatedTime;

  /// The status of the last attempted delivery of a debug log for your Config
  /// Custom Policy rules. Either <code>Successful</code> or <code>Failed</code>.
  final String? lastDebugLogDeliveryStatus;

  /// The reason Config was not able to deliver a debug log. This is for the last
  /// failed attempt to retrieve a debug log for your Config Custom Policy rules.
  final String? lastDebugLogDeliveryStatusReason;

  /// The time Config last attempted to deliver a debug log for your Config Custom
  /// Policy rules.
  final DateTime? lastDebugLogDeliveryTime;

  /// The error code that Config returned when the rule last failed.
  final String? lastErrorCode;

  /// The error message that Config returned when the rule last failed.
  final String? lastErrorMessage;

  /// The time that Config last failed to evaluate your Amazon Web Services
  /// resources against the rule.
  final DateTime? lastFailedEvaluationTime;

  /// The time that Config last failed to invoke the Config rule to evaluate your
  /// Amazon Web Services resources.
  final DateTime? lastFailedInvocationTime;

  /// The time that Config last successfully evaluated your Amazon Web Services
  /// resources against the rule.
  final DateTime? lastSuccessfulEvaluationTime;

  /// The time that Config last successfully invoked the Config rule to evaluate
  /// your Amazon Web Services resources.
  final DateTime? lastSuccessfulInvocationTime;

  ConfigRuleEvaluationStatus({
    this.configRuleArn,
    this.configRuleId,
    this.configRuleName,
    this.firstActivatedTime,
    this.firstEvaluationStarted,
    this.lastDeactivatedTime,
    this.lastDebugLogDeliveryStatus,
    this.lastDebugLogDeliveryStatusReason,
    this.lastDebugLogDeliveryTime,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastFailedEvaluationTime,
    this.lastFailedInvocationTime,
    this.lastSuccessfulEvaluationTime,
    this.lastSuccessfulInvocationTime,
  });

  factory ConfigRuleEvaluationStatus.fromJson(Map<String, dynamic> json) {
    return ConfigRuleEvaluationStatus(
      configRuleArn: json['ConfigRuleArn'] as String?,
      configRuleId: json['ConfigRuleId'] as String?,
      configRuleName: json['ConfigRuleName'] as String?,
      firstActivatedTime: timeStampFromJson(json['FirstActivatedTime']),
      firstEvaluationStarted: json['FirstEvaluationStarted'] as bool?,
      lastDeactivatedTime: timeStampFromJson(json['LastDeactivatedTime']),
      lastDebugLogDeliveryStatus: json['LastDebugLogDeliveryStatus'] as String?,
      lastDebugLogDeliveryStatusReason:
          json['LastDebugLogDeliveryStatusReason'] as String?,
      lastDebugLogDeliveryTime:
          timeStampFromJson(json['LastDebugLogDeliveryTime']),
      lastErrorCode: json['LastErrorCode'] as String?,
      lastErrorMessage: json['LastErrorMessage'] as String?,
      lastFailedEvaluationTime:
          timeStampFromJson(json['LastFailedEvaluationTime']),
      lastFailedInvocationTime:
          timeStampFromJson(json['LastFailedInvocationTime']),
      lastSuccessfulEvaluationTime:
          timeStampFromJson(json['LastSuccessfulEvaluationTime']),
      lastSuccessfulInvocationTime:
          timeStampFromJson(json['LastSuccessfulInvocationTime']),
    );
  }
}

enum ConfigRuleState {
  active('ACTIVE'),
  deleting('DELETING'),
  deletingResults('DELETING_RESULTS'),
  evaluating('EVALUATING'),
  ;

  final String value;

  const ConfigRuleState(this.value);

  static ConfigRuleState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConfigRuleState'));
}

/// Provides options for how often Config delivers configuration snapshots to
/// the Amazon S3 bucket in your delivery channel.
///
/// The frequency for a rule that triggers evaluations for your resources when
/// Config delivers the configuration snapshot is set by one of two values,
/// depending on which is less frequent:
///
/// <ul>
/// <li>
/// The value for the <code>deliveryFrequency</code> parameter within the
/// delivery channel configuration, which sets how often Config delivers
/// configuration snapshots. This value also sets how often Config invokes
/// evaluations for Config rules.
/// </li>
/// <li>
/// The value for the <code>MaximumExecutionFrequency</code> parameter, which
/// sets the maximum frequency with which Config invokes evaluations for the
/// rule. For more information, see <a>ConfigRule</a>.
/// </li>
/// </ul>
/// If the <code>deliveryFrequency</code> value is less frequent than the
/// <code>MaximumExecutionFrequency</code> value for a rule, Config invokes the
/// rule only as often as the <code>deliveryFrequency</code> value.
/// <ol>
/// <li>
/// For example, you want your rule to run evaluations when Config delivers the
/// configuration snapshot.
/// </li>
/// <li>
/// You specify the <code>MaximumExecutionFrequency</code> value for
/// <code>Six_Hours</code>.
/// </li>
/// <li>
/// You then specify the delivery channel <code>deliveryFrequency</code> value
/// for <code>TwentyFour_Hours</code>.
/// </li>
/// <li>
/// Because the value for <code>deliveryFrequency</code> is less frequent than
/// <code>MaximumExecutionFrequency</code>, Config invokes evaluations for the
/// rule every 24 hours.
/// </li> </ol>
/// You should set the <code>MaximumExecutionFrequency</code> value to be at
/// least as frequent as the <code>deliveryFrequency</code> value. You can view
/// the <code>deliveryFrequency</code> value by using the
/// <code>DescribeDeliveryChannnels</code> action.
///
/// To update the <code>deliveryFrequency</code> with which Config delivers your
/// configuration snapshots, use the <code>PutDeliveryChannel</code> action.
class ConfigSnapshotDeliveryProperties {
  /// The frequency with which Config delivers configuration snapshots.
  final MaximumExecutionFrequency? deliveryFrequency;

  ConfigSnapshotDeliveryProperties({
    this.deliveryFrequency,
  });

  factory ConfigSnapshotDeliveryProperties.fromJson(Map<String, dynamic> json) {
    return ConfigSnapshotDeliveryProperties(
      deliveryFrequency: (json['deliveryFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryFrequency = this.deliveryFrequency;
    return {
      if (deliveryFrequency != null)
        'deliveryFrequency': deliveryFrequency.value,
    };
  }
}

/// A list that contains the status of the delivery of the configuration stream
/// notification to the Amazon SNS topic.
class ConfigStreamDeliveryInfo {
  /// The error code from the last attempted delivery.
  final String? lastErrorCode;

  /// The error message from the last attempted delivery.
  final String? lastErrorMessage;

  /// Status of the last attempted delivery.
  ///
  /// <b>Note</b> Providing an SNS topic on a <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html">DeliveryChannel</a>
  /// for Config is optional. If the SNS delivery is turned off, the last status
  /// will be <b>Not_Applicable</b>.
  final DeliveryStatus? lastStatus;

  /// The time from the last status change.
  final DateTime? lastStatusChangeTime;

  ConfigStreamDeliveryInfo({
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatus,
    this.lastStatusChangeTime,
  });

  factory ConfigStreamDeliveryInfo.fromJson(Map<String, dynamic> json) {
    return ConfigStreamDeliveryInfo(
      lastErrorCode: json['lastErrorCode'] as String?,
      lastErrorMessage: json['lastErrorMessage'] as String?,
      lastStatus:
          (json['lastStatus'] as String?)?.let(DeliveryStatus.fromString),
      lastStatusChangeTime: timeStampFromJson(json['lastStatusChangeTime']),
    );
  }
}

/// The details about the configuration aggregator, including information about
/// source accounts, regions, and metadata of the aggregator.
class ConfigurationAggregator {
  /// Provides a list of source accounts and regions to be aggregated.
  final List<AccountAggregationSource>? accountAggregationSources;

  /// The Amazon Resource Name (ARN) of the aggregator.
  final String? configurationAggregatorArn;

  /// The name of the aggregator.
  final String? configurationAggregatorName;

  /// Amazon Web Services service that created the configuration aggregator.
  final String? createdBy;

  /// The time stamp when the configuration aggregator was created.
  final DateTime? creationTime;

  /// The time of the last update.
  final DateTime? lastUpdatedTime;

  /// Provides an organization and list of regions to be aggregated.
  final OrganizationAggregationSource? organizationAggregationSource;

  ConfigurationAggregator({
    this.accountAggregationSources,
    this.configurationAggregatorArn,
    this.configurationAggregatorName,
    this.createdBy,
    this.creationTime,
    this.lastUpdatedTime,
    this.organizationAggregationSource,
  });

  factory ConfigurationAggregator.fromJson(Map<String, dynamic> json) {
    return ConfigurationAggregator(
      accountAggregationSources: (json['AccountAggregationSources'] as List?)
          ?.nonNulls
          .map((e) =>
              AccountAggregationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurationAggregatorArn: json['ConfigurationAggregatorArn'] as String?,
      configurationAggregatorName:
          json['ConfigurationAggregatorName'] as String?,
      createdBy: json['CreatedBy'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      organizationAggregationSource:
          json['OrganizationAggregationSource'] != null
              ? OrganizationAggregationSource.fromJson(
                  json['OrganizationAggregationSource'] as Map<String, dynamic>)
              : null,
    );
  }
}

/// A list that contains detailed configurations of a specified resource.
class ConfigurationItem {
  /// The 12-digit Amazon Web Services account ID associated with the resource.
  final String? accountId;

  /// Amazon Resource Name (ARN) associated with the resource.
  final String? arn;

  /// The Availability Zone associated with the resource.
  final String? availabilityZone;

  /// The region where the resource resides.
  final String? awsRegion;

  /// The description of the resource configuration.
  final String? configuration;

  /// The time when the recording of configuration changes was initiated for the
  /// resource.
  final DateTime? configurationItemCaptureTime;

  /// The time when configuration changes for the resource were delivered.
  /// <note>
  /// This field is optional and is not guaranteed to be present in a
  /// configuration item (CI). If you are using daily recording, this field will
  /// be populated. However, if you are using continuous recording, this field
  /// will be omitted since the delivery time is instantaneous as the CI is
  /// available right away. For more information on daily recording and continuous
  /// recording, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency">Recording
  /// Frequency</a> in the <i>Config Developer Guide</i>.
  /// </note>
  final DateTime? configurationItemDeliveryTime;

  /// Unique MD5 hash that represents the configuration item's state.
  ///
  /// You can use MD5 hash to compare the states of two or more configuration
  /// items that are associated with the same resource.
  final String? configurationItemMD5Hash;

  /// The configuration item status. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// OK – The resource configuration has been updated
  /// </li>
  /// <li>
  /// ResourceDiscovered – The resource was newly discovered
  /// </li>
  /// <li>
  /// ResourceNotRecorded – The resource was discovered but its configuration was
  /// not recorded since the recorder doesn't record resources of this type
  /// </li>
  /// <li>
  /// ResourceDeleted – The resource was deleted
  /// </li>
  /// <li>
  /// ResourceDeletedNotRecorded – The resource was deleted but its configuration
  /// was not recorded since the recorder doesn't record resources of this type
  /// </li>
  /// </ul>
  final ConfigurationItemStatus? configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String? configurationStateId;

  /// The recording frequency that Config uses to record configuration changes for
  /// the resource.
  final RecordingFrequency? recordingFrequency;

  /// A list of CloudTrail event IDs.
  ///
  /// A populated field indicates that the current configuration was initiated by
  /// the events recorded in the CloudTrail log. For more information about
  /// CloudTrail, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html">What
  /// Is CloudTrail</a>.
  ///
  /// An empty field indicates that the current configuration was not initiated by
  /// any event. As of Version 1.3, the relatedEvents field is empty. You can
  /// access the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html">LookupEvents
  /// API</a> in the <i>CloudTrail API Reference</i> to retrieve the events for
  /// the resource.
  final List<String>? relatedEvents;

  /// A list of related Amazon Web Services resources.
  final List<Relationship>? relationships;

  /// The time stamp when the resource was created.
  final DateTime? resourceCreationTime;

  /// The ID of the resource (for example, <code>sg-xxxxxx</code>).
  final String? resourceId;

  /// The custom name of the resource, if available.
  final String? resourceName;

  /// The type of Amazon Web Services resource.
  final ResourceType? resourceType;

  /// Configuration attributes that Config returns for certain resource types to
  /// supplement the information returned for the <code>configuration</code>
  /// parameter.
  final Map<String, String>? supplementaryConfiguration;

  /// A mapping of key value tags associated with the resource.
  final Map<String, String>? tags;

  /// The version number of the resource configuration.
  final String? version;

  ConfigurationItem({
    this.accountId,
    this.arn,
    this.availabilityZone,
    this.awsRegion,
    this.configuration,
    this.configurationItemCaptureTime,
    this.configurationItemDeliveryTime,
    this.configurationItemMD5Hash,
    this.configurationItemStatus,
    this.configurationStateId,
    this.recordingFrequency,
    this.relatedEvents,
    this.relationships,
    this.resourceCreationTime,
    this.resourceId,
    this.resourceName,
    this.resourceType,
    this.supplementaryConfiguration,
    this.tags,
    this.version,
  });

  factory ConfigurationItem.fromJson(Map<String, dynamic> json) {
    return ConfigurationItem(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      availabilityZone: json['availabilityZone'] as String?,
      awsRegion: json['awsRegion'] as String?,
      configuration: json['configuration'] as String?,
      configurationItemCaptureTime:
          timeStampFromJson(json['configurationItemCaptureTime']),
      configurationItemDeliveryTime:
          timeStampFromJson(json['configurationItemDeliveryTime']),
      configurationItemMD5Hash: json['configurationItemMD5Hash'] as String?,
      configurationItemStatus: (json['configurationItemStatus'] as String?)
          ?.let(ConfigurationItemStatus.fromString),
      configurationStateId: json['configurationStateId'] as String?,
      recordingFrequency: (json['recordingFrequency'] as String?)
          ?.let(RecordingFrequency.fromString),
      relatedEvents: (json['relatedEvents'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      relationships: (json['relationships'] as List?)
          ?.nonNulls
          .map((e) => Relationship.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceCreationTime: timeStampFromJson(json['resourceCreationTime']),
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      supplementaryConfiguration:
          (json['supplementaryConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }
}

enum ConfigurationItemStatus {
  ok('OK'),
  resourceDiscovered('ResourceDiscovered'),
  resourceNotRecorded('ResourceNotRecorded'),
  resourceDeleted('ResourceDeleted'),
  resourceDeletedNotRecorded('ResourceDeletedNotRecorded'),
  ;

  final String value;

  const ConfigurationItemStatus(this.value);

  static ConfigurationItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigurationItemStatus'));
}

/// Records configuration changes to your specified resource types. For more
/// information about the configuration recorder, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html">
/// <b>Managing the Configuration Recorder</b> </a> in the <i>Config Developer
/// Guide</i>.
class ConfigurationRecorder {
  /// The name of the configuration recorder. Config automatically assigns the
  /// name of "default" when creating the configuration recorder.
  /// <note>
  /// You cannot change the name of the configuration recorder after it has been
  /// created. To change the configuration recorder name, you must delete it and
  /// create a new configuration recorder with a new name.
  /// </note>
  final String? name;

  /// Specifies which resource types Config records for configuration changes.
  /// <note>
  /// <b> High Number of Config Evaluations</b>
  ///
  /// You may notice increased activity in your account during your initial month
  /// recording with Config when compared to subsequent months. During the initial
  /// bootstrapping process, Config runs evaluations on all the resources in your
  /// account that you have selected for Config to record.
  ///
  /// If you are running ephemeral workloads, you may see increased activity from
  /// Config as it records configuration changes associated with creating and
  /// deleting these temporary resources. An <i>ephemeral workload</i> is a
  /// temporary use of computing resources that are loaded and run when needed.
  /// Examples include Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances,
  /// Amazon EMR jobs, and Auto Scaling. If you want to avoid the increased
  /// activity from running ephemeral workloads, you can run these types of
  /// workloads in a separate account with Config turned off to avoid increased
  /// configuration recording and rule evaluations.
  /// </note>
  final RecordingGroup? recordingGroup;

  /// Specifies the default recording frequency that Config uses to record
  /// configuration changes. Config supports <i>Continuous recording</i> and
  /// <i>Daily recording</i>.
  ///
  /// <ul>
  /// <li>
  /// Continuous recording allows you to record configuration changes continuously
  /// whenever a change occurs.
  /// </li>
  /// <li>
  /// Daily recording allows you to receive a configuration item (CI) representing
  /// the most recent state of your resources over the last 24-hour period, only
  /// if it’s different from the previous CI recorded.
  /// </li>
  /// </ul> <note>
  /// Firewall Manager depends on continuous recording to monitor your resources.
  /// If you are using Firewall Manager, it is recommended that you set the
  /// recording frequency to Continuous.
  /// </note>
  /// You can also override the recording frequency for specific resource types.
  final RecordingMode? recordingMode;

  /// Amazon Resource Name (ARN) of the IAM role assumed by Config and used by the
  /// configuration recorder.
  /// <note>
  /// While the API model does not require this field, the server will reject a
  /// request without a defined <code>roleARN</code> for the configuration
  /// recorder.
  /// </note> <note>
  /// <b>Pre-existing Config role</b>
  ///
  /// If you have used an Amazon Web Services service that uses Config, such as
  /// Security Hub or Control Tower, and an Config role has already been created,
  /// make sure that the IAM role that you use when setting up Config keeps the
  /// same minimum permissions as the already created Config role. You must do
  /// this so that the other Amazon Web Services service continues to run as
  /// expected.
  ///
  /// For example, if Control Tower has an IAM role that allows Config to read
  /// Amazon Simple Storage Service (Amazon S3) objects, make sure that the same
  /// permissions are granted within the IAM role you use when setting up Config.
  /// Otherwise, it may interfere with how Control Tower operates. For more
  /// information about IAM roles for Config, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/security-iam.html">
  /// <b>Identity and Access Management for Config</b> </a> in the <i>Config
  /// Developer Guide</i>.
  /// </note>
  final String? roleARN;

  ConfigurationRecorder({
    this.name,
    this.recordingGroup,
    this.recordingMode,
    this.roleARN,
  });

  factory ConfigurationRecorder.fromJson(Map<String, dynamic> json) {
    return ConfigurationRecorder(
      name: json['name'] as String?,
      recordingGroup: json['recordingGroup'] != null
          ? RecordingGroup.fromJson(
              json['recordingGroup'] as Map<String, dynamic>)
          : null,
      recordingMode: json['recordingMode'] != null
          ? RecordingMode.fromJson(
              json['recordingMode'] as Map<String, dynamic>)
          : null,
      roleARN: json['roleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recordingGroup = this.recordingGroup;
    final recordingMode = this.recordingMode;
    final roleARN = this.roleARN;
    return {
      if (name != null) 'name': name,
      if (recordingGroup != null) 'recordingGroup': recordingGroup,
      if (recordingMode != null) 'recordingMode': recordingMode,
      if (roleARN != null) 'roleARN': roleARN,
    };
  }
}

/// The current status of the configuration recorder.
/// <note>
/// For a detailed status of recording events over time, add your Config events
/// to CloudWatch metrics and use CloudWatch metrics.
/// </note>
class ConfigurationRecorderStatus {
  /// The latest error code from when the recorder last failed.
  final String? lastErrorCode;

  /// The latest error message from when the recorder last failed.
  final String? lastErrorMessage;

  /// The time the recorder was last started.
  final DateTime? lastStartTime;

  /// The status of the latest recording event processed by the recorder.
  final RecorderStatus? lastStatus;

  /// The time of the latest change in status of an recording event processed by
  /// the recorder.
  final DateTime? lastStatusChangeTime;

  /// The time the recorder was last stopped.
  final DateTime? lastStopTime;

  /// The name of the configuration recorder.
  final String? name;

  /// Specifies whether or not the recorder is currently recording.
  final bool? recording;

  ConfigurationRecorderStatus({
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStartTime,
    this.lastStatus,
    this.lastStatusChangeTime,
    this.lastStopTime,
    this.name,
    this.recording,
  });

  factory ConfigurationRecorderStatus.fromJson(Map<String, dynamic> json) {
    return ConfigurationRecorderStatus(
      lastErrorCode: json['lastErrorCode'] as String?,
      lastErrorMessage: json['lastErrorMessage'] as String?,
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      lastStatus:
          (json['lastStatus'] as String?)?.let(RecorderStatus.fromString),
      lastStatusChangeTime: timeStampFromJson(json['lastStatusChangeTime']),
      lastStopTime: timeStampFromJson(json['lastStopTime']),
      name: json['name'] as String?,
      recording: json['recording'] as bool?,
    );
  }
}

/// Filters the conformance pack by compliance types and Config rule names.
class ConformancePackComplianceFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType? complianceType;

  /// Filters the results by Config rule names.
  final List<String>? configRuleNames;

  ConformancePackComplianceFilters({
    this.complianceType,
    this.configRuleNames,
  });

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleNames = this.configRuleNames;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.value,
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
    };
  }
}

/// A compliance score is the percentage of the number of compliant
/// rule-resource combinations in a conformance pack compared to the number of
/// total possible rule-resource combinations in the conformance pack. This
/// metric provides you with a high-level view of the compliance state of your
/// conformance packs. You can use it to identify, investigate, and understand
/// the level of compliance in your conformance packs.
class ConformancePackComplianceScore {
  /// The name of the conformance pack.
  final String? conformancePackName;

  /// The time that the conformance pack compliance score was last updated.
  final DateTime? lastUpdatedTime;

  /// Compliance score for the conformance pack. Conformance packs with no
  /// evaluation results will have a compliance score of
  /// <code>INSUFFICIENT_DATA</code>.
  final String? score;

  ConformancePackComplianceScore({
    this.conformancePackName,
    this.lastUpdatedTime,
    this.score,
  });

  factory ConformancePackComplianceScore.fromJson(Map<String, dynamic> json) {
    return ConformancePackComplianceScore(
      conformancePackName: json['ConformancePackName'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      score: json['Score'] as String?,
    );
  }
}

/// A list of filters to apply to the conformance pack compliance score result
/// set.
class ConformancePackComplianceScoresFilters {
  /// The names of the conformance packs whose compliance scores you want to
  /// include in the conformance pack compliance score result set. You can include
  /// up to 25 conformance packs in the <code>ConformancePackNames</code> array of
  /// strings, each with a character limit of 256 characters for the conformance
  /// pack name.
  final List<String> conformancePackNames;

  ConformancePackComplianceScoresFilters({
    required this.conformancePackNames,
  });

  Map<String, dynamic> toJson() {
    final conformancePackNames = this.conformancePackNames;
    return {
      'ConformancePackNames': conformancePackNames,
    };
  }
}

/// Summary includes the name and status of the conformance pack.
class ConformancePackComplianceSummary {
  /// The status of the conformance pack.
  final ConformancePackComplianceType conformancePackComplianceStatus;

  /// The name of the conformance pack name.
  final String conformancePackName;

  ConformancePackComplianceSummary({
    required this.conformancePackComplianceStatus,
    required this.conformancePackName,
  });

  factory ConformancePackComplianceSummary.fromJson(Map<String, dynamic> json) {
    return ConformancePackComplianceSummary(
      conformancePackComplianceStatus: ConformancePackComplianceType.fromString(
          (json['ConformancePackComplianceStatus'] as String)),
      conformancePackName: json['ConformancePackName'] as String,
    );
  }
}

enum ConformancePackComplianceType {
  compliant('COMPLIANT'),
  nonCompliant('NON_COMPLIANT'),
  insufficientData('INSUFFICIENT_DATA'),
  ;

  final String value;

  const ConformancePackComplianceType(this.value);

  static ConformancePackComplianceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConformancePackComplianceType'));
}

/// Returns details of a conformance pack. A conformance pack is a collection of
/// Config rules and remediation actions that can be easily deployed in an
/// account and a region.
class ConformancePackDetail {
  /// Amazon Resource Name (ARN) of the conformance pack.
  final String conformancePackArn;

  /// ID of the conformance pack.
  final String conformancePackId;

  /// Name of the conformance pack.
  final String conformancePackName;

  /// A list of <code>ConformancePackInputParameter</code> objects.
  final List<ConformancePackInputParameter>? conformancePackInputParameters;

  /// The Amazon Web Services service that created the conformance pack.
  final String? createdBy;

  /// The name of the Amazon S3 bucket where Config stores conformance pack
  /// templates.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3Bucket;

  /// The prefix for the Amazon S3 bucket.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3KeyPrefix;

  /// The last time a conformation pack update was requested.
  final DateTime? lastUpdateRequestedTime;

  /// An object that contains the name or Amazon Resource Name (ARN) of the Amazon
  /// Web Services Systems Manager document (SSM document) and the version of the
  /// SSM document that is used to create a conformance pack.
  final TemplateSSMDocumentDetails? templateSSMDocumentDetails;

  ConformancePackDetail({
    required this.conformancePackArn,
    required this.conformancePackId,
    required this.conformancePackName,
    this.conformancePackInputParameters,
    this.createdBy,
    this.deliveryS3Bucket,
    this.deliveryS3KeyPrefix,
    this.lastUpdateRequestedTime,
    this.templateSSMDocumentDetails,
  });

  factory ConformancePackDetail.fromJson(Map<String, dynamic> json) {
    return ConformancePackDetail(
      conformancePackArn: json['ConformancePackArn'] as String,
      conformancePackId: json['ConformancePackId'] as String,
      conformancePackName: json['ConformancePackName'] as String,
      conformancePackInputParameters: (json['ConformancePackInputParameters']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['CreatedBy'] as String?,
      deliveryS3Bucket: json['DeliveryS3Bucket'] as String?,
      deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String?,
      lastUpdateRequestedTime:
          timeStampFromJson(json['LastUpdateRequestedTime']),
      templateSSMDocumentDetails: json['TemplateSSMDocumentDetails'] != null
          ? TemplateSSMDocumentDetails.fromJson(
              json['TemplateSSMDocumentDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Filters a conformance pack by Config rule names, compliance types, Amazon
/// Web Services resource types, and resource IDs.
class ConformancePackEvaluationFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType? complianceType;

  /// Filters the results by Config rule names.
  final List<String>? configRuleNames;

  /// Filters the results by resource IDs.
  /// <note>
  /// This is valid only when you provide resource type. If there is no resource
  /// type, you will see an error.
  /// </note>
  final List<String>? resourceIds;

  /// Filters the results by the resource type (for example,
  /// <code>"AWS::EC2::Instance"</code>).
  final String? resourceType;

  ConformancePackEvaluationFilters({
    this.complianceType,
    this.configRuleNames,
    this.resourceIds,
    this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleNames = this.configRuleNames;
    final resourceIds = this.resourceIds;
    final resourceType = this.resourceType;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.value,
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      if (resourceIds != null) 'ResourceIds': resourceIds,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// The details of a conformance pack evaluation. Provides Config rule and
/// Amazon Web Services resource type that was evaluated, the compliance of the
/// conformance pack, related time stamps, and supplementary information.
class ConformancePackEvaluationResult {
  /// The compliance type. The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType complianceType;

  /// The time when Config rule evaluated Amazon Web Services resource.
  final DateTime configRuleInvokedTime;
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The time when Config recorded the evaluation result.
  final DateTime resultRecordedTime;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String? annotation;

  ConformancePackEvaluationResult({
    required this.complianceType,
    required this.configRuleInvokedTime,
    required this.evaluationResultIdentifier,
    required this.resultRecordedTime,
    this.annotation,
  });

  factory ConformancePackEvaluationResult.fromJson(Map<String, dynamic> json) {
    return ConformancePackEvaluationResult(
      complianceType: ConformancePackComplianceType.fromString(
          (json['ComplianceType'] as String)),
      configRuleInvokedTime:
          nonNullableTimeStampFromJson(json['ConfigRuleInvokedTime'] as Object),
      evaluationResultIdentifier: EvaluationResultIdentifier.fromJson(
          json['EvaluationResultIdentifier'] as Map<String, dynamic>),
      resultRecordedTime:
          nonNullableTimeStampFromJson(json['ResultRecordedTime'] as Object),
      annotation: json['Annotation'] as String?,
    );
  }
}

/// Input parameters in the form of key-value pairs for the conformance pack,
/// both of which you define. Keys can have a maximum character length of 255
/// characters, and values can have a maximum length of 4096 characters.
class ConformancePackInputParameter {
  /// One part of a key-value pair.
  final String parameterName;

  /// Another part of the key-value pair.
  final String parameterValue;

  ConformancePackInputParameter({
    required this.parameterName,
    required this.parameterValue,
  });

  factory ConformancePackInputParameter.fromJson(Map<String, dynamic> json) {
    return ConformancePackInputParameter(
      parameterName: json['ParameterName'] as String,
      parameterValue: json['ParameterValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      'ParameterName': parameterName,
      'ParameterValue': parameterValue,
    };
  }
}

/// Compliance information of one or more Config rules within a conformance
/// pack. You can filter using Config rule names and compliance types.
class ConformancePackRuleCompliance {
  /// Compliance of the Config rule.
  final ConformancePackComplianceType? complianceType;

  /// Name of the Config rule.
  final String? configRuleName;

  /// Controls for the conformance pack. A control is a process to prevent or
  /// detect problems while meeting objectives. A control can align with a
  /// specific compliance regime or map to internal controls defined by an
  /// organization.
  final List<String>? controls;

  ConformancePackRuleCompliance({
    this.complianceType,
    this.configRuleName,
    this.controls,
  });

  factory ConformancePackRuleCompliance.fromJson(Map<String, dynamic> json) {
    return ConformancePackRuleCompliance(
      complianceType: (json['ComplianceType'] as String?)
          ?.let(ConformancePackComplianceType.fromString),
      configRuleName: json['ConfigRuleName'] as String?,
      controls: (json['Controls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum ConformancePackState {
  createInProgress('CREATE_IN_PROGRESS'),
  createComplete('CREATE_COMPLETE'),
  createFailed('CREATE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  deleteFailed('DELETE_FAILED'),
  ;

  final String value;

  const ConformancePackState(this.value);

  static ConformancePackState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ConformancePackState'));
}

/// Status details of a conformance pack.
class ConformancePackStatusDetail {
  /// Amazon Resource Name (ARN) of comformance pack.
  final String conformancePackArn;

  /// ID of the conformance pack.
  final String conformancePackId;

  /// Name of the conformance pack.
  final String conformancePackName;

  /// Indicates deployment status of conformance pack.
  ///
  /// Config sets the state of the conformance pack to:
  ///
  /// <ul>
  /// <li>
  /// CREATE_IN_PROGRESS when a conformance pack creation is in progress for an
  /// account.
  /// </li>
  /// <li>
  /// CREATE_COMPLETE when a conformance pack has been successfully created in
  /// your account.
  /// </li>
  /// <li>
  /// CREATE_FAILED when a conformance pack creation failed in your account.
  /// </li>
  /// <li>
  /// DELETE_IN_PROGRESS when a conformance pack deletion is in progress.
  /// </li>
  /// <li>
  /// DELETE_FAILED when a conformance pack deletion failed in your account.
  /// </li>
  /// </ul>
  final ConformancePackState conformancePackState;

  /// Last time when conformation pack creation and update was requested.
  final DateTime lastUpdateRequestedTime;

  /// Amazon Resource Name (ARN) of CloudFormation stack.
  final String stackArn;

  /// The reason of conformance pack creation failure.
  final String? conformancePackStatusReason;

  /// Last time when conformation pack creation and update was successful.
  final DateTime? lastUpdateCompletedTime;

  ConformancePackStatusDetail({
    required this.conformancePackArn,
    required this.conformancePackId,
    required this.conformancePackName,
    required this.conformancePackState,
    required this.lastUpdateRequestedTime,
    required this.stackArn,
    this.conformancePackStatusReason,
    this.lastUpdateCompletedTime,
  });

  factory ConformancePackStatusDetail.fromJson(Map<String, dynamic> json) {
    return ConformancePackStatusDetail(
      conformancePackArn: json['ConformancePackArn'] as String,
      conformancePackId: json['ConformancePackId'] as String,
      conformancePackName: json['ConformancePackName'] as String,
      conformancePackState: ConformancePackState.fromString(
          (json['ConformancePackState'] as String)),
      lastUpdateRequestedTime: nonNullableTimeStampFromJson(
          json['LastUpdateRequestedTime'] as Object),
      stackArn: json['StackArn'] as String,
      conformancePackStatusReason:
          json['ConformancePackStatusReason'] as String?,
      lastUpdateCompletedTime:
          timeStampFromJson(json['LastUpdateCompletedTime']),
    );
  }
}

/// Provides the runtime system, policy definition, and whether debug logging
/// enabled. You can specify the following CustomPolicyDetails parameter values
/// only for Config Custom Policy rules.
class CustomPolicyDetails {
  /// The runtime system for your Config Custom Policy rule. Guard is a
  /// policy-as-code language that allows you to write policies that are enforced
  /// by Config Custom Policy rules. For more information about Guard, see the <a
  /// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
  /// GitHub Repository</a>.
  final String policyRuntime;

  /// The policy definition containing the logic for your Config Custom Policy
  /// rule.
  final String policyText;

  /// The boolean expression for enabling debug logging for your Config Custom
  /// Policy rule. The default value is <code>false</code>.
  final bool? enableDebugLogDelivery;

  CustomPolicyDetails({
    required this.policyRuntime,
    required this.policyText,
    this.enableDebugLogDelivery,
  });

  factory CustomPolicyDetails.fromJson(Map<String, dynamic> json) {
    return CustomPolicyDetails(
      policyRuntime: json['PolicyRuntime'] as String,
      policyText: json['PolicyText'] as String,
      enableDebugLogDelivery: json['EnableDebugLogDelivery'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyRuntime = this.policyRuntime;
    final policyText = this.policyText;
    final enableDebugLogDelivery = this.enableDebugLogDelivery;
    return {
      'PolicyRuntime': policyRuntime,
      'PolicyText': policyText,
      if (enableDebugLogDelivery != null)
        'EnableDebugLogDelivery': enableDebugLogDelivery,
    };
  }
}

/// The output when you delete the evaluation results for the specified Config
/// rule.
class DeleteEvaluationResultsResponse {
  DeleteEvaluationResultsResponse();

  factory DeleteEvaluationResultsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEvaluationResultsResponse();
  }
}

class DeleteRemediationConfigurationResponse {
  DeleteRemediationConfigurationResponse();

  factory DeleteRemediationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteRemediationConfigurationResponse();
  }
}

class DeleteRemediationExceptionsResponse {
  /// Returns a list of failed delete remediation exceptions batch objects. Each
  /// object in the batch consists of a list of failed items and failure messages.
  final List<FailedDeleteRemediationExceptionsBatch>? failedBatches;

  DeleteRemediationExceptionsResponse({
    this.failedBatches,
  });

  factory DeleteRemediationExceptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteRemediationExceptionsResponse(
      failedBatches: (json['FailedBatches'] as List?)
          ?.nonNulls
          .map((e) => FailedDeleteRemediationExceptionsBatch.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DeleteStoredQueryResponse {
  DeleteStoredQueryResponse();

  factory DeleteStoredQueryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStoredQueryResponse();
  }
}

/// The output for the <a>DeliverConfigSnapshot</a> action, in JSON format.
class DeliverConfigSnapshotResponse {
  /// The ID of the snapshot that is being created.
  final String? configSnapshotId;

  DeliverConfigSnapshotResponse({
    this.configSnapshotId,
  });

  factory DeliverConfigSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return DeliverConfigSnapshotResponse(
      configSnapshotId: json['configSnapshotId'] as String?,
    );
  }
}

/// The channel through which Config delivers notifications and updated
/// configuration states.
class DeliveryChannel {
  /// The options for how often Config delivers configuration snapshots to the
  /// Amazon S3 bucket.
  final ConfigSnapshotDeliveryProperties? configSnapshotDeliveryProperties;

  /// The name of the delivery channel. By default, Config assigns the name
  /// "default" when creating the delivery channel. To change the delivery channel
  /// name, you must use the DeleteDeliveryChannel action to delete your current
  /// delivery channel, and then you must use the PutDeliveryChannel command to
  /// create a delivery channel that has the desired name.
  final String? name;

  /// The name of the Amazon S3 bucket to which Config delivers configuration
  /// snapshots and configuration history files.
  ///
  /// If you specify a bucket that belongs to another Amazon Web Services account,
  /// that bucket must have policies that grant access permissions to Config. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html">Permissions
  /// for the Amazon S3 Bucket</a> in the <i>Config Developer Guide</i>.
  final String? s3BucketName;

  /// The prefix for the specified Amazon S3 bucket.
  final String? s3KeyPrefix;

  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS ) KMS key
  /// (KMS key) used to encrypt objects delivered by Config. Must belong to the
  /// same Region as the destination S3 bucket.
  final String? s3KmsKeyArn;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which Config sends
  /// notifications about configuration changes.
  ///
  /// If you choose a topic from another account, the topic must have policies
  /// that grant access permissions to Config. For more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html">Permissions
  /// for the Amazon SNS Topic</a> in the <i>Config Developer Guide</i>.
  final String? snsTopicARN;

  DeliveryChannel({
    this.configSnapshotDeliveryProperties,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.s3KmsKeyArn,
    this.snsTopicARN,
  });

  factory DeliveryChannel.fromJson(Map<String, dynamic> json) {
    return DeliveryChannel(
      configSnapshotDeliveryProperties:
          json['configSnapshotDeliveryProperties'] != null
              ? ConfigSnapshotDeliveryProperties.fromJson(
                  json['configSnapshotDeliveryProperties']
                      as Map<String, dynamic>)
              : null,
      name: json['name'] as String?,
      s3BucketName: json['s3BucketName'] as String?,
      s3KeyPrefix: json['s3KeyPrefix'] as String?,
      s3KmsKeyArn: json['s3KmsKeyArn'] as String?,
      snsTopicARN: json['snsTopicARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configSnapshotDeliveryProperties =
        this.configSnapshotDeliveryProperties;
    final name = this.name;
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    final s3KmsKeyArn = this.s3KmsKeyArn;
    final snsTopicARN = this.snsTopicARN;
    return {
      if (configSnapshotDeliveryProperties != null)
        'configSnapshotDeliveryProperties': configSnapshotDeliveryProperties,
      if (name != null) 'name': name,
      if (s3BucketName != null) 's3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
      if (s3KmsKeyArn != null) 's3KmsKeyArn': s3KmsKeyArn,
      if (snsTopicARN != null) 'snsTopicARN': snsTopicARN,
    };
  }
}

/// The status of a specified delivery channel.
///
/// Valid values: <code>Success</code> | <code>Failure</code>
class DeliveryChannelStatus {
  /// A list that contains the status of the delivery of the configuration history
  /// to the specified Amazon S3 bucket.
  final ConfigExportDeliveryInfo? configHistoryDeliveryInfo;

  /// A list containing the status of the delivery of the snapshot to the
  /// specified Amazon S3 bucket.
  final ConfigExportDeliveryInfo? configSnapshotDeliveryInfo;

  /// A list containing the status of the delivery of the configuration stream
  /// notification to the specified Amazon SNS topic.
  final ConfigStreamDeliveryInfo? configStreamDeliveryInfo;

  /// The name of the delivery channel.
  final String? name;

  DeliveryChannelStatus({
    this.configHistoryDeliveryInfo,
    this.configSnapshotDeliveryInfo,
    this.configStreamDeliveryInfo,
    this.name,
  });

  factory DeliveryChannelStatus.fromJson(Map<String, dynamic> json) {
    return DeliveryChannelStatus(
      configHistoryDeliveryInfo: json['configHistoryDeliveryInfo'] != null
          ? ConfigExportDeliveryInfo.fromJson(
              json['configHistoryDeliveryInfo'] as Map<String, dynamic>)
          : null,
      configSnapshotDeliveryInfo: json['configSnapshotDeliveryInfo'] != null
          ? ConfigExportDeliveryInfo.fromJson(
              json['configSnapshotDeliveryInfo'] as Map<String, dynamic>)
          : null,
      configStreamDeliveryInfo: json['configStreamDeliveryInfo'] != null
          ? ConfigStreamDeliveryInfo.fromJson(
              json['configStreamDeliveryInfo'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }
}

enum DeliveryStatus {
  success('Success'),
  failure('Failure'),
  notApplicable('Not_Applicable'),
  ;

  final String value;

  const DeliveryStatus(this.value);

  static DeliveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeliveryStatus'));
}

class DescribeAggregateComplianceByConfigRulesResponse {
  /// Returns a list of AggregateComplianceByConfigRule object.
  final List<AggregateComplianceByConfigRule>? aggregateComplianceByConfigRules;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  DescribeAggregateComplianceByConfigRulesResponse({
    this.aggregateComplianceByConfigRules,
    this.nextToken,
  });

  factory DescribeAggregateComplianceByConfigRulesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAggregateComplianceByConfigRulesResponse(
      aggregateComplianceByConfigRules:
          (json['AggregateComplianceByConfigRules'] as List?)
              ?.nonNulls
              .map((e) => AggregateComplianceByConfigRule.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeAggregateComplianceByConformancePacksResponse {
  /// Returns the <code>AggregateComplianceByConformancePack</code> object.
  final List<AggregateComplianceByConformancePack>?
      aggregateComplianceByConformancePacks;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  DescribeAggregateComplianceByConformancePacksResponse({
    this.aggregateComplianceByConformancePacks,
    this.nextToken,
  });

  factory DescribeAggregateComplianceByConformancePacksResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAggregateComplianceByConformancePacksResponse(
      aggregateComplianceByConformancePacks:
          (json['AggregateComplianceByConformancePacks'] as List?)
              ?.nonNulls
              .map((e) => AggregateComplianceByConformancePack.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeAggregationAuthorizationsResponse {
  /// Returns a list of authorizations granted to various aggregator accounts and
  /// regions.
  final List<AggregationAuthorization>? aggregationAuthorizations;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  DescribeAggregationAuthorizationsResponse({
    this.aggregationAuthorizations,
    this.nextToken,
  });

  factory DescribeAggregationAuthorizationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAggregationAuthorizationsResponse(
      aggregationAuthorizations: (json['AggregationAuthorizations'] as List?)
          ?.nonNulls
          .map((e) =>
              AggregationAuthorization.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class DescribeComplianceByConfigRuleResponse {
  /// Indicates whether each of the specified Config rules is compliant.
  final List<ComplianceByConfigRule>? complianceByConfigRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  DescribeComplianceByConfigRuleResponse({
    this.complianceByConfigRules,
    this.nextToken,
  });

  factory DescribeComplianceByConfigRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeComplianceByConfigRuleResponse(
      complianceByConfigRules: (json['ComplianceByConfigRules'] as List?)
          ?.nonNulls
          .map(
              (e) => ComplianceByConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class DescribeComplianceByResourceResponse {
  /// Indicates whether the specified Amazon Web Services resource complies with
  /// all of the Config rules that evaluate it.
  final List<ComplianceByResource>? complianceByResources;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  DescribeComplianceByResourceResponse({
    this.complianceByResources,
    this.nextToken,
  });

  factory DescribeComplianceByResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeComplianceByResourceResponse(
      complianceByResources: (json['ComplianceByResources'] as List?)
          ?.nonNulls
          .map((e) => ComplianceByResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class DescribeConfigRuleEvaluationStatusResponse {
  /// Status information about your Config managed rules.
  final List<ConfigRuleEvaluationStatus>? configRulesEvaluationStatus;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  DescribeConfigRuleEvaluationStatusResponse({
    this.configRulesEvaluationStatus,
    this.nextToken,
  });

  factory DescribeConfigRuleEvaluationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigRuleEvaluationStatusResponse(
      configRulesEvaluationStatus: (json['ConfigRulesEvaluationStatus']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConfigRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// Returns a filtered list of Detective or Proactive Config rules. By default,
/// if the filter is not defined, this API returns an unfiltered list. For more
/// information on Detective or Proactive Config rules, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html">
/// <b>Evaluation Mode</b> </a> in the <i>Config Developer Guide</i>.
class DescribeConfigRulesFilters {
  /// The mode of an evaluation. The valid values are Detective or Proactive.
  final EvaluationMode? evaluationMode;

  DescribeConfigRulesFilters({
    this.evaluationMode,
  });

  Map<String, dynamic> toJson() {
    final evaluationMode = this.evaluationMode;
    return {
      if (evaluationMode != null) 'EvaluationMode': evaluationMode.value,
    };
  }
}

/// <p/>
class DescribeConfigRulesResponse {
  /// The details about your Config rules.
  final List<ConfigRule>? configRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  DescribeConfigRulesResponse({
    this.configRules,
    this.nextToken,
  });

  factory DescribeConfigRulesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConfigRulesResponse(
      configRules: (json['ConfigRules'] as List?)
          ?.nonNulls
          .map((e) => ConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeConfigurationAggregatorSourcesStatusResponse {
  /// Returns an AggregatedSourceStatus object.
  final List<AggregatedSourceStatus>? aggregatedSourceStatusList;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  DescribeConfigurationAggregatorSourcesStatusResponse({
    this.aggregatedSourceStatusList,
    this.nextToken,
  });

  factory DescribeConfigurationAggregatorSourcesStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationAggregatorSourcesStatusResponse(
      aggregatedSourceStatusList: (json['AggregatedSourceStatusList'] as List?)
          ?.nonNulls
          .map(
              (e) => AggregatedSourceStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeConfigurationAggregatorsResponse {
  /// Returns a ConfigurationAggregators object.
  final List<ConfigurationAggregator>? configurationAggregators;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  DescribeConfigurationAggregatorsResponse({
    this.configurationAggregators,
    this.nextToken,
  });

  factory DescribeConfigurationAggregatorsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationAggregatorsResponse(
      configurationAggregators: (json['ConfigurationAggregators'] as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationAggregator.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// The output for the <a>DescribeConfigurationRecorderStatus</a> action, in
/// JSON format.
class DescribeConfigurationRecorderStatusResponse {
  /// A list that contains status of the specified recorders.
  final List<ConfigurationRecorderStatus>? configurationRecordersStatus;

  DescribeConfigurationRecorderStatusResponse({
    this.configurationRecordersStatus,
  });

  factory DescribeConfigurationRecorderStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationRecorderStatusResponse(
      configurationRecordersStatus: (json['ConfigurationRecordersStatus']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationRecorderStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output for the <a>DescribeConfigurationRecorders</a> action.
class DescribeConfigurationRecordersResponse {
  /// A list that contains the descriptions of the specified configuration
  /// recorders.
  final List<ConfigurationRecorder>? configurationRecorders;

  DescribeConfigurationRecordersResponse({
    this.configurationRecorders,
  });

  factory DescribeConfigurationRecordersResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationRecordersResponse(
      configurationRecorders: (json['ConfigurationRecorders'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationRecorder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeConformancePackComplianceResponse {
  /// Name of the conformance pack.
  final String conformancePackName;

  /// Returns a list of <code>ConformancePackRuleCompliance</code> objects.
  final List<ConformancePackRuleCompliance> conformancePackRuleComplianceList;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  DescribeConformancePackComplianceResponse({
    required this.conformancePackName,
    required this.conformancePackRuleComplianceList,
    this.nextToken,
  });

  factory DescribeConformancePackComplianceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConformancePackComplianceResponse(
      conformancePackName: json['ConformancePackName'] as String,
      conformancePackRuleComplianceList:
          (json['ConformancePackRuleComplianceList'] as List)
              .nonNulls
              .map((e) => ConformancePackRuleCompliance.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeConformancePackStatusResponse {
  /// A list of <code>ConformancePackStatusDetail</code> objects.
  final List<ConformancePackStatusDetail>? conformancePackStatusDetails;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  DescribeConformancePackStatusResponse({
    this.conformancePackStatusDetails,
    this.nextToken,
  });

  factory DescribeConformancePackStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConformancePackStatusResponse(
      conformancePackStatusDetails: (json['ConformancePackStatusDetails']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConformancePackStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class DescribeConformancePacksResponse {
  /// Returns a list of <code>ConformancePackDetail</code> objects.
  final List<ConformancePackDetail>? conformancePackDetails;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  DescribeConformancePacksResponse({
    this.conformancePackDetails,
    this.nextToken,
  });

  factory DescribeConformancePacksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConformancePacksResponse(
      conformancePackDetails: (json['ConformancePackDetails'] as List?)
          ?.nonNulls
          .map((e) => ConformancePackDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// The output for the <a>DescribeDeliveryChannelStatus</a> action.
class DescribeDeliveryChannelStatusResponse {
  /// A list that contains the status of a specified delivery channel.
  final List<DeliveryChannelStatus>? deliveryChannelsStatus;

  DescribeDeliveryChannelStatusResponse({
    this.deliveryChannelsStatus,
  });

  factory DescribeDeliveryChannelStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDeliveryChannelStatusResponse(
      deliveryChannelsStatus: (json['DeliveryChannelsStatus'] as List?)
          ?.nonNulls
          .map((e) => DeliveryChannelStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output for the <a>DescribeDeliveryChannels</a> action.
class DescribeDeliveryChannelsResponse {
  /// A list that contains the descriptions of the specified delivery channel.
  final List<DeliveryChannel>? deliveryChannels;

  DescribeDeliveryChannelsResponse({
    this.deliveryChannels,
  });

  factory DescribeDeliveryChannelsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeliveryChannelsResponse(
      deliveryChannels: (json['DeliveryChannels'] as List?)
          ?.nonNulls
          .map((e) => DeliveryChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeOrganizationConfigRuleStatusesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// A list of <code>OrganizationConfigRuleStatus</code> objects.
  final List<OrganizationConfigRuleStatus>? organizationConfigRuleStatuses;

  DescribeOrganizationConfigRuleStatusesResponse({
    this.nextToken,
    this.organizationConfigRuleStatuses,
  });

  factory DescribeOrganizationConfigRuleStatusesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigRuleStatusesResponse(
      nextToken: json['NextToken'] as String?,
      organizationConfigRuleStatuses: (json['OrganizationConfigRuleStatuses']
              as List?)
          ?.nonNulls
          .map((e) =>
              OrganizationConfigRuleStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeOrganizationConfigRulesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a list of <code>OrganizationConfigRule</code> objects.
  final List<OrganizationConfigRule>? organizationConfigRules;

  DescribeOrganizationConfigRulesResponse({
    this.nextToken,
    this.organizationConfigRules,
  });

  factory DescribeOrganizationConfigRulesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigRulesResponse(
      nextToken: json['NextToken'] as String?,
      organizationConfigRules: (json['OrganizationConfigRules'] as List?)
          ?.nonNulls
          .map(
              (e) => OrganizationConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeOrganizationConformancePackStatusesResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String? nextToken;

  /// A list of <code>OrganizationConformancePackStatus</code> objects.
  final List<OrganizationConformancePackStatus>?
      organizationConformancePackStatuses;

  DescribeOrganizationConformancePackStatusesResponse({
    this.nextToken,
    this.organizationConformancePackStatuses,
  });

  factory DescribeOrganizationConformancePackStatusesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConformancePackStatusesResponse(
      nextToken: json['NextToken'] as String?,
      organizationConformancePackStatuses:
          (json['OrganizationConformancePackStatuses'] as List?)
              ?.nonNulls
              .map((e) => OrganizationConformancePackStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class DescribeOrganizationConformancePacksResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String? nextToken;

  /// Returns a list of OrganizationConformancePacks objects.
  final List<OrganizationConformancePack>? organizationConformancePacks;

  DescribeOrganizationConformancePacksResponse({
    this.nextToken,
    this.organizationConformancePacks,
  });

  factory DescribeOrganizationConformancePacksResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConformancePacksResponse(
      nextToken: json['NextToken'] as String?,
      organizationConformancePacks: (json['OrganizationConformancePacks']
              as List?)
          ?.nonNulls
          .map((e) =>
              OrganizationConformancePack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribePendingAggregationRequestsResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a PendingAggregationRequests object.
  final List<PendingAggregationRequest>? pendingAggregationRequests;

  DescribePendingAggregationRequestsResponse({
    this.nextToken,
    this.pendingAggregationRequests,
  });

  factory DescribePendingAggregationRequestsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePendingAggregationRequestsResponse(
      nextToken: json['NextToken'] as String?,
      pendingAggregationRequests: (json['PendingAggregationRequests'] as List?)
          ?.nonNulls
          .map((e) =>
              PendingAggregationRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeRemediationConfigurationsResponse {
  /// Returns a remediation configuration object.
  final List<RemediationConfiguration>? remediationConfigurations;

  DescribeRemediationConfigurationsResponse({
    this.remediationConfigurations,
  });

  factory DescribeRemediationConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRemediationConfigurationsResponse(
      remediationConfigurations: (json['RemediationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              RemediationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeRemediationExceptionsResponse {
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a list of remediation exception objects.
  final List<RemediationException>? remediationExceptions;

  DescribeRemediationExceptionsResponse({
    this.nextToken,
    this.remediationExceptions,
  });

  factory DescribeRemediationExceptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRemediationExceptionsResponse(
      nextToken: json['NextToken'] as String?,
      remediationExceptions: (json['RemediationExceptions'] as List?)
          ?.nonNulls
          .map((e) => RemediationException.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeRemediationExecutionStatusResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a list of remediation execution statuses objects.
  final List<RemediationExecutionStatus>? remediationExecutionStatuses;

  DescribeRemediationExecutionStatusResponse({
    this.nextToken,
    this.remediationExecutionStatuses,
  });

  factory DescribeRemediationExecutionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRemediationExecutionStatusResponse(
      nextToken: json['NextToken'] as String?,
      remediationExecutionStatuses: (json['RemediationExecutionStatuses']
              as List?)
          ?.nonNulls
          .map((e) =>
              RemediationExecutionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeRetentionConfigurationsResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a retention configuration object.
  final List<RetentionConfiguration>? retentionConfigurations;

  DescribeRetentionConfigurationsResponse({
    this.nextToken,
    this.retentionConfigurations,
  });

  factory DescribeRetentionConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRetentionConfigurationsResponse(
      nextToken: json['NextToken'] as String?,
      retentionConfigurations: (json['RetentionConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => RetentionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Identifies an Amazon Web Services resource and indicates whether it complies
/// with the Config rule that it was evaluated against.
class Evaluation {
  /// The ID of the Amazon Web Services resource that was evaluated.
  final String complianceResourceId;

  /// The type of Amazon Web Services resource that was evaluated.
  final String complianceResourceType;

  /// Indicates whether the Amazon Web Services resource complies with the Config
  /// rule that it was evaluated against.
  ///
  /// For the <code>Evaluation</code> data type, Config supports only the
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>NOT_APPLICABLE</code> values. Config does not support the
  /// <code>INSUFFICIENT_DATA</code> value for this data type.
  ///
  /// Similarly, Config does not accept <code>INSUFFICIENT_DATA</code> as the
  /// value for <code>ComplianceType</code> from a <code>PutEvaluations</code>
  /// request. For example, an Lambda function for a custom Config rule cannot
  /// pass an <code>INSUFFICIENT_DATA</code> value to Config.
  final ComplianceType complianceType;

  /// The time of the event in Config that triggered the evaluation. For
  /// event-based evaluations, the time indicates when Config created the
  /// configuration item that triggered the evaluation. For periodic evaluations,
  /// the time indicates when Config triggered the evaluation at the frequency
  /// that you specified (for example, every 24 hours).
  final DateTime orderingTimestamp;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String? annotation;

  Evaluation({
    required this.complianceResourceId,
    required this.complianceResourceType,
    required this.complianceType,
    required this.orderingTimestamp,
    this.annotation,
  });

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      complianceResourceId: json['ComplianceResourceId'] as String,
      complianceResourceType: json['ComplianceResourceType'] as String,
      complianceType:
          ComplianceType.fromString((json['ComplianceType'] as String)),
      orderingTimestamp:
          nonNullableTimeStampFromJson(json['OrderingTimestamp'] as Object),
      annotation: json['Annotation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceResourceId = this.complianceResourceId;
    final complianceResourceType = this.complianceResourceType;
    final complianceType = this.complianceType;
    final orderingTimestamp = this.orderingTimestamp;
    final annotation = this.annotation;
    return {
      'ComplianceResourceId': complianceResourceId,
      'ComplianceResourceType': complianceResourceType,
      'ComplianceType': complianceType.value,
      'OrderingTimestamp': unixTimestampToJson(orderingTimestamp),
      if (annotation != null) 'Annotation': annotation,
    };
  }
}

/// Use EvaluationContext to group independently initiated proactive resource
/// evaluations. For example, CFN Stack. If you want to check just a resource
/// definition, you do not need to provide evaluation context.
class EvaluationContext {
  /// A unique EvaluationContextIdentifier ID for an EvaluationContext.
  final String? evaluationContextIdentifier;

  EvaluationContext({
    this.evaluationContextIdentifier,
  });

  factory EvaluationContext.fromJson(Map<String, dynamic> json) {
    return EvaluationContext(
      evaluationContextIdentifier:
          json['EvaluationContextIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationContextIdentifier = this.evaluationContextIdentifier;
    return {
      if (evaluationContextIdentifier != null)
        'EvaluationContextIdentifier': evaluationContextIdentifier,
    };
  }
}

enum EvaluationMode {
  detective('DETECTIVE'),
  proactive('PROACTIVE'),
  ;

  final String value;

  const EvaluationMode(this.value);

  static EvaluationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EvaluationMode'));
}

/// The configuration object for Config rule evaluation mode. The supported
/// valid values are Detective or Proactive.
class EvaluationModeConfiguration {
  /// The mode of an evaluation. The valid values are Detective or Proactive.
  final EvaluationMode? mode;

  EvaluationModeConfiguration({
    this.mode,
  });

  factory EvaluationModeConfiguration.fromJson(Map<String, dynamic> json) {
    return EvaluationModeConfiguration(
      mode: (json['Mode'] as String?)?.let(EvaluationMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// The details of an Config evaluation. Provides the Amazon Web Services
/// resource that was evaluated, the compliance of the resource, related time
/// stamps, and supplementary information.
class EvaluationResult {
  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String? annotation;

  /// Indicates whether the Amazon Web Services resource complies with the Config
  /// rule that evaluated it.
  ///
  /// For the <code>EvaluationResult</code> data type, Config supports only the
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>NOT_APPLICABLE</code> values. Config does not support the
  /// <code>INSUFFICIENT_DATA</code> value for the <code>EvaluationResult</code>
  /// data type.
  final ComplianceType? complianceType;

  /// The time when the Config rule evaluated the Amazon Web Services resource.
  final DateTime? configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier? evaluationResultIdentifier;

  /// The time when Config recorded the evaluation result.
  final DateTime? resultRecordedTime;

  /// An encrypted token that associates an evaluation with an Config rule. The
  /// token identifies the rule, the Amazon Web Services resource being evaluated,
  /// and the event that triggered the evaluation.
  final String? resultToken;

  EvaluationResult({
    this.annotation,
    this.complianceType,
    this.configRuleInvokedTime,
    this.evaluationResultIdentifier,
    this.resultRecordedTime,
    this.resultToken,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      annotation: json['Annotation'] as String?,
      complianceType:
          (json['ComplianceType'] as String?)?.let(ComplianceType.fromString),
      configRuleInvokedTime: timeStampFromJson(json['ConfigRuleInvokedTime']),
      evaluationResultIdentifier: json['EvaluationResultIdentifier'] != null
          ? EvaluationResultIdentifier.fromJson(
              json['EvaluationResultIdentifier'] as Map<String, dynamic>)
          : null,
      resultRecordedTime: timeStampFromJson(json['ResultRecordedTime']),
      resultToken: json['ResultToken'] as String?,
    );
  }
}

/// Uniquely identifies an evaluation result.
class EvaluationResultIdentifier {
  /// Identifies an Config rule used to evaluate an Amazon Web Services resource,
  /// and provides the type and ID of the evaluated resource.
  final EvaluationResultQualifier? evaluationResultQualifier;

  /// The time of the event that triggered the evaluation of your Amazon Web
  /// Services resources. The time can indicate when Config delivered a
  /// configuration item change notification, or it can indicate when Config
  /// delivered the configuration snapshot, depending on which event triggered the
  /// evaluation.
  final DateTime? orderingTimestamp;

  /// A Unique ID for an evaluation result.
  final String? resourceEvaluationId;

  EvaluationResultIdentifier({
    this.evaluationResultQualifier,
    this.orderingTimestamp,
    this.resourceEvaluationId,
  });

  factory EvaluationResultIdentifier.fromJson(Map<String, dynamic> json) {
    return EvaluationResultIdentifier(
      evaluationResultQualifier: json['EvaluationResultQualifier'] != null
          ? EvaluationResultQualifier.fromJson(
              json['EvaluationResultQualifier'] as Map<String, dynamic>)
          : null,
      orderingTimestamp: timeStampFromJson(json['OrderingTimestamp']),
      resourceEvaluationId: json['ResourceEvaluationId'] as String?,
    );
  }
}

/// Identifies an Config rule that evaluated an Amazon Web Services resource,
/// and provides the type and ID of the resource that the rule evaluated.
class EvaluationResultQualifier {
  /// The name of the Config rule that was used in the evaluation.
  final String? configRuleName;

  /// The mode of an evaluation. The valid values are Detective or Proactive.
  final EvaluationMode? evaluationMode;

  /// The ID of the evaluated Amazon Web Services resource.
  final String? resourceId;

  /// The type of Amazon Web Services resource that was evaluated.
  final String? resourceType;

  EvaluationResultQualifier({
    this.configRuleName,
    this.evaluationMode,
    this.resourceId,
    this.resourceType,
  });

  factory EvaluationResultQualifier.fromJson(Map<String, dynamic> json) {
    return EvaluationResultQualifier(
      configRuleName: json['ConfigRuleName'] as String?,
      evaluationMode:
          (json['EvaluationMode'] as String?)?.let(EvaluationMode.fromString),
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }
}

/// Returns status details of an evaluation.
class EvaluationStatus {
  /// The status of an execution. The valid values are In_Progress, Succeeded or
  /// Failed.
  final ResourceEvaluationStatus status;

  /// An explanation for failed execution status.
  final String? failureReason;

  EvaluationStatus({
    required this.status,
    this.failureReason,
  });

  factory EvaluationStatus.fromJson(Map<String, dynamic> json) {
    return EvaluationStatus(
      status: ResourceEvaluationStatus.fromString((json['Status'] as String)),
      failureReason: json['FailureReason'] as String?,
    );
  }
}

enum EventSource {
  awsConfig('aws.config'),
  ;

  final String value;

  const EventSource(this.value);

  static EventSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EventSource'));
}

/// Specifies whether the configuration recorder excludes certain resource types
/// from being recorded. Use the <code>resourceTypes</code> field to enter a
/// comma-separated list of resource types you want to exclude from recording.
///
/// By default, when Config adds support for a new resource type in the Region
/// where you set up the configuration recorder, including global resource
/// types, Config starts recording resources of that type automatically.
/// <note>
/// <b>How to use the exclusion recording strategy </b>
///
/// To use this option, you must set the <code>useOnly</code> field of <a
/// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
/// to <code>EXCLUSION_BY_RESOURCE_TYPES</code>.
///
/// Config will then record configuration changes for all supported resource
/// types, except the resource types that you specify to exclude from being
/// recorded.
///
/// <b>Global resource types and the exclusion recording strategy </b>
///
/// Unless specifically listed as exclusions,
/// <code>AWS::RDS::GlobalCluster</code> will be recorded automatically in all
/// supported Config Regions were the configuration recorder is enabled.
///
/// IAM users, groups, roles, and customer managed policies will be recorded in
/// the Region where you set up the configuration recorder if that is a Region
/// where Config was available before February 2022. You cannot be record the
/// global IAM resouce types in Regions supported by Config after February 2022.
/// This list where you cannot record the global IAM resource types includes the
/// following Regions:
///
/// <ul>
/// <li>
/// Asia Pacific (Hyderabad)
/// </li>
/// <li>
/// Asia Pacific (Melbourne)
/// </li>
/// <li>
/// Canada West (Calgary)
/// </li>
/// <li>
/// Europe (Spain)
/// </li>
/// <li>
/// Europe (Zurich)
/// </li>
/// <li>
/// Israel (Tel Aviv)
/// </li>
/// <li>
/// Middle East (UAE)
/// </li>
/// </ul> </note>
class ExclusionByResourceTypes {
  /// A comma-separated list of resource types to exclude from recording by the
  /// configuration recorder.
  final List<ResourceType>? resourceTypes;

  ExclusionByResourceTypes({
    this.resourceTypes,
  });

  factory ExclusionByResourceTypes.fromJson(Map<String, dynamic> json) {
    return ExclusionByResourceTypes(
      resourceTypes: (json['resourceTypes'] as List?)
          ?.nonNulls
          .map((e) => ResourceType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTypes = this.resourceTypes;
    return {
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.value).toList(),
    };
  }
}

/// The controls that Config uses for executing remediations.
class ExecutionControls {
  /// A SsmControls object.
  final SsmControls? ssmControls;

  ExecutionControls({
    this.ssmControls,
  });

  factory ExecutionControls.fromJson(Map<String, dynamic> json) {
    return ExecutionControls(
      ssmControls: json['SsmControls'] != null
          ? SsmControls.fromJson(json['SsmControls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ssmControls = this.ssmControls;
    return {
      if (ssmControls != null) 'SsmControls': ssmControls,
    };
  }
}

/// Identifies an Amazon Web Services resource and indicates whether it complies
/// with the Config rule that it was evaluated against.
class ExternalEvaluation {
  /// The evaluated compliance resource ID. Config accepts only Amazon Web
  /// Services account ID.
  final String complianceResourceId;

  /// The evaluated compliance resource type. Config accepts
  /// <code>AWS::::Account</code> resource type.
  final String complianceResourceType;

  /// The compliance of the Amazon Web Services resource. The valid values are
  /// <code>COMPLIANT, NON_COMPLIANT, </code> and <code>NOT_APPLICABLE</code>.
  final ComplianceType complianceType;

  /// The time when the compliance was recorded.
  final DateTime orderingTimestamp;

  /// Supplementary information about the reason of compliance. For example, this
  /// task was completed on a specific date.
  final String? annotation;

  ExternalEvaluation({
    required this.complianceResourceId,
    required this.complianceResourceType,
    required this.complianceType,
    required this.orderingTimestamp,
    this.annotation,
  });

  Map<String, dynamic> toJson() {
    final complianceResourceId = this.complianceResourceId;
    final complianceResourceType = this.complianceResourceType;
    final complianceType = this.complianceType;
    final orderingTimestamp = this.orderingTimestamp;
    final annotation = this.annotation;
    return {
      'ComplianceResourceId': complianceResourceId,
      'ComplianceResourceType': complianceResourceType,
      'ComplianceType': complianceType.value,
      'OrderingTimestamp': unixTimestampToJson(orderingTimestamp),
      if (annotation != null) 'Annotation': annotation,
    };
  }
}

/// List of each of the failed delete remediation exceptions with specific
/// reasons.
class FailedDeleteRemediationExceptionsBatch {
  /// Returns remediation exception resource key object of the failed items.
  final List<RemediationExceptionResourceKey>? failedItems;

  /// Returns a failure message for delete remediation exception. For example,
  /// Config creates an exception due to an internal error.
  final String? failureMessage;

  FailedDeleteRemediationExceptionsBatch({
    this.failedItems,
    this.failureMessage,
  });

  factory FailedDeleteRemediationExceptionsBatch.fromJson(
      Map<String, dynamic> json) {
    return FailedDeleteRemediationExceptionsBatch(
      failedItems: (json['FailedItems'] as List?)
          ?.nonNulls
          .map((e) => RemediationExceptionResourceKey.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }
}

/// List of each of the failed remediations with specific reasons.
class FailedRemediationBatch {
  /// Returns remediation configurations of the failed items.
  final List<RemediationConfiguration>? failedItems;

  /// Returns a failure message. For example, the resource is already compliant.
  final String? failureMessage;

  FailedRemediationBatch({
    this.failedItems,
    this.failureMessage,
  });

  factory FailedRemediationBatch.fromJson(Map<String, dynamic> json) {
    return FailedRemediationBatch(
      failedItems: (json['FailedItems'] as List?)
          ?.nonNulls
          .map((e) =>
              RemediationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }
}

/// List of each of the failed remediation exceptions with specific reasons.
class FailedRemediationExceptionBatch {
  /// Returns remediation exception resource key object of the failed items.
  final List<RemediationException>? failedItems;

  /// Returns a failure message. For example, the auto-remediation has failed.
  final String? failureMessage;

  FailedRemediationExceptionBatch({
    this.failedItems,
    this.failureMessage,
  });

  factory FailedRemediationExceptionBatch.fromJson(Map<String, dynamic> json) {
    return FailedRemediationExceptionBatch(
      failedItems: (json['FailedItems'] as List?)
          ?.nonNulls
          .map((e) => RemediationException.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }
}

/// Details about the fields such as name of the field.
class FieldInfo {
  /// Name of the field.
  final String? name;

  FieldInfo({
    this.name,
  });

  factory FieldInfo.fromJson(Map<String, dynamic> json) {
    return FieldInfo(
      name: json['Name'] as String?,
    );
  }
}

class GetAggregateComplianceDetailsByConfigRuleResponse {
  /// Returns an AggregateEvaluationResults object.
  final List<AggregateEvaluationResult>? aggregateEvaluationResults;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  GetAggregateComplianceDetailsByConfigRuleResponse({
    this.aggregateEvaluationResults,
    this.nextToken,
  });

  factory GetAggregateComplianceDetailsByConfigRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAggregateComplianceDetailsByConfigRuleResponse(
      aggregateEvaluationResults: (json['AggregateEvaluationResults'] as List?)
          ?.nonNulls
          .map((e) =>
              AggregateEvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetAggregateConfigRuleComplianceSummaryResponse {
  /// Returns a list of AggregateComplianceCounts object.
  final List<AggregateComplianceCount>? aggregateComplianceCounts;

  /// Groups the result based on ACCOUNT_ID or AWS_REGION.
  final String? groupByKey;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  GetAggregateConfigRuleComplianceSummaryResponse({
    this.aggregateComplianceCounts,
    this.groupByKey,
    this.nextToken,
  });

  factory GetAggregateConfigRuleComplianceSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAggregateConfigRuleComplianceSummaryResponse(
      aggregateComplianceCounts: (json['AggregateComplianceCounts'] as List?)
          ?.nonNulls
          .map((e) =>
              AggregateComplianceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKey: json['GroupByKey'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetAggregateConformancePackComplianceSummaryResponse {
  /// Returns a list of <code>AggregateConformancePackComplianceSummary</code>
  /// object.
  final List<AggregateConformancePackComplianceSummary>?
      aggregateConformancePackComplianceSummaries;

  /// Groups the result based on Amazon Web Services account ID or Amazon Web
  /// Services Region.
  final String? groupByKey;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  GetAggregateConformancePackComplianceSummaryResponse({
    this.aggregateConformancePackComplianceSummaries,
    this.groupByKey,
    this.nextToken,
  });

  factory GetAggregateConformancePackComplianceSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAggregateConformancePackComplianceSummaryResponse(
      aggregateConformancePackComplianceSummaries:
          (json['AggregateConformancePackComplianceSummaries'] as List?)
              ?.nonNulls
              .map((e) => AggregateConformancePackComplianceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      groupByKey: json['GroupByKey'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetAggregateDiscoveredResourceCountsResponse {
  /// The total number of resources that are present in an aggregator with the
  /// filters that you provide.
  final int totalDiscoveredResources;

  /// The key passed into the request object. If <code>GroupByKey</code> is not
  /// provided, the result will be empty.
  final String? groupByKey;

  /// Returns a list of GroupedResourceCount objects.
  final List<GroupedResourceCount>? groupedResourceCounts;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  GetAggregateDiscoveredResourceCountsResponse({
    required this.totalDiscoveredResources,
    this.groupByKey,
    this.groupedResourceCounts,
    this.nextToken,
  });

  factory GetAggregateDiscoveredResourceCountsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAggregateDiscoveredResourceCountsResponse(
      totalDiscoveredResources: json['TotalDiscoveredResources'] as int,
      groupByKey: json['GroupByKey'] as String?,
      groupedResourceCounts: (json['GroupedResourceCounts'] as List?)
          ?.nonNulls
          .map((e) => GroupedResourceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetAggregateResourceConfigResponse {
  /// Returns a <code>ConfigurationItem</code> object.
  final ConfigurationItem? configurationItem;

  GetAggregateResourceConfigResponse({
    this.configurationItem,
  });

  factory GetAggregateResourceConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAggregateResourceConfigResponse(
      configurationItem: json['ConfigurationItem'] != null
          ? ConfigurationItem.fromJson(
              json['ConfigurationItem'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// <p/>
class GetComplianceDetailsByConfigRuleResponse {
  /// Indicates whether the Amazon Web Services resource complies with the
  /// specified Config rule.
  final List<EvaluationResult>? evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  GetComplianceDetailsByConfigRuleResponse({
    this.evaluationResults,
    this.nextToken,
  });

  factory GetComplianceDetailsByConfigRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComplianceDetailsByConfigRuleResponse(
      evaluationResults: (json['EvaluationResults'] as List?)
          ?.nonNulls
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class GetComplianceDetailsByResourceResponse {
  /// Indicates whether the specified Amazon Web Services resource complies each
  /// Config rule.
  final List<EvaluationResult>? evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  GetComplianceDetailsByResourceResponse({
    this.evaluationResults,
    this.nextToken,
  });

  factory GetComplianceDetailsByResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComplianceDetailsByResourceResponse(
      evaluationResults: (json['EvaluationResults'] as List?)
          ?.nonNulls
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class GetComplianceSummaryByConfigRuleResponse {
  /// The number of Config rules that are compliant and the number that are
  /// noncompliant, up to a maximum of 25 for each.
  final ComplianceSummary? complianceSummary;

  GetComplianceSummaryByConfigRuleResponse({
    this.complianceSummary,
  });

  factory GetComplianceSummaryByConfigRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComplianceSummaryByConfigRuleResponse(
      complianceSummary: json['ComplianceSummary'] != null
          ? ComplianceSummary.fromJson(
              json['ComplianceSummary'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// <p/>
class GetComplianceSummaryByResourceTypeResponse {
  /// The number of resources that are compliant and the number that are
  /// noncompliant. If one or more resource types were provided with the request,
  /// the numbers are returned for each resource type. The maximum number returned
  /// is 100.
  final List<ComplianceSummaryByResourceType>?
      complianceSummariesByResourceType;

  GetComplianceSummaryByResourceTypeResponse({
    this.complianceSummariesByResourceType,
  });

  factory GetComplianceSummaryByResourceTypeResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComplianceSummaryByResourceTypeResponse(
      complianceSummariesByResourceType:
          (json['ComplianceSummariesByResourceType'] as List?)
              ?.nonNulls
              .map((e) => ComplianceSummaryByResourceType.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class GetConformancePackComplianceDetailsResponse {
  /// Name of the conformance pack.
  final String conformancePackName;

  /// Returns a list of <code>ConformancePackEvaluationResult</code> objects.
  final List<ConformancePackEvaluationResult>?
      conformancePackRuleEvaluationResults;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  GetConformancePackComplianceDetailsResponse({
    required this.conformancePackName,
    this.conformancePackRuleEvaluationResults,
    this.nextToken,
  });

  factory GetConformancePackComplianceDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConformancePackComplianceDetailsResponse(
      conformancePackName: json['ConformancePackName'] as String,
      conformancePackRuleEvaluationResults:
          (json['ConformancePackRuleEvaluationResults'] as List?)
              ?.nonNulls
              .map((e) => ConformancePackEvaluationResult.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetConformancePackComplianceSummaryResponse {
  /// A list of <code>ConformancePackComplianceSummary</code> objects.
  final List<ConformancePackComplianceSummary>?
      conformancePackComplianceSummaryList;

  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String? nextToken;

  GetConformancePackComplianceSummaryResponse({
    this.conformancePackComplianceSummaryList,
    this.nextToken,
  });

  factory GetConformancePackComplianceSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConformancePackComplianceSummaryResponse(
      conformancePackComplianceSummaryList:
          (json['ConformancePackComplianceSummaryList'] as List?)
              ?.nonNulls
              .map((e) => ConformancePackComplianceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetCustomRulePolicyResponse {
  /// The policy definition containing the logic for your Config Custom Policy
  /// rule.
  final String? policyText;

  GetCustomRulePolicyResponse({
    this.policyText,
  });

  factory GetCustomRulePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomRulePolicyResponse(
      policyText: json['PolicyText'] as String?,
    );
  }
}

class GetDiscoveredResourceCountsResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  /// The list of <code>ResourceCount</code> objects. Each object is listed in
  /// descending order by the number of resources.
  final List<ResourceCount>? resourceCounts;

  /// The total number of resources that Config is recording in the region for
  /// your account. If you specify resource types in the request, Config returns
  /// only the total number of resources for those resource types.
  /// <p class="title"> <b>Example</b>
  /// <ol>
  /// <li>
  /// Config is recording three resource types in the US East (Ohio) Region for
  /// your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a total
  /// of 60 resources.
  /// </li>
  /// <li>
  /// You make a call to the <code>GetDiscoveredResourceCounts</code> action and
  /// specify the resource type, <code>"AWS::EC2::Instances"</code>, in the
  /// request.
  /// </li>
  /// <li>
  /// Config returns 25 for <code>totalDiscoveredResources</code>.
  /// </li> </ol>
  final int? totalDiscoveredResources;

  GetDiscoveredResourceCountsResponse({
    this.nextToken,
    this.resourceCounts,
    this.totalDiscoveredResources,
  });

  factory GetDiscoveredResourceCountsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDiscoveredResourceCountsResponse(
      nextToken: json['nextToken'] as String?,
      resourceCounts: (json['resourceCounts'] as List?)
          ?.nonNulls
          .map((e) => ResourceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDiscoveredResources: json['totalDiscoveredResources'] as int?,
    );
  }
}

class GetOrganizationConfigRuleDetailedStatusResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// A list of <code>MemberAccountStatus</code> objects.
  final List<MemberAccountStatus>? organizationConfigRuleDetailedStatus;

  GetOrganizationConfigRuleDetailedStatusResponse({
    this.nextToken,
    this.organizationConfigRuleDetailedStatus,
  });

  factory GetOrganizationConfigRuleDetailedStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationConfigRuleDetailedStatusResponse(
      nextToken: json['NextToken'] as String?,
      organizationConfigRuleDetailedStatus: (json[
              'OrganizationConfigRuleDetailedStatus'] as List?)
          ?.nonNulls
          .map((e) => MemberAccountStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetOrganizationConformancePackDetailedStatusResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String? nextToken;

  /// A list of <code>OrganizationConformancePackDetailedStatus</code> objects.
  final List<OrganizationConformancePackDetailedStatus>?
      organizationConformancePackDetailedStatuses;

  GetOrganizationConformancePackDetailedStatusResponse({
    this.nextToken,
    this.organizationConformancePackDetailedStatuses,
  });

  factory GetOrganizationConformancePackDetailedStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationConformancePackDetailedStatusResponse(
      nextToken: json['NextToken'] as String?,
      organizationConformancePackDetailedStatuses:
          (json['OrganizationConformancePackDetailedStatuses'] as List?)
              ?.nonNulls
              .map((e) => OrganizationConformancePackDetailedStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class GetOrganizationCustomRulePolicyResponse {
  /// The policy definition containing the logic for your organization Config
  /// Custom Policy rule.
  final String? policyText;

  GetOrganizationCustomRulePolicyResponse({
    this.policyText,
  });

  factory GetOrganizationCustomRulePolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationCustomRulePolicyResponse(
      policyText: json['PolicyText'] as String?,
    );
  }
}

/// The output for the <a>GetResourceConfigHistory</a> action.
class GetResourceConfigHistoryResponse {
  /// A list that contains the configuration history of one or more resources.
  final List<ConfigurationItem>? configurationItems;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  GetResourceConfigHistoryResponse({
    this.configurationItems,
    this.nextToken,
  });

  factory GetResourceConfigHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceConfigHistoryResponse(
      configurationItems: (json['configurationItems'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetResourceEvaluationSummaryResponse {
  /// The compliance status of the resource evaluation summary.
  final ComplianceType? compliance;

  /// Returns an <code>EvaluationContext</code> object.
  final EvaluationContext? evaluationContext;

  /// Lists results of the mode that you requested to retrieve the resource
  /// evaluation summary. The valid values are Detective or Proactive.
  final EvaluationMode? evaluationMode;

  /// The start timestamp when Config rule starts evaluating compliance for the
  /// provided resource details.
  final DateTime? evaluationStartTimestamp;

  /// Returns an <code>EvaluationStatus</code> object.
  final EvaluationStatus? evaluationStatus;

  /// Returns a <code>ResourceDetails</code> object.
  final ResourceDetails? resourceDetails;

  /// The unique <code>ResourceEvaluationId</code> of Amazon Web Services resource
  /// execution for which you want to retrieve the evaluation summary.
  final String? resourceEvaluationId;

  GetResourceEvaluationSummaryResponse({
    this.compliance,
    this.evaluationContext,
    this.evaluationMode,
    this.evaluationStartTimestamp,
    this.evaluationStatus,
    this.resourceDetails,
    this.resourceEvaluationId,
  });

  factory GetResourceEvaluationSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceEvaluationSummaryResponse(
      compliance:
          (json['Compliance'] as String?)?.let(ComplianceType.fromString),
      evaluationContext: json['EvaluationContext'] != null
          ? EvaluationContext.fromJson(
              json['EvaluationContext'] as Map<String, dynamic>)
          : null,
      evaluationMode:
          (json['EvaluationMode'] as String?)?.let(EvaluationMode.fromString),
      evaluationStartTimestamp:
          timeStampFromJson(json['EvaluationStartTimestamp']),
      evaluationStatus: json['EvaluationStatus'] != null
          ? EvaluationStatus.fromJson(
              json['EvaluationStatus'] as Map<String, dynamic>)
          : null,
      resourceDetails: json['ResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['ResourceDetails'] as Map<String, dynamic>)
          : null,
      resourceEvaluationId: json['ResourceEvaluationId'] as String?,
    );
  }
}

class GetStoredQueryResponse {
  /// Returns a <code>StoredQuery</code> object.
  final StoredQuery? storedQuery;

  GetStoredQueryResponse({
    this.storedQuery,
  });

  factory GetStoredQueryResponse.fromJson(Map<String, dynamic> json) {
    return GetStoredQueryResponse(
      storedQuery: json['StoredQuery'] != null
          ? StoredQuery.fromJson(json['StoredQuery'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The count of resources that are grouped by the group name.
class GroupedResourceCount {
  /// The name of the group that can be region, account ID, or resource type. For
  /// example, region1, region2 if the region was chosen as
  /// <code>GroupByKey</code>.
  final String groupName;

  /// The number of resources in the group.
  final int resourceCount;

  GroupedResourceCount({
    required this.groupName,
    required this.resourceCount,
  });

  factory GroupedResourceCount.fromJson(Map<String, dynamic> json) {
    return GroupedResourceCount(
      groupName: json['GroupName'] as String,
      resourceCount: json['ResourceCount'] as int,
    );
  }
}

class ListAggregateDiscoveredResourcesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a list of <code>ResourceIdentifiers</code> objects.
  final List<AggregateResourceIdentifier>? resourceIdentifiers;

  ListAggregateDiscoveredResourcesResponse({
    this.nextToken,
    this.resourceIdentifiers,
  });

  factory ListAggregateDiscoveredResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAggregateDiscoveredResourcesResponse(
      nextToken: json['NextToken'] as String?,
      resourceIdentifiers: (json['ResourceIdentifiers'] as List?)
          ?.nonNulls
          .map((e) =>
              AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListConformancePackComplianceScoresResponse {
  /// A list of <code>ConformancePackComplianceScore</code> objects.
  final List<ConformancePackComplianceScore> conformancePackComplianceScores;

  /// The <code>nextToken</code> string that you can use to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  ListConformancePackComplianceScoresResponse({
    required this.conformancePackComplianceScores,
    this.nextToken,
  });

  factory ListConformancePackComplianceScoresResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConformancePackComplianceScoresResponse(
      conformancePackComplianceScores:
          (json['ConformancePackComplianceScores'] as List)
              .nonNulls
              .map((e) => ConformancePackComplianceScore.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// <p/>
class ListDiscoveredResourcesResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  /// The details that identify a resource that is discovered by Config, including
  /// the resource type, ID, and (if available) the custom resource name.
  final List<ResourceIdentifier>? resourceIdentifiers;

  ListDiscoveredResourcesResponse({
    this.nextToken,
    this.resourceIdentifiers,
  });

  factory ListDiscoveredResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resourceIdentifiers: (json['resourceIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListResourceEvaluationsResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// Returns a <code>ResourceEvaluations</code> object.
  final List<ResourceEvaluation>? resourceEvaluations;

  ListResourceEvaluationsResponse({
    this.nextToken,
    this.resourceEvaluations,
  });

  factory ListResourceEvaluationsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceEvaluationsResponse(
      nextToken: json['NextToken'] as String?,
      resourceEvaluations: (json['ResourceEvaluations'] as List?)
          ?.nonNulls
          .map((e) => ResourceEvaluation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListStoredQueriesResponse {
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call this action again and
  /// assign that token to the request object's <code>NextToken</code> parameter.
  /// If there are no remaining results, the previous response object's
  /// <code>NextToken</code> parameter is set to <code>null</code>.
  final String? nextToken;

  /// A list of <code>StoredQueryMetadata</code> objects.
  final List<StoredQueryMetadata>? storedQueryMetadata;

  ListStoredQueriesResponse({
    this.nextToken,
    this.storedQueryMetadata,
  });

  factory ListStoredQueriesResponse.fromJson(Map<String, dynamic> json) {
    return ListStoredQueriesResponse(
      nextToken: json['NextToken'] as String?,
      storedQueryMetadata: (json['StoredQueryMetadata'] as List?)
          ?.nonNulls
          .map((e) => StoredQueryMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  final String? nextToken;

  /// The tags for the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum MaximumExecutionFrequency {
  oneHour('One_Hour'),
  threeHours('Three_Hours'),
  sixHours('Six_Hours'),
  twelveHours('Twelve_Hours'),
  twentyFourHours('TwentyFour_Hours'),
  ;

  final String value;

  const MaximumExecutionFrequency(this.value);

  static MaximumExecutionFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum MaximumExecutionFrequency'));
}

enum MemberAccountRuleStatus {
  createSuccessful('CREATE_SUCCESSFUL'),
  createInProgress('CREATE_IN_PROGRESS'),
  createFailed('CREATE_FAILED'),
  deleteSuccessful('DELETE_SUCCESSFUL'),
  deleteFailed('DELETE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  updateSuccessful('UPDATE_SUCCESSFUL'),
  updateInProgress('UPDATE_IN_PROGRESS'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const MemberAccountRuleStatus(this.value);

  static MemberAccountRuleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum MemberAccountRuleStatus'));
}

/// Organization Config rule creation or deletion status in each member account.
/// This includes the name of the rule, the status, error code and error message
/// when the rule creation or deletion failed.
class MemberAccountStatus {
  /// The 12-digit account ID of a member account.
  final String accountId;

  /// The name of Config rule deployed in the member account.
  final String configRuleName;

  /// Indicates deployment status for Config rule in the member account. When
  /// management account calls <code>PutOrganizationConfigRule</code> action for
  /// the first time, Config rule status is created in the member account. When
  /// management account calls <code>PutOrganizationConfigRule</code> action for
  /// the second time, Config rule status is updated in the member account. Config
  /// rule status is deleted when the management account deletes
  /// <code>OrganizationConfigRule</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when Config rule has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when Config rule is being created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when Config rule creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when Config rule deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when Config rule is being deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when Config rule has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when Config rule has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when Config rule is being updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when Config rule deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final MemberAccountRuleStatus memberAccountRuleStatus;

  /// An error code that is returned when Config rule creation or deletion failed
  /// in the member account.
  final String? errorCode;

  /// An error message indicating that Config rule account creation or deletion
  /// has failed due to an error in the member account.
  final String? errorMessage;

  /// The timestamp of the last status update.
  final DateTime? lastUpdateTime;

  MemberAccountStatus({
    required this.accountId,
    required this.configRuleName,
    required this.memberAccountRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });

  factory MemberAccountStatus.fromJson(Map<String, dynamic> json) {
    return MemberAccountStatus(
      accountId: json['AccountId'] as String,
      configRuleName: json['ConfigRuleName'] as String,
      memberAccountRuleStatus: MemberAccountRuleStatus.fromString(
          (json['MemberAccountRuleStatus'] as String)),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }
}

enum MessageType {
  configurationItemChangeNotification('ConfigurationItemChangeNotification'),
  configurationSnapshotDeliveryCompleted(
      'ConfigurationSnapshotDeliveryCompleted'),
  scheduledNotification('ScheduledNotification'),
  oversizedConfigurationItemChangeNotification(
      'OversizedConfigurationItemChangeNotification'),
  ;

  final String value;

  const MessageType(this.value);

  static MessageType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum MessageType'));
}

/// This object contains regions to set up the aggregator and an IAM role to
/// retrieve organization details.
class OrganizationAggregationSource {
  /// ARN of the IAM role used to retrieve Amazon Web Services Organization
  /// details associated with the aggregator account.
  final String roleArn;

  /// If true, aggregate existing Config regions and future regions.
  final bool? allAwsRegions;

  /// The source regions being aggregated.
  final List<String>? awsRegions;

  OrganizationAggregationSource({
    required this.roleArn,
    this.allAwsRegions,
    this.awsRegions,
  });

  factory OrganizationAggregationSource.fromJson(Map<String, dynamic> json) {
    return OrganizationAggregationSource(
      roleArn: json['RoleArn'] as String,
      allAwsRegions: json['AllAwsRegions'] as bool?,
      awsRegions: (json['AwsRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final allAwsRegions = this.allAwsRegions;
    final awsRegions = this.awsRegions;
    return {
      'RoleArn': roleArn,
      if (allAwsRegions != null) 'AllAwsRegions': allAwsRegions,
      if (awsRegions != null) 'AwsRegions': awsRegions,
    };
  }
}

/// An organization Config rule that has information about Config rules that
/// Config creates in member accounts.
class OrganizationConfigRule {
  /// Amazon Resource Name (ARN) of organization Config rule.
  final String organizationConfigRuleArn;

  /// The name that you assign to organization Config rule.
  final String organizationConfigRuleName;

  /// A comma-separated list of accounts excluded from organization Config rule.
  final List<String>? excludedAccounts;

  /// The timestamp of the last update.
  final DateTime? lastUpdateTime;

  /// An object that specifies metadata for your organization's Config Custom
  /// Policy rule. The metadata includes the runtime system in use, which accounts
  /// have debug logging enabled, and other custom rule metadata, such as resource
  /// type, resource ID of Amazon Web Services resource, and organization trigger
  /// types that initiate Config to evaluate Amazon Web Services resources against
  /// a rule.
  final OrganizationCustomPolicyRuleMetadataNoPolicy?
      organizationCustomPolicyRuleMetadata;

  /// An <code>OrganizationCustomRuleMetadata</code> object.
  final OrganizationCustomRuleMetadata? organizationCustomRuleMetadata;

  /// An <code>OrganizationManagedRuleMetadata</code> object.
  final OrganizationManagedRuleMetadata? organizationManagedRuleMetadata;

  OrganizationConfigRule({
    required this.organizationConfigRuleArn,
    required this.organizationConfigRuleName,
    this.excludedAccounts,
    this.lastUpdateTime,
    this.organizationCustomPolicyRuleMetadata,
    this.organizationCustomRuleMetadata,
    this.organizationManagedRuleMetadata,
  });

  factory OrganizationConfigRule.fromJson(Map<String, dynamic> json) {
    return OrganizationConfigRule(
      organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String,
      organizationConfigRuleName: json['OrganizationConfigRuleName'] as String,
      excludedAccounts: (json['ExcludedAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      organizationCustomPolicyRuleMetadata:
          json['OrganizationCustomPolicyRuleMetadata'] != null
              ? OrganizationCustomPolicyRuleMetadataNoPolicy.fromJson(
                  json['OrganizationCustomPolicyRuleMetadata']
                      as Map<String, dynamic>)
              : null,
      organizationCustomRuleMetadata: json['OrganizationCustomRuleMetadata'] !=
              null
          ? OrganizationCustomRuleMetadata.fromJson(
              json['OrganizationCustomRuleMetadata'] as Map<String, dynamic>)
          : null,
      organizationManagedRuleMetadata:
          json['OrganizationManagedRuleMetadata'] != null
              ? OrganizationManagedRuleMetadata.fromJson(
                  json['OrganizationManagedRuleMetadata']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

/// Returns the status for an organization Config rule in an organization.
class OrganizationConfigRuleStatus {
  /// The name that you assign to organization Config rule.
  final String organizationConfigRuleName;

  /// Indicates deployment status of an organization Config rule. When management
  /// account calls PutOrganizationConfigRule action for the first time, Config
  /// rule status is created in all the member accounts. When management account
  /// calls PutOrganizationConfigRule action for the second time, Config rule
  /// status is updated in all the member accounts. Additionally, Config rule
  /// status is updated when one or more member accounts join or leave an
  /// organization. Config rule status is deleted when the management account
  /// deletes OrganizationConfigRule in all the member accounts and disables
  /// service access for <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when an organization Config rule has been
  /// successfully created in all the member accounts.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when an organization Config rule creation is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when an organization Config rule creation failed
  /// in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when an organization Config rule deletion failed
  /// in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when an organization Config rule deletion is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when an organization Config rule has been
  /// successfully deleted from all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when an organization Config rule has been
  /// successfully updated in all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when an organization Config rule update is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when an organization Config rule update failed in
  /// one or more member accounts within that organization.
  /// </li>
  /// </ul>
  final OrganizationRuleStatus organizationRuleStatus;

  /// An error code that is returned when organization Config rule creation or
  /// deletion has failed.
  final String? errorCode;

  /// An error message indicating that organization Config rule creation or
  /// deletion failed due to an error.
  final String? errorMessage;

  /// The timestamp of the last update.
  final DateTime? lastUpdateTime;

  OrganizationConfigRuleStatus({
    required this.organizationConfigRuleName,
    required this.organizationRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });

  factory OrganizationConfigRuleStatus.fromJson(Map<String, dynamic> json) {
    return OrganizationConfigRuleStatus(
      organizationConfigRuleName: json['OrganizationConfigRuleName'] as String,
      organizationRuleStatus: OrganizationRuleStatus.fromString(
          (json['OrganizationRuleStatus'] as String)),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }
}

enum OrganizationConfigRuleTriggerType {
  configurationItemChangeNotification('ConfigurationItemChangeNotification'),
  oversizedConfigurationItemChangeNotification(
      'OversizedConfigurationItemChangeNotification'),
  scheduledNotification('ScheduledNotification'),
  ;

  final String value;

  const OrganizationConfigRuleTriggerType(this.value);

  static OrganizationConfigRuleTriggerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationConfigRuleTriggerType'));
}

enum OrganizationConfigRuleTriggerTypeNoSN {
  configurationItemChangeNotification('ConfigurationItemChangeNotification'),
  oversizedConfigurationItemChangeNotification(
      'OversizedConfigurationItemChangeNotification'),
  ;

  final String value;

  const OrganizationConfigRuleTriggerTypeNoSN(this.value);

  static OrganizationConfigRuleTriggerTypeNoSN fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationConfigRuleTriggerTypeNoSN'));
}

/// An organization conformance pack that has information about conformance
/// packs that Config creates in member accounts.
class OrganizationConformancePack {
  /// Last time when organization conformation pack was updated.
  final DateTime lastUpdateTime;

  /// Amazon Resource Name (ARN) of organization conformance pack.
  final String organizationConformancePackArn;

  /// The name you assign to an organization conformance pack.
  final String organizationConformancePackName;

  /// A list of <code>ConformancePackInputParameter</code> objects.
  final List<ConformancePackInputParameter>? conformancePackInputParameters;

  /// The name of the Amazon S3 bucket where Config stores conformance pack
  /// templates.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3Bucket;

  /// Any folder structure you want to add to an Amazon S3 bucket.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3KeyPrefix;

  /// A comma-separated list of accounts excluded from organization conformance
  /// pack.
  final List<String>? excludedAccounts;

  OrganizationConformancePack({
    required this.lastUpdateTime,
    required this.organizationConformancePackArn,
    required this.organizationConformancePackName,
    this.conformancePackInputParameters,
    this.deliveryS3Bucket,
    this.deliveryS3KeyPrefix,
    this.excludedAccounts,
  });

  factory OrganizationConformancePack.fromJson(Map<String, dynamic> json) {
    return OrganizationConformancePack(
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      organizationConformancePackArn:
          json['OrganizationConformancePackArn'] as String,
      organizationConformancePackName:
          json['OrganizationConformancePackName'] as String,
      conformancePackInputParameters: (json['ConformancePackInputParameters']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryS3Bucket: json['DeliveryS3Bucket'] as String?,
      deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String?,
      excludedAccounts: (json['ExcludedAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// Organization conformance pack creation or deletion status in each member
/// account. This includes the name of the conformance pack, the status, error
/// code and error message when the conformance pack creation or deletion
/// failed.
class OrganizationConformancePackDetailedStatus {
  /// The 12-digit account ID of a member account.
  final String accountId;

  /// The name of conformance pack deployed in the member account.
  final String conformancePackName;

  /// Indicates deployment status for conformance pack in a member account. When
  /// management account calls <code>PutOrganizationConformancePack</code> action
  /// for the first time, conformance pack status is created in the member
  /// account. When management account calls
  /// <code>PutOrganizationConformancePack</code> action for the second time,
  /// conformance pack status is updated in the member account. Conformance pack
  /// status is deleted when the management account deletes
  /// <code>OrganizationConformancePack</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the conformance pack to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when conformance pack has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when conformance pack is being created in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when conformance pack creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when conformance pack deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when conformance pack is being deleted in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when conformance pack has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when conformance pack has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when conformance pack is being updated in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when conformance pack deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final OrganizationResourceDetailedStatus status;

  /// An error code that is returned when conformance pack creation or deletion
  /// failed in the member account.
  final String? errorCode;

  /// An error message indicating that conformance pack account creation or
  /// deletion has failed due to an error in the member account.
  final String? errorMessage;

  /// The timestamp of the last status update.
  final DateTime? lastUpdateTime;

  OrganizationConformancePackDetailedStatus({
    required this.accountId,
    required this.conformancePackName,
    required this.status,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });

  factory OrganizationConformancePackDetailedStatus.fromJson(
      Map<String, dynamic> json) {
    return OrganizationConformancePackDetailedStatus(
      accountId: json['AccountId'] as String,
      conformancePackName: json['ConformancePackName'] as String,
      status: OrganizationResourceDetailedStatus.fromString(
          (json['Status'] as String)),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }
}

/// Returns the status for an organization conformance pack in an organization.
class OrganizationConformancePackStatus {
  /// The name that you assign to organization conformance pack.
  final String organizationConformancePackName;

  /// Indicates deployment status of an organization conformance pack. When
  /// management account calls PutOrganizationConformancePack for the first time,
  /// conformance pack status is created in all the member accounts. When
  /// management account calls PutOrganizationConformancePack for the second time,
  /// conformance pack status is updated in all the member accounts. Additionally,
  /// conformance pack status is updated when one or more member accounts join or
  /// leave an organization. Conformance pack status is deleted when the
  /// management account deletes OrganizationConformancePack in all the member
  /// accounts and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the conformance pack to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when an organization conformance pack has
  /// been successfully created in all the member accounts.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when an organization conformance pack
  /// creation is in progress.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when an organization conformance pack creation
  /// failed in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when an organization conformance pack deletion
  /// failed in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when an organization conformance pack
  /// deletion is in progress.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when an organization conformance pack has
  /// been successfully deleted from all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when an organization conformance pack has
  /// been successfully updated in all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when an organization conformance pack update
  /// is in progress.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when an organization conformance pack update
  /// failed in one or more member accounts within that organization.
  /// </li>
  /// </ul>
  final OrganizationResourceStatus status;

  /// An error code that is returned when organization conformance pack creation
  /// or deletion has failed in a member account.
  final String? errorCode;

  /// An error message indicating that organization conformance pack creation or
  /// deletion failed due to an error.
  final String? errorMessage;

  /// The timestamp of the last update.
  final DateTime? lastUpdateTime;

  OrganizationConformancePackStatus({
    required this.organizationConformancePackName,
    required this.status,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });

  factory OrganizationConformancePackStatus.fromJson(
      Map<String, dynamic> json) {
    return OrganizationConformancePackStatus(
      organizationConformancePackName:
          json['OrganizationConformancePackName'] as String,
      status: OrganizationResourceStatus.fromString((json['Status'] as String)),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }
}

/// An object that specifies metadata for your organization's Config Custom
/// Policy rule. The metadata includes the runtime system in use, which accounts
/// have debug logging enabled, and other custom rule metadata, such as resource
/// type, resource ID of Amazon Web Services resource, and organization trigger
/// types that initiate Config to evaluate Amazon Web Services resources against
/// a rule.
class OrganizationCustomPolicyRuleMetadata {
  /// The runtime system for your organization Config Custom Policy rules. Guard
  /// is a policy-as-code language that allows you to write policies that are
  /// enforced by Config Custom Policy rules. For more information about Guard,
  /// see the <a
  /// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
  /// GitHub Repository</a>.
  final String policyRuntime;

  /// The policy definition containing the logic for your organization Config
  /// Custom Policy rule.
  final String policyText;

  /// A list of accounts that you can enable debug logging for your organization
  /// Config Custom Policy rule. List is null when debug logging is enabled for
  /// all accounts.
  final List<String>? debugLogDeliveryAccounts;

  /// The description that you provide for your organization Config Custom Policy
  /// rule.
  final String? description;

  /// A string, in JSON format, that is passed to your organization Config Custom
  /// Policy rule.
  final String? inputParameters;

  /// The maximum frequency with which Config runs evaluations for a rule. Your
  /// Config Custom Policy rule is triggered when Config delivers the
  /// configuration snapshot. For more information, see
  /// <a>ConfigSnapshotDeliveryProperties</a>.
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The type of notification that initiates Config to run an evaluation for a
  /// rule. For Config Custom Policy rules, Config supports change-initiated
  /// notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Initiates an evaluation
  /// when Config delivers a configuration item as a result of a resource change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Initiates an
  /// evaluation when Config delivers an oversized configuration item. Config may
  /// generate this notification type when a resource changes and the notification
  /// exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// </ul>
  final List<OrganizationConfigRuleTriggerTypeNoSN>?
      organizationConfigRuleTriggerTypes;

  /// The ID of the Amazon Web Services resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the Amazon Web Services resource that was evaluated.
  final List<String>? resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  final String? tagValueScope;

  OrganizationCustomPolicyRuleMetadata({
    required this.policyRuntime,
    required this.policyText,
    this.debugLogDeliveryAccounts,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.organizationConfigRuleTriggerTypes,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });

  Map<String, dynamic> toJson() {
    final policyRuntime = this.policyRuntime;
    final policyText = this.policyText;
    final debugLogDeliveryAccounts = this.debugLogDeliveryAccounts;
    final description = this.description;
    final inputParameters = this.inputParameters;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final organizationConfigRuleTriggerTypes =
        this.organizationConfigRuleTriggerTypes;
    final resourceIdScope = this.resourceIdScope;
    final resourceTypesScope = this.resourceTypesScope;
    final tagKeyScope = this.tagKeyScope;
    final tagValueScope = this.tagValueScope;
    return {
      'PolicyRuntime': policyRuntime,
      'PolicyText': policyText,
      if (debugLogDeliveryAccounts != null)
        'DebugLogDeliveryAccounts': debugLogDeliveryAccounts,
      if (description != null) 'Description': description,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.value,
      if (organizationConfigRuleTriggerTypes != null)
        'OrganizationConfigRuleTriggerTypes':
            organizationConfigRuleTriggerTypes.map((e) => e.value).toList(),
      if (resourceIdScope != null) 'ResourceIdScope': resourceIdScope,
      if (resourceTypesScope != null) 'ResourceTypesScope': resourceTypesScope,
      if (tagKeyScope != null) 'TagKeyScope': tagKeyScope,
      if (tagValueScope != null) 'TagValueScope': tagValueScope,
    };
  }
}

/// metadata for your organization Config Custom Policy rule including the
/// runtime system in use, which accounts have debug logging enabled, and other
/// custom rule metadata such as resource type, resource ID of Amazon Web
/// Services resource, and organization trigger types that trigger Config to
/// evaluate Amazon Web Services resources against a rule.
class OrganizationCustomPolicyRuleMetadataNoPolicy {
  /// A list of accounts that you can enable debug logging for your organization
  /// Config Custom Policy rule. List is null when debug logging is enabled for
  /// all accounts.
  final List<String>? debugLogDeliveryAccounts;

  /// The description that you provide for your organization Config Custom Policy
  /// rule.
  final String? description;

  /// A string, in JSON format, that is passed to your organization Config Custom
  /// Policy rule.
  final String? inputParameters;

  /// The maximum frequency with which Config runs evaluations for a rule. Your
  /// Config Custom Policy rule is triggered when Config delivers the
  /// configuration snapshot. For more information, see
  /// <a>ConfigSnapshotDeliveryProperties</a>.
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The type of notification that triggers Config to run an evaluation for a
  /// rule. For Config Custom Policy rules, Config supports change triggered
  /// notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Triggers an evaluation
  /// when Config delivers a configuration item as a result of a resource change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Triggers an
  /// evaluation when Config delivers an oversized configuration item. Config may
  /// generate this notification type when a resource changes and the notification
  /// exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// </ul>
  final List<OrganizationConfigRuleTriggerTypeNoSN>?
      organizationConfigRuleTriggerTypes;

  /// The runtime system for your organization Config Custom Policy rules. Guard
  /// is a policy-as-code language that allows you to write policies that are
  /// enforced by Config Custom Policy rules. For more information about Guard,
  /// see the <a
  /// href="https://github.com/aws-cloudformation/cloudformation-guard">Guard
  /// GitHub Repository</a>.
  final String? policyRuntime;

  /// The ID of the Amazon Web Services resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the Amazon Web Services resource that was evaluated.
  final List<String>? resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  final String? tagValueScope;

  OrganizationCustomPolicyRuleMetadataNoPolicy({
    this.debugLogDeliveryAccounts,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.organizationConfigRuleTriggerTypes,
    this.policyRuntime,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });

  factory OrganizationCustomPolicyRuleMetadataNoPolicy.fromJson(
      Map<String, dynamic> json) {
    return OrganizationCustomPolicyRuleMetadataNoPolicy(
      debugLogDeliveryAccounts: (json['DebugLogDeliveryAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['Description'] as String?,
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
      organizationConfigRuleTriggerTypes:
          (json['OrganizationConfigRuleTriggerTypes'] as List?)
              ?.nonNulls
              .map((e) => OrganizationConfigRuleTriggerTypeNoSN.fromString(
                  (e as String)))
              .toList(),
      policyRuntime: json['PolicyRuntime'] as String?,
      resourceIdScope: json['ResourceIdScope'] as String?,
      resourceTypesScope: (json['ResourceTypesScope'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tagKeyScope: json['TagKeyScope'] as String?,
      tagValueScope: json['TagValueScope'] as String?,
    );
  }
}

/// An object that specifies organization custom rule metadata such as resource
/// type, resource ID of Amazon Web Services resource, Lambda function ARN, and
/// organization trigger types that trigger Config to evaluate your Amazon Web
/// Services resources against a rule. It also provides the frequency with which
/// you want Config to run evaluations for the rule if the trigger type is
/// periodic.
class OrganizationCustomRuleMetadata {
  /// The lambda function ARN.
  final String lambdaFunctionArn;

  /// The type of notification that triggers Config to run an evaluation for a
  /// rule. You can specify the following notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Triggers an evaluation
  /// when Config delivers a configuration item as a result of a resource change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Triggers an
  /// evaluation when Config delivers an oversized configuration item. Config may
  /// generate this notification type when a resource changes and the notification
  /// exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// <li>
  /// <code>ScheduledNotification</code> - Triggers a periodic evaluation at the
  /// frequency specified for <code>MaximumExecutionFrequency</code>.
  /// </li>
  /// </ul>
  final List<OrganizationConfigRuleTriggerType>
      organizationConfigRuleTriggerTypes;

  /// The description that you provide for your organization Config rule.
  final String? description;

  /// A string, in JSON format, that is passed to your organization Config rule
  /// Lambda function.
  final String? inputParameters;

  /// The maximum frequency with which Config runs evaluations for a rule. Your
  /// custom rule is triggered when Config delivers the configuration snapshot.
  /// For more information, see <a>ConfigSnapshotDeliveryProperties</a>.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The ID of the Amazon Web Services resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the Amazon Web Services resource that was evaluated.
  final List<String>? resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  final String? tagValueScope;

  OrganizationCustomRuleMetadata({
    required this.lambdaFunctionArn,
    required this.organizationConfigRuleTriggerTypes,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });

  factory OrganizationCustomRuleMetadata.fromJson(Map<String, dynamic> json) {
    return OrganizationCustomRuleMetadata(
      lambdaFunctionArn: json['LambdaFunctionArn'] as String,
      organizationConfigRuleTriggerTypes:
          (json['OrganizationConfigRuleTriggerTypes'] as List)
              .nonNulls
              .map((e) =>
                  OrganizationConfigRuleTriggerType.fromString((e as String)))
              .toList(),
      description: json['Description'] as String?,
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
      resourceIdScope: json['ResourceIdScope'] as String?,
      resourceTypesScope: (json['ResourceTypesScope'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tagKeyScope: json['TagKeyScope'] as String?,
      tagValueScope: json['TagValueScope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaFunctionArn = this.lambdaFunctionArn;
    final organizationConfigRuleTriggerTypes =
        this.organizationConfigRuleTriggerTypes;
    final description = this.description;
    final inputParameters = this.inputParameters;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final resourceIdScope = this.resourceIdScope;
    final resourceTypesScope = this.resourceTypesScope;
    final tagKeyScope = this.tagKeyScope;
    final tagValueScope = this.tagValueScope;
    return {
      'LambdaFunctionArn': lambdaFunctionArn,
      'OrganizationConfigRuleTriggerTypes':
          organizationConfigRuleTriggerTypes.map((e) => e.value).toList(),
      if (description != null) 'Description': description,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.value,
      if (resourceIdScope != null) 'ResourceIdScope': resourceIdScope,
      if (resourceTypesScope != null) 'ResourceTypesScope': resourceTypesScope,
      if (tagKeyScope != null) 'TagKeyScope': tagKeyScope,
      if (tagValueScope != null) 'TagValueScope': tagValueScope,
    };
  }
}

/// An object that specifies organization managed rule metadata such as resource
/// type and ID of Amazon Web Services resource along with the rule identifier.
/// It also provides the frequency with which you want Config to run evaluations
/// for the rule if the trigger type is periodic.
class OrganizationManagedRuleMetadata {
  /// For organization config managed rules, a predefined identifier from a list.
  /// For example, <code>IAM_PASSWORD_POLICY</code> is a managed rule. To
  /// reference a managed rule, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">Using
  /// Config managed rules</a>.
  final String ruleIdentifier;

  /// The description that you provide for your organization Config rule.
  final String? description;

  /// A string, in JSON format, that is passed to your organization Config rule
  /// Lambda function.
  final String? inputParameters;

  /// The maximum frequency with which Config runs evaluations for a rule. This is
  /// for an Config managed rule that is triggered at a periodic frequency.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The ID of the Amazon Web Services resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the Amazon Web Services resource that was evaluated.
  final List<String>? resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  final String? tagValueScope;

  OrganizationManagedRuleMetadata({
    required this.ruleIdentifier,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });

  factory OrganizationManagedRuleMetadata.fromJson(Map<String, dynamic> json) {
    return OrganizationManagedRuleMetadata(
      ruleIdentifier: json['RuleIdentifier'] as String,
      description: json['Description'] as String?,
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
      resourceIdScope: json['ResourceIdScope'] as String?,
      resourceTypesScope: (json['ResourceTypesScope'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tagKeyScope: json['TagKeyScope'] as String?,
      tagValueScope: json['TagValueScope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleIdentifier = this.ruleIdentifier;
    final description = this.description;
    final inputParameters = this.inputParameters;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final resourceIdScope = this.resourceIdScope;
    final resourceTypesScope = this.resourceTypesScope;
    final tagKeyScope = this.tagKeyScope;
    final tagValueScope = this.tagValueScope;
    return {
      'RuleIdentifier': ruleIdentifier,
      if (description != null) 'Description': description,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.value,
      if (resourceIdScope != null) 'ResourceIdScope': resourceIdScope,
      if (resourceTypesScope != null) 'ResourceTypesScope': resourceTypesScope,
      if (tagKeyScope != null) 'TagKeyScope': tagKeyScope,
      if (tagValueScope != null) 'TagValueScope': tagValueScope,
    };
  }
}

enum OrganizationResourceDetailedStatus {
  createSuccessful('CREATE_SUCCESSFUL'),
  createInProgress('CREATE_IN_PROGRESS'),
  createFailed('CREATE_FAILED'),
  deleteSuccessful('DELETE_SUCCESSFUL'),
  deleteFailed('DELETE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  updateSuccessful('UPDATE_SUCCESSFUL'),
  updateInProgress('UPDATE_IN_PROGRESS'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const OrganizationResourceDetailedStatus(this.value);

  static OrganizationResourceDetailedStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationResourceDetailedStatus'));
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization conformance pack.
class OrganizationResourceDetailedStatusFilters {
  /// The 12-digit account ID of the member account within an organization.
  final String? accountId;

  /// Indicates deployment status for conformance pack in a member account. When
  /// management account calls <code>PutOrganizationConformancePack</code> action
  /// for the first time, conformance pack status is created in the member
  /// account. When management account calls
  /// <code>PutOrganizationConformancePack</code> action for the second time,
  /// conformance pack status is updated in the member account. Conformance pack
  /// status is deleted when the management account deletes
  /// <code>OrganizationConformancePack</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the conformance pack to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when conformance pack has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when conformance pack is being created in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when conformance pack creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when conformance pack deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when conformance pack is being deleted in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when conformance pack has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when conformance pack has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when conformance pack is being updated in
  /// the member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when conformance pack deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final OrganizationResourceDetailedStatus? status;

  OrganizationResourceDetailedStatusFilters({
    this.accountId,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (status != null) 'Status': status.value,
    };
  }
}

enum OrganizationResourceStatus {
  createSuccessful('CREATE_SUCCESSFUL'),
  createInProgress('CREATE_IN_PROGRESS'),
  createFailed('CREATE_FAILED'),
  deleteSuccessful('DELETE_SUCCESSFUL'),
  deleteFailed('DELETE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  updateSuccessful('UPDATE_SUCCESSFUL'),
  updateInProgress('UPDATE_IN_PROGRESS'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const OrganizationResourceStatus(this.value);

  static OrganizationResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationResourceStatus'));
}

enum OrganizationRuleStatus {
  createSuccessful('CREATE_SUCCESSFUL'),
  createInProgress('CREATE_IN_PROGRESS'),
  createFailed('CREATE_FAILED'),
  deleteSuccessful('DELETE_SUCCESSFUL'),
  deleteFailed('DELETE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  updateSuccessful('UPDATE_SUCCESSFUL'),
  updateInProgress('UPDATE_IN_PROGRESS'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const OrganizationRuleStatus(this.value);

  static OrganizationRuleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationRuleStatus'));
}

enum Owner {
  customLambda('CUSTOM_LAMBDA'),
  aws('AWS'),
  customPolicy('CUSTOM_POLICY'),
  ;

  final String value;

  const Owner(this.value);

  static Owner fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Owner'));
}

/// An object that represents the account ID and region of an aggregator account
/// that is requesting authorization but is not yet authorized.
class PendingAggregationRequest {
  /// The 12-digit account ID of the account requesting to aggregate data.
  final String? requesterAccountId;

  /// The region requesting to aggregate data.
  final String? requesterAwsRegion;

  PendingAggregationRequest({
    this.requesterAccountId,
    this.requesterAwsRegion,
  });

  factory PendingAggregationRequest.fromJson(Map<String, dynamic> json) {
    return PendingAggregationRequest(
      requesterAccountId: json['RequesterAccountId'] as String?,
      requesterAwsRegion: json['RequesterAwsRegion'] as String?,
    );
  }
}

class PutAggregationAuthorizationResponse {
  /// Returns an AggregationAuthorization object.
  final AggregationAuthorization? aggregationAuthorization;

  PutAggregationAuthorizationResponse({
    this.aggregationAuthorization,
  });

  factory PutAggregationAuthorizationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAggregationAuthorizationResponse(
      aggregationAuthorization: json['AggregationAuthorization'] != null
          ? AggregationAuthorization.fromJson(
              json['AggregationAuthorization'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutConfigurationAggregatorResponse {
  /// Returns a ConfigurationAggregator object.
  final ConfigurationAggregator? configurationAggregator;

  PutConfigurationAggregatorResponse({
    this.configurationAggregator,
  });

  factory PutConfigurationAggregatorResponse.fromJson(
      Map<String, dynamic> json) {
    return PutConfigurationAggregatorResponse(
      configurationAggregator: json['ConfigurationAggregator'] != null
          ? ConfigurationAggregator.fromJson(
              json['ConfigurationAggregator'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutConformancePackResponse {
  /// ARN of the conformance pack.
  final String? conformancePackArn;

  PutConformancePackResponse({
    this.conformancePackArn,
  });

  factory PutConformancePackResponse.fromJson(Map<String, dynamic> json) {
    return PutConformancePackResponse(
      conformancePackArn: json['ConformancePackArn'] as String?,
    );
  }
}

/// <p/>
class PutEvaluationsResponse {
  /// Requests that failed because of a client or server error.
  final List<Evaluation>? failedEvaluations;

  PutEvaluationsResponse({
    this.failedEvaluations,
  });

  factory PutEvaluationsResponse.fromJson(Map<String, dynamic> json) {
    return PutEvaluationsResponse(
      failedEvaluations: (json['FailedEvaluations'] as List?)
          ?.nonNulls
          .map((e) => Evaluation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PutExternalEvaluationResponse {
  PutExternalEvaluationResponse();

  factory PutExternalEvaluationResponse.fromJson(Map<String, dynamic> _) {
    return PutExternalEvaluationResponse();
  }
}

class PutOrganizationConfigRuleResponse {
  /// The Amazon Resource Name (ARN) of an organization Config rule.
  final String? organizationConfigRuleArn;

  PutOrganizationConfigRuleResponse({
    this.organizationConfigRuleArn,
  });

  factory PutOrganizationConfigRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return PutOrganizationConfigRuleResponse(
      organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String?,
    );
  }
}

class PutOrganizationConformancePackResponse {
  /// ARN of the organization conformance pack.
  final String? organizationConformancePackArn;

  PutOrganizationConformancePackResponse({
    this.organizationConformancePackArn,
  });

  factory PutOrganizationConformancePackResponse.fromJson(
      Map<String, dynamic> json) {
    return PutOrganizationConformancePackResponse(
      organizationConformancePackArn:
          json['OrganizationConformancePackArn'] as String?,
    );
  }
}

class PutRemediationConfigurationsResponse {
  /// Returns a list of failed remediation batch objects.
  final List<FailedRemediationBatch>? failedBatches;

  PutRemediationConfigurationsResponse({
    this.failedBatches,
  });

  factory PutRemediationConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutRemediationConfigurationsResponse(
      failedBatches: (json['FailedBatches'] as List?)
          ?.nonNulls
          .map(
              (e) => FailedRemediationBatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PutRemediationExceptionsResponse {
  /// Returns a list of failed remediation exceptions batch objects. Each object
  /// in the batch consists of a list of failed items and failure messages.
  final List<FailedRemediationExceptionBatch>? failedBatches;

  PutRemediationExceptionsResponse({
    this.failedBatches,
  });

  factory PutRemediationExceptionsResponse.fromJson(Map<String, dynamic> json) {
    return PutRemediationExceptionsResponse(
      failedBatches: (json['FailedBatches'] as List?)
          ?.nonNulls
          .map((e) => FailedRemediationExceptionBatch.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PutRetentionConfigurationResponse {
  /// Returns a retention configuration object.
  final RetentionConfiguration? retentionConfiguration;

  PutRetentionConfigurationResponse({
    this.retentionConfiguration,
  });

  factory PutRetentionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutRetentionConfigurationResponse(
      retentionConfiguration: json['RetentionConfiguration'] != null
          ? RetentionConfiguration.fromJson(
              json['RetentionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutStoredQueryResponse {
  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
  final String? queryArn;

  PutStoredQueryResponse({
    this.queryArn,
  });

  factory PutStoredQueryResponse.fromJson(Map<String, dynamic> json) {
    return PutStoredQueryResponse(
      queryArn: json['QueryArn'] as String?,
    );
  }
}

/// Details about the query.
class QueryInfo {
  /// Returns a <code>FieldInfo</code> object.
  final List<FieldInfo>? selectFields;

  QueryInfo({
    this.selectFields,
  });

  factory QueryInfo.fromJson(Map<String, dynamic> json) {
    return QueryInfo(
      selectFields: (json['SelectFields'] as List?)
          ?.nonNulls
          .map((e) => FieldInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum RecorderStatus {
  pending('Pending'),
  success('Success'),
  failure('Failure'),
  ;

  final String value;

  const RecorderStatus(this.value);

  static RecorderStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RecorderStatus'));
}

enum RecordingFrequency {
  continuous('CONTINUOUS'),
  daily('DAILY'),
  ;

  final String value;

  const RecordingFrequency(this.value);

  static RecordingFrequency fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecordingFrequency'));
}

/// Specifies which resource types Config records for configuration changes. By
/// default, Config records configuration changes for all current and future
/// supported resource types in the Amazon Web Services Region where you have
/// enabled Config, excluding the global IAM resource types: IAM users, groups,
/// roles, and customer managed policies.
///
/// In the recording group, you specify whether you want to record all supported
/// current and future supported resource types or to include or exclude
/// specific resources types. For a list of supported resource types, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
/// Resource Types</a> in the <i>Config developer guide</i>.
///
/// If you don't want Config to record all current and future supported resource
/// types (excluding the global IAM resource types), use one of the following
/// recording strategies:
/// <ol>
/// <li>
/// <b>Record all current and future resource types with exclusions</b>
/// (<code>EXCLUSION_BY_RESOURCE_TYPES</code>), or
/// </li>
/// <li>
/// <b>Record specific resource types</b>
/// (<code>INCLUSION_BY_RESOURCE_TYPES</code>).
/// </li> </ol>
/// If you use the recording strategy to <b>Record all current and future
/// resource types</b> (<code>ALL_SUPPORTED_RESOURCE_TYPES</code>), you can use
/// the flag <code>includeGlobalResourceTypes</code> to include the global IAM
/// resource types in your recording.
/// <important>
/// <b>Aurora global clusters are recorded in all enabled Regions</b>
///
/// The <code>AWS::RDS::GlobalCluster</code> resource type will be recorded in
/// all supported Config Regions where the configuration recorder is enabled.
///
/// If you do not want to record <code>AWS::RDS::GlobalCluster</code> in all
/// enabled Regions, use the <code>EXCLUSION_BY_RESOURCE_TYPES</code> or
/// <code>INCLUSION_BY_RESOURCE_TYPES</code> recording strategy.
/// </important>
class RecordingGroup {
  /// Specifies whether Config records configuration changes for all supported
  /// resource types, excluding the global IAM resource types.
  ///
  /// If you set this field to <code>true</code>, when Config adds support for a
  /// new resource type, Config starts recording resources of that type
  /// automatically.
  ///
  /// If you set this field to <code>true</code>, you cannot enumerate specific
  /// resource types to record in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>,
  /// or to exclude in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html">ExclusionByResourceTypes</a>.
  /// <note>
  /// <b>Region availability</b>
  ///
  /// Check <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html">Resource
  /// Coverage by Region Availability</a> to see if a resource type is supported
  /// in the Amazon Web Services Region where you set up Config.
  /// </note>
  final bool? allSupported;

  /// An object that specifies how Config excludes resource types from being
  /// recorded by the configuration recorder.
  /// <note>
  /// <b>Required fields</b>
  ///
  /// To use this option, you must set the <code>useOnly</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>EXCLUSION_BY_RESOURCE_TYPES</code>.
  /// </note>
  final ExclusionByResourceTypes? exclusionByResourceTypes;

  /// This option is a bundle which only applies to the global IAM resource types:
  /// IAM users, groups, roles, and customer managed policies. These global IAM
  /// resource types can only be recorded by Config in Regions where Config was
  /// available before February 2022. You cannot be record the global IAM resouce
  /// types in Regions supported by Config after February 2022. This list where
  /// you cannot record the global IAM resource types includes the following
  /// Regions:
  ///
  /// <ul>
  /// <li>
  /// Asia Pacific (Hyderabad)
  /// </li>
  /// <li>
  /// Asia Pacific (Melbourne)
  /// </li>
  /// <li>
  /// Canada West (Calgary)
  /// </li>
  /// <li>
  /// Europe (Spain)
  /// </li>
  /// <li>
  /// Europe (Zurich)
  /// </li>
  /// <li>
  /// Israel (Tel Aviv)
  /// </li>
  /// <li>
  /// Middle East (UAE)
  /// </li>
  /// </ul> <important>
  /// <b>Aurora global clusters are recorded in all enabled Regions</b>
  ///
  /// The <code>AWS::RDS::GlobalCluster</code> resource type will be recorded in
  /// all supported Config Regions where the configuration recorder is enabled,
  /// even if <code>includeGlobalResourceTypes</code> is set<code>false</code>.
  /// The <code>includeGlobalResourceTypes</code> option is a bundle which only
  /// applies to IAM users, groups, roles, and customer managed policies.
  ///
  /// If you do not want to record <code>AWS::RDS::GlobalCluster</code> in all
  /// enabled Regions, use one of the following recording strategies:
  /// <ol>
  /// <li>
  /// <b>Record all current and future resource types with exclusions</b>
  /// (<code>EXCLUSION_BY_RESOURCE_TYPES</code>), or
  /// </li>
  /// <li>
  /// <b>Record specific resource types</b>
  /// (<code>INCLUSION_BY_RESOURCE_TYPES</code>).
  /// </li> </ol>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all">Selecting
  /// Which Resources are Recorded</a> in the <i>Config developer guide</i>.
  /// </important> <important>
  /// <b>includeGlobalResourceTypes and the exclusion recording strategy</b>
  ///
  /// The <code>includeGlobalResourceTypes</code> field has no impact on the
  /// <code>EXCLUSION_BY_RESOURCE_TYPES</code> recording strategy. This means that
  /// the global IAM resource types (IAM users, groups, roles, and customer
  /// managed policies) will not be automatically added as exclusions for
  /// <code>exclusionByResourceTypes</code> when
  /// <code>includeGlobalResourceTypes</code> is set to <code>false</code>.
  ///
  /// The <code>includeGlobalResourceTypes</code> field should only be used to
  /// modify the <code>AllSupported</code> field, as the default for the
  /// <code>AllSupported</code> field is to record configuration changes for all
  /// supported resource types excluding the global IAM resource types. To include
  /// the global IAM resource types when <code>AllSupported</code> is set to
  /// <code>true</code>, make sure to set <code>includeGlobalResourceTypes</code>
  /// to <code>true</code>.
  ///
  /// To exclude the global IAM resource types for the
  /// <code>EXCLUSION_BY_RESOURCE_TYPES</code> recording strategy, you need to
  /// manually add them to the <code>resourceTypes</code> field of
  /// <code>exclusionByResourceTypes</code>.
  /// </important> <note>
  /// <b>Required and optional fields</b>
  ///
  /// Before you set this field to <code>true</code>, set the
  /// <code>allSupported</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>. Optionally, you can set the <code>useOnly</code> field
  /// of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>ALL_SUPPORTED_RESOURCE_TYPES</code>.
  /// </note> <note>
  /// <b>Overriding fields</b>
  ///
  /// If you set this field to <code>false</code> but list global IAM resource
  /// types in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>,
  /// Config will still record configuration changes for those specified resource
  /// types <i>regardless</i> of if you set the
  /// <code>includeGlobalResourceTypes</code> field to false.
  ///
  /// If you do not want to record configuration changes to the global IAM
  /// resource types (IAM users, groups, roles, and customer managed policies),
  /// make sure to not list them in the <code>resourceTypes</code> field in
  /// addition to setting the <code>includeGlobalResourceTypes</code> field to
  /// false.
  /// </note>
  final bool? includeGlobalResourceTypes;

  /// An object that specifies the recording strategy for the configuration
  /// recorder.
  ///
  /// <ul>
  /// <li>
  /// If you set the <code>useOnly</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>ALL_SUPPORTED_RESOURCE_TYPES</code>, Config records configuration
  /// changes for all supported resource types, excluding the global IAM resource
  /// types. You also must set the <code>allSupported</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>. When Config adds support for a new resource type,
  /// Config automatically starts recording resources of that type.
  /// </li>
  /// <li>
  /// If you set the <code>useOnly</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>INCLUSION_BY_RESOURCE_TYPES</code>, Config records configuration
  /// changes for only the resource types you specify in the
  /// <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>.
  /// </li>
  /// <li>
  /// If you set the <code>useOnly</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>EXCLUSION_BY_RESOURCE_TYPES</code>, Config records configuration
  /// changes for all supported resource types except the resource types that you
  /// specify to exclude from being recorded in the <code>resourceTypes</code>
  /// field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html">ExclusionByResourceTypes</a>.
  /// </li>
  /// </ul> <note>
  /// <b>Required and optional fields</b>
  ///
  /// The <code>recordingStrategy</code> field is optional when you set the
  /// <code>allSupported</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>.
  ///
  /// The <code>recordingStrategy</code> field is optional when you list resource
  /// types in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>.
  ///
  /// The <code>recordingStrategy</code> field is required if you list resource
  /// types to exclude from recording in the <code>resourceTypes</code> field of
  /// <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html">ExclusionByResourceTypes</a>.
  /// </note> <note>
  /// <b>Overriding fields</b>
  ///
  /// If you choose <code>EXCLUSION_BY_RESOURCE_TYPES</code> for the recording
  /// strategy, the <code>exclusionByResourceTypes</code> field will override
  /// other properties in the request.
  ///
  /// For example, even if you set <code>includeGlobalResourceTypes</code> to
  /// false, global IAM resource types will still be automatically recorded in
  /// this option unless those resource types are specifically listed as
  /// exclusions in the <code>resourceTypes</code> field of
  /// <code>exclusionByResourceTypes</code>.
  /// </note> <note>
  /// <b>Global resources types and the resource exclusion recording strategy</b>
  ///
  /// By default, if you choose the <code>EXCLUSION_BY_RESOURCE_TYPES</code>
  /// recording strategy, when Config adds support for a new resource type in the
  /// Region where you set up the configuration recorder, including global
  /// resource types, Config starts recording resources of that type
  /// automatically.
  ///
  /// Unless specifically listed as exclusions,
  /// <code>AWS::RDS::GlobalCluster</code> will be recorded automatically in all
  /// supported Config Regions were the configuration recorder is enabled.
  ///
  /// IAM users, groups, roles, and customer managed policies will be recorded in
  /// the Region where you set up the configuration recorder if that is a Region
  /// where Config was available before February 2022. You cannot be record the
  /// global IAM resouce types in Regions supported by Config after February 2022.
  /// This list where you cannot record the global IAM resource types includes the
  /// following Regions:
  ///
  /// <ul>
  /// <li>
  /// Asia Pacific (Hyderabad)
  /// </li>
  /// <li>
  /// Asia Pacific (Melbourne)
  /// </li>
  /// <li>
  /// Canada West (Calgary)
  /// </li>
  /// <li>
  /// Europe (Spain)
  /// </li>
  /// <li>
  /// Europe (Zurich)
  /// </li>
  /// <li>
  /// Israel (Tel Aviv)
  /// </li>
  /// <li>
  /// Middle East (UAE)
  /// </li>
  /// </ul> </note>
  final RecordingStrategy? recordingStrategy;

  /// A comma-separated list that specifies which resource types Config records.
  ///
  /// For a list of valid <code>resourceTypes</code> values, see the <b>Resource
  /// Type Value</b> column in <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
  /// Amazon Web Services resource Types</a> in the <i>Config developer guide</i>.
  /// <note>
  /// <b>Required and optional fields</b>
  ///
  /// Optionally, you can set the <code>useOnly</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html">RecordingStrategy</a>
  /// to <code>INCLUSION_BY_RESOURCE_TYPES</code>.
  ///
  /// To record all configuration changes, set the <code>allSupported</code> field
  /// of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>, and either omit this field or don't specify any
  /// resource types in this field. If you set the <code>allSupported</code> field
  /// to <code>false</code> and specify values for <code>resourceTypes</code>,
  /// when Config adds support for a new type of resource, it will not record
  /// resources of that type unless you manually add that type to your recording
  /// group.
  /// </note> <note>
  /// <b>Region availability</b>
  ///
  /// Before specifying a resource type for Config to track, check <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html">Resource
  /// Coverage by Region Availability</a> to see if the resource type is supported
  /// in the Amazon Web Services Region where you set up Config. If a resource
  /// type is supported by Config in at least one Region, you can enable the
  /// recording of that resource type in all Regions supported by Config, even if
  /// the specified resource type is not supported in the Amazon Web Services
  /// Region where you set up Config.
  /// </note>
  final List<ResourceType>? resourceTypes;

  RecordingGroup({
    this.allSupported,
    this.exclusionByResourceTypes,
    this.includeGlobalResourceTypes,
    this.recordingStrategy,
    this.resourceTypes,
  });

  factory RecordingGroup.fromJson(Map<String, dynamic> json) {
    return RecordingGroup(
      allSupported: json['allSupported'] as bool?,
      exclusionByResourceTypes: json['exclusionByResourceTypes'] != null
          ? ExclusionByResourceTypes.fromJson(
              json['exclusionByResourceTypes'] as Map<String, dynamic>)
          : null,
      includeGlobalResourceTypes: json['includeGlobalResourceTypes'] as bool?,
      recordingStrategy: json['recordingStrategy'] != null
          ? RecordingStrategy.fromJson(
              json['recordingStrategy'] as Map<String, dynamic>)
          : null,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.nonNulls
          .map((e) => ResourceType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allSupported = this.allSupported;
    final exclusionByResourceTypes = this.exclusionByResourceTypes;
    final includeGlobalResourceTypes = this.includeGlobalResourceTypes;
    final recordingStrategy = this.recordingStrategy;
    final resourceTypes = this.resourceTypes;
    return {
      if (allSupported != null) 'allSupported': allSupported,
      if (exclusionByResourceTypes != null)
        'exclusionByResourceTypes': exclusionByResourceTypes,
      if (includeGlobalResourceTypes != null)
        'includeGlobalResourceTypes': includeGlobalResourceTypes,
      if (recordingStrategy != null) 'recordingStrategy': recordingStrategy,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.value).toList(),
    };
  }
}

/// Specifies the default recording frequency that Config uses to record
/// configuration changes. Config supports <i>Continuous recording</i> and
/// <i>Daily recording</i>.
///
/// <ul>
/// <li>
/// Continuous recording allows you to record configuration changes continuously
/// whenever a change occurs.
/// </li>
/// <li>
/// Daily recording allows you to receive a configuration item (CI) representing
/// the most recent state of your resources over the last 24-hour period, only
/// if it’s different from the previous CI recorded.
/// </li>
/// </ul> <note>
/// Firewall Manager depends on continuous recording to monitor your resources.
/// If you are using Firewall Manager, it is recommended that you set the
/// recording frequency to Continuous.
/// </note>
/// You can also override the recording frequency for specific resource types.
class RecordingMode {
  /// The default recording frequency that Config uses to record configuration
  /// changes.
  /// <important>
  /// Daily recording is not supported for the following resource types:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::Config::ResourceCompliance</code>
  /// </li>
  /// <li>
  /// <code>AWS::Config::ConformancePackCompliance</code>
  /// </li>
  /// <li>
  /// <code>AWS::Config::ConfigurationRecorder</code>
  /// </li>
  /// </ul>
  /// For the <b>allSupported</b> (<code>ALL_SUPPORTED_RESOURCE_TYPES</code>)
  /// recording strategy, these resource types will be set to Continuous
  /// recording.
  /// </important>
  final RecordingFrequency recordingFrequency;

  /// An array of <code>recordingModeOverride</code> objects for you to specify
  /// your overrides for the recording mode. The
  /// <code>recordingModeOverride</code> object in the
  /// <code>recordingModeOverrides</code> array consists of three fields: a
  /// <code>description</code>, the new <code>recordingFrequency</code>, and an
  /// array of <code>resourceTypes</code> to override.
  final List<RecordingModeOverride>? recordingModeOverrides;

  RecordingMode({
    required this.recordingFrequency,
    this.recordingModeOverrides,
  });

  factory RecordingMode.fromJson(Map<String, dynamic> json) {
    return RecordingMode(
      recordingFrequency:
          RecordingFrequency.fromString((json['recordingFrequency'] as String)),
      recordingModeOverrides: (json['recordingModeOverrides'] as List?)
          ?.nonNulls
          .map((e) => RecordingModeOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final recordingFrequency = this.recordingFrequency;
    final recordingModeOverrides = this.recordingModeOverrides;
    return {
      'recordingFrequency': recordingFrequency.value,
      if (recordingModeOverrides != null)
        'recordingModeOverrides': recordingModeOverrides,
    };
  }
}

/// An object for you to specify your overrides for the recording mode.
class RecordingModeOverride {
  /// The recording frequency that will be applied to all the resource types
  /// specified in the override.
  ///
  /// <ul>
  /// <li>
  /// Continuous recording allows you to record configuration changes continuously
  /// whenever a change occurs.
  /// </li>
  /// <li>
  /// Daily recording allows you to receive a configuration item (CI) representing
  /// the most recent state of your resources over the last 24-hour period, only
  /// if it’s different from the previous CI recorded.
  /// </li>
  /// </ul> <note>
  /// Firewall Manager depends on continuous recording to monitor your resources.
  /// If you are using Firewall Manager, it is recommended that you set the
  /// recording frequency to Continuous.
  /// </note>
  final RecordingFrequency recordingFrequency;

  /// A comma-separated list that specifies which resource types Config includes
  /// in the override.
  /// <important>
  /// Daily recording is not supported for the following resource types:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::Config::ResourceCompliance</code>
  /// </li>
  /// <li>
  /// <code>AWS::Config::ConformancePackCompliance</code>
  /// </li>
  /// <li>
  /// <code>AWS::Config::ConfigurationRecorder</code>
  /// </li>
  /// </ul> </important>
  final List<ResourceType> resourceTypes;

  /// A description that you provide for the override.
  final String? description;

  RecordingModeOverride({
    required this.recordingFrequency,
    required this.resourceTypes,
    this.description,
  });

  factory RecordingModeOverride.fromJson(Map<String, dynamic> json) {
    return RecordingModeOverride(
      recordingFrequency:
          RecordingFrequency.fromString((json['recordingFrequency'] as String)),
      resourceTypes: (json['resourceTypes'] as List)
          .nonNulls
          .map((e) => ResourceType.fromString((e as String)))
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingFrequency = this.recordingFrequency;
    final resourceTypes = this.resourceTypes;
    final description = this.description;
    return {
      'recordingFrequency': recordingFrequency.value,
      'resourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (description != null) 'description': description,
    };
  }
}

/// Specifies the recording strategy of the configuration recorder.
class RecordingStrategy {
  /// The recording strategy for the configuration recorder.
  ///
  /// <ul>
  /// <li>
  /// If you set this option to <code>ALL_SUPPORTED_RESOURCE_TYPES</code>, Config
  /// records configuration changes for all supported resource types, excluding
  /// the global IAM resource types. You also must set the
  /// <code>allSupported</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>. When Config adds support for a new resource type,
  /// Config automatically starts recording resources of that type. For a list of
  /// supported resource types, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
  /// Resource Types</a> in the <i>Config developer guide</i>.
  /// </li>
  /// <li>
  /// If you set this option to <code>INCLUSION_BY_RESOURCE_TYPES</code>, Config
  /// records configuration changes for only the resource types that you specify
  /// in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>.
  /// </li>
  /// <li>
  /// If you set this option to <code>EXCLUSION_BY_RESOURCE_TYPES</code>, Config
  /// records configuration changes for all supported resource types, except the
  /// resource types that you specify to exclude from being recorded in the
  /// <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html">ExclusionByResourceTypes</a>.
  /// </li>
  /// </ul> <note>
  /// <b>Required and optional fields</b>
  ///
  /// The <code>recordingStrategy</code> field is optional when you set the
  /// <code>allSupported</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>
  /// to <code>true</code>.
  ///
  /// The <code>recordingStrategy</code> field is optional when you list resource
  /// types in the <code>resourceTypes</code> field of <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html">RecordingGroup</a>.
  ///
  /// The <code>recordingStrategy</code> field is required if you list resource
  /// types to exclude from recording in the <code>resourceTypes</code> field of
  /// <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html">ExclusionByResourceTypes</a>.
  /// </note> <note>
  /// <b>Overriding fields</b>
  ///
  /// If you choose <code>EXCLUSION_BY_RESOURCE_TYPES</code> for the recording
  /// strategy, the <code>exclusionByResourceTypes</code> field will override
  /// other properties in the request.
  ///
  /// For example, even if you set <code>includeGlobalResourceTypes</code> to
  /// false, global IAM resource types will still be automatically recorded in
  /// this option unless those resource types are specifically listed as
  /// exclusions in the <code>resourceTypes</code> field of
  /// <code>exclusionByResourceTypes</code>.
  /// </note> <note>
  /// <b>Global resource types and the exclusion recording strategy</b>
  ///
  /// By default, if you choose the <code>EXCLUSION_BY_RESOURCE_TYPES</code>
  /// recording strategy, when Config adds support for a new resource type in the
  /// Region where you set up the configuration recorder, including global
  /// resource types, Config starts recording resources of that type
  /// automatically.
  ///
  /// Unless specifically listed as exclusions,
  /// <code>AWS::RDS::GlobalCluster</code> will be recorded automatically in all
  /// supported Config Regions were the configuration recorder is enabled.
  ///
  /// IAM users, groups, roles, and customer managed policies will be recorded in
  /// the Region where you set up the configuration recorder if that is a Region
  /// where Config was available before February 2022. You cannot be record the
  /// global IAM resouce types in Regions supported by Config after February 2022.
  /// This list where you cannot record the global IAM resource types includes the
  /// following Regions:
  ///
  /// <ul>
  /// <li>
  /// Asia Pacific (Hyderabad)
  /// </li>
  /// <li>
  /// Asia Pacific (Melbourne)
  /// </li>
  /// <li>
  /// Canada West (Calgary)
  /// </li>
  /// <li>
  /// Europe (Spain)
  /// </li>
  /// <li>
  /// Europe (Zurich)
  /// </li>
  /// <li>
  /// Israel (Tel Aviv)
  /// </li>
  /// <li>
  /// Middle East (UAE)
  /// </li>
  /// </ul> </note>
  final RecordingStrategyType? useOnly;

  RecordingStrategy({
    this.useOnly,
  });

  factory RecordingStrategy.fromJson(Map<String, dynamic> json) {
    return RecordingStrategy(
      useOnly:
          (json['useOnly'] as String?)?.let(RecordingStrategyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final useOnly = this.useOnly;
    return {
      if (useOnly != null) 'useOnly': useOnly.value,
    };
  }
}

enum RecordingStrategyType {
  allSupportedResourceTypes('ALL_SUPPORTED_RESOURCE_TYPES'),
  inclusionByResourceTypes('INCLUSION_BY_RESOURCE_TYPES'),
  exclusionByResourceTypes('EXCLUSION_BY_RESOURCE_TYPES'),
  ;

  final String value;

  const RecordingStrategyType(this.value);

  static RecordingStrategyType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecordingStrategyType'));
}

/// The relationship of the related resource to the main resource.
class Relationship {
  /// The type of relationship with the related resource.
  final String? relationshipName;

  /// The ID of the related resource (for example, <code>sg-xxxxxx</code>).
  final String? resourceId;

  /// The custom name of the related resource, if available.
  final String? resourceName;

  /// The resource type of the related resource.
  final ResourceType? resourceType;

  Relationship({
    this.relationshipName,
    this.resourceId,
    this.resourceName,
    this.resourceType,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      relationshipName: json['relationshipName'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

/// An object that represents the details about the remediation configuration
/// that includes the remediation action, parameters, and data to execute the
/// action.
class RemediationConfiguration {
  /// The name of the Config rule.
  final String configRuleName;

  /// Target ID is the name of the SSM document.
  final String targetId;

  /// The type of the target. Target executes remediation. For example, SSM
  /// document.
  final RemediationTargetType targetType;

  /// Amazon Resource Name (ARN) of remediation configuration.
  final String? arn;

  /// The remediation is triggered automatically.
  final bool? automatic;

  /// Name of the service that owns the service-linked rule, if applicable.
  final String? createdByService;

  /// An ExecutionControls object.
  final ExecutionControls? executionControls;

  /// The maximum number of failed attempts for auto-remediation. If you do not
  /// select a number, the default is 5.
  ///
  /// For example, if you specify MaximumAutomaticAttempts as 5 with
  /// RetryAttemptSeconds as 50 seconds, Config will put a RemediationException on
  /// your behalf for the failing resource after the 5th failed attempt within 50
  /// seconds.
  final int? maximumAutomaticAttempts;

  /// An object of the RemediationParameterValue.
  final Map<String, RemediationParameterValue>? parameters;

  /// The type of a resource.
  final String? resourceType;

  /// Time window to determine whether or not to add a remediation exception to
  /// prevent infinite remediation attempts. If
  /// <code>MaximumAutomaticAttempts</code> remediation attempts have been made
  /// under <code>RetryAttemptSeconds</code>, a remediation exception will be
  /// added to the resource. If you do not select a number, the default is 60
  /// seconds.
  ///
  /// For example, if you specify <code>RetryAttemptSeconds</code> as 50 seconds
  /// and <code>MaximumAutomaticAttempts</code> as 5, Config will run
  /// auto-remediations 5 times within 50 seconds before adding a remediation
  /// exception to the resource.
  final int? retryAttemptSeconds;

  /// Version of the target. For example, version of the SSM document.
  /// <note>
  /// If you make backward incompatible changes to the SSM document, you must call
  /// PutRemediationConfiguration API again to ensure the remediations can run.
  /// </note>
  final String? targetVersion;

  RemediationConfiguration({
    required this.configRuleName,
    required this.targetId,
    required this.targetType,
    this.arn,
    this.automatic,
    this.createdByService,
    this.executionControls,
    this.maximumAutomaticAttempts,
    this.parameters,
    this.resourceType,
    this.retryAttemptSeconds,
    this.targetVersion,
  });

  factory RemediationConfiguration.fromJson(Map<String, dynamic> json) {
    return RemediationConfiguration(
      configRuleName: json['ConfigRuleName'] as String,
      targetId: json['TargetId'] as String,
      targetType:
          RemediationTargetType.fromString((json['TargetType'] as String)),
      arn: json['Arn'] as String?,
      automatic: json['Automatic'] as bool?,
      createdByService: json['CreatedByService'] as String?,
      executionControls: json['ExecutionControls'] != null
          ? ExecutionControls.fromJson(
              json['ExecutionControls'] as Map<String, dynamic>)
          : null,
      maximumAutomaticAttempts: json['MaximumAutomaticAttempts'] as int?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              RemediationParameterValue.fromJson(e as Map<String, dynamic>))),
      resourceType: json['ResourceType'] as String?,
      retryAttemptSeconds: json['RetryAttemptSeconds'] as int?,
      targetVersion: json['TargetVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configRuleName = this.configRuleName;
    final targetId = this.targetId;
    final targetType = this.targetType;
    final arn = this.arn;
    final automatic = this.automatic;
    final createdByService = this.createdByService;
    final executionControls = this.executionControls;
    final maximumAutomaticAttempts = this.maximumAutomaticAttempts;
    final parameters = this.parameters;
    final resourceType = this.resourceType;
    final retryAttemptSeconds = this.retryAttemptSeconds;
    final targetVersion = this.targetVersion;
    return {
      'ConfigRuleName': configRuleName,
      'TargetId': targetId,
      'TargetType': targetType.value,
      if (arn != null) 'Arn': arn,
      if (automatic != null) 'Automatic': automatic,
      if (createdByService != null) 'CreatedByService': createdByService,
      if (executionControls != null) 'ExecutionControls': executionControls,
      if (maximumAutomaticAttempts != null)
        'MaximumAutomaticAttempts': maximumAutomaticAttempts,
      if (parameters != null) 'Parameters': parameters,
      if (resourceType != null) 'ResourceType': resourceType,
      if (retryAttemptSeconds != null)
        'RetryAttemptSeconds': retryAttemptSeconds,
      if (targetVersion != null) 'TargetVersion': targetVersion,
    };
  }
}

/// An object that represents the details about the remediation exception. The
/// details include the rule name, an explanation of an exception, the time when
/// the exception will be deleted, the resource ID, and resource type.
class RemediationException {
  /// The name of the Config rule.
  final String configRuleName;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  /// The type of a resource.
  final String resourceType;

  /// The time when the remediation exception will be deleted.
  final DateTime? expirationTime;

  /// An explanation of an remediation exception.
  final String? message;

  RemediationException({
    required this.configRuleName,
    required this.resourceId,
    required this.resourceType,
    this.expirationTime,
    this.message,
  });

  factory RemediationException.fromJson(Map<String, dynamic> json) {
    return RemediationException(
      configRuleName: json['ConfigRuleName'] as String,
      resourceId: json['ResourceId'] as String,
      resourceType: json['ResourceType'] as String,
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      message: json['Message'] as String?,
    );
  }
}

/// The details that identify a resource within Config, including the resource
/// type and resource ID.
class RemediationExceptionResourceKey {
  /// The ID of the resource (for example., sg-xxxxxx).
  final String? resourceId;

  /// The type of a resource.
  final String? resourceType;

  RemediationExceptionResourceKey({
    this.resourceId,
    this.resourceType,
  });

  factory RemediationExceptionResourceKey.fromJson(Map<String, dynamic> json) {
    return RemediationExceptionResourceKey(
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

enum RemediationExecutionState {
  queued('QUEUED'),
  inProgress('IN_PROGRESS'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const RemediationExecutionState(this.value);

  static RemediationExecutionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RemediationExecutionState'));
}

/// Provides details of the current status of the invoked remediation action for
/// that resource.
class RemediationExecutionStatus {
  /// Start time when the remediation was executed.
  final DateTime? invocationTime;

  /// The time when the remediation execution was last updated.
  final DateTime? lastUpdatedTime;
  final ResourceKey? resourceKey;

  /// ENUM of the values.
  final RemediationExecutionState? state;

  /// Details of every step.
  final List<RemediationExecutionStep>? stepDetails;

  RemediationExecutionStatus({
    this.invocationTime,
    this.lastUpdatedTime,
    this.resourceKey,
    this.state,
    this.stepDetails,
  });

  factory RemediationExecutionStatus.fromJson(Map<String, dynamic> json) {
    return RemediationExecutionStatus(
      invocationTime: timeStampFromJson(json['InvocationTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      resourceKey: json['ResourceKey'] != null
          ? ResourceKey.fromJson(json['ResourceKey'] as Map<String, dynamic>)
          : null,
      state:
          (json['State'] as String?)?.let(RemediationExecutionState.fromString),
      stepDetails: (json['StepDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              RemediationExecutionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Name of the step from the SSM document.
class RemediationExecutionStep {
  /// An error message if the step was interrupted during execution.
  final String? errorMessage;

  /// The details of the step.
  final String? name;

  /// The time when the step started.
  final DateTime? startTime;

  /// The valid status of the step.
  final RemediationExecutionStepState? state;

  /// The time when the step stopped.
  final DateTime? stopTime;

  RemediationExecutionStep({
    this.errorMessage,
    this.name,
    this.startTime,
    this.state,
    this.stopTime,
  });

  factory RemediationExecutionStep.fromJson(Map<String, dynamic> json) {
    return RemediationExecutionStep(
      errorMessage: json['ErrorMessage'] as String?,
      name: json['Name'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)
          ?.let(RemediationExecutionStepState.fromString),
      stopTime: timeStampFromJson(json['StopTime']),
    );
  }
}

enum RemediationExecutionStepState {
  succeeded('SUCCEEDED'),
  pending('PENDING'),
  failed('FAILED'),
  ;

  final String value;

  const RemediationExecutionStepState(this.value);

  static RemediationExecutionStepState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RemediationExecutionStepState'));
}

/// The value is either a dynamic (resource) value or a static value. You must
/// select either a dynamic value or a static value.
class RemediationParameterValue {
  /// The value is dynamic and changes at run-time.
  final ResourceValue? resourceValue;

  /// The value is static and does not change at run-time.
  final StaticValue? staticValue;

  RemediationParameterValue({
    this.resourceValue,
    this.staticValue,
  });

  factory RemediationParameterValue.fromJson(Map<String, dynamic> json) {
    return RemediationParameterValue(
      resourceValue: json['ResourceValue'] != null
          ? ResourceValue.fromJson(
              json['ResourceValue'] as Map<String, dynamic>)
          : null,
      staticValue: json['StaticValue'] != null
          ? StaticValue.fromJson(json['StaticValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceValue = this.resourceValue;
    final staticValue = this.staticValue;
    return {
      if (resourceValue != null) 'ResourceValue': resourceValue,
      if (staticValue != null) 'StaticValue': staticValue,
    };
  }
}

enum RemediationTargetType {
  ssmDocument('SSM_DOCUMENT'),
  ;

  final String value;

  const RemediationTargetType(this.value);

  static RemediationTargetType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RemediationTargetType'));
}

enum ResourceConfigurationSchemaType {
  cfnResourceSchema('CFN_RESOURCE_SCHEMA'),
  ;

  final String value;

  const ResourceConfigurationSchemaType(this.value);

  static ResourceConfigurationSchemaType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ResourceConfigurationSchemaType'));
}

/// An object that contains the resource type and the number of resources.
class ResourceCount {
  /// The number of resources.
  final int? count;

  /// The resource type (for example, <code>"AWS::EC2::Instance"</code>).
  final ResourceType? resourceType;

  ResourceCount({
    this.count,
    this.resourceType,
  });

  factory ResourceCount.fromJson(Map<String, dynamic> json) {
    return ResourceCount(
      count: json['count'] as int?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

/// Filters the resource count based on account ID, region, and resource type.
class ResourceCountFilters {
  /// The 12-digit ID of the account.
  final String? accountId;

  /// The region where the account is located.
  final String? region;

  /// The type of the Amazon Web Services resource.
  final ResourceType? resourceType;

  ResourceCountFilters({
    this.accountId,
    this.region,
    this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final region = this.region;
    final resourceType = this.resourceType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType.value,
    };
  }
}

enum ResourceCountGroupKey {
  resourceType('RESOURCE_TYPE'),
  accountId('ACCOUNT_ID'),
  awsRegion('AWS_REGION'),
  ;

  final String value;

  const ResourceCountGroupKey(this.value);

  static ResourceCountGroupKey fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ResourceCountGroupKey'));
}

/// Returns information about the resource being evaluated.
class ResourceDetails {
  /// The resource definition to be evaluated as per the resource configuration
  /// schema type.
  final String resourceConfiguration;

  /// A unique resource ID for an evaluation.
  final String resourceId;

  /// The type of resource being evaluated.
  final String resourceType;

  /// The schema type of the resource configuration.
  /// <note>
  /// You can find the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">Resource
  /// type schema</a>, or <code>CFN_RESOURCE_SCHEMA</code>, in "<i>Amazon Web
  /// Services public extensions</i>" within the CloudFormation registry or with
  /// the following CLI commmand: <code>aws cloudformation describe-type
  /// --type-name "AWS::S3::Bucket" --type RESOURCE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view">Managing
  /// extensions through the CloudFormation registry</a> and <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services resource and property types reference</a> in the CloudFormation
  /// User Guide.
  /// </note>
  final ResourceConfigurationSchemaType? resourceConfigurationSchemaType;

  ResourceDetails({
    required this.resourceConfiguration,
    required this.resourceId,
    required this.resourceType,
    this.resourceConfigurationSchemaType,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      resourceConfiguration: json['ResourceConfiguration'] as String,
      resourceId: json['ResourceId'] as String,
      resourceType: json['ResourceType'] as String,
      resourceConfigurationSchemaType:
          (json['ResourceConfigurationSchemaType'] as String?)
              ?.let(ResourceConfigurationSchemaType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceConfiguration = this.resourceConfiguration;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final resourceConfigurationSchemaType =
        this.resourceConfigurationSchemaType;
    return {
      'ResourceConfiguration': resourceConfiguration,
      'ResourceId': resourceId,
      'ResourceType': resourceType,
      if (resourceConfigurationSchemaType != null)
        'ResourceConfigurationSchemaType':
            resourceConfigurationSchemaType.value,
    };
  }
}

/// Returns details of a resource evaluation.
class ResourceEvaluation {
  /// The mode of an evaluation. The valid values are Detective or Proactive.
  final EvaluationMode? evaluationMode;

  /// The starting time of an execution.
  final DateTime? evaluationStartTimestamp;

  /// The ResourceEvaluationId of a evaluation.
  final String? resourceEvaluationId;

  ResourceEvaluation({
    this.evaluationMode,
    this.evaluationStartTimestamp,
    this.resourceEvaluationId,
  });

  factory ResourceEvaluation.fromJson(Map<String, dynamic> json) {
    return ResourceEvaluation(
      evaluationMode:
          (json['EvaluationMode'] as String?)?.let(EvaluationMode.fromString),
      evaluationStartTimestamp:
          timeStampFromJson(json['EvaluationStartTimestamp']),
      resourceEvaluationId: json['ResourceEvaluationId'] as String?,
    );
  }
}

/// Returns details of a resource evaluation based on the selected filter.
class ResourceEvaluationFilters {
  /// Filters evaluations for a given infrastructure deployment. For example: CFN
  /// Stack.
  final String? evaluationContextIdentifier;

  /// Filters all resource evaluations results based on an evaluation mode.
  /// <important>
  /// Currently, <code>DECTECTIVE</code> is not supported as a valid value. Ignore
  /// other documentation stating otherwise.
  /// </important>
  final EvaluationMode? evaluationMode;

  /// Returns a <code>TimeWindow</code> object.
  final TimeWindow? timeWindow;

  ResourceEvaluationFilters({
    this.evaluationContextIdentifier,
    this.evaluationMode,
    this.timeWindow,
  });

  Map<String, dynamic> toJson() {
    final evaluationContextIdentifier = this.evaluationContextIdentifier;
    final evaluationMode = this.evaluationMode;
    final timeWindow = this.timeWindow;
    return {
      if (evaluationContextIdentifier != null)
        'EvaluationContextIdentifier': evaluationContextIdentifier,
      if (evaluationMode != null) 'EvaluationMode': evaluationMode.value,
      if (timeWindow != null) 'TimeWindow': timeWindow,
    };
  }
}

enum ResourceEvaluationStatus {
  inProgress('IN_PROGRESS'),
  failed('FAILED'),
  succeeded('SUCCEEDED'),
  ;

  final String value;

  const ResourceEvaluationStatus(this.value);

  static ResourceEvaluationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ResourceEvaluationStatus'));
}

/// Filters the results by resource account ID, region, resource ID, and
/// resource name.
class ResourceFilters {
  /// The 12-digit source account ID.
  final String? accountId;

  /// The source region.
  final String? region;

  /// The ID of the resource.
  final String? resourceId;

  /// The name of the resource.
  final String? resourceName;

  ResourceFilters({
    this.accountId,
    this.region,
    this.resourceId,
    this.resourceName,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final region = this.region;
    final resourceId = this.resourceId;
    final resourceName = this.resourceName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (region != null) 'Region': region,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceName != null) 'ResourceName': resourceName,
    };
  }
}

/// The details that identify a resource that is discovered by Config, including
/// the resource type, ID, and (if available) the custom resource name.
class ResourceIdentifier {
  /// The time that the resource was deleted.
  final DateTime? resourceDeletionTime;

  /// The ID of the resource (for example, <code>sg-xxxxxx</code>).
  final String? resourceId;

  /// The custom name of the resource (if available).
  final String? resourceName;

  /// The type of resource.
  final ResourceType? resourceType;

  ResourceIdentifier({
    this.resourceDeletionTime,
    this.resourceId,
    this.resourceName,
    this.resourceType,
  });

  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return ResourceIdentifier(
      resourceDeletionTime: timeStampFromJson(json['resourceDeletionTime']),
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

/// The details that identify a resource within Config, including the resource
/// type and resource ID.
class ResourceKey {
  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  /// The resource type.
  final ResourceType resourceType;

  ResourceKey({
    required this.resourceId,
    required this.resourceType,
  });

  factory ResourceKey.fromJson(Map<String, dynamic> json) {
    return ResourceKey(
      resourceId: json['resourceId'] as String,
      resourceType: ResourceType.fromString((json['resourceType'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      'resourceId': resourceId,
      'resourceType': resourceType.value,
    };
  }
}

enum ResourceType {
  awsEc2CustomerGateway('AWS::EC2::CustomerGateway'),
  awsEc2Eip('AWS::EC2::EIP'),
  awsEc2Host('AWS::EC2::Host'),
  awsEc2Instance('AWS::EC2::Instance'),
  awsEc2InternetGateway('AWS::EC2::InternetGateway'),
  awsEc2NetworkAcl('AWS::EC2::NetworkAcl'),
  awsEc2NetworkInterface('AWS::EC2::NetworkInterface'),
  awsEc2RouteTable('AWS::EC2::RouteTable'),
  awsEc2SecurityGroup('AWS::EC2::SecurityGroup'),
  awsEc2Subnet('AWS::EC2::Subnet'),
  awsCloudTrailTrail('AWS::CloudTrail::Trail'),
  awsEc2Volume('AWS::EC2::Volume'),
  awsEc2Vpc('AWS::EC2::VPC'),
  awsEc2VPNConnection('AWS::EC2::VPNConnection'),
  awsEc2VPNGateway('AWS::EC2::VPNGateway'),
  awsEc2RegisteredHAInstance('AWS::EC2::RegisteredHAInstance'),
  awsEc2NatGateway('AWS::EC2::NatGateway'),
  awsEc2EgressOnlyInternetGateway('AWS::EC2::EgressOnlyInternetGateway'),
  awsEc2VPCEndpoint('AWS::EC2::VPCEndpoint'),
  awsEc2VPCEndpointService('AWS::EC2::VPCEndpointService'),
  awsEc2FlowLog('AWS::EC2::FlowLog'),
  awsEc2VPCPeeringConnection('AWS::EC2::VPCPeeringConnection'),
  awsElasticsearchDomain('AWS::Elasticsearch::Domain'),
  awsIamGroup('AWS::IAM::Group'),
  awsIamPolicy('AWS::IAM::Policy'),
  awsIamRole('AWS::IAM::Role'),
  awsIamUser('AWS::IAM::User'),
  awsElasticLoadBalancingV2LoadBalancer(
      'AWS::ElasticLoadBalancingV2::LoadBalancer'),
  awsAcmCertificate('AWS::ACM::Certificate'),
  awsRdsDBInstance('AWS::RDS::DBInstance'),
  awsRdsDBSubnetGroup('AWS::RDS::DBSubnetGroup'),
  awsRdsDBSecurityGroup('AWS::RDS::DBSecurityGroup'),
  awsRdsDBSnapshot('AWS::RDS::DBSnapshot'),
  awsRdsDBCluster('AWS::RDS::DBCluster'),
  awsRdsDBClusterSnapshot('AWS::RDS::DBClusterSnapshot'),
  awsRdsEventSubscription('AWS::RDS::EventSubscription'),
  awsS3Bucket('AWS::S3::Bucket'),
  awsS3AccountPublicAccessBlock('AWS::S3::AccountPublicAccessBlock'),
  awsRedshiftCluster('AWS::Redshift::Cluster'),
  awsRedshiftClusterSnapshot('AWS::Redshift::ClusterSnapshot'),
  awsRedshiftClusterParameterGroup('AWS::Redshift::ClusterParameterGroup'),
  awsRedshiftClusterSecurityGroup('AWS::Redshift::ClusterSecurityGroup'),
  awsRedshiftClusterSubnetGroup('AWS::Redshift::ClusterSubnetGroup'),
  awsRedshiftEventSubscription('AWS::Redshift::EventSubscription'),
  awsSsmManagedInstanceInventory('AWS::SSM::ManagedInstanceInventory'),
  awsCloudWatchAlarm('AWS::CloudWatch::Alarm'),
  awsCloudFormationStack('AWS::CloudFormation::Stack'),
  awsElasticLoadBalancingLoadBalancer(
      'AWS::ElasticLoadBalancing::LoadBalancer'),
  awsAutoScalingAutoScalingGroup('AWS::AutoScaling::AutoScalingGroup'),
  awsAutoScalingLaunchConfiguration('AWS::AutoScaling::LaunchConfiguration'),
  awsAutoScalingScalingPolicy('AWS::AutoScaling::ScalingPolicy'),
  awsAutoScalingScheduledAction('AWS::AutoScaling::ScheduledAction'),
  awsDynamoDBTable('AWS::DynamoDB::Table'),
  awsCodeBuildProject('AWS::CodeBuild::Project'),
  awsWafRateBasedRule('AWS::WAF::RateBasedRule'),
  awsWafRule('AWS::WAF::Rule'),
  awsWafRuleGroup('AWS::WAF::RuleGroup'),
  awsWafWebACL('AWS::WAF::WebACL'),
  awsWAFRegionalRateBasedRule('AWS::WAFRegional::RateBasedRule'),
  awsWAFRegionalRule('AWS::WAFRegional::Rule'),
  awsWAFRegionalRuleGroup('AWS::WAFRegional::RuleGroup'),
  awsWAFRegionalWebACL('AWS::WAFRegional::WebACL'),
  awsCloudFrontDistribution('AWS::CloudFront::Distribution'),
  awsCloudFrontStreamingDistribution('AWS::CloudFront::StreamingDistribution'),
  awsLambdaFunction('AWS::Lambda::Function'),
  awsNetworkFirewallFirewall('AWS::NetworkFirewall::Firewall'),
  awsNetworkFirewallFirewallPolicy('AWS::NetworkFirewall::FirewallPolicy'),
  awsNetworkFirewallRuleGroup('AWS::NetworkFirewall::RuleGroup'),
  awsElasticBeanstalkApplication('AWS::ElasticBeanstalk::Application'),
  awsElasticBeanstalkApplicationVersion(
      'AWS::ElasticBeanstalk::ApplicationVersion'),
  awsElasticBeanstalkEnvironment('AWS::ElasticBeanstalk::Environment'),
  awsWAFv2WebACL('AWS::WAFv2::WebACL'),
  awsWAFv2RuleGroup('AWS::WAFv2::RuleGroup'),
  awsWAFv2IPSet('AWS::WAFv2::IPSet'),
  awsWAFv2RegexPatternSet('AWS::WAFv2::RegexPatternSet'),
  awsWAFv2ManagedRuleSet('AWS::WAFv2::ManagedRuleSet'),
  awsXRayEncryptionConfig('AWS::XRay::EncryptionConfig'),
  awsSsmAssociationCompliance('AWS::SSM::AssociationCompliance'),
  awsSsmPatchCompliance('AWS::SSM::PatchCompliance'),
  awsShieldProtection('AWS::Shield::Protection'),
  awsShieldRegionalProtection('AWS::ShieldRegional::Protection'),
  awsConfigConformancePackCompliance('AWS::Config::ConformancePackCompliance'),
  awsConfigResourceCompliance('AWS::Config::ResourceCompliance'),
  awsApiGatewayStage('AWS::ApiGateway::Stage'),
  awsApiGatewayRestApi('AWS::ApiGateway::RestApi'),
  awsApiGatewayV2Stage('AWS::ApiGatewayV2::Stage'),
  awsApiGatewayV2Api('AWS::ApiGatewayV2::Api'),
  awsCodePipelinePipeline('AWS::CodePipeline::Pipeline'),
  awsServiceCatalogCloudFormationProvisionedProduct(
      'AWS::ServiceCatalog::CloudFormationProvisionedProduct'),
  awsServiceCatalogCloudFormationProduct(
      'AWS::ServiceCatalog::CloudFormationProduct'),
  awsServiceCatalogPortfolio('AWS::ServiceCatalog::Portfolio'),
  awsSqsQueue('AWS::SQS::Queue'),
  awsKmsKey('AWS::KMS::Key'),
  awsQldbLedger('AWS::QLDB::Ledger'),
  awsSecretsManagerSecret('AWS::SecretsManager::Secret'),
  awsSnsTopic('AWS::SNS::Topic'),
  awsSsmFileData('AWS::SSM::FileData'),
  awsBackupBackupPlan('AWS::Backup::BackupPlan'),
  awsBackupBackupSelection('AWS::Backup::BackupSelection'),
  awsBackupBackupVault('AWS::Backup::BackupVault'),
  awsBackupRecoveryPoint('AWS::Backup::RecoveryPoint'),
  awsEcrRepository('AWS::ECR::Repository'),
  awsEcsCluster('AWS::ECS::Cluster'),
  awsEcsService('AWS::ECS::Service'),
  awsEcsTaskDefinition('AWS::ECS::TaskDefinition'),
  awsEfsAccessPoint('AWS::EFS::AccessPoint'),
  awsEfsFileSystem('AWS::EFS::FileSystem'),
  awsEksCluster('AWS::EKS::Cluster'),
  awsOpenSearchDomain('AWS::OpenSearch::Domain'),
  awsEc2TransitGateway('AWS::EC2::TransitGateway'),
  awsKinesisStream('AWS::Kinesis::Stream'),
  awsKinesisStreamConsumer('AWS::Kinesis::StreamConsumer'),
  awsCodeDeployApplication('AWS::CodeDeploy::Application'),
  awsCodeDeployDeploymentConfig('AWS::CodeDeploy::DeploymentConfig'),
  awsCodeDeployDeploymentGroup('AWS::CodeDeploy::DeploymentGroup'),
  awsEc2LaunchTemplate('AWS::EC2::LaunchTemplate'),
  awsEcrPublicRepository('AWS::ECR::PublicRepository'),
  awsGuardDutyDetector('AWS::GuardDuty::Detector'),
  awsEmrSecurityConfiguration('AWS::EMR::SecurityConfiguration'),
  awsSageMakerCodeRepository('AWS::SageMaker::CodeRepository'),
  awsRoute53ResolverResolverEndpoint('AWS::Route53Resolver::ResolverEndpoint'),
  awsRoute53ResolverResolverRule('AWS::Route53Resolver::ResolverRule'),
  awsRoute53ResolverResolverRuleAssociation(
      'AWS::Route53Resolver::ResolverRuleAssociation'),
  awsDmsReplicationSubnetGroup('AWS::DMS::ReplicationSubnetGroup'),
  awsDmsEventSubscription('AWS::DMS::EventSubscription'),
  awsMskCluster('AWS::MSK::Cluster'),
  awsStepFunctionsActivity('AWS::StepFunctions::Activity'),
  awsWorkSpacesWorkspace('AWS::WorkSpaces::Workspace'),
  awsWorkSpacesConnectionAlias('AWS::WorkSpaces::ConnectionAlias'),
  awsSageMakerModel('AWS::SageMaker::Model'),
  awsElasticLoadBalancingV2Listener('AWS::ElasticLoadBalancingV2::Listener'),
  awsStepFunctionsStateMachine('AWS::StepFunctions::StateMachine'),
  awsBatchJobQueue('AWS::Batch::JobQueue'),
  awsBatchComputeEnvironment('AWS::Batch::ComputeEnvironment'),
  awsAccessAnalyzerAnalyzer('AWS::AccessAnalyzer::Analyzer'),
  awsAthenaWorkGroup('AWS::Athena::WorkGroup'),
  awsAthenaDataCatalog('AWS::Athena::DataCatalog'),
  awsDetectiveGraph('AWS::Detective::Graph'),
  awsGlobalAcceleratorAccelerator('AWS::GlobalAccelerator::Accelerator'),
  awsGlobalAcceleratorEndpointGroup('AWS::GlobalAccelerator::EndpointGroup'),
  awsGlobalAcceleratorListener('AWS::GlobalAccelerator::Listener'),
  awsEc2TransitGatewayAttachment('AWS::EC2::TransitGatewayAttachment'),
  awsEc2TransitGatewayRouteTable('AWS::EC2::TransitGatewayRouteTable'),
  awsDmsCertificate('AWS::DMS::Certificate'),
  awsAppConfigApplication('AWS::AppConfig::Application'),
  awsAppSyncGraphQLApi('AWS::AppSync::GraphQLApi'),
  awsDataSyncLocationSMB('AWS::DataSync::LocationSMB'),
  awsDataSyncLocationFSxLustre('AWS::DataSync::LocationFSxLustre'),
  awsDataSyncLocationS3('AWS::DataSync::LocationS3'),
  awsDataSyncLocationEFS('AWS::DataSync::LocationEFS'),
  awsDataSyncTask('AWS::DataSync::Task'),
  awsDataSyncLocationNFS('AWS::DataSync::LocationNFS'),
  awsEc2NetworkInsightsAccessScopeAnalysis(
      'AWS::EC2::NetworkInsightsAccessScopeAnalysis'),
  awsEksFargateProfile('AWS::EKS::FargateProfile'),
  awsGlueJob('AWS::Glue::Job'),
  awsGuardDutyThreatIntelSet('AWS::GuardDuty::ThreatIntelSet'),
  awsGuardDutyIPSet('AWS::GuardDuty::IPSet'),
  awsSageMakerWorkteam('AWS::SageMaker::Workteam'),
  awsSageMakerNotebookInstanceLifecycleConfig(
      'AWS::SageMaker::NotebookInstanceLifecycleConfig'),
  awsServiceDiscoveryService('AWS::ServiceDiscovery::Service'),
  awsServiceDiscoveryPublicDnsNamespace(
      'AWS::ServiceDiscovery::PublicDnsNamespace'),
  awsSesContactList('AWS::SES::ContactList'),
  awsSesConfigurationSet('AWS::SES::ConfigurationSet'),
  awsRoute53HostedZone('AWS::Route53::HostedZone'),
  awsIoTEventsInput('AWS::IoTEvents::Input'),
  awsIoTEventsDetectorModel('AWS::IoTEvents::DetectorModel'),
  awsIoTEventsAlarmModel('AWS::IoTEvents::AlarmModel'),
  awsServiceDiscoveryHttpNamespace('AWS::ServiceDiscovery::HttpNamespace'),
  awsEventsEventBus('AWS::Events::EventBus'),
  awsImageBuilderContainerRecipe('AWS::ImageBuilder::ContainerRecipe'),
  awsImageBuilderDistributionConfiguration(
      'AWS::ImageBuilder::DistributionConfiguration'),
  awsImageBuilderInfrastructureConfiguration(
      'AWS::ImageBuilder::InfrastructureConfiguration'),
  awsDataSyncLocationObjectStorage('AWS::DataSync::LocationObjectStorage'),
  awsDataSyncLocationHDFS('AWS::DataSync::LocationHDFS'),
  awsGlueClassifier('AWS::Glue::Classifier'),
  awsRoute53RecoveryReadinessCell('AWS::Route53RecoveryReadiness::Cell'),
  awsRoute53RecoveryReadinessReadinessCheck(
      'AWS::Route53RecoveryReadiness::ReadinessCheck'),
  awsEcrRegistryPolicy('AWS::ECR::RegistryPolicy'),
  awsBackupReportPlan('AWS::Backup::ReportPlan'),
  awsLightsailCertificate('AWS::Lightsail::Certificate'),
  awsRumAppMonitor('AWS::RUM::AppMonitor'),
  awsEventsEndpoint('AWS::Events::Endpoint'),
  awsSesReceiptRuleSet('AWS::SES::ReceiptRuleSet'),
  awsEventsArchive('AWS::Events::Archive'),
  awsEventsApiDestination('AWS::Events::ApiDestination'),
  awsLightsailDisk('AWS::Lightsail::Disk'),
  awsFisExperimentTemplate('AWS::FIS::ExperimentTemplate'),
  awsDataSyncLocationFSxWindows('AWS::DataSync::LocationFSxWindows'),
  awsSesReceiptFilter('AWS::SES::ReceiptFilter'),
  awsGuardDutyFilter('AWS::GuardDuty::Filter'),
  awsSesTemplate('AWS::SES::Template'),
  awsAmazonMQBroker('AWS::AmazonMQ::Broker'),
  awsAppConfigEnvironment('AWS::AppConfig::Environment'),
  awsAppConfigConfigurationProfile('AWS::AppConfig::ConfigurationProfile'),
  awsCloud9EnvironmentEC2('AWS::Cloud9::EnvironmentEC2'),
  awsEventSchemasRegistry('AWS::EventSchemas::Registry'),
  awsEventSchemasRegistryPolicy('AWS::EventSchemas::RegistryPolicy'),
  awsEventSchemasDiscoverer('AWS::EventSchemas::Discoverer'),
  awsFraudDetectorLabel('AWS::FraudDetector::Label'),
  awsFraudDetectorEntityType('AWS::FraudDetector::EntityType'),
  awsFraudDetectorVariable('AWS::FraudDetector::Variable'),
  awsFraudDetectorOutcome('AWS::FraudDetector::Outcome'),
  awsIoTAuthorizer('AWS::IoT::Authorizer'),
  awsIoTSecurityProfile('AWS::IoT::SecurityProfile'),
  awsIoTRoleAlias('AWS::IoT::RoleAlias'),
  awsIoTDimension('AWS::IoT::Dimension'),
  awsIoTAnalyticsDatastore('AWS::IoTAnalytics::Datastore'),
  awsLightsailBucket('AWS::Lightsail::Bucket'),
  awsLightsailStaticIp('AWS::Lightsail::StaticIp'),
  awsMediaPackagePackagingGroup('AWS::MediaPackage::PackagingGroup'),
  awsRoute53RecoveryReadinessRecoveryGroup(
      'AWS::Route53RecoveryReadiness::RecoveryGroup'),
  awsResilienceHubResiliencyPolicy('AWS::ResilienceHub::ResiliencyPolicy'),
  awsTransferWorkflow('AWS::Transfer::Workflow'),
  awsEksIdentityProviderConfig('AWS::EKS::IdentityProviderConfig'),
  awsEksAddon('AWS::EKS::Addon'),
  awsGlueMLTransform('AWS::Glue::MLTransform'),
  awsIoTPolicy('AWS::IoT::Policy'),
  awsIoTMitigationAction('AWS::IoT::MitigationAction'),
  awsIoTTwinMakerWorkspace('AWS::IoTTwinMaker::Workspace'),
  awsIoTTwinMakerEntity('AWS::IoTTwinMaker::Entity'),
  awsIoTAnalyticsDataset('AWS::IoTAnalytics::Dataset'),
  awsIoTAnalyticsPipeline('AWS::IoTAnalytics::Pipeline'),
  awsIoTAnalyticsChannel('AWS::IoTAnalytics::Channel'),
  awsIoTSiteWiseDashboard('AWS::IoTSiteWise::Dashboard'),
  awsIoTSiteWiseProject('AWS::IoTSiteWise::Project'),
  awsIoTSiteWisePortal('AWS::IoTSiteWise::Portal'),
  awsIoTSiteWiseAssetModel('AWS::IoTSiteWise::AssetModel'),
  awsIvsChannel('AWS::IVS::Channel'),
  awsIvsRecordingConfiguration('AWS::IVS::RecordingConfiguration'),
  awsIvsPlaybackKeyPair('AWS::IVS::PlaybackKeyPair'),
  awsKinesisAnalyticsV2Application('AWS::KinesisAnalyticsV2::Application'),
  awsRdsGlobalCluster('AWS::RDS::GlobalCluster'),
  awsS3MultiRegionAccessPoint('AWS::S3::MultiRegionAccessPoint'),
  awsDeviceFarmTestGridProject('AWS::DeviceFarm::TestGridProject'),
  awsBudgetsBudgetsAction('AWS::Budgets::BudgetsAction'),
  awsLexBot('AWS::Lex::Bot'),
  awsCodeGuruReviewerRepositoryAssociation(
      'AWS::CodeGuruReviewer::RepositoryAssociation'),
  awsIoTCustomMetric('AWS::IoT::CustomMetric'),
  awsRoute53ResolverFirewallDomainList(
      'AWS::Route53Resolver::FirewallDomainList'),
  awsRoboMakerRobotApplicationVersion(
      'AWS::RoboMaker::RobotApplicationVersion'),
  awsEc2TrafficMirrorSession('AWS::EC2::TrafficMirrorSession'),
  awsIoTSiteWiseGateway('AWS::IoTSiteWise::Gateway'),
  awsLexBotAlias('AWS::Lex::BotAlias'),
  awsLookoutMetricsAlert('AWS::LookoutMetrics::Alert'),
  awsIoTAccountAuditConfiguration('AWS::IoT::AccountAuditConfiguration'),
  awsEc2TrafficMirrorTarget('AWS::EC2::TrafficMirrorTarget'),
  awsS3StorageLens('AWS::S3::StorageLens'),
  awsIoTScheduledAudit('AWS::IoT::ScheduledAudit'),
  awsEventsConnection('AWS::Events::Connection'),
  awsEventSchemasSchema('AWS::EventSchemas::Schema'),
  awsMediaPackagePackagingConfiguration(
      'AWS::MediaPackage::PackagingConfiguration'),
  awsKinesisVideoSignalingChannel('AWS::KinesisVideo::SignalingChannel'),
  awsAppStreamDirectoryConfig('AWS::AppStream::DirectoryConfig'),
  awsLookoutVisionProject('AWS::LookoutVision::Project'),
  awsRoute53RecoveryControlCluster('AWS::Route53RecoveryControl::Cluster'),
  awsRoute53RecoveryControlSafetyRule(
      'AWS::Route53RecoveryControl::SafetyRule'),
  awsRoute53RecoveryControlControlPanel(
      'AWS::Route53RecoveryControl::ControlPanel'),
  awsRoute53RecoveryControlRoutingControl(
      'AWS::Route53RecoveryControl::RoutingControl'),
  awsRoute53RecoveryReadinessResourceSet(
      'AWS::Route53RecoveryReadiness::ResourceSet'),
  awsRoboMakerSimulationApplication('AWS::RoboMaker::SimulationApplication'),
  awsRoboMakerRobotApplication('AWS::RoboMaker::RobotApplication'),
  awsHealthLakeFHIRDatastore('AWS::HealthLake::FHIRDatastore'),
  awsPinpointSegment('AWS::Pinpoint::Segment'),
  awsPinpointApplicationSettings('AWS::Pinpoint::ApplicationSettings'),
  awsEventsRule('AWS::Events::Rule'),
  awsEc2DHCPOptions('AWS::EC2::DHCPOptions'),
  awsEc2NetworkInsightsPath('AWS::EC2::NetworkInsightsPath'),
  awsEc2TrafficMirrorFilter('AWS::EC2::TrafficMirrorFilter'),
  awsEc2Ipam('AWS::EC2::IPAM'),
  awsIoTTwinMakerScene('AWS::IoTTwinMaker::Scene'),
  awsNetworkManagerTransitGatewayRegistration(
      'AWS::NetworkManager::TransitGatewayRegistration'),
  awsCustomerProfilesDomain('AWS::CustomerProfiles::Domain'),
  awsAutoScalingWarmPool('AWS::AutoScaling::WarmPool'),
  awsConnectPhoneNumber('AWS::Connect::PhoneNumber'),
  awsAppConfigDeploymentStrategy('AWS::AppConfig::DeploymentStrategy'),
  awsAppFlowFlow('AWS::AppFlow::Flow'),
  awsAuditManagerAssessment('AWS::AuditManager::Assessment'),
  awsCloudWatchMetricStream('AWS::CloudWatch::MetricStream'),
  awsDeviceFarmInstanceProfile('AWS::DeviceFarm::InstanceProfile'),
  awsDeviceFarmProject('AWS::DeviceFarm::Project'),
  awsEc2EC2Fleet('AWS::EC2::EC2Fleet'),
  awsEc2SubnetRouteTableAssociation('AWS::EC2::SubnetRouteTableAssociation'),
  awsEcrPullThroughCacheRule('AWS::ECR::PullThroughCacheRule'),
  awsGroundStationConfig('AWS::GroundStation::Config'),
  awsImageBuilderImagePipeline('AWS::ImageBuilder::ImagePipeline'),
  awsIoTFleetMetric('AWS::IoT::FleetMetric'),
  awsIoTWirelessServiceProfile('AWS::IoTWireless::ServiceProfile'),
  awsNetworkManagerDevice('AWS::NetworkManager::Device'),
  awsNetworkManagerGlobalNetwork('AWS::NetworkManager::GlobalNetwork'),
  awsNetworkManagerLink('AWS::NetworkManager::Link'),
  awsNetworkManagerSite('AWS::NetworkManager::Site'),
  awsPanoramaPackage('AWS::Panorama::Package'),
  awsPinpointApp('AWS::Pinpoint::App'),
  awsRedshiftScheduledAction('AWS::Redshift::ScheduledAction'),
  awsRoute53ResolverFirewallRuleGroupAssociation(
      'AWS::Route53Resolver::FirewallRuleGroupAssociation'),
  awsSageMakerAppImageConfig('AWS::SageMaker::AppImageConfig'),
  awsSageMakerImage('AWS::SageMaker::Image'),
  awsEcsTaskSet('AWS::ECS::TaskSet'),
  awsCassandraKeyspace('AWS::Cassandra::Keyspace'),
  awsSignerSigningProfile('AWS::Signer::SigningProfile'),
  awsAmplifyApp('AWS::Amplify::App'),
  awsAppMeshVirtualNode('AWS::AppMesh::VirtualNode'),
  awsAppMeshVirtualService('AWS::AppMesh::VirtualService'),
  awsAppRunnerVpcConnector('AWS::AppRunner::VpcConnector'),
  awsAppStreamApplication('AWS::AppStream::Application'),
  awsCodeArtifactRepository('AWS::CodeArtifact::Repository'),
  awsEc2PrefixList('AWS::EC2::PrefixList'),
  awsEc2SpotFleet('AWS::EC2::SpotFleet'),
  awsEvidentlyProject('AWS::Evidently::Project'),
  awsForecastDataset('AWS::Forecast::Dataset'),
  awsIamSAMLProvider('AWS::IAM::SAMLProvider'),
  awsIamServerCertificate('AWS::IAM::ServerCertificate'),
  awsPinpointCampaign('AWS::Pinpoint::Campaign'),
  awsPinpointInAppTemplate('AWS::Pinpoint::InAppTemplate'),
  awsSageMakerDomain('AWS::SageMaker::Domain'),
  awsTransferAgreement('AWS::Transfer::Agreement'),
  awsTransferConnector('AWS::Transfer::Connector'),
  awsKinesisFirehoseDeliveryStream('AWS::KinesisFirehose::DeliveryStream'),
  awsAmplifyBranch('AWS::Amplify::Branch'),
  awsAppIntegrationsEventIntegration('AWS::AppIntegrations::EventIntegration'),
  awsAppMeshRoute('AWS::AppMesh::Route'),
  awsAthenaPreparedStatement('AWS::Athena::PreparedStatement'),
  awsEc2IPAMScope('AWS::EC2::IPAMScope'),
  awsEvidentlyLaunch('AWS::Evidently::Launch'),
  awsForecastDatasetGroup('AWS::Forecast::DatasetGroup'),
  awsGreengrassV2ComponentVersion('AWS::GreengrassV2::ComponentVersion'),
  awsGroundStationMissionProfile('AWS::GroundStation::MissionProfile'),
  awsMediaConnectFlowEntitlement('AWS::MediaConnect::FlowEntitlement'),
  awsMediaConnectFlowVpcInterface('AWS::MediaConnect::FlowVpcInterface'),
  awsMediaTailorPlaybackConfiguration(
      'AWS::MediaTailor::PlaybackConfiguration'),
  awsMskConfiguration('AWS::MSK::Configuration'),
  awsPersonalizeDataset('AWS::Personalize::Dataset'),
  awsPersonalizeSchema('AWS::Personalize::Schema'),
  awsPersonalizeSolution('AWS::Personalize::Solution'),
  awsPinpointEmailTemplate('AWS::Pinpoint::EmailTemplate'),
  awsPinpointEventStream('AWS::Pinpoint::EventStream'),
  awsResilienceHubApp('AWS::ResilienceHub::App'),
  awsAcmpcaCertificateAuthority('AWS::ACMPCA::CertificateAuthority'),
  awsAppConfigHostedConfigurationVersion(
      'AWS::AppConfig::HostedConfigurationVersion'),
  awsAppMeshVirtualGateway('AWS::AppMesh::VirtualGateway'),
  awsAppMeshVirtualRouter('AWS::AppMesh::VirtualRouter'),
  awsAppRunnerService('AWS::AppRunner::Service'),
  awsCustomerProfilesObjectType('AWS::CustomerProfiles::ObjectType'),
  awsDmsEndpoint('AWS::DMS::Endpoint'),
  awsEc2CapacityReservation('AWS::EC2::CapacityReservation'),
  awsEc2ClientVpnEndpoint('AWS::EC2::ClientVpnEndpoint'),
  awsKendraIndex('AWS::Kendra::Index'),
  awsKinesisVideoStream('AWS::KinesisVideo::Stream'),
  awsLogsDestination('AWS::Logs::Destination'),
  awsPinpointEmailChannel('AWS::Pinpoint::EmailChannel'),
  awsS3AccessPoint('AWS::S3::AccessPoint'),
  awsNetworkManagerCustomerGatewayAssociation(
      'AWS::NetworkManager::CustomerGatewayAssociation'),
  awsNetworkManagerLinkAssociation('AWS::NetworkManager::LinkAssociation'),
  awsIoTWirelessMulticastGroup('AWS::IoTWireless::MulticastGroup'),
  awsPersonalizeDatasetGroup('AWS::Personalize::DatasetGroup'),
  awsIoTTwinMakerComponentType('AWS::IoTTwinMaker::ComponentType'),
  awsCodeBuildReportGroup('AWS::CodeBuild::ReportGroup'),
  awsSageMakerFeatureGroup('AWS::SageMaker::FeatureGroup'),
  awsMskBatchScramSecret('AWS::MSK::BatchScramSecret'),
  awsAppStreamStack('AWS::AppStream::Stack'),
  awsIoTJobTemplate('AWS::IoT::JobTemplate'),
  awsIoTWirelessFuotaTask('AWS::IoTWireless::FuotaTask'),
  awsIoTProvisioningTemplate('AWS::IoT::ProvisioningTemplate'),
  awsInspectorV2Filter('AWS::InspectorV2::Filter'),
  awsRoute53ResolverResolverQueryLoggingConfigAssociation(
      'AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation'),
  awsServiceDiscoveryInstance('AWS::ServiceDiscovery::Instance'),
  awsTransferCertificate('AWS::Transfer::Certificate'),
  awsMediaConnectFlowSource('AWS::MediaConnect::FlowSource'),
  awsApsRuleGroupsNamespace('AWS::APS::RuleGroupsNamespace'),
  awsCodeGuruProfilerProfilingGroup('AWS::CodeGuruProfiler::ProfilingGroup'),
  awsRoute53ResolverResolverQueryLoggingConfig(
      'AWS::Route53Resolver::ResolverQueryLoggingConfig'),
  awsBatchSchedulingPolicy('AWS::Batch::SchedulingPolicy'),
  awsAcmpcaCertificateAuthorityActivation(
      'AWS::ACMPCA::CertificateAuthorityActivation'),
  awsAppMeshGatewayRoute('AWS::AppMesh::GatewayRoute'),
  awsAppMeshMesh('AWS::AppMesh::Mesh'),
  awsConnectInstance('AWS::Connect::Instance'),
  awsConnectQuickConnect('AWS::Connect::QuickConnect'),
  awsEc2CarrierGateway('AWS::EC2::CarrierGateway'),
  awsEc2IPAMPool('AWS::EC2::IPAMPool'),
  awsEc2TransitGatewayConnect('AWS::EC2::TransitGatewayConnect'),
  awsEc2TransitGatewayMulticastDomain(
      'AWS::EC2::TransitGatewayMulticastDomain'),
  awsEcsCapacityProvider('AWS::ECS::CapacityProvider'),
  awsIamInstanceProfile('AWS::IAM::InstanceProfile'),
  awsIoTCACertificate('AWS::IoT::CACertificate'),
  awsIoTTwinMakerSyncJob('AWS::IoTTwinMaker::SyncJob'),
  awsKafkaConnectConnector('AWS::KafkaConnect::Connector'),
  awsLambdaCodeSigningConfig('AWS::Lambda::CodeSigningConfig'),
  awsNetworkManagerConnectPeer('AWS::NetworkManager::ConnectPeer'),
  awsResourceExplorer2Index('AWS::ResourceExplorer2::Index'),
  awsAppStreamFleet('AWS::AppStream::Fleet'),
  awsCognitoUserPool('AWS::Cognito::UserPool'),
  awsCognitoUserPoolClient('AWS::Cognito::UserPoolClient'),
  awsCognitoUserPoolGroup('AWS::Cognito::UserPoolGroup'),
  awsEc2NetworkInsightsAccessScope('AWS::EC2::NetworkInsightsAccessScope'),
  awsEc2NetworkInsightsAnalysis('AWS::EC2::NetworkInsightsAnalysis'),
  awsGrafanaWorkspace('AWS::Grafana::Workspace'),
  awsGroundStationDataflowEndpointGroup(
      'AWS::GroundStation::DataflowEndpointGroup'),
  awsImageBuilderImageRecipe('AWS::ImageBuilder::ImageRecipe'),
  awsKmsAlias('AWS::KMS::Alias'),
  awsM2Environment('AWS::M2::Environment'),
  awsQuickSightDataSource('AWS::QuickSight::DataSource'),
  awsQuickSightTemplate('AWS::QuickSight::Template'),
  awsQuickSightTheme('AWS::QuickSight::Theme'),
  awsRdsOptionGroup('AWS::RDS::OptionGroup'),
  awsRedshiftEndpointAccess('AWS::Redshift::EndpointAccess'),
  awsRoute53ResolverFirewallRuleGroup(
      'AWS::Route53Resolver::FirewallRuleGroup'),
  awsSsmDocument('AWS::SSM::Document'),
  ;

  final String value;

  const ResourceType(this.value);

  static ResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceType'));
}

/// The dynamic value of the resource.
class ResourceValue {
  /// The value is a resource ID.
  final ResourceValueType value;

  ResourceValue({
    required this.value,
  });

  factory ResourceValue.fromJson(Map<String, dynamic> json) {
    return ResourceValue(
      value: ResourceValueType.fromString((json['Value'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'Value': value.value,
    };
  }
}

enum ResourceValueType {
  resourceId('RESOURCE_ID'),
  ;

  final String value;

  const ResourceValueType(this.value);

  static ResourceValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceValueType'));
}

/// An object with the name of the retention configuration and the retention
/// period in days. The object stores the configuration for data retention in
/// Config.
class RetentionConfiguration {
  /// The name of the retention configuration object.
  final String name;

  /// Number of days Config stores your historical information.
  /// <note>
  /// Currently, only applicable to the configuration item history.
  /// </note>
  final int retentionPeriodInDays;

  RetentionConfiguration({
    required this.name,
    required this.retentionPeriodInDays,
  });

  factory RetentionConfiguration.fromJson(Map<String, dynamic> json) {
    return RetentionConfiguration(
      name: json['Name'] as String,
      retentionPeriodInDays: json['RetentionPeriodInDays'] as int,
    );
  }
}

/// Defines which resources trigger an evaluation for an Config rule. The scope
/// can include one or more resource types, a combination of a tag key and
/// value, or a combination of one resource type and one resource ID. Specify a
/// scope to constrain which resources trigger an evaluation for a rule.
/// Otherwise, evaluations for the rule are triggered when any resource in your
/// recording group changes in configuration.
class Scope {
  /// The ID of the only Amazon Web Services resource that you want to trigger an
  /// evaluation for the rule. If you specify a resource ID, you must specify one
  /// resource type for <code>ComplianceResourceTypes</code>.
  final String? complianceResourceId;

  /// The resource types of only those Amazon Web Services resources that you want
  /// to trigger an evaluation for the rule. You can only specify one type if you
  /// also specify a resource ID for <code>ComplianceResourceId</code>.
  final List<String>? complianceResourceTypes;

  /// The tag key that is applied to only those Amazon Web Services resources that
  /// you want to trigger an evaluation for the rule.
  final String? tagKey;

  /// The tag value applied to only those Amazon Web Services resources that you
  /// want to trigger an evaluation for the rule. If you specify a value for
  /// <code>TagValue</code>, you must also specify a value for
  /// <code>TagKey</code>.
  final String? tagValue;

  Scope({
    this.complianceResourceId,
    this.complianceResourceTypes,
    this.tagKey,
    this.tagValue,
  });

  factory Scope.fromJson(Map<String, dynamic> json) {
    return Scope(
      complianceResourceId: json['ComplianceResourceId'] as String?,
      complianceResourceTypes: (json['ComplianceResourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tagKey: json['TagKey'] as String?,
      tagValue: json['TagValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceResourceId = this.complianceResourceId;
    final complianceResourceTypes = this.complianceResourceTypes;
    final tagKey = this.tagKey;
    final tagValue = this.tagValue;
    return {
      if (complianceResourceId != null)
        'ComplianceResourceId': complianceResourceId,
      if (complianceResourceTypes != null)
        'ComplianceResourceTypes': complianceResourceTypes,
      if (tagKey != null) 'TagKey': tagKey,
      if (tagValue != null) 'TagValue': tagValue,
    };
  }
}

class SelectAggregateResourceConfigResponse {
  /// The nextToken string returned in a previous request that you use to request
  /// the next page of results in a paginated response.
  final String? nextToken;
  final QueryInfo? queryInfo;

  /// Returns the results for the SQL query.
  final List<String>? results;

  SelectAggregateResourceConfigResponse({
    this.nextToken,
    this.queryInfo,
    this.results,
  });

  factory SelectAggregateResourceConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return SelectAggregateResourceConfigResponse(
      nextToken: json['NextToken'] as String?,
      queryInfo: json['QueryInfo'] != null
          ? QueryInfo.fromJson(json['QueryInfo'] as Map<String, dynamic>)
          : null,
      results:
          (json['Results'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

class SelectResourceConfigResponse {
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  final String? nextToken;

  /// Returns the <code>QueryInfo</code> object.
  final QueryInfo? queryInfo;

  /// Returns the results for the SQL query.
  final List<String>? results;

  SelectResourceConfigResponse({
    this.nextToken,
    this.queryInfo,
    this.results,
  });

  factory SelectResourceConfigResponse.fromJson(Map<String, dynamic> json) {
    return SelectResourceConfigResponse(
      nextToken: json['NextToken'] as String?,
      queryInfo: json['QueryInfo'] != null
          ? QueryInfo.fromJson(json['QueryInfo'] as Map<String, dynamic>)
          : null,
      results:
          (json['Results'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

enum SortBy {
  score('SCORE'),
  ;

  final String value;

  const SortBy(this.value);

  static SortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum SortBy'));
}

enum SortOrder {
  ascending('ASCENDING'),
  descending('DESCENDING'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

/// Provides the CustomPolicyDetails, the rule owner (<code>Amazon Web
/// Services</code> for managed rules, <code>CUSTOM_POLICY</code> for Custom
/// Policy rules, and <code>CUSTOM_LAMBDA</code> for Custom Lambda rules), the
/// rule identifier, and the events that cause the evaluation of your Amazon Web
/// Services resources.
class Source {
  /// Indicates whether Amazon Web Services or the customer owns and manages the
  /// Config rule.
  ///
  /// Config Managed Rules are predefined rules owned by Amazon Web Services. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">Config
  /// Managed Rules</a> in the <i>Config developer guide</i>.
  ///
  /// Config Custom Rules are rules that you can develop either with Guard
  /// (<code>CUSTOM_POLICY</code>) or Lambda (<code>CUSTOM_LAMBDA</code>). For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_develop-rules.html">Config
  /// Custom Rules </a> in the <i>Config developer guide</i>.
  final Owner owner;

  /// Provides the runtime system, policy definition, and whether debug logging is
  /// enabled. Required when owner is set to <code>CUSTOM_POLICY</code>.
  final CustomPolicyDetails? customPolicyDetails;

  /// Provides the source and the message types that cause Config to evaluate your
  /// Amazon Web Services resources against a rule. It also provides the frequency
  /// with which you want Config to run evaluations for the rule if the trigger
  /// type is periodic.
  ///
  /// If the owner is set to <code>CUSTOM_POLICY</code>, the only acceptable
  /// values for the Config rule trigger message type are
  /// <code>ConfigurationItemChangeNotification</code> and
  /// <code>OversizedConfigurationItemChangeNotification</code>.
  final List<SourceDetail>? sourceDetails;

  /// For Config Managed rules, a predefined identifier from a list. For example,
  /// <code>IAM_PASSWORD_POLICY</code> is a managed rule. To reference a managed
  /// rule, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html">List
  /// of Config Managed Rules</a>.
  ///
  /// For Config Custom Lambda rules, the identifier is the Amazon Resource Name
  /// (ARN) of the rule's Lambda function, such as
  /// <code>arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name</code>.
  ///
  /// For Config Custom Policy rules, this field will be ignored.
  final String? sourceIdentifier;

  Source({
    required this.owner,
    this.customPolicyDetails,
    this.sourceDetails,
    this.sourceIdentifier,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      owner: Owner.fromString((json['Owner'] as String)),
      customPolicyDetails: json['CustomPolicyDetails'] != null
          ? CustomPolicyDetails.fromJson(
              json['CustomPolicyDetails'] as Map<String, dynamic>)
          : null,
      sourceDetails: (json['SourceDetails'] as List?)
          ?.nonNulls
          .map((e) => SourceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceIdentifier: json['SourceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final customPolicyDetails = this.customPolicyDetails;
    final sourceDetails = this.sourceDetails;
    final sourceIdentifier = this.sourceIdentifier;
    return {
      'Owner': owner.value,
      if (customPolicyDetails != null)
        'CustomPolicyDetails': customPolicyDetails,
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
    };
  }
}

/// Provides the source and the message types that trigger Config to evaluate
/// your Amazon Web Services resources against a rule. It also provides the
/// frequency with which you want Config to run evaluations for the rule if the
/// trigger type is periodic. You can specify the parameter values for
/// <code>SourceDetail</code> only for custom rules.
class SourceDetail {
  /// The source of the event, such as an Amazon Web Services service, that
  /// triggers Config to evaluate your Amazon Web Services resources.
  final EventSource? eventSource;

  /// The frequency at which you want Config to run evaluations for a custom rule
  /// with a periodic trigger. If you specify a value for
  /// <code>MaximumExecutionFrequency</code>, then <code>MessageType</code> must
  /// use the <code>ScheduledNotification</code> value.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  ///
  /// Based on the valid value you choose, Config runs evaluations once for each
  /// valid value. For example, if you choose <code>Three_Hours</code>, Config
  /// runs evaluations once every three hours. In this case,
  /// <code>Three_Hours</code> is the frequency of this rule.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The type of notification that triggers Config to run an evaluation for a
  /// rule. You can specify the following notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Triggers an evaluation
  /// when Config delivers a configuration item as a result of a resource change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Triggers an
  /// evaluation when Config delivers an oversized configuration item. Config may
  /// generate this notification type when a resource changes and the notification
  /// exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// <li>
  /// <code>ScheduledNotification</code> - Triggers a periodic evaluation at the
  /// frequency specified for <code>MaximumExecutionFrequency</code>.
  /// </li>
  /// <li>
  /// <code>ConfigurationSnapshotDeliveryCompleted</code> - Triggers a periodic
  /// evaluation when Config delivers a configuration snapshot.
  /// </li>
  /// </ul>
  /// If you want your custom rule to be triggered by configuration changes,
  /// specify two SourceDetail objects, one for
  /// <code>ConfigurationItemChangeNotification</code> and one for
  /// <code>OversizedConfigurationItemChangeNotification</code>.
  final MessageType? messageType;

  SourceDetail({
    this.eventSource,
    this.maximumExecutionFrequency,
    this.messageType,
  });

  factory SourceDetail.fromJson(Map<String, dynamic> json) {
    return SourceDetail(
      eventSource:
          (json['EventSource'] as String?)?.let(EventSource.fromString),
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.let(MaximumExecutionFrequency.fromString),
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSource = this.eventSource;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final messageType = this.messageType;
    return {
      if (eventSource != null) 'EventSource': eventSource.value,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.value,
      if (messageType != null) 'MessageType': messageType.value,
    };
  }
}

/// Amazon Web Services Systems Manager (SSM) specific remediation controls.
class SsmControls {
  /// The maximum percentage of remediation actions allowed to run in parallel on
  /// the non-compliant resources for that specific rule. You can specify a
  /// percentage, such as 10%. The default value is 10.
  final int? concurrentExecutionRatePercentage;

  /// The percentage of errors that are allowed before SSM stops running
  /// automations on non-compliant resources for that specific rule. You can
  /// specify a percentage of errors, for example 10%. If you do not specifiy a
  /// percentage, the default is 50%. For example, if you set the ErrorPercentage
  /// to 40% for 10 non-compliant resources, then SSM stops running the
  /// automations when the fifth error is received.
  final int? errorPercentage;

  SsmControls({
    this.concurrentExecutionRatePercentage,
    this.errorPercentage,
  });

  factory SsmControls.fromJson(Map<String, dynamic> json) {
    return SsmControls(
      concurrentExecutionRatePercentage:
          json['ConcurrentExecutionRatePercentage'] as int?,
      errorPercentage: json['ErrorPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final concurrentExecutionRatePercentage =
        this.concurrentExecutionRatePercentage;
    final errorPercentage = this.errorPercentage;
    return {
      if (concurrentExecutionRatePercentage != null)
        'ConcurrentExecutionRatePercentage': concurrentExecutionRatePercentage,
      if (errorPercentage != null) 'ErrorPercentage': errorPercentage,
    };
  }
}

/// The output when you start the evaluation for the specified Config rule.
class StartConfigRulesEvaluationResponse {
  StartConfigRulesEvaluationResponse();

  factory StartConfigRulesEvaluationResponse.fromJson(Map<String, dynamic> _) {
    return StartConfigRulesEvaluationResponse();
  }
}

class StartRemediationExecutionResponse {
  /// For resources that have failed to start execution, the API returns a
  /// resource key object.
  final List<ResourceKey>? failedItems;

  /// Returns a failure message. For example, the resource is already compliant.
  final String? failureMessage;

  StartRemediationExecutionResponse({
    this.failedItems,
    this.failureMessage,
  });

  factory StartRemediationExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartRemediationExecutionResponse(
      failedItems: (json['FailedItems'] as List?)
          ?.nonNulls
          .map((e) => ResourceKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }
}

class StartResourceEvaluationResponse {
  /// A unique ResourceEvaluationId that is associated with a single execution.
  final String? resourceEvaluationId;

  StartResourceEvaluationResponse({
    this.resourceEvaluationId,
  });

  factory StartResourceEvaluationResponse.fromJson(Map<String, dynamic> json) {
    return StartResourceEvaluationResponse(
      resourceEvaluationId: json['ResourceEvaluationId'] as String?,
    );
  }
}

/// The static value of the resource.
class StaticValue {
  /// A list of values. For example, the ARN of the assumed role.
  final List<String> values;

  StaticValue({
    required this.values,
  });

  factory StaticValue.fromJson(Map<String, dynamic> json) {
    return StaticValue(
      values:
          (json['Values'] as List).nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      'Values': values,
    };
  }
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization Config rule.
class StatusDetailFilters {
  /// The 12-digit account ID of the member account within an organization.
  final String? accountId;

  /// Indicates deployment status for Config rule in the member account. When
  /// management account calls <code>PutOrganizationConfigRule</code> action for
  /// the first time, Config rule status is created in the member account. When
  /// management account calls <code>PutOrganizationConfigRule</code> action for
  /// the second time, Config rule status is updated in the member account. Config
  /// rule status is deleted when the management account deletes
  /// <code>OrganizationConfigRule</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when Config rule has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when Config rule is being created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when Config rule creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when Config rule deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when Config rule is being deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when Config rule has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when Config rule has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when Config rule is being updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when Config rule deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final MemberAccountRuleStatus? memberAccountRuleStatus;

  StatusDetailFilters({
    this.accountId,
    this.memberAccountRuleStatus,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final memberAccountRuleStatus = this.memberAccountRuleStatus;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (memberAccountRuleStatus != null)
        'MemberAccountRuleStatus': memberAccountRuleStatus.value,
    };
  }
}

/// Provides the details of a stored query.
class StoredQuery {
  /// The name of the query.
  final String queryName;

  /// A unique description for the query.
  final String? description;

  /// The expression of the query. For example, <code>SELECT resourceId,
  /// resourceType,
  /// supplementaryConfiguration.BucketVersioningConfiguration.status WHERE
  /// resourceType = 'AWS::S3::Bucket' AND
  /// supplementaryConfiguration.BucketVersioningConfiguration.status =
  /// 'Off'.</code>
  final String? expression;

  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
  final String? queryArn;

  /// The ID of the query.
  final String? queryId;

  StoredQuery({
    required this.queryName,
    this.description,
    this.expression,
    this.queryArn,
    this.queryId,
  });

  factory StoredQuery.fromJson(Map<String, dynamic> json) {
    return StoredQuery(
      queryName: json['QueryName'] as String,
      description: json['Description'] as String?,
      expression: json['Expression'] as String?,
      queryArn: json['QueryArn'] as String?,
      queryId: json['QueryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryName = this.queryName;
    final description = this.description;
    final expression = this.expression;
    final queryArn = this.queryArn;
    final queryId = this.queryId;
    return {
      'QueryName': queryName,
      if (description != null) 'Description': description,
      if (expression != null) 'Expression': expression,
      if (queryArn != null) 'QueryArn': queryArn,
      if (queryId != null) 'QueryId': queryId,
    };
  }
}

/// Returns details of a specific query.
class StoredQueryMetadata {
  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
  final String queryArn;

  /// The ID of the query.
  final String queryId;

  /// The name of the query.
  final String queryName;

  /// A unique description for the query.
  final String? description;

  StoredQueryMetadata({
    required this.queryArn,
    required this.queryId,
    required this.queryName,
    this.description,
  });

  factory StoredQueryMetadata.fromJson(Map<String, dynamic> json) {
    return StoredQueryMetadata(
      queryArn: json['QueryArn'] as String,
      queryId: json['QueryId'] as String,
      queryName: json['QueryName'] as String,
      description: json['Description'] as String?,
    );
  }
}

/// The tags for the resource. The metadata that you apply to a resource to help
/// you categorize and organize them. Each tag consists of a key and an optional
/// value, both of which you define. Tag keys can have a maximum character
/// length of 128 characters, and tag values can have a maximum length of 256
/// characters.
class Tag {
  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? key;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
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

/// This API allows you to create a conformance pack template with an Amazon Web
/// Services Systems Manager document (SSM document). To deploy a conformance
/// pack using an SSM document, first create an SSM document with conformance
/// pack content, and then provide the <code>DocumentName</code> in the <a
/// href="https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html">PutConformancePack
/// API</a>. You can also provide the <code>DocumentVersion</code>.
///
/// The <code>TemplateSSMDocumentDetails</code> object contains the name of the
/// SSM document and the version of the SSM document.
class TemplateSSMDocumentDetails {
  /// The name or Amazon Resource Name (ARN) of the SSM document to use to create
  /// a conformance pack. If you use the document name, Config checks only your
  /// account and Amazon Web Services Region for the SSM document.
  final String documentName;

  /// The version of the SSM document to use to create a conformance pack. By
  /// default, Config uses the latest version.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? documentVersion;

  TemplateSSMDocumentDetails({
    required this.documentName,
    this.documentVersion,
  });

  factory TemplateSSMDocumentDetails.fromJson(Map<String, dynamic> json) {
    return TemplateSSMDocumentDetails(
      documentName: json['DocumentName'] as String,
      documentVersion: json['DocumentVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentName = this.documentName;
    final documentVersion = this.documentVersion;
    return {
      'DocumentName': documentName,
      if (documentVersion != null) 'DocumentVersion': documentVersion,
    };
  }
}

/// Filters evaluation results based on start and end times.
class TimeWindow {
  /// The end time of an execution. The end time must be after the start date.
  final DateTime? endTime;

  /// The start time of an execution.
  final DateTime? startTime;

  TimeWindow({
    this.endTime,
    this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class ConformancePackTemplateValidationException
    extends _s.GenericAwsException {
  ConformancePackTemplateValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConformancePackTemplateValidationException',
            message: message);
}

class IdempotentParameterMismatch extends _s.GenericAwsException {
  IdempotentParameterMismatch({String? type, String? message})
      : super(
            type: type, code: 'IdempotentParameterMismatch', message: message);
}

class InsufficientDeliveryPolicyException extends _s.GenericAwsException {
  InsufficientDeliveryPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDeliveryPolicyException',
            message: message);
}

class InsufficientPermissionsException extends _s.GenericAwsException {
  InsufficientPermissionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientPermissionsException',
            message: message);
}

class InvalidConfigurationRecorderNameException extends _s.GenericAwsException {
  InvalidConfigurationRecorderNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationRecorderNameException',
            message: message);
}

class InvalidDeliveryChannelNameException extends _s.GenericAwsException {
  InvalidDeliveryChannelNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeliveryChannelNameException',
            message: message);
}

class InvalidExpressionException extends _s.GenericAwsException {
  InvalidExpressionException({String? type, String? message})
      : super(type: type, code: 'InvalidExpressionException', message: message);
}

class InvalidLimitException extends _s.GenericAwsException {
  InvalidLimitException({String? type, String? message})
      : super(type: type, code: 'InvalidLimitException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRecordingGroupException extends _s.GenericAwsException {
  InvalidRecordingGroupException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRecordingGroupException',
            message: message);
}

class InvalidResultTokenException extends _s.GenericAwsException {
  InvalidResultTokenException({String? type, String? message})
      : super(
            type: type, code: 'InvalidResultTokenException', message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String? type, String? message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class InvalidS3KeyPrefixException extends _s.GenericAwsException {
  InvalidS3KeyPrefixException({String? type, String? message})
      : super(
            type: type, code: 'InvalidS3KeyPrefixException', message: message);
}

class InvalidS3KmsKeyArnException extends _s.GenericAwsException {
  InvalidS3KmsKeyArnException({String? type, String? message})
      : super(
            type: type, code: 'InvalidS3KmsKeyArnException', message: message);
}

class InvalidSNSTopicARNException extends _s.GenericAwsException {
  InvalidSNSTopicARNException({String? type, String? message})
      : super(
            type: type, code: 'InvalidSNSTopicARNException', message: message);
}

class InvalidTimeRangeException extends _s.GenericAwsException {
  InvalidTimeRangeException({String? type, String? message})
      : super(type: type, code: 'InvalidTimeRangeException', message: message);
}

class LastDeliveryChannelDeleteFailedException extends _s.GenericAwsException {
  LastDeliveryChannelDeleteFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'LastDeliveryChannelDeleteFailedException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MaxActiveResourcesExceededException extends _s.GenericAwsException {
  MaxActiveResourcesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxActiveResourcesExceededException',
            message: message);
}

class MaxNumberOfConfigRulesExceededException extends _s.GenericAwsException {
  MaxNumberOfConfigRulesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfConfigRulesExceededException',
            message: message);
}

class MaxNumberOfConfigurationRecordersExceededException
    extends _s.GenericAwsException {
  MaxNumberOfConfigurationRecordersExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfConfigurationRecordersExceededException',
            message: message);
}

class MaxNumberOfConformancePacksExceededException
    extends _s.GenericAwsException {
  MaxNumberOfConformancePacksExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfConformancePacksExceededException',
            message: message);
}

class MaxNumberOfDeliveryChannelsExceededException
    extends _s.GenericAwsException {
  MaxNumberOfDeliveryChannelsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfDeliveryChannelsExceededException',
            message: message);
}

class MaxNumberOfOrganizationConfigRulesExceededException
    extends _s.GenericAwsException {
  MaxNumberOfOrganizationConfigRulesExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfOrganizationConfigRulesExceededException',
            message: message);
}

class MaxNumberOfOrganizationConformancePacksExceededException
    extends _s.GenericAwsException {
  MaxNumberOfOrganizationConformancePacksExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfOrganizationConformancePacksExceededException',
            message: message);
}

class MaxNumberOfRetentionConfigurationsExceededException
    extends _s.GenericAwsException {
  MaxNumberOfRetentionConfigurationsExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaxNumberOfRetentionConfigurationsExceededException',
            message: message);
}

class NoAvailableConfigurationRecorderException extends _s.GenericAwsException {
  NoAvailableConfigurationRecorderException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableConfigurationRecorderException',
            message: message);
}

class NoAvailableDeliveryChannelException extends _s.GenericAwsException {
  NoAvailableDeliveryChannelException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableDeliveryChannelException',
            message: message);
}

class NoAvailableOrganizationException extends _s.GenericAwsException {
  NoAvailableOrganizationException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableOrganizationException',
            message: message);
}

class NoRunningConfigurationRecorderException extends _s.GenericAwsException {
  NoRunningConfigurationRecorderException({String? type, String? message})
      : super(
            type: type,
            code: 'NoRunningConfigurationRecorderException',
            message: message);
}

class NoSuchBucketException extends _s.GenericAwsException {
  NoSuchBucketException({String? type, String? message})
      : super(type: type, code: 'NoSuchBucketException', message: message);
}

class NoSuchConfigRuleException extends _s.GenericAwsException {
  NoSuchConfigRuleException({String? type, String? message})
      : super(type: type, code: 'NoSuchConfigRuleException', message: message);
}

class NoSuchConfigRuleInConformancePackException
    extends _s.GenericAwsException {
  NoSuchConfigRuleInConformancePackException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchConfigRuleInConformancePackException',
            message: message);
}

class NoSuchConfigurationAggregatorException extends _s.GenericAwsException {
  NoSuchConfigurationAggregatorException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchConfigurationAggregatorException',
            message: message);
}

class NoSuchConfigurationRecorderException extends _s.GenericAwsException {
  NoSuchConfigurationRecorderException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchConfigurationRecorderException',
            message: message);
}

class NoSuchConformancePackException extends _s.GenericAwsException {
  NoSuchConformancePackException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchConformancePackException',
            message: message);
}

class NoSuchDeliveryChannelException extends _s.GenericAwsException {
  NoSuchDeliveryChannelException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchDeliveryChannelException',
            message: message);
}

class NoSuchOrganizationConfigRuleException extends _s.GenericAwsException {
  NoSuchOrganizationConfigRuleException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchOrganizationConfigRuleException',
            message: message);
}

class NoSuchOrganizationConformancePackException
    extends _s.GenericAwsException {
  NoSuchOrganizationConformancePackException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchOrganizationConformancePackException',
            message: message);
}

class NoSuchRemediationConfigurationException extends _s.GenericAwsException {
  NoSuchRemediationConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchRemediationConfigurationException',
            message: message);
}

class NoSuchRemediationExceptionException extends _s.GenericAwsException {
  NoSuchRemediationExceptionException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchRemediationExceptionException',
            message: message);
}

class NoSuchRetentionConfigurationException extends _s.GenericAwsException {
  NoSuchRetentionConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchRetentionConfigurationException',
            message: message);
}

class OrganizationAccessDeniedException extends _s.GenericAwsException {
  OrganizationAccessDeniedException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationAccessDeniedException',
            message: message);
}

class OrganizationAllFeaturesNotEnabledException
    extends _s.GenericAwsException {
  OrganizationAllFeaturesNotEnabledException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationAllFeaturesNotEnabledException',
            message: message);
}

class OrganizationConformancePackTemplateValidationException
    extends _s.GenericAwsException {
  OrganizationConformancePackTemplateValidationException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationConformancePackTemplateValidationException',
            message: message);
}

class OversizedConfigurationItemException extends _s.GenericAwsException {
  OversizedConfigurationItemException({String? type, String? message})
      : super(
            type: type,
            code: 'OversizedConfigurationItemException',
            message: message);
}

class RemediationInProgressException extends _s.GenericAwsException {
  RemediationInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'RemediationInProgressException',
            message: message);
}

class ResourceConcurrentModificationException extends _s.GenericAwsException {
  ResourceConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceConcurrentModificationException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotDiscoveredException extends _s.GenericAwsException {
  ResourceNotDiscoveredException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNotDiscoveredException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConformancePackTemplateValidationException': (type, message) =>
      ConformancePackTemplateValidationException(type: type, message: message),
  'IdempotentParameterMismatch': (type, message) =>
      IdempotentParameterMismatch(type: type, message: message),
  'InsufficientDeliveryPolicyException': (type, message) =>
      InsufficientDeliveryPolicyException(type: type, message: message),
  'InsufficientPermissionsException': (type, message) =>
      InsufficientPermissionsException(type: type, message: message),
  'InvalidConfigurationRecorderNameException': (type, message) =>
      InvalidConfigurationRecorderNameException(type: type, message: message),
  'InvalidDeliveryChannelNameException': (type, message) =>
      InvalidDeliveryChannelNameException(type: type, message: message),
  'InvalidExpressionException': (type, message) =>
      InvalidExpressionException(type: type, message: message),
  'InvalidLimitException': (type, message) =>
      InvalidLimitException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRecordingGroupException': (type, message) =>
      InvalidRecordingGroupException(type: type, message: message),
  'InvalidResultTokenException': (type, message) =>
      InvalidResultTokenException(type: type, message: message),
  'InvalidRoleException': (type, message) =>
      InvalidRoleException(type: type, message: message),
  'InvalidS3KeyPrefixException': (type, message) =>
      InvalidS3KeyPrefixException(type: type, message: message),
  'InvalidS3KmsKeyArnException': (type, message) =>
      InvalidS3KmsKeyArnException(type: type, message: message),
  'InvalidSNSTopicARNException': (type, message) =>
      InvalidSNSTopicARNException(type: type, message: message),
  'InvalidTimeRangeException': (type, message) =>
      InvalidTimeRangeException(type: type, message: message),
  'LastDeliveryChannelDeleteFailedException': (type, message) =>
      LastDeliveryChannelDeleteFailedException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MaxActiveResourcesExceededException': (type, message) =>
      MaxActiveResourcesExceededException(type: type, message: message),
  'MaxNumberOfConfigRulesExceededException': (type, message) =>
      MaxNumberOfConfigRulesExceededException(type: type, message: message),
  'MaxNumberOfConfigurationRecordersExceededException': (type, message) =>
      MaxNumberOfConfigurationRecordersExceededException(
          type: type, message: message),
  'MaxNumberOfConformancePacksExceededException': (type, message) =>
      MaxNumberOfConformancePacksExceededException(
          type: type, message: message),
  'MaxNumberOfDeliveryChannelsExceededException': (type, message) =>
      MaxNumberOfDeliveryChannelsExceededException(
          type: type, message: message),
  'MaxNumberOfOrganizationConfigRulesExceededException': (type, message) =>
      MaxNumberOfOrganizationConfigRulesExceededException(
          type: type, message: message),
  'MaxNumberOfOrganizationConformancePacksExceededException': (type, message) =>
      MaxNumberOfOrganizationConformancePacksExceededException(
          type: type, message: message),
  'MaxNumberOfRetentionConfigurationsExceededException': (type, message) =>
      MaxNumberOfRetentionConfigurationsExceededException(
          type: type, message: message),
  'NoAvailableConfigurationRecorderException': (type, message) =>
      NoAvailableConfigurationRecorderException(type: type, message: message),
  'NoAvailableDeliveryChannelException': (type, message) =>
      NoAvailableDeliveryChannelException(type: type, message: message),
  'NoAvailableOrganizationException': (type, message) =>
      NoAvailableOrganizationException(type: type, message: message),
  'NoRunningConfigurationRecorderException': (type, message) =>
      NoRunningConfigurationRecorderException(type: type, message: message),
  'NoSuchBucketException': (type, message) =>
      NoSuchBucketException(type: type, message: message),
  'NoSuchConfigRuleException': (type, message) =>
      NoSuchConfigRuleException(type: type, message: message),
  'NoSuchConfigRuleInConformancePackException': (type, message) =>
      NoSuchConfigRuleInConformancePackException(type: type, message: message),
  'NoSuchConfigurationAggregatorException': (type, message) =>
      NoSuchConfigurationAggregatorException(type: type, message: message),
  'NoSuchConfigurationRecorderException': (type, message) =>
      NoSuchConfigurationRecorderException(type: type, message: message),
  'NoSuchConformancePackException': (type, message) =>
      NoSuchConformancePackException(type: type, message: message),
  'NoSuchDeliveryChannelException': (type, message) =>
      NoSuchDeliveryChannelException(type: type, message: message),
  'NoSuchOrganizationConfigRuleException': (type, message) =>
      NoSuchOrganizationConfigRuleException(type: type, message: message),
  'NoSuchOrganizationConformancePackException': (type, message) =>
      NoSuchOrganizationConformancePackException(type: type, message: message),
  'NoSuchRemediationConfigurationException': (type, message) =>
      NoSuchRemediationConfigurationException(type: type, message: message),
  'NoSuchRemediationExceptionException': (type, message) =>
      NoSuchRemediationExceptionException(type: type, message: message),
  'NoSuchRetentionConfigurationException': (type, message) =>
      NoSuchRetentionConfigurationException(type: type, message: message),
  'OrganizationAccessDeniedException': (type, message) =>
      OrganizationAccessDeniedException(type: type, message: message),
  'OrganizationAllFeaturesNotEnabledException': (type, message) =>
      OrganizationAllFeaturesNotEnabledException(type: type, message: message),
  'OrganizationConformancePackTemplateValidationException': (type, message) =>
      OrganizationConformancePackTemplateValidationException(
          type: type, message: message),
  'OversizedConfigurationItemException': (type, message) =>
      OversizedConfigurationItemException(type: type, message: message),
  'RemediationInProgressException': (type, message) =>
      RemediationInProgressException(type: type, message: message),
  'ResourceConcurrentModificationException': (type, message) =>
      ResourceConcurrentModificationException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotDiscoveredException': (type, message) =>
      ResourceNotDiscoveredException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
