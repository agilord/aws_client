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

/// You can use Amazon CloudWatch Observability Admin to discover and understand
/// the state of telemetry configuration in CloudWatch for your Amazon Web
/// Services Organization or account. This simplifies the process of auditing
/// your telemetry collection configurations across multiple resource types
/// within your Amazon Web Services Organization or account. By providing a
/// consolidated view, it allows you to easily review and manage telemetry
/// settings, helping you ensure proper monitoring and data collection across
/// your Amazon Web Services environment. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/telemetry-config-cloudwatch.html">Auditing
/// CloudWatch telemetry conﬁgurations</a> in the CloudWatch User Guide.
///
/// For information on the permissions you need to use this API, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/auth-and-access-control-cw.html">Identity
/// and access management for Amazon CloudWatch</a> in the CloudWatch User
/// Guide.
class ObservabilityAdmin {
  final _s.RestJsonProtocol _protocol;
  ObservabilityAdmin({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'observabilityadmin',
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

  /// Creates a centralization rule that applies across an Amazon Web Services
  /// Organization. This operation can only be called by the organization's
  /// management account or a delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The configuration details for the organization-wide centralization rule,
  /// including the source configuration and the destination configuration to
  /// centralize telemetry data across the organization.
  ///
  /// Parameter [ruleName] :
  /// A unique name for the organization-wide centralization rule being created.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the organization telemetry rule
  /// resource for categorization and management purposes.
  Future<CreateCentralizationRuleForOrganizationOutput>
      createCentralizationRuleForOrganization({
    required CentralizationRule rule,
    required String ruleName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleName': ruleName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateCentralizationRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCentralizationRuleForOrganizationOutput.fromJson(response);
  }

  /// Creates an integration between CloudWatch and S3 Tables for analytics.
  /// This integration enables querying CloudWatch telemetry data using
  /// analytics engines like Amazon Athena, Amazon Redshift, and Apache Spark.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [encryption] :
  /// The encryption configuration for the S3 Table integration, including the
  /// encryption algorithm and KMS key settings.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants permissions for
  /// the S3 Table integration to access necessary resources.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the S3 Table integration resource
  /// for categorization and management purposes.
  Future<CreateS3TableIntegrationOutput> createS3TableIntegration({
    required Encryption encryption,
    required String roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Encryption': encryption,
      'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateS3TableIntegration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateS3TableIntegrationOutput.fromJson(response);
  }

  /// Creates a telemetry rule that defines how telemetry should be configured
  /// for Amazon Web Services resources in your account. The rule specifies
  /// which resources should have telemetry enabled and how that telemetry data
  /// should be collected based on resource type, telemetry type, and selection
  /// criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The configuration details for the telemetry rule, including the resource
  /// type, telemetry type, destination configuration, and selection criteria
  /// for which resources the rule applies to.
  ///
  /// Parameter [ruleName] :
  /// A unique name for the telemetry rule being created.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the telemetry rule resource for
  /// categorization and management purposes.
  Future<CreateTelemetryRuleOutput> createTelemetryRule({
    required TelemetryRule rule,
    required String ruleName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleName': ruleName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateTelemetryRule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTelemetryRuleOutput.fromJson(response);
  }

  /// Creates a telemetry rule that applies across an Amazon Web Services
  /// Organization. This operation can only be called by the organization's
  /// management account or a delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The configuration details for the organization-wide telemetry rule,
  /// including the resource type, telemetry type, destination configuration,
  /// and selection criteria for which resources the rule applies to across the
  /// organization.
  ///
  /// Parameter [ruleName] :
  /// A unique name for the organization-wide telemetry rule being created.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the organization telemetry rule
  /// resource for categorization and management purposes.
  Future<CreateTelemetryRuleForOrganizationOutput>
      createTelemetryRuleForOrganization({
    required TelemetryRule rule,
    required String ruleName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleName': ruleName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateTelemetryRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTelemetryRuleForOrganizationOutput.fromJson(response);
  }

  /// Deletes an organization-wide centralization rule. This operation can only
  /// be called by the organization's management account or a delegated
  /// administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization centralization rule to
  /// delete.
  Future<void> deleteCentralizationRuleForOrganization({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteCentralizationRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an S3 Table integration and its associated data. This operation
  /// removes the connection between CloudWatch Observability Admin and S3
  /// Tables.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidStateException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the S3 Table integration to delete.
  Future<void> deleteS3TableIntegration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteS3TableIntegration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a telemetry rule from your account. Any telemetry configurations
  /// previously created by the rule will remain but no new resources will be
  /// configured by this rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the telemetry rule to delete.
  Future<void> deleteTelemetryRule({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteTelemetryRule',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an organization-wide telemetry rule. This operation can only be
  /// called by the organization's management account or a delegated
  /// administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization telemetry rule to delete.
  Future<void> deleteTelemetryRuleForOrganization({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteTelemetryRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the details of a specific organization centralization rule. This
  /// operation can only be called by the organization's management account or a
  /// delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization centralization rule to
  /// retrieve.
  Future<GetCentralizationRuleForOrganizationOutput>
      getCentralizationRuleForOrganization({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetCentralizationRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return GetCentralizationRuleForOrganizationOutput.fromJson(response);
  }

  /// Retrieves information about a specific S3 Table integration, including its
  /// configuration, status, and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the S3 Table integration to retrieve.
  Future<GetS3TableIntegrationOutput> getS3TableIntegration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetS3TableIntegration',
      exceptionFnMap: _exceptionFns,
    );
    return GetS3TableIntegrationOutput.fromJson(response);
  }

  /// Returns the current status of the resource tags for telemetry feature,
  /// which enhances telemetry data with additional resource metadata from
  /// Resource Explorer.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  Future<GetTelemetryEnrichmentStatusOutput>
      getTelemetryEnrichmentStatus() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetTelemetryEnrichmentStatus',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryEnrichmentStatusOutput.fromJson(response);
  }

  /// Returns the current onboarding status of the telemetry config feature,
  /// including the status of the feature and reason the feature failed to start
  /// or stop.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  Future<GetTelemetryEvaluationStatusOutput>
      getTelemetryEvaluationStatus() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetTelemetryEvaluationStatus',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryEvaluationStatusOutput.fromJson(response);
  }

  /// This returns the onboarding status of the telemetry configuration feature
  /// for the organization. It can only be called by a Management Account of an
  /// Amazon Web Services Organization or an assigned Delegated Admin Account of
  /// Amazon CloudWatch telemetry config.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  Future<GetTelemetryEvaluationStatusForOrganizationOutput>
      getTelemetryEvaluationStatusForOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetTelemetryEvaluationStatusForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryEvaluationStatusForOrganizationOutput.fromJson(response);
  }

  /// Retrieves the details of a specific telemetry rule in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the telemetry rule to retrieve.
  Future<GetTelemetryRuleOutput> getTelemetryRule({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTelemetryRule',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryRuleOutput.fromJson(response);
  }

  /// Retrieves the details of a specific organization telemetry rule. This
  /// operation can only be called by the organization's management account or a
  /// delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization telemetry rule to
  /// retrieve.
  Future<GetTelemetryRuleForOrganizationOutput>
      getTelemetryRuleForOrganization({
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTelemetryRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryRuleForOrganizationOutput.fromJson(response);
  }

  /// Lists all centralization rules in your organization. This operation can
  /// only be called by the organization's management account or a delegated
  /// administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allRegions] :
  /// A flag determining whether to return organization centralization rules
  /// from all regions or only the current region.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of organization centralization rules to return in a
  /// single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. A previous call generates this
  /// token.
  ///
  /// Parameter [ruleNamePrefix] :
  /// A string to filter organization centralization rules whose names begin
  /// with the specified prefix.
  Future<ListCentralizationRulesForOrganizationOutput>
      listCentralizationRulesForOrganization({
    bool? allRegions,
    int? maxResults,
    String? nextToken,
    String? ruleNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (allRegions != null) 'AllRegions': allRegions,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleNamePrefix != null) 'RuleNamePrefix': ruleNamePrefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListCentralizationRulesForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return ListCentralizationRulesForOrganizationOutput.fromJson(response);
  }

  /// Returns a list of telemetry configurations for Amazon Web Services
  /// resources supported by telemetry config. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/telemetry-config-cloudwatch.html">Auditing
  /// CloudWatch telemetry configurations</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// A number field used to limit the number of results within the returned
  /// list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. A previous call generates
  /// this token.
  ///
  /// Parameter [resourceIdentifierPrefix] :
  /// A string used to filter resources which have a
  /// <code>ResourceIdentifier</code> starting with the
  /// <code>ResourceIdentifierPrefix</code>.
  ///
  /// Parameter [resourceTags] :
  /// A key-value pair to filter resources based on tags associated with the
  /// resource. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html">What
  /// are tags?</a>
  ///
  /// Parameter [resourceTypes] :
  /// A list of resource types used to filter resources supported by telemetry
  /// config. If this parameter is provided, the resources will be returned in
  /// the same order used in the request.
  ///
  /// Parameter [telemetryConfigurationState] :
  /// A key-value pair to filter resources based on the telemetry type and the
  /// state of the telemetry configuration. The key is the telemetry type and
  /// the value is the state.
  Future<ListResourceTelemetryOutput> listResourceTelemetry({
    int? maxResults,
    String? nextToken,
    String? resourceIdentifierPrefix,
    Map<String, String>? resourceTags,
    List<ResourceType>? resourceTypes,
    Map<TelemetryType, TelemetryState>? telemetryConfigurationState,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceIdentifierPrefix != null)
        'ResourceIdentifierPrefix': resourceIdentifierPrefix,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (telemetryConfigurationState != null)
        'TelemetryConfigurationState': telemetryConfigurationState
            .map((k, e) => MapEntry(k.value, e.value)),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListResourceTelemetry',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceTelemetryOutput.fromJson(response);
  }

  /// Returns a list of telemetry configurations for Amazon Web Services
  /// resources supported by telemetry config in the organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIdentifiers] :
  /// A list of Amazon Web Services accounts used to filter the resources to
  /// those associated with the specified accounts.
  ///
  /// Parameter [maxResults] :
  /// A number field used to limit the number of results within the returned
  /// list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. A previous call provides
  /// this token.
  ///
  /// Parameter [resourceIdentifierPrefix] :
  /// A string used to filter resources in the organization which have a
  /// <code>ResourceIdentifier</code> starting with the
  /// <code>ResourceIdentifierPrefix</code>.
  ///
  /// Parameter [resourceTags] :
  /// A key-value pair to filter resources in the organization based on tags
  /// associated with the resource. Fore more information about tags, see <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html">What
  /// are tags?</a>
  ///
  /// Parameter [resourceTypes] :
  /// A list of resource types used to filter resources in the organization. If
  /// this parameter is provided, the resources will be returned in the same
  /// order used in the request.
  ///
  /// Parameter [telemetryConfigurationState] :
  /// A key-value pair to filter resources in the organization based on the
  /// telemetry type and the state of the telemetry configuration. The key is
  /// the telemetry type and the value is the state.
  Future<ListResourceTelemetryForOrganizationOutput>
      listResourceTelemetryForOrganization({
    List<String>? accountIdentifiers,
    int? maxResults,
    String? nextToken,
    String? resourceIdentifierPrefix,
    Map<String, String>? resourceTags,
    List<ResourceType>? resourceTypes,
    Map<TelemetryType, TelemetryState>? telemetryConfigurationState,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (accountIdentifiers != null) 'AccountIdentifiers': accountIdentifiers,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceIdentifierPrefix != null)
        'ResourceIdentifierPrefix': resourceIdentifierPrefix,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (telemetryConfigurationState != null)
        'TelemetryConfigurationState': telemetryConfigurationState
            .map((k, e) => MapEntry(k.value, e.value)),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListResourceTelemetryForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceTelemetryForOrganizationOutput.fromJson(response);
  }

  /// Lists all S3 Table integrations in your account. We recommend using
  /// pagination to ensure that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of S3 Table integrations to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. A previous call generates this
  /// token.
  Future<ListS3TableIntegrationsOutput> listS3TableIntegrations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListS3TableIntegrations',
      exceptionFnMap: _exceptionFns,
    );
    return ListS3TableIntegrationsOutput.fromJson(response);
  }

  /// Lists all tags attached to the specified resource. Supports telemetry rule
  /// resources and telemetry pipeline resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the telemetry rule resource whose tags
  /// you want to list.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceARN,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Lists all telemetry rules in your account. You can filter the results by
  /// specifying a rule name prefix.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of telemetry rules to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. A previous call generates this
  /// token.
  ///
  /// Parameter [ruleNamePrefix] :
  /// A string to filter telemetry rules whose names begin with the specified
  /// prefix.
  Future<ListTelemetryRulesOutput> listTelemetryRules({
    int? maxResults,
    String? nextToken,
    String? ruleNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleNamePrefix != null) 'RuleNamePrefix': ruleNamePrefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTelemetryRules',
      exceptionFnMap: _exceptionFns,
    );
    return ListTelemetryRulesOutput.fromJson(response);
  }

  /// Lists all telemetry rules in your organization. This operation can only be
  /// called by the organization's management account or a delegated
  /// administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of organization telemetry rules to return in a single
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. A previous call generates this
  /// token.
  ///
  /// Parameter [ruleNamePrefix] :
  /// A string to filter organization telemetry rules whose names begin with the
  /// specified prefix.
  ///
  /// Parameter [sourceAccountIds] :
  /// The list of account IDs to filter organization telemetry rules by their
  /// source accounts.
  ///
  /// Parameter [sourceOrganizationUnitIds] :
  /// The list of organizational unit IDs to filter organization telemetry rules
  /// by their source organizational units.
  Future<ListTelemetryRulesForOrganizationOutput>
      listTelemetryRulesForOrganization({
    int? maxResults,
    String? nextToken,
    String? ruleNamePrefix,
    List<String>? sourceAccountIds,
    List<String>? sourceOrganizationUnitIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleNamePrefix != null) 'RuleNamePrefix': ruleNamePrefix,
      if (sourceAccountIds != null) 'SourceAccountIds': sourceAccountIds,
      if (sourceOrganizationUnitIds != null)
        'SourceOrganizationUnitIds': sourceOrganizationUnitIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTelemetryRulesForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return ListTelemetryRulesForOrganizationOutput.fromJson(response);
  }

  /// Enables the resource tags for telemetry feature for your account, which
  /// enhances telemetry data with additional resource metadata from Resource
  /// Explorer to provide richer context for monitoring and observability.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  Future<StartTelemetryEnrichmentOutput> startTelemetryEnrichment() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/StartTelemetryEnrichment',
      exceptionFnMap: _exceptionFns,
    );
    return StartTelemetryEnrichmentOutput.fromJson(response);
  }

  /// This action begins onboarding the caller Amazon Web Services account to
  /// the telemetry config feature.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allRegions] :
  /// If set to <code>true</code>, telemetry evaluation starts in all Amazon Web
  /// Services Regions where Amazon CloudWatch Observability Admin is available
  /// in the current partition. The current region becomes the home region for
  /// managing multi-region evaluation. When new regions become available,
  /// evaluation automatically expands to include them. Mutually exclusive with
  /// <code>Regions</code>.
  ///
  /// Parameter [regions] :
  /// An optional list of Amazon Web Services Regions to include in multi-region
  /// telemetry evaluation. The current region is always implicitly included and
  /// must not be specified in this list. When provided, telemetry evaluation
  /// starts in the current region and propagates to all specified regions.
  /// Mutually exclusive with <code>AllRegions</code>. If neither
  /// <code>Regions</code> nor <code>AllRegions</code> is provided, the
  /// operation applies only to the current region.
  Future<void> startTelemetryEvaluation({
    bool? allRegions,
    List<String>? regions,
  }) async {
    final $payload = <String, dynamic>{
      if (allRegions != null) 'AllRegions': allRegions,
      if (regions != null) 'Regions': regions,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartTelemetryEvaluation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This actions begins onboarding the organization and all member accounts to
  /// the telemetry config feature.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allRegions] :
  /// If set to <code>true</code>, telemetry evaluation for the organization
  /// starts in all Amazon Web Services Regions where Amazon CloudWatch
  /// Observability Admin is available in the current partition. The current
  /// region becomes the home region for managing multi-region evaluation for
  /// the organization. When new regions become available, evaluation
  /// automatically expands to include them. Mutually exclusive with
  /// <code>Regions</code>.
  ///
  /// Parameter [regions] :
  /// An optional list of Amazon Web Services Regions to include in multi-region
  /// telemetry evaluation for the organization. The current region is always
  /// implicitly included and must not be specified in this list. When provided,
  /// telemetry evaluation starts in the current region and propagates to all
  /// specified regions for the organization. Mutually exclusive with
  /// <code>AllRegions</code>. If neither <code>Regions</code> nor
  /// <code>AllRegions</code> is provided, the operation applies only to the
  /// current region.
  Future<void> startTelemetryEvaluationForOrganization({
    bool? allRegions,
    List<String>? regions,
  }) async {
    final $payload = <String, dynamic>{
      if (allRegions != null) 'AllRegions': allRegions,
      if (regions != null) 'Regions': regions,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartTelemetryEvaluationForOrganization',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables the resource tags for telemetry feature for your account,
  /// stopping the enhancement of telemetry data with additional resource
  /// metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  Future<StopTelemetryEnrichmentOutput> stopTelemetryEnrichment() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/StopTelemetryEnrichment',
      exceptionFnMap: _exceptionFns,
    );
    return StopTelemetryEnrichmentOutput.fromJson(response);
  }

  /// This action begins offboarding the caller Amazon Web Services account from
  /// the telemetry config feature.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  Future<void> stopTelemetryEvaluation() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/StopTelemetryEvaluation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This action offboards the Organization of the caller Amazon Web Services
  /// account from the telemetry config feature.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  Future<void> stopTelemetryEvaluationForOrganization() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/StopTelemetryEvaluationForOrganization',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or updates tags for a resource. Supports telemetry rule resources and
  /// telemetry pipeline resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the telemetry rule resource to tag.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add or update for the telemetry rule resource.
  Future<void> tagResource({
    required String resourceARN,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Tests a pipeline configuration with sample records to validate data
  /// processing before deployment. This operation helps ensure your pipeline
  /// configuration works as expected.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The pipeline configuration to test with the provided sample records.
  ///
  /// Parameter [records] :
  /// The sample records to process through the pipeline configuration for
  /// testing purposes.
  Future<TestTelemetryPipelineOutput> testTelemetryPipeline({
    required TelemetryPipelineConfiguration configuration,
    required List<Record> records,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'Records': records,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TestTelemetryPipeline',
      exceptionFnMap: _exceptionFns,
    );
    return TestTelemetryPipelineOutput.fromJson(response);
  }

  /// Removes tags from a resource. Supports telemetry rule resources and
  /// telemetry pipeline resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the telemetry rule resource to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the telemetry rule resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing centralization rule that applies across an Amazon Web
  /// Services Organization. This operation can only be called by the
  /// organization's management account or a delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The configuration details for the organization-wide centralization rule,
  /// including the source configuration and the destination configuration to
  /// centralize telemetry data across the organization.
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization centralization rule to
  /// update.
  Future<UpdateCentralizationRuleForOrganizationOutput>
      updateCentralizationRuleForOrganization({
    required CentralizationRule rule,
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateCentralizationRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCentralizationRuleForOrganizationOutput.fromJson(response);
  }

  /// Updates an existing telemetry rule in your account. If multiple users
  /// attempt to modify the same telemetry rule simultaneously, a
  /// ConflictException is returned to provide specific error information for
  /// concurrent modification scenarios.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The new configuration details for the telemetry rule.
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the telemetry rule to update.
  Future<UpdateTelemetryRuleOutput> updateTelemetryRule({
    required TelemetryRule rule,
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTelemetryRule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTelemetryRuleOutput.fromJson(response);
  }

  /// Updates an existing telemetry rule that applies across an Amazon Web
  /// Services Organization. This operation can only be called by the
  /// organization's management account or a delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rule] :
  /// The new configuration details for the organization telemetry rule,
  /// including resource type, telemetry type, and destination configuration.
  ///
  /// Parameter [ruleIdentifier] :
  /// The identifier (name or ARN) of the organization telemetry rule to update.
  Future<UpdateTelemetryRuleForOrganizationOutput>
      updateTelemetryRuleForOrganization({
    required TelemetryRule rule,
    required String ruleIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'Rule': rule,
      'RuleIdentifier': ruleIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTelemetryRuleForOrganization',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTelemetryRuleForOrganizationOutput.fromJson(response);
  }

  /// Validates a pipeline configuration without creating the pipeline. This
  /// operation checks the configuration for syntax errors and compatibility
  /// issues.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The pipeline configuration to validate for syntax and compatibility.
  Future<ValidateTelemetryPipelineConfigurationOutput>
      validateTelemetryPipelineConfiguration({
    required TelemetryPipelineConfiguration configuration,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ValidateTelemetryPipelineConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateTelemetryPipelineConfigurationOutput.fromJson(response);
  }

  /// Creates a telemetry pipeline for processing and transforming telemetry
  /// data. The pipeline defines how data flows from sources through processors
  /// to destinations, enabling data transformation and delivering capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The configuration that defines how the telemetry pipeline processes data,
  /// including sources, processors, and destinations. For more information
  /// about pipeline components, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/pipeline-components-reference.html">Amazon
  /// CloudWatch User Guide</a>
  ///
  /// Parameter [name] :
  /// The name of the telemetry pipeline to create. The name must be unique
  /// within your account.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the telemetry pipeline resource for
  /// categorization and management purposes.
  Future<CreateTelemetryPipelineOutput> createTelemetryPipeline({
    required TelemetryPipelineConfiguration configuration,
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateTelemetryPipeline',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTelemetryPipelineOutput.fromJson(response);
  }

  /// Retrieves information about a specific telemetry pipeline, including its
  /// configuration, status, and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineIdentifier] :
  /// The identifier (name or ARN) of the telemetry pipeline to retrieve.
  Future<GetTelemetryPipelineOutput> getTelemetryPipeline({
    required String pipelineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'PipelineIdentifier': pipelineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTelemetryPipeline',
      exceptionFnMap: _exceptionFns,
    );
    return GetTelemetryPipelineOutput.fromJson(response);
  }

  /// Updates the configuration of an existing telemetry pipeline.
  /// <note>
  /// The following attributes cannot be updated after pipeline creation:
  ///
  /// <ul>
  /// <li>
  /// <b>Pipeline name</b> - The pipeline name is immutable
  /// </li>
  /// <li>
  /// <b>Pipeline ARN</b> - The ARN is automatically generated and cannot be
  /// changed
  /// </li>
  /// <li>
  /// <b>Source type</b> - Once a pipeline is created with a specific source
  /// type (such as S3, CloudWatch Logs, GitHub, or third-party sources), it
  /// cannot be changed to a different source type
  /// </li>
  /// </ul>
  /// Processors can be added, removed, or modified. However, some processors
  /// are not supported for third-party pipelines and cannot be added through
  /// updates.
  /// </note>
  /// <b>Source-Specific Update Rules</b>
  /// <dl> <dt>CloudWatch Logs Sources (Vended and Custom)</dt> <dd>
  /// <b>Updatable:</b> <code>sts_role_arn</code>
  ///
  /// <b>Fixed:</b> <code>data_source_name</code>,
  /// <code>data_source_type</code>, sink (must remain <code>@original</code>)
  /// </dd> <dt>S3 Sources (Crowdstrike, Zscaler, SentinelOne, Custom)</dt> <dd>
  /// <b>Updatable:</b> All SQS configuration parameters,
  /// <code>sts_role_arn</code>, codec settings, compression type, bucket
  /// ownership settings, sink log group
  ///
  /// <b>Fixed:</b> <code>notification_type</code>, <code>aws.region</code>
  /// </dd> <dt>GitHub Audit Logs</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>scope</code> (can switch between ORGANIZATION/ENTERPRISE),
  /// <code>organization</code> or <code>enterprise</code> name,
  /// <code>range</code>, authentication credentials (PAT or GitHub App)
  /// </dd> <dt>Microsoft Sources (Entra ID, Office365, Windows)</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>tenant_id</code>, <code>workspace_id</code> (Windows only), OAuth2
  /// credentials (<code>client_id</code>, <code>client_secret</code>)
  /// </dd> <dt>Okta Sources (SSO, Auth0)</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>domain</code>, <code>range</code>, OAuth2 credentials
  /// (<code>client_id</code>, <code>client_secret</code>)
  /// </dd> <dt>Palo Alto Networks</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>hostname</code>, basic authentication credentials
  /// (<code>username</code>, <code>password</code>)
  /// </dd> <dt>ServiceNow CMDB</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>instance_url</code>, <code>range</code>, OAuth2 credentials
  /// (<code>client_id</code>, <code>client_secret</code>)
  /// </dd> <dt>Wiz CNAPP</dt> <dd>
  /// <b>Updatable:</b> All Amazon Web Services Secrets Manager attributes,
  /// <code>region</code>, <code>range</code>, OAuth2 credentials
  /// (<code>client_id</code>, <code>client_secret</code>)
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The new configuration for the telemetry pipeline, including updated
  /// sources, processors, and destinations.
  ///
  /// Parameter [pipelineIdentifier] :
  /// The ARN of the telemetry pipeline to update.
  Future<void> updateTelemetryPipeline({
    required TelemetryPipelineConfiguration configuration,
    required String pipelineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'PipelineIdentifier': pipelineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTelemetryPipeline',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a telemetry pipeline and its associated resources. This operation
  /// stops data processing and removes the pipeline configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineIdentifier] :
  /// The ARN of the telemetry pipeline to delete.
  Future<void> deleteTelemetryPipeline({
    required String pipelineIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'PipelineIdentifier': pipelineIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteTelemetryPipeline',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of telemetry pipelines in your account. Returns up to 100
  /// results. If more than 100 telemetry pipelines exist, include the
  /// <code>NextToken</code> value from the response to retrieve the next set of
  /// results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of telemetry pipelines to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. A previous call generates this
  /// token.
  Future<ListTelemetryPipelinesOutput> listTelemetryPipelines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTelemetryPipelines',
      exceptionFnMap: _exceptionFns,
    );
    return ListTelemetryPipelinesOutput.fromJson(response);
  }
}

/// @nodoc
class CreateCentralizationRuleForOrganizationOutput {
  /// The Amazon Resource Name (ARN) of the created organization centralization
  /// rule.
  final String? ruleArn;

  CreateCentralizationRuleForOrganizationOutput({
    this.ruleArn,
  });

  factory CreateCentralizationRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateCentralizationRuleForOrganizationOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class CreateS3TableIntegrationOutput {
  /// The Amazon Resource Name (ARN) of the created S3 Table integration.
  final String? arn;

  CreateS3TableIntegrationOutput({
    this.arn,
  });

  factory CreateS3TableIntegrationOutput.fromJson(Map<String, dynamic> json) {
    return CreateS3TableIntegrationOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// @nodoc
class CreateTelemetryRuleOutput {
  /// The Amazon Resource Name (ARN) of the created telemetry rule.
  final String? ruleArn;

  CreateTelemetryRuleOutput({
    this.ruleArn,
  });

  factory CreateTelemetryRuleOutput.fromJson(Map<String, dynamic> json) {
    return CreateTelemetryRuleOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class CreateTelemetryRuleForOrganizationOutput {
  /// The Amazon Resource Name (ARN) of the created organization telemetry rule.
  final String? ruleArn;

  CreateTelemetryRuleForOrganizationOutput({
    this.ruleArn,
  });

  factory CreateTelemetryRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateTelemetryRuleForOrganizationOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class GetCentralizationRuleForOrganizationOutput {
  /// The configuration details for the organization centralization rule.
  final CentralizationRule? centralizationRule;

  /// The Amazon Web Services region where the organization centralization rule
  /// was created.
  final String? createdRegion;

  /// The timestamp when the organization centralization rule was created.
  final int? createdTimeStamp;

  /// The Amazon Web Services Account that created the organization centralization
  /// rule.
  final String? creatorAccountId;

  /// The reason why an organization centralization rule is marked UNHEALTHY.
  final CentralizationFailureReason? failureReason;

  /// The timestamp when the organization centralization rule was last updated.
  final int? lastUpdateTimeStamp;

  /// The Amazon Resource Name (ARN) of the organization centralization rule.
  final String? ruleArn;

  /// The health status of the organization centralization rule.
  final RuleHealth? ruleHealth;

  /// The name of the organization centralization rule.
  final String? ruleName;

  GetCentralizationRuleForOrganizationOutput({
    this.centralizationRule,
    this.createdRegion,
    this.createdTimeStamp,
    this.creatorAccountId,
    this.failureReason,
    this.lastUpdateTimeStamp,
    this.ruleArn,
    this.ruleHealth,
    this.ruleName,
  });

  factory GetCentralizationRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCentralizationRuleForOrganizationOutput(
      centralizationRule: json['CentralizationRule'] != null
          ? CentralizationRule.fromJson(
              json['CentralizationRule'] as Map<String, dynamic>)
          : null,
      createdRegion: json['CreatedRegion'] as String?,
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      creatorAccountId: json['CreatorAccountId'] as String?,
      failureReason: (json['FailureReason'] as String?)
          ?.let(CentralizationFailureReason.fromString),
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      ruleArn: json['RuleArn'] as String?,
      ruleHealth: (json['RuleHealth'] as String?)?.let(RuleHealth.fromString),
      ruleName: json['RuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final centralizationRule = this.centralizationRule;
    final createdRegion = this.createdRegion;
    final createdTimeStamp = this.createdTimeStamp;
    final creatorAccountId = this.creatorAccountId;
    final failureReason = this.failureReason;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final ruleArn = this.ruleArn;
    final ruleHealth = this.ruleHealth;
    final ruleName = this.ruleName;
    return {
      if (centralizationRule != null) 'CentralizationRule': centralizationRule,
      if (createdRegion != null) 'CreatedRegion': createdRegion,
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (creatorAccountId != null) 'CreatorAccountId': creatorAccountId,
      if (failureReason != null) 'FailureReason': failureReason.value,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (ruleHealth != null) 'RuleHealth': ruleHealth.value,
      if (ruleName != null) 'RuleName': ruleName,
    };
  }
}

/// @nodoc
class GetS3TableIntegrationOutput {
  /// The Amazon Resource Name (ARN) of the S3 Table integration.
  final String? arn;

  /// The timestamp when the S3 Table integration was created.
  final int? createdTimeStamp;

  /// The Amazon Resource Name (ARN) of the S3 bucket used as the destination for
  /// the table data.
  final String? destinationTableBucketArn;

  /// The encryption configuration for the S3 Table integration.
  final Encryption? encryption;

  /// The Amazon Resource Name (ARN) of the IAM role used by the S3 Table
  /// integration.
  final String? roleArn;

  /// The current status of the S3 Table integration.
  final IntegrationStatus? status;

  GetS3TableIntegrationOutput({
    this.arn,
    this.createdTimeStamp,
    this.destinationTableBucketArn,
    this.encryption,
    this.roleArn,
    this.status,
  });

  factory GetS3TableIntegrationOutput.fromJson(Map<String, dynamic> json) {
    return GetS3TableIntegrationOutput(
      arn: json['Arn'] as String?,
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      destinationTableBucketArn: json['DestinationTableBucketArn'] as String?,
      encryption: json['Encryption'] != null
          ? Encryption.fromJson(json['Encryption'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      status: (json['Status'] as String?)?.let(IntegrationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTimeStamp = this.createdTimeStamp;
    final destinationTableBucketArn = this.destinationTableBucketArn;
    final encryption = this.encryption;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (destinationTableBucketArn != null)
        'DestinationTableBucketArn': destinationTableBucketArn,
      if (encryption != null) 'Encryption': encryption,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class GetTelemetryEnrichmentStatusOutput {
  /// The Amazon Resource Name (ARN) of the Resource Explorer managed view used
  /// for resource tags for telemetry, if the feature is enabled.
  final String? awsResourceExplorerManagedViewArn;

  /// The current status of the resource tags for telemetry feature
  /// (<code>Running</code>, <code>Stopped</code>, or <code>Impaired</code>).
  final TelemetryEnrichmentStatus? status;

  GetTelemetryEnrichmentStatusOutput({
    this.awsResourceExplorerManagedViewArn,
    this.status,
  });

  factory GetTelemetryEnrichmentStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return GetTelemetryEnrichmentStatusOutput(
      awsResourceExplorerManagedViewArn:
          json['AwsResourceExplorerManagedViewArn'] as String?,
      status: (json['Status'] as String?)
          ?.let(TelemetryEnrichmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final awsResourceExplorerManagedViewArn =
        this.awsResourceExplorerManagedViewArn;
    final status = this.status;
    return {
      if (awsResourceExplorerManagedViewArn != null)
        'AwsResourceExplorerManagedViewArn': awsResourceExplorerManagedViewArn,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class GetTelemetryEvaluationStatusOutput {
  /// Describes the reason for the failure status. The field will only be
  /// populated if <code>Status</code> is <code>FAILED_START</code> or
  /// <code>FAILED_STOP</code>.
  final String? failureReason;

  /// The Amazon Web Services Region that is designated as the home region for
  /// multi-region telemetry evaluation. The home region is the single management
  /// point for all multi-region operations on this account. This field is only
  /// present when multi-region telemetry evaluation is active.
  final String? homeRegion;

  /// A list of per-region telemetry evaluation statuses. Each entry indicates the
  /// evaluation status for a specific spoke region included in the multi-region
  /// configuration. This field is only present when multi-region telemetry
  /// evaluation is active.
  final List<RegionStatus>? regionStatuses;

  /// The onboarding status of the telemetry config feature.
  final Status? status;

  GetTelemetryEvaluationStatusOutput({
    this.failureReason,
    this.homeRegion,
    this.regionStatuses,
    this.status,
  });

  factory GetTelemetryEvaluationStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return GetTelemetryEvaluationStatusOutput(
      failureReason: json['FailureReason'] as String?,
      homeRegion: json['HomeRegion'] as String?,
      regionStatuses: (json['RegionStatuses'] as List?)
          ?.nonNulls
          .map((e) => RegionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final homeRegion = this.homeRegion;
    final regionStatuses = this.regionStatuses;
    final status = this.status;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (regionStatuses != null) 'RegionStatuses': regionStatuses,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class GetTelemetryEvaluationStatusForOrganizationOutput {
  /// This field describes the reason for the failure status. The field will only
  /// be populated if <code>Status</code> is <code>FAILED_START</code> or
  /// <code>FAILED_STOP</code>.
  final String? failureReason;

  /// The Amazon Web Services Region that is designated as the home region for
  /// multi-region telemetry evaluation for the organization. The home region is
  /// the single management point for all multi-region operations on this
  /// organization. This field is only present when multi-region telemetry
  /// evaluation is active.
  final String? homeRegion;

  /// A list of per-region telemetry evaluation statuses for the organization.
  /// Each entry indicates the evaluation status for a specific spoke region
  /// included in the multi-region configuration. This field is only present when
  /// multi-region telemetry evaluation is active.
  final List<RegionStatus>? regionStatuses;

  /// The onboarding status of the telemetry config feature for the organization.
  final Status? status;

  GetTelemetryEvaluationStatusForOrganizationOutput({
    this.failureReason,
    this.homeRegion,
    this.regionStatuses,
    this.status,
  });

  factory GetTelemetryEvaluationStatusForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetTelemetryEvaluationStatusForOrganizationOutput(
      failureReason: json['FailureReason'] as String?,
      homeRegion: json['HomeRegion'] as String?,
      regionStatuses: (json['RegionStatuses'] as List?)
          ?.nonNulls
          .map((e) => RegionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final homeRegion = this.homeRegion;
    final regionStatuses = this.regionStatuses;
    final status = this.status;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (regionStatuses != null) 'RegionStatuses': regionStatuses,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class GetTelemetryRuleOutput {
  /// The timestamp when the telemetry rule was created.
  final int? createdTimeStamp;

  /// The Amazon Web Services Region where the telemetry rule was originally
  /// created. For replicated rules in spoke regions, this indicates the region
  /// that manages the rule. For rules created without multi-region scope, this
  /// field is not present.
  final String? homeRegion;

  /// Indicates whether this telemetry rule is a replica that was created in this
  /// region through multi-region fan-out from the home region. Replicated rules
  /// cannot be directly updated or deleted in the spoke region. To modify a
  /// replicated rule, make changes in the home region.
  final bool? isReplicated;

  /// The timestamp when the telemetry rule was last updated.
  final int? lastUpdateTimeStamp;

  /// A list of per-region replication statuses for the telemetry rule. Each entry
  /// indicates the replication status of the rule in a specific spoke region.
  /// This field is only present for rules created with multi-region scope.
  final List<RegionStatus>? regionStatuses;

  /// The Amazon Resource Name (ARN) of the telemetry rule.
  final String? ruleArn;

  /// The name of the telemetry rule.
  final String? ruleName;

  /// The configuration details of the telemetry rule.
  final TelemetryRule? telemetryRule;

  GetTelemetryRuleOutput({
    this.createdTimeStamp,
    this.homeRegion,
    this.isReplicated,
    this.lastUpdateTimeStamp,
    this.regionStatuses,
    this.ruleArn,
    this.ruleName,
    this.telemetryRule,
  });

  factory GetTelemetryRuleOutput.fromJson(Map<String, dynamic> json) {
    return GetTelemetryRuleOutput(
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      homeRegion: json['HomeRegion'] as String?,
      isReplicated: json['IsReplicated'] as bool?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      regionStatuses: (json['RegionStatuses'] as List?)
          ?.nonNulls
          .map((e) => RegionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleArn: json['RuleArn'] as String?,
      ruleName: json['RuleName'] as String?,
      telemetryRule: json['TelemetryRule'] != null
          ? TelemetryRule.fromJson(
              json['TelemetryRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimeStamp = this.createdTimeStamp;
    final homeRegion = this.homeRegion;
    final isReplicated = this.isReplicated;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final regionStatuses = this.regionStatuses;
    final ruleArn = this.ruleArn;
    final ruleName = this.ruleName;
    final telemetryRule = this.telemetryRule;
    return {
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (isReplicated != null) 'IsReplicated': isReplicated,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (regionStatuses != null) 'RegionStatuses': regionStatuses,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (ruleName != null) 'RuleName': ruleName,
      if (telemetryRule != null) 'TelemetryRule': telemetryRule,
    };
  }
}

/// @nodoc
class GetTelemetryRuleForOrganizationOutput {
  /// The timestamp when the organization telemetry rule was created.
  final int? createdTimeStamp;

  /// The Amazon Web Services Region where the organization telemetry rule was
  /// originally created. For replicated rules in spoke regions, this indicates
  /// the region that manages the rule. For rules created without multi-region
  /// scope, this field is not present.
  final String? homeRegion;

  /// Indicates whether this organization telemetry rule is a replica that was
  /// created in this region through multi-region fan-out from the home region.
  /// Replicated rules cannot be directly updated or deleted in the spoke region.
  /// To modify a replicated rule, make changes in the home region.
  final bool? isReplicated;

  /// The timestamp when the organization telemetry rule was last updated.
  final int? lastUpdateTimeStamp;

  /// A list of per-region replication statuses for the organization telemetry
  /// rule. Each entry indicates the replication status of the rule in a specific
  /// spoke region. This field is only present for rules created with multi-region
  /// scope.
  final List<RegionStatus>? regionStatuses;

  /// The Amazon Resource Name (ARN) of the organization telemetry rule.
  final String? ruleArn;

  /// The name of the organization telemetry rule.
  final String? ruleName;

  /// The configuration details of the organization telemetry rule.
  final TelemetryRule? telemetryRule;

  GetTelemetryRuleForOrganizationOutput({
    this.createdTimeStamp,
    this.homeRegion,
    this.isReplicated,
    this.lastUpdateTimeStamp,
    this.regionStatuses,
    this.ruleArn,
    this.ruleName,
    this.telemetryRule,
  });

  factory GetTelemetryRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetTelemetryRuleForOrganizationOutput(
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      homeRegion: json['HomeRegion'] as String?,
      isReplicated: json['IsReplicated'] as bool?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      regionStatuses: (json['RegionStatuses'] as List?)
          ?.nonNulls
          .map((e) => RegionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleArn: json['RuleArn'] as String?,
      ruleName: json['RuleName'] as String?,
      telemetryRule: json['TelemetryRule'] != null
          ? TelemetryRule.fromJson(
              json['TelemetryRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimeStamp = this.createdTimeStamp;
    final homeRegion = this.homeRegion;
    final isReplicated = this.isReplicated;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final regionStatuses = this.regionStatuses;
    final ruleArn = this.ruleArn;
    final ruleName = this.ruleName;
    final telemetryRule = this.telemetryRule;
    return {
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (isReplicated != null) 'IsReplicated': isReplicated,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (regionStatuses != null) 'RegionStatuses': regionStatuses,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (ruleName != null) 'RuleName': ruleName,
      if (telemetryRule != null) 'TelemetryRule': telemetryRule,
    };
  }
}

/// @nodoc
class ListCentralizationRulesForOrganizationOutput {
  /// A list of centralization rule summaries.
  final List<CentralizationRuleSummary>? centralizationRuleSummaries;

  /// A token to resume pagination of results.
  final String? nextToken;

  ListCentralizationRulesForOrganizationOutput({
    this.centralizationRuleSummaries,
    this.nextToken,
  });

  factory ListCentralizationRulesForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCentralizationRulesForOrganizationOutput(
      centralizationRuleSummaries:
          (json['CentralizationRuleSummaries'] as List?)
              ?.nonNulls
              .map((e) =>
                  CentralizationRuleSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final centralizationRuleSummaries = this.centralizationRuleSummaries;
    final nextToken = this.nextToken;
    return {
      if (centralizationRuleSummaries != null)
        'CentralizationRuleSummaries': centralizationRuleSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListResourceTelemetryOutput {
  /// The token for the next set of items to return. A previous call generates
  /// this token.
  final String? nextToken;

  /// A list of telemetry configurations for Amazon Web Services resources
  /// supported by telemetry config in the caller's account.
  final List<TelemetryConfiguration>? telemetryConfigurations;

  ListResourceTelemetryOutput({
    this.nextToken,
    this.telemetryConfigurations,
  });

  factory ListResourceTelemetryOutput.fromJson(Map<String, dynamic> json) {
    return ListResourceTelemetryOutput(
      nextToken: json['NextToken'] as String?,
      telemetryConfigurations: (json['TelemetryConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => TelemetryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final telemetryConfigurations = this.telemetryConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (telemetryConfigurations != null)
        'TelemetryConfigurations': telemetryConfigurations,
    };
  }
}

/// @nodoc
class ListResourceTelemetryForOrganizationOutput {
  /// The token for the next set of items to return. A previous call provides this
  /// token.
  final String? nextToken;

  /// A list of telemetry configurations for Amazon Web Services resources
  /// supported by telemetry config in the organization.
  final List<TelemetryConfiguration>? telemetryConfigurations;

  ListResourceTelemetryForOrganizationOutput({
    this.nextToken,
    this.telemetryConfigurations,
  });

  factory ListResourceTelemetryForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return ListResourceTelemetryForOrganizationOutput(
      nextToken: json['NextToken'] as String?,
      telemetryConfigurations: (json['TelemetryConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => TelemetryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final telemetryConfigurations = this.telemetryConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (telemetryConfigurations != null)
        'TelemetryConfigurations': telemetryConfigurations,
    };
  }
}

/// @nodoc
class ListS3TableIntegrationsOutput {
  /// A list of S3 Table integration summaries containing key information about
  /// each integration.
  final List<IntegrationSummary>? integrationSummaries;

  /// A token to resume pagination of results.
  final String? nextToken;

  ListS3TableIntegrationsOutput({
    this.integrationSummaries,
    this.nextToken,
  });

  factory ListS3TableIntegrationsOutput.fromJson(Map<String, dynamic> json) {
    return ListS3TableIntegrationsOutput(
      integrationSummaries: (json['IntegrationSummaries'] as List?)
          ?.nonNulls
          .map((e) => IntegrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationSummaries = this.integrationSummaries;
    final nextToken = this.nextToken;
    return {
      if (integrationSummaries != null)
        'IntegrationSummaries': integrationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The list of tags associated with the telemetry rule resource.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags:
          ((json['Tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// @nodoc
class ListTelemetryRulesOutput {
  /// A token to resume pagination of results.
  final String? nextToken;

  /// A list of telemetry rule summaries.
  final List<TelemetryRuleSummary>? telemetryRuleSummaries;

  ListTelemetryRulesOutput({
    this.nextToken,
    this.telemetryRuleSummaries,
  });

  factory ListTelemetryRulesOutput.fromJson(Map<String, dynamic> json) {
    return ListTelemetryRulesOutput(
      nextToken: json['NextToken'] as String?,
      telemetryRuleSummaries: (json['TelemetryRuleSummaries'] as List?)
          ?.nonNulls
          .map((e) => TelemetryRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final telemetryRuleSummaries = this.telemetryRuleSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (telemetryRuleSummaries != null)
        'TelemetryRuleSummaries': telemetryRuleSummaries,
    };
  }
}

/// @nodoc
class ListTelemetryRulesForOrganizationOutput {
  /// A token to resume pagination of results.
  final String? nextToken;

  /// A list of organization telemetry rule summaries.
  final List<TelemetryRuleSummary>? telemetryRuleSummaries;

  ListTelemetryRulesForOrganizationOutput({
    this.nextToken,
    this.telemetryRuleSummaries,
  });

  factory ListTelemetryRulesForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return ListTelemetryRulesForOrganizationOutput(
      nextToken: json['NextToken'] as String?,
      telemetryRuleSummaries: (json['TelemetryRuleSummaries'] as List?)
          ?.nonNulls
          .map((e) => TelemetryRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final telemetryRuleSummaries = this.telemetryRuleSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (telemetryRuleSummaries != null)
        'TelemetryRuleSummaries': telemetryRuleSummaries,
    };
  }
}

/// @nodoc
class StartTelemetryEnrichmentOutput {
  /// The Amazon Resource Name (ARN) of the Resource Explorer managed view created
  /// for resource tags for telemetry.
  final String? awsResourceExplorerManagedViewArn;

  /// The status of the resource tags for telemetry feature after the start
  /// operation (<code>Running</code>, <code>Stopped</code>, or
  /// <code>Impaired</code>).
  final TelemetryEnrichmentStatus? status;

  StartTelemetryEnrichmentOutput({
    this.awsResourceExplorerManagedViewArn,
    this.status,
  });

  factory StartTelemetryEnrichmentOutput.fromJson(Map<String, dynamic> json) {
    return StartTelemetryEnrichmentOutput(
      awsResourceExplorerManagedViewArn:
          json['AwsResourceExplorerManagedViewArn'] as String?,
      status: (json['Status'] as String?)
          ?.let(TelemetryEnrichmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final awsResourceExplorerManagedViewArn =
        this.awsResourceExplorerManagedViewArn;
    final status = this.status;
    return {
      if (awsResourceExplorerManagedViewArn != null)
        'AwsResourceExplorerManagedViewArn': awsResourceExplorerManagedViewArn,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class StopTelemetryEnrichmentOutput {
  /// The status of the resource tags for telemetry feature after the stop
  /// operation (<code>Running</code>, <code>Stopped</code>, or
  /// <code>Impaired</code>).
  final TelemetryEnrichmentStatus? status;

  StopTelemetryEnrichmentOutput({
    this.status,
  });

  factory StopTelemetryEnrichmentOutput.fromJson(Map<String, dynamic> json) {
    return StopTelemetryEnrichmentOutput(
      status: (json['Status'] as String?)
          ?.let(TelemetryEnrichmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class TestTelemetryPipelineOutput {
  /// The results of processing the test records through the pipeline
  /// configuration, including any outputs or errors.
  final List<PipelineOutput>? results;

  TestTelemetryPipelineOutput({
    this.results,
  });

  factory TestTelemetryPipelineOutput.fromJson(Map<String, dynamic> json) {
    return TestTelemetryPipelineOutput(
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => PipelineOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      if (results != null) 'Results': results,
    };
  }
}

/// @nodoc
class UpdateCentralizationRuleForOrganizationOutput {
  /// The Amazon Resource Name (ARN) of the updated organization centralization
  /// rule.
  final String? ruleArn;

  UpdateCentralizationRuleForOrganizationOutput({
    this.ruleArn,
  });

  factory UpdateCentralizationRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateCentralizationRuleForOrganizationOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class UpdateTelemetryRuleOutput {
  /// The Amazon Resource Name (ARN) of the updated telemetry rule.
  final String? ruleArn;

  UpdateTelemetryRuleOutput({
    this.ruleArn,
  });

  factory UpdateTelemetryRuleOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTelemetryRuleOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class UpdateTelemetryRuleForOrganizationOutput {
  /// The Amazon Resource Name (ARN) of the updated organization telemetry rule.
  final String? ruleArn;

  UpdateTelemetryRuleForOrganizationOutput({
    this.ruleArn,
  });

  factory UpdateTelemetryRuleForOrganizationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateTelemetryRuleForOrganizationOutput(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class ValidateTelemetryPipelineConfigurationOutput {
  /// A list of validation errors found in the pipeline configuration, if any.
  final List<ValidationError>? errors;

  ValidateTelemetryPipelineConfigurationOutput({
    this.errors,
  });

  factory ValidateTelemetryPipelineConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ValidateTelemetryPipelineConfigurationOutput(
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

/// @nodoc
class CreateTelemetryPipelineOutput {
  /// The Amazon Resource Name (ARN) of the created telemetry pipeline.
  final String? arn;

  CreateTelemetryPipelineOutput({
    this.arn,
  });

  factory CreateTelemetryPipelineOutput.fromJson(Map<String, dynamic> json) {
    return CreateTelemetryPipelineOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// @nodoc
class GetTelemetryPipelineOutput {
  /// The complete telemetry pipeline resource information, including
  /// configuration, status, and metadata.
  final TelemetryPipeline? pipeline;

  GetTelemetryPipelineOutput({
    this.pipeline,
  });

  factory GetTelemetryPipelineOutput.fromJson(Map<String, dynamic> json) {
    return GetTelemetryPipelineOutput(
      pipeline: json['Pipeline'] != null
          ? TelemetryPipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
    };
  }
}

/// @nodoc
class UpdateTelemetryPipelineOutput {
  UpdateTelemetryPipelineOutput();

  factory UpdateTelemetryPipelineOutput.fromJson(Map<String, dynamic> _) {
    return UpdateTelemetryPipelineOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteTelemetryPipelineOutput {
  DeleteTelemetryPipelineOutput();

  factory DeleteTelemetryPipelineOutput.fromJson(Map<String, dynamic> _) {
    return DeleteTelemetryPipelineOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListTelemetryPipelinesOutput {
  /// A token to resume pagination of results.
  final String? nextToken;

  /// A list of telemetry pipeline summaries containing key information about each
  /// pipeline.
  final List<TelemetryPipelineSummary>? pipelineSummaries;

  ListTelemetryPipelinesOutput({
    this.nextToken,
    this.pipelineSummaries,
  });

  factory ListTelemetryPipelinesOutput.fromJson(Map<String, dynamic> json) {
    return ListTelemetryPipelinesOutput(
      nextToken: json['NextToken'] as String?,
      pipelineSummaries: (json['PipelineSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              TelemetryPipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelineSummaries = this.pipelineSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pipelineSummaries != null) 'PipelineSummaries': pipelineSummaries,
    };
  }
}

/// Contains summary information about a telemetry pipeline for listing
/// operations.
///
/// @nodoc
class TelemetryPipelineSummary {
  /// The Amazon Resource Name (ARN) of the telemetry pipeline.
  final String? arn;

  /// A summary of the pipeline configuration components.
  final ConfigurationSummary? configurationSummary;

  /// The timestamp when the telemetry pipeline was created.
  final int? createdTimeStamp;

  /// The timestamp when the telemetry pipeline was last updated.
  final int? lastUpdateTimeStamp;

  /// The name of the telemetry pipeline.
  final String? name;

  /// The current status of the telemetry pipeline.
  final TelemetryPipelineStatus? status;

  /// The key-value pairs associated with the telemetry pipeline resource.
  final Map<String, String>? tags;

  TelemetryPipelineSummary({
    this.arn,
    this.configurationSummary,
    this.createdTimeStamp,
    this.lastUpdateTimeStamp,
    this.name,
    this.status,
    this.tags,
  });

  factory TelemetryPipelineSummary.fromJson(Map<String, dynamic> json) {
    return TelemetryPipelineSummary(
      arn: json['Arn'] as String?,
      configurationSummary: json['ConfigurationSummary'] != null
          ? ConfigurationSummary.fromJson(
              json['ConfigurationSummary'] as Map<String, dynamic>)
          : null,
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      name: json['Name'] as String?,
      status:
          (json['Status'] as String?)?.let(TelemetryPipelineStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configurationSummary = this.configurationSummary;
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (configurationSummary != null)
        'ConfigurationSummary': configurationSummary,
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class TelemetryPipelineStatus {
  static const creating = TelemetryPipelineStatus._('CREATING');
  static const active = TelemetryPipelineStatus._('ACTIVE');
  static const updating = TelemetryPipelineStatus._('UPDATING');
  static const deleting = TelemetryPipelineStatus._('DELETING');
  static const createFailed = TelemetryPipelineStatus._('CREATE_FAILED');
  static const updateFailed = TelemetryPipelineStatus._('UPDATE_FAILED');

  final String value;

  const TelemetryPipelineStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    updateFailed
  ];

  static TelemetryPipelineStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TelemetryPipelineStatus._(value));

  @override
  bool operator ==(other) =>
      other is TelemetryPipelineStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of pipeline configuration components including sources,
/// processors, and destinations.
///
/// @nodoc
class ConfigurationSummary {
  /// The list of data sources that provide telemetry data to the pipeline.
  final List<DataSource>? dataSources;

  /// The total number of processors configured in the pipeline.
  final int? processorCount;

  /// The list of processors configured in the pipeline for data transformation.
  final List<String>? processors;

  /// The list of destinations where processed data is sent.
  final List<String>? sinks;

  /// The list of data sources configured in the pipeline.
  final List<Source>? sources;

  ConfigurationSummary({
    this.dataSources,
    this.processorCount,
    this.processors,
    this.sinks,
    this.sources,
  });

  factory ConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationSummary(
      dataSources: (json['DataSources'] as List?)
          ?.nonNulls
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      processorCount: json['ProcessorCount'] as int?,
      processors: (json['Processors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sinks:
          (json['Sinks'] as List?)?.nonNulls.map((e) => e as String).toList(),
      sources: (json['Sources'] as List?)
          ?.nonNulls
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    final processorCount = this.processorCount;
    final processors = this.processors;
    final sinks = this.sinks;
    final sources = this.sources;
    return {
      if (dataSources != null) 'DataSources': dataSources,
      if (processorCount != null) 'ProcessorCount': processorCount,
      if (processors != null) 'Processors': processors,
      if (sinks != null) 'Sinks': sinks,
      if (sources != null) 'Sources': sources,
    };
  }
}

/// Information about a data source associated with the telemetry pipeline. For
/// CloudWatch Logs sources, this includes both a name and type extracted from
/// the log event metadata. For third-party sources (such as S3), this includes
/// only a name, with the type field left empty.
///
/// @nodoc
class DataSource {
  /// The name of the data source. For CloudWatch Logs sources, this corresponds
  /// to the <code>data_source_name</code> from the log event metadata. For
  /// third-party sources, this is either the configured
  /// <code>data_source_name</code> or defaults to the plugin name if not
  /// specified.
  final String? name;

  /// The type of the data source. For CloudWatch Logs sources, this corresponds
  /// to the <code>data_source_type</code> from the log event metadata. For
  /// third-party sources, this field is empty.
  final String? type;

  DataSource({
    this.name,
    this.type,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// A list of source plugin types used in the pipeline configuration (such as
/// <code>cloudwatch_logs</code> or <code>s3</code>). Currently supports a
/// single source per pipeline, but is structured as a list to accommodate
/// multiple pipelines in the configuration.
///
/// @nodoc
class Source {
  /// The plugin name of the source, such as <code>cloudwatch_logs</code> or
  /// <code>s3</code>.
  final String? type;

  Source({
    this.type,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type,
    };
  }
}

/// Defines the configuration for a pipeline, including how data flows from
/// sources through processors to destinations. The configuration is specified
/// in YAML format and must include a valid pipeline definition with required
/// source and sink components. This pipeline enables end-to-end telemetry data
/// collection, transformation, and delivery while supporting optional
/// processing steps and extensions for enhanced functionality.
///
/// The primary pipeline configuration section are:
///
/// <ul>
/// <li>
/// <b>Source:</b> Defines where log data originates from (S3 buckets,
/// CloudWatch Logs, third-party APIs). Each pipeline must have exactly one
/// source.
/// </li>
/// <li>
/// <b>Processors (optional):</b> Transform, parse, and enrich log data as it
/// flows through the pipeline. Processors are applied sequentially in the order
/// they are defined.
/// </li>
/// <li>
/// <b>Sink:</b> Defines the destination where processed log data is sent. Each
/// pipeline must have exactly one sink.
/// </li>
/// <li>
/// <b>Extensions (optional):</b> Provide additional functionality such as
/// Amazon Web Services Secrets Manager integration for credential management.
/// </li>
/// </ul>
/// For more details on each configuration section see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-pipelines.html">CloudWatch
/// pipelines User Guide</a>. Additional comprehensive configuration examples
/// can be found in the <a
/// href="https://docs.aws.amazon.com/cloudwatch/latest/observabilityadmin/API_CreateTelemetryPipeline.html#API_CreateTelemetryPipeline_Examples">CreateTelemetryPipeline
/// API docs</a>.
///
/// @nodoc
class TelemetryPipelineConfiguration {
  /// The pipeline configuration body that defines the data processing rules and
  /// transformations.
  final String body;

  TelemetryPipelineConfiguration({
    required this.body,
  });

  factory TelemetryPipelineConfiguration.fromJson(Map<String, dynamic> json) {
    return TelemetryPipelineConfiguration(
      body: (json['Body'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      'Body': body,
    };
  }
}

/// Represents a complete telemetry pipeline resource with configuration,
/// status, and metadata for data processing and transformation.
///
/// @nodoc
class TelemetryPipeline {
  /// The Amazon Resource Name (ARN) of the telemetry pipeline.
  final String? arn;

  /// The configuration that defines how the telemetry pipeline processes data.
  final TelemetryPipelineConfiguration? configuration;

  /// The timestamp when the telemetry pipeline was created.
  final int? createdTimeStamp;

  /// The timestamp when the telemetry pipeline was last updated.
  final int? lastUpdateTimeStamp;

  /// The name of the telemetry pipeline.
  final String? name;

  /// The current status of the telemetry pipeline.
  final TelemetryPipelineStatus? status;

  /// Additional information about the pipeline status, including reasons for
  /// failure states.
  final TelemetryPipelineStatusReason? statusReason;

  /// The key-value pairs associated with the telemetry pipeline resource.
  final Map<String, String>? tags;

  TelemetryPipeline({
    this.arn,
    this.configuration,
    this.createdTimeStamp,
    this.lastUpdateTimeStamp,
    this.name,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory TelemetryPipeline.fromJson(Map<String, dynamic> json) {
    return TelemetryPipeline(
      arn: json['Arn'] as String?,
      configuration: json['Configuration'] != null
          ? TelemetryPipelineConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      name: json['Name'] as String?,
      status:
          (json['Status'] as String?)?.let(TelemetryPipelineStatus.fromString),
      statusReason: json['StatusReason'] != null
          ? TelemetryPipelineStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configuration = this.configuration;
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (configuration != null) 'Configuration': configuration,
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Provides detailed information about the status of a telemetry pipeline,
/// including reasons for specific states.
///
/// @nodoc
class TelemetryPipelineStatusReason {
  /// A description of the pipeline status reason, providing additional context
  /// about the current state.
  final String? description;

  TelemetryPipelineStatusReason({
    this.description,
  });

  factory TelemetryPipelineStatusReason.fromJson(Map<String, dynamic> json) {
    return TelemetryPipelineStatusReason(
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'Description': description,
    };
  }
}

/// Represents a detailed validation error with message, reason, and field
/// mapping for comprehensive error reporting.
///
/// @nodoc
class ValidationError {
  /// A mapping of field names to specific validation issues within the
  /// configuration.
  final Map<String, String>? fieldMap;

  /// The error message describing the validation issue.
  final String? message;

  /// The reason code or category for the validation error.
  final String? reason;

  ValidationError({
    this.fieldMap,
    this.message,
    this.reason,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      fieldMap: (json['FieldMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      message: json['Message'] as String?,
      reason: json['Reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldMap = this.fieldMap;
    final message = this.message;
    final reason = this.reason;
    return {
      if (fieldMap != null) 'FieldMap': fieldMap,
      if (message != null) 'Message': message,
      if (reason != null) 'Reason': reason,
    };
  }
}

/// Defines how telemetry should be configured for specific Amazon Web Services
/// resources.
///
/// @nodoc
class TelemetryRule {
  /// The type of telemetry to collect (Logs, Metrics, or Traces).
  final TelemetryType telemetryType;

  /// If set to <code>true</code>, the telemetry rule is replicated to all Amazon
  /// Web Services Regions where Amazon CloudWatch Observability Admin is
  /// available in the current partition. When new regions become available, the
  /// rule automatically replicates to them. Mutually exclusive with
  /// <code>Regions</code>.
  final bool? allRegions;

  /// If set to <code>true</code>, Amazon CloudWatch Observability Admin detects
  /// and remediates configuration drift in telemetry resources that it manages.
  /// For example, if a VPC flow log's format, traffic type, or aggregation
  /// interval no longer matches the rule's destination configuration, the flow
  /// log is replaced with one that matches. Only Observability Admin-managed
  /// resources are updated; customer-created resources are never modified.
  /// Currently supported for <code>AWS::EC2::VPC</code> resources (VPC flow
  /// logs).
  final bool? allowFieldUpdates;

  /// Configuration specifying where and how the telemetry data should be
  /// delivered.
  final TelemetryDestinationConfiguration? destinationConfiguration;

  /// An optional list of Amazon Web Services Regions where this telemetry rule
  /// should be replicated. When specified, the rule is created in the home region
  /// and automatically replicated to all listed regions. Mutually exclusive with
  /// <code>AllRegions</code>.
  final List<String>? regions;

  /// The type of Amazon Web Services resource to configure telemetry for (e.g.,
  /// "AWS::EC2::VPC", "AWS::EKS::Cluster", "AWS::WAFv2::WebACL").
  final ResourceType? resourceType;

  /// The organizational scope to which the rule applies, specified using accounts
  /// or organizational units.
  final String? scope;

  /// Criteria for selecting which resources the rule applies to, such as resource
  /// tags.
  final String? selectionCriteria;

  /// The specific telemetry source types to configure for the resource, such as
  /// VPC_FLOW_LOGS or EKS_AUDIT_LOGS. TelemetrySourceTypes must be correlated
  /// with the specific resource type.
  final List<TelemetrySourceType>? telemetrySourceTypes;

  TelemetryRule({
    required this.telemetryType,
    this.allRegions,
    this.allowFieldUpdates,
    this.destinationConfiguration,
    this.regions,
    this.resourceType,
    this.scope,
    this.selectionCriteria,
    this.telemetrySourceTypes,
  });

  factory TelemetryRule.fromJson(Map<String, dynamic> json) {
    return TelemetryRule(
      telemetryType:
          TelemetryType.fromString((json['TelemetryType'] as String?) ?? ''),
      allRegions: json['AllRegions'] as bool?,
      allowFieldUpdates: json['AllowFieldUpdates'] as bool?,
      destinationConfiguration: json['DestinationConfiguration'] != null
          ? TelemetryDestinationConfiguration.fromJson(
              json['DestinationConfiguration'] as Map<String, dynamic>)
          : null,
      regions:
          (json['Regions'] as List?)?.nonNulls.map((e) => e as String).toList(),
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      scope: json['Scope'] as String?,
      selectionCriteria: json['SelectionCriteria'] as String?,
      telemetrySourceTypes: (json['TelemetrySourceTypes'] as List?)
          ?.nonNulls
          .map((e) => TelemetrySourceType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final telemetryType = this.telemetryType;
    final allRegions = this.allRegions;
    final allowFieldUpdates = this.allowFieldUpdates;
    final destinationConfiguration = this.destinationConfiguration;
    final regions = this.regions;
    final resourceType = this.resourceType;
    final scope = this.scope;
    final selectionCriteria = this.selectionCriteria;
    final telemetrySourceTypes = this.telemetrySourceTypes;
    return {
      'TelemetryType': telemetryType.value,
      if (allRegions != null) 'AllRegions': allRegions,
      if (allowFieldUpdates != null) 'AllowFieldUpdates': allowFieldUpdates,
      if (destinationConfiguration != null)
        'DestinationConfiguration': destinationConfiguration,
      if (regions != null) 'Regions': regions,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (scope != null) 'Scope': scope,
      if (selectionCriteria != null) 'SelectionCriteria': selectionCriteria,
      if (telemetrySourceTypes != null)
        'TelemetrySourceTypes':
            telemetrySourceTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ResourceType {
  static const awsEc2Instance = ResourceType._('AWS::EC2::Instance');
  static const awsEc2Vpc = ResourceType._('AWS::EC2::VPC');
  static const awsLambdaFunction = ResourceType._('AWS::Lambda::Function');
  static const awsCloudTrail = ResourceType._('AWS::CloudTrail');
  static const awsEksCluster = ResourceType._('AWS::EKS::Cluster');
  static const awsWAFv2WebACL = ResourceType._('AWS::WAFv2::WebACL');
  static const awsElasticLoadBalancingV2LoadBalancer =
      ResourceType._('AWS::ElasticLoadBalancingV2::LoadBalancer');
  static const awsRoute53ResolverResolverEndpoint =
      ResourceType._('AWS::Route53Resolver::ResolverEndpoint');
  static const awsBedrockAgentCoreRuntime =
      ResourceType._('AWS::BedrockAgentCore::Runtime');
  static const awsBedrockAgentCoreBrowser =
      ResourceType._('AWS::BedrockAgentCore::Browser');
  static const awsBedrockAgentCoreCodeInterpreter =
      ResourceType._('AWS::BedrockAgentCore::CodeInterpreter');
  static const awsBedrockAgentCoreGateway =
      ResourceType._('AWS::BedrockAgentCore::Gateway');
  static const awsBedrockAgentCoreMemory =
      ResourceType._('AWS::BedrockAgentCore::Memory');
  static const awsBedrockAgentCoreWorkloadIdentity =
      ResourceType._('AWS::BedrockAgentCore::WorkloadIdentity');
  static const awsSecurityHubHub = ResourceType._('AWS::SecurityHub::Hub');
  static const awsCloudFrontDistribution =
      ResourceType._('AWS::CloudFront::Distribution');
  static const awsSecurityHubHubV2 = ResourceType._('AWS::SecurityHub::HubV2');
  static const awsCloudWatchOTelEnrichment =
      ResourceType._('AWS::CloudWatch::OTelEnrichment');
  static const awsMskCluster = ResourceType._('AWS::MSK::Cluster');

  final String value;

  const ResourceType._(this.value);

  static const values = [
    awsEc2Instance,
    awsEc2Vpc,
    awsLambdaFunction,
    awsCloudTrail,
    awsEksCluster,
    awsWAFv2WebACL,
    awsElasticLoadBalancingV2LoadBalancer,
    awsRoute53ResolverResolverEndpoint,
    awsBedrockAgentCoreRuntime,
    awsBedrockAgentCoreBrowser,
    awsBedrockAgentCoreCodeInterpreter,
    awsBedrockAgentCoreGateway,
    awsBedrockAgentCoreMemory,
    awsBedrockAgentCoreWorkloadIdentity,
    awsSecurityHubHub,
    awsCloudFrontDistribution,
    awsSecurityHubHubV2,
    awsCloudWatchOTelEnrichment,
    awsMskCluster
  ];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TelemetryType {
  static const logs = TelemetryType._('Logs');
  static const metrics = TelemetryType._('Metrics');
  static const traces = TelemetryType._('Traces');

  final String value;

  const TelemetryType._(this.value);

  static const values = [logs, metrics, traces];

  static TelemetryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TelemetryType._(value));

  @override
  bool operator ==(other) => other is TelemetryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration specifying where and how telemetry data should be delivered
/// for Amazon Web Services resources.
///
/// @nodoc
class TelemetryDestinationConfiguration {
  /// Configuration parameters specific to Amazon Web Services CloudTrail when
  /// CloudTrail is the source type.
  final CloudtrailParameters? cloudtrailParameters;

  /// The pattern used to generate the destination path or name, supporting macros
  /// like &lt;resourceId&gt; and &lt;accountId&gt;.
  final String? destinationPattern;

  /// The type of destination for the telemetry data (e.g., "Amazon CloudWatch
  /// Logs", "S3").
  final DestinationType? destinationType;

  /// Configuration parameters specific to ELB load balancer logging when ELB is
  /// the resource type.
  final ELBLoadBalancerLoggingParameters? eLBLoadBalancerLoggingParameters;

  /// Configuration parameters specific to Amazon Bedrock AgentCore logging when
  /// Amazon Bedrock AgentCore is the resource type.
  final LogDeliveryParameters? logDeliveryParameters;

  /// Configuration parameters specific to MSK monitoring when MSK is the resource
  /// type.
  final MskMonitoringParameters? mskMonitoringParameters;

  /// The number of days to retain the telemetry data in the destination.
  final int? retentionInDays;

  /// Configuration parameters specific to VPC Flow Logs when VPC is the resource
  /// type.
  final VPCFlowLogParameters? vPCFlowLogParameters;

  /// Configuration parameters specific to WAF logging when WAF is the resource
  /// type.
  final WAFLoggingParameters? wAFLoggingParameters;

  TelemetryDestinationConfiguration({
    this.cloudtrailParameters,
    this.destinationPattern,
    this.destinationType,
    this.eLBLoadBalancerLoggingParameters,
    this.logDeliveryParameters,
    this.mskMonitoringParameters,
    this.retentionInDays,
    this.vPCFlowLogParameters,
    this.wAFLoggingParameters,
  });

  factory TelemetryDestinationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TelemetryDestinationConfiguration(
      cloudtrailParameters: json['CloudtrailParameters'] != null
          ? CloudtrailParameters.fromJson(
              json['CloudtrailParameters'] as Map<String, dynamic>)
          : null,
      destinationPattern: json['DestinationPattern'] as String?,
      destinationType:
          (json['DestinationType'] as String?)?.let(DestinationType.fromString),
      eLBLoadBalancerLoggingParameters:
          json['ELBLoadBalancerLoggingParameters'] != null
              ? ELBLoadBalancerLoggingParameters.fromJson(
                  json['ELBLoadBalancerLoggingParameters']
                      as Map<String, dynamic>)
              : null,
      logDeliveryParameters: json['LogDeliveryParameters'] != null
          ? LogDeliveryParameters.fromJson(
              json['LogDeliveryParameters'] as Map<String, dynamic>)
          : null,
      mskMonitoringParameters: json['MskMonitoringParameters'] != null
          ? MskMonitoringParameters.fromJson(
              json['MskMonitoringParameters'] as Map<String, dynamic>)
          : null,
      retentionInDays: json['RetentionInDays'] as int?,
      vPCFlowLogParameters: json['VPCFlowLogParameters'] != null
          ? VPCFlowLogParameters.fromJson(
              json['VPCFlowLogParameters'] as Map<String, dynamic>)
          : null,
      wAFLoggingParameters: json['WAFLoggingParameters'] != null
          ? WAFLoggingParameters.fromJson(
              json['WAFLoggingParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudtrailParameters = this.cloudtrailParameters;
    final destinationPattern = this.destinationPattern;
    final destinationType = this.destinationType;
    final eLBLoadBalancerLoggingParameters =
        this.eLBLoadBalancerLoggingParameters;
    final logDeliveryParameters = this.logDeliveryParameters;
    final mskMonitoringParameters = this.mskMonitoringParameters;
    final retentionInDays = this.retentionInDays;
    final vPCFlowLogParameters = this.vPCFlowLogParameters;
    final wAFLoggingParameters = this.wAFLoggingParameters;
    return {
      if (cloudtrailParameters != null)
        'CloudtrailParameters': cloudtrailParameters,
      if (destinationPattern != null) 'DestinationPattern': destinationPattern,
      if (destinationType != null) 'DestinationType': destinationType.value,
      if (eLBLoadBalancerLoggingParameters != null)
        'ELBLoadBalancerLoggingParameters': eLBLoadBalancerLoggingParameters,
      if (logDeliveryParameters != null)
        'LogDeliveryParameters': logDeliveryParameters,
      if (mskMonitoringParameters != null)
        'MskMonitoringParameters': mskMonitoringParameters,
      if (retentionInDays != null) 'RetentionInDays': retentionInDays,
      if (vPCFlowLogParameters != null)
        'VPCFlowLogParameters': vPCFlowLogParameters,
      if (wAFLoggingParameters != null)
        'WAFLoggingParameters': wAFLoggingParameters,
    };
  }
}

/// @nodoc
class DestinationType {
  static const cloudWatchLogs = DestinationType._('cloud-watch-logs');

  final String value;

  const DestinationType._(this.value);

  static const values = [cloudWatchLogs];

  static DestinationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DestinationType._(value));

  @override
  bool operator ==(other) => other is DestinationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration parameters specific to VPC Flow Logs.
///
/// @nodoc
class VPCFlowLogParameters {
  /// The format in which VPC Flow Log entries should be logged.
  final String? logFormat;

  /// The maximum interval in seconds between the capture of flow log records.
  final int? maxAggregationInterval;

  /// The type of traffic to log (ACCEPT, REJECT, or ALL).
  final String? trafficType;

  VPCFlowLogParameters({
    this.logFormat,
    this.maxAggregationInterval,
    this.trafficType,
  });

  factory VPCFlowLogParameters.fromJson(Map<String, dynamic> json) {
    return VPCFlowLogParameters(
      logFormat: json['LogFormat'] as String?,
      maxAggregationInterval: json['MaxAggregationInterval'] as int?,
      trafficType: json['TrafficType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logFormat = this.logFormat;
    final maxAggregationInterval = this.maxAggregationInterval;
    final trafficType = this.trafficType;
    return {
      if (logFormat != null) 'LogFormat': logFormat,
      if (maxAggregationInterval != null)
        'MaxAggregationInterval': maxAggregationInterval,
      if (trafficType != null) 'TrafficType': trafficType,
    };
  }
}

/// Parameters specific to Amazon Web Services CloudTrail telemetry
/// configuration.
///
/// @nodoc
class CloudtrailParameters {
  /// The advanced event selectors to use for filtering Amazon Web Services
  /// CloudTrail events.
  final List<AdvancedEventSelector> advancedEventSelectors;

  CloudtrailParameters({
    required this.advancedEventSelectors,
  });

  factory CloudtrailParameters.fromJson(Map<String, dynamic> json) {
    return CloudtrailParameters(
      advancedEventSelectors: ((json['AdvancedEventSelectors'] as List?) ??
              const [])
          .nonNulls
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    return {
      'AdvancedEventSelectors': advancedEventSelectors,
    };
  }
}

/// Configuration parameters for ELB load balancer logging, including output
/// format and field delimiter settings.
///
/// @nodoc
class ELBLoadBalancerLoggingParameters {
  /// The delimiter character used to separate fields in ELB access log entries
  /// when using plain text format.
  final String? fieldDelimiter;

  /// The format for ELB access log entries (plain text or JSON format).
  final OutputFormat? outputFormat;

  ELBLoadBalancerLoggingParameters({
    this.fieldDelimiter,
    this.outputFormat,
  });

  factory ELBLoadBalancerLoggingParameters.fromJson(Map<String, dynamic> json) {
    return ELBLoadBalancerLoggingParameters(
      fieldDelimiter: json['FieldDelimiter'] as String?,
      outputFormat:
          (json['OutputFormat'] as String?)?.let(OutputFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldDelimiter = this.fieldDelimiter;
    final outputFormat = this.outputFormat;
    return {
      if (fieldDelimiter != null) 'FieldDelimiter': fieldDelimiter,
      if (outputFormat != null) 'OutputFormat': outputFormat.value,
    };
  }
}

/// Configuration parameters for WAF logging, including redacted fields and
/// logging filters.
///
/// @nodoc
class WAFLoggingParameters {
  /// The type of WAF logs to collect (currently supports WAF_LOGS).
  final WAFLogType? logType;

  /// A filter configuration that determines which WAF log records to include or
  /// exclude.
  final LoggingFilter? loggingFilter;

  /// The fields to redact from WAF logs to protect sensitive information.
  final List<FieldToMatch>? redactedFields;

  WAFLoggingParameters({
    this.logType,
    this.loggingFilter,
    this.redactedFields,
  });

  factory WAFLoggingParameters.fromJson(Map<String, dynamic> json) {
    return WAFLoggingParameters(
      logType: (json['LogType'] as String?)?.let(WAFLogType.fromString),
      loggingFilter: json['LoggingFilter'] != null
          ? LoggingFilter.fromJson(
              json['LoggingFilter'] as Map<String, dynamic>)
          : null,
      redactedFields: (json['RedactedFields'] as List?)
          ?.nonNulls
          .map((e) => FieldToMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logType = this.logType;
    final loggingFilter = this.loggingFilter;
    final redactedFields = this.redactedFields;
    return {
      if (logType != null) 'LogType': logType.value,
      if (loggingFilter != null) 'LoggingFilter': loggingFilter,
      if (redactedFields != null) 'RedactedFields': redactedFields,
    };
  }
}

/// Configuration parameters for Amazon Bedrock AgentCore logging, including
/// <code>logType</code> settings.
///
/// @nodoc
class LogDeliveryParameters {
  /// The type of log that the source is sending.
  final List<LogType>? logTypes;

  LogDeliveryParameters({
    this.logTypes,
  });

  factory LogDeliveryParameters.fromJson(Map<String, dynamic> json) {
    return LogDeliveryParameters(
      logTypes: (json['LogTypes'] as List?)
          ?.nonNulls
          .map((e) => LogType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logTypes = this.logTypes;
    return {
      if (logTypes != null) 'LogTypes': logTypes.map((e) => e.value).toList(),
    };
  }
}

/// Configuration parameters for Amazon MSK cluster monitoring, including
/// enhanced monitoring level settings.
///
/// @nodoc
class MskMonitoringParameters {
  /// The level of enhanced monitoring for the MSK cluster.
  final MskEnhancedMonitoringLevel? enhancedMonitoring;

  MskMonitoringParameters({
    this.enhancedMonitoring,
  });

  factory MskMonitoringParameters.fromJson(Map<String, dynamic> json) {
    return MskMonitoringParameters(
      enhancedMonitoring: (json['EnhancedMonitoring'] as String?)
          ?.let(MskEnhancedMonitoringLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final enhancedMonitoring = this.enhancedMonitoring;
    return {
      if (enhancedMonitoring != null)
        'EnhancedMonitoring': enhancedMonitoring.value,
    };
  }
}

/// Enumeration of supported enhanced monitoring levels for Amazon MSK clusters:
/// DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.
///
/// @nodoc
class MskEnhancedMonitoringLevel {
  static const $default = MskEnhancedMonitoringLevel._('DEFAULT');
  static const perBroker = MskEnhancedMonitoringLevel._('PER_BROKER');
  static const perTopicPerBroker =
      MskEnhancedMonitoringLevel._('PER_TOPIC_PER_BROKER');
  static const perTopicPerPartition =
      MskEnhancedMonitoringLevel._('PER_TOPIC_PER_PARTITION');

  final String value;

  const MskEnhancedMonitoringLevel._(this.value);

  static const values = [
    $default,
    perBroker,
    perTopicPerBroker,
    perTopicPerPartition
  ];

  static MskEnhancedMonitoringLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MskEnhancedMonitoringLevel._(value));

  @override
  bool operator ==(other) =>
      other is MskEnhancedMonitoringLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogType {
  static const applicationLogs = LogType._('APPLICATION_LOGS');
  static const usageLogs = LogType._('USAGE_LOGS');
  static const securityFindingLogs = LogType._('SECURITY_FINDING_LOGS');
  static const accessLogs = LogType._('ACCESS_LOGS');
  static const connectionLogs = LogType._('CONNECTION_LOGS');

  final String value;

  const LogType._(this.value);

  static const values = [
    applicationLogs,
    usageLogs,
    securityFindingLogs,
    accessLogs,
    connectionLogs
  ];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration that determines which WAF log records to keep or drop based on
/// specified conditions.
///
/// @nodoc
class LoggingFilter {
  /// The default action (KEEP or DROP) for log records that don't match any
  /// filter conditions.
  final FilterBehavior? defaultBehavior;

  /// A list of filter conditions that determine log record handling behavior.
  final List<Filter>? filters;

  LoggingFilter({
    this.defaultBehavior,
    this.filters,
  });

  factory LoggingFilter.fromJson(Map<String, dynamic> json) {
    return LoggingFilter(
      defaultBehavior:
          (json['DefaultBehavior'] as String?)?.let(FilterBehavior.fromString),
      filters: (json['Filters'] as List?)
          ?.nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultBehavior = this.defaultBehavior;
    final filters = this.filters;
    return {
      if (defaultBehavior != null) 'DefaultBehavior': defaultBehavior.value,
      if (filters != null) 'Filters': filters,
    };
  }
}

/// Enumeration of supported WAF log types. Currently only WAF_LOGS is
/// supported.
///
/// @nodoc
class WAFLogType {
  static const wafLogs = WAFLogType._('WAF_LOGS');

  final String value;

  const WAFLogType._(this.value);

  static const values = [wafLogs];

  static WAFLogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WAFLogType._(value));

  @override
  bool operator ==(other) => other is WAFLogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Enumeration of filter actions: KEEP to include log records, DROP to exclude
/// them.
///
/// @nodoc
class FilterBehavior {
  static const keep = FilterBehavior._('KEEP');
  static const drop = FilterBehavior._('DROP');

  final String value;

  const FilterBehavior._(this.value);

  static const values = [keep, drop];

  static FilterBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterBehavior._(value));

  @override
  bool operator ==(other) => other is FilterBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single filter condition that specifies behavior, requirement, and matching
/// conditions for WAF log records.
///
/// @nodoc
class Filter {
  /// The action to take for log records matching this filter (KEEP or DROP).
  final FilterBehavior? behavior;

  /// The list of conditions that determine if a log record matches this filter.
  final List<Condition>? conditions;

  /// Whether the log record must meet all conditions (MEETS_ALL) or any condition
  /// (MEETS_ANY) to match this filter.
  final FilterRequirement? requirement;

  Filter({
    this.behavior,
    this.conditions,
    this.requirement,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      behavior: (json['Behavior'] as String?)?.let(FilterBehavior.fromString),
      conditions: (json['Conditions'] as List?)
          ?.nonNulls
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requirement:
          (json['Requirement'] as String?)?.let(FilterRequirement.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final conditions = this.conditions;
    final requirement = this.requirement;
    return {
      if (behavior != null) 'Behavior': behavior.value,
      if (conditions != null) 'Conditions': conditions,
      if (requirement != null) 'Requirement': requirement.value,
    };
  }
}

/// Enumeration of condition matching requirements: MEETS_ALL requires all
/// conditions to match, MEETS_ANY requires at least one.
///
/// @nodoc
class FilterRequirement {
  static const meetsAll = FilterRequirement._('MEETS_ALL');
  static const meetsAny = FilterRequirement._('MEETS_ANY');

  final String value;

  const FilterRequirement._(this.value);

  static const values = [meetsAll, meetsAny];

  static FilterRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterRequirement._(value));

  @override
  bool operator ==(other) => other is FilterRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single condition that can match based on WAF rule action or label name.
///
/// @nodoc
class Condition {
  /// Matches log records based on the WAF rule action taken (ALLOW, BLOCK, COUNT,
  /// etc.).
  final ActionCondition? actionCondition;

  /// Matches log records based on WAF rule labels applied to the request.
  final LabelNameCondition? labelNameCondition;

  Condition({
    this.actionCondition,
    this.labelNameCondition,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      actionCondition: json['ActionCondition'] != null
          ? ActionCondition.fromJson(
              json['ActionCondition'] as Map<String, dynamic>)
          : null,
      labelNameCondition: json['LabelNameCondition'] != null
          ? LabelNameCondition.fromJson(
              json['LabelNameCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionCondition = this.actionCondition;
    final labelNameCondition = this.labelNameCondition;
    return {
      if (actionCondition != null) 'ActionCondition': actionCondition,
      if (labelNameCondition != null) 'LabelNameCondition': labelNameCondition,
    };
  }
}

/// Condition that matches based on the specific WAF action taken on the
/// request.
///
/// @nodoc
class ActionCondition {
  /// The WAF action to match against (ALLOW, BLOCK, COUNT, CAPTCHA, CHALLENGE,
  /// EXCLUDED_AS_COUNT).
  final Action? action;

  ActionCondition({
    this.action,
  });

  factory ActionCondition.fromJson(Map<String, dynamic> json) {
    return ActionCondition(
      action: (json['Action'] as String?)?.let(Action.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'Action': action.value,
    };
  }
}

/// Condition that matches based on WAF rule labels, with label names limited to
/// 1024 characters.
///
/// @nodoc
class LabelNameCondition {
  /// The label name to match, supporting alphanumeric characters, underscores,
  /// hyphens, and colons.
  final String? labelName;

  LabelNameCondition({
    this.labelName,
  });

  factory LabelNameCondition.fromJson(Map<String, dynamic> json) {
    return LabelNameCondition(
      labelName: json['LabelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelName = this.labelName;
    return {
      if (labelName != null) 'LabelName': labelName,
    };
  }
}

/// Enumeration of WAF actions that can be matched in filter conditions.
///
/// @nodoc
class Action {
  static const allow = Action._('ALLOW');
  static const block = Action._('BLOCK');
  static const count = Action._('COUNT');
  static const captcha = Action._('CAPTCHA');
  static const challenge = Action._('CHALLENGE');
  static const excludedAsCount = Action._('EXCLUDED_AS_COUNT');

  final String value;

  const Action._(this.value);

  static const values = [
    allow,
    block,
    count,
    captcha,
    challenge,
    excludedAsCount
  ];

  static Action fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Action._(value));

  @override
  bool operator ==(other) => other is Action && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a field in the request to redact from WAF logs, such as headers,
/// query parameters, or body content.
///
/// @nodoc
class FieldToMatch {
  /// Redacts the HTTP method from WAF logs.
  final String? method;

  /// Redacts the entire query string from WAF logs.
  final String? queryString;

  /// Redacts a specific header field by name from WAF logs.
  final SingleHeader? singleHeader;

  /// Redacts the URI path from WAF logs.
  final String? uriPath;

  FieldToMatch({
    this.method,
    this.queryString,
    this.singleHeader,
    this.uriPath,
  });

  factory FieldToMatch.fromJson(Map<String, dynamic> json) {
    return FieldToMatch(
      method: json['Method'] as String?,
      queryString: json['QueryString'] as String?,
      singleHeader: json['SingleHeader'] != null
          ? SingleHeader.fromJson(json['SingleHeader'] as Map<String, dynamic>)
          : null,
      uriPath: json['UriPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final method = this.method;
    final queryString = this.queryString;
    final singleHeader = this.singleHeader;
    final uriPath = this.uriPath;
    return {
      if (method != null) 'Method': method,
      if (queryString != null) 'QueryString': queryString,
      if (singleHeader != null) 'SingleHeader': singleHeader,
      if (uriPath != null) 'UriPath': uriPath,
    };
  }
}

/// Structure containing a name field limited to 64 characters for header or
/// query parameter identification.
///
/// @nodoc
class SingleHeader {
  /// The name value, limited to 64 characters.
  final String? name;

  SingleHeader({
    this.name,
  });

  factory SingleHeader.fromJson(Map<String, dynamic> json) {
    return SingleHeader(
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

/// Enumeration of supported output formats for ELB access logs: PLAIN for
/// space-delimited format, JSON for structured JSON format.
///
/// @nodoc
class OutputFormat {
  static const plain = OutputFormat._('plain');
  static const json = OutputFormat._('json');

  final String value;

  const OutputFormat._(this.value);

  static const values = [plain, json];

  static OutputFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputFormat._(value));

  @override
  bool operator ==(other) => other is OutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Advanced event selectors let you create fine-grained selectors for
/// management, data, and network activity events.
///
/// @nodoc
class AdvancedEventSelector {
  /// Contains all selector statements in an advanced event selector.
  final List<AdvancedFieldSelector> fieldSelectors;

  /// An optional, descriptive name for an advanced event selector, such as "Log
  /// data events for only two S3 buckets".
  final String? name;

  AdvancedEventSelector({
    required this.fieldSelectors,
    this.name,
  });

  factory AdvancedEventSelector.fromJson(Map<String, dynamic> json) {
    return AdvancedEventSelector(
      fieldSelectors: ((json['FieldSelectors'] as List?) ?? const [])
          .nonNulls
          .map((e) => AdvancedFieldSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldSelectors = this.fieldSelectors;
    final name = this.name;
    return {
      'FieldSelectors': fieldSelectors,
      if (name != null) 'Name': name,
    };
  }
}

/// Defines criteria for selecting resources based on field values.
///
/// @nodoc
class AdvancedFieldSelector {
  /// The name of the field to use for selection.
  final String field;

  /// Matches if the field value ends with the specified value.
  final List<String>? endsWith;

  /// Matches if the field value equals the specified value.
  final List<String>? equals;

  /// Matches if the field value does not end with the specified value.
  final List<String>? notEndsWith;

  /// Matches if the field value does not equal the specified value.
  final List<String>? notEquals;

  /// Matches if the field value does not start with the specified value.
  final List<String>? notStartsWith;

  /// Matches if the field value starts with the specified value.
  final List<String>? startsWith;

  AdvancedFieldSelector({
    required this.field,
    this.endsWith,
    this.equals,
    this.notEndsWith,
    this.notEquals,
    this.notStartsWith,
    this.startsWith,
  });

  factory AdvancedFieldSelector.fromJson(Map<String, dynamic> json) {
    return AdvancedFieldSelector(
      field: (json['Field'] as String?) ?? '',
      endsWith: (json['EndsWith'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      equals:
          (json['Equals'] as List?)?.nonNulls.map((e) => e as String).toList(),
      notEndsWith: (json['NotEndsWith'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      notEquals: (json['NotEquals'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      notStartsWith: (json['NotStartsWith'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      startsWith: (json['StartsWith'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final endsWith = this.endsWith;
    final equals = this.equals;
    final notEndsWith = this.notEndsWith;
    final notEquals = this.notEquals;
    final notStartsWith = this.notStartsWith;
    final startsWith = this.startsWith;
    return {
      'Field': field,
      if (endsWith != null) 'EndsWith': endsWith,
      if (equals != null) 'Equals': equals,
      if (notEndsWith != null) 'NotEndsWith': notEndsWith,
      if (notEquals != null) 'NotEquals': notEquals,
      if (notStartsWith != null) 'NotStartsWith': notStartsWith,
      if (startsWith != null) 'StartsWith': startsWith,
    };
  }
}

/// Specifies the type of telemetry source for a resource, such as EKS cluster
/// logs.
///
/// @nodoc
class TelemetrySourceType {
  static const vpcFlowLogs = TelemetrySourceType._('VPC_FLOW_LOGS');
  static const route53ResolverQueryLogs =
      TelemetrySourceType._('ROUTE53_RESOLVER_QUERY_LOGS');
  static const eksAuditLogs = TelemetrySourceType._('EKS_AUDIT_LOGS');
  static const eksAuthenticatorLogs =
      TelemetrySourceType._('EKS_AUTHENTICATOR_LOGS');
  static const eksControllerManagerLogs =
      TelemetrySourceType._('EKS_CONTROLLER_MANAGER_LOGS');
  static const eksSchedulerLogs = TelemetrySourceType._('EKS_SCHEDULER_LOGS');
  static const eksApiLogs = TelemetrySourceType._('EKS_API_LOGS');

  final String value;

  const TelemetrySourceType._(this.value);

  static const values = [
    vpcFlowLogs,
    route53ResolverQueryLogs,
    eksAuditLogs,
    eksAuthenticatorLogs,
    eksControllerManagerLogs,
    eksSchedulerLogs,
    eksApiLogs
  ];

  static TelemetrySourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TelemetrySourceType._(value));

  @override
  bool operator ==(other) =>
      other is TelemetrySourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines how telemetry data should be centralized across an Amazon Web
/// Services Organization, including source and destination configurations.
///
/// @nodoc
class CentralizationRule {
  /// Configuration determining where the telemetry data should be centralized,
  /// backed up, as well as encryption configuration for the primary and backup
  /// destinations.
  final CentralizationRuleDestination destination;

  /// Configuration determining the source of the telemetry data to be
  /// centralized.
  final CentralizationRuleSource source;

  CentralizationRule({
    required this.destination,
    required this.source,
  });

  factory CentralizationRule.fromJson(Map<String, dynamic> json) {
    return CentralizationRule(
      destination: CentralizationRuleDestination.fromJson(
          (json['Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source: CentralizationRuleSource.fromJson(
          (json['Source'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final source = this.source;
    return {
      'Destination': destination,
      'Source': source,
    };
  }
}

/// Configuration specifying the source of telemetry data to be centralized.
///
/// @nodoc
class CentralizationRuleSource {
  /// The list of source regions from which telemetry data should be centralized.
  final List<String> regions;

  /// The organizational scope from which telemetry data should be centralized,
  /// specified using organization id, accounts or organizational unit ids.
  final String? scope;

  /// Log specific configuration for centralization source log groups.
  final SourceLogsConfiguration? sourceLogsConfiguration;

  CentralizationRuleSource({
    required this.regions,
    this.scope,
    this.sourceLogsConfiguration,
  });

  factory CentralizationRuleSource.fromJson(Map<String, dynamic> json) {
    return CentralizationRuleSource(
      regions: ((json['Regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      scope: json['Scope'] as String?,
      sourceLogsConfiguration: json['SourceLogsConfiguration'] != null
          ? SourceLogsConfiguration.fromJson(
              json['SourceLogsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    final scope = this.scope;
    final sourceLogsConfiguration = this.sourceLogsConfiguration;
    return {
      'Regions': regions,
      if (scope != null) 'Scope': scope,
      if (sourceLogsConfiguration != null)
        'SourceLogsConfiguration': sourceLogsConfiguration,
    };
  }
}

/// Configuration specifying the primary destination for centralized telemetry
/// data.
///
/// @nodoc
class CentralizationRuleDestination {
  /// The primary destination region to which telemetry data should be
  /// centralized.
  final String region;

  /// The destination account (within the organization) to which the telemetry
  /// data should be centralized.
  final String? account;

  /// Log specific configuration for centralization destination log groups.
  final DestinationLogsConfiguration? destinationLogsConfiguration;

  CentralizationRuleDestination({
    required this.region,
    this.account,
    this.destinationLogsConfiguration,
  });

  factory CentralizationRuleDestination.fromJson(Map<String, dynamic> json) {
    return CentralizationRuleDestination(
      region: (json['Region'] as String?) ?? '',
      account: json['Account'] as String?,
      destinationLogsConfiguration: json['DestinationLogsConfiguration'] != null
          ? DestinationLogsConfiguration.fromJson(
              json['DestinationLogsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final account = this.account;
    final destinationLogsConfiguration = this.destinationLogsConfiguration;
    return {
      'Region': region,
      if (account != null) 'Account': account,
      if (destinationLogsConfiguration != null)
        'DestinationLogsConfiguration': destinationLogsConfiguration,
    };
  }
}

/// Configuration for centralization destination log groups, including
/// encryption and backup settings.
///
/// @nodoc
class DestinationLogsConfiguration {
  /// Configuration defining the backup region and an optional KMS key for the
  /// backup destination.
  final LogsBackupConfiguration? backupConfiguration;

  /// Configuration that specifies a naming pattern for destination log groups
  /// created during centralization. The pattern supports static text and dynamic
  /// variables that are replaced with source attributes when log groups are
  /// created.
  final LogGroupNameConfiguration? logGroupNameConfiguration;

  /// The encryption configuration for centralization destination log groups.
  final LogsEncryptionConfiguration? logsEncryptionConfiguration;

  DestinationLogsConfiguration({
    this.backupConfiguration,
    this.logGroupNameConfiguration,
    this.logsEncryptionConfiguration,
  });

  factory DestinationLogsConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationLogsConfiguration(
      backupConfiguration: json['BackupConfiguration'] != null
          ? LogsBackupConfiguration.fromJson(
              json['BackupConfiguration'] as Map<String, dynamic>)
          : null,
      logGroupNameConfiguration: json['LogGroupNameConfiguration'] != null
          ? LogGroupNameConfiguration.fromJson(
              json['LogGroupNameConfiguration'] as Map<String, dynamic>)
          : null,
      logsEncryptionConfiguration: json['LogsEncryptionConfiguration'] != null
          ? LogsEncryptionConfiguration.fromJson(
              json['LogsEncryptionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupConfiguration = this.backupConfiguration;
    final logGroupNameConfiguration = this.logGroupNameConfiguration;
    final logsEncryptionConfiguration = this.logsEncryptionConfiguration;
    return {
      if (backupConfiguration != null)
        'BackupConfiguration': backupConfiguration,
      if (logGroupNameConfiguration != null)
        'LogGroupNameConfiguration': logGroupNameConfiguration,
      if (logsEncryptionConfiguration != null)
        'LogsEncryptionConfiguration': logsEncryptionConfiguration,
    };
  }
}

/// Configuration for encrypting centralized log groups. This configuration is
/// only applied to destination log groups for which the corresponding source
/// log groups are encrypted using Customer Managed KMS Keys.
///
/// @nodoc
class LogsEncryptionConfiguration {
  /// Configuration that determines the encryption strategy of the destination log
  /// groups. CUSTOMER_MANAGED uses the configured KmsKeyArn to encrypt newly
  /// created destination log groups.
  final EncryptionStrategy encryptionStrategy;

  /// Conflict resolution strategy for centralization if the encryption strategy
  /// is set to CUSTOMER_MANAGED and the destination log group is encrypted with
  /// an AWS_OWNED KMS Key. ALLOW lets centralization go through while SKIP
  /// prevents centralization into the destination log group.
  final EncryptionConflictResolutionStrategy?
      encryptionConflictResolutionStrategy;

  /// KMS Key ARN belonging to the primary destination account and region, to
  /// encrypt newly created central log groups in the primary destination.
  final String? kmsKeyArn;

  LogsEncryptionConfiguration({
    required this.encryptionStrategy,
    this.encryptionConflictResolutionStrategy,
    this.kmsKeyArn,
  });

  factory LogsEncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return LogsEncryptionConfiguration(
      encryptionStrategy: EncryptionStrategy.fromString(
          (json['EncryptionStrategy'] as String?) ?? ''),
      encryptionConflictResolutionStrategy:
          (json['EncryptionConflictResolutionStrategy'] as String?)
              ?.let(EncryptionConflictResolutionStrategy.fromString),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionStrategy = this.encryptionStrategy;
    final encryptionConflictResolutionStrategy =
        this.encryptionConflictResolutionStrategy;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'EncryptionStrategy': encryptionStrategy.value,
      if (encryptionConflictResolutionStrategy != null)
        'EncryptionConflictResolutionStrategy':
            encryptionConflictResolutionStrategy.value,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// Configuration for backing up centralized log data to a secondary region.
///
/// @nodoc
class LogsBackupConfiguration {
  /// Logs specific backup destination region within the primary destination
  /// account to which log data should be centralized.
  final String region;

  /// KMS Key ARN belonging to the primary destination account and backup region,
  /// to encrypt newly created central log groups in the backup destination.
  final String? kmsKeyArn;

  LogsBackupConfiguration({
    required this.region,
    this.kmsKeyArn,
  });

  factory LogsBackupConfiguration.fromJson(Map<String, dynamic> json) {
    return LogsBackupConfiguration(
      region: (json['Region'] as String?) ?? '',
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'Region': region,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// Configuration that specifies a naming pattern for destination log groups
/// created during centralization. The pattern supports static text and dynamic
/// variables that are replaced with source attributes when log groups are
/// created.
///
/// @nodoc
class LogGroupNameConfiguration {
  /// The pattern used to generate destination log group names during
  /// centralization. The pattern can contain static text and dynamic variables
  /// that are replaced with source attributes. If a variable cannot be resolved,
  /// it inherits the value from its parent variable in the hierarchy. The pattern
  /// must be between 1 and 512 characters.
  ///
  /// Supported variables:
  ///
  /// <ul>
  /// <li>
  /// <b>${source.logGroup}</b> — The original log group name from the source
  /// account.
  /// </li>
  /// <li>
  /// <b>${source.accountId}</b> — The Amazon Web Services account ID where the
  /// log originated.
  /// </li>
  /// <li>
  /// <b>${source.region}</b> — The Amazon Web Services Region where the log
  /// originated.
  /// </li>
  /// <li>
  /// <b>${source.org.id}</b> — The Amazon Web Services Organization ID of the
  /// source account.
  /// </li>
  /// <li>
  /// <b>${source.org.ouId}</b> — The organizational unit ID of the source
  /// account.
  /// </li>
  /// <li>
  /// <b>${source.org.rootId}</b> — The organization Root ID.
  /// </li>
  /// <li>
  /// <b>${source.org.path}</b> — The organizational path from account to root.
  /// </li>
  /// </ul>
  final String logGroupNamePattern;

  LogGroupNameConfiguration({
    required this.logGroupNamePattern,
  });

  factory LogGroupNameConfiguration.fromJson(Map<String, dynamic> json) {
    return LogGroupNameConfiguration(
      logGroupNamePattern: (json['LogGroupNamePattern'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupNamePattern = this.logGroupNamePattern;
    return {
      'LogGroupNamePattern': logGroupNamePattern,
    };
  }
}

/// @nodoc
class EncryptionStrategy {
  static const customerManaged = EncryptionStrategy._('CUSTOMER_MANAGED');
  static const awsOwned = EncryptionStrategy._('AWS_OWNED');

  final String value;

  const EncryptionStrategy._(this.value);

  static const values = [customerManaged, awsOwned];

  static EncryptionStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionStrategy._(value));

  @override
  bool operator ==(other) =>
      other is EncryptionStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EncryptionConflictResolutionStrategy {
  static const allow = EncryptionConflictResolutionStrategy._('ALLOW');
  static const skip = EncryptionConflictResolutionStrategy._('SKIP');

  final String value;

  const EncryptionConflictResolutionStrategy._(this.value);

  static const values = [allow, skip];

  static EncryptionConflictResolutionStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionConflictResolutionStrategy._(value));

  @override
  bool operator ==(other) =>
      other is EncryptionConflictResolutionStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for selecting and handling source log groups for
/// centralization.
///
/// @nodoc
class SourceLogsConfiguration {
  /// A strategy determining whether to centralize source log groups that are
  /// encrypted with customer managed KMS keys (CMK). ALLOW will consider CMK
  /// encrypted source log groups for centralization while SKIP will skip CMK
  /// encrypted source log groups from centralization.
  final EncryptedLogGroupStrategy encryptedLogGroupStrategy;

  /// The selection criteria that specifies which data sources to centralize. The
  /// selection criteria uses the same filter expression format as
  /// <code>LogGroupSelectionCriteria</code>, but operates on
  /// <code>DataSourceName</code> and <code>DataSourceType</code> operands. When
  /// both <code>LogGroupSelectionCriteria</code> and
  /// <code>DataSourceSelectionCriteria</code> are specified, a log event must
  /// match both criteria to be centralized.
  final String? dataSourceSelectionCriteria;

  /// The selection criteria that specifies which source log groups to centralize.
  /// The selection criteria uses the same format as OAM link filters.
  final String? logGroupSelectionCriteria;

  SourceLogsConfiguration({
    required this.encryptedLogGroupStrategy,
    this.dataSourceSelectionCriteria,
    this.logGroupSelectionCriteria,
  });

  factory SourceLogsConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceLogsConfiguration(
      encryptedLogGroupStrategy: EncryptedLogGroupStrategy.fromString(
          (json['EncryptedLogGroupStrategy'] as String?) ?? ''),
      dataSourceSelectionCriteria:
          json['DataSourceSelectionCriteria'] as String?,
      logGroupSelectionCriteria: json['LogGroupSelectionCriteria'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptedLogGroupStrategy = this.encryptedLogGroupStrategy;
    final dataSourceSelectionCriteria = this.dataSourceSelectionCriteria;
    final logGroupSelectionCriteria = this.logGroupSelectionCriteria;
    return {
      'EncryptedLogGroupStrategy': encryptedLogGroupStrategy.value,
      if (dataSourceSelectionCriteria != null)
        'DataSourceSelectionCriteria': dataSourceSelectionCriteria,
      if (logGroupSelectionCriteria != null)
        'LogGroupSelectionCriteria': logGroupSelectionCriteria,
    };
  }
}

/// @nodoc
class EncryptedLogGroupStrategy {
  static const allow = EncryptedLogGroupStrategy._('ALLOW');
  static const skip = EncryptedLogGroupStrategy._('SKIP');

  final String value;

  const EncryptedLogGroupStrategy._(this.value);

  static const values = [allow, skip];

  static EncryptedLogGroupStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptedLogGroupStrategy._(value));

  @override
  bool operator ==(other) =>
      other is EncryptedLogGroupStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the output from pipeline test operations, including processed
/// records and any errors encountered.
///
/// @nodoc
class PipelineOutput {
  /// Any error that occurred during the pipeline test operation for this record.
  final PipelineOutputError? error;

  /// The processed record output from the pipeline test operation.
  final Record? record;

  PipelineOutput({
    this.error,
    this.record,
  });

  factory PipelineOutput.fromJson(Map<String, dynamic> json) {
    return PipelineOutput(
      error: json['Error'] != null
          ? PipelineOutputError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      record: json['Record'] != null
          ? Record.fromJson(json['Record'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final record = this.record;
    return {
      if (error != null) 'Error': error,
      if (record != null) 'Record': record,
    };
  }
}

/// Represents a test record structure used for pipeline testing operations to
/// validate data processing.
///
/// @nodoc
class Record {
  /// The data content of the test record used for pipeline validation.
  final String? data;

  /// The type of the test record, indicating the format or category of the data.
  final RecordFormat? type;

  Record({
    this.data,
    this.type,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      data: json['Data'] as String?,
      type: (json['Type'] as String?)?.let(RecordFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final type = this.type;
    return {
      if (data != null) 'Data': data,
      if (type != null) 'Type': type.value,
    };
  }
}

/// Contains detailed error information from pipeline test operations, providing
/// structured error responses for better debugging and troubleshooting
/// capabilities.
///
/// @nodoc
class PipelineOutputError {
  /// The detailed error message describing what went wrong during the pipeline
  /// test operation for this record.
  final String? message;

  PipelineOutputError({
    this.message,
  });

  factory PipelineOutputError.fromJson(Map<String, dynamic> json) {
    return PipelineOutputError(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class RecordFormat {
  static const string = RecordFormat._('STRING');
  static const json = RecordFormat._('JSON');

  final String value;

  const RecordFormat._(this.value);

  static const values = [string, json];

  static RecordFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RecordFormat._(value));

  @override
  bool operator ==(other) => other is RecordFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TelemetryEnrichmentStatus {
  static const running = TelemetryEnrichmentStatus._('Running');
  static const stopped = TelemetryEnrichmentStatus._('Stopped');
  static const impaired = TelemetryEnrichmentStatus._('Impaired');

  final String value;

  const TelemetryEnrichmentStatus._(this.value);

  static const values = [running, stopped, impaired];

  static TelemetryEnrichmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TelemetryEnrichmentStatus._(value));

  @override
  bool operator ==(other) =>
      other is TelemetryEnrichmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a telemetry rule's key properties.
///
/// @nodoc
class TelemetryRuleSummary {
  /// The timestamp when the telemetry rule was created.
  final int? createdTimeStamp;

  /// The timestamp when the telemetry rule was last modified.
  final int? lastUpdateTimeStamp;

  /// The type of Amazon Web Services resource the rule applies to.
  final ResourceType? resourceType;

  /// The Amazon Resource Name (ARN) of the telemetry rule.
  final String? ruleArn;

  /// The name of the telemetry rule.
  final String? ruleName;

  /// The types of telemetry sources configured for this rule, such as VPC Flow
  /// Logs or EKS audit logs. TelemetrySourceTypes must be correlated with the
  /// specific resource type.
  final List<TelemetrySourceType>? telemetrySourceTypes;

  /// The type of telemetry (Logs, Metrics, or Traces) the rule configures.
  final TelemetryType? telemetryType;

  TelemetryRuleSummary({
    this.createdTimeStamp,
    this.lastUpdateTimeStamp,
    this.resourceType,
    this.ruleArn,
    this.ruleName,
    this.telemetrySourceTypes,
    this.telemetryType,
  });

  factory TelemetryRuleSummary.fromJson(Map<String, dynamic> json) {
    return TelemetryRuleSummary(
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      ruleArn: json['RuleArn'] as String?,
      ruleName: json['RuleName'] as String?,
      telemetrySourceTypes: (json['TelemetrySourceTypes'] as List?)
          ?.nonNulls
          .map((e) => TelemetrySourceType.fromString((e as String)))
          .toList(),
      telemetryType:
          (json['TelemetryType'] as String?)?.let(TelemetryType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final resourceType = this.resourceType;
    final ruleArn = this.ruleArn;
    final ruleName = this.ruleName;
    final telemetrySourceTypes = this.telemetrySourceTypes;
    final telemetryType = this.telemetryType;
    return {
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (ruleName != null) 'RuleName': ruleName,
      if (telemetrySourceTypes != null)
        'TelemetrySourceTypes':
            telemetrySourceTypes.map((e) => e.value).toList(),
      if (telemetryType != null) 'TelemetryType': telemetryType.value,
    };
  }
}

/// Contains summary information about an S3 Table integration for listing
/// operations.
///
/// @nodoc
class IntegrationSummary {
  /// The Amazon Resource Name (ARN) of the S3 Table integration.
  final String? arn;

  /// The current status of the S3 Table integration.
  final IntegrationStatus? status;

  IntegrationSummary({
    this.arn,
    this.status,
  });

  factory IntegrationSummary.fromJson(Map<String, dynamic> json) {
    return IntegrationSummary(
      arn: json['Arn'] as String?,
      status: (json['Status'] as String?)?.let(IntegrationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class IntegrationStatus {
  static const active = IntegrationStatus._('ACTIVE');
  static const deleting = IntegrationStatus._('DELETING');

  final String value;

  const IntegrationStatus._(this.value);

  static const values = [active, deleting];

  static IntegrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationStatus._(value));

  @override
  bool operator ==(other) => other is IntegrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A model representing the state of a resource within an account according to
/// telemetry config.
///
/// @nodoc
class TelemetryConfiguration {
  /// The account ID which contains the resource managed in telemetry
  /// configuration. An example of a valid account ID is
  /// <code>012345678901</code>.
  final String? accountIdentifier;

  /// The timestamp of the last change to the telemetry configuration for the
  /// resource. For example, <code>1728679196318</code>.
  final int? lastUpdateTimeStamp;

  /// The identifier of the resource, for example for Amazon VPC, it would be
  /// <code>vpc-1a2b3c4d5e6f1a2b3</code>.
  final String? resourceIdentifier;

  /// Tags associated with the resource, for example <code>{ Name:
  /// "ExampleInstance", Environment: "Development" }</code>.
  final Map<String, String>? resourceTags;

  /// The type of resource, for example <code>Amazon Web
  /// Services::EC2::Instance</code>, or <code>Amazon Web
  /// Services::EKS::Cluster</code>, etc.
  final ResourceType? resourceType;

  /// The configuration state for the resource, for example <code>{ Logs:
  /// NotApplicable; Metrics: Enabled; Traces: NotApplicable; }</code>.
  final Map<TelemetryType, TelemetryState>? telemetryConfigurationState;
  final TelemetrySourceType? telemetrySourceType;

  TelemetryConfiguration({
    this.accountIdentifier,
    this.lastUpdateTimeStamp,
    this.resourceIdentifier,
    this.resourceTags,
    this.resourceType,
    this.telemetryConfigurationState,
    this.telemetrySourceType,
  });

  factory TelemetryConfiguration.fromJson(Map<String, dynamic> json) {
    return TelemetryConfiguration(
      accountIdentifier: json['AccountIdentifier'] as String?,
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      resourceIdentifier: json['ResourceIdentifier'] as String?,
      resourceTags: (json['ResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      telemetryConfigurationState:
          (json['TelemetryConfigurationState'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(TelemetryType.fromString(k),
                  TelemetryState.fromString((e as String)))),
      telemetrySourceType: (json['TelemetrySourceType'] as String?)
          ?.let(TelemetrySourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIdentifier = this.accountIdentifier;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final telemetryConfigurationState = this.telemetryConfigurationState;
    final telemetrySourceType = this.telemetrySourceType;
    return {
      if (accountIdentifier != null) 'AccountIdentifier': accountIdentifier,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (telemetryConfigurationState != null)
        'TelemetryConfigurationState': telemetryConfigurationState
            .map((k, e) => MapEntry(k.value, e.value)),
      if (telemetrySourceType != null)
        'TelemetrySourceType': telemetrySourceType.value,
    };
  }
}

/// @nodoc
class TelemetryState {
  static const enabled = TelemetryState._('Enabled');
  static const disabled = TelemetryState._('Disabled');
  static const notApplicable = TelemetryState._('NotApplicable');

  final String value;

  const TelemetryState._(this.value);

  static const values = [enabled, disabled, notApplicable];

  static TelemetryState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TelemetryState._(value));

  @override
  bool operator ==(other) => other is TelemetryState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a centralization rule's key properties and status.
///
/// @nodoc
class CentralizationRuleSummary {
  /// The Amazon Web Services region where the organization centralization rule
  /// was created.
  final String? createdRegion;

  /// The timestamp when the organization centralization rule was created.
  final int? createdTimeStamp;

  /// The Amazon Web Services Account that created the organization centralization
  /// rule.
  final String? creatorAccountId;

  /// The primary destination account of the organization centralization rule.
  final String? destinationAccountId;

  /// The primary destination region of the organization centralization rule.
  final String? destinationRegion;

  /// The reason why an organization centralization rule is marked UNHEALTHY.
  final CentralizationFailureReason? failureReason;

  /// The timestamp when the organization centralization rule was last updated.
  final int? lastUpdateTimeStamp;

  /// The Amazon Resource Name (ARN) of the organization centralization rule.
  final String? ruleArn;

  /// The health status of the organization centralization rule.
  final RuleHealth? ruleHealth;

  /// The name of the organization centralization rule.
  final String? ruleName;

  CentralizationRuleSummary({
    this.createdRegion,
    this.createdTimeStamp,
    this.creatorAccountId,
    this.destinationAccountId,
    this.destinationRegion,
    this.failureReason,
    this.lastUpdateTimeStamp,
    this.ruleArn,
    this.ruleHealth,
    this.ruleName,
  });

  factory CentralizationRuleSummary.fromJson(Map<String, dynamic> json) {
    return CentralizationRuleSummary(
      createdRegion: json['CreatedRegion'] as String?,
      createdTimeStamp: json['CreatedTimeStamp'] as int?,
      creatorAccountId: json['CreatorAccountId'] as String?,
      destinationAccountId: json['DestinationAccountId'] as String?,
      destinationRegion: json['DestinationRegion'] as String?,
      failureReason: (json['FailureReason'] as String?)
          ?.let(CentralizationFailureReason.fromString),
      lastUpdateTimeStamp: json['LastUpdateTimeStamp'] as int?,
      ruleArn: json['RuleArn'] as String?,
      ruleHealth: (json['RuleHealth'] as String?)?.let(RuleHealth.fromString),
      ruleName: json['RuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdRegion = this.createdRegion;
    final createdTimeStamp = this.createdTimeStamp;
    final creatorAccountId = this.creatorAccountId;
    final destinationAccountId = this.destinationAccountId;
    final destinationRegion = this.destinationRegion;
    final failureReason = this.failureReason;
    final lastUpdateTimeStamp = this.lastUpdateTimeStamp;
    final ruleArn = this.ruleArn;
    final ruleHealth = this.ruleHealth;
    final ruleName = this.ruleName;
    return {
      if (createdRegion != null) 'CreatedRegion': createdRegion,
      if (createdTimeStamp != null) 'CreatedTimeStamp': createdTimeStamp,
      if (creatorAccountId != null) 'CreatorAccountId': creatorAccountId,
      if (destinationAccountId != null)
        'DestinationAccountId': destinationAccountId,
      if (destinationRegion != null) 'DestinationRegion': destinationRegion,
      if (failureReason != null) 'FailureReason': failureReason.value,
      if (lastUpdateTimeStamp != null)
        'LastUpdateTimeStamp': lastUpdateTimeStamp,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (ruleHealth != null) 'RuleHealth': ruleHealth.value,
      if (ruleName != null) 'RuleName': ruleName,
    };
  }
}

/// @nodoc
class RuleHealth {
  static const healthy = RuleHealth._('Healthy');
  static const unhealthy = RuleHealth._('Unhealthy');
  static const provisioning = RuleHealth._('Provisioning');

  final String value;

  const RuleHealth._(this.value);

  static const values = [healthy, unhealthy, provisioning];

  static RuleHealth fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleHealth._(value));

  @override
  bool operator ==(other) => other is RuleHealth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CentralizationFailureReason {
  static const trustedAccessNotEnabled =
      CentralizationFailureReason._('TRUSTED_ACCESS_NOT_ENABLED');
  static const destinationAccountNotInOrganization =
      CentralizationFailureReason._('DESTINATION_ACCOUNT_NOT_IN_ORGANIZATION');
  static const internalServerError =
      CentralizationFailureReason._('INTERNAL_SERVER_ERROR');

  final String value;

  const CentralizationFailureReason._(this.value);

  static const values = [
    trustedAccessNotEnabled,
    destinationAccountNotInOrganization,
    internalServerError
  ];

  static CentralizationFailureReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CentralizationFailureReason._(value));

  @override
  bool operator ==(other) =>
      other is CentralizationFailureReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the status of a multi-region operation in a specific Amazon Web
/// Services Region. This structure is used to report per-region progress for
/// both telemetry evaluation and telemetry rule replication.
///
/// @nodoc
class RegionStatus {
  /// The reason for a failure status in this region. This field is only populated
  /// when <code>Status</code> indicates a failure.
  final String? failureReason;

  /// The Amazon Web Services Region code (for example, <code>eu-west-1</code> or
  /// <code>us-west-2</code>) that this status applies to.
  final String? region;

  /// The Amazon Resource Name (ARN) of the telemetry rule in this spoke region.
  /// This field is only present for telemetry rule region statuses and is
  /// populated when the rule has been successfully created in the spoke region
  /// (status is <code>ACTIVE</code>).
  final String? ruleArn;

  /// The status of the operation in this region. For telemetry evaluation, valid
  /// values include <code>STARTING</code>, <code>RUNNING</code>, and
  /// <code>FAILED_START</code>. For telemetry rules, valid values include
  /// <code>PENDING</code>, <code>ACTIVE</code>, and <code>FAILED</code>.
  final String? status;

  RegionStatus({
    this.failureReason,
    this.region,
    this.ruleArn,
    this.status,
  });

  factory RegionStatus.fromJson(Map<String, dynamic> json) {
    return RegionStatus(
      failureReason: json['FailureReason'] as String?,
      region: json['Region'] as String?,
      ruleArn: json['RuleArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final region = this.region;
    final ruleArn = this.ruleArn;
    final status = this.status;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (region != null) 'Region': region,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status,
    };
  }
}

/// @nodoc
class Status {
  static const notStarted = Status._('NOT_STARTED');
  static const starting = Status._('STARTING');
  static const failedStart = Status._('FAILED_START');
  static const running = Status._('RUNNING');
  static const stopping = Status._('STOPPING');
  static const failedStop = Status._('FAILED_STOP');
  static const stopped = Status._('STOPPED');

  final String value;

  const Status._(this.value);

  static const values = [
    notStarted,
    starting,
    failedStart,
    running,
    stopping,
    failedStop,
    stopped
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the encryption configuration for S3 Table integrations, including
/// the encryption algorithm and KMS key settings.
///
/// @nodoc
class Encryption {
  /// The server-side encryption algorithm used for encrypting data in the S3
  /// Table integration.
  final SSEAlgorithm sseAlgorithm;

  /// The Amazon Resource Name (ARN) of the KMS key used for encryption when using
  /// customer-managed keys.
  final String? kmsKeyArn;

  Encryption({
    required this.sseAlgorithm,
    this.kmsKeyArn,
  });

  factory Encryption.fromJson(Map<String, dynamic> json) {
    return Encryption(
      sseAlgorithm:
          SSEAlgorithm.fromString((json['SseAlgorithm'] as String?) ?? ''),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sseAlgorithm = this.sseAlgorithm;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'SseAlgorithm': sseAlgorithm.value,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// @nodoc
class SSEAlgorithm {
  static const awsKms = SSEAlgorithm._('aws:kms');
  static const aes256 = SSEAlgorithm._('AES256');

  final String value;

  const SSEAlgorithm._(this.value);

  static const values = [awsKms, aes256];

  static SSEAlgorithm fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SSEAlgorithm._(value));

  @override
  bool operator ==(other) => other is SSEAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
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
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

/// @nodoc
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
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
