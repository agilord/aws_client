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

part '2014-11-12.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String configurationAggregatorName,
    @_s.required List<AggregateResourceIdentifier> resourceIdentifiers,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required List<ResourceKey> resourceKeys,
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
    @_s.required String authorizedAccountId,
    @_s.required String authorizedAwsRegion,
  }) async {
    ArgumentError.checkNotNull(authorizedAccountId, 'authorizedAccountId');
    _s.validateStringPattern(
      'authorizedAccountId',
      authorizedAccountId,
      r'''\d{12}''',
      isRequired: true,
    );
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String configRuleName,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConfigRule'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String configurationAggregatorName,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConfigurationAggregator'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String configurationRecorderName,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String conformancePackName,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'conformancePackName',
      conformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteConformancePack'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String deliveryChannelName,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String configRuleName,
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigRuleName': configRuleName,
      },
    );

    return DeleteEvaluationResultsResponse.fromJson(jsonResponse.body);
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
    @_s.required String organizationConfigRuleName,
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
    _s.validateStringPattern(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteOrganizationConfigRule'
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
    @_s.required String organizationConformancePackName,
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
    _s.validateStringPattern(
      'organizationConformancePackName',
      organizationConformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteOrganizationConformancePack'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String requesterAccountId,
    @_s.required String requesterAwsRegion,
  }) async {
    ArgumentError.checkNotNull(requesterAccountId, 'requesterAccountId');
    _s.validateStringPattern(
      'requesterAccountId',
      requesterAccountId,
      r'''\d{12}''',
      isRequired: true,
    );
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
    final jsonResponse = await _protocol.send(
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
  ///
  /// Parameter [configRuleName] :
  /// The name of the AWS Config rule for which you want to delete remediation
  /// configuration.
  ///
  /// Parameter [resourceType] :
  /// The type of a resource.
  Future<void> deleteRemediationConfiguration({
    @_s.required String configRuleName,
    String resourceType,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteRemediationConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteRemediationConfigurationResponse.fromJson(jsonResponse.body);
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
    @_s.required String configRuleName,
    @_s.required List<RemediationExceptionResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    @_s.required String resourceId,
    @_s.required String resourceType,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String retentionConfigurationName,
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
    _s.validateStringPattern(
      'retentionConfigurationName',
      retentionConfigurationName,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteRetentionConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

  /// Deletes the stored query for an AWS account in an AWS Region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [queryName] :
  /// The name of the query that you want to delete.
  Future<void> deleteStoredQuery({
    @_s.required String queryName,
  }) async {
    ArgumentError.checkNotNull(queryName, 'queryName');
    _s.validateStringLength(
      'queryName',
      queryName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'queryName',
      queryName,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.DeleteStoredQuery'
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

    return DeleteStoredQueryResponse.fromJson(jsonResponse.body);
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
    @_s.required String deliveryChannelName,
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
    @_s.required String configurationAggregatorName,
    ConfigRuleComplianceFilters filters,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    int limit,
    String nextToken,
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
    List<ComplianceType> complianceTypes,
    List<String> configRuleNames,
    String nextToken,
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
          'ComplianceTypes':
              complianceTypes.map((e) => e?.toValue() ?? '').toList(),
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
    List<ComplianceType> complianceTypes,
    int limit,
    String nextToken,
    String resourceId,
    String resourceType,
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
          'ComplianceTypes':
              complianceTypes.map((e) => e?.toValue() ?? '').toList(),
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
    List<String> configRuleNames,
    int limit,
    String nextToken,
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
    List<String> configRuleNames,
    String nextToken,
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
    @_s.required String configurationAggregatorName,
    int limit,
    String nextToken,
    List<AggregatedSourceStatusType> updateStatus,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
          'UpdateStatus': updateStatus.map((e) => e?.toValue() ?? '').toList(),
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
    List<String> configurationAggregatorNames,
    int limit,
    String nextToken,
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
    List<String> configurationRecorderNames,
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
    List<String> configurationRecorderNames,
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
    @_s.required String conformancePackName,
    ConformancePackComplianceFilters filters,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'conformancePackName',
      conformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
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
    List<String> conformancePackNames,
    int limit,
    String nextToken,
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
    List<String> conformancePackNames,
    int limit,
    String nextToken,
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
    List<String> deliveryChannelNames,
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
    List<String> deliveryChannelNames,
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
    int limit,
    String nextToken,
    List<String> organizationConfigRuleNames,
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
    int limit,
    String nextToken,
    List<String> organizationConfigRuleNames,
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
    int limit,
    String nextToken,
    List<String> organizationConformancePackNames,
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
    int limit,
    String nextToken,
    List<String> organizationConformancePackNames,
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
    int limit,
    String nextToken,
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
    @_s.required List<String> configRuleNames,
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
    @_s.required String configRuleName,
    int limit,
    String nextToken,
    List<RemediationExceptionResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    @_s.required String configRuleName,
    int limit,
    String nextToken,
    List<ResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    String nextToken,
    List<String> retentionConfigurationNames,
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
    @_s.required String accountId,
    @_s.required String awsRegion,
    @_s.required String configRuleName,
    @_s.required String configurationAggregatorName,
    ComplianceType complianceType,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
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
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required String configurationAggregatorName,
    ConfigRuleComplianceSummaryFilters filters,
    ConfigRuleComplianceSummaryGroupKey groupByKey,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required String configurationAggregatorName,
    ResourceCountFilters filters,
    ResourceCountGroupKey groupByKey,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required String configurationAggregatorName,
    @_s.required AggregateResourceIdentifier resourceIdentifier,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required String configRuleName,
    List<ComplianceType> complianceTypes,
    int limit,
    String nextToken,
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
          'ComplianceTypes':
              complianceTypes.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String resourceId,
    @_s.required String resourceType,
    List<ComplianceType> complianceTypes,
    String nextToken,
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
          'ComplianceTypes':
              complianceTypes.map((e) => e?.toValue() ?? '').toList(),
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
    List<String> resourceTypes,
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
    @_s.required String conformancePackName,
    ConformancePackEvaluationFilters filters,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'conformancePackName',
      conformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
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
    @_s.required List<String> conformancePackNames,
    int limit,
    String nextToken,
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
    int limit,
    String nextToken,
    List<String> resourceTypes,
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
    @_s.required String organizationConfigRuleName,
    StatusDetailFilters filters,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      r'''.*\S.*''',
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
    @_s.required String organizationConformancePackName,
    OrganizationResourceDetailedStatusFilters filters,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'organizationConformancePackName',
      organizationConformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
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
    @_s.required String resourceId,
    @_s.required ResourceType resourceType,
    ChronologicalOrder chronologicalOrder,
    DateTime earlierTime,
    DateTime laterTime,
    int limit,
    String nextToken,
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
        'resourceType': resourceType?.toValue() ?? '',
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
    @_s.required String queryName,
  }) async {
    ArgumentError.checkNotNull(queryName, 'queryName');
    _s.validateStringLength(
      'queryName',
      queryName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'queryName',
      queryName,
      r'''^[a-zA-Z0-9-_]+$''',
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
  /// The maximum number of resource identifiers returned on each page. The
  /// default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  Future<ListAggregateDiscoveredResourcesResponse>
      listAggregateDiscoveredResources({
    @_s.required String configurationAggregatorName,
    @_s.required ResourceType resourceType,
    ResourceFilters filters,
    int limit,
    String nextToken,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
        'ResourceType': resourceType?.toValue() ?? '',
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
    @_s.required ResourceType resourceType,
    bool includeDeletedResources,
    int limit,
    String nextToken,
    List<String> resourceIds,
    String resourceName,
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
        'resourceType': resourceType?.toValue() ?? '',
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

  /// List the stored queries for an AWS account in an AWS Region. The default
  /// is 100.
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
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
    int limit,
    String nextToken,
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
    @_s.required String authorizedAccountId,
    @_s.required String authorizedAwsRegion,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(authorizedAccountId, 'authorizedAccountId');
    _s.validateStringPattern(
      'authorizedAccountId',
      authorizedAccountId,
      r'''\d{12}''',
      isRequired: true,
    );
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
    @_s.required ConfigRule configRule,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(configRule, 'configRule');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConfigRule'
    };
    final jsonResponse = await _protocol.send(
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
  /// <note>
  /// AWS Config should be enabled in source accounts and regions you want to
  /// aggregate.
  ///
  /// If your source type is an organization, you must be signed in to the
  /// master account and all features must be enabled in your organization. AWS
  /// Config calls <code>EnableAwsServiceAccess</code> API to enable integration
  /// between AWS Config and AWS Organizations.
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
    @_s.required String configurationAggregatorName,
    List<AccountAggregationSource> accountAggregationSources,
    OrganizationAggregationSource organizationAggregationSource,
    List<Tag> tags,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required ConfigurationRecorder configurationRecorder,
  }) async {
    ArgumentError.checkNotNull(configurationRecorder, 'configurationRecorder');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutConfigurationRecorder'
    };
    final jsonResponse = await _protocol.send(
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
  /// AWS Config stores intermediate files while processing conformance pack
  /// template.
  ///
  /// Parameter [deliveryS3KeyPrefix] :
  /// The prefix for the Amazon S3 bucket.
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
    @_s.required String conformancePackName,
    List<ConformancePackInputParameter> conformancePackInputParameters,
    String deliveryS3Bucket,
    String deliveryS3KeyPrefix,
    String templateBody,
    String templateS3Uri,
  }) async {
    ArgumentError.checkNotNull(conformancePackName, 'conformancePackName');
    _s.validateStringLength(
      'conformancePackName',
      conformancePackName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'conformancePackName',
      conformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
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
    _s.validateStringPattern(
      'templateS3Uri',
      templateS3Uri,
      r'''s3://.*''',
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
  /// May throw [InvalidSNSTopicARNException].
  /// May throw [InsufficientDeliveryPolicyException].
  ///
  /// Parameter [deliveryChannel] :
  /// The configuration delivery channel object that delivers the configuration
  /// information to an Amazon S3 bucket and to an Amazon SNS topic.
  Future<void> putDeliveryChannel({
    @_s.required DeliveryChannel deliveryChannel,
  }) async {
    ArgumentError.checkNotNull(deliveryChannel, 'deliveryChannel');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutDeliveryChannel'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String resultToken,
    List<Evaluation> evaluations,
    bool testMode,
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

  ///
  /// May throw [NoSuchConfigRuleException].
  /// May throw [InvalidParameterValueException].
  Future<void> putExternalEvaluation({
    @_s.required String configRuleName,
    @_s.required ExternalEvaluation externalEvaluation,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(externalEvaluation, 'externalEvaluation');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutExternalEvaluation'
    };
    final jsonResponse = await _protocol.send(
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

    return PutExternalEvaluationResponse.fromJson(jsonResponse.body);
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
    @_s.required String organizationConfigRuleName,
    List<String> excludedAccounts,
    OrganizationCustomRuleMetadata organizationCustomRuleMetadata,
    OrganizationManagedRuleMetadata organizationManagedRuleMetadata,
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
    _s.validateStringPattern(
      'organizationConfigRuleName',
      organizationConfigRuleName,
      r'''.*\S.*''',
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
  /// You can create 6 conformance packs with 25 AWS Config rules in each pack
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
  /// Location of an Amazon S3 bucket where AWS Config can deliver evaluation
  /// results. AWS Config stores intermediate files while processing conformance
  /// pack template.
  ///
  /// The delivery bucket name should start with awsconfigconforms. For example:
  /// "Resource": "arn:aws:s3:::your_bucket_name/*". For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/conformance-pack-organization-apis.html">Permissions
  /// for cross account bucket access</a>.
  ///
  /// Parameter [deliveryS3KeyPrefix] :
  /// The prefix for the Amazon S3 bucket.
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
    @_s.required String organizationConformancePackName,
    List<ConformancePackInputParameter> conformancePackInputParameters,
    String deliveryS3Bucket,
    String deliveryS3KeyPrefix,
    List<String> excludedAccounts,
    String templateBody,
    String templateS3Uri,
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
    _s.validateStringPattern(
      'organizationConformancePackName',
      organizationConformancePackName,
      r'''[a-zA-Z][-a-zA-Z0-9]*''',
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
    _s.validateStringPattern(
      'templateS3Uri',
      templateS3Uri,
      r'''s3://.*''',
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
    @_s.required List<RemediationConfiguration> remediationConfigurations,
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
  /// an exisiting exception for a specific resource with a specific AWS Config
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
    @_s.required String configRuleName,
    @_s.required List<RemediationExceptionResourceKey> resourceKeys,
    DateTime expirationTime,
    String message,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    @_s.required String configuration,
    @_s.required String resourceId,
    @_s.required String resourceType,
    @_s.required String schemaVersionId,
    String resourceName,
    Map<String, String> tags,
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
    _s.validateStringPattern(
      'schemaVersionId',
      schemaVersionId,
      r'''[A-Za-z0-9-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.PutResourceConfig'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required int retentionPeriodInDays,
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
  /// <code>QueryName</code> must be unique for an AWS account in an AWS Region.
  /// You can create upto 300 queries in an AWS account in an AWS Region.
  ///
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceConcurrentModificationException].
  ///
  /// Parameter [storedQuery] :
  /// A list of <code>StoredQuery</code> objects. The mandatory fields are
  /// <code>QueryName</code> and <code>Expression</code>.
  ///
  /// Parameter [tags] :
  /// A list of <code>Tags</code> object.
  Future<PutStoredQueryResponse> putStoredQuery({
    @_s.required StoredQuery storedQuery,
    List<Tag> tags,
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
    @_s.required String configurationAggregatorName,
    @_s.required String expression,
    int limit,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'configurationAggregatorName',
      configurationAggregatorName,
      r'''[\w\-]+''',
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
    @_s.required String expression,
    int limit,
    String nextToken,
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
    List<String> configRuleNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'StarlingDoveService.StartConfigRulesEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      },
    );

    return StartConfigRulesEvaluationResponse.fromJson(jsonResponse.body);
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
    @_s.required String configurationRecorderName,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String configRuleName,
    @_s.required List<ResourceKey> resourceKeys,
  }) async {
    ArgumentError.checkNotNull(configRuleName, 'configRuleName');
    _s.validateStringLength(
      'configRuleName',
      configRuleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configRuleName',
      configRuleName,
      r'''.*\S.*''',
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
    @_s.required String configurationRecorderName,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
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
    final jsonResponse = await _protocol.send(
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountAggregationSource {
  /// The 12-digit account ID of the account being aggregated.
  @_s.JsonKey(name: 'AccountIds')
  final List<String> accountIds;

  /// If true, aggregate existing AWS Config regions and future regions.
  @_s.JsonKey(name: 'AllAwsRegions')
  final bool allAwsRegions;

  /// The source regions being aggregated.
  @_s.JsonKey(name: 'AwsRegions')
  final List<String> awsRegions;

  AccountAggregationSource({
    @_s.required this.accountIds,
    this.allAwsRegions,
    this.awsRegions,
  });
  factory AccountAggregationSource.fromJson(Map<String, dynamic> json) =>
      _$AccountAggregationSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAggregationSourceToJson(this);
}

/// Indicates whether an AWS Config rule is compliant based on account ID,
/// region, compliance, and rule name.
///
/// A rule is compliant if all of the resources that the rule evaluated comply
/// with it. It is noncompliant if any of these resources do not comply.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregateComplianceByConfigRule {
  /// The 12-digit account ID of the source account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The source region from where the data is aggregated.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// Indicates whether an AWS resource or AWS Config rule is compliant and
  /// provides the number of contributors that affect the compliance.
  @_s.JsonKey(name: 'Compliance')
  final Compliance compliance;

  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  AggregateComplianceByConfigRule({
    this.accountId,
    this.awsRegion,
    this.compliance,
    this.configRuleName,
  });
  factory AggregateComplianceByConfigRule.fromJson(Map<String, dynamic> json) =>
      _$AggregateComplianceByConfigRuleFromJson(json);
}

/// Returns the number of compliant and noncompliant rules for one or more
/// accounts and regions in an aggregator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregateComplianceCount {
  /// The number of compliant and noncompliant AWS Config rules.
  @_s.JsonKey(name: 'ComplianceSummary')
  final ComplianceSummary complianceSummary;

  /// The 12-digit account ID or region based on the GroupByKey value.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  AggregateComplianceCount({
    this.complianceSummary,
    this.groupName,
  });
  factory AggregateComplianceCount.fromJson(Map<String, dynamic> json) =>
      _$AggregateComplianceCountFromJson(json);
}

/// The details of an AWS Config evaluation for an account ID and region in an
/// aggregator. Provides the AWS resource that was evaluated, the compliance of
/// the resource, related time stamps, and supplementary information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregateEvaluationResult {
  /// The 12-digit account ID of the source account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// Supplementary information about how the agrregate evaluation determined the
  /// compliance.
  @_s.JsonKey(name: 'Annotation')
  final String annotation;

  /// The source region from where the data is aggregated.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// The resource compliance status.
  ///
  /// For the <code>AggregationEvaluationResult</code> data type, AWS Config
  /// supports only the <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. AWS
  /// Config does not support the <code>NOT_APPLICABLE</code> and
  /// <code>INSUFFICIENT_DATA</code> value.
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;

  /// The time when the AWS Config rule evaluated the AWS resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ConfigRuleInvokedTime')
  final DateTime configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  @_s.JsonKey(name: 'EvaluationResultIdentifier')
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The time when AWS Config recorded the aggregate evaluation result.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ResultRecordedTime')
  final DateTime resultRecordedTime;

  AggregateEvaluationResult({
    this.accountId,
    this.annotation,
    this.awsRegion,
    this.complianceType,
    this.configRuleInvokedTime,
    this.evaluationResultIdentifier,
    this.resultRecordedTime,
  });
  factory AggregateEvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$AggregateEvaluationResultFromJson(json);
}

/// The details that identify a resource that is collected by AWS Config
/// aggregator, including the resource type, ID, (if available) the custom
/// resource name, the source account, and source region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AggregateResourceIdentifier {
  /// The ID of the AWS resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of the AWS resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  /// The 12-digit account ID of the source account.
  @_s.JsonKey(name: 'SourceAccountId')
  final String sourceAccountId;

  /// The source region where data is aggregated.
  @_s.JsonKey(name: 'SourceRegion')
  final String sourceRegion;

  /// The name of the AWS resource.
  @_s.JsonKey(name: 'ResourceName')
  final String resourceName;

  AggregateResourceIdentifier({
    @_s.required this.resourceId,
    @_s.required this.resourceType,
    @_s.required this.sourceAccountId,
    @_s.required this.sourceRegion,
    this.resourceName,
  });
  factory AggregateResourceIdentifier.fromJson(Map<String, dynamic> json) =>
      _$AggregateResourceIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateResourceIdentifierToJson(this);
}

/// The current sync status between the source and the aggregator account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregatedSourceStatus {
  /// The region authorized to collect aggregated data.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// The error code that AWS Config returned when the source account aggregation
  /// last failed.
  @_s.JsonKey(name: 'LastErrorCode')
  final String lastErrorCode;

  /// The message indicating that the source account aggregation failed due to an
  /// error.
  @_s.JsonKey(name: 'LastErrorMessage')
  final String lastErrorMessage;

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
  @_s.JsonKey(name: 'LastUpdateStatus')
  final AggregatedSourceStatusType lastUpdateStatus;

  /// The time of the last update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// The source account ID or an organization.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The source account or an organization.
  @_s.JsonKey(name: 'SourceType')
  final AggregatedSourceType sourceType;

  AggregatedSourceStatus({
    this.awsRegion,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastUpdateStatus,
    this.lastUpdateTime,
    this.sourceId,
    this.sourceType,
  });
  factory AggregatedSourceStatus.fromJson(Map<String, dynamic> json) =>
      _$AggregatedSourceStatusFromJson(json);
}

enum AggregatedSourceStatusType {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('OUTDATED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum AggregatedSourceType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATION')
  organization,
}

/// An object that represents the authorizations granted to aggregator accounts
/// and regions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregationAuthorization {
  /// The Amazon Resource Name (ARN) of the aggregation object.
  @_s.JsonKey(name: 'AggregationAuthorizationArn')
  final String aggregationAuthorizationArn;

  /// The 12-digit account ID of the account authorized to aggregate data.
  @_s.JsonKey(name: 'AuthorizedAccountId')
  final String authorizedAccountId;

  /// The region authorized to collect aggregated data.
  @_s.JsonKey(name: 'AuthorizedAwsRegion')
  final String authorizedAwsRegion;

  /// The time stamp when the aggregation authorization was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  AggregationAuthorization({
    this.aggregationAuthorizationArn,
    this.authorizedAccountId,
    this.authorizedAwsRegion,
    this.creationTime,
  });
  factory AggregationAuthorization.fromJson(Map<String, dynamic> json) =>
      _$AggregationAuthorizationFromJson(json);
}

/// The detailed configuration of a specified resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BaseConfigurationItem {
  /// The 12-digit AWS account ID associated with the resource.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Availability Zone associated with the resource.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The region where the resource resides.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The description of the resource configuration.
  @_s.JsonKey(name: 'configuration')
  final String configuration;

  /// The time when the configuration recording was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'configurationItemCaptureTime')
  final DateTime configurationItemCaptureTime;

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
  @_s.JsonKey(name: 'configurationItemStatus')
  final ConfigurationItemStatus configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  @_s.JsonKey(name: 'configurationStateId')
  final String configurationStateId;

  /// The time stamp when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'resourceCreationTime')
  final DateTime resourceCreationTime;

  /// The ID of the resource (for example., sg-xxxxxx).
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The custom name of the resource, if available.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The type of AWS resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// Configuration attributes that AWS Config returns for certain resource types
  /// to supplement the information returned for the configuration parameter.
  @_s.JsonKey(name: 'supplementaryConfiguration')
  final Map<String, String> supplementaryConfiguration;

  /// The version number of the resource configuration.
  @_s.JsonKey(name: 'version')
  final String version;

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
  factory BaseConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$BaseConfigurationItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetAggregateResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  @_s.JsonKey(name: 'BaseConfigurationItems')
  final List<BaseConfigurationItem> baseConfigurationItems;

  /// A list of resource identifiers that were not processed with current scope.
  /// The list is empty if all the resources are processed.
  @_s.JsonKey(name: 'UnprocessedResourceIdentifiers')
  final List<AggregateResourceIdentifier> unprocessedResourceIdentifiers;

  BatchGetAggregateResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceIdentifiers,
  });
  factory BatchGetAggregateResourceConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetAggregateResourceConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  @_s.JsonKey(name: 'baseConfigurationItems')
  final List<BaseConfigurationItem> baseConfigurationItems;

  /// A list of resource keys that were not processed with the current response.
  /// The unprocessesResourceKeys value is in the same form as ResourceKeys, so
  /// the value can be directly provided to a subsequent BatchGetResourceConfig
  /// operation. If there are no unprocessed resource keys, the response contains
  /// an empty unprocessedResourceKeys list.
  @_s.JsonKey(name: 'unprocessedResourceKeys')
  final List<ResourceKey> unprocessedResourceKeys;

  BatchGetResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceKeys,
  });
  factory BatchGetResourceConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetResourceConfigResponseFromJson(json);
}

enum ChronologicalOrder {
  @_s.JsonValue('Reverse')
  reverse,
  @_s.JsonValue('Forward')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Indicates whether an AWS resource or AWS Config rule is compliant and
/// provides the number of contributors that affect the compliance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Compliance {
  /// The number of AWS resources or AWS Config rules that cause a result of
  /// <code>NON_COMPLIANT</code>, up to a maximum number.
  @_s.JsonKey(name: 'ComplianceContributorCount')
  final ComplianceContributorCount complianceContributorCount;

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
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;

  Compliance({
    this.complianceContributorCount,
    this.complianceType,
  });
  factory Compliance.fromJson(Map<String, dynamic> json) =>
      _$ComplianceFromJson(json);
}

/// Indicates whether an AWS Config rule is compliant. A rule is compliant if
/// all of the resources that the rule evaluated comply with it. A rule is
/// noncompliant if any of these resources do not comply.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceByConfigRule {
  /// Indicates whether the AWS Config rule is compliant.
  @_s.JsonKey(name: 'Compliance')
  final Compliance compliance;

  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  ComplianceByConfigRule({
    this.compliance,
    this.configRuleName,
  });
  factory ComplianceByConfigRule.fromJson(Map<String, dynamic> json) =>
      _$ComplianceByConfigRuleFromJson(json);
}

/// Indicates whether an AWS resource that is evaluated according to one or more
/// AWS Config rules is compliant. A resource is compliant if it complies with
/// all of the rules that evaluate it. A resource is noncompliant if it does not
/// comply with one or more of these rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceByResource {
  /// Indicates whether the AWS resource complies with all of the AWS Config rules
  /// that evaluated it.
  @_s.JsonKey(name: 'Compliance')
  final Compliance compliance;

  /// The ID of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ComplianceByResource({
    this.compliance,
    this.resourceId,
    this.resourceType,
  });
  factory ComplianceByResource.fromJson(Map<String, dynamic> json) =>
      _$ComplianceByResourceFromJson(json);
}

/// The number of AWS resources or AWS Config rules responsible for the current
/// compliance of the item, up to a maximum number.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceContributorCount {
  /// Indicates whether the maximum count is reached.
  @_s.JsonKey(name: 'CapExceeded')
  final bool capExceeded;

  /// The number of AWS resources or AWS Config rules responsible for the current
  /// compliance of the item.
  @_s.JsonKey(name: 'CappedCount')
  final int cappedCount;

  ComplianceContributorCount({
    this.capExceeded,
    this.cappedCount,
  });
  factory ComplianceContributorCount.fromJson(Map<String, dynamic> json) =>
      _$ComplianceContributorCountFromJson(json);
}

/// The number of AWS Config rules or AWS resources that are compliant and
/// noncompliant.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceSummary {
  /// The time that AWS Config created the compliance summary.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ComplianceSummaryTimestamp')
  final DateTime complianceSummaryTimestamp;

  /// The number of AWS Config rules or AWS resources that are compliant, up to a
  /// maximum of 25 for rules and 100 for resources.
  @_s.JsonKey(name: 'CompliantResourceCount')
  final ComplianceContributorCount compliantResourceCount;

  /// The number of AWS Config rules or AWS resources that are noncompliant, up to
  /// a maximum of 25 for rules and 100 for resources.
  @_s.JsonKey(name: 'NonCompliantResourceCount')
  final ComplianceContributorCount nonCompliantResourceCount;

  ComplianceSummary({
    this.complianceSummaryTimestamp,
    this.compliantResourceCount,
    this.nonCompliantResourceCount,
  });
  factory ComplianceSummary.fromJson(Map<String, dynamic> json) =>
      _$ComplianceSummaryFromJson(json);
}

/// The number of AWS resources of a specific type that are compliant or
/// noncompliant, up to a maximum of 100 for each.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceSummaryByResourceType {
  /// The number of AWS resources that are compliant or noncompliant, up to a
  /// maximum of 100 for each.
  @_s.JsonKey(name: 'ComplianceSummary')
  final ComplianceSummary complianceSummary;

  /// The type of AWS resource.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ComplianceSummaryByResourceType({
    this.complianceSummary,
    this.resourceType,
  });
  factory ComplianceSummaryByResourceType.fromJson(Map<String, dynamic> json) =>
      _$ComplianceSummaryByResourceTypeFromJson(json);
}

enum ComplianceType {
  @_s.JsonValue('COMPLIANT')
  compliant,
  @_s.JsonValue('NON_COMPLIANT')
  nonCompliant,
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
  @_s.JsonValue('INSUFFICIENT_DATA')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides status of the delivery of the snapshot or the configuration history
/// to the specified Amazon S3 bucket. Also provides the status of notifications
/// about the Amazon S3 delivery to the specified Amazon SNS topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigExportDeliveryInfo {
  /// The time of the last attempted delivery.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastAttemptTime')
  final DateTime lastAttemptTime;

  /// The error code from the last attempted delivery.
  @_s.JsonKey(name: 'lastErrorCode')
  final String lastErrorCode;

  /// The error message from the last attempted delivery.
  @_s.JsonKey(name: 'lastErrorMessage')
  final String lastErrorMessage;

  /// Status of the last attempted delivery.
  @_s.JsonKey(name: 'lastStatus')
  final DeliveryStatus lastStatus;

  /// The time of the last successful delivery.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastSuccessfulTime')
  final DateTime lastSuccessfulTime;

  /// The time that the next delivery occurs.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'nextDeliveryTime')
  final DateTime nextDeliveryTime;

  ConfigExportDeliveryInfo({
    this.lastAttemptTime,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatus,
    this.lastSuccessfulTime,
    this.nextDeliveryTime,
  });
  factory ConfigExportDeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$ConfigExportDeliveryInfoFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigRule {
  /// Provides the rule owner (AWS or customer), the rule identifier, and the
  /// notifications that cause the function to evaluate your AWS resources.
  @_s.JsonKey(name: 'Source')
  final Source source;

  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleArn')
  final String configRuleArn;

  /// The ID of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleId')
  final String configRuleId;

  /// The name that you assign to the AWS Config rule. The name is required if you
  /// are adding a new rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

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
  @_s.JsonKey(name: 'ConfigRuleState')
  final ConfigRuleState configRuleState;

  /// Service principal name of the service that created the rule.
  /// <note>
  /// The field is populated only if the service linked rule is created by a
  /// service. The field is empty if you create your own rule.
  /// </note>
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The description that you provide for the AWS Config rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A string, in JSON format, that is passed to the AWS Config rule Lambda
  /// function.
  @_s.JsonKey(name: 'InputParameters')
  final String inputParameters;

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
  @_s.JsonKey(name: 'MaximumExecutionFrequency')
  final MaximumExecutionFrequency maximumExecutionFrequency;

  /// Defines which resources can trigger an evaluation for the rule. The scope
  /// can include one or more resource types, a combination of one resource type
  /// and one resource ID, or a combination of a tag key and value. Specify a
  /// scope to constrain the resources that can trigger an evaluation for the
  /// rule. If you do not specify a scope, evaluations are triggered when any
  /// resource in the recording group changes.
  /// <note>
  /// The scope can be empty.
  /// </note>
  @_s.JsonKey(name: 'Scope')
  final Scope scope;

  ConfigRule({
    @_s.required this.source,
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
  factory ConfigRule.fromJson(Map<String, dynamic> json) =>
      _$ConfigRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigRuleToJson(this);
}

/// Filters the compliance results based on account ID, region, compliance type,
/// and rule name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConfigRuleComplianceFilters {
  /// The 12-digit account ID of the source account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The source region where the data is aggregated.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// The rule compliance status.
  ///
  /// For the <code>ConfigRuleComplianceFilters</code> data type, AWS Config
  /// supports only <code>COMPLIANT</code> and <code>NON_COMPLIANT</code>. AWS
  /// Config does not support the <code>NOT_APPLICABLE</code> and the
  /// <code>INSUFFICIENT_DATA</code> values.
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;

  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  ConfigRuleComplianceFilters({
    this.accountId,
    this.awsRegion,
    this.complianceType,
    this.configRuleName,
  });
  Map<String, dynamic> toJson() => _$ConfigRuleComplianceFiltersToJson(this);
}

/// Filters the results based on the account IDs and regions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConfigRuleComplianceSummaryFilters {
  /// The 12-digit account ID of the source account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The source region where the data is aggregated.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  ConfigRuleComplianceSummaryFilters({
    this.accountId,
    this.awsRegion,
  });
  Map<String, dynamic> toJson() =>
      _$ConfigRuleComplianceSummaryFiltersToJson(this);
}

enum ConfigRuleComplianceSummaryGroupKey {
  @_s.JsonValue('ACCOUNT_ID')
  accountId,
  @_s.JsonValue('AWS_REGION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Status information for your AWS managed Config rules. The status includes
/// information such as the last time the rule ran, the last time it failed, and
/// the related error for the last failure.
///
/// This action does not return status information about custom AWS Config
/// rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigRuleEvaluationStatus {
  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleArn')
  final String configRuleArn;

  /// The ID of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleId')
  final String configRuleId;

  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  /// The time that you first activated the AWS Config rule.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FirstActivatedTime')
  final DateTime firstActivatedTime;

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
  @_s.JsonKey(name: 'FirstEvaluationStarted')
  final bool firstEvaluationStarted;

  /// The time that you last turned off the AWS Config rule.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastDeactivatedTime')
  final DateTime lastDeactivatedTime;

  /// The error code that AWS Config returned when the rule last failed.
  @_s.JsonKey(name: 'LastErrorCode')
  final String lastErrorCode;

  /// The error message that AWS Config returned when the rule last failed.
  @_s.JsonKey(name: 'LastErrorMessage')
  final String lastErrorMessage;

  /// The time that AWS Config last failed to evaluate your AWS resources against
  /// the rule.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastFailedEvaluationTime')
  final DateTime lastFailedEvaluationTime;

  /// The time that AWS Config last failed to invoke the AWS Config rule to
  /// evaluate your AWS resources.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastFailedInvocationTime')
  final DateTime lastFailedInvocationTime;

  /// The time that AWS Config last successfully evaluated your AWS resources
  /// against the rule.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSuccessfulEvaluationTime')
  final DateTime lastSuccessfulEvaluationTime;

  /// The time that AWS Config last successfully invoked the AWS Config rule to
  /// evaluate your AWS resources.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastSuccessfulInvocationTime')
  final DateTime lastSuccessfulInvocationTime;

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
  factory ConfigRuleEvaluationStatus.fromJson(Map<String, dynamic> json) =>
      _$ConfigRuleEvaluationStatusFromJson(json);
}

enum ConfigRuleState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETING_RESULTS')
  deletingResults,
  @_s.JsonValue('EVALUATING')
  evaluating,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigSnapshotDeliveryProperties {
  /// The frequency with which AWS Config delivers configuration snapshots.
  @_s.JsonKey(name: 'deliveryFrequency')
  final MaximumExecutionFrequency deliveryFrequency;

  ConfigSnapshotDeliveryProperties({
    this.deliveryFrequency,
  });
  factory ConfigSnapshotDeliveryProperties.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigSnapshotDeliveryPropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigSnapshotDeliveryPropertiesToJson(this);
}

/// A list that contains the status of the delivery of the configuration stream
/// notification to the Amazon SNS topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigStreamDeliveryInfo {
  /// The error code from the last attempted delivery.
  @_s.JsonKey(name: 'lastErrorCode')
  final String lastErrorCode;

  /// The error message from the last attempted delivery.
  @_s.JsonKey(name: 'lastErrorMessage')
  final String lastErrorMessage;

  /// Status of the last attempted delivery.
  ///
  /// <b>Note</b> Providing an SNS topic on a <a
  /// href="https://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html">DeliveryChannel</a>
  /// for AWS Config is optional. If the SNS delivery is turned off, the last
  /// status will be <b>Not_Applicable</b>.
  @_s.JsonKey(name: 'lastStatus')
  final DeliveryStatus lastStatus;

  /// The time from the last status change.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStatusChangeTime')
  final DateTime lastStatusChangeTime;

  ConfigStreamDeliveryInfo({
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatus,
    this.lastStatusChangeTime,
  });
  factory ConfigStreamDeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$ConfigStreamDeliveryInfoFromJson(json);
}

/// The details about the configuration aggregator, including information about
/// source accounts, regions, and metadata of the aggregator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationAggregator {
  /// Provides a list of source accounts and regions to be aggregated.
  @_s.JsonKey(name: 'AccountAggregationSources')
  final List<AccountAggregationSource> accountAggregationSources;

  /// The Amazon Resource Name (ARN) of the aggregator.
  @_s.JsonKey(name: 'ConfigurationAggregatorArn')
  final String configurationAggregatorArn;

  /// The name of the aggregator.
  @_s.JsonKey(name: 'ConfigurationAggregatorName')
  final String configurationAggregatorName;

  /// AWS service that created the configuration aggregator.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The time stamp when the configuration aggregator was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The time of the last update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// Provides an organization and list of regions to be aggregated.
  @_s.JsonKey(name: 'OrganizationAggregationSource')
  final OrganizationAggregationSource organizationAggregationSource;

  ConfigurationAggregator({
    this.accountAggregationSources,
    this.configurationAggregatorArn,
    this.configurationAggregatorName,
    this.createdBy,
    this.creationTime,
    this.lastUpdatedTime,
    this.organizationAggregationSource,
  });
  factory ConfigurationAggregator.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationAggregatorFromJson(json);
}

/// A list that contains detailed configurations of a specified resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationItem {
  /// The 12-digit AWS account ID associated with the resource.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// accoun
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Availability Zone associated with the resource.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The region where the resource resides.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The description of the resource configuration.
  @_s.JsonKey(name: 'configuration')
  final String configuration;

  /// The time when the configuration recording was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'configurationItemCaptureTime')
  final DateTime configurationItemCaptureTime;

  /// Unique MD5 hash that represents the configuration item's state.
  ///
  /// You can use MD5 hash to compare the states of two or more configuration
  /// items that are associated with the same resource.
  @_s.JsonKey(name: 'configurationItemMD5Hash')
  final String configurationItemMD5Hash;

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
  @_s.JsonKey(name: 'configurationItemStatus')
  final ConfigurationItemStatus configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  @_s.JsonKey(name: 'configurationStateId')
  final String configurationStateId;

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
  @_s.JsonKey(name: 'relatedEvents')
  final List<String> relatedEvents;

  /// A list of related AWS resources.
  @_s.JsonKey(name: 'relationships')
  final List<Relationship> relationships;

  /// The time stamp when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'resourceCreationTime')
  final DateTime resourceCreationTime;

  /// The ID of the resource (for example, <code>sg-xxxxxx</code>).
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The custom name of the resource, if available.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The type of AWS resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// Configuration attributes that AWS Config returns for certain resource types
  /// to supplement the information returned for the <code>configuration</code>
  /// parameter.
  @_s.JsonKey(name: 'supplementaryConfiguration')
  final Map<String, String> supplementaryConfiguration;

  /// A mapping of key value tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The version number of the resource configuration.
  @_s.JsonKey(name: 'version')
  final String version;

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
  factory ConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationItemFromJson(json);
}

enum ConfigurationItemStatus {
  @_s.JsonValue('OK')
  ok,
  @_s.JsonValue('ResourceDiscovered')
  resourceDiscovered,
  @_s.JsonValue('ResourceNotRecorded')
  resourceNotRecorded,
  @_s.JsonValue('ResourceDeleted')
  resourceDeleted,
  @_s.JsonValue('ResourceDeletedNotRecorded')
  resourceDeletedNotRecorded,
}

/// An object that represents the recording of configuration changes of an AWS
/// resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigurationRecorder {
  /// The name of the recorder. By default, AWS Config automatically assigns the
  /// name "default" when creating the configuration recorder. You cannot change
  /// the assigned name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies the types of AWS resources for which AWS Config records
  /// configuration changes.
  @_s.JsonKey(name: 'recordingGroup')
  final RecordingGroup recordingGroup;

  /// Amazon Resource Name (ARN) of the IAM role used to describe the AWS
  /// resources associated with the account.
  @_s.JsonKey(name: 'roleARN')
  final String roleARN;

  ConfigurationRecorder({
    this.name,
    this.recordingGroup,
    this.roleARN,
  });
  factory ConfigurationRecorder.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationRecorderFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationRecorderToJson(this);
}

/// The current status of the configuration recorder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationRecorderStatus {
  /// The error code indicating that the recording failed.
  @_s.JsonKey(name: 'lastErrorCode')
  final String lastErrorCode;

  /// The message indicating that the recording failed due to an error.
  @_s.JsonKey(name: 'lastErrorMessage')
  final String lastErrorMessage;

  /// The time the recorder was last started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStartTime')
  final DateTime lastStartTime;

  /// The last (previous) status of the recorder.
  @_s.JsonKey(name: 'lastStatus')
  final RecorderStatus lastStatus;

  /// The time when the status was last changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStatusChangeTime')
  final DateTime lastStatusChangeTime;

  /// The time the recorder was last stopped.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStopTime')
  final DateTime lastStopTime;

  /// The name of the configuration recorder.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies whether or not the recorder is currently recording.
  @_s.JsonKey(name: 'recording')
  final bool recording;

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
  factory ConfigurationRecorderStatus.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationRecorderStatusFromJson(json);
}

/// Filters the conformance pack by compliance types and AWS Config rule names.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConformancePackComplianceFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>.
  @_s.JsonKey(name: 'ComplianceType')
  final ConformancePackComplianceType complianceType;

  /// Filters the results by AWS Config rule names.
  @_s.JsonKey(name: 'ConfigRuleNames')
  final List<String> configRuleNames;

  ConformancePackComplianceFilters({
    this.complianceType,
    this.configRuleNames,
  });
  Map<String, dynamic> toJson() =>
      _$ConformancePackComplianceFiltersToJson(this);
}

/// Summary includes the name and status of the conformance pack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConformancePackComplianceSummary {
  /// The status of the conformance pack. The allowed values are COMPLIANT and
  /// NON_COMPLIANT.
  @_s.JsonKey(name: 'ConformancePackComplianceStatus')
  final ConformancePackComplianceType conformancePackComplianceStatus;

  /// The name of the conformance pack name.
  @_s.JsonKey(name: 'ConformancePackName')
  final String conformancePackName;

  ConformancePackComplianceSummary({
    @_s.required this.conformancePackComplianceStatus,
    @_s.required this.conformancePackName,
  });
  factory ConformancePackComplianceSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ConformancePackComplianceSummaryFromJson(json);
}

enum ConformancePackComplianceType {
  @_s.JsonValue('COMPLIANT')
  compliant,
  @_s.JsonValue('NON_COMPLIANT')
  nonCompliant,
}

/// Returns details of a conformance pack. A conformance pack is a collection of
/// AWS Config rules and remediation actions that can be easily deployed in an
/// account and a region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConformancePackDetail {
  /// Amazon Resource Name (ARN) of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackArn')
  final String conformancePackArn;

  /// ID of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackId')
  final String conformancePackId;

  /// Name of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackName')
  final String conformancePackName;

  /// A list of <code>ConformancePackInputParameter</code> objects.
  @_s.JsonKey(name: 'ConformancePackInputParameters')
  final List<ConformancePackInputParameter> conformancePackInputParameters;

  /// AWS service that created the conformance pack.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// Conformance pack template that is used to create a pack. The delivery bucket
  /// name should start with awsconfigconforms. For example: "Resource":
  /// "arn:aws:s3:::your_bucket_name/*".
  @_s.JsonKey(name: 'DeliveryS3Bucket')
  final String deliveryS3Bucket;

  /// The prefix for the Amazon S3 bucket.
  @_s.JsonKey(name: 'DeliveryS3KeyPrefix')
  final String deliveryS3KeyPrefix;

  /// Last time when conformation pack update was requested.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateRequestedTime')
  final DateTime lastUpdateRequestedTime;

  ConformancePackDetail({
    @_s.required this.conformancePackArn,
    @_s.required this.conformancePackId,
    @_s.required this.conformancePackName,
    this.conformancePackInputParameters,
    this.createdBy,
    this.deliveryS3Bucket,
    this.deliveryS3KeyPrefix,
    this.lastUpdateRequestedTime,
  });
  factory ConformancePackDetail.fromJson(Map<String, dynamic> json) =>
      _$ConformancePackDetailFromJson(json);
}

/// Filters a conformance pack by AWS Config rule names, compliance types, AWS
/// resource types, and resource IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConformancePackEvaluationFilters {
  /// Filters the results by compliance.
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>.
  @_s.JsonKey(name: 'ComplianceType')
  final ConformancePackComplianceType complianceType;

  /// Filters the results by AWS Config rule names.
  @_s.JsonKey(name: 'ConfigRuleNames')
  final List<String> configRuleNames;

  /// Filters the results by resource IDs.
  /// <note>
  /// This is valid only when you provide resource type. If there is no resource
  /// type, you will see an error.
  /// </note>
  @_s.JsonKey(name: 'ResourceIds')
  final List<String> resourceIds;

  /// Filters the results by the resource type (for example,
  /// <code>"AWS::EC2::Instance"</code>).
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ConformancePackEvaluationFilters({
    this.complianceType,
    this.configRuleNames,
    this.resourceIds,
    this.resourceType,
  });
  Map<String, dynamic> toJson() =>
      _$ConformancePackEvaluationFiltersToJson(this);
}

/// The details of a conformance pack evaluation. Provides AWS Config rule and
/// AWS resource type that was evaluated, the compliance of the conformance
/// pack, related time stamps, and supplementary information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConformancePackEvaluationResult {
  /// The compliance type. The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>.
  @_s.JsonKey(name: 'ComplianceType')
  final ConformancePackComplianceType complianceType;

  /// The time when AWS Config rule evaluated AWS resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ConfigRuleInvokedTime')
  final DateTime configRuleInvokedTime;
  @_s.JsonKey(name: 'EvaluationResultIdentifier')
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The time when AWS Config recorded the evaluation result.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ResultRecordedTime')
  final DateTime resultRecordedTime;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  @_s.JsonKey(name: 'Annotation')
  final String annotation;

  ConformancePackEvaluationResult({
    @_s.required this.complianceType,
    @_s.required this.configRuleInvokedTime,
    @_s.required this.evaluationResultIdentifier,
    @_s.required this.resultRecordedTime,
    this.annotation,
  });
  factory ConformancePackEvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$ConformancePackEvaluationResultFromJson(json);
}

/// Input parameters in the form of key-value pairs for the conformance pack,
/// both of which you define. Keys can have a maximum character length of 255
/// characters, and values can have a maximum length of 4096 characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConformancePackInputParameter {
  /// One part of a key-value pair.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  /// Another part of the key-value pair.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  ConformancePackInputParameter({
    @_s.required this.parameterName,
    @_s.required this.parameterValue,
  });
  factory ConformancePackInputParameter.fromJson(Map<String, dynamic> json) =>
      _$ConformancePackInputParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ConformancePackInputParameterToJson(this);
}

/// Compliance information of one or more AWS Config rules within a conformance
/// pack. You can filter using AWS Config rule names and compliance types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConformancePackRuleCompliance {
  /// Compliance of the AWS Config rule
  ///
  /// The allowed values are <code>COMPLIANT</code> and
  /// <code>NON_COMPLIANT</code>.
  @_s.JsonKey(name: 'ComplianceType')
  final ConformancePackComplianceType complianceType;

  /// Name of the config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  ConformancePackRuleCompliance({
    this.complianceType,
    this.configRuleName,
  });
  factory ConformancePackRuleCompliance.fromJson(Map<String, dynamic> json) =>
      _$ConformancePackRuleComplianceFromJson(json);
}

enum ConformancePackState {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

/// Status details of a conformance pack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConformancePackStatusDetail {
  /// Amazon Resource Name (ARN) of comformance pack.
  @_s.JsonKey(name: 'ConformancePackArn')
  final String conformancePackArn;

  /// ID of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackId')
  final String conformancePackId;

  /// Name of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackName')
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
  @_s.JsonKey(name: 'ConformancePackState')
  final ConformancePackState conformancePackState;

  /// Last time when conformation pack creation and update was requested.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateRequestedTime')
  final DateTime lastUpdateRequestedTime;

  /// Amazon Resource Name (ARN) of AWS CloudFormation stack.
  @_s.JsonKey(name: 'StackArn')
  final String stackArn;

  /// The reason of conformance pack creation failure.
  @_s.JsonKey(name: 'ConformancePackStatusReason')
  final String conformancePackStatusReason;

  /// Last time when conformation pack creation and update was successful.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateCompletedTime')
  final DateTime lastUpdateCompletedTime;

  ConformancePackStatusDetail({
    @_s.required this.conformancePackArn,
    @_s.required this.conformancePackId,
    @_s.required this.conformancePackName,
    @_s.required this.conformancePackState,
    @_s.required this.lastUpdateRequestedTime,
    @_s.required this.stackArn,
    this.conformancePackStatusReason,
    this.lastUpdateCompletedTime,
  });
  factory ConformancePackStatusDetail.fromJson(Map<String, dynamic> json) =>
      _$ConformancePackStatusDetailFromJson(json);
}

/// The output when you delete the evaluation results for the specified AWS
/// Config rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEvaluationResultsResponse {
  DeleteEvaluationResultsResponse();
  factory DeleteEvaluationResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEvaluationResultsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRemediationConfigurationResponse {
  DeleteRemediationConfigurationResponse();
  factory DeleteRemediationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteRemediationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRemediationExceptionsResponse {
  /// Returns a list of failed delete remediation exceptions batch objects. Each
  /// object in the batch consists of a list of failed items and failure messages.
  @_s.JsonKey(name: 'FailedBatches')
  final List<FailedDeleteRemediationExceptionsBatch> failedBatches;

  DeleteRemediationExceptionsResponse({
    this.failedBatches,
  });
  factory DeleteRemediationExceptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteRemediationExceptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteStoredQueryResponse {
  DeleteStoredQueryResponse();
  factory DeleteStoredQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteStoredQueryResponseFromJson(json);
}

/// The output for the <a>DeliverConfigSnapshot</a> action, in JSON format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeliverConfigSnapshotResponse {
  /// The ID of the snapshot that is being created.
  @_s.JsonKey(name: 'configSnapshotId')
  final String configSnapshotId;

  DeliverConfigSnapshotResponse({
    this.configSnapshotId,
  });
  factory DeliverConfigSnapshotResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliverConfigSnapshotResponseFromJson(json);
}

/// The channel through which AWS Config delivers notifications and updated
/// configuration states.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeliveryChannel {
  /// The options for how often AWS Config delivers configuration snapshots to the
  /// Amazon S3 bucket.
  @_s.JsonKey(name: 'configSnapshotDeliveryProperties')
  final ConfigSnapshotDeliveryProperties configSnapshotDeliveryProperties;

  /// The name of the delivery channel. By default, AWS Config assigns the name
  /// "default" when creating the delivery channel. To change the delivery channel
  /// name, you must use the DeleteDeliveryChannel action to delete your current
  /// delivery channel, and then you must use the PutDeliveryChannel command to
  /// create a delivery channel that has the desired name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The name of the Amazon S3 bucket to which AWS Config delivers configuration
  /// snapshots and configuration history files.
  ///
  /// If you specify a bucket that belongs to another AWS account, that bucket
  /// must have policies that grant access permissions to AWS Config. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html">Permissions
  /// for the Amazon S3 Bucket</a> in the AWS Config Developer Guide.
  @_s.JsonKey(name: 's3BucketName')
  final String s3BucketName;

  /// The prefix for the specified Amazon S3 bucket.
  @_s.JsonKey(name: 's3KeyPrefix')
  final String s3KeyPrefix;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which AWS Config
  /// sends notifications about configuration changes.
  ///
  /// If you choose a topic from another account, the topic must have policies
  /// that grant access permissions to AWS Config. For more information, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html">Permissions
  /// for the Amazon SNS Topic</a> in the AWS Config Developer Guide.
  @_s.JsonKey(name: 'snsTopicARN')
  final String snsTopicARN;

  DeliveryChannel({
    this.configSnapshotDeliveryProperties,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicARN,
  });
  factory DeliveryChannel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryChannelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryChannelToJson(this);
}

/// The status of a specified delivery channel.
///
/// Valid values: <code>Success</code> | <code>Failure</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeliveryChannelStatus {
  /// A list that contains the status of the delivery of the configuration history
  /// to the specified Amazon S3 bucket.
  @_s.JsonKey(name: 'configHistoryDeliveryInfo')
  final ConfigExportDeliveryInfo configHistoryDeliveryInfo;

  /// A list containing the status of the delivery of the snapshot to the
  /// specified Amazon S3 bucket.
  @_s.JsonKey(name: 'configSnapshotDeliveryInfo')
  final ConfigExportDeliveryInfo configSnapshotDeliveryInfo;

  /// A list containing the status of the delivery of the configuration stream
  /// notification to the specified Amazon SNS topic.
  @_s.JsonKey(name: 'configStreamDeliveryInfo')
  final ConfigStreamDeliveryInfo configStreamDeliveryInfo;

  /// The name of the delivery channel.
  @_s.JsonKey(name: 'name')
  final String name;

  DeliveryChannelStatus({
    this.configHistoryDeliveryInfo,
    this.configSnapshotDeliveryInfo,
    this.configStreamDeliveryInfo,
    this.name,
  });
  factory DeliveryChannelStatus.fromJson(Map<String, dynamic> json) =>
      _$DeliveryChannelStatusFromJson(json);
}

enum DeliveryStatus {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failure')
  failure,
  @_s.JsonValue('Not_Applicable')
  notApplicable,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAggregateComplianceByConfigRulesResponse {
  /// Returns a list of AggregateComplianceByConfigRule object.
  @_s.JsonKey(name: 'AggregateComplianceByConfigRules')
  final List<AggregateComplianceByConfigRule> aggregateComplianceByConfigRules;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAggregateComplianceByConfigRulesResponse({
    this.aggregateComplianceByConfigRules,
    this.nextToken,
  });
  factory DescribeAggregateComplianceByConfigRulesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAggregateComplianceByConfigRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAggregationAuthorizationsResponse {
  /// Returns a list of authorizations granted to various aggregator accounts and
  /// regions.
  @_s.JsonKey(name: 'AggregationAuthorizations')
  final List<AggregationAuthorization> aggregationAuthorizations;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAggregationAuthorizationsResponse({
    this.aggregationAuthorizations,
    this.nextToken,
  });
  factory DescribeAggregationAuthorizationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAggregationAuthorizationsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComplianceByConfigRuleResponse {
  /// Indicates whether each of the specified AWS Config rules is compliant.
  @_s.JsonKey(name: 'ComplianceByConfigRules')
  final List<ComplianceByConfigRule> complianceByConfigRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeComplianceByConfigRuleResponse({
    this.complianceByConfigRules,
    this.nextToken,
  });
  factory DescribeComplianceByConfigRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeComplianceByConfigRuleResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComplianceByResourceResponse {
  /// Indicates whether the specified AWS resource complies with all of the AWS
  /// Config rules that evaluate it.
  @_s.JsonKey(name: 'ComplianceByResources')
  final List<ComplianceByResource> complianceByResources;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeComplianceByResourceResponse({
    this.complianceByResources,
    this.nextToken,
  });
  factory DescribeComplianceByResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeComplianceByResourceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigRuleEvaluationStatusResponse {
  /// Status information about your AWS managed Config rules.
  @_s.JsonKey(name: 'ConfigRulesEvaluationStatus')
  final List<ConfigRuleEvaluationStatus> configRulesEvaluationStatus;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConfigRuleEvaluationStatusResponse({
    this.configRulesEvaluationStatus,
    this.nextToken,
  });
  factory DescribeConfigRuleEvaluationStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigRuleEvaluationStatusResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigRulesResponse {
  /// The details about your AWS Config rules.
  @_s.JsonKey(name: 'ConfigRules')
  final List<ConfigRule> configRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConfigRulesResponse({
    this.configRules,
    this.nextToken,
  });
  factory DescribeConfigRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConfigRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationAggregatorSourcesStatusResponse {
  /// Returns an AggregatedSourceStatus object.
  @_s.JsonKey(name: 'AggregatedSourceStatusList')
  final List<AggregatedSourceStatus> aggregatedSourceStatusList;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConfigurationAggregatorSourcesStatusResponse({
    this.aggregatedSourceStatusList,
    this.nextToken,
  });
  factory DescribeConfigurationAggregatorSourcesStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigurationAggregatorSourcesStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationAggregatorsResponse {
  /// Returns a ConfigurationAggregators object.
  @_s.JsonKey(name: 'ConfigurationAggregators')
  final List<ConfigurationAggregator> configurationAggregators;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConfigurationAggregatorsResponse({
    this.configurationAggregators,
    this.nextToken,
  });
  factory DescribeConfigurationAggregatorsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigurationAggregatorsResponseFromJson(json);
}

/// The output for the <a>DescribeConfigurationRecorderStatus</a> action, in
/// JSON format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationRecorderStatusResponse {
  /// A list that contains status of the specified recorders.
  @_s.JsonKey(name: 'ConfigurationRecordersStatus')
  final List<ConfigurationRecorderStatus> configurationRecordersStatus;

  DescribeConfigurationRecorderStatusResponse({
    this.configurationRecordersStatus,
  });
  factory DescribeConfigurationRecorderStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigurationRecorderStatusResponseFromJson(json);
}

/// The output for the <a>DescribeConfigurationRecorders</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationRecordersResponse {
  /// A list that contains the descriptions of the specified configuration
  /// recorders.
  @_s.JsonKey(name: 'ConfigurationRecorders')
  final List<ConfigurationRecorder> configurationRecorders;

  DescribeConfigurationRecordersResponse({
    this.configurationRecorders,
  });
  factory DescribeConfigurationRecordersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigurationRecordersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConformancePackComplianceResponse {
  /// Name of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackName')
  final String conformancePackName;

  /// Returns a list of <code>ConformancePackRuleCompliance</code> objects.
  @_s.JsonKey(name: 'ConformancePackRuleComplianceList')
  final List<ConformancePackRuleCompliance> conformancePackRuleComplianceList;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConformancePackComplianceResponse({
    @_s.required this.conformancePackName,
    @_s.required this.conformancePackRuleComplianceList,
    this.nextToken,
  });
  factory DescribeConformancePackComplianceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConformancePackComplianceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConformancePackStatusResponse {
  /// A list of <code>ConformancePackStatusDetail</code> objects.
  @_s.JsonKey(name: 'ConformancePackStatusDetails')
  final List<ConformancePackStatusDetail> conformancePackStatusDetails;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConformancePackStatusResponse({
    this.conformancePackStatusDetails,
    this.nextToken,
  });
  factory DescribeConformancePackStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConformancePackStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConformancePacksResponse {
  /// Returns a list of <code>ConformancePackDetail</code> objects.
  @_s.JsonKey(name: 'ConformancePackDetails')
  final List<ConformancePackDetail> conformancePackDetails;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConformancePacksResponse({
    this.conformancePackDetails,
    this.nextToken,
  });
  factory DescribeConformancePacksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConformancePacksResponseFromJson(json);
}

/// The output for the <a>DescribeDeliveryChannelStatus</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeliveryChannelStatusResponse {
  /// A list that contains the status of a specified delivery channel.
  @_s.JsonKey(name: 'DeliveryChannelsStatus')
  final List<DeliveryChannelStatus> deliveryChannelsStatus;

  DescribeDeliveryChannelStatusResponse({
    this.deliveryChannelsStatus,
  });
  factory DescribeDeliveryChannelStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDeliveryChannelStatusResponseFromJson(json);
}

/// The output for the <a>DescribeDeliveryChannels</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeliveryChannelsResponse {
  /// A list that contains the descriptions of the specified delivery channel.
  @_s.JsonKey(name: 'DeliveryChannels')
  final List<DeliveryChannel> deliveryChannels;

  DescribeDeliveryChannelsResponse({
    this.deliveryChannels,
  });
  factory DescribeDeliveryChannelsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDeliveryChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConfigRuleStatusesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>OrganizationConfigRuleStatus</code> objects.
  @_s.JsonKey(name: 'OrganizationConfigRuleStatuses')
  final List<OrganizationConfigRuleStatus> organizationConfigRuleStatuses;

  DescribeOrganizationConfigRuleStatusesResponse({
    this.nextToken,
    this.organizationConfigRuleStatuses,
  });
  factory DescribeOrganizationConfigRuleStatusesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConfigRuleStatusesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConfigRulesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of <code>OrganizationConfigRule</code> objects.
  @_s.JsonKey(name: 'OrganizationConfigRules')
  final List<OrganizationConfigRule> organizationConfigRules;

  DescribeOrganizationConfigRulesResponse({
    this.nextToken,
    this.organizationConfigRules,
  });
  factory DescribeOrganizationConfigRulesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConfigRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConformancePackStatusesResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>OrganizationConformancePackStatus</code> objects.
  @_s.JsonKey(name: 'OrganizationConformancePackStatuses')
  final List<OrganizationConformancePackStatus>
      organizationConformancePackStatuses;

  DescribeOrganizationConformancePackStatusesResponse({
    this.nextToken,
    this.organizationConformancePackStatuses,
  });
  factory DescribeOrganizationConformancePackStatusesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConformancePackStatusesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConformancePacksResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of OrganizationConformancePacks objects.
  @_s.JsonKey(name: 'OrganizationConformancePacks')
  final List<OrganizationConformancePack> organizationConformancePacks;

  DescribeOrganizationConformancePacksResponse({
    this.nextToken,
    this.organizationConformancePacks,
  });
  factory DescribeOrganizationConformancePacksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConformancePacksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePendingAggregationRequestsResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a PendingAggregationRequests object.
  @_s.JsonKey(name: 'PendingAggregationRequests')
  final List<PendingAggregationRequest> pendingAggregationRequests;

  DescribePendingAggregationRequestsResponse({
    this.nextToken,
    this.pendingAggregationRequests,
  });
  factory DescribePendingAggregationRequestsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePendingAggregationRequestsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRemediationConfigurationsResponse {
  /// Returns a remediation configuration object.
  @_s.JsonKey(name: 'RemediationConfigurations')
  final List<RemediationConfiguration> remediationConfigurations;

  DescribeRemediationConfigurationsResponse({
    this.remediationConfigurations,
  });
  factory DescribeRemediationConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRemediationConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRemediationExceptionsResponse {
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of remediation exception objects.
  @_s.JsonKey(name: 'RemediationExceptions')
  final List<RemediationException> remediationExceptions;

  DescribeRemediationExceptionsResponse({
    this.nextToken,
    this.remediationExceptions,
  });
  factory DescribeRemediationExceptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRemediationExceptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRemediationExecutionStatusResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of remediation execution statuses objects.
  @_s.JsonKey(name: 'RemediationExecutionStatuses')
  final List<RemediationExecutionStatus> remediationExecutionStatuses;

  DescribeRemediationExecutionStatusResponse({
    this.nextToken,
    this.remediationExecutionStatuses,
  });
  factory DescribeRemediationExecutionStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRemediationExecutionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRetentionConfigurationsResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a retention configuration object.
  @_s.JsonKey(name: 'RetentionConfigurations')
  final List<RetentionConfiguration> retentionConfigurations;

  DescribeRetentionConfigurationsResponse({
    this.nextToken,
    this.retentionConfigurations,
  });
  factory DescribeRetentionConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRetentionConfigurationsResponseFromJson(json);
}

/// Identifies an AWS resource and indicates whether it complies with the AWS
/// Config rule that it was evaluated against.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Evaluation {
  /// The ID of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ComplianceResourceId')
  final String complianceResourceId;

  /// The type of AWS resource that was evaluated.
  @_s.JsonKey(name: 'ComplianceResourceType')
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
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;

  /// The time of the event in AWS Config that triggered the evaluation. For
  /// event-based evaluations, the time indicates when AWS Config created the
  /// configuration item that triggered the evaluation. For periodic evaluations,
  /// the time indicates when AWS Config triggered the evaluation at the frequency
  /// that you specified (for example, every 24 hours).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OrderingTimestamp')
  final DateTime orderingTimestamp;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  @_s.JsonKey(name: 'Annotation')
  final String annotation;

  Evaluation({
    @_s.required this.complianceResourceId,
    @_s.required this.complianceResourceType,
    @_s.required this.complianceType,
    @_s.required this.orderingTimestamp,
    this.annotation,
  });
  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationToJson(this);
}

/// The details of an AWS Config evaluation. Provides the AWS resource that was
/// evaluated, the compliance of the resource, related time stamps, and
/// supplementary information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResult {
  /// Supplementary information about how the evaluation determined the
  /// compliance.
  @_s.JsonKey(name: 'Annotation')
  final String annotation;

  /// Indicates whether the AWS resource complies with the AWS Config rule that
  /// evaluated it.
  ///
  /// For the <code>EvaluationResult</code> data type, AWS Config supports only
  /// the <code>COMPLIANT</code>, <code>NON_COMPLIANT</code>, and
  /// <code>NOT_APPLICABLE</code> values. AWS Config does not support the
  /// <code>INSUFFICIENT_DATA</code> value for the <code>EvaluationResult</code>
  /// data type.
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;

  /// The time when the AWS Config rule evaluated the AWS resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ConfigRuleInvokedTime')
  final DateTime configRuleInvokedTime;

  /// Uniquely identifies the evaluation result.
  @_s.JsonKey(name: 'EvaluationResultIdentifier')
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The time when AWS Config recorded the evaluation result.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ResultRecordedTime')
  final DateTime resultRecordedTime;

  /// An encrypted token that associates an evaluation with an AWS Config rule.
  /// The token identifies the rule, the AWS resource being evaluated, and the
  /// event that triggered the evaluation.
  @_s.JsonKey(name: 'ResultToken')
  final String resultToken;

  EvaluationResult({
    this.annotation,
    this.complianceType,
    this.configRuleInvokedTime,
    this.evaluationResultIdentifier,
    this.resultRecordedTime,
    this.resultToken,
  });
  factory EvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultFromJson(json);
}

/// Uniquely identifies an evaluation result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResultIdentifier {
  /// Identifies an AWS Config rule used to evaluate an AWS resource, and provides
  /// the type and ID of the evaluated resource.
  @_s.JsonKey(name: 'EvaluationResultQualifier')
  final EvaluationResultQualifier evaluationResultQualifier;

  /// The time of the event that triggered the evaluation of your AWS resources.
  /// The time can indicate when AWS Config delivered a configuration item change
  /// notification, or it can indicate when AWS Config delivered the configuration
  /// snapshot, depending on which event triggered the evaluation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OrderingTimestamp')
  final DateTime orderingTimestamp;

  EvaluationResultIdentifier({
    this.evaluationResultQualifier,
    this.orderingTimestamp,
  });
  factory EvaluationResultIdentifier.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultIdentifierFromJson(json);
}

/// Identifies an AWS Config rule that evaluated an AWS resource, and provides
/// the type and ID of the resource that the rule evaluated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResultQualifier {
  /// The name of the AWS Config rule that was used in the evaluation.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  /// The ID of the evaluated AWS resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  EvaluationResultQualifier({
    this.configRuleName,
    this.resourceId,
    this.resourceType,
  });
  factory EvaluationResultQualifier.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultQualifierFromJson(json);
}

enum EventSource {
  @_s.JsonValue('aws.config')
  awsConfig,
}

/// The controls that AWS Config uses for executing remediations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExecutionControls {
  /// A SsmControls object.
  @_s.JsonKey(name: 'SsmControls')
  final SsmControls ssmControls;

  ExecutionControls({
    this.ssmControls,
  });
  factory ExecutionControls.fromJson(Map<String, dynamic> json) =>
      _$ExecutionControlsFromJson(json);

  Map<String, dynamic> toJson() => _$ExecutionControlsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExternalEvaluation {
  @_s.JsonKey(name: 'ComplianceResourceId')
  final String complianceResourceId;
  @_s.JsonKey(name: 'ComplianceResourceType')
  final String complianceResourceType;
  @_s.JsonKey(name: 'ComplianceType')
  final ComplianceType complianceType;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OrderingTimestamp')
  final DateTime orderingTimestamp;
  @_s.JsonKey(name: 'Annotation')
  final String annotation;

  ExternalEvaluation({
    @_s.required this.complianceResourceId,
    @_s.required this.complianceResourceType,
    @_s.required this.complianceType,
    @_s.required this.orderingTimestamp,
    this.annotation,
  });
  Map<String, dynamic> toJson() => _$ExternalEvaluationToJson(this);
}

/// List of each of the failed delete remediation exceptions with specific
/// reasons.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedDeleteRemediationExceptionsBatch {
  /// Returns remediation exception resource key object of the failed items.
  @_s.JsonKey(name: 'FailedItems')
  final List<RemediationExceptionResourceKey> failedItems;

  /// Returns a failure message for delete remediation exception. For example, AWS
  /// Config creates an exception due to an internal error.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  FailedDeleteRemediationExceptionsBatch({
    this.failedItems,
    this.failureMessage,
  });
  factory FailedDeleteRemediationExceptionsBatch.fromJson(
          Map<String, dynamic> json) =>
      _$FailedDeleteRemediationExceptionsBatchFromJson(json);
}

/// List of each of the failed remediations with specific reasons.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedRemediationBatch {
  /// Returns remediation configurations of the failed items.
  @_s.JsonKey(name: 'FailedItems')
  final List<RemediationConfiguration> failedItems;

  /// Returns a failure message. For example, the resource is already compliant.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  FailedRemediationBatch({
    this.failedItems,
    this.failureMessage,
  });
  factory FailedRemediationBatch.fromJson(Map<String, dynamic> json) =>
      _$FailedRemediationBatchFromJson(json);
}

/// List of each of the failed remediation exceptions with specific reasons.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedRemediationExceptionBatch {
  /// Returns remediation exception resource key object of the failed items.
  @_s.JsonKey(name: 'FailedItems')
  final List<RemediationException> failedItems;

  /// Returns a failure message. For example, the auto-remediation has failed.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  FailedRemediationExceptionBatch({
    this.failedItems,
    this.failureMessage,
  });
  factory FailedRemediationExceptionBatch.fromJson(Map<String, dynamic> json) =>
      _$FailedRemediationExceptionBatchFromJson(json);
}

/// Details about the fields such as name of the field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FieldInfo {
  /// Name of the field.
  @_s.JsonKey(name: 'Name')
  final String name;

  FieldInfo({
    this.name,
  });
  factory FieldInfo.fromJson(Map<String, dynamic> json) =>
      _$FieldInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAggregateComplianceDetailsByConfigRuleResponse {
  /// Returns an AggregateEvaluationResults object.
  @_s.JsonKey(name: 'AggregateEvaluationResults')
  final List<AggregateEvaluationResult> aggregateEvaluationResults;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetAggregateComplianceDetailsByConfigRuleResponse({
    this.aggregateEvaluationResults,
    this.nextToken,
  });
  factory GetAggregateComplianceDetailsByConfigRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAggregateComplianceDetailsByConfigRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAggregateConfigRuleComplianceSummaryResponse {
  /// Returns a list of AggregateComplianceCounts object.
  @_s.JsonKey(name: 'AggregateComplianceCounts')
  final List<AggregateComplianceCount> aggregateComplianceCounts;

  /// Groups the result based on ACCOUNT_ID or AWS_REGION.
  @_s.JsonKey(name: 'GroupByKey')
  final String groupByKey;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetAggregateConfigRuleComplianceSummaryResponse({
    this.aggregateComplianceCounts,
    this.groupByKey,
    this.nextToken,
  });
  factory GetAggregateConfigRuleComplianceSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAggregateConfigRuleComplianceSummaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAggregateDiscoveredResourceCountsResponse {
  /// The total number of resources that are present in an aggregator with the
  /// filters that you provide.
  @_s.JsonKey(name: 'TotalDiscoveredResources')
  final int totalDiscoveredResources;

  /// The key passed into the request object. If <code>GroupByKey</code> is not
  /// provided, the result will be empty.
  @_s.JsonKey(name: 'GroupByKey')
  final String groupByKey;

  /// Returns a list of GroupedResourceCount objects.
  @_s.JsonKey(name: 'GroupedResourceCounts')
  final List<GroupedResourceCount> groupedResourceCounts;

  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetAggregateDiscoveredResourceCountsResponse({
    @_s.required this.totalDiscoveredResources,
    this.groupByKey,
    this.groupedResourceCounts,
    this.nextToken,
  });
  factory GetAggregateDiscoveredResourceCountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAggregateDiscoveredResourceCountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAggregateResourceConfigResponse {
  /// Returns a <code>ConfigurationItem</code> object.
  @_s.JsonKey(name: 'ConfigurationItem')
  final ConfigurationItem configurationItem;

  GetAggregateResourceConfigResponse({
    this.configurationItem,
  });
  factory GetAggregateResourceConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAggregateResourceConfigResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComplianceDetailsByConfigRuleResponse {
  /// Indicates whether the AWS resource complies with the specified AWS Config
  /// rule.
  @_s.JsonKey(name: 'EvaluationResults')
  final List<EvaluationResult> evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetComplianceDetailsByConfigRuleResponse({
    this.evaluationResults,
    this.nextToken,
  });
  factory GetComplianceDetailsByConfigRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetComplianceDetailsByConfigRuleResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComplianceDetailsByResourceResponse {
  /// Indicates whether the specified AWS resource complies each AWS Config rule.
  @_s.JsonKey(name: 'EvaluationResults')
  final List<EvaluationResult> evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetComplianceDetailsByResourceResponse({
    this.evaluationResults,
    this.nextToken,
  });
  factory GetComplianceDetailsByResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetComplianceDetailsByResourceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComplianceSummaryByConfigRuleResponse {
  /// The number of AWS Config rules that are compliant and the number that are
  /// noncompliant, up to a maximum of 25 for each.
  @_s.JsonKey(name: 'ComplianceSummary')
  final ComplianceSummary complianceSummary;

  GetComplianceSummaryByConfigRuleResponse({
    this.complianceSummary,
  });
  factory GetComplianceSummaryByConfigRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetComplianceSummaryByConfigRuleResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComplianceSummaryByResourceTypeResponse {
  /// The number of resources that are compliant and the number that are
  /// noncompliant. If one or more resource types were provided with the request,
  /// the numbers are returned for each resource type. The maximum number returned
  /// is 100.
  @_s.JsonKey(name: 'ComplianceSummariesByResourceType')
  final List<ComplianceSummaryByResourceType> complianceSummariesByResourceType;

  GetComplianceSummaryByResourceTypeResponse({
    this.complianceSummariesByResourceType,
  });
  factory GetComplianceSummaryByResourceTypeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetComplianceSummaryByResourceTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConformancePackComplianceDetailsResponse {
  /// Name of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackName')
  final String conformancePackName;

  /// Returns a list of <code>ConformancePackEvaluationResult</code> objects.
  @_s.JsonKey(name: 'ConformancePackRuleEvaluationResults')
  final List<ConformancePackEvaluationResult>
      conformancePackRuleEvaluationResults;

  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetConformancePackComplianceDetailsResponse({
    @_s.required this.conformancePackName,
    this.conformancePackRuleEvaluationResults,
    this.nextToken,
  });
  factory GetConformancePackComplianceDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetConformancePackComplianceDetailsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConformancePackComplianceSummaryResponse {
  /// A list of <code>ConformancePackComplianceSummary</code> objects.
  @_s.JsonKey(name: 'ConformancePackComplianceSummaryList')
  final List<ConformancePackComplianceSummary>
      conformancePackComplianceSummaryList;

  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetConformancePackComplianceSummaryResponse({
    this.conformancePackComplianceSummaryList,
    this.nextToken,
  });
  factory GetConformancePackComplianceSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetConformancePackComplianceSummaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiscoveredResourceCountsResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of <code>ResourceCount</code> objects. Each object is listed in
  /// descending order by the number of resources.
  @_s.JsonKey(name: 'resourceCounts')
  final List<ResourceCount> resourceCounts;

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
  @_s.JsonKey(name: 'totalDiscoveredResources')
  final int totalDiscoveredResources;

  GetDiscoveredResourceCountsResponse({
    this.nextToken,
    this.resourceCounts,
    this.totalDiscoveredResources,
  });
  factory GetDiscoveredResourceCountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDiscoveredResourceCountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOrganizationConfigRuleDetailedStatusResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>MemberAccountStatus</code> objects.
  @_s.JsonKey(name: 'OrganizationConfigRuleDetailedStatus')
  final List<MemberAccountStatus> organizationConfigRuleDetailedStatus;

  GetOrganizationConfigRuleDetailedStatusResponse({
    this.nextToken,
    this.organizationConfigRuleDetailedStatus,
  });
  factory GetOrganizationConfigRuleDetailedStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrganizationConfigRuleDetailedStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOrganizationConformancePackDetailedStatusResponse {
  /// The nextToken string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>OrganizationConformancePackDetailedStatus</code> objects.
  @_s.JsonKey(name: 'OrganizationConformancePackDetailedStatuses')
  final List<OrganizationConformancePackDetailedStatus>
      organizationConformancePackDetailedStatuses;

  GetOrganizationConformancePackDetailedStatusResponse({
    this.nextToken,
    this.organizationConformancePackDetailedStatuses,
  });
  factory GetOrganizationConformancePackDetailedStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrganizationConformancePackDetailedStatusResponseFromJson(json);
}

/// The output for the <a>GetResourceConfigHistory</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceConfigHistoryResponse {
  /// A list that contains the configuration history of one or more resources.
  @_s.JsonKey(name: 'configurationItems')
  final List<ConfigurationItem> configurationItems;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetResourceConfigHistoryResponse({
    this.configurationItems,
    this.nextToken,
  });
  factory GetResourceConfigHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResourceConfigHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStoredQueryResponse {
  /// Returns a <code>StoredQuery</code> object.
  @_s.JsonKey(name: 'StoredQuery')
  final StoredQuery storedQuery;

  GetStoredQueryResponse({
    this.storedQuery,
  });
  factory GetStoredQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStoredQueryResponseFromJson(json);
}

/// The count of resources that are grouped by the group name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupedResourceCount {
  /// The name of the group that can be region, account ID, or resource type. For
  /// example, region1, region2 if the region was chosen as
  /// <code>GroupByKey</code>.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The number of resources in the group.
  @_s.JsonKey(name: 'ResourceCount')
  final int resourceCount;

  GroupedResourceCount({
    @_s.required this.groupName,
    @_s.required this.resourceCount,
  });
  factory GroupedResourceCount.fromJson(Map<String, dynamic> json) =>
      _$GroupedResourceCountFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAggregateDiscoveredResourcesResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of <code>ResourceIdentifiers</code> objects.
  @_s.JsonKey(name: 'ResourceIdentifiers')
  final List<AggregateResourceIdentifier> resourceIdentifiers;

  ListAggregateDiscoveredResourcesResponse({
    this.nextToken,
    this.resourceIdentifiers,
  });
  factory ListAggregateDiscoveredResourcesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAggregateDiscoveredResourcesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDiscoveredResourcesResponse {
  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The details that identify a resource that is discovered by AWS Config,
  /// including the resource type, ID, and (if available) the custom resource
  /// name.
  @_s.JsonKey(name: 'resourceIdentifiers')
  final List<ResourceIdentifier> resourceIdentifiers;

  ListDiscoveredResourcesResponse({
    this.nextToken,
    this.resourceIdentifiers,
  });
  factory ListDiscoveredResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDiscoveredResourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStoredQueriesResponse {
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call this action again and
  /// assign that token to the request object's <code>NextToken</code> parameter.
  /// If there are no remaining results, the previous response object's
  /// <code>NextToken</code> parameter is set to <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>StoredQueryMetadata</code> objects.
  @_s.JsonKey(name: 'StoredQueryMetadata')
  final List<StoredQueryMetadata> storedQueryMetadata;

  ListStoredQueriesResponse({
    this.nextToken,
    this.storedQueryMetadata,
  });
  factory ListStoredQueriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStoredQueriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The <code>nextToken</code> string returned on a previous page that you use
  /// to get the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags for the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum MaximumExecutionFrequency {
  @_s.JsonValue('One_Hour')
  oneHour,
  @_s.JsonValue('Three_Hours')
  threeHours,
  @_s.JsonValue('Six_Hours')
  sixHours,
  @_s.JsonValue('Twelve_Hours')
  twelveHours,
  @_s.JsonValue('TwentyFour_Hours')
  twentyFourHours,
}

enum MemberAccountRuleStatus {
  @_s.JsonValue('CREATE_SUCCESSFUL')
  createSuccessful,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_SUCCESSFUL')
  deleteSuccessful,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('UPDATE_SUCCESSFUL')
  updateSuccessful,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// Organization config rule creation or deletion status in each member account.
/// This includes the name of the rule, the status, error code and error message
/// when the rule creation or deletion failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberAccountStatus {
  /// The 12-digit account ID of a member account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The name of config rule deployed in the member account.
  @_s.JsonKey(name: 'ConfigRuleName')
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
  @_s.JsonKey(name: 'MemberAccountRuleStatus')
  final MemberAccountRuleStatus memberAccountRuleStatus;

  /// An error code that is returned when config rule creation or deletion failed
  /// in the member account.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// An error message indicating that config rule account creation or deletion
  /// has failed due to an error in the member account.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The timestamp of the last status update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  MemberAccountStatus({
    @_s.required this.accountId,
    @_s.required this.configRuleName,
    @_s.required this.memberAccountRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  factory MemberAccountStatus.fromJson(Map<String, dynamic> json) =>
      _$MemberAccountStatusFromJson(json);
}

enum MessageType {
  @_s.JsonValue('ConfigurationItemChangeNotification')
  configurationItemChangeNotification,
  @_s.JsonValue('ConfigurationSnapshotDeliveryCompleted')
  configurationSnapshotDeliveryCompleted,
  @_s.JsonValue('ScheduledNotification')
  scheduledNotification,
  @_s.JsonValue('OversizedConfigurationItemChangeNotification')
  oversizedConfigurationItemChangeNotification,
}

/// This object contains regions to set up the aggregator and an IAM role to
/// retrieve organization details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationAggregationSource {
  /// ARN of the IAM role used to retrieve AWS Organization details associated
  /// with the aggregator account.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// If true, aggregate existing AWS Config regions and future regions.
  @_s.JsonKey(name: 'AllAwsRegions')
  final bool allAwsRegions;

  /// The source regions being aggregated.
  @_s.JsonKey(name: 'AwsRegions')
  final List<String> awsRegions;

  OrganizationAggregationSource({
    @_s.required this.roleArn,
    this.allAwsRegions,
    this.awsRegions,
  });
  factory OrganizationAggregationSource.fromJson(Map<String, dynamic> json) =>
      _$OrganizationAggregationSourceFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationAggregationSourceToJson(this);
}

/// An organization config rule that has information about config rules that AWS
/// Config creates in member accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationConfigRule {
  /// Amazon Resource Name (ARN) of organization config rule.
  @_s.JsonKey(name: 'OrganizationConfigRuleArn')
  final String organizationConfigRuleArn;

  /// The name that you assign to organization config rule.
  @_s.JsonKey(name: 'OrganizationConfigRuleName')
  final String organizationConfigRuleName;

  /// A comma-separated list of accounts excluded from organization config rule.
  @_s.JsonKey(name: 'ExcludedAccounts')
  final List<String> excludedAccounts;

  /// The timestamp of the last update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// An <code>OrganizationCustomRuleMetadata</code> object.
  @_s.JsonKey(name: 'OrganizationCustomRuleMetadata')
  final OrganizationCustomRuleMetadata organizationCustomRuleMetadata;

  /// An <code>OrganizationManagedRuleMetadata</code> object.
  @_s.JsonKey(name: 'OrganizationManagedRuleMetadata')
  final OrganizationManagedRuleMetadata organizationManagedRuleMetadata;

  OrganizationConfigRule({
    @_s.required this.organizationConfigRuleArn,
    @_s.required this.organizationConfigRuleName,
    this.excludedAccounts,
    this.lastUpdateTime,
    this.organizationCustomRuleMetadata,
    this.organizationManagedRuleMetadata,
  });
  factory OrganizationConfigRule.fromJson(Map<String, dynamic> json) =>
      _$OrganizationConfigRuleFromJson(json);
}

/// Returns the status for an organization config rule in an organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationConfigRuleStatus {
  /// The name that you assign to organization config rule.
  @_s.JsonKey(name: 'OrganizationConfigRuleName')
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
  @_s.JsonKey(name: 'OrganizationRuleStatus')
  final OrganizationRuleStatus organizationRuleStatus;

  /// An error code that is returned when organization config rule creation or
  /// deletion has failed.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// An error message indicating that organization config rule creation or
  /// deletion failed due to an error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The timestamp of the last update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  OrganizationConfigRuleStatus({
    @_s.required this.organizationConfigRuleName,
    @_s.required this.organizationRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  factory OrganizationConfigRuleStatus.fromJson(Map<String, dynamic> json) =>
      _$OrganizationConfigRuleStatusFromJson(json);
}

enum OrganizationConfigRuleTriggerType {
  @_s.JsonValue('ConfigurationItemChangeNotification')
  configurationItemChangeNotification,
  @_s.JsonValue('OversizedConfigurationItemChangeNotification')
  oversizedConfigurationItemChangeNotification,
  @_s.JsonValue('ScheduledNotification')
  scheduledNotification,
}

/// An organization conformance pack that has information about conformance
/// packs that AWS Config creates in member accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationConformancePack {
  /// Last time when organization conformation pack was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// Amazon Resource Name (ARN) of organization conformance pack.
  @_s.JsonKey(name: 'OrganizationConformancePackArn')
  final String organizationConformancePackArn;

  /// The name you assign to an organization conformance pack.
  @_s.JsonKey(name: 'OrganizationConformancePackName')
  final String organizationConformancePackName;

  /// A list of <code>ConformancePackInputParameter</code> objects.
  @_s.JsonKey(name: 'ConformancePackInputParameters')
  final List<ConformancePackInputParameter> conformancePackInputParameters;

  /// Location of an Amazon S3 bucket where AWS Config can deliver evaluation
  /// results and conformance pack template that is used to create a pack.
  @_s.JsonKey(name: 'DeliveryS3Bucket')
  final String deliveryS3Bucket;

  /// Any folder structure you want to add to an Amazon S3 bucket.
  @_s.JsonKey(name: 'DeliveryS3KeyPrefix')
  final String deliveryS3KeyPrefix;

  /// A comma-separated list of accounts excluded from organization conformance
  /// pack.
  @_s.JsonKey(name: 'ExcludedAccounts')
  final List<String> excludedAccounts;

  OrganizationConformancePack({
    @_s.required this.lastUpdateTime,
    @_s.required this.organizationConformancePackArn,
    @_s.required this.organizationConformancePackName,
    this.conformancePackInputParameters,
    this.deliveryS3Bucket,
    this.deliveryS3KeyPrefix,
    this.excludedAccounts,
  });
  factory OrganizationConformancePack.fromJson(Map<String, dynamic> json) =>
      _$OrganizationConformancePackFromJson(json);
}

/// Organization conformance pack creation or deletion status in each member
/// account. This includes the name of the conformance pack, the status, error
/// code and error message when the conformance pack creation or deletion
/// failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationConformancePackDetailedStatus {
  /// The 12-digit account ID of a member account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The name of conformance pack deployed in the member account.
  @_s.JsonKey(name: 'ConformancePackName')
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
  @_s.JsonKey(name: 'Status')
  final OrganizationResourceDetailedStatus status;

  /// An error code that is returned when conformance pack creation or deletion
  /// failed in the member account.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// An error message indicating that conformance pack account creation or
  /// deletion has failed due to an error in the member account.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The timestamp of the last status update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  OrganizationConformancePackDetailedStatus({
    @_s.required this.accountId,
    @_s.required this.conformancePackName,
    @_s.required this.status,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  factory OrganizationConformancePackDetailedStatus.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationConformancePackDetailedStatusFromJson(json);
}

/// Returns the status for an organization conformance pack in an organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationConformancePackStatus {
  /// The name that you assign to organization conformance pack.
  @_s.JsonKey(name: 'OrganizationConformancePackName')
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
  @_s.JsonKey(name: 'Status')
  final OrganizationResourceStatus status;

  /// An error code that is returned when organization conformance pack creation
  /// or deletion has failed in a member account.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// An error message indicating that organization conformance pack creation or
  /// deletion failed due to an error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The timestamp of the last update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  OrganizationConformancePackStatus({
    @_s.required this.organizationConformancePackName,
    @_s.required this.status,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  factory OrganizationConformancePackStatus.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationConformancePackStatusFromJson(json);
}

/// An object that specifies organization custom rule metadata such as resource
/// type, resource ID of AWS resource, Lamdba function ARN, and organization
/// trigger types that trigger AWS Config to evaluate your AWS resources against
/// a rule. It also provides the frequency with which you want AWS Config to run
/// evaluations for the rule if the trigger type is periodic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationCustomRuleMetadata {
  /// The lambda function ARN.
  @_s.JsonKey(name: 'LambdaFunctionArn')
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
  @_s.JsonKey(name: 'OrganizationConfigRuleTriggerTypes')
  final List<OrganizationConfigRuleTriggerType>
      organizationConfigRuleTriggerTypes;

  /// The description that you provide for organization config rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A string, in JSON format, that is passed to organization config rule Lambda
  /// function.
  @_s.JsonKey(name: 'InputParameters')
  final String inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule.
  /// Your custom rule is triggered when AWS Config delivers the configuration
  /// snapshot. For more information, see <a>ConfigSnapshotDeliveryProperties</a>.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  @_s.JsonKey(name: 'MaximumExecutionFrequency')
  final MaximumExecutionFrequency maximumExecutionFrequency;

  /// The ID of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceIdScope')
  final String resourceIdScope;

  /// The type of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceTypesScope')
  final List<String> resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'TagKeyScope')
  final String tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  @_s.JsonKey(name: 'TagValueScope')
  final String tagValueScope;

  OrganizationCustomRuleMetadata({
    @_s.required this.lambdaFunctionArn,
    @_s.required this.organizationConfigRuleTriggerTypes,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });
  factory OrganizationCustomRuleMetadata.fromJson(Map<String, dynamic> json) =>
      _$OrganizationCustomRuleMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationCustomRuleMetadataToJson(this);
}

/// An object that specifies organization managed rule metadata such as resource
/// type and ID of AWS resource along with the rule identifier. It also provides
/// the frequency with which you want AWS Config to run evaluations for the rule
/// if the trigger type is periodic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationManagedRuleMetadata {
  /// For organization config managed rules, a predefined identifier from a list.
  /// For example, <code>IAM_PASSWORD_POLICY</code> is a managed rule. To
  /// reference a managed rule, see <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">Using
  /// AWS Managed Config Rules</a>.
  @_s.JsonKey(name: 'RuleIdentifier')
  final String ruleIdentifier;

  /// The description that you provide for organization config rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A string, in JSON format, that is passed to organization config rule Lambda
  /// function.
  @_s.JsonKey(name: 'InputParameters')
  final String inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule. You
  /// are using an AWS managed rule that is triggered at a periodic frequency.
  /// <note>
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// <code>MaximumExecutionFrequency</code> parameter.
  /// </note>
  @_s.JsonKey(name: 'MaximumExecutionFrequency')
  final MaximumExecutionFrequency maximumExecutionFrequency;

  /// The ID of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceIdScope')
  final String resourceIdScope;

  /// The type of the AWS resource that was evaluated.
  @_s.JsonKey(name: 'ResourceTypesScope')
  final List<String> resourceTypesScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'TagKeyScope')
  final String tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  @_s.JsonKey(name: 'TagValueScope')
  final String tagValueScope;

  OrganizationManagedRuleMetadata({
    @_s.required this.ruleIdentifier,
    this.description,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceIdScope,
    this.resourceTypesScope,
    this.tagKeyScope,
    this.tagValueScope,
  });
  factory OrganizationManagedRuleMetadata.fromJson(Map<String, dynamic> json) =>
      _$OrganizationManagedRuleMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrganizationManagedRuleMetadataToJson(this);
}

enum OrganizationResourceDetailedStatus {
  @_s.JsonValue('CREATE_SUCCESSFUL')
  createSuccessful,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_SUCCESSFUL')
  deleteSuccessful,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('UPDATE_SUCCESSFUL')
  updateSuccessful,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization conformance pack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OrganizationResourceDetailedStatusFilters {
  /// The 12-digit account ID of the member account within an organization.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

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
  @_s.JsonKey(name: 'Status')
  final OrganizationResourceDetailedStatus status;

  OrganizationResourceDetailedStatusFilters({
    this.accountId,
    this.status,
  });
  Map<String, dynamic> toJson() =>
      _$OrganizationResourceDetailedStatusFiltersToJson(this);
}

enum OrganizationResourceStatus {
  @_s.JsonValue('CREATE_SUCCESSFUL')
  createSuccessful,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_SUCCESSFUL')
  deleteSuccessful,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('UPDATE_SUCCESSFUL')
  updateSuccessful,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

enum OrganizationRuleStatus {
  @_s.JsonValue('CREATE_SUCCESSFUL')
  createSuccessful,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_SUCCESSFUL')
  deleteSuccessful,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('UPDATE_SUCCESSFUL')
  updateSuccessful,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

enum Owner {
  @_s.JsonValue('CUSTOM_LAMBDA')
  customLambda,
  @_s.JsonValue('AWS')
  aws,
}

/// An object that represents the account ID and region of an aggregator account
/// that is requesting authorization but is not yet authorized.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingAggregationRequest {
  /// The 12-digit account ID of the account requesting to aggregate data.
  @_s.JsonKey(name: 'RequesterAccountId')
  final String requesterAccountId;

  /// The region requesting to aggregate data.
  @_s.JsonKey(name: 'RequesterAwsRegion')
  final String requesterAwsRegion;

  PendingAggregationRequest({
    this.requesterAccountId,
    this.requesterAwsRegion,
  });
  factory PendingAggregationRequest.fromJson(Map<String, dynamic> json) =>
      _$PendingAggregationRequestFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAggregationAuthorizationResponse {
  /// Returns an AggregationAuthorization object.
  @_s.JsonKey(name: 'AggregationAuthorization')
  final AggregationAuthorization aggregationAuthorization;

  PutAggregationAuthorizationResponse({
    this.aggregationAuthorization,
  });
  factory PutAggregationAuthorizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAggregationAuthorizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConfigurationAggregatorResponse {
  /// Returns a ConfigurationAggregator object.
  @_s.JsonKey(name: 'ConfigurationAggregator')
  final ConfigurationAggregator configurationAggregator;

  PutConfigurationAggregatorResponse({
    this.configurationAggregator,
  });
  factory PutConfigurationAggregatorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutConfigurationAggregatorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConformancePackResponse {
  /// ARN of the conformance pack.
  @_s.JsonKey(name: 'ConformancePackArn')
  final String conformancePackArn;

  PutConformancePackResponse({
    this.conformancePackArn,
  });
  factory PutConformancePackResponse.fromJson(Map<String, dynamic> json) =>
      _$PutConformancePackResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEvaluationsResponse {
  /// Requests that failed because of a client or server error.
  @_s.JsonKey(name: 'FailedEvaluations')
  final List<Evaluation> failedEvaluations;

  PutEvaluationsResponse({
    this.failedEvaluations,
  });
  factory PutEvaluationsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutEvaluationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutExternalEvaluationResponse {
  PutExternalEvaluationResponse();
  factory PutExternalEvaluationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutExternalEvaluationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutOrganizationConfigRuleResponse {
  /// The Amazon Resource Name (ARN) of an organization config rule.
  @_s.JsonKey(name: 'OrganizationConfigRuleArn')
  final String organizationConfigRuleArn;

  PutOrganizationConfigRuleResponse({
    this.organizationConfigRuleArn,
  });
  factory PutOrganizationConfigRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutOrganizationConfigRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutOrganizationConformancePackResponse {
  /// ARN of the organization conformance pack.
  @_s.JsonKey(name: 'OrganizationConformancePackArn')
  final String organizationConformancePackArn;

  PutOrganizationConformancePackResponse({
    this.organizationConformancePackArn,
  });
  factory PutOrganizationConformancePackResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutOrganizationConformancePackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRemediationConfigurationsResponse {
  /// Returns a list of failed remediation batch objects.
  @_s.JsonKey(name: 'FailedBatches')
  final List<FailedRemediationBatch> failedBatches;

  PutRemediationConfigurationsResponse({
    this.failedBatches,
  });
  factory PutRemediationConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutRemediationConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRemediationExceptionsResponse {
  /// Returns a list of failed remediation exceptions batch objects. Each object
  /// in the batch consists of a list of failed items and failure messages.
  @_s.JsonKey(name: 'FailedBatches')
  final List<FailedRemediationExceptionBatch> failedBatches;

  PutRemediationExceptionsResponse({
    this.failedBatches,
  });
  factory PutRemediationExceptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutRemediationExceptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRetentionConfigurationResponse {
  /// Returns a retention configuration object.
  @_s.JsonKey(name: 'RetentionConfiguration')
  final RetentionConfiguration retentionConfiguration;

  PutRetentionConfigurationResponse({
    this.retentionConfiguration,
  });
  factory PutRetentionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutRetentionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutStoredQueryResponse {
  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-id.
  @_s.JsonKey(name: 'QueryArn')
  final String queryArn;

  PutStoredQueryResponse({
    this.queryArn,
  });
  factory PutStoredQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$PutStoredQueryResponseFromJson(json);
}

/// Details about the query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryInfo {
  /// Returns a <code>FieldInfo</code> object.
  @_s.JsonKey(name: 'SelectFields')
  final List<FieldInfo> selectFields;

  QueryInfo({
    this.selectFields,
  });
  factory QueryInfo.fromJson(Map<String, dynamic> json) =>
      _$QueryInfoFromJson(json);
}

enum RecorderStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failure')
  failure,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'allSupported')
  final bool allSupported;

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
  @_s.JsonKey(name: 'includeGlobalResourceTypes')
  final bool includeGlobalResourceTypes;

  /// A comma-separated list that specifies the types of AWS resources for which
  /// AWS Config records configuration changes (for example,
  /// <code>AWS::EC2::Instance</code> or <code>AWS::CloudTrail::Trail</code>).
  ///
  /// Before you can set this option to <code>true</code>, you must set the
  /// <code>allSupported</code> option to <code>false</code>.
  ///
  /// If you set this option to <code>true</code>, when AWS Config adds support
  /// for a new type of resource, it will not record resources of that type unless
  /// you manually add that type to your recording group.
  ///
  /// For a list of valid <code>resourceTypes</code> values, see the
  /// <b>resourceType Value</b> column in <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources">Supported
  /// AWS Resource Types</a>.
  @_s.JsonKey(name: 'resourceTypes')
  final List<ResourceType> resourceTypes;

  RecordingGroup({
    this.allSupported,
    this.includeGlobalResourceTypes,
    this.resourceTypes,
  });
  factory RecordingGroup.fromJson(Map<String, dynamic> json) =>
      _$RecordingGroupFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingGroupToJson(this);
}

/// The relationship of the related resource to the main resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Relationship {
  /// The type of relationship with the related resource.
  @_s.JsonKey(name: 'relationshipName')
  final String relationshipName;

  /// The ID of the related resource (for example, <code>sg-xxxxxx</code>).
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The custom name of the related resource, if available.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The resource type of the related resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  Relationship({
    this.relationshipName,
    this.resourceId,
    this.resourceName,
    this.resourceType,
  });
  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);
}

/// An object that represents the details about the remediation configuration
/// that includes the remediation action, parameters, and data to execute the
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemediationConfiguration {
  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  /// Target ID is the name of the public document.
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  /// The type of the target. Target executes remediation. For example, SSM
  /// document.
  @_s.JsonKey(name: 'TargetType')
  final RemediationTargetType targetType;

  /// Amazon Resource Name (ARN) of remediation configuration.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The remediation is triggered automatically.
  @_s.JsonKey(name: 'Automatic')
  final bool automatic;

  /// Name of the service that owns the service linked rule, if applicable.
  @_s.JsonKey(name: 'CreatedByService')
  final String createdByService;

  /// An ExecutionControls object.
  @_s.JsonKey(name: 'ExecutionControls')
  final ExecutionControls executionControls;

  /// The maximum number of failed attempts for auto-remediation. If you do not
  /// select a number, the default is 5.
  ///
  /// For example, if you specify MaximumAutomaticAttempts as 5 with
  /// RetryAttemptSeconds as 50 seconds, AWS Config will put a
  /// RemediationException on your behalf for the failing resource after the 5th
  /// failed attempt within 50 seconds.
  @_s.JsonKey(name: 'MaximumAutomaticAttempts')
  final int maximumAutomaticAttempts;

  /// An object of the RemediationParameterValue.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, RemediationParameterValue> parameters;

  /// The type of a resource.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// Maximum time in seconds that AWS Config runs auto-remediation. If you do not
  /// select a number, the default is 60 seconds.
  ///
  /// For example, if you specify RetryAttemptSeconds as 50 seconds and
  /// MaximumAutomaticAttempts as 5, AWS Config will run auto-remediations 5 times
  /// within 50 seconds before throwing an exception.
  @_s.JsonKey(name: 'RetryAttemptSeconds')
  final int retryAttemptSeconds;

  /// Version of the target. For example, version of the SSM document.
  /// <note>
  /// If you make backward incompatible changes to the SSM document, you must call
  /// PutRemediationConfiguration API again to ensure the remediations can run.
  /// </note>
  @_s.JsonKey(name: 'TargetVersion')
  final String targetVersion;

  RemediationConfiguration({
    @_s.required this.configRuleName,
    @_s.required this.targetId,
    @_s.required this.targetType,
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
  factory RemediationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RemediationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RemediationConfigurationToJson(this);
}

/// An object that represents the details about the remediation exception. The
/// details include the rule name, an explanation of an exception, the time when
/// the exception will be deleted, the resource ID, and resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemediationException {
  /// The name of the AWS Config rule.
  @_s.JsonKey(name: 'ConfigRuleName')
  final String configRuleName;

  /// The ID of the resource (for example., sg-xxxxxx).
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of a resource.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The time when the remediation exception will be deleted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationTime')
  final DateTime expirationTime;

  /// An explanation of an remediation exception.
  @_s.JsonKey(name: 'Message')
  final String message;

  RemediationException({
    @_s.required this.configRuleName,
    @_s.required this.resourceId,
    @_s.required this.resourceType,
    this.expirationTime,
    this.message,
  });
  factory RemediationException.fromJson(Map<String, dynamic> json) =>
      _$RemediationExceptionFromJson(json);
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemediationExceptionResourceKey {
  /// The ID of the resource (for example., sg-xxxxxx).
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of a resource.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  RemediationExceptionResourceKey({
    this.resourceId,
    this.resourceType,
  });
  factory RemediationExceptionResourceKey.fromJson(Map<String, dynamic> json) =>
      _$RemediationExceptionResourceKeyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemediationExceptionResourceKeyToJson(this);
}

enum RemediationExecutionState {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// Provides details of the current status of the invoked remediation action for
/// that resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemediationExecutionStatus {
  /// Start time when the remediation was executed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InvocationTime')
  final DateTime invocationTime;

  /// The time when the remediation execution was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;
  @_s.JsonKey(name: 'ResourceKey')
  final ResourceKey resourceKey;

  /// ENUM of the values.
  @_s.JsonKey(name: 'State')
  final RemediationExecutionState state;

  /// Details of every step.
  @_s.JsonKey(name: 'StepDetails')
  final List<RemediationExecutionStep> stepDetails;

  RemediationExecutionStatus({
    this.invocationTime,
    this.lastUpdatedTime,
    this.resourceKey,
    this.state,
    this.stepDetails,
  });
  factory RemediationExecutionStatus.fromJson(Map<String, dynamic> json) =>
      _$RemediationExecutionStatusFromJson(json);
}

/// Name of the step from the SSM document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemediationExecutionStep {
  /// An error message if the step was interrupted during execution.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The details of the step.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The time when the step started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The valid status of the step.
  @_s.JsonKey(name: 'State')
  final RemediationExecutionStepState state;

  /// The time when the step stopped.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StopTime')
  final DateTime stopTime;

  RemediationExecutionStep({
    this.errorMessage,
    this.name,
    this.startTime,
    this.state,
    this.stopTime,
  });
  factory RemediationExecutionStep.fromJson(Map<String, dynamic> json) =>
      _$RemediationExecutionStepFromJson(json);
}

enum RemediationExecutionStepState {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('FAILED')
  failed,
}

/// The value is either a dynamic (resource) value or a static value. You must
/// select either a dynamic value or a static value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemediationParameterValue {
  /// The value is dynamic and changes at run-time.
  @_s.JsonKey(name: 'ResourceValue')
  final ResourceValue resourceValue;

  /// The value is static and does not change at run-time.
  @_s.JsonKey(name: 'StaticValue')
  final StaticValue staticValue;

  RemediationParameterValue({
    this.resourceValue,
    this.staticValue,
  });
  factory RemediationParameterValue.fromJson(Map<String, dynamic> json) =>
      _$RemediationParameterValueFromJson(json);

  Map<String, dynamic> toJson() => _$RemediationParameterValueToJson(this);
}

enum RemediationTargetType {
  @_s.JsonValue('SSM_DOCUMENT')
  ssmDocument,
}

/// An object that contains the resource type and the number of resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceCount {
  /// The number of resources.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The resource type (for example, <code>"AWS::EC2::Instance"</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  ResourceCount({
    this.count,
    this.resourceType,
  });
  factory ResourceCount.fromJson(Map<String, dynamic> json) =>
      _$ResourceCountFromJson(json);
}

/// Filters the resource count based on account ID, region, and resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceCountFilters {
  /// The 12-digit ID of the account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The region where the account is located.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The type of the AWS resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ResourceCountFilters({
    this.accountId,
    this.region,
    this.resourceType,
  });
  Map<String, dynamic> toJson() => _$ResourceCountFiltersToJson(this);
}

enum ResourceCountGroupKey {
  @_s.JsonValue('RESOURCE_TYPE')
  resourceType,
  @_s.JsonValue('ACCOUNT_ID')
  accountId,
  @_s.JsonValue('AWS_REGION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Filters the results by resource account ID, region, resource ID, and
/// resource name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceFilters {
  /// The 12-digit source account ID.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The source region.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The ID of the resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The name of the resource.
  @_s.JsonKey(name: 'ResourceName')
  final String resourceName;

  ResourceFilters({
    this.accountId,
    this.region,
    this.resourceId,
    this.resourceName,
  });
  Map<String, dynamic> toJson() => _$ResourceFiltersToJson(this);
}

/// The details that identify a resource that is discovered by AWS Config,
/// including the resource type, ID, and (if available) the custom resource
/// name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceIdentifier {
  /// The time that the resource was deleted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'resourceDeletionTime')
  final DateTime resourceDeletionTime;

  /// The ID of the resource (for example, <code>sg-xxxxxx</code>).
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The custom name of the resource (if available).
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The type of resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  ResourceIdentifier({
    this.resourceDeletionTime,
    this.resourceId,
    this.resourceName,
    this.resourceType,
  });
  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdentifierFromJson(json);
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceKey {
  /// The ID of the resource (for example., sg-xxxxxx).
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The resource type.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  ResourceKey({
    @_s.required this.resourceId,
    @_s.required this.resourceType,
  });
  factory ResourceKey.fromJson(Map<String, dynamic> json) =>
      _$ResourceKeyFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceKeyToJson(this);
}

enum ResourceType {
  @_s.JsonValue('AWS::EC2::CustomerGateway')
  awsEc2CustomerGateway,
  @_s.JsonValue('AWS::EC2::EIP')
  awsEc2Eip,
  @_s.JsonValue('AWS::EC2::Host')
  awsEc2Host,
  @_s.JsonValue('AWS::EC2::Instance')
  awsEc2Instance,
  @_s.JsonValue('AWS::EC2::InternetGateway')
  awsEc2InternetGateway,
  @_s.JsonValue('AWS::EC2::NetworkAcl')
  awsEc2NetworkAcl,
  @_s.JsonValue('AWS::EC2::NetworkInterface')
  awsEc2NetworkInterface,
  @_s.JsonValue('AWS::EC2::RouteTable')
  awsEc2RouteTable,
  @_s.JsonValue('AWS::EC2::SecurityGroup')
  awsEc2SecurityGroup,
  @_s.JsonValue('AWS::EC2::Subnet')
  awsEc2Subnet,
  @_s.JsonValue('AWS::CloudTrail::Trail')
  awsCloudTrailTrail,
  @_s.JsonValue('AWS::EC2::Volume')
  awsEc2Volume,
  @_s.JsonValue('AWS::EC2::VPC')
  awsEc2Vpc,
  @_s.JsonValue('AWS::EC2::VPNConnection')
  awsEc2VPNConnection,
  @_s.JsonValue('AWS::EC2::VPNGateway')
  awsEc2VPNGateway,
  @_s.JsonValue('AWS::EC2::RegisteredHAInstance')
  awsEc2RegisteredHAInstance,
  @_s.JsonValue('AWS::EC2::NatGateway')
  awsEc2NatGateway,
  @_s.JsonValue('AWS::EC2::EgressOnlyInternetGateway')
  awsEc2EgressOnlyInternetGateway,
  @_s.JsonValue('AWS::EC2::VPCEndpoint')
  awsEc2VPCEndpoint,
  @_s.JsonValue('AWS::EC2::VPCEndpointService')
  awsEc2VPCEndpointService,
  @_s.JsonValue('AWS::EC2::FlowLog')
  awsEc2FlowLog,
  @_s.JsonValue('AWS::EC2::VPCPeeringConnection')
  awsEc2VPCPeeringConnection,
  @_s.JsonValue('AWS::Elasticsearch::Domain')
  awsElasticsearchDomain,
  @_s.JsonValue('AWS::IAM::Group')
  awsIamGroup,
  @_s.JsonValue('AWS::IAM::Policy')
  awsIamPolicy,
  @_s.JsonValue('AWS::IAM::Role')
  awsIamRole,
  @_s.JsonValue('AWS::IAM::User')
  awsIamUser,
  @_s.JsonValue('AWS::ElasticLoadBalancingV2::LoadBalancer')
  awsElasticLoadBalancingV2LoadBalancer,
  @_s.JsonValue('AWS::ACM::Certificate')
  awsAcmCertificate,
  @_s.JsonValue('AWS::RDS::DBInstance')
  awsRdsDBInstance,
  @_s.JsonValue('AWS::RDS::DBSubnetGroup')
  awsRdsDBSubnetGroup,
  @_s.JsonValue('AWS::RDS::DBSecurityGroup')
  awsRdsDBSecurityGroup,
  @_s.JsonValue('AWS::RDS::DBSnapshot')
  awsRdsDBSnapshot,
  @_s.JsonValue('AWS::RDS::DBCluster')
  awsRdsDBCluster,
  @_s.JsonValue('AWS::RDS::DBClusterSnapshot')
  awsRdsDBClusterSnapshot,
  @_s.JsonValue('AWS::RDS::EventSubscription')
  awsRdsEventSubscription,
  @_s.JsonValue('AWS::S3::Bucket')
  awsS3Bucket,
  @_s.JsonValue('AWS::S3::AccountPublicAccessBlock')
  awsS3AccountPublicAccessBlock,
  @_s.JsonValue('AWS::Redshift::Cluster')
  awsRedshiftCluster,
  @_s.JsonValue('AWS::Redshift::ClusterSnapshot')
  awsRedshiftClusterSnapshot,
  @_s.JsonValue('AWS::Redshift::ClusterParameterGroup')
  awsRedshiftClusterParameterGroup,
  @_s.JsonValue('AWS::Redshift::ClusterSecurityGroup')
  awsRedshiftClusterSecurityGroup,
  @_s.JsonValue('AWS::Redshift::ClusterSubnetGroup')
  awsRedshiftClusterSubnetGroup,
  @_s.JsonValue('AWS::Redshift::EventSubscription')
  awsRedshiftEventSubscription,
  @_s.JsonValue('AWS::SSM::ManagedInstanceInventory')
  awsSsmManagedInstanceInventory,
  @_s.JsonValue('AWS::CloudWatch::Alarm')
  awsCloudWatchAlarm,
  @_s.JsonValue('AWS::CloudFormation::Stack')
  awsCloudFormationStack,
  @_s.JsonValue('AWS::ElasticLoadBalancing::LoadBalancer')
  awsElasticLoadBalancingLoadBalancer,
  @_s.JsonValue('AWS::AutoScaling::AutoScalingGroup')
  awsAutoScalingAutoScalingGroup,
  @_s.JsonValue('AWS::AutoScaling::LaunchConfiguration')
  awsAutoScalingLaunchConfiguration,
  @_s.JsonValue('AWS::AutoScaling::ScalingPolicy')
  awsAutoScalingScalingPolicy,
  @_s.JsonValue('AWS::AutoScaling::ScheduledAction')
  awsAutoScalingScheduledAction,
  @_s.JsonValue('AWS::DynamoDB::Table')
  awsDynamoDBTable,
  @_s.JsonValue('AWS::CodeBuild::Project')
  awsCodeBuildProject,
  @_s.JsonValue('AWS::WAF::RateBasedRule')
  awsWafRateBasedRule,
  @_s.JsonValue('AWS::WAF::Rule')
  awsWafRule,
  @_s.JsonValue('AWS::WAF::RuleGroup')
  awsWafRuleGroup,
  @_s.JsonValue('AWS::WAF::WebACL')
  awsWafWebACL,
  @_s.JsonValue('AWS::WAFRegional::RateBasedRule')
  awsWAFRegionalRateBasedRule,
  @_s.JsonValue('AWS::WAFRegional::Rule')
  awsWAFRegionalRule,
  @_s.JsonValue('AWS::WAFRegional::RuleGroup')
  awsWAFRegionalRuleGroup,
  @_s.JsonValue('AWS::WAFRegional::WebACL')
  awsWAFRegionalWebACL,
  @_s.JsonValue('AWS::CloudFront::Distribution')
  awsCloudFrontDistribution,
  @_s.JsonValue('AWS::CloudFront::StreamingDistribution')
  awsCloudFrontStreamingDistribution,
  @_s.JsonValue('AWS::Lambda::Function')
  awsLambdaFunction,
  @_s.JsonValue('AWS::NetworkFirewall::Firewall')
  awsNetworkFirewallFirewall,
  @_s.JsonValue('AWS::NetworkFirewall::FirewallPolicy')
  awsNetworkFirewallFirewallPolicy,
  @_s.JsonValue('AWS::NetworkFirewall::RuleGroup')
  awsNetworkFirewallRuleGroup,
  @_s.JsonValue('AWS::ElasticBeanstalk::Application')
  awsElasticBeanstalkApplication,
  @_s.JsonValue('AWS::ElasticBeanstalk::ApplicationVersion')
  awsElasticBeanstalkApplicationVersion,
  @_s.JsonValue('AWS::ElasticBeanstalk::Environment')
  awsElasticBeanstalkEnvironment,
  @_s.JsonValue('AWS::WAFv2::WebACL')
  awsWAFv2WebACL,
  @_s.JsonValue('AWS::WAFv2::RuleGroup')
  awsWAFv2RuleGroup,
  @_s.JsonValue('AWS::WAFv2::IPSet')
  awsWAFv2IPSet,
  @_s.JsonValue('AWS::WAFv2::RegexPatternSet')
  awsWAFv2RegexPatternSet,
  @_s.JsonValue('AWS::WAFv2::ManagedRuleSet')
  awsWAFv2ManagedRuleSet,
  @_s.JsonValue('AWS::XRay::EncryptionConfig')
  awsXRayEncryptionConfig,
  @_s.JsonValue('AWS::SSM::AssociationCompliance')
  awsSsmAssociationCompliance,
  @_s.JsonValue('AWS::SSM::PatchCompliance')
  awsSsmPatchCompliance,
  @_s.JsonValue('AWS::Shield::Protection')
  awsShieldProtection,
  @_s.JsonValue('AWS::ShieldRegional::Protection')
  awsShieldRegionalProtection,
  @_s.JsonValue('AWS::Config::ResourceCompliance')
  awsConfigResourceCompliance,
  @_s.JsonValue('AWS::ApiGateway::Stage')
  awsApiGatewayStage,
  @_s.JsonValue('AWS::ApiGateway::RestApi')
  awsApiGatewayRestApi,
  @_s.JsonValue('AWS::ApiGatewayV2::Stage')
  awsApiGatewayV2Stage,
  @_s.JsonValue('AWS::ApiGatewayV2::Api')
  awsApiGatewayV2Api,
  @_s.JsonValue('AWS::CodePipeline::Pipeline')
  awsCodePipelinePipeline,
  @_s.JsonValue('AWS::ServiceCatalog::CloudFormationProvisionedProduct')
  awsServiceCatalogCloudFormationProvisionedProduct,
  @_s.JsonValue('AWS::ServiceCatalog::CloudFormationProduct')
  awsServiceCatalogCloudFormationProduct,
  @_s.JsonValue('AWS::ServiceCatalog::Portfolio')
  awsServiceCatalogPortfolio,
  @_s.JsonValue('AWS::SQS::Queue')
  awsSqsQueue,
  @_s.JsonValue('AWS::KMS::Key')
  awsKmsKey,
  @_s.JsonValue('AWS::QLDB::Ledger')
  awsQldbLedger,
  @_s.JsonValue('AWS::SecretsManager::Secret')
  awsSecretsManagerSecret,
  @_s.JsonValue('AWS::SNS::Topic')
  awsSnsTopic,
  @_s.JsonValue('AWS::SSM::FileData')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The dynamic value of the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceValue {
  /// The value is a resource ID.
  @_s.JsonKey(name: 'Value')
  final ResourceValueType value;

  ResourceValue({
    @_s.required this.value,
  });
  factory ResourceValue.fromJson(Map<String, dynamic> json) =>
      _$ResourceValueFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceValueToJson(this);
}

enum ResourceValueType {
  @_s.JsonValue('RESOURCE_ID')
  resourceId,
}

/// An object with the name of the retention configuration and the retention
/// period in days. The object stores the configuration for data retention in
/// AWS Config.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetentionConfiguration {
  /// The name of the retention configuration object.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Number of days AWS Config stores your historical information.
  /// <note>
  /// Currently, only applicable to the configuration item history.
  /// </note>
  @_s.JsonKey(name: 'RetentionPeriodInDays')
  final int retentionPeriodInDays;

  RetentionConfiguration({
    @_s.required this.name,
    @_s.required this.retentionPeriodInDays,
  });
  factory RetentionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RetentionConfigurationFromJson(json);
}

/// Defines which resources trigger an evaluation for an AWS Config rule. The
/// scope can include one or more resource types, a combination of a tag key and
/// value, or a combination of one resource type and one resource ID. Specify a
/// scope to constrain which resources trigger an evaluation for a rule.
/// Otherwise, evaluations for the rule are triggered when any resource in your
/// recording group changes in configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scope {
  /// The ID of the only AWS resource that you want to trigger an evaluation for
  /// the rule. If you specify a resource ID, you must specify one resource type
  /// for <code>ComplianceResourceTypes</code>.
  @_s.JsonKey(name: 'ComplianceResourceId')
  final String complianceResourceId;

  /// The resource types of only those AWS resources that you want to trigger an
  /// evaluation for the rule. You can only specify one type if you also specify a
  /// resource ID for <code>ComplianceResourceId</code>.
  @_s.JsonKey(name: 'ComplianceResourceTypes')
  final List<String> complianceResourceTypes;

  /// The tag key that is applied to only those AWS resources that you want to
  /// trigger an evaluation for the rule.
  @_s.JsonKey(name: 'TagKey')
  final String tagKey;

  /// The tag value applied to only those AWS resources that you want to trigger
  /// an evaluation for the rule. If you specify a value for
  /// <code>TagValue</code>, you must also specify a value for
  /// <code>TagKey</code>.
  @_s.JsonKey(name: 'TagValue')
  final String tagValue;

  Scope({
    this.complianceResourceId,
    this.complianceResourceTypes,
    this.tagKey,
    this.tagValue,
  });
  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);

  Map<String, dynamic> toJson() => _$ScopeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SelectAggregateResourceConfigResponse {
  /// The nextToken string returned in a previous request that you use to request
  /// the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'QueryInfo')
  final QueryInfo queryInfo;

  /// Returns the results for the SQL query.
  @_s.JsonKey(name: 'Results')
  final List<String> results;

  SelectAggregateResourceConfigResponse({
    this.nextToken,
    this.queryInfo,
    this.results,
  });
  factory SelectAggregateResourceConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SelectAggregateResourceConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SelectResourceConfigResponse {
  /// The <code>nextToken</code> string returned in a previous request that you
  /// use to request the next page of results in a paginated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns the <code>QueryInfo</code> object.
  @_s.JsonKey(name: 'QueryInfo')
  final QueryInfo queryInfo;

  /// Returns the results for the SQL query.
  @_s.JsonKey(name: 'Results')
  final List<String> results;

  SelectResourceConfigResponse({
    this.nextToken,
    this.queryInfo,
    this.results,
  });
  factory SelectResourceConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$SelectResourceConfigResponseFromJson(json);
}

/// Provides the AWS Config rule owner (AWS or customer), the rule identifier,
/// and the events that trigger the evaluation of your AWS resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Source {
  /// Indicates whether AWS or the customer owns and manages the AWS Config rule.
  @_s.JsonKey(name: 'Owner')
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
  @_s.JsonKey(name: 'SourceIdentifier')
  final String sourceIdentifier;

  /// Provides the source and type of the event that causes AWS Config to evaluate
  /// your AWS resources.
  @_s.JsonKey(name: 'SourceDetails')
  final List<SourceDetail> sourceDetails;

  Source({
    @_s.required this.owner,
    @_s.required this.sourceIdentifier,
    this.sourceDetails,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

/// Provides the source and the message types that trigger AWS Config to
/// evaluate your AWS resources against a rule. It also provides the frequency
/// with which you want AWS Config to run evaluations for the rule if the
/// trigger type is periodic. You can specify the parameter values for
/// <code>SourceDetail</code> only for custom rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceDetail {
  /// The source of the event, such as an AWS service, that triggers AWS Config to
  /// evaluate your AWS resources.
  @_s.JsonKey(name: 'EventSource')
  final EventSource eventSource;

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
  @_s.JsonKey(name: 'MaximumExecutionFrequency')
  final MaximumExecutionFrequency maximumExecutionFrequency;

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
  @_s.JsonKey(name: 'MessageType')
  final MessageType messageType;

  SourceDetail({
    this.eventSource,
    this.maximumExecutionFrequency,
    this.messageType,
  });
  factory SourceDetail.fromJson(Map<String, dynamic> json) =>
      _$SourceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDetailToJson(this);
}

/// AWS Systems Manager (SSM) specific remediation controls.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SsmControls {
  /// The maximum percentage of remediation actions allowed to run in parallel on
  /// the non-compliant resources for that specific rule. You can specify a
  /// percentage, such as 10%. The default value is 10.
  @_s.JsonKey(name: 'ConcurrentExecutionRatePercentage')
  final int concurrentExecutionRatePercentage;

  /// The percentage of errors that are allowed before SSM stops running
  /// automations on non-compliant resources for that specific rule. You can
  /// specify a percentage of errors, for example 10%. If you do not specifiy a
  /// percentage, the default is 50%. For example, if you set the ErrorPercentage
  /// to 40% for 10 non-compliant resources, then SSM stops running the
  /// automations when the fifth error is received.
  @_s.JsonKey(name: 'ErrorPercentage')
  final int errorPercentage;

  SsmControls({
    this.concurrentExecutionRatePercentage,
    this.errorPercentage,
  });
  factory SsmControls.fromJson(Map<String, dynamic> json) =>
      _$SsmControlsFromJson(json);

  Map<String, dynamic> toJson() => _$SsmControlsToJson(this);
}

/// The output when you start the evaluation for the specified AWS Config rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartConfigRulesEvaluationResponse {
  StartConfigRulesEvaluationResponse();
  factory StartConfigRulesEvaluationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartConfigRulesEvaluationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartRemediationExecutionResponse {
  /// For resources that have failed to start execution, the API returns a
  /// resource key object.
  @_s.JsonKey(name: 'FailedItems')
  final List<ResourceKey> failedItems;

  /// Returns a failure message. For example, the resource is already compliant.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  StartRemediationExecutionResponse({
    this.failedItems,
    this.failureMessage,
  });
  factory StartRemediationExecutionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartRemediationExecutionResponseFromJson(json);
}

/// The static value of the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StaticValue {
  /// A list of values. For example, the ARN of the assumed role.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  StaticValue({
    @_s.required this.values,
  });
  factory StaticValue.fromJson(Map<String, dynamic> json) =>
      _$StaticValueFromJson(json);

  Map<String, dynamic> toJson() => _$StaticValueToJson(this);
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization config rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StatusDetailFilters {
  /// The 12-digit account ID of the member account within an organization.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

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
  @_s.JsonKey(name: 'MemberAccountRuleStatus')
  final MemberAccountRuleStatus memberAccountRuleStatus;

  StatusDetailFilters({
    this.accountId,
    this.memberAccountRuleStatus,
  });
  Map<String, dynamic> toJson() => _$StatusDetailFiltersToJson(this);
}

/// Provides the details of a stored query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StoredQuery {
  /// The name of the query.
  @_s.JsonKey(name: 'QueryName')
  final String queryName;

  /// A unique description for the query.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The expression of the query. For example, <code>SELECT resourceId,
  /// resourceType,
  /// supplementaryConfiguration.BucketVersioningConfiguration.status WHERE
  /// resourceType = 'AWS::S3::Bucket' AND
  /// supplementaryConfiguration.BucketVersioningConfiguration.status =
  /// 'Off'.</code>
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-id.
  @_s.JsonKey(name: 'QueryArn')
  final String queryArn;

  /// The ID of the query.
  @_s.JsonKey(name: 'QueryId')
  final String queryId;

  StoredQuery({
    @_s.required this.queryName,
    this.description,
    this.expression,
    this.queryArn,
    this.queryId,
  });
  factory StoredQuery.fromJson(Map<String, dynamic> json) =>
      _$StoredQueryFromJson(json);

  Map<String, dynamic> toJson() => _$StoredQueryToJson(this);
}

/// Returns details of a specific query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StoredQueryMetadata {
  /// Amazon Resource Name (ARN) of the query. For example,
  /// arn:partition:service:region:account-id:resource-type/resource-id.
  @_s.JsonKey(name: 'QueryArn')
  final String queryArn;

  /// The ID of the query.
  @_s.JsonKey(name: 'QueryId')
  final String queryId;

  /// The name of the query.
  @_s.JsonKey(name: 'QueryName')
  final String queryName;

  /// A unique description for the query.
  @_s.JsonKey(name: 'Description')
  final String description;

  StoredQueryMetadata({
    @_s.required this.queryArn,
    @_s.required this.queryId,
    @_s.required this.queryName,
    this.description,
  });
  factory StoredQueryMetadata.fromJson(Map<String, dynamic> json) =>
      _$StoredQueryMetadataFromJson(json);
}

/// The tags for the resource. The metadata that you apply to a resource to help
/// you categorize and organize them. Each tag consists of a key and an optional
/// value, both of which you define. Tag keys can have a maximum character
/// length of 128 characters, and tag values can have a maximum length of 256
/// characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key).
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

class ConformancePackTemplateValidationException
    extends _s.GenericAwsException {
  ConformancePackTemplateValidationException({String type, String message})
      : super(
            type: type,
            code: 'ConformancePackTemplateValidationException',
            message: message);
}

class InsufficientDeliveryPolicyException extends _s.GenericAwsException {
  InsufficientDeliveryPolicyException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientDeliveryPolicyException',
            message: message);
}

class InsufficientPermissionsException extends _s.GenericAwsException {
  InsufficientPermissionsException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientPermissionsException',
            message: message);
}

class InvalidConfigurationRecorderNameException extends _s.GenericAwsException {
  InvalidConfigurationRecorderNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConfigurationRecorderNameException',
            message: message);
}

class InvalidDeliveryChannelNameException extends _s.GenericAwsException {
  InvalidDeliveryChannelNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeliveryChannelNameException',
            message: message);
}

class InvalidExpressionException extends _s.GenericAwsException {
  InvalidExpressionException({String type, String message})
      : super(type: type, code: 'InvalidExpressionException', message: message);
}

class InvalidLimitException extends _s.GenericAwsException {
  InvalidLimitException({String type, String message})
      : super(type: type, code: 'InvalidLimitException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRecordingGroupException extends _s.GenericAwsException {
  InvalidRecordingGroupException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRecordingGroupException',
            message: message);
}

class InvalidResultTokenException extends _s.GenericAwsException {
  InvalidResultTokenException({String type, String message})
      : super(
            type: type, code: 'InvalidResultTokenException', message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String type, String message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class InvalidS3KeyPrefixException extends _s.GenericAwsException {
  InvalidS3KeyPrefixException({String type, String message})
      : super(
            type: type, code: 'InvalidS3KeyPrefixException', message: message);
}

class InvalidSNSTopicARNException extends _s.GenericAwsException {
  InvalidSNSTopicARNException({String type, String message})
      : super(
            type: type, code: 'InvalidSNSTopicARNException', message: message);
}

class InvalidTimeRangeException extends _s.GenericAwsException {
  InvalidTimeRangeException({String type, String message})
      : super(type: type, code: 'InvalidTimeRangeException', message: message);
}

class LastDeliveryChannelDeleteFailedException extends _s.GenericAwsException {
  LastDeliveryChannelDeleteFailedException({String type, String message})
      : super(
            type: type,
            code: 'LastDeliveryChannelDeleteFailedException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MaxActiveResourcesExceededException extends _s.GenericAwsException {
  MaxActiveResourcesExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxActiveResourcesExceededException',
            message: message);
}

class MaxNumberOfConfigRulesExceededException extends _s.GenericAwsException {
  MaxNumberOfConfigRulesExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfConfigRulesExceededException',
            message: message);
}

class MaxNumberOfConfigurationRecordersExceededException
    extends _s.GenericAwsException {
  MaxNumberOfConfigurationRecordersExceededException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfConfigurationRecordersExceededException',
            message: message);
}

class MaxNumberOfConformancePacksExceededException
    extends _s.GenericAwsException {
  MaxNumberOfConformancePacksExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfConformancePacksExceededException',
            message: message);
}

class MaxNumberOfDeliveryChannelsExceededException
    extends _s.GenericAwsException {
  MaxNumberOfDeliveryChannelsExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfDeliveryChannelsExceededException',
            message: message);
}

class MaxNumberOfOrganizationConfigRulesExceededException
    extends _s.GenericAwsException {
  MaxNumberOfOrganizationConfigRulesExceededException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfOrganizationConfigRulesExceededException',
            message: message);
}

class MaxNumberOfOrganizationConformancePacksExceededException
    extends _s.GenericAwsException {
  MaxNumberOfOrganizationConformancePacksExceededException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfOrganizationConformancePacksExceededException',
            message: message);
}

class MaxNumberOfRetentionConfigurationsExceededException
    extends _s.GenericAwsException {
  MaxNumberOfRetentionConfigurationsExceededException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaxNumberOfRetentionConfigurationsExceededException',
            message: message);
}

class NoAvailableConfigurationRecorderException extends _s.GenericAwsException {
  NoAvailableConfigurationRecorderException({String type, String message})
      : super(
            type: type,
            code: 'NoAvailableConfigurationRecorderException',
            message: message);
}

class NoAvailableDeliveryChannelException extends _s.GenericAwsException {
  NoAvailableDeliveryChannelException({String type, String message})
      : super(
            type: type,
            code: 'NoAvailableDeliveryChannelException',
            message: message);
}

class NoAvailableOrganizationException extends _s.GenericAwsException {
  NoAvailableOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'NoAvailableOrganizationException',
            message: message);
}

class NoRunningConfigurationRecorderException extends _s.GenericAwsException {
  NoRunningConfigurationRecorderException({String type, String message})
      : super(
            type: type,
            code: 'NoRunningConfigurationRecorderException',
            message: message);
}

class NoSuchBucketException extends _s.GenericAwsException {
  NoSuchBucketException({String type, String message})
      : super(type: type, code: 'NoSuchBucketException', message: message);
}

class NoSuchConfigRuleException extends _s.GenericAwsException {
  NoSuchConfigRuleException({String type, String message})
      : super(type: type, code: 'NoSuchConfigRuleException', message: message);
}

class NoSuchConfigRuleInConformancePackException
    extends _s.GenericAwsException {
  NoSuchConfigRuleInConformancePackException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchConfigRuleInConformancePackException',
            message: message);
}

class NoSuchConfigurationAggregatorException extends _s.GenericAwsException {
  NoSuchConfigurationAggregatorException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchConfigurationAggregatorException',
            message: message);
}

class NoSuchConfigurationRecorderException extends _s.GenericAwsException {
  NoSuchConfigurationRecorderException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchConfigurationRecorderException',
            message: message);
}

class NoSuchConformancePackException extends _s.GenericAwsException {
  NoSuchConformancePackException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchConformancePackException',
            message: message);
}

class NoSuchDeliveryChannelException extends _s.GenericAwsException {
  NoSuchDeliveryChannelException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchDeliveryChannelException',
            message: message);
}

class NoSuchOrganizationConfigRuleException extends _s.GenericAwsException {
  NoSuchOrganizationConfigRuleException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchOrganizationConfigRuleException',
            message: message);
}

class NoSuchOrganizationConformancePackException
    extends _s.GenericAwsException {
  NoSuchOrganizationConformancePackException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchOrganizationConformancePackException',
            message: message);
}

class NoSuchRemediationConfigurationException extends _s.GenericAwsException {
  NoSuchRemediationConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchRemediationConfigurationException',
            message: message);
}

class NoSuchRemediationExceptionException extends _s.GenericAwsException {
  NoSuchRemediationExceptionException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchRemediationExceptionException',
            message: message);
}

class NoSuchRetentionConfigurationException extends _s.GenericAwsException {
  NoSuchRetentionConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'NoSuchRetentionConfigurationException',
            message: message);
}

class OrganizationAccessDeniedException extends _s.GenericAwsException {
  OrganizationAccessDeniedException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationAccessDeniedException',
            message: message);
}

class OrganizationAllFeaturesNotEnabledException
    extends _s.GenericAwsException {
  OrganizationAllFeaturesNotEnabledException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationAllFeaturesNotEnabledException',
            message: message);
}

class OrganizationConformancePackTemplateValidationException
    extends _s.GenericAwsException {
  OrganizationConformancePackTemplateValidationException(
      {String type, String message})
      : super(
            type: type,
            code: 'OrganizationConformancePackTemplateValidationException',
            message: message);
}

class OversizedConfigurationItemException extends _s.GenericAwsException {
  OversizedConfigurationItemException({String type, String message})
      : super(
            type: type,
            code: 'OversizedConfigurationItemException',
            message: message);
}

class RemediationInProgressException extends _s.GenericAwsException {
  RemediationInProgressException({String type, String message})
      : super(
            type: type,
            code: 'RemediationInProgressException',
            message: message);
}

class ResourceConcurrentModificationException extends _s.GenericAwsException {
  ResourceConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ResourceConcurrentModificationException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotDiscoveredException extends _s.GenericAwsException {
  ResourceNotDiscoveredException({String type, String message})
      : super(
            type: type,
            code: 'ResourceNotDiscoveredException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
