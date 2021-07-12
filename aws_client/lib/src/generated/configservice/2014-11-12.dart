// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// AWS Config provides a way to keep track of the configurations of all the AWS
/// resources associated with your AWS account. You can use AWS Config to get
/// the current and historical configurations of each AWS resource and also to
/// get information about the relationship between the resources. An AWS
/// resource can be an Amazon Compute Cloud (Amazon EC2) instance, an Elastic
/// Block Store (EBS) volume, an elastic network Interface (ENI), or a security
/// group. For a complete list of resources currently supported by AWS Config,
/// see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
/// AWS Resources</a>.
class ConfigService {
  final _s.JsonProtocol _protocol;
  ConfigService({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'config',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns the current configuration items for resources that are present in
  /// your AWS Config aggregator. The operation also returns a list of resources
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceIdentifiers, 'resourceIdentifiers');
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

  /// Returns the current configuration for one or more requested resources. The
  /// operation also returns a list of resources that are not processed in the
  /// current request. If there are no unprocessed resources, the operation
  /// returns an empty unprocessedResourceKeys list.
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
    ArgumentError.checkNotNull(resourceKeys, 'resourceKeys');
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
    ArgumentError.checkNotNull(authorizedAccountId, 'authorizedAccountId');
    ArgumentError.checkNotNull(authorizedAwsRegion, 'authorizedAwsRegion');
    _s.validateStringLength(
      'authorizedAwsRegion',
      authorizedAwsRegion,
      1,
      64,
      isRequired: true,
    );
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

  /// Deletes the specified AWS Config rule and all of its evaluation results.
  ///
  /// AWS Config sets the state of a rule to <code>DELETING</code> until the
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
  /// The name of the AWS Config rule that you want to delete.
  Future<void> deleteConfigRule({
    required String configRuleName,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
  /// After the configuration recorder is deleted, AWS Config will not record
  /// resource configuration changes until you create a new configuration
  /// recorder.
  ///
  /// This action does not delete the configuration information that was
  /// previously recorded. You will be able to access the previously recorded
  /// information by using the <code>GetResourceConfigHistory</code> action, but
  /// you will not be able to access this information in the AWS Config console
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
    ArgumentError.checkNotNull(
        configurationRecorderName, 'configurationRecorderName');
    _s.validateStringLength(
      'configurationRecorderName',
      configurationRecorderName,
      1,
      256,
      isRequired: true,
    );
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

  /// Deletes the specified conformance pack and all the AWS Config rules,
  /// remediation actions, and all evaluation results within that conformance
  /// pack.
  ///
  /// AWS Config sets the conformance pack to <code>DELETE_IN_PROGRESS</code>
  /// until the deletion is complete. You cannot update a conformance pack while
  /// it is in this state.
  ///
  /// May throw [NoSuchConformancePackException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [conformancePackName] :
  /// Name of the conformance pack you want to delete.
  Future<void> deleteConformancePack({
    required String conformancePackName,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(deliveryChannelName, 'deliveryChannelName');
    _s.validateStringLength(
      'deliveryChannelName',
      deliveryChannelName,
      1,
      256,
      isRequired: true,
    );
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

  /// Deletes the evaluation results for the specified AWS Config rule. You can
  /// specify one AWS Config rule per request. After you delete the evaluation
  /// results, you can call the <a>StartConfigRulesEvaluation</a> API to start
  /// evaluating your AWS resources against the rule.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule for which you want to delete the
  /// evaluation results.
  Future<void> deleteEvaluationResults({
    required String configRuleName,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      64,
      isRequired: true,
    );
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

  /// Deletes the specified organization config rule and all of its evaluation
  /// results from all member accounts in that organization.
  ///
  /// Only a master account and a delegated administrator account can delete an
  /// organization config rule. When calling this API with a delegated
  /// administrator, you must ensure AWS Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added.
  ///
  /// AWS Config sets the state of a rule to DELETE_IN_PROGRESS until the
  /// deletion is complete. You cannot update a rule while it is in this state.
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [ResourceInUseException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name of organization config rule that you want to delete.
  Future<void> deleteOrganizationConfigRule({
    required String organizationConfigRuleName,
  }) async {
    ArgumentError.checkNotNull(
        organizationConfigRuleName, 'organizationConfigRuleName');
    _s.validateStringLength(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      1,
      64,
      isRequired: true,
    );
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

  /// Deletes the specified organization conformance pack and all of the config
  /// rules and remediation actions from all member accounts in that
  /// organization.
  ///
  /// Only a master account or a delegated administrator account can delete an
  /// organization conformance pack. When calling this API with a delegated
  /// administrator, you must ensure AWS Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added.
  ///
  /// AWS Config sets the state of a conformance pack to DELETE_IN_PROGRESS
  /// until the deletion is complete. You cannot update a conformance pack while
  /// it is in this state.
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
    ArgumentError.checkNotNull(
        organizationConformancePackName, 'organizationConformancePackName');
    _s.validateStringLength(
      'organizationConformancePackName',
      organizationConformancePackName,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(requesterAccountId, 'requesterAccountId');
    ArgumentError.checkNotNull(requesterAwsRegion, 'requesterAwsRegion');
    _s.validateStringLength(
      'requesterAwsRegion',
      requesterAwsRegion,
      1,
      64,
      isRequired: true,
    );
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
  /// The name of the AWS Config rule for which you want to delete remediation
  /// configuration.
  ///
  /// Parameter [resourceType] :
  /// The type of a resource.
  Future<void> deleteRemediationConfiguration({
    required String configRuleName,
    String? resourceType,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
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
  /// AWS Config generates a remediation exception when a problem occurs
  /// executing a remediation action to a specific resource. Remediation
  /// exceptions blocks auto-remediation until the exception is cleared.
  /// </note>
  ///
  /// May throw [NoSuchRemediationExceptionException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule for which you want to delete remediation
  /// exception configuration.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. AWS Config adds exception for each resource key. For
  /// example, AWS Config adds 3 exceptions for 3 resource keys.
  Future<DeleteRemediationExceptionsResponse> deleteRemediationExceptions({
    required String configRuleName,
    required List<RemediationExceptionResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceKeys, 'resourceKeys');
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
  /// in your AWS Config History.
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      768,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      196,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(
        retentionConfigurationName, 'retentionConfigurationName');
    _s.validateStringLength(
      'retentionConfigurationName',
      retentionConfigurationName,
      1,
      256,
      isRequired: true,
    );
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

  /// Deletes the stored query for a single AWS account and a single AWS Region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [queryName] :
  /// The name of the query that you want to delete.
  Future<void> deleteStoredQuery({
    required String queryName,
  }) async {
    ArgumentError.checkNotNull(queryName, 'queryName');
    _s.validateStringLength(
      'queryName',
      queryName,
      1,
      64,
      isRequired: true,
    );
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
  /// the specified delivery channel. After the delivery has started, AWS Config
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
    ArgumentError.checkNotNull(deliveryChannelName, 'deliveryChannelName');
    _s.validateStringLength(
      'deliveryChannelName',
      deliveryChannelName,
      1,
      256,
      isRequired: true,
    );
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
  /// resources for compliant and noncompliant rules.
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
  /// default is maximum. If you specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
  /// status with the count of compliant and noncompliant AWS Config rules
  /// within each conformance pack. Also returns the total rule count which
  /// includes compliant rules, noncompliant rules, and rules that cannot be
  /// evaluated due to insufficient data.
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
  /// each page. The default is maximum. If you specify 0, AWS Config uses the
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
  /// default is maximum. If you specify 0, AWS Config uses the default.
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

  /// Indicates whether the specified AWS Config rules are compliant. If a rule
  /// is noncompliant, this action returns the number of AWS resources that do
  /// not comply with the rule.
  ///
  /// A rule is compliant if all of the evaluated resources comply with it. It
  /// is noncompliant if any of these resources do not comply.
  ///
  /// If AWS Config has no current evaluation results for the rule, it returns
  /// <code>INSUFFICIENT_DATA</code>. This result might indicate one of the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// AWS Config has never invoked an evaluation for the rule. To check whether
  /// it has, use the <code>DescribeConfigRuleEvaluationStatus</code> action to
  /// get the <code>LastSuccessfulInvocationTime</code> and
  /// <code>LastFailedInvocationTime</code>.
  /// </li>
  /// <li>
  /// The rule's AWS Lambda function is failing to send evaluation results to
  /// AWS Config. Verify that the role you assigned to your configuration
  /// recorder includes the <code>config:PutEvaluations</code> permission. If
  /// the rule is a custom rule, verify that the AWS Lambda execution role
  /// includes the <code>config:PutEvaluations</code> permission.
  /// </li>
  /// <li>
  /// The rule's AWS Lambda function has returned <code>NOT_APPLICABLE</code>
  /// for all evaluation results. This can occur if the resources were deleted
  /// or removed from the rule's scope.
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
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>.
  ///
  /// Parameter [configRuleNames] :
  /// Specify one or more AWS Config rule names to filter the results by rule.
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
          'ComplianceTypes': complianceTypes.map((e) => e.toValue()).toList(),
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeComplianceByConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Indicates whether the specified AWS resources are compliant. If a resource
  /// is noncompliant, this action returns the number of AWS Config rules that
  /// the resource does not comply with.
  ///
  /// A resource is compliant if it complies with all the AWS Config rules that
  /// evaluate it. It is noncompliant if it does not comply with one or more of
  /// these rules.
  ///
  /// If AWS Config has no current evaluation results for the resource, it
  /// returns <code>INSUFFICIENT_DATA</code>. This result might indicate one of
  /// the following conditions about the rules that evaluate the resource:
  ///
  /// <ul>
  /// <li>
  /// AWS Config has never invoked an evaluation for the rule. To check whether
  /// it has, use the <code>DescribeConfigRuleEvaluationStatus</code> action to
  /// get the <code>LastSuccessfulInvocationTime</code> and
  /// <code>LastFailedInvocationTime</code>.
  /// </li>
  /// <li>
  /// The rule's AWS Lambda function is failing to send evaluation results to
  /// AWS Config. Verify that the role that you assigned to your configuration
  /// recorder includes the <code>config:PutEvaluations</code> permission. If
  /// the rule is a custom rule, verify that the AWS Lambda execution role
  /// includes the <code>config:PutEvaluations</code> permission.
  /// </li>
  /// <li>
  /// The rule's AWS Lambda function has returned <code>NOT_APPLICABLE</code>
  /// for all evaluation results. This can occur if the resources were deleted
  /// or removed from the rule's scope.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>,
  /// and <code>INSUFFICIENT_DATA</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceId] :
  /// The ID of the AWS resource for which you want compliance information. You
  /// can specify only one resource ID. If you specify a resource ID, you must
  /// also specify a type for <code>ResourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// The types of AWS resources for which you want compliance information (for
  /// example, <code>AWS::EC2::Instance</code>). For this action, you can
  /// specify that the resource type is an AWS account by specifying
  /// <code>AWS::::Account</code>.
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
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      768,
    );
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      256,
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
          'ComplianceTypes': complianceTypes.map((e) => e.toValue()).toList(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceId != null) 'ResourceId': resourceId,
        if (resourceType != null) 'ResourceType': resourceType,
      },
    );

    return DescribeComplianceByResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns status information for each of your AWS managed Config rules. The
  /// status includes information such as the last time AWS Config invoked the
  /// rule, the last time AWS Config failed to invoke the rule, and the related
  /// error for the last failure.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [configRuleNames] :
  /// The name of the AWS managed Config rules for which you want status
  /// information. If you do not specify any names, AWS Config returns status
  /// information for all AWS managed Config rules that you use.
  ///
  /// Parameter [limit] :
  /// The number of rule evaluation results that you want returned.
  ///
  /// This parameter is required if the rule limit for your account is more than
  /// the default of 150 rules.
  ///
  /// For information about requesting a rule limit increase, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config">AWS
  /// Config Limits</a> in the <i>AWS General Reference Guide</i>.
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

  /// Returns details about your AWS Config rules.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [configRuleNames] :
  /// The names of the AWS Config rules for which you want details. If you do
  /// not specify any names, AWS Config returns details for all your rules.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<DescribeConfigRulesResponse> describeConfigRules({
    List<String>? configRuleNames,
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
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConfigRulesResponse.fromJson(jsonResponse.body);
  }

  /// Returns status information for sources within an aggregator. The status
  /// includes information about the last time AWS Config verified authorization
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
  /// default is maximum. If you specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
          'UpdateStatus': updateStatus.map((e) => e.toValue()).toList(),
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
  /// default is maximum. If you specify 0, AWS Config uses the default.
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

  /// Returns the current status of the specified configuration recorder. If a
  /// configuration recorder is not specified, this action returns the status of
  /// all configuration recorders associated with the account.
  /// <note>
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
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
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
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
  /// The maximum number of AWS Config rules within a conformance pack are
  /// returned on each page.
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
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
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
  /// If you do not specify any names, AWS Config returns details for all your
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

  /// Provides organization config rule deployment status for an organization.
  /// <note>
  /// The status is not considered successful until organization config rule is
  /// successfully deployed in all the member accounts with an exception of
  /// excluded accounts.
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization config rule names. It is only applicable, when you request
  /// all the organization config rules.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>OrganizationConfigRuleStatuses</code> returned
  /// on each page. If you do no specify a number, AWS Config uses the default.
  /// The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [organizationConfigRuleNames] :
  /// The names of organization config rules for which you want status details.
  /// If you do not specify any names, AWS Config returns details for all your
  /// organization AWS Confg rules.
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

  /// Returns a list of organization config rules.
  /// <note>
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization config rule names. It is only applicable, when you request
  /// all the organization config rules.
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of organization config rules returned on each page. If
  /// you do no specify a number, AWS Config uses the default. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [organizationConfigRuleNames] :
  /// The names of organization config rules for which you want details. If you
  /// do not specify any names, AWS Config returns details for all your
  /// organization config rules.
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
  /// page. If you do no specify a number, AWS Config uses the default. The
  /// default is 100.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  ///
  /// Parameter [organizationConformancePackNames] :
  /// The names of organization conformance packs for which you want status
  /// details. If you do not specify any names, AWS Config returns details for
  /// all your organization conformance packs.
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
  /// </note>
  ///
  /// May throw [NoSuchOrganizationConformancePackException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidLimitException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of organization config packs returned on each page. If
  /// you do no specify a number, AWS Config uses the default. The default is
  /// 100.
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
  /// default is maximum. If you specify 0, AWS Config uses the default.
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
  /// A list of AWS Config rule names of remediation configurations for which
  /// you want details.
  Future<DescribeRemediationConfigurationsResponse>
      describeRemediationConfigurations({
    required List<String> configRuleNames,
  }) async {
    ArgumentError.checkNotNull(configRuleNames, 'configRuleNames');
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
  /// AWS Config generates a remediation exception when a problem occurs
  /// executing a remediation action to a specific resource. Remediation
  /// exceptions blocks auto-remediation until the exception is cleared.
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
  /// The name of the AWS Config rule.
  ///
  /// Parameter [limit] :
  /// The maximum number of RemediationExceptionResourceKey returned on each
  /// page. The default is 25. If you specify 0, AWS Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. AWS Config adds exception for each resource key. For
  /// example, AWS Config adds 3 exceptions for 3 resource keys.
  Future<DescribeRemediationExceptionsResponse> describeRemediationExceptions({
    required String configRuleName,
    int? limit,
    String? nextToken,
    List<RemediationExceptionResourceKey>? resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
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
  /// A list of AWS Config rule names.
  ///
  /// Parameter [limit] :
  /// The maximum number of RemediationExecutionStatuses returned on each page.
  /// The default is maximum. If you specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
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
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
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
  /// you do not specify a name, AWS Config returns details for all the
  /// retention configurations for that account.
  /// <note>
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
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

  /// Returns the evaluation results for the specified AWS Config rule for a
  /// specific resource in a rule. The results indicate which AWS resources were
  /// evaluated by the rule, when each resource was last evaluated, and whether
  /// each resource complies with the rule.
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
  /// The name of the AWS Config rule for which you want compliance information.
  ///
  /// Parameter [configurationAggregatorName] :
  /// The name of the configuration aggregator.
  ///
  /// Parameter [complianceType] :
  /// The resource compliance status.
  /// <note>
  /// For the <code>GetAggregateComplianceDetailsByConfigRuleRequest</code> data
  /// type, AWS Config supports only the <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. AWS Config does not support the
  /// <code>NOT_APPLICABLE</code> and <code>INSUFFICIENT_DATA</code> values.
  /// </note>
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 50. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(awsRegion, 'awsRegion');
    _s.validateStringLength(
      'awsRegion',
      awsRegion,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
        if (complianceType != null) 'ComplianceType': complianceType.toValue(),
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
  /// specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
        if (groupByKey != null) 'GroupByKey': groupByKey.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateConfigRuleComplianceSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the count of compliant and noncompliant conformance packs across
  /// all AWS Accounts and AWS Regions in an aggregator. You can filter based on
  /// AWS Account ID or AWS Region.
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
  /// Groups the result based on AWS Account ID or AWS Region.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned on each page. The default is
  /// maximum. If you specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
        if (groupByKey != null) 'GroupByKey': groupByKey.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAggregateConformancePackComplianceSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the resource counts across accounts and regions that are present
  /// in your AWS Config aggregator. You can request the resource counts by
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
  /// If you specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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
        if (groupByKey != null) 'GroupByKey': groupByKey.toValue(),
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
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

  /// Returns the evaluation results for the specified AWS Config rule. The
  /// results indicate which AWS resources were evaluated by the rule, when each
  /// resource was last evaluated, and whether each resource complies with the
  /// rule.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NoSuchConfigRuleException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule for which you want compliance information.
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>,
  /// and <code>NOT_APPLICABLE</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of evaluation results returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      64,
      isRequired: true,
    );
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
          'ComplianceTypes': complianceTypes.map((e) => e.toValue()).toList(),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetComplianceDetailsByConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Returns the evaluation results for the specified AWS resource. The results
  /// indicate which AWS Config rules were used to evaluate the resource, when
  /// each rule was last used, and whether the resource complies with each rule.
  ///
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the AWS resource for which you want compliance information.
  ///
  /// Parameter [resourceType] :
  /// The type of the AWS resource for which you want compliance information.
  ///
  /// Parameter [complianceTypes] :
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>,
  /// and <code>NOT_APPLICABLE</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<GetComplianceDetailsByResourceResponse>
      getComplianceDetailsByResource({
    required String resourceId,
    required String resourceType,
    List<ComplianceType>? complianceTypes,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      768,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      256,
      isRequired: true,
    );
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
        'ResourceId': resourceId,
        'ResourceType': resourceType,
        if (complianceTypes != null)
          'ComplianceTypes': complianceTypes.map((e) => e.toValue()).toList(),
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetComplianceDetailsByResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns the number of AWS Config rules that are compliant and
  /// noncompliant, up to a maximum of 25 for each.
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
  /// For this request, you can specify an AWS resource type such as
  /// <code>AWS::EC2::Instance</code>. You can specify that the resource type is
  /// an AWS account by specifying <code>AWS::::Account</code>.
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

  /// Returns compliance details of a conformance pack for all AWS resources
  /// that are monitered by conformance pack.
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
  /// no specify a number, AWS Config uses the default. The default is 100.
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
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(conformancePackNames, 'conformancePackNames');
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

  /// Returns the resource types, the number of each resource type, and the
  /// total number of resources that AWS Config is recording in this region for
  /// your AWS account.
  /// <p class="title"> <b>Example</b>
  /// <ol>
  /// <li>
  /// AWS Config is recording three resource types in the US East (Ohio) Region
  /// for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.
  /// </li>
  /// <li>
  /// You make a call to the <code>GetDiscoveredResourceCounts</code> action and
  /// specify that you want all resource types.
  /// </li>
  /// <li>
  /// AWS Config returns the following:
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
  /// The response is paginated. By default, AWS Config lists 100
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
  /// You are a new AWS Config customer.
  /// </li>
  /// <li>
  /// You just enabled resource recording.
  /// </li>
  /// </ul>
  /// It might take a few minutes for AWS Config to record and count your
  /// resources. Wait a few minutes and then retry the
  /// <a>GetDiscoveredResourceCounts</a> action.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [limit] :
  /// The maximum number of <a>ResourceCount</a> objects returned on each page.
  /// The default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceTypes] :
  /// The comma-separated list that specifies the resource types that you want
  /// AWS Config to return (for example, <code>"AWS::EC2::Instance"</code>,
  /// <code>"AWS::IAM::User"</code>).
  ///
  /// If a value for <code>resourceTypes</code> is not specified, AWS Config
  /// returns all resource types that AWS Config is recording in the region for
  /// your account.
  /// <note>
  /// If the configuration recorder is turned off, AWS Config returns an empty
  /// list of <a>ResourceCount</a> objects. If the configuration recorder is not
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
  /// a given organization config rule.
  ///
  /// May throw [NoSuchOrganizationConfigRuleException].
  /// May throw [InvalidLimitException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OrganizationAccessDeniedException].
  ///
  /// Parameter [organizationConfigRuleName] :
  /// The name of organization config rule for which you want status details for
  /// member accounts.
  ///
  /// Parameter [filters] :
  /// A <code>StatusDetailFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>OrganizationConfigRuleDetailedStatus</code>
  /// returned on each page. If you do not specify a number, AWS Config uses the
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
    ArgumentError.checkNotNull(
        organizationConfigRuleName, 'organizationConfigRuleName');
    _s.validateStringLength(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      1,
      64,
      isRequired: true,
    );
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
  /// page. If you do not specify a number, AWS Config uses the default. The
  /// default is 100.
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
    ArgumentError.checkNotNull(
        organizationConformancePackName, 'organizationConformancePackName');
    _s.validateStringLength(
      'organizationConformancePackName',
      organizationConformancePackName,
      1,
      128,
      isRequired: true,
    );
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

  /// Returns a list of configuration items for the specified resource. The list
  /// contains details about each state of the resource during the specified
  /// time interval. If you specified a retention period to retain your
  /// <code>ConfigurationItems</code> between a minimum of 30 days and a maximum
  /// of 7 years (2557 days), AWS Config returns the
  /// <code>ConfigurationItems</code> for the specified retention period.
  ///
  /// The response is paginated. By default, AWS Config returns a limit of 10
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
  /// The time stamp that indicates an earlier time. If not specified, the
  /// action returns paginated results that contain configuration items that
  /// start when the first configuration item was recorded.
  ///
  /// Parameter [laterTime] :
  /// The time stamp that indicates a later time. If not specified, current time
  /// is taken.
  ///
  /// Parameter [limit] :
  /// The maximum number of configuration items returned on each page. The
  /// default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      768,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
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
        'resourceType': resourceType.toValue(),
        if (chronologicalOrder != null)
          'chronologicalOrder': chronologicalOrder.toValue(),
        if (earlierTime != null)
          'earlierTime': unixTimestampToJson(earlierTime),
        if (laterTime != null) 'laterTime': unixTimestampToJson(laterTime),
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetResourceConfigHistoryResponse.fromJson(jsonResponse.body);
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
    ArgumentError.checkNotNull(queryName, 'queryName');
    _s.validateStringLength(
      'queryName',
      queryName,
      1,
      64,
      isRequired: true,
    );
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
  /// The type of resources that you want AWS Config to list in the response.
  ///
  /// Parameter [filters] :
  /// Filters the results based on the <code>ResourceFilters</code> object.
  ///
  /// Parameter [limit] :
  /// The maximum number of resource identifiers returned on each page. You
  /// cannot specify a number greater than 100. If you specify 0, AWS Config
  /// uses the default.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
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
        'ResourceType': resourceType.toValue(),
        if (filters != null) 'Filters': filters,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAggregateDiscoveredResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a resource type and returns a list of resource identifiers for the
  /// resources of that type. A resource identifier includes the resource type,
  /// ID, and (if available) the custom resource name. The results consist of
  /// resources that AWS Config has discovered, including those that AWS Config
  /// is not currently recording. You can narrow the results to include only
  /// resources that have specific resource IDs or a resource name.
  /// <note>
  /// You can specify either resource IDs or a resource name, but not both, in
  /// the same request.
  /// </note>
  /// The response is paginated. By default, AWS Config lists 100 resource
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
  /// The type of resources that you want AWS Config to list in the response.
  ///
  /// Parameter [includeDeletedResources] :
  /// Specifies whether AWS Config includes deleted resources in the results. By
  /// default, deleted resources are not included.
  ///
  /// Parameter [limit] :
  /// The maximum number of resource identifiers returned on each page. The
  /// default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  ///
  /// Parameter [resourceIds] :
  /// The IDs of only those resources that you want AWS Config to list in the
  /// response. If you do not specify this parameter, AWS Config lists all
  /// resources of the specified type that it has discovered.
  ///
  /// Parameter [resourceName] :
  /// The custom name of only those resources that you want AWS Config to list
  /// in the response. If you do not specify this parameter, AWS Config lists
  /// all resources of the specified type that it has discovered.
  Future<ListDiscoveredResourcesResponse> listDiscoveredResources({
    required ResourceType resourceType,
    bool? includeDeletedResources,
    int? limit,
    String? nextToken,
    List<String>? resourceIds,
    String? resourceName,
  }) async {
    ArgumentError.checkNotNull(resourceType, 'resourceType');
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
        'resourceType': resourceType.toValue(),
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

  /// Lists the stored queries for a single AWS account and a single AWS Region.
  /// The default is 100.
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

  /// List the tags for AWS Config resource.
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
  /// You cannot specify a number greater than 50. If you specify 0, AWS Config
  /// uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? limit,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1000,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(authorizedAccountId, 'authorizedAccountId');
    ArgumentError.checkNotNull(authorizedAwsRegion, 'authorizedAwsRegion');
    _s.validateStringLength(
      'authorizedAwsRegion',
      authorizedAwsRegion,
      1,
      64,
      isRequired: true,
    );
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

  /// Adds or updates an AWS Config rule for evaluating whether your AWS
  /// resources comply with your desired configurations.
  ///
  /// You can use this action for custom AWS Config rules and AWS managed Config
  /// rules. A custom AWS Config rule is a rule that you develop and maintain.
  /// An AWS managed Config rule is a customizable, predefined rule that AWS
  /// Config provides.
  ///
  /// If you are adding a new custom AWS Config rule, you must first create the
  /// AWS Lambda function that the rule invokes to evaluate your resources. When
  /// you use the <code>PutConfigRule</code> action to add the rule to AWS
  /// Config, you must specify the Amazon Resource Name (ARN) that AWS Lambda
  /// assigns to the function. Specify the ARN for the
  /// <code>SourceIdentifier</code> key. This key is part of the
  /// <code>Source</code> object, which is part of the <code>ConfigRule</code>
  /// object.
  ///
  /// If you are adding an AWS managed Config rule, specify the rule's
  /// identifier for the <code>SourceIdentifier</code> key. To reference AWS
  /// managed Config rule identifiers, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">About
  /// AWS Managed Config Rules</a>.
  ///
  /// For any new rule that you add, specify the <code>ConfigRuleName</code> in
  /// the <code>ConfigRule</code> object. Do not specify the
  /// <code>ConfigRuleArn</code> or the <code>ConfigRuleId</code>. These values
  /// are generated by AWS Config for new rules.
  ///
  /// If you are updating a rule that you added previously, you can specify the
  /// rule by <code>ConfigRuleName</code>, <code>ConfigRuleId</code>, or
  /// <code>ConfigRuleArn</code> in the <code>ConfigRule</code> data type that
  /// you use in this request.
  ///
  /// The maximum number of rules that AWS Config supports is 150.
  ///
  /// For information about requesting a rule limit increase, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config">AWS
  /// Config Limits</a> in the <i>AWS General Reference Guide</i>.
  ///
  /// For more information about developing and using AWS Config rules, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html">Evaluating
  /// AWS Resource Configurations with AWS Config</a> in the <i>AWS Config
  /// Developer Guide</i>.
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
    ArgumentError.checkNotNull(configRule, 'configRule');
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
  /// <code>DescribeAggregator</code> to get the previous accounts and then
  /// append new ones.
  /// <note>
  /// AWS Config should be enabled in source accounts and regions you want to
  /// aggregate.
  ///
  /// If your source type is an organization, you must be signed in to the
  /// management account or a registered delegated administrator and all the
  /// features must be enabled in your organization. If the caller is a
  /// management account, AWS Config calls <code>EnableAwsServiceAccess</code>
  /// API to enable integration between AWS Config and AWS Organizations. If the
  /// caller is a registered delegated administrator, AWS Config calls
  /// <code>ListDelegatedAdministrators</code> API to verify whether the caller
  /// is a valid delegated administrator.
  ///
  /// To register a delegated administrator, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli">Register
  /// a Delegated Administrator</a> in the AWS Config developer guide.
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
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

  /// Creates a new configuration recorder to record the selected resource
  /// configurations.
  ///
  /// You can use this action to change the role <code>roleARN</code> or the
  /// <code>recordingGroup</code> of an existing recorder. To change the role,
  /// call the action on the existing configuration recorder and specify a role.
  /// <note>
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
  ///
  /// If <code>ConfigurationRecorder</code> does not have the
  /// <b>recordingGroup</b> parameter specified, the default is to record all
  /// supported resource types.
  /// </note>
  ///
  /// May throw [MaxNumberOfConfigurationRecordersExceededException].
  /// May throw [InvalidConfigurationRecorderNameException].
  /// May throw [InvalidRoleException].
  /// May throw [InvalidRecordingGroupException].
  ///
  /// Parameter [configurationRecorder] :
  /// The configuration recorder object that records each configuration change
  /// made to the resources.
  Future<void> putConfigurationRecorder({
    required ConfigurationRecorder configurationRecorder,
  }) async {
    ArgumentError.checkNotNull(configurationRecorder, 'configurationRecorder');
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
  /// of AWS Config rules that can be easily deployed in an account and a region
  /// and across AWS Organization.
  ///
  /// This API creates a service linked role
  /// <code>AWSServiceRoleForConfigConforms</code> in your account. The service
  /// linked role is created only when the role does not exist in your account.
  /// <note>
  /// You must specify either the <code>TemplateS3Uri</code> or the
  /// <code>TemplateBody</code> parameter, but not both. If you provide both AWS
  /// Config uses the <code>TemplateS3Uri</code> parameter and ignores the
  /// <code>TemplateBody</code> parameter.
  /// </note>
  ///
  /// May throw [InsufficientPermissionsException].
  /// May throw [ConformancePackTemplateValidationException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MaxNumberOfConformancePacksExceededException].
  ///
  /// Parameter [conformancePackName] :
  /// Name of the conformance pack you want to create.
  ///
  /// Parameter [conformancePackInputParameters] :
  /// A list of <code>ConformancePackInputParameter</code> objects.
  ///
  /// Parameter [deliveryS3Bucket] :
  /// Amazon S3 bucket where AWS Config stores conformance pack templates.
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
  /// A string containing full conformance pack template body. Structure
  /// containing the template body with a minimum length of 1 byte and a maximum
  /// length of 51,200 bytes.
  /// <note>
  /// You can only use a YAML template with one resource type, that is, config
  /// rule and a remediation action.
  /// </note>
  ///
  /// Parameter [templateS3Uri] :
  /// Location of file containing the template body
  /// (<code>s3://bucketname/prefix</code>). The uri must point to the
  /// conformance pack template (max size: 300 KB) that is located in an Amazon
  /// S3 bucket in the same region as the conformance pack.
  /// <note>
  /// You must have access to read Amazon S3 bucket.
  /// </note>
  Future<PutConformancePackResponse> putConformancePack({
    required String conformancePackName,
    List<ConformancePackInputParameter>? conformancePackInputParameters,
    String? deliveryS3Bucket,
    String? deliveryS3KeyPrefix,
    String? templateBody,
    String? templateS3Uri,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'deliveryS3Bucket',
      deliveryS3Bucket,
      0,
      63,
    );
    _s.validateStringLength(
      'deliveryS3KeyPrefix',
      deliveryS3KeyPrefix,
      0,
      1024,
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      51200,
    );
    _s.validateStringLength(
      'templateS3Uri',
      templateS3Uri,
      1,
      1024,
    );
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
      },
    );

    return PutConformancePackResponse.fromJson(jsonResponse.body);
  }

  /// Creates a delivery channel object to deliver configuration information to
  /// an Amazon S3 bucket and Amazon SNS topic.
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
    ArgumentError.checkNotNull(deliveryChannel, 'deliveryChannel');
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

  /// Used by an AWS Lambda function to deliver evaluation results to AWS
  /// Config. This action is required in every AWS Lambda function that is
  /// invoked by an AWS Config rule.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResultTokenException].
  /// May throw [NoSuchConfigRuleException].
  ///
  /// Parameter [resultToken] :
  /// An encrypted token that associates an evaluation with an AWS Config rule.
  /// Identifies the rule and the event that triggered the evaluation.
  ///
  /// Parameter [evaluations] :
  /// The assessments that the AWS Lambda function performs. Each evaluation
  /// identifies an AWS resource and indicates whether it complies with the AWS
  /// Config rule that invokes the AWS Lambda function.
  ///
  /// Parameter [testMode] :
  /// Use this parameter to specify a test run for <code>PutEvaluations</code>.
  /// You can verify whether your AWS Lambda function will deliver evaluation
  /// results to AWS Config. No updates occur to your existing evaluations, and
  /// evaluation results are not sent to AWS Config.
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
    ArgumentError.checkNotNull(resultToken, 'resultToken');
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
  /// rule is a process check when the name of the AWS Config rule is provided.
  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule.
  ///
  /// Parameter [externalEvaluation] :
  /// An <code>ExternalEvaluation</code> object that provides details about
  /// compliance.
  Future<void> putExternalEvaluation({
    required String configRuleName,
    required ExternalEvaluation externalEvaluation,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(externalEvaluation, 'externalEvaluation');
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

  /// Adds or updates organization config rule for your entire organization
  /// evaluating whether your AWS resources comply with your desired
  /// configurations.
  ///
  /// Only a master account and a delegated administrator can create or update
  /// an organization config rule. When calling this API with a delegated
  /// administrator, you must ensure AWS Organizations
  /// <code>ListDelegatedAdministrator</code> permissions are added.
  ///
  /// This API enables organization service access through the
  /// <code>EnableAWSServiceAccess</code> action and creates a service linked
  /// role <code>AWSServiceRoleForConfigMultiAccountSetup</code> in the master
  /// or delegated administrator account of your organization. The service
  /// linked role is created only when the role does not exist in the caller
  /// account. AWS Config verifies the existence of role with
  /// <code>GetRole</code> action.
  ///
  /// To use this API with delegated administrator, register a delegated
  /// administrator by calling AWS Organization
  /// <code>register-delegated-administrator</code> for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// You can use this action to create both custom AWS Config rules and AWS
  /// managed Config rules. If you are adding a new custom AWS Config rule, you
  /// must first create AWS Lambda function in the master account or a delegated
  /// administrator that the rule invokes to evaluate your resources. When you
  /// use the <code>PutOrganizationConfigRule</code> action to add the rule to
  /// AWS Config, you must specify the Amazon Resource Name (ARN) that AWS
  /// Lambda assigns to the function. If you are adding an AWS managed Config
  /// rule, specify the rule's identifier for the <code>RuleIdentifier</code>
  /// key.
  ///
  /// The maximum number of organization config rules that AWS Config supports
  /// is 150 and 3 delegated administrator per organization.
  /// <note>
  /// Prerequisite: Ensure you call <code>EnableAllFeatures</code> API to enable
  /// all features in an organization.
  ///
  /// Specify either <code>OrganizationCustomRuleMetadata</code> or
  /// <code>OrganizationManagedRuleMetadata</code>.
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
  /// The name that you assign to an organization config rule.
  ///
  /// Parameter [excludedAccounts] :
  /// A comma-separated list of accounts that you want to exclude from an
  /// organization config rule.
  ///
  /// Parameter [organizationCustomRuleMetadata] :
  /// An <code>OrganizationCustomRuleMetadata</code> object.
  ///
  /// Parameter [organizationManagedRuleMetadata] :
  /// An <code>OrganizationManagedRuleMetadata</code> object.
  Future<PutOrganizationConfigRuleResponse> putOrganizationConfigRule({
    required String organizationConfigRuleName,
    List<String>? excludedAccounts,
    OrganizationCustomRuleMetadata? organizationCustomRuleMetadata,
    OrganizationManagedRuleMetadata? organizationManagedRuleMetadata,
  }) async {
    ArgumentError.checkNotNull(
        organizationConfigRuleName, 'organizationConfigRuleName');
    _s.validateStringLength(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      1,
      64,
      isRequired: true,
    );
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
        if (organizationCustomRuleMetadata != null)
          'OrganizationCustomRuleMetadata': organizationCustomRuleMetadata,
        if (organizationManagedRuleMetadata != null)
          'OrganizationManagedRuleMetadata': organizationManagedRuleMetadata,
      },
    );

    return PutOrganizationConfigRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deploys conformance packs across member accounts in an AWS Organization.
  ///
  /// Only a master account and a delegated administrator can call this API.
  /// When calling this API with a delegated administrator, you must ensure AWS
  /// Organizations <code>ListDelegatedAdministrator</code> permissions are
  /// added.
  ///
  /// This API enables organization service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code> through the
  /// <code>EnableAWSServiceAccess</code> action and creates a service linked
  /// role <code>AWSServiceRoleForConfigMultiAccountSetup</code> in the master
  /// or delegated administrator account of your organization. The service
  /// linked role is created only when the role does not exist in the caller
  /// account. To use this API with delegated administrator, register a
  /// delegated administrator by calling AWS Organization
  /// <code>register-delegate-admin</code> for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  /// <note>
  /// Prerequisite: Ensure you call <code>EnableAllFeatures</code> API to enable
  /// all features in an organization.
  ///
  /// You must specify either the <code>TemplateS3Uri</code> or the
  /// <code>TemplateBody</code> parameter, but not both. If you provide both AWS
  /// Config uses the <code>TemplateS3Uri</code> parameter and ignores the
  /// <code>TemplateBody</code> parameter.
  ///
  /// AWS Config sets the state of a conformance pack to CREATE_IN_PROGRESS and
  /// UPDATE_IN_PROGRESS until the conformance pack is created or updated. You
  /// cannot update a conformance pack while it is in this state.
  ///
  /// You can create 50 conformance packs with 25 AWS Config rules in each pack
  /// and 3 delegated administrator per organization.
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
  /// Amazon S3 bucket where AWS Config stores conformance pack templates.
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
  /// A list of AWS accounts to be excluded from an organization conformance
  /// pack while deploying a conformance pack.
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
  /// You must have access to read Amazon S3 bucket.
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
    ArgumentError.checkNotNull(
        organizationConformancePackName, 'organizationConformancePackName');
    _s.validateStringLength(
      'organizationConformancePackName',
      organizationConformancePackName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'deliveryS3Bucket',
      deliveryS3Bucket,
      0,
      63,
    );
    _s.validateStringLength(
      'deliveryS3KeyPrefix',
      deliveryS3KeyPrefix,
      0,
      1024,
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      51200,
    );
    _s.validateStringLength(
      'templateS3Uri',
      templateS3Uri,
      1,
      1024,
    );
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

  /// Adds or updates the remediation configuration with a specific AWS Config
  /// rule with the selected target or action. The API creates the
  /// <code>RemediationConfiguration</code> object for the AWS Config rule. The
  /// AWS Config rule must already exist for you to add a remediation
  /// configuration. The target (SSM document) must exist and have permissions
  /// to use the target.
  /// <note>
  /// If you make backward incompatible changes to the SSM document, you must
  /// call this again to ensure the remediations can run.
  ///
  /// This API does not support adding remediation configurations for
  /// service-linked AWS Config Rules such as Organization Config rules, the
  /// rules deployed by conformance packs, and rules deployed by AWS Security
  /// Hub.
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
    ArgumentError.checkNotNull(
        remediationConfigurations, 'remediationConfigurations');
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

  /// A remediation exception is when a specific resource is no longer
  /// considered for auto-remediation. This API adds a new exception or updates
  /// an existing exception for a specific resource with a specific AWS Config
  /// rule.
  /// <note>
  /// AWS Config generates a remediation exception when a problem occurs
  /// executing a remediation action to a specific resource. Remediation
  /// exceptions blocks auto-remediation until the exception is cleared.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InsufficientPermissionsException].
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule for which you want to create remediation
  /// exception.
  ///
  /// Parameter [resourceKeys] :
  /// An exception list of resource exception keys to be processed with the
  /// current request. AWS Config adds exception for each resource key. For
  /// example, AWS Config adds 3 exceptions for 3 resource keys.
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
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceKeys, 'resourceKeys');
    _s.validateStringLength(
      'message',
      message,
      1,
      1024,
    );
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
  /// The configuration state of a resource is represented in AWS Config as
  /// Configuration Items. Once this API records the configuration item, you can
  /// retrieve the list of configuration items for the custom resource type
  /// using existing AWS Config APIs.
  /// <note>
  /// The custom resource type must be registered with AWS CloudFormation. This
  /// API accepts the configuration item registered with AWS CloudFormation.
  ///
  /// When you call this API, AWS Config only stores configuration state of the
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
  /// match the schema registered with AWS CloudFormation.
  /// <note>
  /// The configuration JSON must not exceed 64 KB.
  /// </note>
  ///
  /// Parameter [resourceId] :
  /// Unique identifier of the resource.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource. The custom resource type must be registered with
  /// AWS CloudFormation.
  /// <note>
  /// You cannot use the organization names “aws”, “amzn”, “amazon”, “alexa”,
  /// “custom” with custom resource types. It is the first part of the
  /// ResourceType up to the first ::.
  /// </note>
  ///
  /// Parameter [schemaVersionId] :
  /// Version of the schema registered for the ResourceType in AWS
  /// CloudFormation.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  ///
  /// Parameter [tags] :
  /// Tags associated with the resource.
  Future<void> putResourceConfig({
    required String configuration,
    required String resourceId,
    required String resourceType,
    required String schemaVersionId,
    String? resourceName,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      768,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      196,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaVersionId, 'schemaVersionId');
    _s.validateStringLength(
      'schemaVersionId',
      schemaVersionId,
      1,
      128,
      isRequired: true,
    );
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
  /// retention period (number of days) that AWS Config stores your historical
  /// information. The API creates the <code>RetentionConfiguration</code>
  /// object and names the object as <b>default</b>. When you have a
  /// <code>RetentionConfiguration</code> object named <b>default</b>, calling
  /// the API modifies the default object.
  /// <note>
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MaxNumberOfRetentionConfigurationsExceededException].
  ///
  /// Parameter [retentionPeriodInDays] :
  /// Number of days AWS Config stores your historical information.
  /// <note>
  /// Currently, only applicable to the configuration item history.
  /// </note>
  Future<PutRetentionConfigurationResponse> putRetentionConfiguration({
    required int retentionPeriodInDays,
  }) async {
    ArgumentError.checkNotNull(retentionPeriodInDays, 'retentionPeriodInDays');
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
  /// <code>QueryName</code> must be unique for a single AWS account and a
  /// single AWS Region. You can create upto 300 queries in a single AWS account
  /// and a single AWS Region.
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
    ArgumentError.checkNotNull(storedQuery, 'storedQuery');
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
  /// to query configuration state of AWS resources across multiple accounts and
  /// regions, performs the corresponding search, and returns resource
  /// configurations matching the properties.
  ///
  /// For more information about query components, see the <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/query-components.html">
  /// <b>Query Components</b> </a> section in the AWS Config Developer Guide.
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
  /// The maximum number of query results returned on each page. AWS Config also
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
    ArgumentError.checkNotNull(
        configurationAggregatorName, 'configurationAggregatorName');
    _s.validateStringLength(
      'configurationAggregatorName',
      configurationAggregatorName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'expression',
      expression,
      1,
      4096,
      isRequired: true,
    );
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
  /// <b>Query Components</b> </a> section in the AWS Config Developer Guide.
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
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'expression',
      expression,
      1,
      4096,
      isRequired: true,
    );
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

  /// Runs an on-demand evaluation for the specified AWS Config rules against
  /// the last known configuration state of the resources. Use
  /// <code>StartConfigRulesEvaluation</code> when you want to test that a rule
  /// you updated is working as expected.
  /// <code>StartConfigRulesEvaluation</code> does not re-record the latest
  /// configuration state for your resources. It re-runs an evaluation against
  /// the last known state of your resources.
  ///
  /// You can specify up to 25 AWS Config rules per request.
  ///
  /// An existing <code>StartConfigRulesEvaluation</code> call for the specified
  /// rules must complete before you can call the API again. If you chose to
  /// have AWS Config stream to an Amazon SNS topic, you will receive a
  /// <code>ConfigRuleEvaluationStarted</code> notification when the evaluation
  /// starts.
  /// <note>
  /// You don't need to call the <code>StartConfigRulesEvaluation</code> API to
  /// run an evaluation for a new rule. When you create a rule, AWS Config
  /// evaluates your resources against the rule automatically.
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
  /// AWS Config invokes your Lambda function and evaluates your IAM resources.
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
  /// The list of names of AWS Config rules that you want to run evaluations
  /// for.
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

  /// Starts recording configurations of the AWS resources you have selected to
  /// record in your AWS account.
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
    ArgumentError.checkNotNull(
        configurationRecorderName, 'configurationRecorderName');
    _s.validateStringLength(
      'configurationRecorderName',
      configurationRecorderName,
      1,
      256,
      isRequired: true,
    );
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

  /// Runs an on-demand remediation for the specified AWS Config rules against
  /// the last known remediation configuration. It runs an execution against the
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
  /// The list of names of AWS Config rules that you want to run remediation
  /// execution for.
  ///
  /// Parameter [resourceKeys] :
  /// A list of resource keys to be processed with the current request. Each
  /// element in the list consists of the resource type and resource ID.
  Future<StartRemediationExecutionResponse> startRemediationExecution({
    required String configRuleName,
    required List<ResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceKeys, 'resourceKeys');
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

  /// Stops recording configurations of the AWS resources you have selected to
  /// record in your AWS account.
  ///
  /// May throw [NoSuchConfigurationRecorderException].
  ///
  /// Parameter [configurationRecorderName] :
  /// The name of the recorder object that records each configuration change
  /// made to the resources.
  Future<void> stopConfigurationRecorder({
    required String configurationRecorderName,
  }) async {
    ArgumentError.checkNotNull(
        configurationRecorderName, 'configurationRecorderName');
    _s.validateStringLength(
      'configurationRecorderName',
      configurationRecorderName,
      1,
      256,
      isRequired: true,
    );
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
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// If true, aggregate existing AWS Config regions and future regions.
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
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allAwsRegions: json['AllAwsRegions'] as bool?,
      awsRegions: (json['AwsRegions'] as List?)
          ?.whereNotNull()
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

/// Indicates whether an AWS Config rule is compliant based on account ID,
/// region, compliance, and rule name.
///
/// A rule is compliant if all of the resources that the rule evaluated comply
/// with it. It is noncompliant if any of these resources do not comply.
class AggregateComplianceByConfigRule {
  /// The 12-digit account ID of the source account.
  final String? accountId;

  /// The source region from where the data is aggregated.
  final String? awsRegion;

  /// Indicates whether an AWS resource or AWS Config rule is compliant and
  /// provides the number of contributors that affect the compliance.
  final Compliance? compliance;

  /// The name of the AWS Config rule.
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final compliance = this.compliance;
    final configRuleName = this.configRuleName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (compliance != null) 'Compliance': compliance,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
    };
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
  /// The 12-digit AWS account ID of the source account.
  final String? accountId;

  /// The source AWS Region from where the data is aggregated.
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final compliance = this.compliance;
    final conformancePackName = this.conformancePackName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (compliance != null) 'Compliance': compliance,
      if (conformancePackName != null)
        'ConformancePackName': conformancePackName,
    };
  }
}

/// Returns the number of compliant and noncompliant rules for one or more
/// accounts and regions in an aggregator.
class AggregateComplianceCount {
  /// The number of compliant and noncompliant AWS Config rules.
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

  Map<String, dynamic> toJson() {
    final complianceSummary = this.complianceSummary;
    final groupName = this.groupName;
    return {
      if (complianceSummary != null) 'ComplianceSummary': complianceSummary,
      if (groupName != null) 'GroupName': groupName,
    };
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

  /// The number of compliant AWS Config Rules.
  final int? compliantRuleCount;

  /// The number of noncompliant AWS Config Rules.
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
          ?.toConformancePackComplianceType(),
      compliantRuleCount: json['CompliantRuleCount'] as int?,
      nonCompliantRuleCount: json['NonCompliantRuleCount'] as int?,
      totalRuleCount: json['TotalRuleCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final compliantRuleCount = this.compliantRuleCount;
    final nonCompliantRuleCount = this.nonCompliantRuleCount;
    final totalRuleCount = this.totalRuleCount;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (compliantRuleCount != null) 'CompliantRuleCount': compliantRuleCount,
      if (nonCompliantRuleCount != null)
        'NonCompliantRuleCount': nonCompliantRuleCount,
      if (totalRuleCount != null) 'TotalRuleCount': totalRuleCount,
    };
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

  Map<String, dynamic> toJson() {
    final compliantConformancePackCount = this.compliantConformancePackCount;
    final nonCompliantConformancePackCount =
        this.nonCompliantConformancePackCount;
    return {
      if (compliantConformancePackCount != null)
        'CompliantConformancePackCount': compliantConformancePackCount,
      if (nonCompliantConformancePackCount != null)
        'NonCompliantConformancePackCount': nonCompliantConformancePackCount,
    };
  }
}

/// Filters the conformance packs based on an account ID, region, compliance
/// type, and the name of the conformance pack.
class AggregateConformancePackComplianceFilters {
  /// The 12-digit AWS account ID of the source account.
  final String? accountId;

  /// The source AWS Region from where the data is aggregated.
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

  factory AggregateConformancePackComplianceFilters.fromJson(
      Map<String, dynamic> json) {
    return AggregateConformancePackComplianceFilters(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      complianceType: (json['ComplianceType'] as String?)
          ?.toConformancePackComplianceType(),
      conformancePackName: json['ConformancePackName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final complianceType = this.complianceType;
    final conformancePackName = this.conformancePackName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (conformancePackName != null)
        'ConformancePackName': conformancePackName,
    };
  }
}

/// Provides a summary of compliance based on either account ID or region.
class AggregateConformancePackComplianceSummary {
  /// Returns an <code>AggregateConformancePackComplianceCount</code> object.
  final AggregateConformancePackComplianceCount? complianceSummary;

  /// Groups the result based on AWS Account ID or AWS Region.
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

  Map<String, dynamic> toJson() {
    final complianceSummary = this.complianceSummary;
    final groupName = this.groupName;
    return {
      if (complianceSummary != null) 'ComplianceSummary': complianceSummary,
      if (groupName != null) 'GroupName': groupName,
    };
  }
}

/// Filters the results based on account ID and region.
class AggregateConformancePackComplianceSummaryFilters {
  /// The 12-digit AWS account ID of the source account.
  final String? accountId;

  /// The source AWS Region from where the data is aggregated.
  final String? awsRegion;

  AggregateConformancePackComplianceSummaryFilters({
    this.accountId,
    this.awsRegion,
  });

  factory AggregateConformancePackComplianceSummaryFilters.fromJson(
      Map<String, dynamic> json) {
    return AggregateConformancePackComplianceSummaryFilters(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
    );
  }

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
  accountId,
  awsRegion,
}

extension on AggregateConformancePackComplianceSummaryGroupKey {
  String toValue() {
    switch (this) {
      case AggregateConformancePackComplianceSummaryGroupKey.accountId:
        return 'ACCOUNT_ID';
      case AggregateConformancePackComplianceSummaryGroupKey.awsRegion:
        return 'AWS_REGION';
    }
  }
}

extension on String {
  AggregateConformancePackComplianceSummaryGroupKey
      toAggregateConformancePackComplianceSummaryGroupKey() {
    switch (this) {
      case 'ACCOUNT_ID':
        return AggregateConformancePackComplianceSummaryGroupKey.accountId;
      case 'AWS_REGION':
        return AggregateConformancePackComplianceSummaryGroupKey.awsRegion;
    }
    throw Exception(
        '$this is not known in enum AggregateConformancePackComplianceSummaryGroupKey');
  }
}

/// The details of an AWS Config evaluation for an account ID and region in an
/// aggregator. Provides the AWS resource that was evaluated, the compliance of
/// the resource, related time stamps, and supplementary information.
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
  /// For the <code>AggregationEvaluationResult</code> data type, AWS Config
  /// supports only the <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. AWS
  /// Config does not support the <code>NOT_APPLICABLE</code> and
  /// <code>INSUFFICIENT_DATA</code> value.
  final ComplianceType? complianceType;

  /// The time when the AWS Config rule evaluated the AWS resource.
  final DateTime? configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier? evaluationResultIdentifier;

  /// The time when AWS Config recorded the aggregate evaluation result.
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
      complianceType: (json['ComplianceType'] as String?)?.toComplianceType(),
      configRuleInvokedTime: timeStampFromJson(json['ConfigRuleInvokedTime']),
      evaluationResultIdentifier: json['EvaluationResultIdentifier'] != null
          ? EvaluationResultIdentifier.fromJson(
              json['EvaluationResultIdentifier'] as Map<String, dynamic>)
          : null,
      resultRecordedTime: timeStampFromJson(json['ResultRecordedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final annotation = this.annotation;
    final awsRegion = this.awsRegion;
    final complianceType = this.complianceType;
    final configRuleInvokedTime = this.configRuleInvokedTime;
    final evaluationResultIdentifier = this.evaluationResultIdentifier;
    final resultRecordedTime = this.resultRecordedTime;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (annotation != null) 'Annotation': annotation,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (configRuleInvokedTime != null)
        'ConfigRuleInvokedTime': unixTimestampToJson(configRuleInvokedTime),
      if (evaluationResultIdentifier != null)
        'EvaluationResultIdentifier': evaluationResultIdentifier,
      if (resultRecordedTime != null)
        'ResultRecordedTime': unixTimestampToJson(resultRecordedTime),
    };
  }
}

/// The details that identify a resource that is collected by AWS Config
/// aggregator, including the resource type, ID, (if available) the custom
/// resource name, the source account, and source region.
class AggregateResourceIdentifier {
  /// The ID of the AWS resource.
  final String resourceId;

  /// The type of the AWS resource.
  final ResourceType resourceType;

  /// The 12-digit account ID of the source account.
  final String sourceAccountId;

  /// The source region where data is aggregated.
  final String sourceRegion;

  /// The name of the AWS resource.
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
      resourceType: (json['ResourceType'] as String).toResourceType(),
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
      'ResourceType': resourceType.toValue(),
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

  /// The error code that AWS Config returned when the source account aggregation
  /// last failed.
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
      lastUpdateStatus:
          (json['LastUpdateStatus'] as String?)?.toAggregatedSourceStatusType(),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      sourceId: json['SourceId'] as String?,
      sourceType: (json['SourceType'] as String?)?.toAggregatedSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final lastErrorCode = this.lastErrorCode;
    final lastErrorMessage = this.lastErrorMessage;
    final lastUpdateStatus = this.lastUpdateStatus;
    final lastUpdateTime = this.lastUpdateTime;
    final sourceId = this.sourceId;
    final sourceType = this.sourceType;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (lastErrorCode != null) 'LastErrorCode': lastErrorCode,
      if (lastErrorMessage != null) 'LastErrorMessage': lastErrorMessage,
      if (lastUpdateStatus != null)
        'LastUpdateStatus': lastUpdateStatus.toValue(),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (sourceId != null) 'SourceId': sourceId,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

enum AggregatedSourceStatusType {
  failed,
  succeeded,
  outdated,
}

extension on AggregatedSourceStatusType {
  String toValue() {
    switch (this) {
      case AggregatedSourceStatusType.failed:
        return 'FAILED';
      case AggregatedSourceStatusType.succeeded:
        return 'SUCCEEDED';
      case AggregatedSourceStatusType.outdated:
        return 'OUTDATED';
    }
  }
}

extension on String {
  AggregatedSourceStatusType toAggregatedSourceStatusType() {
    switch (this) {
      case 'FAILED':
        return AggregatedSourceStatusType.failed;
      case 'SUCCEEDED':
        return AggregatedSourceStatusType.succeeded;
      case 'OUTDATED':
        return AggregatedSourceStatusType.outdated;
    }
    throw Exception('$this is not known in enum AggregatedSourceStatusType');
  }
}

enum AggregatedSourceType {
  account,
  organization,
}

extension on AggregatedSourceType {
  String toValue() {
    switch (this) {
      case AggregatedSourceType.account:
        return 'ACCOUNT';
      case AggregatedSourceType.organization:
        return 'ORGANIZATION';
    }
  }
}

extension on String {
  AggregatedSourceType toAggregatedSourceType() {
    switch (this) {
      case 'ACCOUNT':
        return AggregatedSourceType.account;
      case 'ORGANIZATION':
        return AggregatedSourceType.organization;
    }
    throw Exception('$this is not known in enum AggregatedSourceType');
  }
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

  Map<String, dynamic> toJson() {
    final aggregationAuthorizationArn = this.aggregationAuthorizationArn;
    final authorizedAccountId = this.authorizedAccountId;
    final authorizedAwsRegion = this.authorizedAwsRegion;
    final creationTime = this.creationTime;
    return {
      if (aggregationAuthorizationArn != null)
        'AggregationAuthorizationArn': aggregationAuthorizationArn,
      if (authorizedAccountId != null)
        'AuthorizedAccountId': authorizedAccountId,
      if (authorizedAwsRegion != null)
        'AuthorizedAwsRegion': authorizedAwsRegion,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
    };
  }
}

/// The detailed configuration of a specified resource.
class BaseConfigurationItem {
  /// The 12-digit AWS account ID associated with the resource.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The Availability Zone associated with the resource.
  final String? availabilityZone;

  /// The region where the resource resides.
  final String? awsRegion;

  /// The description of the resource configuration.
  final String? configuration;

  /// The time when the configuration recording was initiated.
  final DateTime? configurationItemCaptureTime;

  /// The configuration item status. The valid values are:
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
  /// not recorded since the recorder excludes the recording of resources of this
  /// type
  /// </li>
  /// <li>
  /// ResourceDeleted – The resource was deleted
  /// </li>
  /// <li>
  /// ResourceDeletedNotRecorded – The resource was deleted but its configuration
  /// was not recorded since the recorder excludes the recording of resources of
  /// this type
  /// </li>
  /// </ul> <note>
  /// The CIs do not incur any cost.
  /// </note>
  final ConfigurationItemStatus? configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String? configurationStateId;

  /// The time stamp when the resource was created.
  final DateTime? resourceCreationTime;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String? resourceId;

  /// The custom name of the resource, if available.
  final String? resourceName;

  /// The type of AWS resource.
  final ResourceType? resourceType;

  /// Configuration attributes that AWS Config returns for certain resource types
  /// to supplement the information returned for the configuration parameter.
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
    this.configurationItemStatus,
    this.configurationStateId,
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
      configurationItemStatus: (json['configurationItemStatus'] as String?)
          ?.toConfigurationItemStatus(),
      configurationStateId: json['configurationStateId'] as String?,
      resourceCreationTime: timeStampFromJson(json['resourceCreationTime']),
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      supplementaryConfiguration:
          (json['supplementaryConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final awsRegion = this.awsRegion;
    final configuration = this.configuration;
    final configurationItemCaptureTime = this.configurationItemCaptureTime;
    final configurationItemStatus = this.configurationItemStatus;
    final configurationStateId = this.configurationStateId;
    final resourceCreationTime = this.resourceCreationTime;
    final resourceId = this.resourceId;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final supplementaryConfiguration = this.supplementaryConfiguration;
    final version = this.version;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (configuration != null) 'configuration': configuration,
      if (configurationItemCaptureTime != null)
        'configurationItemCaptureTime':
            unixTimestampToJson(configurationItemCaptureTime),
      if (configurationItemStatus != null)
        'configurationItemStatus': configurationItemStatus.toValue(),
      if (configurationStateId != null)
        'configurationStateId': configurationStateId,
      if (resourceCreationTime != null)
        'resourceCreationTime': unixTimestampToJson(resourceCreationTime),
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (supplementaryConfiguration != null)
        'supplementaryConfiguration': supplementaryConfiguration,
      if (version != null) 'version': version,
    };
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
          ?.whereNotNull()
          .map((e) => BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedResourceIdentifiers: (json['UnprocessedResourceIdentifiers']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseConfigurationItems = this.baseConfigurationItems;
    final unprocessedResourceIdentifiers = this.unprocessedResourceIdentifiers;
    return {
      if (baseConfigurationItems != null)
        'BaseConfigurationItems': baseConfigurationItems,
      if (unprocessedResourceIdentifiers != null)
        'UnprocessedResourceIdentifiers': unprocessedResourceIdentifiers,
    };
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
          ?.whereNotNull()
          .map((e) => BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedResourceKeys: (json['unprocessedResourceKeys'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseConfigurationItems = this.baseConfigurationItems;
    final unprocessedResourceKeys = this.unprocessedResourceKeys;
    return {
      if (baseConfigurationItems != null)
        'baseConfigurationItems': baseConfigurationItems,
      if (unprocessedResourceKeys != null)
        'unprocessedResourceKeys': unprocessedResourceKeys,
    };
  }
}

enum ChronologicalOrder {
  reverse,
  forward,
}

extension on ChronologicalOrder {
  String toValue() {
    switch (this) {
      case ChronologicalOrder.reverse:
        return 'Reverse';
      case ChronologicalOrder.forward:
        return 'Forward';
    }
  }
}

extension on String {
  ChronologicalOrder toChronologicalOrder() {
    switch (this) {
      case 'Reverse':
        return ChronologicalOrder.reverse;
      case 'Forward':
        return ChronologicalOrder.forward;
    }
    throw Exception('$this is not known in enum ChronologicalOrder');
  }
}

/// Indicates whether an AWS resource or AWS Config rule is compliant and
/// provides the number of contributors that affect the compliance.
class Compliance {
  /// The number of AWS resources or AWS Config rules that cause a result of
  /// <code>NON_COMPLIANT</code>, up to a maximum number.
  final ComplianceContributorCount? complianceContributorCount;

  /// Indicates whether an AWS resource or AWS Config rule is compliant.
  ///
  /// A resource is compliant if it complies with all of the AWS Config rules that
  /// evaluate it. A resource is noncompliant if it does not comply with one or
  /// more of these rules.
  ///
  /// A rule is compliant if all of the resources that the rule evaluates comply
  /// with it. A rule is noncompliant if any of these resources do not comply.
  ///
  /// AWS Config returns the <code>INSUFFICIENT_DATA</code> value when no
  /// evaluation results are available for the AWS resource or AWS Config rule.
  ///
  /// For the <code>Compliance</code> data type, AWS Config supports only
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>INSUFFICIENT_DATA</code> values. AWS Config does not support the
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
      complianceType: (json['ComplianceType'] as String?)?.toComplianceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceContributorCount = this.complianceContributorCount;
    final complianceType = this.complianceType;
    return {
      if (complianceContributorCount != null)
        'ComplianceContributorCount': complianceContributorCount,
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
    };
  }
}

/// Indicates whether an AWS Config rule is compliant. A rule is compliant if
/// all of the resources that the rule evaluated comply with it. A rule is
/// noncompliant if any of these resources do not comply.
class ComplianceByConfigRule {
  /// Indicates whether the AWS Config rule is compliant.
  final Compliance? compliance;

  /// The name of the AWS Config rule.
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

  Map<String, dynamic> toJson() {
    final compliance = this.compliance;
    final configRuleName = this.configRuleName;
    return {
      if (compliance != null) 'Compliance': compliance,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
    };
  }
}

/// Indicates whether an AWS resource that is evaluated according to one or more
/// AWS Config rules is compliant. A resource is compliant if it complies with
/// all of the rules that evaluate it. A resource is noncompliant if it does not
/// comply with one or more of these rules.
class ComplianceByResource {
  /// Indicates whether the AWS resource complies with all of the AWS Config rules
  /// that evaluated it.
  final Compliance? compliance;

  /// The ID of the AWS resource that was evaluated.
  final String? resourceId;

  /// The type of the AWS resource that was evaluated.
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

  Map<String, dynamic> toJson() {
    final compliance = this.compliance;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (compliance != null) 'Compliance': compliance,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// The number of AWS resources or AWS Config rules responsible for the current
/// compliance of the item, up to a maximum number.
class ComplianceContributorCount {
  /// Indicates whether the maximum count is reached.
  final bool? capExceeded;

  /// The number of AWS resources or AWS Config rules responsible for the current
  /// compliance of the item.
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

  Map<String, dynamic> toJson() {
    final capExceeded = this.capExceeded;
    final cappedCount = this.cappedCount;
    return {
      if (capExceeded != null) 'CapExceeded': capExceeded,
      if (cappedCount != null) 'CappedCount': cappedCount,
    };
  }
}

/// The number of AWS Config rules or AWS resources that are compliant and
/// noncompliant.
class ComplianceSummary {
  /// The time that AWS Config created the compliance summary.
  final DateTime? complianceSummaryTimestamp;

  /// The number of AWS Config rules or AWS resources that are compliant, up to a
  /// maximum of 25 for rules and 100 for resources.
  final ComplianceContributorCount? compliantResourceCount;

  /// The number of AWS Config rules or AWS resources that are noncompliant, up to
  /// a maximum of 25 for rules and 100 for resources.
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

  Map<String, dynamic> toJson() {
    final complianceSummaryTimestamp = this.complianceSummaryTimestamp;
    final compliantResourceCount = this.compliantResourceCount;
    final nonCompliantResourceCount = this.nonCompliantResourceCount;
    return {
      if (complianceSummaryTimestamp != null)
        'ComplianceSummaryTimestamp':
            unixTimestampToJson(complianceSummaryTimestamp),
      if (compliantResourceCount != null)
        'CompliantResourceCount': compliantResourceCount,
      if (nonCompliantResourceCount != null)
        'NonCompliantResourceCount': nonCompliantResourceCount,
    };
  }
}

/// The number of AWS resources of a specific type that are compliant or
/// noncompliant, up to a maximum of 100 for each.
class ComplianceSummaryByResourceType {
  /// The number of AWS resources that are compliant or noncompliant, up to a
  /// maximum of 100 for each.
  final ComplianceSummary? complianceSummary;

  /// The type of AWS resource.
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

  Map<String, dynamic> toJson() {
    final complianceSummary = this.complianceSummary;
    final resourceType = this.resourceType;
    return {
      if (complianceSummary != null) 'ComplianceSummary': complianceSummary,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

enum ComplianceType {
  compliant,
  nonCompliant,
  notApplicable,
  insufficientData,
}

extension on ComplianceType {
  String toValue() {
    switch (this) {
      case ComplianceType.compliant:
        return 'COMPLIANT';
      case ComplianceType.nonCompliant:
        return 'NON_COMPLIANT';
      case ComplianceType.notApplicable:
        return 'NOT_APPLICABLE';
      case ComplianceType.insufficientData:
        return 'INSUFFICIENT_DATA';
    }
  }
}

extension on String {
  ComplianceType toComplianceType() {
    switch (this) {
      case 'COMPLIANT':
        return ComplianceType.compliant;
      case 'NON_COMPLIANT':
        return ComplianceType.nonCompliant;
      case 'NOT_APPLICABLE':
        return ComplianceType.notApplicable;
      case 'INSUFFICIENT_DATA':
        return ComplianceType.insufficientData;
    }
    throw Exception('$this is not known in enum ComplianceType');
  }
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
      lastStatus: (json['lastStatus'] as String?)?.toDeliveryStatus(),
      lastSuccessfulTime: timeStampFromJson(json['lastSuccessfulTime']),
      nextDeliveryTime: timeStampFromJson(json['nextDeliveryTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastAttemptTime = this.lastAttemptTime;
    final lastErrorCode = this.lastErrorCode;
    final lastErrorMessage = this.lastErrorMessage;
    final lastStatus = this.lastStatus;
    final lastSuccessfulTime = this.lastSuccessfulTime;
    final nextDeliveryTime = this.nextDeliveryTime;
    return {
      if (lastAttemptTime != null)
        'lastAttemptTime': unixTimestampToJson(lastAttemptTime),
      if (lastErrorCode != null) 'lastErrorCode': lastErrorCode,
      if (lastErrorMessage != null) 'lastErrorMessage': lastErrorMessage,
      if (lastStatus != null) 'lastStatus': lastStatus.toValue(),
      if (lastSuccessfulTime != null)
        'lastSuccessfulTime': unixTimestampToJson(lastSuccessfulTime),
      if (nextDeliveryTime != null)
        'nextDeliveryTime': unixTimestampToJson(nextDeliveryTime),
    };
  }
}

/// An AWS Config rule represents an AWS Lambda function that you create for a
/// custom rule or a predefined function for an AWS managed rule. The function
/// evaluates configuration items to assess whether your AWS resources comply
/// with your desired configurations. This function can run when AWS Config
/// detects a configuration change to an AWS resource and at a periodic
/// frequency that you choose (for example, every 24 hours).
/// <note>
/// You can use the AWS CLI and AWS SDKs if you want to create a rule that
/// triggers evaluations for your resources when AWS Config delivers the
/// configuration snapshot. For more information, see
/// <a>ConfigSnapshotDeliveryProperties</a>.
/// </note>
/// For more information about developing and using AWS Config rules, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html">Evaluating
/// AWS Resource Configurations with AWS Config</a> in the <i>AWS Config
/// Developer Guide</i>.
class ConfigRule {
  /// Provides the rule owner (AWS or customer), the rule identifier, and the
  /// notifications that cause the function to evaluate your AWS resources.
  final Source source;

  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  final String? configRuleArn;

  /// The ID of the AWS Config rule.
  final String? configRuleId;

  /// The name that you assign to the AWS Config rule. The name is required if you
  /// are adding a new rule.
  final String? configRuleName;

  /// Indicates whether the AWS Config rule is active or is currently being
  /// deleted by AWS Config. It can also indicate the evaluation status for the
  /// AWS Config rule.
  ///
  /// AWS Config sets the state of the rule to <code>EVALUATING</code> temporarily
  /// after you use the <code>StartConfigRulesEvaluation</code> request to
  /// evaluate your resources against the AWS Config rule.
  ///
  /// AWS Config sets the state of the rule to <code>DELETING_RESULTS</code>
  /// temporarily after you use the <code>DeleteEvaluationResults</code> request
  /// to delete the current evaluation results for the AWS Config rule.
  ///
  /// AWS Config temporarily sets the state of a rule to <code>DELETING</code>
  /// after you use the <code>DeleteConfigRule</code> request to delete the rule.
  /// After AWS Config deletes the rule, the rule and all of its evaluations are
  /// erased and are no longer available.
  final ConfigRuleState? configRuleState;

  /// Service principal name of the service that created the rule.
  /// <note>
  /// The field is populated only if the service linked rule is created by a
  /// service. The field is empty if you create your own rule.
  /// </note>
  final String? createdBy;

  /// The description that you provide for the AWS Config rule.
  final String? description;

  /// A string, in JSON format, that is passed to the AWS Config rule Lambda
  /// function.
  final String? inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule. You
  /// can specify a value for <code>MaximumExecutionFrequency</code> when:
  ///
  /// <ul>
  /// <li>
  /// You are using an AWS managed rule that is triggered at a periodic frequency.
  /// </li>
  /// <li>
  /// Your custom rule is triggered when AWS Config delivers the configuration
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
          (json['ConfigRuleState'] as String?)?.toConfigRuleState(),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.toMaximumExecutionFrequency(),
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
    final inputParameters = this.inputParameters;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final scope = this.scope;
    return {
      'Source': source,
      if (configRuleArn != null) 'ConfigRuleArn': configRuleArn,
      if (configRuleId != null) 'ConfigRuleId': configRuleId,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
      if (configRuleState != null) 'ConfigRuleState': configRuleState.toValue(),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.toValue(),
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
  /// For the <code>ConfigRuleComplianceFilters</code> data type, AWS Config
  /// supports only <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. AWS
  /// Config does not support the <code>NOT_APPLICABLE</code> and the
  /// <code>INSUFFICIENT_DATA</code> values.
  final ComplianceType? complianceType;

  /// The name of the AWS Config rule.
  final String? configRuleName;

  ConfigRuleComplianceFilters({
    this.accountId,
    this.awsRegion,
    this.complianceType,
    this.configRuleName,
  });

  factory ConfigRuleComplianceFilters.fromJson(Map<String, dynamic> json) {
    return ConfigRuleComplianceFilters(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      complianceType: (json['ComplianceType'] as String?)?.toComplianceType(),
      configRuleName: json['ConfigRuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final complianceType = this.complianceType;
    final configRuleName = this.configRuleName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
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

  factory ConfigRuleComplianceSummaryFilters.fromJson(
      Map<String, dynamic> json) {
    return ConfigRuleComplianceSummaryFilters(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
    );
  }

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
  accountId,
  awsRegion,
}

extension on ConfigRuleComplianceSummaryGroupKey {
  String toValue() {
    switch (this) {
      case ConfigRuleComplianceSummaryGroupKey.accountId:
        return 'ACCOUNT_ID';
      case ConfigRuleComplianceSummaryGroupKey.awsRegion:
        return 'AWS_REGION';
    }
  }
}

extension on String {
  ConfigRuleComplianceSummaryGroupKey toConfigRuleComplianceSummaryGroupKey() {
    switch (this) {
      case 'ACCOUNT_ID':
        return ConfigRuleComplianceSummaryGroupKey.accountId;
      case 'AWS_REGION':
        return ConfigRuleComplianceSummaryGroupKey.awsRegion;
    }
    throw Exception(
        '$this is not known in enum ConfigRuleComplianceSummaryGroupKey');
  }
}

/// Status information for your AWS managed Config rules. The status includes
/// information such as the last time the rule ran, the last time it failed, and
/// the related error for the last failure.
///
/// This action does not return status information about custom AWS Config
/// rules.
class ConfigRuleEvaluationStatus {
  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  final String? configRuleArn;

  /// The ID of the AWS Config rule.
  final String? configRuleId;

  /// The name of the AWS Config rule.
  final String? configRuleName;

  /// The time that you first activated the AWS Config rule.
  final DateTime? firstActivatedTime;

  /// Indicates whether AWS Config has evaluated your resources against the rule
  /// at least once.
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> - AWS Config has evaluated your AWS resources against the
  /// rule at least once.
  /// </li>
  /// <li>
  /// <code>false</code> - AWS Config has not once finished evaluating your AWS
  /// resources against the rule.
  /// </li>
  /// </ul>
  final bool? firstEvaluationStarted;

  /// The time that you last turned off the AWS Config rule.
  final DateTime? lastDeactivatedTime;

  /// The error code that AWS Config returned when the rule last failed.
  final String? lastErrorCode;

  /// The error message that AWS Config returned when the rule last failed.
  final String? lastErrorMessage;

  /// The time that AWS Config last failed to evaluate your AWS resources against
  /// the rule.
  final DateTime? lastFailedEvaluationTime;

  /// The time that AWS Config last failed to invoke the AWS Config rule to
  /// evaluate your AWS resources.
  final DateTime? lastFailedInvocationTime;

  /// The time that AWS Config last successfully evaluated your AWS resources
  /// against the rule.
  final DateTime? lastSuccessfulEvaluationTime;

  /// The time that AWS Config last successfully invoked the AWS Config rule to
  /// evaluate your AWS resources.
  final DateTime? lastSuccessfulInvocationTime;

  ConfigRuleEvaluationStatus({
    this.configRuleArn,
    this.configRuleId,
    this.configRuleName,
    this.firstActivatedTime,
    this.firstEvaluationStarted,
    this.lastDeactivatedTime,
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

  Map<String, dynamic> toJson() {
    final configRuleArn = this.configRuleArn;
    final configRuleId = this.configRuleId;
    final configRuleName = this.configRuleName;
    final firstActivatedTime = this.firstActivatedTime;
    final firstEvaluationStarted = this.firstEvaluationStarted;
    final lastDeactivatedTime = this.lastDeactivatedTime;
    final lastErrorCode = this.lastErrorCode;
    final lastErrorMessage = this.lastErrorMessage;
    final lastFailedEvaluationTime = this.lastFailedEvaluationTime;
    final lastFailedInvocationTime = this.lastFailedInvocationTime;
    final lastSuccessfulEvaluationTime = this.lastSuccessfulEvaluationTime;
    final lastSuccessfulInvocationTime = this.lastSuccessfulInvocationTime;
    return {
      if (configRuleArn != null) 'ConfigRuleArn': configRuleArn,
      if (configRuleId != null) 'ConfigRuleId': configRuleId,
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
      if (firstActivatedTime != null)
        'FirstActivatedTime': unixTimestampToJson(firstActivatedTime),
      if (firstEvaluationStarted != null)
        'FirstEvaluationStarted': firstEvaluationStarted,
      if (lastDeactivatedTime != null)
        'LastDeactivatedTime': unixTimestampToJson(lastDeactivatedTime),
      if (lastErrorCode != null) 'LastErrorCode': lastErrorCode,
      if (lastErrorMessage != null) 'LastErrorMessage': lastErrorMessage,
      if (lastFailedEvaluationTime != null)
        'LastFailedEvaluationTime':
            unixTimestampToJson(lastFailedEvaluationTime),
      if (lastFailedInvocationTime != null)
        'LastFailedInvocationTime':
            unixTimestampToJson(lastFailedInvocationTime),
      if (lastSuccessfulEvaluationTime != null)
        'LastSuccessfulEvaluationTime':
            unixTimestampToJson(lastSuccessfulEvaluationTime),
      if (lastSuccessfulInvocationTime != null)
        'LastSuccessfulInvocationTime':
            unixTimestampToJson(lastSuccessfulInvocationTime),
    };
  }
}

enum ConfigRuleState {
  active,
  deleting,
  deletingResults,
  evaluating,
}

extension on ConfigRuleState {
  String toValue() {
    switch (this) {
      case ConfigRuleState.active:
        return 'ACTIVE';
      case ConfigRuleState.deleting:
        return 'DELETING';
      case ConfigRuleState.deletingResults:
        return 'DELETING_RESULTS';
      case ConfigRuleState.evaluating:
        return 'EVALUATING';
    }
  }
}

extension on String {
  ConfigRuleState toConfigRuleState() {
    switch (this) {
      case 'ACTIVE':
        return ConfigRuleState.active;
      case 'DELETING':
        return ConfigRuleState.deleting;
      case 'DELETING_RESULTS':
        return ConfigRuleState.deletingResults;
      case 'EVALUATING':
        return ConfigRuleState.evaluating;
    }
    throw Exception('$this is not known in enum ConfigRuleState');
  }
}

/// Provides options for how often AWS Config delivers configuration snapshots
/// to the Amazon S3 bucket in your delivery channel.
///
/// The frequency for a rule that triggers evaluations for your resources when
/// AWS Config delivers the configuration snapshot is set by one of two values,
/// depending on which is less frequent:
///
/// <ul>
/// <li>
/// The value for the <code>deliveryFrequency</code> parameter within the
/// delivery channel configuration, which sets how often AWS Config delivers
/// configuration snapshots. This value also sets how often AWS Config invokes
/// evaluations for AWS Config rules.
/// </li>
/// <li>
/// The value for the <code>MaximumExecutionFrequency</code> parameter, which
/// sets the maximum frequency with which AWS Config invokes evaluations for the
/// rule. For more information, see <a>ConfigRule</a>.
/// </li>
/// </ul>
/// If the <code>deliveryFrequency</code> value is less frequent than the
/// <code>MaximumExecutionFrequency</code> value for a rule, AWS Config invokes
/// the rule only as often as the <code>deliveryFrequency</code> value.
/// <ol>
/// <li>
/// For example, you want your rule to run evaluations when AWS Config delivers
/// the configuration snapshot.
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
/// <code>MaximumExecutionFrequency</code>, AWS Config invokes evaluations for
/// the rule every 24 hours.
/// </li> </ol>
/// You should set the <code>MaximumExecutionFrequency</code> value to be at
/// least as frequent as the <code>deliveryFrequency</code> value. You can view
/// the <code>deliveryFrequency</code> value by using the
/// <code>DescribeDeliveryChannnels</code> action.
///
/// To update the <code>deliveryFrequency</code> with which AWS Config delivers
/// your configuration snapshots, use the <code>PutDeliveryChannel</code>
/// action.
class ConfigSnapshotDeliveryProperties {
  /// The frequency with which AWS Config delivers configuration snapshots.
  final MaximumExecutionFrequency? deliveryFrequency;

  ConfigSnapshotDeliveryProperties({
    this.deliveryFrequency,
  });

  factory ConfigSnapshotDeliveryProperties.fromJson(Map<String, dynamic> json) {
    return ConfigSnapshotDeliveryProperties(
      deliveryFrequency:
          (json['deliveryFrequency'] as String?)?.toMaximumExecutionFrequency(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryFrequency = this.deliveryFrequency;
    return {
      if (deliveryFrequency != null)
        'deliveryFrequency': deliveryFrequency.toValue(),
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
  /// for AWS Config is optional. If the SNS delivery is turned off, the last
  /// status will be <b>Not_Applicable</b>.
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
      lastStatus: (json['lastStatus'] as String?)?.toDeliveryStatus(),
      lastStatusChangeTime: timeStampFromJson(json['lastStatusChangeTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastErrorCode = this.lastErrorCode;
    final lastErrorMessage = this.lastErrorMessage;
    final lastStatus = this.lastStatus;
    final lastStatusChangeTime = this.lastStatusChangeTime;
    return {
      if (lastErrorCode != null) 'lastErrorCode': lastErrorCode,
      if (lastErrorMessage != null) 'lastErrorMessage': lastErrorMessage,
      if (lastStatus != null) 'lastStatus': lastStatus.toValue(),
      if (lastStatusChangeTime != null)
        'lastStatusChangeTime': unixTimestampToJson(lastStatusChangeTime),
    };
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

  /// AWS service that created the configuration aggregator.
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
          ?.whereNotNull()
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

  Map<String, dynamic> toJson() {
    final accountAggregationSources = this.accountAggregationSources;
    final configurationAggregatorArn = this.configurationAggregatorArn;
    final configurationAggregatorName = this.configurationAggregatorName;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final organizationAggregationSource = this.organizationAggregationSource;
    return {
      if (accountAggregationSources != null)
        'AccountAggregationSources': accountAggregationSources,
      if (configurationAggregatorArn != null)
        'ConfigurationAggregatorArn': configurationAggregatorArn,
      if (configurationAggregatorName != null)
        'ConfigurationAggregatorName': configurationAggregatorName,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (organizationAggregationSource != null)
        'OrganizationAggregationSource': organizationAggregationSource,
    };
  }
}

/// A list that contains detailed configurations of a specified resource.
class ConfigurationItem {
  /// The 12-digit AWS account ID associated with the resource.
  final String? accountId;

  /// Amazon Resource Name (ARN) associated with the resource.
  final String? arn;

  /// The Availability Zone associated with the resource.
  final String? availabilityZone;

  /// The region where the resource resides.
  final String? awsRegion;

  /// The description of the resource configuration.
  final String? configuration;

  /// The time when the configuration recording was initiated.
  final DateTime? configurationItemCaptureTime;

  /// Unique MD5 hash that represents the configuration item's state.
  ///
  /// You can use MD5 hash to compare the states of two or more configuration
  /// items that are associated with the same resource.
  final String? configurationItemMD5Hash;

  /// The configuration item status. The valid values are:
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
  /// not recorded since the recorder excludes the recording of resources of this
  /// type
  /// </li>
  /// <li>
  /// ResourceDeleted – The resource was deleted
  /// </li>
  /// <li>
  /// ResourceDeletedNotRecorded – The resource was deleted but its configuration
  /// was not recorded since the recorder excludes the recording of resources of
  /// this type
  /// </li>
  /// </ul> <note>
  /// The CIs do not incur any cost.
  /// </note>
  final ConfigurationItemStatus? configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String? configurationStateId;

  /// A list of CloudTrail event IDs.
  ///
  /// A populated field indicates that the current configuration was initiated by
  /// the events recorded in the CloudTrail log. For more information about
  /// CloudTrail, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html">What
  /// Is AWS CloudTrail</a>.
  ///
  /// An empty field indicates that the current configuration was not initiated by
  /// any event. As of Version 1.3, the relatedEvents field is empty. You can
  /// access the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html">LookupEvents
  /// API</a> in the <i>AWS CloudTrail API Reference</i> to retrieve the events
  /// for the resource.
  final List<String>? relatedEvents;

  /// A list of related AWS resources.
  final List<Relationship>? relationships;

  /// The time stamp when the resource was created.
  final DateTime? resourceCreationTime;

  /// The ID of the resource (for example, <code>sg-xxxxxx</code>).
  final String? resourceId;

  /// The custom name of the resource, if available.
  final String? resourceName;

  /// The type of AWS resource.
  final ResourceType? resourceType;

  /// Configuration attributes that AWS Config returns for certain resource types
  /// to supplement the information returned for the <code>configuration</code>
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
    this.configurationItemMD5Hash,
    this.configurationItemStatus,
    this.configurationStateId,
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
      configurationItemMD5Hash: json['configurationItemMD5Hash'] as String?,
      configurationItemStatus: (json['configurationItemStatus'] as String?)
          ?.toConfigurationItemStatus(),
      configurationStateId: json['configurationStateId'] as String?,
      relatedEvents: (json['relatedEvents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relationships: (json['relationships'] as List?)
          ?.whereNotNull()
          .map((e) => Relationship.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceCreationTime: timeStampFromJson(json['resourceCreationTime']),
      resourceId: json['resourceId'] as String?,
      resourceName: json['resourceName'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      supplementaryConfiguration:
          (json['supplementaryConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final awsRegion = this.awsRegion;
    final configuration = this.configuration;
    final configurationItemCaptureTime = this.configurationItemCaptureTime;
    final configurationItemMD5Hash = this.configurationItemMD5Hash;
    final configurationItemStatus = this.configurationItemStatus;
    final configurationStateId = this.configurationStateId;
    final relatedEvents = this.relatedEvents;
    final relationships = this.relationships;
    final resourceCreationTime = this.resourceCreationTime;
    final resourceId = this.resourceId;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final supplementaryConfiguration = this.supplementaryConfiguration;
    final tags = this.tags;
    final version = this.version;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (configuration != null) 'configuration': configuration,
      if (configurationItemCaptureTime != null)
        'configurationItemCaptureTime':
            unixTimestampToJson(configurationItemCaptureTime),
      if (configurationItemMD5Hash != null)
        'configurationItemMD5Hash': configurationItemMD5Hash,
      if (configurationItemStatus != null)
        'configurationItemStatus': configurationItemStatus.toValue(),
      if (configurationStateId != null)
        'configurationStateId': configurationStateId,
      if (relatedEvents != null) 'relatedEvents': relatedEvents,
      if (relationships != null) 'relationships': relationships,
      if (resourceCreationTime != null)
        'resourceCreationTime': unixTimestampToJson(resourceCreationTime),
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (supplementaryConfiguration != null)
        'supplementaryConfiguration': supplementaryConfiguration,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

enum ConfigurationItemStatus {
  ok,
  resourceDiscovered,
  resourceNotRecorded,
  resourceDeleted,
  resourceDeletedNotRecorded,
}

extension on ConfigurationItemStatus {
  String toValue() {
    switch (this) {
      case ConfigurationItemStatus.ok:
        return 'OK';
      case ConfigurationItemStatus.resourceDiscovered:
        return 'ResourceDiscovered';
      case ConfigurationItemStatus.resourceNotRecorded:
        return 'ResourceNotRecorded';
      case ConfigurationItemStatus.resourceDeleted:
        return 'ResourceDeleted';
      case ConfigurationItemStatus.resourceDeletedNotRecorded:
        return 'ResourceDeletedNotRecorded';
    }
  }
}

extension on String {
  ConfigurationItemStatus toConfigurationItemStatus() {
    switch (this) {
      case 'OK':
        return ConfigurationItemStatus.ok;
      case 'ResourceDiscovered':
        return ConfigurationItemStatus.resourceDiscovered;
      case 'ResourceNotRecorded':
        return ConfigurationItemStatus.resourceNotRecorded;
      case 'ResourceDeleted':
        return ConfigurationItemStatus.resourceDeleted;
      case 'ResourceDeletedNotRecorded':
        return ConfigurationItemStatus.resourceDeletedNotRecorded;
    }
    throw Exception('$this is not known in enum ConfigurationItemStatus');
  }
}

/// An object that represents the recording of configuration changes of an AWS
/// resource.
class ConfigurationRecorder {
  /// The name of the recorder. By default, AWS Config automatically assigns the
  /// name "default" when creating the configuration recorder. You cannot change
  /// the assigned name.
  final String? name;

  /// Specifies the types of AWS resources for which AWS Config records
  /// configuration changes.
  final RecordingGroup? recordingGroup;

  /// Amazon Resource Name (ARN) of the IAM role used to describe the AWS
  /// resources associated with the account.
  final String? roleARN;

  ConfigurationRecorder({
    this.name,
    this.recordingGroup,
    this.roleARN,
  });

  factory ConfigurationRecorder.fromJson(Map<String, dynamic> json) {
    return ConfigurationRecorder(
      name: json['name'] as String?,
      recordingGroup: json['recordingGroup'] != null
          ? RecordingGroup.fromJson(
              json['recordingGroup'] as Map<String, dynamic>)
          : null,
      roleARN: json['roleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recordingGroup = this.recordingGroup;
    final roleARN = this.roleARN;
    return {
      if (name != null) 'name': name,
      if (recordingGroup != null) 'recordingGroup': recordingGroup,
      if (roleARN != null) 'roleARN': roleARN,
    };
  }
}

/// The current status of the configuration recorder.
class ConfigurationRecorderStatus {
  /// The error code indicating that the recording failed.
  final String? lastErrorCode;

  /// The message indicating that the recording failed due to an error.
  final String? lastErrorMessage;

  /// The time the recorder was last started.
  final DateTime? lastStartTime;

  /// The last (previous) status of the recorder.
  final RecorderStatus? lastStatus;

  /// The time when the status was last changed.
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
      lastStatus: (json['lastStatus'] as String?)?.toRecorderStatus(),
      lastStatusChangeTime: timeStampFromJson(json['lastStatusChangeTime']),
      lastStopTime: timeStampFromJson(json['lastStopTime']),
      name: json['name'] as String?,
      recording: json['recording'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastErrorCode = this.lastErrorCode;
    final lastErrorMessage = this.lastErrorMessage;
    final lastStartTime = this.lastStartTime;
    final lastStatus = this.lastStatus;
    final lastStatusChangeTime = this.lastStatusChangeTime;
    final lastStopTime = this.lastStopTime;
    final name = this.name;
    final recording = this.recording;
    return {
      if (lastErrorCode != null) 'lastErrorCode': lastErrorCode,
      if (lastErrorMessage != null) 'lastErrorMessage': lastErrorMessage,
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (lastStatus != null) 'lastStatus': lastStatus.toValue(),
      if (lastStatusChangeTime != null)
        'lastStatusChangeTime': unixTimestampToJson(lastStatusChangeTime),
      if (lastStopTime != null)
        'lastStopTime': unixTimestampToJson(lastStopTime),
      if (name != null) 'name': name,
      if (recording != null) 'recording': recording,
    };
  }
}

/// Filters the conformance pack by compliance types and AWS Config rule names.
class ConformancePackComplianceFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType? complianceType;

  /// Filters the results by AWS Config rule names.
  final List<String>? configRuleNames;

  ConformancePackComplianceFilters({
    this.complianceType,
    this.configRuleNames,
  });

  factory ConformancePackComplianceFilters.fromJson(Map<String, dynamic> json) {
    return ConformancePackComplianceFilters(
      complianceType: (json['ComplianceType'] as String?)
          ?.toConformancePackComplianceType(),
      configRuleNames: (json['ConfigRuleNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleNames = this.configRuleNames;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
    };
  }
}

/// Summary includes the name and status of the conformance pack.
class ConformancePackComplianceSummary {
  /// The status of the conformance pack. The allowed values are
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code> and
  /// <code>INSUFFICIENT_DATA</code>.
  final ConformancePackComplianceType conformancePackComplianceStatus;

  /// The name of the conformance pack name.
  final String conformancePackName;

  ConformancePackComplianceSummary({
    required this.conformancePackComplianceStatus,
    required this.conformancePackName,
  });

  factory ConformancePackComplianceSummary.fromJson(Map<String, dynamic> json) {
    return ConformancePackComplianceSummary(
      conformancePackComplianceStatus:
          (json['ConformancePackComplianceStatus'] as String)
              .toConformancePackComplianceType(),
      conformancePackName: json['ConformancePackName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackComplianceStatus =
        this.conformancePackComplianceStatus;
    final conformancePackName = this.conformancePackName;
    return {
      'ConformancePackComplianceStatus':
          conformancePackComplianceStatus.toValue(),
      'ConformancePackName': conformancePackName,
    };
  }
}

enum ConformancePackComplianceType {
  compliant,
  nonCompliant,
  insufficientData,
}

extension on ConformancePackComplianceType {
  String toValue() {
    switch (this) {
      case ConformancePackComplianceType.compliant:
        return 'COMPLIANT';
      case ConformancePackComplianceType.nonCompliant:
        return 'NON_COMPLIANT';
      case ConformancePackComplianceType.insufficientData:
        return 'INSUFFICIENT_DATA';
    }
  }
}

extension on String {
  ConformancePackComplianceType toConformancePackComplianceType() {
    switch (this) {
      case 'COMPLIANT':
        return ConformancePackComplianceType.compliant;
      case 'NON_COMPLIANT':
        return ConformancePackComplianceType.nonCompliant;
      case 'INSUFFICIENT_DATA':
        return ConformancePackComplianceType.insufficientData;
    }
    throw Exception('$this is not known in enum ConformancePackComplianceType');
  }
}

/// Returns details of a conformance pack. A conformance pack is a collection of
/// AWS Config rules and remediation actions that can be easily deployed in an
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

  /// AWS service that created the conformance pack.
  final String? createdBy;

  /// Amazon S3 bucket where AWS Config stores conformance pack templates.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3Bucket;

  /// The prefix for the Amazon S3 bucket.
  /// <note>
  /// This field is optional.
  /// </note>
  final String? deliveryS3KeyPrefix;

  /// Last time when conformation pack update was requested.
  final DateTime? lastUpdateRequestedTime;

  ConformancePackDetail({
    required this.conformancePackArn,
    required this.conformancePackId,
    required this.conformancePackName,
    this.conformancePackInputParameters,
    this.createdBy,
    this.deliveryS3Bucket,
    this.deliveryS3KeyPrefix,
    this.lastUpdateRequestedTime,
  });

  factory ConformancePackDetail.fromJson(Map<String, dynamic> json) {
    return ConformancePackDetail(
      conformancePackArn: json['ConformancePackArn'] as String,
      conformancePackId: json['ConformancePackId'] as String,
      conformancePackName: json['ConformancePackName'] as String,
      conformancePackInputParameters: (json['ConformancePackInputParameters']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['CreatedBy'] as String?,
      deliveryS3Bucket: json['DeliveryS3Bucket'] as String?,
      deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String?,
      lastUpdateRequestedTime:
          timeStampFromJson(json['LastUpdateRequestedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackArn = this.conformancePackArn;
    final conformancePackId = this.conformancePackId;
    final conformancePackName = this.conformancePackName;
    final conformancePackInputParameters = this.conformancePackInputParameters;
    final createdBy = this.createdBy;
    final deliveryS3Bucket = this.deliveryS3Bucket;
    final deliveryS3KeyPrefix = this.deliveryS3KeyPrefix;
    final lastUpdateRequestedTime = this.lastUpdateRequestedTime;
    return {
      'ConformancePackArn': conformancePackArn,
      'ConformancePackId': conformancePackId,
      'ConformancePackName': conformancePackName,
      if (conformancePackInputParameters != null)
        'ConformancePackInputParameters': conformancePackInputParameters,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (deliveryS3Bucket != null) 'DeliveryS3Bucket': deliveryS3Bucket,
      if (deliveryS3KeyPrefix != null)
        'DeliveryS3KeyPrefix': deliveryS3KeyPrefix,
      if (lastUpdateRequestedTime != null)
        'LastUpdateRequestedTime': unixTimestampToJson(lastUpdateRequestedTime),
    };
  }
}

/// Filters a conformance pack by AWS Config rule names, compliance types, AWS
/// resource types, and resource IDs.
class ConformancePackEvaluationFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType? complianceType;

  /// Filters the results by AWS Config rule names.
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

  factory ConformancePackEvaluationFilters.fromJson(Map<String, dynamic> json) {
    return ConformancePackEvaluationFilters(
      complianceType: (json['ComplianceType'] as String?)
          ?.toConformancePackComplianceType(),
      configRuleNames: (json['ConfigRuleNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceIds: (json['ResourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleNames = this.configRuleNames;
    final resourceIds = this.resourceIds;
    final resourceType = this.resourceType;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      if (resourceIds != null) 'ResourceIds': resourceIds,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// The details of a conformance pack evaluation. Provides AWS Config rule and
/// AWS resource type that was evaluated, the compliance of the conformance
/// pack, related time stamps, and supplementary information.
class ConformancePackEvaluationResult {
  /// The compliance type. The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>. <code>INSUFFICIENT_DATA</code> is not supported.
  final ConformancePackComplianceType complianceType;

  /// The time when AWS Config rule evaluated AWS resource.
  final DateTime configRuleInvokedTime;
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The time when AWS Config recorded the evaluation result.
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
      complianceType:
          (json['ComplianceType'] as String).toConformancePackComplianceType(),
      configRuleInvokedTime:
          nonNullableTimeStampFromJson(json['ConfigRuleInvokedTime'] as Object),
      evaluationResultIdentifier: EvaluationResultIdentifier.fromJson(
          json['EvaluationResultIdentifier'] as Map<String, dynamic>),
      resultRecordedTime:
          nonNullableTimeStampFromJson(json['ResultRecordedTime'] as Object),
      annotation: json['Annotation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleInvokedTime = this.configRuleInvokedTime;
    final evaluationResultIdentifier = this.evaluationResultIdentifier;
    final resultRecordedTime = this.resultRecordedTime;
    final annotation = this.annotation;
    return {
      'ComplianceType': complianceType.toValue(),
      'ConfigRuleInvokedTime': unixTimestampToJson(configRuleInvokedTime),
      'EvaluationResultIdentifier': evaluationResultIdentifier,
      'ResultRecordedTime': unixTimestampToJson(resultRecordedTime),
      if (annotation != null) 'Annotation': annotation,
    };
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

/// Compliance information of one or more AWS Config rules within a conformance
/// pack. You can filter using AWS Config rule names and compliance types.
class ConformancePackRuleCompliance {
  /// Compliance of the AWS Config rule.
  ///
  /// The allowed values are <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>,
  /// and <code>INSUFFICIENT_DATA</code>.
  final ConformancePackComplianceType? complianceType;

  /// Name of the config rule.
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
          ?.toConformancePackComplianceType(),
      configRuleName: json['ConfigRuleName'] as String?,
      controls: (json['Controls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final configRuleName = this.configRuleName;
    final controls = this.controls;
    return {
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
      if (controls != null) 'Controls': controls,
    };
  }
}

enum ConformancePackState {
  createInProgress,
  createComplete,
  createFailed,
  deleteInProgress,
  deleteFailed,
}

extension on ConformancePackState {
  String toValue() {
    switch (this) {
      case ConformancePackState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ConformancePackState.createComplete:
        return 'CREATE_COMPLETE';
      case ConformancePackState.createFailed:
        return 'CREATE_FAILED';
      case ConformancePackState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ConformancePackState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension on String {
  ConformancePackState toConformancePackState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ConformancePackState.createInProgress;
      case 'CREATE_COMPLETE':
        return ConformancePackState.createComplete;
      case 'CREATE_FAILED':
        return ConformancePackState.createFailed;
      case 'DELETE_IN_PROGRESS':
        return ConformancePackState.deleteInProgress;
      case 'DELETE_FAILED':
        return ConformancePackState.deleteFailed;
    }
    throw Exception('$this is not known in enum ConformancePackState');
  }
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
  /// AWS Config sets the state of the conformance pack to:
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

  /// Amazon Resource Name (ARN) of AWS CloudFormation stack.
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
      conformancePackState:
          (json['ConformancePackState'] as String).toConformancePackState(),
      lastUpdateRequestedTime: nonNullableTimeStampFromJson(
          json['LastUpdateRequestedTime'] as Object),
      stackArn: json['StackArn'] as String,
      conformancePackStatusReason:
          json['ConformancePackStatusReason'] as String?,
      lastUpdateCompletedTime:
          timeStampFromJson(json['LastUpdateCompletedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackArn = this.conformancePackArn;
    final conformancePackId = this.conformancePackId;
    final conformancePackName = this.conformancePackName;
    final conformancePackState = this.conformancePackState;
    final lastUpdateRequestedTime = this.lastUpdateRequestedTime;
    final stackArn = this.stackArn;
    final conformancePackStatusReason = this.conformancePackStatusReason;
    final lastUpdateCompletedTime = this.lastUpdateCompletedTime;
    return {
      'ConformancePackArn': conformancePackArn,
      'ConformancePackId': conformancePackId,
      'ConformancePackName': conformancePackName,
      'ConformancePackState': conformancePackState.toValue(),
      'LastUpdateRequestedTime': unixTimestampToJson(lastUpdateRequestedTime),
      'StackArn': stackArn,
      if (conformancePackStatusReason != null)
        'ConformancePackStatusReason': conformancePackStatusReason,
      if (lastUpdateCompletedTime != null)
        'LastUpdateCompletedTime': unixTimestampToJson(lastUpdateCompletedTime),
    };
  }
}

/// The output when you delete the evaluation results for the specified AWS
/// Config rule.
class DeleteEvaluationResultsResponse {
  DeleteEvaluationResultsResponse();

  factory DeleteEvaluationResultsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEvaluationResultsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRemediationConfigurationResponse {
  DeleteRemediationConfigurationResponse();

  factory DeleteRemediationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteRemediationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.whereNotNull()
          .map((e) => FailedDeleteRemediationExceptionsBatch.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedBatches = this.failedBatches;
    return {
      if (failedBatches != null) 'FailedBatches': failedBatches,
    };
  }
}

class DeleteStoredQueryResponse {
  DeleteStoredQueryResponse();

  factory DeleteStoredQueryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStoredQueryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final configSnapshotId = this.configSnapshotId;
    return {
      if (configSnapshotId != null) 'configSnapshotId': configSnapshotId,
    };
  }
}

/// The channel through which AWS Config delivers notifications and updated
/// configuration states.
class DeliveryChannel {
  /// The options for how often AWS Config delivers configuration snapshots to the
  /// Amazon S3 bucket.
  final ConfigSnapshotDeliveryProperties? configSnapshotDeliveryProperties;

  /// The name of the delivery channel. By default, AWS Config assigns the name
  /// "default" when creating the delivery channel. To change the delivery channel
  /// name, you must use the DeleteDeliveryChannel action to delete your current
  /// delivery channel, and then you must use the PutDeliveryChannel command to
  /// create a delivery channel that has the desired name.
  final String? name;

  /// The name of the Amazon S3 bucket to which AWS Config delivers configuration
  /// snapshots and configuration history files.
  ///
  /// If you specify a bucket that belongs to another AWS account, that bucket
  /// must have policies that grant access permissions to AWS Config. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html">Permissions
  /// for the Amazon S3 Bucket</a> in the AWS Config Developer Guide.
  final String? s3BucketName;

  /// The prefix for the specified Amazon S3 bucket.
  final String? s3KeyPrefix;

  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS)
  /// customer managed key (CMK) used to encrypt objects delivered by AWS Config.
  /// Must belong to the same Region as the destination S3 bucket.
  final String? s3KmsKeyArn;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which AWS Config
  /// sends notifications about configuration changes.
  ///
  /// If you choose a topic from another account, the topic must have policies
  /// that grant access permissions to AWS Config. For more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html">Permissions
  /// for the Amazon SNS Topic</a> in the AWS Config Developer Guide.
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

  Map<String, dynamic> toJson() {
    final configHistoryDeliveryInfo = this.configHistoryDeliveryInfo;
    final configSnapshotDeliveryInfo = this.configSnapshotDeliveryInfo;
    final configStreamDeliveryInfo = this.configStreamDeliveryInfo;
    final name = this.name;
    return {
      if (configHistoryDeliveryInfo != null)
        'configHistoryDeliveryInfo': configHistoryDeliveryInfo,
      if (configSnapshotDeliveryInfo != null)
        'configSnapshotDeliveryInfo': configSnapshotDeliveryInfo,
      if (configStreamDeliveryInfo != null)
        'configStreamDeliveryInfo': configStreamDeliveryInfo,
      if (name != null) 'name': name,
    };
  }
}

enum DeliveryStatus {
  success,
  failure,
  notApplicable,
}

extension on DeliveryStatus {
  String toValue() {
    switch (this) {
      case DeliveryStatus.success:
        return 'Success';
      case DeliveryStatus.failure:
        return 'Failure';
      case DeliveryStatus.notApplicable:
        return 'Not_Applicable';
    }
  }
}

extension on String {
  DeliveryStatus toDeliveryStatus() {
    switch (this) {
      case 'Success':
        return DeliveryStatus.success;
      case 'Failure':
        return DeliveryStatus.failure;
      case 'Not_Applicable':
        return DeliveryStatus.notApplicable;
    }
    throw Exception('$this is not known in enum DeliveryStatus');
  }
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
              ?.whereNotNull()
              .map((e) => AggregateComplianceByConfigRule.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateComplianceByConfigRules =
        this.aggregateComplianceByConfigRules;
    final nextToken = this.nextToken;
    return {
      if (aggregateComplianceByConfigRules != null)
        'AggregateComplianceByConfigRules': aggregateComplianceByConfigRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
              ?.whereNotNull()
              .map((e) => AggregateComplianceByConformancePack.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateComplianceByConformancePacks =
        this.aggregateComplianceByConformancePacks;
    final nextToken = this.nextToken;
    return {
      if (aggregateComplianceByConformancePacks != null)
        'AggregateComplianceByConformancePacks':
            aggregateComplianceByConformancePacks,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) =>
              AggregationAuthorization.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationAuthorizations = this.aggregationAuthorizations;
    final nextToken = this.nextToken;
    return {
      if (aggregationAuthorizations != null)
        'AggregationAuthorizations': aggregationAuthorizations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class DescribeComplianceByConfigRuleResponse {
  /// Indicates whether each of the specified AWS Config rules is compliant.
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
          ?.whereNotNull()
          .map(
              (e) => ComplianceByConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceByConfigRules = this.complianceByConfigRules;
    final nextToken = this.nextToken;
    return {
      if (complianceByConfigRules != null)
        'ComplianceByConfigRules': complianceByConfigRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class DescribeComplianceByResourceResponse {
  /// Indicates whether the specified AWS resource complies with all of the AWS
  /// Config rules that evaluate it.
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
          ?.whereNotNull()
          .map((e) => ComplianceByResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceByResources = this.complianceByResources;
    final nextToken = this.nextToken;
    return {
      if (complianceByResources != null)
        'ComplianceByResources': complianceByResources,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class DescribeConfigRuleEvaluationStatusResponse {
  /// Status information about your AWS managed Config rules.
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
          ?.whereNotNull()
          .map((e) =>
              ConfigRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configRulesEvaluationStatus = this.configRulesEvaluationStatus;
    final nextToken = this.nextToken;
    return {
      if (configRulesEvaluationStatus != null)
        'ConfigRulesEvaluationStatus': configRulesEvaluationStatus,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class DescribeConfigRulesResponse {
  /// The details about your AWS Config rules.
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
          ?.whereNotNull()
          .map((e) => ConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configRules = this.configRules;
    final nextToken = this.nextToken;
    return {
      if (configRules != null) 'ConfigRules': configRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map(
              (e) => AggregatedSourceStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedSourceStatusList = this.aggregatedSourceStatusList;
    final nextToken = this.nextToken;
    return {
      if (aggregatedSourceStatusList != null)
        'AggregatedSourceStatusList': aggregatedSourceStatusList,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) =>
              ConfigurationAggregator.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationAggregators = this.configurationAggregators;
    final nextToken = this.nextToken;
    return {
      if (configurationAggregators != null)
        'ConfigurationAggregators': configurationAggregators,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) =>
              ConfigurationRecorderStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationRecordersStatus = this.configurationRecordersStatus;
    return {
      if (configurationRecordersStatus != null)
        'ConfigurationRecordersStatus': configurationRecordersStatus,
    };
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
          ?.whereNotNull()
          .map((e) => ConfigurationRecorder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationRecorders = this.configurationRecorders;
    return {
      if (configurationRecorders != null)
        'ConfigurationRecorders': configurationRecorders,
    };
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
              .whereNotNull()
              .map((e) => ConformancePackRuleCompliance.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackName = this.conformancePackName;
    final conformancePackRuleComplianceList =
        this.conformancePackRuleComplianceList;
    final nextToken = this.nextToken;
    return {
      'ConformancePackName': conformancePackName,
      'ConformancePackRuleComplianceList': conformancePackRuleComplianceList,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) =>
              ConformancePackStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackStatusDetails = this.conformancePackStatusDetails;
    final nextToken = this.nextToken;
    return {
      if (conformancePackStatusDetails != null)
        'ConformancePackStatusDetails': conformancePackStatusDetails,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) => ConformancePackDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackDetails = this.conformancePackDetails;
    final nextToken = this.nextToken;
    return {
      if (conformancePackDetails != null)
        'ConformancePackDetails': conformancePackDetails,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) => DeliveryChannelStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryChannelsStatus = this.deliveryChannelsStatus;
    return {
      if (deliveryChannelsStatus != null)
        'DeliveryChannelsStatus': deliveryChannelsStatus,
    };
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
          ?.whereNotNull()
          .map((e) => DeliveryChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryChannels = this.deliveryChannels;
    return {
      if (deliveryChannels != null) 'DeliveryChannels': deliveryChannels,
    };
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
          ?.whereNotNull()
          .map((e) =>
              OrganizationConfigRuleStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConfigRuleStatuses = this.organizationConfigRuleStatuses;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConfigRuleStatuses != null)
        'OrganizationConfigRuleStatuses': organizationConfigRuleStatuses,
    };
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
          ?.whereNotNull()
          .map(
              (e) => OrganizationConfigRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConfigRules = this.organizationConfigRules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConfigRules != null)
        'OrganizationConfigRules': organizationConfigRules,
    };
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
              ?.whereNotNull()
              .map((e) => OrganizationConformancePackStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConformancePackStatuses =
        this.organizationConformancePackStatuses;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConformancePackStatuses != null)
        'OrganizationConformancePackStatuses':
            organizationConformancePackStatuses,
    };
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
          ?.whereNotNull()
          .map((e) =>
              OrganizationConformancePack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConformancePacks = this.organizationConformancePacks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConformancePacks != null)
        'OrganizationConformancePacks': organizationConformancePacks,
    };
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
          ?.whereNotNull()
          .map((e) =>
              PendingAggregationRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pendingAggregationRequests = this.pendingAggregationRequests;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pendingAggregationRequests != null)
        'PendingAggregationRequests': pendingAggregationRequests,
    };
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
          ?.whereNotNull()
          .map((e) =>
              RemediationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final remediationConfigurations = this.remediationConfigurations;
    return {
      if (remediationConfigurations != null)
        'RemediationConfigurations': remediationConfigurations,
    };
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
          ?.whereNotNull()
          .map((e) => RemediationException.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final remediationExceptions = this.remediationExceptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (remediationExceptions != null)
        'RemediationExceptions': remediationExceptions,
    };
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
          ?.whereNotNull()
          .map((e) =>
              RemediationExecutionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final remediationExecutionStatuses = this.remediationExecutionStatuses;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (remediationExecutionStatuses != null)
        'RemediationExecutionStatuses': remediationExecutionStatuses,
    };
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
          ?.whereNotNull()
          .map(
              (e) => RetentionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final retentionConfigurations = this.retentionConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (retentionConfigurations != null)
        'RetentionConfigurations': retentionConfigurations,
    };
  }
}

/// Identifies an AWS resource and indicates whether it complies with the AWS
/// Config rule that it was evaluated against.
class Evaluation {
  /// The ID of the AWS resource that was evaluated.
  final String complianceResourceId;

  /// The type of AWS resource that was evaluated.
  final String complianceResourceType;

  /// Indicates whether the AWS resource complies with the AWS Config rule that it
  /// was evaluated against.
  ///
  /// For the <code>Evaluation</code> data type, AWS Config supports only the
  /// <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>NOT_APPLICABLE</code> values. AWS Config does not support the
  /// <code>INSUFFICIENT_DATA</code> value for this data type.
  ///
  /// Similarly, AWS Config does not accept <code>INSUFFICIENT_DATA</code> as the
  /// value for <code>ComplianceType</code> from a <code>PutEvaluations</code>
  /// request. For example, an AWS Lambda function for a custom AWS Config rule
  /// cannot pass an <code>INSUFFICIENT_DATA</code> value to AWS Config.
  final ComplianceType complianceType;

  /// The time of the event in AWS Config that triggered the evaluation. For
  /// event-based evaluations, the time indicates when AWS Config created the
  /// configuration item that triggered the evaluation. For periodic evaluations,
  /// the time indicates when AWS Config triggered the evaluation at the frequency
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
      complianceType: (json['ComplianceType'] as String).toComplianceType(),
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
      'ComplianceType': complianceType.toValue(),
      'OrderingTimestamp': unixTimestampToJson(orderingTimestamp),
      if (annotation != null) 'Annotation': annotation,
    };
  }
}

/// The details of an AWS Config evaluation. Provides the AWS resource that was
/// evaluated, the compliance of the resource, related time stamps, and
/// supplementary information.
class EvaluationResult {
  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String? annotation;

  /// Indicates whether the AWS resource complies with the AWS Config rule that
  /// evaluated it.
  ///
  /// For the <code>EvaluationResult</code> data type, AWS Config supports only
  /// the <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>NOT_APPLICABLE</code> values. AWS Config does not support the
  /// <code>INSUFFICIENT_DATA</code> value for the <code>EvaluationResult</code>
  /// data type.
  final ComplianceType? complianceType;

  /// The time when the AWS Config rule evaluated the AWS resource.
  final DateTime? configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier? evaluationResultIdentifier;

  /// The time when AWS Config recorded the evaluation result.
  final DateTime? resultRecordedTime;

  /// An encrypted token that associates an evaluation with an AWS Config rule.
  /// The token identifies the rule, the AWS resource being evaluated, and the
  /// event that triggered the evaluation.
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
      complianceType: (json['ComplianceType'] as String?)?.toComplianceType(),
      configRuleInvokedTime: timeStampFromJson(json['ConfigRuleInvokedTime']),
      evaluationResultIdentifier: json['EvaluationResultIdentifier'] != null
          ? EvaluationResultIdentifier.fromJson(
              json['EvaluationResultIdentifier'] as Map<String, dynamic>)
          : null,
      resultRecordedTime: timeStampFromJson(json['ResultRecordedTime']),
      resultToken: json['ResultToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final annotation = this.annotation;
    final complianceType = this.complianceType;
    final configRuleInvokedTime = this.configRuleInvokedTime;
    final evaluationResultIdentifier = this.evaluationResultIdentifier;
    final resultRecordedTime = this.resultRecordedTime;
    final resultToken = this.resultToken;
    return {
      if (annotation != null) 'Annotation': annotation,
      if (complianceType != null) 'ComplianceType': complianceType.toValue(),
      if (configRuleInvokedTime != null)
        'ConfigRuleInvokedTime': unixTimestampToJson(configRuleInvokedTime),
      if (evaluationResultIdentifier != null)
        'EvaluationResultIdentifier': evaluationResultIdentifier,
      if (resultRecordedTime != null)
        'ResultRecordedTime': unixTimestampToJson(resultRecordedTime),
      if (resultToken != null) 'ResultToken': resultToken,
    };
  }
}

/// Uniquely identifies an evaluation result.
class EvaluationResultIdentifier {
  /// Identifies an AWS Config rule used to evaluate an AWS resource, and provides
  /// the type and ID of the evaluated resource.
  final EvaluationResultQualifier? evaluationResultQualifier;

  /// The time of the event that triggered the evaluation of your AWS resources.
  /// The time can indicate when AWS Config delivered a configuration item change
  /// notification, or it can indicate when AWS Config delivered the configuration
  /// snapshot, depending on which event triggered the evaluation.
  final DateTime? orderingTimestamp;

  EvaluationResultIdentifier({
    this.evaluationResultQualifier,
    this.orderingTimestamp,
  });

  factory EvaluationResultIdentifier.fromJson(Map<String, dynamic> json) {
    return EvaluationResultIdentifier(
      evaluationResultQualifier: json['EvaluationResultQualifier'] != null
          ? EvaluationResultQualifier.fromJson(
              json['EvaluationResultQualifier'] as Map<String, dynamic>)
          : null,
      orderingTimestamp: timeStampFromJson(json['OrderingTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResultQualifier = this.evaluationResultQualifier;
    final orderingTimestamp = this.orderingTimestamp;
    return {
      if (evaluationResultQualifier != null)
        'EvaluationResultQualifier': evaluationResultQualifier,
      if (orderingTimestamp != null)
        'OrderingTimestamp': unixTimestampToJson(orderingTimestamp),
    };
  }
}

/// Identifies an AWS Config rule that evaluated an AWS resource, and provides
/// the type and ID of the resource that the rule evaluated.
class EvaluationResultQualifier {
  /// The name of the AWS Config rule that was used in the evaluation.
  final String? configRuleName;

  /// The ID of the evaluated AWS resource.
  final String? resourceId;

  /// The type of AWS resource that was evaluated.
  final String? resourceType;

  EvaluationResultQualifier({
    this.configRuleName,
    this.resourceId,
    this.resourceType,
  });

  factory EvaluationResultQualifier.fromJson(Map<String, dynamic> json) {
    return EvaluationResultQualifier(
      configRuleName: json['ConfigRuleName'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configRuleName = this.configRuleName;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (configRuleName != null) 'ConfigRuleName': configRuleName,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

enum EventSource {
  awsConfig,
}

extension on EventSource {
  String toValue() {
    switch (this) {
      case EventSource.awsConfig:
        return 'aws.config';
    }
  }
}

extension on String {
  EventSource toEventSource() {
    switch (this) {
      case 'aws.config':
        return EventSource.awsConfig;
    }
    throw Exception('$this is not known in enum EventSource');
  }
}

/// The controls that AWS Config uses for executing remediations.
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

/// Identifies an AWS resource and indicates whether it complies with the AWS
/// Config rule that it was evaluated against.
class ExternalEvaluation {
  /// The evaluated compliance resource ID. AWS Config accepts only AWS account
  /// ID.
  final String complianceResourceId;

  /// The evaluated compliance resource type. AWS Config accepts
  /// <code>AWS::::Account</code> resource type.
  final String complianceResourceType;

  /// The compliance of the AWS resource. The valid values are <code>COMPLIANT,
  /// NON_COMPLIANT, </code> and <code>NOT_APPLICABLE</code>.
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

  factory ExternalEvaluation.fromJson(Map<String, dynamic> json) {
    return ExternalEvaluation(
      complianceResourceId: json['ComplianceResourceId'] as String,
      complianceResourceType: json['ComplianceResourceType'] as String,
      complianceType: (json['ComplianceType'] as String).toComplianceType(),
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
      'ComplianceType': complianceType.toValue(),
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

  /// Returns a failure message for delete remediation exception. For example, AWS
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
          ?.whereNotNull()
          .map((e) => RemediationExceptionResourceKey.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final failureMessage = this.failureMessage;
    return {
      if (failedItems != null) 'FailedItems': failedItems,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
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
          ?.whereNotNull()
          .map((e) =>
              RemediationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final failureMessage = this.failureMessage;
    return {
      if (failedItems != null) 'FailedItems': failedItems,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
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
          ?.whereNotNull()
          .map((e) => RemediationException.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final failureMessage = this.failureMessage;
    return {
      if (failedItems != null) 'FailedItems': failedItems,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
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
          ?.whereNotNull()
          .map((e) =>
              AggregateEvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateEvaluationResults = this.aggregateEvaluationResults;
    final nextToken = this.nextToken;
    return {
      if (aggregateEvaluationResults != null)
        'AggregateEvaluationResults': aggregateEvaluationResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) =>
              AggregateComplianceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKey: json['GroupByKey'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateComplianceCounts = this.aggregateComplianceCounts;
    final groupByKey = this.groupByKey;
    final nextToken = this.nextToken;
    return {
      if (aggregateComplianceCounts != null)
        'AggregateComplianceCounts': aggregateComplianceCounts,
      if (groupByKey != null) 'GroupByKey': groupByKey,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetAggregateConformancePackComplianceSummaryResponse {
  /// Returns a list of <code>AggregateConformancePackComplianceSummary</code>
  /// object.
  final List<AggregateConformancePackComplianceSummary>?
      aggregateConformancePackComplianceSummaries;

  /// Groups the result based on AWS Account ID or AWS Region.
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
              ?.whereNotNull()
              .map((e) => AggregateConformancePackComplianceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      groupByKey: json['GroupByKey'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateConformancePackComplianceSummaries =
        this.aggregateConformancePackComplianceSummaries;
    final groupByKey = this.groupByKey;
    final nextToken = this.nextToken;
    return {
      if (aggregateConformancePackComplianceSummaries != null)
        'AggregateConformancePackComplianceSummaries':
            aggregateConformancePackComplianceSummaries,
      if (groupByKey != null) 'GroupByKey': groupByKey,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.whereNotNull()
          .map((e) => GroupedResourceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalDiscoveredResources = this.totalDiscoveredResources;
    final groupByKey = this.groupByKey;
    final groupedResourceCounts = this.groupedResourceCounts;
    final nextToken = this.nextToken;
    return {
      'TotalDiscoveredResources': totalDiscoveredResources,
      if (groupByKey != null) 'GroupByKey': groupByKey,
      if (groupedResourceCounts != null)
        'GroupedResourceCounts': groupedResourceCounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final configurationItem = this.configurationItem;
    return {
      if (configurationItem != null) 'ConfigurationItem': configurationItem,
    };
  }
}

/// <p/>
class GetComplianceDetailsByConfigRuleResponse {
  /// Indicates whether the AWS resource complies with the specified AWS Config
  /// rule.
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
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResults = this.evaluationResults;
    final nextToken = this.nextToken;
    return {
      if (evaluationResults != null) 'EvaluationResults': evaluationResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class GetComplianceDetailsByResourceResponse {
  /// Indicates whether the specified AWS resource complies each AWS Config rule.
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
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResults = this.evaluationResults;
    final nextToken = this.nextToken;
    return {
      if (evaluationResults != null) 'EvaluationResults': evaluationResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// <p/>
class GetComplianceSummaryByConfigRuleResponse {
  /// The number of AWS Config rules that are compliant and the number that are
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

  Map<String, dynamic> toJson() {
    final complianceSummary = this.complianceSummary;
    return {
      if (complianceSummary != null) 'ComplianceSummary': complianceSummary,
    };
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
              ?.whereNotNull()
              .map((e) => ComplianceSummaryByResourceType.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceSummariesByResourceType =
        this.complianceSummariesByResourceType;
    return {
      if (complianceSummariesByResourceType != null)
        'ComplianceSummariesByResourceType': complianceSummariesByResourceType,
    };
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
              ?.whereNotNull()
              .map((e) => ConformancePackEvaluationResult.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackName = this.conformancePackName;
    final conformancePackRuleEvaluationResults =
        this.conformancePackRuleEvaluationResults;
    final nextToken = this.nextToken;
    return {
      'ConformancePackName': conformancePackName,
      if (conformancePackRuleEvaluationResults != null)
        'ConformancePackRuleEvaluationResults':
            conformancePackRuleEvaluationResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
              ?.whereNotNull()
              .map((e) => ConformancePackComplianceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conformancePackComplianceSummaryList =
        this.conformancePackComplianceSummaryList;
    final nextToken = this.nextToken;
    return {
      if (conformancePackComplianceSummaryList != null)
        'ConformancePackComplianceSummaryList':
            conformancePackComplianceSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetDiscoveredResourceCountsResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  /// The list of <code>ResourceCount</code> objects. Each object is listed in
  /// descending order by the number of resources.
  final List<ResourceCount>? resourceCounts;

  /// The total number of resources that AWS Config is recording in the region for
  /// your account. If you specify resource types in the request, AWS Config
  /// returns only the total number of resources for those resource types.
  /// <p class="title"> <b>Example</b>
  /// <ol>
  /// <li>
  /// AWS Config is recording three resource types in the US East (Ohio) Region
  /// for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a
  /// total of 60 resources.
  /// </li>
  /// <li>
  /// You make a call to the <code>GetDiscoveredResourceCounts</code> action and
  /// specify the resource type, <code>"AWS::EC2::Instances"</code>, in the
  /// request.
  /// </li>
  /// <li>
  /// AWS Config returns 25 for <code>totalDiscoveredResources</code>.
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
          ?.whereNotNull()
          .map((e) => ResourceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDiscoveredResources: json['totalDiscoveredResources'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceCounts = this.resourceCounts;
    final totalDiscoveredResources = this.totalDiscoveredResources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceCounts != null) 'resourceCounts': resourceCounts,
      if (totalDiscoveredResources != null)
        'totalDiscoveredResources': totalDiscoveredResources,
    };
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
          ?.whereNotNull()
          .map((e) => MemberAccountStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConfigRuleDetailedStatus =
        this.organizationConfigRuleDetailedStatus;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConfigRuleDetailedStatus != null)
        'OrganizationConfigRuleDetailedStatus':
            organizationConfigRuleDetailedStatus,
    };
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
              ?.whereNotNull()
              .map((e) => OrganizationConformancePackDetailedStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationConformancePackDetailedStatuses =
        this.organizationConformancePackDetailedStatuses;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationConformancePackDetailedStatuses != null)
        'OrganizationConformancePackDetailedStatuses':
            organizationConformancePackDetailedStatuses,
    };
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
          ?.whereNotNull()
          .map((e) => ConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationItems = this.configurationItems;
    final nextToken = this.nextToken;
    return {
      if (configurationItems != null) 'configurationItems': configurationItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final storedQuery = this.storedQuery;
    return {
      if (storedQuery != null) 'StoredQuery': storedQuery,
    };
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

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final resourceCount = this.resourceCount;
    return {
      'GroupName': groupName,
      'ResourceCount': resourceCount,
    };
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
          ?.whereNotNull()
          .map((e) =>
              AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceIdentifiers = this.resourceIdentifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceIdentifiers != null)
        'ResourceIdentifiers': resourceIdentifiers,
    };
  }
}

/// <p/>
class ListDiscoveredResourcesResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String? nextToken;

  /// The details that identify a resource that is discovered by AWS Config,
  /// including the resource type, ID, and (if available) the custom resource
  /// name.
  final List<ResourceIdentifier>? resourceIdentifiers;

  ListDiscoveredResourcesResponse({
    this.nextToken,
    this.resourceIdentifiers,
  });

  factory ListDiscoveredResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resourceIdentifiers: (json['resourceIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceIdentifiers = this.resourceIdentifiers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceIdentifiers != null)
        'resourceIdentifiers': resourceIdentifiers,
    };
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
          ?.whereNotNull()
          .map((e) => StoredQueryMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storedQueryMetadata = this.storedQueryMetadata;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storedQueryMetadata != null)
        'StoredQueryMetadata': storedQueryMetadata,
    };
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

enum MaximumExecutionFrequency {
  oneHour,
  threeHours,
  sixHours,
  twelveHours,
  twentyFourHours,
}

extension on MaximumExecutionFrequency {
  String toValue() {
    switch (this) {
      case MaximumExecutionFrequency.oneHour:
        return 'One_Hour';
      case MaximumExecutionFrequency.threeHours:
        return 'Three_Hours';
      case MaximumExecutionFrequency.sixHours:
        return 'Six_Hours';
      case MaximumExecutionFrequency.twelveHours:
        return 'Twelve_Hours';
      case MaximumExecutionFrequency.twentyFourHours:
        return 'TwentyFour_Hours';
    }
  }
}

extension on String {
  MaximumExecutionFrequency toMaximumExecutionFrequency() {
    switch (this) {
      case 'One_Hour':
        return MaximumExecutionFrequency.oneHour;
      case 'Three_Hours':
        return MaximumExecutionFrequency.threeHours;
      case 'Six_Hours':
        return MaximumExecutionFrequency.sixHours;
      case 'Twelve_Hours':
        return MaximumExecutionFrequency.twelveHours;
      case 'TwentyFour_Hours':
        return MaximumExecutionFrequency.twentyFourHours;
    }
    throw Exception('$this is not known in enum MaximumExecutionFrequency');
  }
}

enum MemberAccountRuleStatus {
  createSuccessful,
  createInProgress,
  createFailed,
  deleteSuccessful,
  deleteFailed,
  deleteInProgress,
  updateSuccessful,
  updateInProgress,
  updateFailed,
}

extension on MemberAccountRuleStatus {
  String toValue() {
    switch (this) {
      case MemberAccountRuleStatus.createSuccessful:
        return 'CREATE_SUCCESSFUL';
      case MemberAccountRuleStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case MemberAccountRuleStatus.createFailed:
        return 'CREATE_FAILED';
      case MemberAccountRuleStatus.deleteSuccessful:
        return 'DELETE_SUCCESSFUL';
      case MemberAccountRuleStatus.deleteFailed:
        return 'DELETE_FAILED';
      case MemberAccountRuleStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case MemberAccountRuleStatus.updateSuccessful:
        return 'UPDATE_SUCCESSFUL';
      case MemberAccountRuleStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case MemberAccountRuleStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  MemberAccountRuleStatus toMemberAccountRuleStatus() {
    switch (this) {
      case 'CREATE_SUCCESSFUL':
        return MemberAccountRuleStatus.createSuccessful;
      case 'CREATE_IN_PROGRESS':
        return MemberAccountRuleStatus.createInProgress;
      case 'CREATE_FAILED':
        return MemberAccountRuleStatus.createFailed;
      case 'DELETE_SUCCESSFUL':
        return MemberAccountRuleStatus.deleteSuccessful;
      case 'DELETE_FAILED':
        return MemberAccountRuleStatus.deleteFailed;
      case 'DELETE_IN_PROGRESS':
        return MemberAccountRuleStatus.deleteInProgress;
      case 'UPDATE_SUCCESSFUL':
        return MemberAccountRuleStatus.updateSuccessful;
      case 'UPDATE_IN_PROGRESS':
        return MemberAccountRuleStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return MemberAccountRuleStatus.updateFailed;
    }
    throw Exception('$this is not known in enum MemberAccountRuleStatus');
  }
}

/// Organization config rule creation or deletion status in each member account.
/// This includes the name of the rule, the status, error code and error message
/// when the rule creation or deletion failed.
class MemberAccountStatus {
  /// The 12-digit account ID of a member account.
  final String accountId;

  /// The name of config rule deployed in the member account.
  final String configRuleName;

  /// Indicates deployment status for config rule in the member account. When
  /// master account calls <code>PutOrganizationConfigRule</code> action for the
  /// first time, config rule status is created in the member account. When master
  /// account calls <code>PutOrganizationConfigRule</code> action for the second
  /// time, config rule status is updated in the member account. Config rule
  /// status is deleted when the master account deletes
  /// <code>OrganizationConfigRule</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when config rule has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when config rule is being created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when config rule creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when config rule deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when config rule is being deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when config rule has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when config rule has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when config rule is being updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when config rule deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final MemberAccountRuleStatus memberAccountRuleStatus;

  /// An error code that is returned when config rule creation or deletion failed
  /// in the member account.
  final String? errorCode;

  /// An error message indicating that config rule account creation or deletion
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
      memberAccountRuleStatus: (json['MemberAccountRuleStatus'] as String)
          .toMemberAccountRuleStatus(),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final configRuleName = this.configRuleName;
    final memberAccountRuleStatus = this.memberAccountRuleStatus;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastUpdateTime = this.lastUpdateTime;
    return {
      'AccountId': accountId,
      'ConfigRuleName': configRuleName,
      'MemberAccountRuleStatus': memberAccountRuleStatus.toValue(),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
    };
  }
}

enum MessageType {
  configurationItemChangeNotification,
  configurationSnapshotDeliveryCompleted,
  scheduledNotification,
  oversizedConfigurationItemChangeNotification,
}

extension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.configurationItemChangeNotification:
        return 'ConfigurationItemChangeNotification';
      case MessageType.configurationSnapshotDeliveryCompleted:
        return 'ConfigurationSnapshotDeliveryCompleted';
      case MessageType.scheduledNotification:
        return 'ScheduledNotification';
      case MessageType.oversizedConfigurationItemChangeNotification:
        return 'OversizedConfigurationItemChangeNotification';
    }
  }
}

extension on String {
  MessageType toMessageType() {
    switch (this) {
      case 'ConfigurationItemChangeNotification':
        return MessageType.configurationItemChangeNotification;
      case 'ConfigurationSnapshotDeliveryCompleted':
        return MessageType.configurationSnapshotDeliveryCompleted;
      case 'ScheduledNotification':
        return MessageType.scheduledNotification;
      case 'OversizedConfigurationItemChangeNotification':
        return MessageType.oversizedConfigurationItemChangeNotification;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

/// This object contains regions to set up the aggregator and an IAM role to
/// retrieve organization details.
class OrganizationAggregationSource {
  /// ARN of the IAM role used to retrieve AWS Organization details associated
  /// with the aggregator account.
  final String roleArn;

  /// If true, aggregate existing AWS Config regions and future regions.
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
          ?.whereNotNull()
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

/// An organization config rule that has information about config rules that AWS
/// Config creates in member accounts.
class OrganizationConfigRule {
  /// Amazon Resource Name (ARN) of organization config rule.
  final String organizationConfigRuleArn;

  /// The name that you assign to organization config rule.
  final String organizationConfigRuleName;

  /// A comma-separated list of accounts excluded from organization config rule.
  final List<String>? excludedAccounts;

  /// The timestamp of the last update.
  final DateTime? lastUpdateTime;

  /// An <code>OrganizationCustomRuleMetadata</code> object.
  final OrganizationCustomRuleMetadata? organizationCustomRuleMetadata;

  /// An <code>OrganizationManagedRuleMetadata</code> object.
  final OrganizationManagedRuleMetadata? organizationManagedRuleMetadata;

  OrganizationConfigRule({
    required this.organizationConfigRuleArn,
    required this.organizationConfigRuleName,
    this.excludedAccounts,
    this.lastUpdateTime,
    this.organizationCustomRuleMetadata,
    this.organizationManagedRuleMetadata,
  });

  factory OrganizationConfigRule.fromJson(Map<String, dynamic> json) {
    return OrganizationConfigRule(
      organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String,
      organizationConfigRuleName: json['OrganizationConfigRuleName'] as String,
      excludedAccounts: (json['ExcludedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
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

  Map<String, dynamic> toJson() {
    final organizationConfigRuleArn = this.organizationConfigRuleArn;
    final organizationConfigRuleName = this.organizationConfigRuleName;
    final excludedAccounts = this.excludedAccounts;
    final lastUpdateTime = this.lastUpdateTime;
    final organizationCustomRuleMetadata = this.organizationCustomRuleMetadata;
    final organizationManagedRuleMetadata =
        this.organizationManagedRuleMetadata;
    return {
      'OrganizationConfigRuleArn': organizationConfigRuleArn,
      'OrganizationConfigRuleName': organizationConfigRuleName,
      if (excludedAccounts != null) 'ExcludedAccounts': excludedAccounts,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (organizationCustomRuleMetadata != null)
        'OrganizationCustomRuleMetadata': organizationCustomRuleMetadata,
      if (organizationManagedRuleMetadata != null)
        'OrganizationManagedRuleMetadata': organizationManagedRuleMetadata,
    };
  }
}

/// Returns the status for an organization config rule in an organization.
class OrganizationConfigRuleStatus {
  /// The name that you assign to organization config rule.
  final String organizationConfigRuleName;

  /// Indicates deployment status of an organization config rule. When master
  /// account calls PutOrganizationConfigRule action for the first time, config
  /// rule status is created in all the member accounts. When master account calls
  /// PutOrganizationConfigRule action for the second time, config rule status is
  /// updated in all the member accounts. Additionally, config rule status is
  /// updated when one or more member accounts join or leave an organization.
  /// Config rule status is deleted when the master account deletes
  /// OrganizationConfigRule in all the member accounts and disables service
  /// access for <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when an organization config rule has been
  /// successfully created in all the member accounts.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when an organization config rule creation is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when an organization config rule creation failed
  /// in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when an organization config rule deletion failed
  /// in one or more member accounts within that organization.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when an organization config rule deletion is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when an organization config rule has been
  /// successfully deleted from all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when an organization config rule has been
  /// successfully updated in all the member accounts.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when an organization config rule update is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when an organization config rule update failed in
  /// one or more member accounts within that organization.
  /// </li>
  /// </ul>
  final OrganizationRuleStatus organizationRuleStatus;

  /// An error code that is returned when organization config rule creation or
  /// deletion has failed.
  final String? errorCode;

  /// An error message indicating that organization config rule creation or
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
      organizationRuleStatus:
          (json['OrganizationRuleStatus'] as String).toOrganizationRuleStatus(),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationConfigRuleName = this.organizationConfigRuleName;
    final organizationRuleStatus = this.organizationRuleStatus;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastUpdateTime = this.lastUpdateTime;
    return {
      'OrganizationConfigRuleName': organizationConfigRuleName,
      'OrganizationRuleStatus': organizationRuleStatus.toValue(),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
    };
  }
}

enum OrganizationConfigRuleTriggerType {
  configurationItemChangeNotification,
  oversizedConfigurationItemChangeNotification,
  scheduledNotification,
}

extension on OrganizationConfigRuleTriggerType {
  String toValue() {
    switch (this) {
      case OrganizationConfigRuleTriggerType
          .configurationItemChangeNotification:
        return 'ConfigurationItemChangeNotification';
      case OrganizationConfigRuleTriggerType
          .oversizedConfigurationItemChangeNotification:
        return 'OversizedConfigurationItemChangeNotification';
      case OrganizationConfigRuleTriggerType.scheduledNotification:
        return 'ScheduledNotification';
    }
  }
}

extension on String {
  OrganizationConfigRuleTriggerType toOrganizationConfigRuleTriggerType() {
    switch (this) {
      case 'ConfigurationItemChangeNotification':
        return OrganizationConfigRuleTriggerType
            .configurationItemChangeNotification;
      case 'OversizedConfigurationItemChangeNotification':
        return OrganizationConfigRuleTriggerType
            .oversizedConfigurationItemChangeNotification;
      case 'ScheduledNotification':
        return OrganizationConfigRuleTriggerType.scheduledNotification;
    }
    throw Exception(
        '$this is not known in enum OrganizationConfigRuleTriggerType');
  }
}

/// An organization conformance pack that has information about conformance
/// packs that AWS Config creates in member accounts.
class OrganizationConformancePack {
  /// Last time when organization conformation pack was updated.
  final DateTime lastUpdateTime;

  /// Amazon Resource Name (ARN) of organization conformance pack.
  final String organizationConformancePackArn;

  /// The name you assign to an organization conformance pack.
  final String organizationConformancePackName;

  /// A list of <code>ConformancePackInputParameter</code> objects.
  final List<ConformancePackInputParameter>? conformancePackInputParameters;

  /// Amazon S3 bucket where AWS Config stores conformance pack templates.
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
          ?.whereNotNull()
          .map((e) =>
              ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryS3Bucket: json['DeliveryS3Bucket'] as String?,
      deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String?,
      excludedAccounts: (json['ExcludedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateTime = this.lastUpdateTime;
    final organizationConformancePackArn = this.organizationConformancePackArn;
    final organizationConformancePackName =
        this.organizationConformancePackName;
    final conformancePackInputParameters = this.conformancePackInputParameters;
    final deliveryS3Bucket = this.deliveryS3Bucket;
    final deliveryS3KeyPrefix = this.deliveryS3KeyPrefix;
    final excludedAccounts = this.excludedAccounts;
    return {
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'OrganizationConformancePackArn': organizationConformancePackArn,
      'OrganizationConformancePackName': organizationConformancePackName,
      if (conformancePackInputParameters != null)
        'ConformancePackInputParameters': conformancePackInputParameters,
      if (deliveryS3Bucket != null) 'DeliveryS3Bucket': deliveryS3Bucket,
      if (deliveryS3KeyPrefix != null)
        'DeliveryS3KeyPrefix': deliveryS3KeyPrefix,
      if (excludedAccounts != null) 'ExcludedAccounts': excludedAccounts,
    };
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
  /// master account calls <code>PutOrganizationConformancePack</code> action for
  /// the first time, conformance pack status is created in the member account.
  /// When master account calls <code>PutOrganizationConformancePack</code> action
  /// for the second time, conformance pack status is updated in the member
  /// account. Conformance pack status is deleted when the master account deletes
  /// <code>OrganizationConformancePack</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the conformance pack to:
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
      status: (json['Status'] as String).toOrganizationResourceDetailedStatus(),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final conformancePackName = this.conformancePackName;
    final status = this.status;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastUpdateTime = this.lastUpdateTime;
    return {
      'AccountId': accountId,
      'ConformancePackName': conformancePackName,
      'Status': status.toValue(),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
    };
  }
}

/// Returns the status for an organization conformance pack in an organization.
class OrganizationConformancePackStatus {
  /// The name that you assign to organization conformance pack.
  final String organizationConformancePackName;

  /// Indicates deployment status of an organization conformance pack. When master
  /// account calls PutOrganizationConformancePack for the first time, conformance
  /// pack status is created in all the member accounts. When master account calls
  /// PutOrganizationConformancePack for the second time, conformance pack status
  /// is updated in all the member accounts. Additionally, conformance pack status
  /// is updated when one or more member accounts join or leave an organization.
  /// Conformance pack status is deleted when the master account deletes
  /// OrganizationConformancePack in all the member accounts and disables service
  /// access for <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the conformance pack to:
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
      status: (json['Status'] as String).toOrganizationResourceStatus(),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationConformancePackName =
        this.organizationConformancePackName;
    final status = this.status;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastUpdateTime = this.lastUpdateTime;
    return {
      'OrganizationConformancePackName': organizationConformancePackName,
      'Status': status.toValue(),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
    };
  }
}

/// An object that specifies organization custom rule metadata such as resource
/// type, resource ID of AWS resource, Lamdba function ARN, and organization
/// trigger types that trigger AWS Config to evaluate your AWS resources against
/// a rule. It also provides the frequency with which you want AWS Config to run
/// evaluations for the rule if the trigger type is periodic.
class OrganizationCustomRuleMetadata {
  /// The lambda function ARN.
  final String lambdaFunctionArn;

  /// The type of notification that triggers AWS Config to run an evaluation for a
  /// rule. You can specify the following notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Triggers an evaluation
  /// when AWS Config delivers a configuration item as a result of a resource
  /// change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Triggers an
  /// evaluation when AWS Config delivers an oversized configuration item. AWS
  /// Config may generate this notification type when a resource changes and the
  /// notification exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// <li>
  /// <code>ScheduledNotification</code> - Triggers a periodic evaluation at the
  /// frequency specified for <code>MaximumExecutionFrequency</code>.
  /// </li>
  /// </ul>
  final List<OrganizationConfigRuleTriggerType>
      organizationConfigRuleTriggerTypes;

  /// The description that you provide for organization config rule.
  final String? description;

  /// A string, in JSON format, that is passed to organization config rule Lambda
  /// function.
  final String? inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule.
  /// Your custom rule is triggered when AWS Config delivers the configuration
  /// snapshot. For more information, see <a>ConfigSnapshotDeliveryProperties</a>.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The ID of the AWS resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the AWS resource that was evaluated.
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
              .whereNotNull()
              .map((e) => (e as String).toOrganizationConfigRuleTriggerType())
              .toList(),
      description: json['Description'] as String?,
      inputParameters: json['InputParameters'] as String?,
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.toMaximumExecutionFrequency(),
      resourceIdScope: json['ResourceIdScope'] as String?,
      resourceTypesScope: (json['ResourceTypesScope'] as List?)
          ?.whereNotNull()
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
          organizationConfigRuleTriggerTypes.map((e) => e.toValue()).toList(),
      if (description != null) 'Description': description,
      if (inputParameters != null) 'InputParameters': inputParameters,
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.toValue(),
      if (resourceIdScope != null) 'ResourceIdScope': resourceIdScope,
      if (resourceTypesScope != null) 'ResourceTypesScope': resourceTypesScope,
      if (tagKeyScope != null) 'TagKeyScope': tagKeyScope,
      if (tagValueScope != null) 'TagValueScope': tagValueScope,
    };
  }
}

/// An object that specifies organization managed rule metadata such as resource
/// type and ID of AWS resource along with the rule identifier. It also provides
/// the frequency with which you want AWS Config to run evaluations for the rule
/// if the trigger type is periodic.
class OrganizationManagedRuleMetadata {
  /// For organization config managed rules, a predefined identifier from a list.
  /// For example, <code>IAM_PASSWORD_POLICY</code> is a managed rule. To
  /// reference a managed rule, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">Using
  /// AWS Managed Config Rules</a>.
  final String ruleIdentifier;

  /// The description that you provide for organization config rule.
  final String? description;

  /// A string, in JSON format, that is passed to organization config rule Lambda
  /// function.
  final String? inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule. You
  /// are using an AWS managed rule that is triggered at a periodic frequency.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The ID of the AWS resource that was evaluated.
  final String? resourceIdScope;

  /// The type of the AWS resource that was evaluated.
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
          ?.toMaximumExecutionFrequency(),
      resourceIdScope: json['ResourceIdScope'] as String?,
      resourceTypesScope: (json['ResourceTypesScope'] as List?)
          ?.whereNotNull()
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
        'MaximumExecutionFrequency': maximumExecutionFrequency.toValue(),
      if (resourceIdScope != null) 'ResourceIdScope': resourceIdScope,
      if (resourceTypesScope != null) 'ResourceTypesScope': resourceTypesScope,
      if (tagKeyScope != null) 'TagKeyScope': tagKeyScope,
      if (tagValueScope != null) 'TagValueScope': tagValueScope,
    };
  }
}

enum OrganizationResourceDetailedStatus {
  createSuccessful,
  createInProgress,
  createFailed,
  deleteSuccessful,
  deleteFailed,
  deleteInProgress,
  updateSuccessful,
  updateInProgress,
  updateFailed,
}

extension on OrganizationResourceDetailedStatus {
  String toValue() {
    switch (this) {
      case OrganizationResourceDetailedStatus.createSuccessful:
        return 'CREATE_SUCCESSFUL';
      case OrganizationResourceDetailedStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case OrganizationResourceDetailedStatus.createFailed:
        return 'CREATE_FAILED';
      case OrganizationResourceDetailedStatus.deleteSuccessful:
        return 'DELETE_SUCCESSFUL';
      case OrganizationResourceDetailedStatus.deleteFailed:
        return 'DELETE_FAILED';
      case OrganizationResourceDetailedStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case OrganizationResourceDetailedStatus.updateSuccessful:
        return 'UPDATE_SUCCESSFUL';
      case OrganizationResourceDetailedStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case OrganizationResourceDetailedStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  OrganizationResourceDetailedStatus toOrganizationResourceDetailedStatus() {
    switch (this) {
      case 'CREATE_SUCCESSFUL':
        return OrganizationResourceDetailedStatus.createSuccessful;
      case 'CREATE_IN_PROGRESS':
        return OrganizationResourceDetailedStatus.createInProgress;
      case 'CREATE_FAILED':
        return OrganizationResourceDetailedStatus.createFailed;
      case 'DELETE_SUCCESSFUL':
        return OrganizationResourceDetailedStatus.deleteSuccessful;
      case 'DELETE_FAILED':
        return OrganizationResourceDetailedStatus.deleteFailed;
      case 'DELETE_IN_PROGRESS':
        return OrganizationResourceDetailedStatus.deleteInProgress;
      case 'UPDATE_SUCCESSFUL':
        return OrganizationResourceDetailedStatus.updateSuccessful;
      case 'UPDATE_IN_PROGRESS':
        return OrganizationResourceDetailedStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return OrganizationResourceDetailedStatus.updateFailed;
    }
    throw Exception(
        '$this is not known in enum OrganizationResourceDetailedStatus');
  }
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization conformance pack.
class OrganizationResourceDetailedStatusFilters {
  /// The 12-digit account ID of the member account within an organization.
  final String? accountId;

  /// Indicates deployment status for conformance pack in a member account. When
  /// master account calls <code>PutOrganizationConformancePack</code> action for
  /// the first time, conformance pack status is created in the member account.
  /// When master account calls <code>PutOrganizationConformancePack</code> action
  /// for the second time, conformance pack status is updated in the member
  /// account. Conformance pack status is deleted when the master account deletes
  /// <code>OrganizationConformancePack</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the conformance pack to:
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

  factory OrganizationResourceDetailedStatusFilters.fromJson(
      Map<String, dynamic> json) {
    return OrganizationResourceDetailedStatusFilters(
      accountId: json['AccountId'] as String?,
      status:
          (json['Status'] as String?)?.toOrganizationResourceDetailedStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OrganizationResourceStatus {
  createSuccessful,
  createInProgress,
  createFailed,
  deleteSuccessful,
  deleteFailed,
  deleteInProgress,
  updateSuccessful,
  updateInProgress,
  updateFailed,
}

extension on OrganizationResourceStatus {
  String toValue() {
    switch (this) {
      case OrganizationResourceStatus.createSuccessful:
        return 'CREATE_SUCCESSFUL';
      case OrganizationResourceStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case OrganizationResourceStatus.createFailed:
        return 'CREATE_FAILED';
      case OrganizationResourceStatus.deleteSuccessful:
        return 'DELETE_SUCCESSFUL';
      case OrganizationResourceStatus.deleteFailed:
        return 'DELETE_FAILED';
      case OrganizationResourceStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case OrganizationResourceStatus.updateSuccessful:
        return 'UPDATE_SUCCESSFUL';
      case OrganizationResourceStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case OrganizationResourceStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  OrganizationResourceStatus toOrganizationResourceStatus() {
    switch (this) {
      case 'CREATE_SUCCESSFUL':
        return OrganizationResourceStatus.createSuccessful;
      case 'CREATE_IN_PROGRESS':
        return OrganizationResourceStatus.createInProgress;
      case 'CREATE_FAILED':
        return OrganizationResourceStatus.createFailed;
      case 'DELETE_SUCCESSFUL':
        return OrganizationResourceStatus.deleteSuccessful;
      case 'DELETE_FAILED':
        return OrganizationResourceStatus.deleteFailed;
      case 'DELETE_IN_PROGRESS':
        return OrganizationResourceStatus.deleteInProgress;
      case 'UPDATE_SUCCESSFUL':
        return OrganizationResourceStatus.updateSuccessful;
      case 'UPDATE_IN_PROGRESS':
        return OrganizationResourceStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return OrganizationResourceStatus.updateFailed;
    }
    throw Exception('$this is not known in enum OrganizationResourceStatus');
  }
}

enum OrganizationRuleStatus {
  createSuccessful,
  createInProgress,
  createFailed,
  deleteSuccessful,
  deleteFailed,
  deleteInProgress,
  updateSuccessful,
  updateInProgress,
  updateFailed,
}

extension on OrganizationRuleStatus {
  String toValue() {
    switch (this) {
      case OrganizationRuleStatus.createSuccessful:
        return 'CREATE_SUCCESSFUL';
      case OrganizationRuleStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case OrganizationRuleStatus.createFailed:
        return 'CREATE_FAILED';
      case OrganizationRuleStatus.deleteSuccessful:
        return 'DELETE_SUCCESSFUL';
      case OrganizationRuleStatus.deleteFailed:
        return 'DELETE_FAILED';
      case OrganizationRuleStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case OrganizationRuleStatus.updateSuccessful:
        return 'UPDATE_SUCCESSFUL';
      case OrganizationRuleStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case OrganizationRuleStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  OrganizationRuleStatus toOrganizationRuleStatus() {
    switch (this) {
      case 'CREATE_SUCCESSFUL':
        return OrganizationRuleStatus.createSuccessful;
      case 'CREATE_IN_PROGRESS':
        return OrganizationRuleStatus.createInProgress;
      case 'CREATE_FAILED':
        return OrganizationRuleStatus.createFailed;
      case 'DELETE_SUCCESSFUL':
        return OrganizationRuleStatus.deleteSuccessful;
      case 'DELETE_FAILED':
        return OrganizationRuleStatus.deleteFailed;
      case 'DELETE_IN_PROGRESS':
        return OrganizationRuleStatus.deleteInProgress;
      case 'UPDATE_SUCCESSFUL':
        return OrganizationRuleStatus.updateSuccessful;
      case 'UPDATE_IN_PROGRESS':
        return OrganizationRuleStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return OrganizationRuleStatus.updateFailed;
    }
    throw Exception('$this is not known in enum OrganizationRuleStatus');
  }
}

enum Owner {
  customLambda,
  aws,
}

extension on Owner {
  String toValue() {
    switch (this) {
      case Owner.customLambda:
        return 'CUSTOM_LAMBDA';
      case Owner.aws:
        return 'AWS';
    }
  }
}

extension on String {
  Owner toOwner() {
    switch (this) {
      case 'CUSTOM_LAMBDA':
        return Owner.customLambda;
      case 'AWS':
        return Owner.aws;
    }
    throw Exception('$this is not known in enum Owner');
  }
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

  Map<String, dynamic> toJson() {
    final requesterAccountId = this.requesterAccountId;
    final requesterAwsRegion = this.requesterAwsRegion;
    return {
      if (requesterAccountId != null) 'RequesterAccountId': requesterAccountId,
      if (requesterAwsRegion != null) 'RequesterAwsRegion': requesterAwsRegion,
    };
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

  Map<String, dynamic> toJson() {
    final aggregationAuthorization = this.aggregationAuthorization;
    return {
      if (aggregationAuthorization != null)
        'AggregationAuthorization': aggregationAuthorization,
    };
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

  Map<String, dynamic> toJson() {
    final configurationAggregator = this.configurationAggregator;
    return {
      if (configurationAggregator != null)
        'ConfigurationAggregator': configurationAggregator,
    };
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

  Map<String, dynamic> toJson() {
    final conformancePackArn = this.conformancePackArn;
    return {
      if (conformancePackArn != null) 'ConformancePackArn': conformancePackArn,
    };
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
          ?.whereNotNull()
          .map((e) => Evaluation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedEvaluations = this.failedEvaluations;
    return {
      if (failedEvaluations != null) 'FailedEvaluations': failedEvaluations,
    };
  }
}

class PutExternalEvaluationResponse {
  PutExternalEvaluationResponse();

  factory PutExternalEvaluationResponse.fromJson(Map<String, dynamic> _) {
    return PutExternalEvaluationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutOrganizationConfigRuleResponse {
  /// The Amazon Resource Name (ARN) of an organization config rule.
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

  Map<String, dynamic> toJson() {
    final organizationConfigRuleArn = this.organizationConfigRuleArn;
    return {
      if (organizationConfigRuleArn != null)
        'OrganizationConfigRuleArn': organizationConfigRuleArn,
    };
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

  Map<String, dynamic> toJson() {
    final organizationConformancePackArn = this.organizationConformancePackArn;
    return {
      if (organizationConformancePackArn != null)
        'OrganizationConformancePackArn': organizationConformancePackArn,
    };
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
          ?.whereNotNull()
          .map(
              (e) => FailedRemediationBatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedBatches = this.failedBatches;
    return {
      if (failedBatches != null) 'FailedBatches': failedBatches,
    };
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
          ?.whereNotNull()
          .map((e) => FailedRemediationExceptionBatch.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedBatches = this.failedBatches;
    return {
      if (failedBatches != null) 'FailedBatches': failedBatches,
    };
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

  Map<String, dynamic> toJson() {
    final retentionConfiguration = this.retentionConfiguration;
    return {
      if (retentionConfiguration != null)
        'RetentionConfiguration': retentionConfiguration,
    };
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

  Map<String, dynamic> toJson() {
    final queryArn = this.queryArn;
    return {
      if (queryArn != null) 'QueryArn': queryArn,
    };
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
          ?.whereNotNull()
          .map((e) => FieldInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final selectFields = this.selectFields;
    return {
      if (selectFields != null) 'SelectFields': selectFields,
    };
  }
}

enum RecorderStatus {
  pending,
  success,
  failure,
}

extension on RecorderStatus {
  String toValue() {
    switch (this) {
      case RecorderStatus.pending:
        return 'Pending';
      case RecorderStatus.success:
        return 'Success';
      case RecorderStatus.failure:
        return 'Failure';
    }
  }
}

extension on String {
  RecorderStatus toRecorderStatus() {
    switch (this) {
      case 'Pending':
        return RecorderStatus.pending;
      case 'Success':
        return RecorderStatus.success;
      case 'Failure':
        return RecorderStatus.failure;
    }
    throw Exception('$this is not known in enum RecorderStatus');
  }
}

/// Specifies the types of AWS resource for which AWS Config records
/// configuration changes.
///
/// In the recording group, you specify whether all supported types or specific
/// types of resources are recorded.
///
/// By default, AWS Config records configuration changes for all supported types
/// of regional resources that AWS Config discovers in the region in which it is
/// running. Regional resources are tied to a region and can be used only in
/// that region. Examples of regional resources are EC2 instances and EBS
/// volumes.
///
/// You can also have AWS Config record configuration changes for supported
/// types of global resources (for example, IAM resources). Global resources are
/// not tied to an individual region and can be used in all regions.
/// <important>
/// The configuration details for any global resource are the same in all
/// regions. If you customize AWS Config in multiple regions to record global
/// resources, it will create multiple configuration items each time a global
/// resource changes: one configuration item for each region. These
/// configuration items will contain identical data. To prevent duplicate
/// configuration items, you should consider customizing AWS Config in only one
/// region to record global resources, unless you want the configuration items
/// to be available in multiple regions.
/// </important>
/// If you don't want AWS Config to record all resources, you can specify which
/// types of resources it will record with the <code>resourceTypes</code>
/// parameter.
///
/// For a list of supported resource types, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
/// Resource Types</a>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html">Selecting
/// Which Resources AWS Config Records</a>.
class RecordingGroup {
  /// Specifies whether AWS Config records configuration changes for every
  /// supported type of regional resource.
  ///
  /// If you set this option to <code>true</code>, when AWS Config adds support
  /// for a new type of regional resource, it starts recording resources of that
  /// type automatically.
  ///
  /// If you set this option to <code>true</code>, you cannot enumerate a list of
  /// <code>resourceTypes</code>.
  final bool? allSupported;

  /// Specifies whether AWS Config includes all supported types of global
  /// resources (for example, IAM resources) with the resources that it records.
  ///
  /// Before you can set this option to <code>true</code>, you must set the
  /// <code>allSupported</code> option to <code>true</code>.
  ///
  /// If you set this option to <code>true</code>, when AWS Config adds support
  /// for a new type of global resource, it starts recording resources of that
  /// type automatically.
  ///
  /// The configuration details for any global resource are the same in all
  /// regions. To prevent duplicate configuration items, you should consider
  /// customizing AWS Config in only one region to record global resources.
  final bool? includeGlobalResourceTypes;

  /// A comma-separated list that specifies the types of AWS resources for which
  /// AWS Config records configuration changes (for example,
  /// <code>AWS::EC2::Instance</code> or <code>AWS::CloudTrail::Trail</code>).
  ///
  /// To record all configuration changes, you must set the
  /// <code>allSupported</code> option to <code>true</code>.
  ///
  /// If you set this option to <code>false</code>, when AWS Config adds support
  /// for a new type of resource, it will not record resources of that type unless
  /// you manually add that type to your recording group.
  ///
  /// For a list of valid <code>resourceTypes</code> values, see the
  /// <b>resourceType Value</b> column in <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
  /// AWS Resource Types</a>.
  final List<ResourceType>? resourceTypes;

  RecordingGroup({
    this.allSupported,
    this.includeGlobalResourceTypes,
    this.resourceTypes,
  });

  factory RecordingGroup.fromJson(Map<String, dynamic> json) {
    return RecordingGroup(
      allSupported: json['allSupported'] as bool?,
      includeGlobalResourceTypes: json['includeGlobalResourceTypes'] as bool?,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toResourceType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allSupported = this.allSupported;
    final includeGlobalResourceTypes = this.includeGlobalResourceTypes;
    final resourceTypes = this.resourceTypes;
    return {
      if (allSupported != null) 'allSupported': allSupported,
      if (includeGlobalResourceTypes != null)
        'includeGlobalResourceTypes': includeGlobalResourceTypes,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
    };
  }
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
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipName = this.relationshipName;
    final resourceId = this.resourceId;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (relationshipName != null) 'relationshipName': relationshipName,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

/// An object that represents the details about the remediation configuration
/// that includes the remediation action, parameters, and data to execute the
/// action.
class RemediationConfiguration {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// Target ID is the name of the public document.
  final String targetId;

  /// The type of the target. Target executes remediation. For example, SSM
  /// document.
  final RemediationTargetType targetType;

  /// Amazon Resource Name (ARN) of remediation configuration.
  final String? arn;

  /// The remediation is triggered automatically.
  final bool? automatic;

  /// Name of the service that owns the service linked rule, if applicable.
  final String? createdByService;

  /// An ExecutionControls object.
  final ExecutionControls? executionControls;

  /// The maximum number of failed attempts for auto-remediation. If you do not
  /// select a number, the default is 5.
  ///
  /// For example, if you specify MaximumAutomaticAttempts as 5 with
  /// RetryAttemptSeconds as 50 seconds, AWS Config will put a
  /// RemediationException on your behalf for the failing resource after the 5th
  /// failed attempt within 50 seconds.
  final int? maximumAutomaticAttempts;

  /// An object of the RemediationParameterValue.
  final Map<String, RemediationParameterValue>? parameters;

  /// The type of a resource.
  final String? resourceType;

  /// Maximum time in seconds that AWS Config runs auto-remediation. If you do not
  /// select a number, the default is 60 seconds.
  ///
  /// For example, if you specify RetryAttemptSeconds as 50 seconds and
  /// MaximumAutomaticAttempts as 5, AWS Config will run auto-remediations 5 times
  /// within 50 seconds before throwing an exception.
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
      targetType: (json['TargetType'] as String).toRemediationTargetType(),
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
      'TargetType': targetType.toValue(),
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
  /// The name of the AWS Config rule.
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

  Map<String, dynamic> toJson() {
    final configRuleName = this.configRuleName;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final expirationTime = this.expirationTime;
    final message = this.message;
    return {
      'ConfigRuleName': configRuleName,
      'ResourceId': resourceId,
      'ResourceType': resourceType,
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (message != null) 'Message': message,
    };
  }
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
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
  queued,
  inProgress,
  succeeded,
  failed,
}

extension on RemediationExecutionState {
  String toValue() {
    switch (this) {
      case RemediationExecutionState.queued:
        return 'QUEUED';
      case RemediationExecutionState.inProgress:
        return 'IN_PROGRESS';
      case RemediationExecutionState.succeeded:
        return 'SUCCEEDED';
      case RemediationExecutionState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  RemediationExecutionState toRemediationExecutionState() {
    switch (this) {
      case 'QUEUED':
        return RemediationExecutionState.queued;
      case 'IN_PROGRESS':
        return RemediationExecutionState.inProgress;
      case 'SUCCEEDED':
        return RemediationExecutionState.succeeded;
      case 'FAILED':
        return RemediationExecutionState.failed;
    }
    throw Exception('$this is not known in enum RemediationExecutionState');
  }
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
      state: (json['State'] as String?)?.toRemediationExecutionState(),
      stepDetails: (json['StepDetails'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RemediationExecutionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationTime = this.invocationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceKey = this.resourceKey;
    final state = this.state;
    final stepDetails = this.stepDetails;
    return {
      if (invocationTime != null)
        'InvocationTime': unixTimestampToJson(invocationTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceKey != null) 'ResourceKey': resourceKey,
      if (state != null) 'State': state.toValue(),
      if (stepDetails != null) 'StepDetails': stepDetails,
    };
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
      state: (json['State'] as String?)?.toRemediationExecutionStepState(),
      stopTime: timeStampFromJson(json['StopTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final name = this.name;
    final startTime = this.startTime;
    final state = this.state;
    final stopTime = this.stopTime;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (name != null) 'Name': name,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.toValue(),
      if (stopTime != null) 'StopTime': unixTimestampToJson(stopTime),
    };
  }
}

enum RemediationExecutionStepState {
  succeeded,
  pending,
  failed,
}

extension on RemediationExecutionStepState {
  String toValue() {
    switch (this) {
      case RemediationExecutionStepState.succeeded:
        return 'SUCCEEDED';
      case RemediationExecutionStepState.pending:
        return 'PENDING';
      case RemediationExecutionStepState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  RemediationExecutionStepState toRemediationExecutionStepState() {
    switch (this) {
      case 'SUCCEEDED':
        return RemediationExecutionStepState.succeeded;
      case 'PENDING':
        return RemediationExecutionStepState.pending;
      case 'FAILED':
        return RemediationExecutionStepState.failed;
    }
    throw Exception('$this is not known in enum RemediationExecutionStepState');
  }
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
  ssmDocument,
}

extension on RemediationTargetType {
  String toValue() {
    switch (this) {
      case RemediationTargetType.ssmDocument:
        return 'SSM_DOCUMENT';
    }
  }
}

extension on String {
  RemediationTargetType toRemediationTargetType() {
    switch (this) {
      case 'SSM_DOCUMENT':
        return RemediationTargetType.ssmDocument;
    }
    throw Exception('$this is not known in enum RemediationTargetType');
  }
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
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final resourceType = this.resourceType;
    return {
      if (count != null) 'count': count,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

/// Filters the resource count based on account ID, region, and resource type.
class ResourceCountFilters {
  /// The 12-digit ID of the account.
  final String? accountId;

  /// The region where the account is located.
  final String? region;

  /// The type of the AWS resource.
  final ResourceType? resourceType;

  ResourceCountFilters({
    this.accountId,
    this.region,
    this.resourceType,
  });

  factory ResourceCountFilters.fromJson(Map<String, dynamic> json) {
    return ResourceCountFilters(
      accountId: json['AccountId'] as String?,
      region: json['Region'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final region = this.region;
    final resourceType = this.resourceType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

enum ResourceCountGroupKey {
  resourceType,
  accountId,
  awsRegion,
}

extension on ResourceCountGroupKey {
  String toValue() {
    switch (this) {
      case ResourceCountGroupKey.resourceType:
        return 'RESOURCE_TYPE';
      case ResourceCountGroupKey.accountId:
        return 'ACCOUNT_ID';
      case ResourceCountGroupKey.awsRegion:
        return 'AWS_REGION';
    }
  }
}

extension on String {
  ResourceCountGroupKey toResourceCountGroupKey() {
    switch (this) {
      case 'RESOURCE_TYPE':
        return ResourceCountGroupKey.resourceType;
      case 'ACCOUNT_ID':
        return ResourceCountGroupKey.accountId;
      case 'AWS_REGION':
        return ResourceCountGroupKey.awsRegion;
    }
    throw Exception('$this is not known in enum ResourceCountGroupKey');
  }
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

  factory ResourceFilters.fromJson(Map<String, dynamic> json) {
    return ResourceFilters(
      accountId: json['AccountId'] as String?,
      region: json['Region'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceName: json['ResourceName'] as String?,
    );
  }

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

/// The details that identify a resource that is discovered by AWS Config,
/// including the resource type, ID, and (if available) the custom resource
/// name.
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
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceDeletionTime = this.resourceDeletionTime;
    final resourceId = this.resourceId;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (resourceDeletionTime != null)
        'resourceDeletionTime': unixTimestampToJson(resourceDeletionTime),
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
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
      resourceType: (json['resourceType'] as String).toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      'resourceId': resourceId,
      'resourceType': resourceType.toValue(),
    };
  }
}

enum ResourceType {
  awsEc2CustomerGateway,
  awsEc2Eip,
  awsEc2Host,
  awsEc2Instance,
  awsEc2InternetGateway,
  awsEc2NetworkAcl,
  awsEc2NetworkInterface,
  awsEc2RouteTable,
  awsEc2SecurityGroup,
  awsEc2Subnet,
  awsCloudTrailTrail,
  awsEc2Volume,
  awsEc2Vpc,
  awsEc2VPNConnection,
  awsEc2VPNGateway,
  awsEc2RegisteredHAInstance,
  awsEc2NatGateway,
  awsEc2EgressOnlyInternetGateway,
  awsEc2VPCEndpoint,
  awsEc2VPCEndpointService,
  awsEc2FlowLog,
  awsEc2VPCPeeringConnection,
  awsElasticsearchDomain,
  awsIamGroup,
  awsIamPolicy,
  awsIamRole,
  awsIamUser,
  awsElasticLoadBalancingV2LoadBalancer,
  awsAcmCertificate,
  awsRdsDBInstance,
  awsRdsDBSubnetGroup,
  awsRdsDBSecurityGroup,
  awsRdsDBSnapshot,
  awsRdsDBCluster,
  awsRdsDBClusterSnapshot,
  awsRdsEventSubscription,
  awsS3Bucket,
  awsS3AccountPublicAccessBlock,
  awsRedshiftCluster,
  awsRedshiftClusterSnapshot,
  awsRedshiftClusterParameterGroup,
  awsRedshiftClusterSecurityGroup,
  awsRedshiftClusterSubnetGroup,
  awsRedshiftEventSubscription,
  awsSsmManagedInstanceInventory,
  awsCloudWatchAlarm,
  awsCloudFormationStack,
  awsElasticLoadBalancingLoadBalancer,
  awsAutoScalingAutoScalingGroup,
  awsAutoScalingLaunchConfiguration,
  awsAutoScalingScalingPolicy,
  awsAutoScalingScheduledAction,
  awsDynamoDBTable,
  awsCodeBuildProject,
  awsWafRateBasedRule,
  awsWafRule,
  awsWafRuleGroup,
  awsWafWebACL,
  awsWAFRegionalRateBasedRule,
  awsWAFRegionalRule,
  awsWAFRegionalRuleGroup,
  awsWAFRegionalWebACL,
  awsCloudFrontDistribution,
  awsCloudFrontStreamingDistribution,
  awsLambdaFunction,
  awsNetworkFirewallFirewall,
  awsNetworkFirewallFirewallPolicy,
  awsNetworkFirewallRuleGroup,
  awsElasticBeanstalkApplication,
  awsElasticBeanstalkApplicationVersion,
  awsElasticBeanstalkEnvironment,
  awsWAFv2WebACL,
  awsWAFv2RuleGroup,
  awsWAFv2IPSet,
  awsWAFv2RegexPatternSet,
  awsWAFv2ManagedRuleSet,
  awsXRayEncryptionConfig,
  awsSsmAssociationCompliance,
  awsSsmPatchCompliance,
  awsShieldProtection,
  awsShieldRegionalProtection,
  awsConfigConformancePackCompliance,
  awsConfigResourceCompliance,
  awsApiGatewayStage,
  awsApiGatewayRestApi,
  awsApiGatewayV2Stage,
  awsApiGatewayV2Api,
  awsCodePipelinePipeline,
  awsServiceCatalogCloudFormationProvisionedProduct,
  awsServiceCatalogCloudFormationProduct,
  awsServiceCatalogPortfolio,
  awsSqsQueue,
  awsKmsKey,
  awsQldbLedger,
  awsSecretsManagerSecret,
  awsSnsTopic,
  awsSsmFileData,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.awsEc2CustomerGateway:
        return 'AWS::EC2::CustomerGateway';
      case ResourceType.awsEc2Eip:
        return 'AWS::EC2::EIP';
      case ResourceType.awsEc2Host:
        return 'AWS::EC2::Host';
      case ResourceType.awsEc2Instance:
        return 'AWS::EC2::Instance';
      case ResourceType.awsEc2InternetGateway:
        return 'AWS::EC2::InternetGateway';
      case ResourceType.awsEc2NetworkAcl:
        return 'AWS::EC2::NetworkAcl';
      case ResourceType.awsEc2NetworkInterface:
        return 'AWS::EC2::NetworkInterface';
      case ResourceType.awsEc2RouteTable:
        return 'AWS::EC2::RouteTable';
      case ResourceType.awsEc2SecurityGroup:
        return 'AWS::EC2::SecurityGroup';
      case ResourceType.awsEc2Subnet:
        return 'AWS::EC2::Subnet';
      case ResourceType.awsCloudTrailTrail:
        return 'AWS::CloudTrail::Trail';
      case ResourceType.awsEc2Volume:
        return 'AWS::EC2::Volume';
      case ResourceType.awsEc2Vpc:
        return 'AWS::EC2::VPC';
      case ResourceType.awsEc2VPNConnection:
        return 'AWS::EC2::VPNConnection';
      case ResourceType.awsEc2VPNGateway:
        return 'AWS::EC2::VPNGateway';
      case ResourceType.awsEc2RegisteredHAInstance:
        return 'AWS::EC2::RegisteredHAInstance';
      case ResourceType.awsEc2NatGateway:
        return 'AWS::EC2::NatGateway';
      case ResourceType.awsEc2EgressOnlyInternetGateway:
        return 'AWS::EC2::EgressOnlyInternetGateway';
      case ResourceType.awsEc2VPCEndpoint:
        return 'AWS::EC2::VPCEndpoint';
      case ResourceType.awsEc2VPCEndpointService:
        return 'AWS::EC2::VPCEndpointService';
      case ResourceType.awsEc2FlowLog:
        return 'AWS::EC2::FlowLog';
      case ResourceType.awsEc2VPCPeeringConnection:
        return 'AWS::EC2::VPCPeeringConnection';
      case ResourceType.awsElasticsearchDomain:
        return 'AWS::Elasticsearch::Domain';
      case ResourceType.awsIamGroup:
        return 'AWS::IAM::Group';
      case ResourceType.awsIamPolicy:
        return 'AWS::IAM::Policy';
      case ResourceType.awsIamRole:
        return 'AWS::IAM::Role';
      case ResourceType.awsIamUser:
        return 'AWS::IAM::User';
      case ResourceType.awsElasticLoadBalancingV2LoadBalancer:
        return 'AWS::ElasticLoadBalancingV2::LoadBalancer';
      case ResourceType.awsAcmCertificate:
        return 'AWS::ACM::Certificate';
      case ResourceType.awsRdsDBInstance:
        return 'AWS::RDS::DBInstance';
      case ResourceType.awsRdsDBSubnetGroup:
        return 'AWS::RDS::DBSubnetGroup';
      case ResourceType.awsRdsDBSecurityGroup:
        return 'AWS::RDS::DBSecurityGroup';
      case ResourceType.awsRdsDBSnapshot:
        return 'AWS::RDS::DBSnapshot';
      case ResourceType.awsRdsDBCluster:
        return 'AWS::RDS::DBCluster';
      case ResourceType.awsRdsDBClusterSnapshot:
        return 'AWS::RDS::DBClusterSnapshot';
      case ResourceType.awsRdsEventSubscription:
        return 'AWS::RDS::EventSubscription';
      case ResourceType.awsS3Bucket:
        return 'AWS::S3::Bucket';
      case ResourceType.awsS3AccountPublicAccessBlock:
        return 'AWS::S3::AccountPublicAccessBlock';
      case ResourceType.awsRedshiftCluster:
        return 'AWS::Redshift::Cluster';
      case ResourceType.awsRedshiftClusterSnapshot:
        return 'AWS::Redshift::ClusterSnapshot';
      case ResourceType.awsRedshiftClusterParameterGroup:
        return 'AWS::Redshift::ClusterParameterGroup';
      case ResourceType.awsRedshiftClusterSecurityGroup:
        return 'AWS::Redshift::ClusterSecurityGroup';
      case ResourceType.awsRedshiftClusterSubnetGroup:
        return 'AWS::Redshift::ClusterSubnetGroup';
      case ResourceType.awsRedshiftEventSubscription:
        return 'AWS::Redshift::EventSubscription';
      case ResourceType.awsSsmManagedInstanceInventory:
        return 'AWS::SSM::ManagedInstanceInventory';
      case ResourceType.awsCloudWatchAlarm:
        return 'AWS::CloudWatch::Alarm';
      case ResourceType.awsCloudFormationStack:
        return 'AWS::CloudFormation::Stack';
      case ResourceType.awsElasticLoadBalancingLoadBalancer:
        return 'AWS::ElasticLoadBalancing::LoadBalancer';
      case ResourceType.awsAutoScalingAutoScalingGroup:
        return 'AWS::AutoScaling::AutoScalingGroup';
      case ResourceType.awsAutoScalingLaunchConfiguration:
        return 'AWS::AutoScaling::LaunchConfiguration';
      case ResourceType.awsAutoScalingScalingPolicy:
        return 'AWS::AutoScaling::ScalingPolicy';
      case ResourceType.awsAutoScalingScheduledAction:
        return 'AWS::AutoScaling::ScheduledAction';
      case ResourceType.awsDynamoDBTable:
        return 'AWS::DynamoDB::Table';
      case ResourceType.awsCodeBuildProject:
        return 'AWS::CodeBuild::Project';
      case ResourceType.awsWafRateBasedRule:
        return 'AWS::WAF::RateBasedRule';
      case ResourceType.awsWafRule:
        return 'AWS::WAF::Rule';
      case ResourceType.awsWafRuleGroup:
        return 'AWS::WAF::RuleGroup';
      case ResourceType.awsWafWebACL:
        return 'AWS::WAF::WebACL';
      case ResourceType.awsWAFRegionalRateBasedRule:
        return 'AWS::WAFRegional::RateBasedRule';
      case ResourceType.awsWAFRegionalRule:
        return 'AWS::WAFRegional::Rule';
      case ResourceType.awsWAFRegionalRuleGroup:
        return 'AWS::WAFRegional::RuleGroup';
      case ResourceType.awsWAFRegionalWebACL:
        return 'AWS::WAFRegional::WebACL';
      case ResourceType.awsCloudFrontDistribution:
        return 'AWS::CloudFront::Distribution';
      case ResourceType.awsCloudFrontStreamingDistribution:
        return 'AWS::CloudFront::StreamingDistribution';
      case ResourceType.awsLambdaFunction:
        return 'AWS::Lambda::Function';
      case ResourceType.awsNetworkFirewallFirewall:
        return 'AWS::NetworkFirewall::Firewall';
      case ResourceType.awsNetworkFirewallFirewallPolicy:
        return 'AWS::NetworkFirewall::FirewallPolicy';
      case ResourceType.awsNetworkFirewallRuleGroup:
        return 'AWS::NetworkFirewall::RuleGroup';
      case ResourceType.awsElasticBeanstalkApplication:
        return 'AWS::ElasticBeanstalk::Application';
      case ResourceType.awsElasticBeanstalkApplicationVersion:
        return 'AWS::ElasticBeanstalk::ApplicationVersion';
      case ResourceType.awsElasticBeanstalkEnvironment:
        return 'AWS::ElasticBeanstalk::Environment';
      case ResourceType.awsWAFv2WebACL:
        return 'AWS::WAFv2::WebACL';
      case ResourceType.awsWAFv2RuleGroup:
        return 'AWS::WAFv2::RuleGroup';
      case ResourceType.awsWAFv2IPSet:
        return 'AWS::WAFv2::IPSet';
      case ResourceType.awsWAFv2RegexPatternSet:
        return 'AWS::WAFv2::RegexPatternSet';
      case ResourceType.awsWAFv2ManagedRuleSet:
        return 'AWS::WAFv2::ManagedRuleSet';
      case ResourceType.awsXRayEncryptionConfig:
        return 'AWS::XRay::EncryptionConfig';
      case ResourceType.awsSsmAssociationCompliance:
        return 'AWS::SSM::AssociationCompliance';
      case ResourceType.awsSsmPatchCompliance:
        return 'AWS::SSM::PatchCompliance';
      case ResourceType.awsShieldProtection:
        return 'AWS::Shield::Protection';
      case ResourceType.awsShieldRegionalProtection:
        return 'AWS::ShieldRegional::Protection';
      case ResourceType.awsConfigConformancePackCompliance:
        return 'AWS::Config::ConformancePackCompliance';
      case ResourceType.awsConfigResourceCompliance:
        return 'AWS::Config::ResourceCompliance';
      case ResourceType.awsApiGatewayStage:
        return 'AWS::ApiGateway::Stage';
      case ResourceType.awsApiGatewayRestApi:
        return 'AWS::ApiGateway::RestApi';
      case ResourceType.awsApiGatewayV2Stage:
        return 'AWS::ApiGatewayV2::Stage';
      case ResourceType.awsApiGatewayV2Api:
        return 'AWS::ApiGatewayV2::Api';
      case ResourceType.awsCodePipelinePipeline:
        return 'AWS::CodePipeline::Pipeline';
      case ResourceType.awsServiceCatalogCloudFormationProvisionedProduct:
        return 'AWS::ServiceCatalog::CloudFormationProvisionedProduct';
      case ResourceType.awsServiceCatalogCloudFormationProduct:
        return 'AWS::ServiceCatalog::CloudFormationProduct';
      case ResourceType.awsServiceCatalogPortfolio:
        return 'AWS::ServiceCatalog::Portfolio';
      case ResourceType.awsSqsQueue:
        return 'AWS::SQS::Queue';
      case ResourceType.awsKmsKey:
        return 'AWS::KMS::Key';
      case ResourceType.awsQldbLedger:
        return 'AWS::QLDB::Ledger';
      case ResourceType.awsSecretsManagerSecret:
        return 'AWS::SecretsManager::Secret';
      case ResourceType.awsSnsTopic:
        return 'AWS::SNS::Topic';
      case ResourceType.awsSsmFileData:
        return 'AWS::SSM::FileData';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'AWS::EC2::CustomerGateway':
        return ResourceType.awsEc2CustomerGateway;
      case 'AWS::EC2::EIP':
        return ResourceType.awsEc2Eip;
      case 'AWS::EC2::Host':
        return ResourceType.awsEc2Host;
      case 'AWS::EC2::Instance':
        return ResourceType.awsEc2Instance;
      case 'AWS::EC2::InternetGateway':
        return ResourceType.awsEc2InternetGateway;
      case 'AWS::EC2::NetworkAcl':
        return ResourceType.awsEc2NetworkAcl;
      case 'AWS::EC2::NetworkInterface':
        return ResourceType.awsEc2NetworkInterface;
      case 'AWS::EC2::RouteTable':
        return ResourceType.awsEc2RouteTable;
      case 'AWS::EC2::SecurityGroup':
        return ResourceType.awsEc2SecurityGroup;
      case 'AWS::EC2::Subnet':
        return ResourceType.awsEc2Subnet;
      case 'AWS::CloudTrail::Trail':
        return ResourceType.awsCloudTrailTrail;
      case 'AWS::EC2::Volume':
        return ResourceType.awsEc2Volume;
      case 'AWS::EC2::VPC':
        return ResourceType.awsEc2Vpc;
      case 'AWS::EC2::VPNConnection':
        return ResourceType.awsEc2VPNConnection;
      case 'AWS::EC2::VPNGateway':
        return ResourceType.awsEc2VPNGateway;
      case 'AWS::EC2::RegisteredHAInstance':
        return ResourceType.awsEc2RegisteredHAInstance;
      case 'AWS::EC2::NatGateway':
        return ResourceType.awsEc2NatGateway;
      case 'AWS::EC2::EgressOnlyInternetGateway':
        return ResourceType.awsEc2EgressOnlyInternetGateway;
      case 'AWS::EC2::VPCEndpoint':
        return ResourceType.awsEc2VPCEndpoint;
      case 'AWS::EC2::VPCEndpointService':
        return ResourceType.awsEc2VPCEndpointService;
      case 'AWS::EC2::FlowLog':
        return ResourceType.awsEc2FlowLog;
      case 'AWS::EC2::VPCPeeringConnection':
        return ResourceType.awsEc2VPCPeeringConnection;
      case 'AWS::Elasticsearch::Domain':
        return ResourceType.awsElasticsearchDomain;
      case 'AWS::IAM::Group':
        return ResourceType.awsIamGroup;
      case 'AWS::IAM::Policy':
        return ResourceType.awsIamPolicy;
      case 'AWS::IAM::Role':
        return ResourceType.awsIamRole;
      case 'AWS::IAM::User':
        return ResourceType.awsIamUser;
      case 'AWS::ElasticLoadBalancingV2::LoadBalancer':
        return ResourceType.awsElasticLoadBalancingV2LoadBalancer;
      case 'AWS::ACM::Certificate':
        return ResourceType.awsAcmCertificate;
      case 'AWS::RDS::DBInstance':
        return ResourceType.awsRdsDBInstance;
      case 'AWS::RDS::DBSubnetGroup':
        return ResourceType.awsRdsDBSubnetGroup;
      case 'AWS::RDS::DBSecurityGroup':
        return ResourceType.awsRdsDBSecurityGroup;
      case 'AWS::RDS::DBSnapshot':
        return ResourceType.awsRdsDBSnapshot;
      case 'AWS::RDS::DBCluster':
        return ResourceType.awsRdsDBCluster;
      case 'AWS::RDS::DBClusterSnapshot':
        return ResourceType.awsRdsDBClusterSnapshot;
      case 'AWS::RDS::EventSubscription':
        return ResourceType.awsRdsEventSubscription;
      case 'AWS::S3::Bucket':
        return ResourceType.awsS3Bucket;
      case 'AWS::S3::AccountPublicAccessBlock':
        return ResourceType.awsS3AccountPublicAccessBlock;
      case 'AWS::Redshift::Cluster':
        return ResourceType.awsRedshiftCluster;
      case 'AWS::Redshift::ClusterSnapshot':
        return ResourceType.awsRedshiftClusterSnapshot;
      case 'AWS::Redshift::ClusterParameterGroup':
        return ResourceType.awsRedshiftClusterParameterGroup;
      case 'AWS::Redshift::ClusterSecurityGroup':
        return ResourceType.awsRedshiftClusterSecurityGroup;
      case 'AWS::Redshift::ClusterSubnetGroup':
        return ResourceType.awsRedshiftClusterSubnetGroup;
      case 'AWS::Redshift::EventSubscription':
        return ResourceType.awsRedshiftEventSubscription;
      case 'AWS::SSM::ManagedInstanceInventory':
        return ResourceType.awsSsmManagedInstanceInventory;
      case 'AWS::CloudWatch::Alarm':
        return ResourceType.awsCloudWatchAlarm;
      case 'AWS::CloudFormation::Stack':
        return ResourceType.awsCloudFormationStack;
      case 'AWS::ElasticLoadBalancing::LoadBalancer':
        return ResourceType.awsElasticLoadBalancingLoadBalancer;
      case 'AWS::AutoScaling::AutoScalingGroup':
        return ResourceType.awsAutoScalingAutoScalingGroup;
      case 'AWS::AutoScaling::LaunchConfiguration':
        return ResourceType.awsAutoScalingLaunchConfiguration;
      case 'AWS::AutoScaling::ScalingPolicy':
        return ResourceType.awsAutoScalingScalingPolicy;
      case 'AWS::AutoScaling::ScheduledAction':
        return ResourceType.awsAutoScalingScheduledAction;
      case 'AWS::DynamoDB::Table':
        return ResourceType.awsDynamoDBTable;
      case 'AWS::CodeBuild::Project':
        return ResourceType.awsCodeBuildProject;
      case 'AWS::WAF::RateBasedRule':
        return ResourceType.awsWafRateBasedRule;
      case 'AWS::WAF::Rule':
        return ResourceType.awsWafRule;
      case 'AWS::WAF::RuleGroup':
        return ResourceType.awsWafRuleGroup;
      case 'AWS::WAF::WebACL':
        return ResourceType.awsWafWebACL;
      case 'AWS::WAFRegional::RateBasedRule':
        return ResourceType.awsWAFRegionalRateBasedRule;
      case 'AWS::WAFRegional::Rule':
        return ResourceType.awsWAFRegionalRule;
      case 'AWS::WAFRegional::RuleGroup':
        return ResourceType.awsWAFRegionalRuleGroup;
      case 'AWS::WAFRegional::WebACL':
        return ResourceType.awsWAFRegionalWebACL;
      case 'AWS::CloudFront::Distribution':
        return ResourceType.awsCloudFrontDistribution;
      case 'AWS::CloudFront::StreamingDistribution':
        return ResourceType.awsCloudFrontStreamingDistribution;
      case 'AWS::Lambda::Function':
        return ResourceType.awsLambdaFunction;
      case 'AWS::NetworkFirewall::Firewall':
        return ResourceType.awsNetworkFirewallFirewall;
      case 'AWS::NetworkFirewall::FirewallPolicy':
        return ResourceType.awsNetworkFirewallFirewallPolicy;
      case 'AWS::NetworkFirewall::RuleGroup':
        return ResourceType.awsNetworkFirewallRuleGroup;
      case 'AWS::ElasticBeanstalk::Application':
        return ResourceType.awsElasticBeanstalkApplication;
      case 'AWS::ElasticBeanstalk::ApplicationVersion':
        return ResourceType.awsElasticBeanstalkApplicationVersion;
      case 'AWS::ElasticBeanstalk::Environment':
        return ResourceType.awsElasticBeanstalkEnvironment;
      case 'AWS::WAFv2::WebACL':
        return ResourceType.awsWAFv2WebACL;
      case 'AWS::WAFv2::RuleGroup':
        return ResourceType.awsWAFv2RuleGroup;
      case 'AWS::WAFv2::IPSet':
        return ResourceType.awsWAFv2IPSet;
      case 'AWS::WAFv2::RegexPatternSet':
        return ResourceType.awsWAFv2RegexPatternSet;
      case 'AWS::WAFv2::ManagedRuleSet':
        return ResourceType.awsWAFv2ManagedRuleSet;
      case 'AWS::XRay::EncryptionConfig':
        return ResourceType.awsXRayEncryptionConfig;
      case 'AWS::SSM::AssociationCompliance':
        return ResourceType.awsSsmAssociationCompliance;
      case 'AWS::SSM::PatchCompliance':
        return ResourceType.awsSsmPatchCompliance;
      case 'AWS::Shield::Protection':
        return ResourceType.awsShieldProtection;
      case 'AWS::ShieldRegional::Protection':
        return ResourceType.awsShieldRegionalProtection;
      case 'AWS::Config::ConformancePackCompliance':
        return ResourceType.awsConfigConformancePackCompliance;
      case 'AWS::Config::ResourceCompliance':
        return ResourceType.awsConfigResourceCompliance;
      case 'AWS::ApiGateway::Stage':
        return ResourceType.awsApiGatewayStage;
      case 'AWS::ApiGateway::RestApi':
        return ResourceType.awsApiGatewayRestApi;
      case 'AWS::ApiGatewayV2::Stage':
        return ResourceType.awsApiGatewayV2Stage;
      case 'AWS::ApiGatewayV2::Api':
        return ResourceType.awsApiGatewayV2Api;
      case 'AWS::CodePipeline::Pipeline':
        return ResourceType.awsCodePipelinePipeline;
      case 'AWS::ServiceCatalog::CloudFormationProvisionedProduct':
        return ResourceType.awsServiceCatalogCloudFormationProvisionedProduct;
      case 'AWS::ServiceCatalog::CloudFormationProduct':
        return ResourceType.awsServiceCatalogCloudFormationProduct;
      case 'AWS::ServiceCatalog::Portfolio':
        return ResourceType.awsServiceCatalogPortfolio;
      case 'AWS::SQS::Queue':
        return ResourceType.awsSqsQueue;
      case 'AWS::KMS::Key':
        return ResourceType.awsKmsKey;
      case 'AWS::QLDB::Ledger':
        return ResourceType.awsQldbLedger;
      case 'AWS::SecretsManager::Secret':
        return ResourceType.awsSecretsManagerSecret;
      case 'AWS::SNS::Topic':
        return ResourceType.awsSnsTopic;
      case 'AWS::SSM::FileData':
        return ResourceType.awsSsmFileData;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
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
      value: (json['Value'] as String).toResourceValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'Value': value.toValue(),
    };
  }
}

enum ResourceValueType {
  resourceId,
}

extension on ResourceValueType {
  String toValue() {
    switch (this) {
      case ResourceValueType.resourceId:
        return 'RESOURCE_ID';
    }
  }
}

extension on String {
  ResourceValueType toResourceValueType() {
    switch (this) {
      case 'RESOURCE_ID':
        return ResourceValueType.resourceId;
    }
    throw Exception('$this is not known in enum ResourceValueType');
  }
}

/// An object with the name of the retention configuration and the retention
/// period in days. The object stores the configuration for data retention in
/// AWS Config.
class RetentionConfiguration {
  /// The name of the retention configuration object.
  final String name;

  /// Number of days AWS Config stores your historical information.
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final retentionPeriodInDays = this.retentionPeriodInDays;
    return {
      'Name': name,
      'RetentionPeriodInDays': retentionPeriodInDays,
    };
  }
}

/// Defines which resources trigger an evaluation for an AWS Config rule. The
/// scope can include one or more resource types, a combination of a tag key and
/// value, or a combination of one resource type and one resource ID. Specify a
/// scope to constrain which resources trigger an evaluation for a rule.
/// Otherwise, evaluations for the rule are triggered when any resource in your
/// recording group changes in configuration.
class Scope {
  /// The ID of the only AWS resource that you want to trigger an evaluation for
  /// the rule. If you specify a resource ID, you must specify one resource type
  /// for <code>ComplianceResourceTypes</code>.
  final String? complianceResourceId;

  /// The resource types of only those AWS resources that you want to trigger an
  /// evaluation for the rule. You can only specify one type if you also specify a
  /// resource ID for <code>ComplianceResourceId</code>.
  final List<String>? complianceResourceTypes;

  /// The tag key that is applied to only those AWS resources that you want to
  /// trigger an evaluation for the rule.
  final String? tagKey;

  /// The tag value applied to only those AWS resources that you want to trigger
  /// an evaluation for the rule. If you specify a value for
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
          ?.whereNotNull()
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
      results: (json['Results'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryInfo = this.queryInfo;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queryInfo != null) 'QueryInfo': queryInfo,
      if (results != null) 'Results': results,
    };
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
      results: (json['Results'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryInfo = this.queryInfo;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queryInfo != null) 'QueryInfo': queryInfo,
      if (results != null) 'Results': results,
    };
  }
}

/// Provides the AWS Config rule owner (AWS or customer), the rule identifier,
/// and the events that trigger the evaluation of your AWS resources.
class Source {
  /// Indicates whether AWS or the customer owns and manages the AWS Config rule.
  final Owner owner;

  /// For AWS Config managed rules, a predefined identifier from a list. For
  /// example, <code>IAM_PASSWORD_POLICY</code> is a managed rule. To reference a
  /// managed rule, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">Using
  /// AWS Managed Config Rules</a>.
  ///
  /// For custom rules, the identifier is the Amazon Resource Name (ARN) of the
  /// rule's AWS Lambda function, such as
  /// <code>arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name</code>.
  final String sourceIdentifier;

  /// Provides the source and type of the event that causes AWS Config to evaluate
  /// your AWS resources.
  final List<SourceDetail>? sourceDetails;

  Source({
    required this.owner,
    required this.sourceIdentifier,
    this.sourceDetails,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      owner: (json['Owner'] as String).toOwner(),
      sourceIdentifier: json['SourceIdentifier'] as String,
      sourceDetails: (json['SourceDetails'] as List?)
          ?.whereNotNull()
          .map((e) => SourceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceDetails = this.sourceDetails;
    return {
      'Owner': owner.toValue(),
      'SourceIdentifier': sourceIdentifier,
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
    };
  }
}

/// Provides the source and the message types that trigger AWS Config to
/// evaluate your AWS resources against a rule. It also provides the frequency
/// with which you want AWS Config to run evaluations for the rule if the
/// trigger type is periodic. You can specify the parameter values for
/// <code>SourceDetail</code> only for custom rules.
class SourceDetail {
  /// The source of the event, such as an AWS service, that triggers AWS Config to
  /// evaluate your AWS resources.
  final EventSource? eventSource;

  /// The frequency at which you want AWS Config to run evaluations for a custom
  /// rule with a periodic trigger. If you specify a value for
  /// <code>MaximumExecutionFrequency</code>, then <code>MessageType</code> must
  /// use the <code>ScheduledNotification</code> value.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  ///
  /// Based on the valid value you choose, AWS Config runs evaluations once for
  /// each valid value. For example, if you choose <code>Three_Hours</code>, AWS
  /// Config runs evaluations once every three hours. In this case,
  /// <code>Three_Hours</code> is the frequency of this rule.
  /// </note>
  final MaximumExecutionFrequency? maximumExecutionFrequency;

  /// The type of notification that triggers AWS Config to run an evaluation for a
  /// rule. You can specify the following notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfigurationItemChangeNotification</code> - Triggers an evaluation
  /// when AWS Config delivers a configuration item as a result of a resource
  /// change.
  /// </li>
  /// <li>
  /// <code>OversizedConfigurationItemChangeNotification</code> - Triggers an
  /// evaluation when AWS Config delivers an oversized configuration item. AWS
  /// Config may generate this notification type when a resource changes and the
  /// notification exceeds the maximum size allowed by Amazon SNS.
  /// </li>
  /// <li>
  /// <code>ScheduledNotification</code> - Triggers a periodic evaluation at the
  /// frequency specified for <code>MaximumExecutionFrequency</code>.
  /// </li>
  /// <li>
  /// <code>ConfigurationSnapshotDeliveryCompleted</code> - Triggers a periodic
  /// evaluation when AWS Config delivers a configuration snapshot.
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
      eventSource: (json['EventSource'] as String?)?.toEventSource(),
      maximumExecutionFrequency: (json['MaximumExecutionFrequency'] as String?)
          ?.toMaximumExecutionFrequency(),
      messageType: (json['MessageType'] as String?)?.toMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSource = this.eventSource;
    final maximumExecutionFrequency = this.maximumExecutionFrequency;
    final messageType = this.messageType;
    return {
      if (eventSource != null) 'EventSource': eventSource.toValue(),
      if (maximumExecutionFrequency != null)
        'MaximumExecutionFrequency': maximumExecutionFrequency.toValue(),
      if (messageType != null) 'MessageType': messageType.toValue(),
    };
  }
}

/// AWS Systems Manager (SSM) specific remediation controls.
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

/// The output when you start the evaluation for the specified AWS Config rule.
class StartConfigRulesEvaluationResponse {
  StartConfigRulesEvaluationResponse();

  factory StartConfigRulesEvaluationResponse.fromJson(Map<String, dynamic> _) {
    return StartConfigRulesEvaluationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.whereNotNull()
          .map((e) => ResourceKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final failureMessage = this.failureMessage;
    return {
      if (failedItems != null) 'FailedItems': failedItems,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
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
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
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
/// or status type for an organization config rule.
class StatusDetailFilters {
  /// The 12-digit account ID of the member account within an organization.
  final String? accountId;

  /// Indicates deployment status for config rule in the member account. When
  /// master account calls <code>PutOrganizationConfigRule</code> action for the
  /// first time, config rule status is created in the member account. When master
  /// account calls <code>PutOrganizationConfigRule</code> action for the second
  /// time, config rule status is updated in the member account. Config rule
  /// status is deleted when the master account deletes
  /// <code>OrganizationConfigRule</code> and disables service access for
  /// <code>config-multiaccountsetup.amazonaws.com</code>.
  ///
  /// AWS Config sets the state of the rule to:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_SUCCESSFUL</code> when config rule has been created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> when config rule is being created in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> when config rule creation has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> when config rule deletion has failed in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_IN_PROGRESS</code> when config rule is being deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>DELETE_SUCCESSFUL</code> when config rule has been deleted in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_SUCCESSFUL</code> when config rule has been updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_IN_PROGRESS</code> when config rule is being updated in the
  /// member account.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> when config rule deletion has failed in the
  /// member account.
  /// </li>
  /// </ul>
  final MemberAccountRuleStatus? memberAccountRuleStatus;

  StatusDetailFilters({
    this.accountId,
    this.memberAccountRuleStatus,
  });

  factory StatusDetailFilters.fromJson(Map<String, dynamic> json) {
    return StatusDetailFilters(
      accountId: json['AccountId'] as String?,
      memberAccountRuleStatus: (json['MemberAccountRuleStatus'] as String?)
          ?.toMemberAccountRuleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final memberAccountRuleStatus = this.memberAccountRuleStatus;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (memberAccountRuleStatus != null)
        'MemberAccountRuleStatus': memberAccountRuleStatus.toValue(),
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

  Map<String, dynamic> toJson() {
    final queryArn = this.queryArn;
    final queryId = this.queryId;
    final queryName = this.queryName;
    final description = this.description;
    return {
      'QueryArn': queryArn,
      'QueryId': queryId,
      'QueryName': queryName,
      if (description != null) 'Description': description,
    };
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

class ConformancePackTemplateValidationException
    extends _s.GenericAwsException {
  ConformancePackTemplateValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConformancePackTemplateValidationException',
            message: message);
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
